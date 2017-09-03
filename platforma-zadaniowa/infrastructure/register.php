<?php
require_once('config.php');
require_once("header.php");

if(isset($_POST['username']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['password_retype']))
{
  $username = (string)$_POST['username'];
  $password = (string)$_POST['password'];
  $password_retype = (string)$_POST['password_retype'];
  $email = (string)$_POST['email'];
  if($password !== $password_retype)
  {
    error_message("Password mismatch");
  }
  else if(filter_var($email, FILTER_VALIDATE_EMAIL))
  {
    if(preg_match("/^[0-9a-zA-Z]*$/", $username) === 1)
    {
      if(strlen($username) < 64 && strlen($email) < 64)
      {
        $st = $db->prepare('SELECT `username` FROM users WHERE
        username=:u LIMIT 1');
        $ft = $st->execute(array(':u' => $username));
        $res = $st->fetch();

        if($res)
        {
          error_message("Username already taken");
        }
        else
        {
          $isAdmin = 0;
          if($username === "admin")
          {
            $isAdmin = 1;
          }

          $password = password_hash($password, PASSWORD_DEFAULT);
          $db->prepare("INSERT INTO users VALUES(:u, :e, :p, :a)")->execute(array(':u'=>$username, ':e'=>$email, ':p'=>$password, ':a'=>$isAdmin));

          $nickname = $username;

          if($isAdmin === 0)
          {
            require_once('new_hacker.php');
          }

        }
      }
    }
  }
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

.form-register {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-register .form-register-heading,
.form-register .checkbox {
  margin-bottom: 10px;
}
.form-register .checkbox {
  font-weight: normal;
}
.form-register .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-register .form-control:focus {
  z-index: 2;
}

.form-register input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-register input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<div class="centered-form row">
  <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
    <div class="panel panel-default">
      <form class="form-register" role="form" method='POST' action='register.php'>

        <h2 class="form-register-heading">Please register</h2>

        <div class="form-group">
          <label for="inputLogin" class="sr-only">username</label>
          <input type="text" class="form-control" id="inputLogin" name="username" placeholder="Username" required autofocus/>
        </div>

        <div class="form-group">
          <label for="inputEmail" class="sr-only">Email address</label>
          <input type="email" class="form-control" id="inputEmail" name="email" placeholder="E-mail" required autofocus/>
        </div>

        <div class="form-group">
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password" required/>
        </div>

        <div class="form-group">
          <label for="inputPasswordRetype" class="sr-only">Password</label>
          <input type="password" class="form-control" id="inputPasswordRetype" name="password_retype" placeholder="Please retype password" required/>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block"> Sign in </button>
      </form>
    </div>
  </div>
</div>

<?php require_once("footer.php"); ?>
