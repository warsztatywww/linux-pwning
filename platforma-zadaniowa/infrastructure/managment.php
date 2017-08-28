<?php
require_once("config.php");
if($_SESSION['admin'] !== true)
{
  die();
}
?>

<?php require_once("header.php"); ?>

<div id='managment_body'>
  <form method='post' action="/new_hacker.php">
    <input name="nickname" type="text" value='' />
    <button> Add a new hacker </button>
  </form>

  <form method='post' action="/delete_hacker.php">
    <select name="nickname">
      <option value=""> Select Hacker </option>
      <?php
        $st = $db->prepare("SELECT nickname FROM hackers");
        $st->execute();
        while($res = $st->fetch())
        {
          $nickname = htmlentities($res->nickname);
          echo "<option value=\"$nickname\">$nickname</option>";
        }
      ?>
    </select>
    <button> Delete a hacker </button>
  </form>

</div>

<?php require_once("footer.php"); ?>
