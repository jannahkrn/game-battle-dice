<?php
  session_start();
  require_once 'connection.php';

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }

  $enemy_id = $_SESSION['enemy_id'];
  $sql = "select * from enemies where id = $enemy_id";
  $enemy = mysqli_fetch_assoc(mysqli_query($con, $sql));
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Battle Dice</title>
    <link rel="stylesheet" href="styles/battle.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script>
      let state = <?= json_encode([
        'turn' => true,
        'end' => false,
        'victory' => false,
        'turns' => 0,
        'message' => '',
        'player' => [
          'id' => $_SESSION['user_id'],
          'name' => $_SESSION['username'],
          'img' => $_SESSION['character'],
          'maxHp' => 30,
          'hp' => 30,
          'maxMp' => 10,
          'mp' => 2,
          'guard' => false,
          'heavyCost' => 5,
          'healCost' => 4
        ],
        'enemy' => [
          'id' => $enemy['id'],
          'name' => $enemy['name'],
          'img' => $enemy['image_path'],
          'maxHp' => $enemy['max_hp'],
          'hp' => $enemy['max_hp'],
          'guard' => false
        ]
      ])?>;
    </script>
    <script type="module" src="scripts/battle.js" defer></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg6.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/select-sound-121244.mp3"></audio>
    <audio id="light-sound" src="./soundeffect/light.mp3"></audio>
    <audio id="guard-sound" src="./soundeffect/guard.mp3"></audio>
    <audio id="dice-sound" src="./soundeffect/dice.mp3"></audio>
    <audio id="heavy-sound" src="./soundeffect/heavy.mp3"></audio>
    <audio id="health-sound" src="./soundeffect/health.mp3"></audio>
    <audio id="skip-sound" src="./soundeffect/skip.mp3"></audio>
    <audio id="drain-sound" src="./soundeffect/drain.mp3"></audio>
    <audio id="attack-self-sound" src="./soundeffect/attackself.mp3"></audio>
    <audio id="attack-mp-sound" src="./soundeffect/attackmp.mp3"></audio>
    <audio id="start-sound" src="./soundeffect/gamestart.mp3"></audio>
    <div class="menu">
      <a id="home" href=#>HOME</a>
      <a id="guide" href=#>GUIDE</a>
      <a id="record" href=#>RECORD</a>
      <a id="profile" href=#>PROFILE</a>
    </div>

    <div class="battle-container">
      <div class="battle-top">

        <div class="player">

          <div class="status">
            <p id="player-name"></p>
            <div class="player-health-bar">
              <p id="player-hp"></p>
              <div class="health-fill" id="player-hp-fill"></div>
            </div>
            <div class="mp-bar">
              <p id="player-mp"></p>
              <div class="mp-fill" id="player-mp-fill"></div>
            </div>
          </div>

          <div class="player-character">
            <img id="player-img" alt="player character">
          </div>

          <div class="control" id="control">
            <button id="attack">Attack</button>
            <button id="guard">Guard</button>
            <button id="dice">Roll dice</button>
            <button id="skill">Skill</button>
          </div>
        </div>

        <div class="enemy">
          <div class="enemy-status">
            <p id="enemy-name"></p>
            <div class="enemy-health-bar">
              <p id="enemy-hp"></p>
              <div class="health-fill" id="enemy-hp-fill"></div>
            </div>
          </div>
          <div class="enemy-avatar">
            <img id="enemy-img" alt="enemy image">
          </div>
        </div>
      </div>

      <div id="battle-log" class="battle-log">
    </div>

    <form id="battle-form" action="end.php" method="POST">
      <input type="hidden" name="user-id" value="<?= $_SESSION['user_id'] ?>">
      <input type="hidden" name="enemy-name" value="<?= $enemy['name'] ?>">
      <input type="hidden" name="enemy-id" value="<?= $enemy['id'] ?>">
      <input type="hidden" name="result" id="result">
      <input type="hidden" name="turns" id="turns">
    </form>

  </body>
</html>
