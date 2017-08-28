<?php
require_once("config.php")
?>

<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title> PWN-Dashboard </title>

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <style>

    body {
    padding-top: 60px;
  }
  @media (max-width: 979px) {
    body {
      padding-top: 0px;
    }
  }

  .dashboard {
  padding: 40px 15px;
  text-align: center;
  }
  </style>

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div id='container'>
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"> PWNING Workshops </a>
    </div>

    <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li> <a> Welcome <?php echo $_SESSION['username'].' your ip is: '.$client_ip; ?> </a> </li>
            <li class="active"><a href="/">Dashboard</a></li>

            <?php if ($_SESSION['admin']): ?>
              <li> <a href="/managment.php">Manage Users</a> </li>
            <?php endif ?>
            <?php if ($_SESSION['logged']): ?>
              <li> <a onclick="logout_form.submit()"> Logout </a> </li>

              <form name="logout_form" method='post' action='login.php'>
                <input hidden name='logout' value='yes'>
              </form>
            <?php else: ?>
              <li> <a href="/login.php">Login</a> </li>
              <li> <a href="/register.php">Register</a> </li>
            <?php endif ?>
          </ul>
    </div><!--/.nav-collapse -->

  </div>
</nav>

<div class="container">
  <div class='dashboard'>
