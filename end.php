<?php
  session_start();
  require_once 'connection.php';

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }

  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['user-id'];
    $enemy_id = $_POST['enemy-id'];
    $battle_result = $_POST['result'];
    $turns = $_POST['turns'];

    // Insert match result
    $sql = "
      insert into matches(user_id, enemy_id, result, turns)
      values ($user_id, $enemy_id, '$battle_result', $turns)
    ";
    if (!mysqli_query($con, $sql)) {
      echo "Error: " . mysqli_error($con);
    }

    if ($battle_result === 'win') {
      $next_enemy_id = $enemy_id + 1;
      $exists_sql = "
        select 1
        from enemies
        where id = $next_enemy_id
      ";
      $exists_result = mysqli_query($con, $exists_sql);

      if (mysqli_num_rows($exists_result) > 0) {
        // Check if already unlocked
        $check_sql = "
          select 1 from user_unlocked_enemy
          where user_id = $user_id and enemy_id = $next_enemy_id
        ";
        $check_result = mysqli_query($con, $check_sql);

        if ($check_result && mysqli_num_rows($check_result) == 0) {
          // Unlock the next enemy
          $unlock_sql = "
            insert into user_unlocked_enemy (user_id, enemy_id)
            values ($user_id, $next_enemy_id)
          ";
          if (!mysqli_query($con, $unlock_sql)) {
            echo "Error: " . mysqli_error($con);
          }
        }
      }
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>End</title>
    <link rel="stylesheet" href="styles/end.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script>
      const result = "<?= $_POST['result'] ?>";
    </script>
    <script src="./scripts/end.js" defer></script>
  </head>
  <body>
     <video class="video-background" autoplay muted>
      <source src="images/bg6.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/menu-click-89198.mp3"></audio>
    <audio id="victory-sound" src="./soundeffect/victory.mp3"></audio>
    <audio id="defeat-sound" src="./soundeffect/defeat.mp3"></audio>
    <?php if($_POST['result'] == 'win'): ?>
      <h1>Victory!</h1>
    <?php else: ?>
      <h1>Defeat!</h1>
    <?php endif; ?>
    <h2 id="end-message"></h2>
    <a id="continue" href=#>CONTINUE</a>
  </body>
</html>
