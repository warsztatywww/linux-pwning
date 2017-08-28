<?php
require_once("config.php");
if($_SESSION['admin'] !== true)
{
  die();
}

if(isset($_POST["nickname"]))
{
  $nickname = htmlentities((string)$_POST["nickname"]);
  if(preg_match("/^[0-9a-z]*$/", $nickname) === 1)
  {
    $st = $db->prepare("SELECT nickname FROM hackers WHERE nickname=:u");
    $st->execute(array(":u"=>$nickname));
    if($st->fetch())
    {
      //remove user accounts from machine
      $st = $db->prepare("SELECT user FROM tokens WHERE nickname=:u");
      $st->execute(array(":u"=>$nickname));
      while($res = $st->fetch())
      {
        shell_exec("sudo /srv/http/suid_scripts/delete_user.sh \"$res->user\"");
      }

      //remove user from database
      $db->prepare("DELETE FROM hackers WHERE nickname=:u")->execute(array(":u"=>$nickname));
      $db->prepare("DELETE FROM tokens WHERE nickname=:u")->execute(array(":u"=>$nickname));
      $db->prepare("DELETE FROM users WHERE username=:u")->execute(array(":u"=>$nickname));

      header("Location: /managment.php");
      die();
    }

    echo "Hacker not registered";
    die();
  }
  else
  {
    echo "Wrong chars in nickname";
  }

}

?>
