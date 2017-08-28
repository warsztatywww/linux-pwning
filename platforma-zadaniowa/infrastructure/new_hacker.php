<?php
require_once("config.php");
#if($_SESSION['admin'] !== true)
#{
#  die();
#}

function generateToken()
{
  return hash("sha512", openssl_random_pseudo_bytes(32));
}
function generatePassword()
{
  return hash("md5", openssl_random_pseudo_bytes(32));
}

if(isset($nickname))
{
  $nickname = htmlentities($nickname);
  //$nickname = htmlentities((string)$_POST["nickname"]);
  if(preg_match("/^[0-9a-z]*$/", $nickname) === 1)
  {
    $st = $db->prepare("SELECT nickname FROM hackers WHERE nickname=:u");
    $st->execute(array(":u"=>$nickname));
    if($st->fetch())
    {
      echo "Hacker already registered";
      die();
    }

    #generate first level for the user
    $password = generatePassword();
    $token = generateToken();
    $user = $nickname.'0';
    echo system("sudo /srv/http/suid_scripts/create_first_level.sh $user $password $levels_paths[0] 2>&1");
    //for the first level token is not used
    $db->prepare("INSERT INTO hackers VALUES(:u, 0)")->execute(array(':u'=>$nickname));
    $db->prepare("INSERT INTO tokens VALUES(:n, :u, :t, :p)")->execute(array(':n'=>$nickname, ':u'=>$user, ':t'=>$token, ':p'=>$password));

    //create the remaining levels
    for($i=1; $i<$number_of_levels; $i++)
    {
      $user = $nickname.(string)$i;
      $password = generatePassword();
      $level_path = $levels_paths[$i];
      $token = generateToken();
      $prev_user = $nickname.(string)($i-1);
      $prev_level_path = $levels_paths[$i-1];

      echo system("sudo /srv/http/suid_scripts/create_level_with_predecesor.sh $user $password $level_path $token $prev_user $prev_level_path 2>&1");

      $db->prepare("INSERT INTO tokens VALUES(:n, :u, :t, :p)")->execute(array(':n'=>$nickname, ':u'=>$user, ':t'=>$token, ':p'=>$password));
    }

    if($_SESSION['admin'])
    {
      header("Location: /managment.php");
      die();
    }
    else
    {
      header("Location: /");
      die();
    }
  }
  else
  {
    echo "Only lowercase and numbers are allowed";
  }

}

?>
