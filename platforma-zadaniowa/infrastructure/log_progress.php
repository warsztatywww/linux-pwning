<?php
require_once('config.php');

if(isset($_GET['user']) && isset($_GET['token']))
{
  $st = $db->prepare("SELECT nickname FROM tokens WHERE user=:u AND token=:t LIMIT 1");
  $st->execute(array(':u'=>$_GET['user'], ':t'=>$_GET['token']));
  $res = $st->fetch();
  if($res)
  {
    $pwned = $res->nickname;
    $st = $db->prepare("SELECT progress FROM hackers WHERE nickname=:u LIMIT 1");
    $st->execute(array(':u'=>$pwned));
    $res = $st->fetch();
    if($res && $_GET['user'] === $pwned.((string)($res->progress+1)))
    {
      $db->prepare("UPDATE hackers SET progress=:v WHERE nickname=:u LIMIT 1")->execute(array(
        ':v'=>($res->progress+1),
        ':u'=>$pwned));
    }
  }
}

?>
