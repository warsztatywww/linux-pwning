<?php
require_once("config.php")
?>

<?php require_once("header.php"); ?>

<h1>Dashboard</h1>
<?php
if($_SESSION['logged'])
{
  $st = $db->prepare("SELECT `progress` from hackers where nickname = :u");
  $st->execute(array(':u'=>$_SESSION['username']));
  $res = $st->fetch();
  if($res)
  {
    $progress = $res->progress;
    echo "<p class=\"lead\">Aby uzyskać dostęp do poziomu ".$progress." użyj polecenia: ssh ".htmlentities($_SESSION['username']).$progress."@".$_SERVER['HTTP_HOST']."</p>";
    #echo "<p class=\"lead\">Twoje hasła dostępowe to: </p>";
    $st = $db->prepare("SELECT `password`, `user` FROM tokens WHERE nickname = :u ORDER BY user");
    $st->execute(array(':u'=>$_SESSION['username']));
    echo '<table class="table table-bordered table-striped">';
    echo '<tr> <th>Numer poziomu</th> <th>Hasło</th> </tr>';
    while($res = $st->fetch())
    {
	$level = (int)substr($res->user, strlen($_SESSION['username']));
	$password = $res->password;
	if($level <= $progress)
	{
		echo "<tr> <td>$level</td> <td>$password</td> </tr>";
	
	}
    }
    echo '</table>';
  }
}

?>

<!--<p class="lead">Owocnych warsztatów :)</p>-->
<table class="table table-bordered table-striped">
  <tr> <th>Nickname</th> <th>Progress</th> </tr>
  <?php
      $st = $db->prepare("SELECT `nickname`, `progress` FROM hackers ORDER BY progress DESC");
      $st->execute();
      while($res = $st->fetch())
      {
        $nickname = htmlentities($res->nickname);
        $progress = (int)$res->progress;
        $max_progress = $number_of_levels-1;
        echo "<tr> <td>$nickname</td> <td>$progress/$max_progress</td> </tr>";
      }
   ?>
</table>

<script>
function autoRefresh()
{
	   window.location.reload();
}

setInterval('autoRefresh()', 5000);
</script>

<?php require_once("footer.php"); ?>
