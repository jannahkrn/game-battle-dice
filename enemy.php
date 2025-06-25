<?php
  session_start();
  require_once 'connection.php';

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }

  // query enemies
  $user_id = $_SESSION['user_id'];
  $sql = "
  select
    e.id,
    e.name,
    e.description,
    e.image_path,
    e.max_hp,
    (ue.enemy_id is not null) as unlocked
  from enemies e
  left join user_unlocked_enemy ue
  on ue.enemy_id = e.id and ue.user_id = $user_id
  ";
  $result = mysqli_query($con, $sql);

  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $_SESSION['enemy_id'] = $_POST['enemy'];
    header('Location: battle.php');
    exit;
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Battle Dice</title>
    <link rel="stylesheet" href="styles/enemy.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script src="./scripts/enemy.js" defer></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg6.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/select-sound-121244.mp3"></audio>
    <audio id="battle-sound" src="./soundeffect/menu-click-89198.mp3"></audio>
    <div class="menu">
      <a id="home" href=#>HOME</a>
      <a id="guide" href=#>GUIDE</a>
      <a id="record" href=#>RECORD</a>
      <a id="profile" href=#>PROFILE</a>
    </div>
    <div class="container">
      <form id="enemy-form" method="POST">
        <p>Choose Enemy</p>
        <div class="enemy-list">
        <?php while ($enemy = mysqli_fetch_assoc($result)): ?>
          <?php
            $is_unlocked = (bool) $enemy['unlocked'];
            $disabled_attribute = $is_unlocked ? '' : 'disabled';
            $class = $is_unlocked ? 'unlocked' : 'locked';
          ?>

          <label class="<?= $class ?>">
            <input
              class="enemy"
              type="radio"
              name="enemy"
              value="<?= $enemy['id'] ?>"
              data-id="<?= $enemy['id'] ?>"
              data-name="<?= htmlspecialchars($enemy['name']) ?>"
              data-desc="<?= htmlspecialchars($enemy['description']) ?>"
              data-unlocked="<?= $is_unlocked ?>"
            >
            <div class="enemy-box">
            <img src="<?= $enemy['image_path'] ?>" alt="<?= $enemy['name'] ?>" width="100">
            </div>
          </label>
        <?php endwhile; ?>
        </div>

        <h2 id="enemy-name">Select an enemy</h2>
        <pre id="enemy-desc"></pre>
        <button type="button" id="battle-btn" class="start-button" disabled>Battle</button>
      </form>
    </div>
  </body>
</html>
