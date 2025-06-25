<?php
  session_start();
  require_once 'connection.php';

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }

  $the_slacker_leaderboard_query = "
    SELECT u.username, m.turns, date(m.created_at) as date
    FROM matches m
    JOIN users u ON m.user_id = u.id
    WHERE m.enemy_id = 1 AND m.result = 'win'
    ORDER BY m.turns, m.created_at
    LIMIT 3;
  ";

  $the_overthinker_leaderboard_query = "
    SELECT u.username, m.turns, date(m.created_at) as date
    FROM matches m
    JOIN users u ON m.user_id = u.id
    WHERE m.enemy_id = 2 AND m.result = 'win'
    ORDER BY m.turns, m.created_at
    LIMIT 3;
  ";

  $the_burnout_leaderboard_query = "
    SELECT u.username, m.turns, date(m.created_at) as date
    FROM matches m
    JOIN users u ON m.user_id = u.id
    WHERE m.enemy_id = 3 AND m.result = 'win'
    ORDER BY m.turns, m.created_at
    LIMIT 3;
  ";

  $the_ai_leaderboard_query = "
    SELECT u.username, m.turns, date(m.created_at) as date
    FROM matches m
    JOIN users u ON m.user_id = u.id
    WHERE m.enemy_id = 4 AND m.result = 'win'
    ORDER BY m.turns, m.created_at
    LIMIT 3;
  ";

  $result_slk = mysqli_query($con, $the_slacker_leaderboard_query);
  $result_ovt = mysqli_query($con, $the_overthinker_leaderboard_query);
  $result_brn = mysqli_query($con, $the_burnout_leaderboard_query);
  $result_aiw = mysqli_query($con, $the_ai_leaderboard_query);
  $leaderboard_results = [
    "The slacker" => $result_slk,
    "The overthinker" => $result_ovt,
    "The burnout" => $result_brn,
    "The AI whisperer" => $result_aiw
  ];
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="styles/home.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script>
      const username = "<?= $_SESSION['username'] ?>";
    </script>
    <script src="scripts/home.js" defer></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg5.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/select-sound-121244.mp3"></audio>

    <div class="menu">
      <a id="home" href=#>HOME</a>
      <a id="guide" href=#>GUIDE</a>
      <a id="record" href=#>RECORD</a>
      <a id="profile" href=#>PROFILE</a>
    </div>
    <div class="content">
      <div>
        <img src="<?= $_SESSION['character'] ?>" alt="Avatar" class="avatar">
      </div>
      <br>
      <h2 id="welcome-message"></h2>
      <button id="play">PLAY NOW</button>

      <h2>🏆 Speedkill Leaderboard</h2>
      <div class="leaderboard">
        <?php foreach ($leaderboard_results as $enemy => $result): ?>
          <div class="leaderboard-box">
            <p><?= $enemy ?></p>
            <table>
              <tr>
                <th>Player</th>
                <th>Turns</th>
                <th>Date</th>
              </tr>
              <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                  <td><?= $row['username'] ?></td>
                  <td><?= $row['turns'] ?></td>
                  <td><?= $row['date'] ?></td>
                </tr>
              <?php endwhile; ?>
            </table>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </body>
</html>
