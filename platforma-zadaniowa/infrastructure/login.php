<?php
require_once('config.php');
require_once("header.php");

if(isset($_POST['logout']) && $_POST['logout']==='yes')
{
  $_SESSION['admin'] = false;
  session_destroy();
  header("Location: /index.php");
  die();
}
if(isset($_POST['username']) && isset($_POST['password']))
{
  $username = (string)$_POST['username'];
  $password = (string)$_POST['password'];
  if(preg_match("/^[0-9a-zA-Z]*$/",$_POST['username']) === 1)
  {
    if(strlen($username) < 64)
    {
      $st = $db->prepare('SELECT `password`, `isAdmin` FROM users WHERE
      username=:u LIMIT 1');
      $ft = $st->execute(array(':u' => $username));
      $res = $st->fetch();

      if($res && password_verify($password, $res->password))
      {

        $_SESSION['admin'] = ($res->isAdmin == 1);
        $_SESSION['username'] = $username;
        $_SESSION['logged'] = true;

        if($_SESSION['admin'])
        {
          header("Location: /managment.php");
          die();
        }
        
        header("Location: /");
        die();
      }
    }
  }
  error_message("Login failed");
}
?>

<style>

.centered-form{
	margin-top: 60px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="username"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<?php if(!$_SESSION['logged']): ?>
<div class="centered-form row">
  <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
    <div class="panel panel-default">
      <form class="form-signin" role="form" method='POST' action='login.php'>

        <h2 class="form-signin-heading">Please sign in</h2>

        <div class="form-group">
          <label for="inputLogin" class="sr-only">Username</label>
          <input type="text" class="form-control" id="inputLogin" name="username" placeholder="Username" required autofocus/>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password" required/>
        </div>
        <button type="submit" class="btn btn-lg btn-primary btn-block"> Sign in </button>
      </form>
    </div>
  </div>
</div>

<?php else: ?>
  <h1> User already logged in </h1>
<?php endif ?>

<?php require_once("footer.php"); ?>
