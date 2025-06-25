<?php
  session_start();

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Battle Dice</title>
    <link rel="stylesheet" href="styles/guide.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script src="scripts/guide.js" defer></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg2.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/select-sound-121244.mp3"></audio>
    <div class="menu">
      <a id="home" href=#>HOME</a>
      <a id="guide" href=#>GUIDE</a>
      <a id="record" href=#>RECORD</a>
      <a id="profile" href=#>PROFILE</a>
    </div>
    <div class="container">
      <h1>HOW TO PLAY THE GAME</h1>
      <br>
      <h2>ATTACK</h2>
      <p>Deal Low Amount of Damage</p>

      <h2>GUARD</h2>
      <p>Reduce Incoming Damage</p>

      <h2>ROLL DICE</h2>
      <p>Regen MP</p>

      <h2>SKILL: HEAVY ATTACK</h2>
      <p>Deal High Amount of Damage. Consume MP</p>

      <h2>SKILL: HEAL</h2>
      <p>Restore HP. Consume MP</p>
    </div>
  </body>
</html>
