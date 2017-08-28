<?php

  function error_message($text)
  {
    echo '<button disabled
     class="btn btn-lg btn-danger .disabled"> '.htmlentities($text).' </button> ';
  }

  session_start();
  if(!isset($_SESSION['admin']))
  {
    $_SESSION['admin'] = false;
    $_SESSION['logged'] = false;
    $_SESSION['username'] = 'guest';
  }

  function validate_level($path)
  {
    $files = ['/home/README', '/forbidden_files', '/password_file', '/suid_files'];
    $folders = ['/home/'];

    $res = true;
    foreach($folders as $dir)
    {
      $res = $res && is_dir($path.$dir);
    }
    foreach($files as $file)
    {
      $res = $res && is_file($path.$file);
    }

    return $res;
  }

  $levels_dir = "/pwn-workshops/levels";
  $number_of_levels = 0;
  $levels_paths = array();
  foreach(scandir($levels_dir) as $path)
  {
    if(preg_match("/^level[0-9]*$/", $path) === 1)
    {
      $level_number = (int)substr($path, strlen('level'));
      $path = preg_replace('#/+#','/',join('/',array($levels_dir, $path)));
      if(is_dir($path) === true)
      {
        if(validate_level($path))
        {
          $levels_paths[$level_number] = $path;
          $number_of_levels++;
        }
        else
        {
          if ($_SESSION['admin'])
          {
            echo "Level ".htmlentities($path)." is corrupted.";
          }
        }
      }
    }
  }

  $client_ip = getenv('HTTP_CLIENT_IP')?:
  getenv('HTTP_X_FORWARDED_FOR')?:
  getenv('HTTP_X_FORWARDED')?:
  getenv('HTTP_FORWARDED_FOR')?:
  getenv('HTTP_FORWARDED')?:
  getenv('REMOTE_ADDR');

  $db = new PDO('mysql:host=localhost;dbname=warsztaty', 'warsztaty', 'www13');
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

  $db->prepare("CREATE TABLE users (username VARCHAR(255), email VARCHAR(255), password VARCHAR(255), isAdmin NUMERIC)")->execute();
  #$db->prepare("INSERT INTO users VALUES ('admin', 'test@test.org','".password_hash("admin", PASSWORD_DEFAULT)."', '1')")->execute();

  $db->prepare("CREATE TABLE hackers(nickname VARCHAR(255), progress NUMERIC)")->execute();
  $db->prepare("CREATE TABLE tokens(nickname VARCHAR(255), user VARCHAR(255), token VARCHAR(255), password VARCHAR(32))")->execute();

?>
