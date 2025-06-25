<?php
  session_start();
  require_once 'connection.php';

  // Prevent accessing this page without logging in
  if (!isset($_SESSION['loggedin'])) {
    header('Location: index.php');
    exit;
  }

  $user_id = $_SESSION['user_id'];
  $sql_stat = "
    select
      count(*) as total_matches,
      sum(result = 'win') as total_wins,
      sum(result = 'lose') as total_losses,
      round(sum(result = 'win') / count(*) * 100, 0) as win_rate,
      round(avg(turns), 0) as average_turns
    from matches
    where user_id = $user_id
  ";

  $sql_match = "
    select
      date(m.created_at) AS match_date,
      e.name AS enemy,
      m.result,
      m.turns
    from matches m
    join enemies e on m.enemy_id = e.id
    where m.user_id = $user_id
    order BY m.created_at desc
    limit 4;
  ";

  $user = mysqli_fetch_assoc(mysqli_query($con, $sql_stat));
  $result_match = mysqli_query($con, $sql_match);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Record</title>
    <link rel="stylesheet" href="styles/record.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script src="scripts/record.js" defer></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg7.mp4" type="video/mp4">
    </video>
    <audio id="click-sound" src="./soundeffect/select-sound-121244.mp3" preload="auto"></audio>
    <div class="menu">
      <a id="home" href=#>HOME</a>
      <a id="guide" href=#>GUIDE</a>
      <a id="record" href=#>RECORD</a>
      <a id="profile" href=#>PROFILE</a>
    </div>
    <div class = "match">
    <h3>Match History</h3>
    <table>
      <tr>
        <th>Date</th>
        <th>Enemy</th>
        <th>Result</th>
        <th>Turn</th>
      </tr>
      <?php if(mysqli_num_rows($result_match) == 0): ?>
        <p>Your record’s empty.<br>Time to roll the dice.</p>
      <?php else: ?>
        <?php while ($match = mysqli_fetch_assoc($result_match)): ?>
          <tr>
            <td><?= $match['match_date'] ?></td>
            <td><?= $match['enemy'] ?></td>
            <td><?= $match['result'] ?></td>
            <td><?= $match['turns'] ?></td>
          </tr>
        <?php endwhile; ?>
      <?php endif;?>
    </table>
    <div class = "container">
      <h3>Statictics</h3>
      <p>Match played: <?= $user['total_matches'] ?></p>
      <p>Wins: <?= $user['total_wins'] ?></p>
      <p>Losses: <?= $user['total_losses'] ?></p>
      <p>Win Rate: <?= $user['win_rate'] ?>%</p>
      <p>Turns/Match: <?= $user['average_turns'] ?></p>
    </div>
  </body>
</html>
