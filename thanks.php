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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/thanks.css" />
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet" />
    <title>Thanks for Playing!</title>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg2.mp4" type="video/mp4" />
    </video>

    <div class="container">
      <h1 class="main-title">Thanks for Playing!</h1>
      <div class="content-grid">

        <div class="section">
          <h2 class="section-title">Meet the Team</h2>
          <div class="team-member">
            <a href="https://felleisen.org/matthias/" target="_blank">Drestayumna Nurmareko</a>
          </div>
          <div class="team-member">
            <a href="https://www.instagram.com/jannahkrn_?igsh=MWdqcDJvMmxhb29hZA==" target="_blank">Jannah Kurniawati</a>
          </div>
          <div class="team-member">
            <a href="https://www.instagram.com/rzaxia/" target="_blank">Riza Fahmi Muharram</a>
          </div>
          <a href="profile.php">Return</a>
        </div>

        <div class="section">
          <h2 class="section-title">Special Thanks</h2>
          <ul class="thanks-list">
            <li class="thanks-item">Thanks to Mr. Indra — for making us question our skills, our logic, and occasionally, our life choices.</li>
            <li class="thanks-item">To our friends – we know you didn't read the whole project, but thanks for nodding anyway. You're the best.</li>
            <li class="thanks-item">Caffeine – For making sleepless nights productive.</li>
            <li class="thanks-item">Our Laptops – You've overheated with pride.</li>
            <li class="thanks-item">And to the bugs – For testing our patience and teaching us resilience.</li>
            <li class="thanks-item">And ourselves – For not rage quitting (yet).</li>
          </ul>
        </div>

      </div>
    </div>
  </body>
</html>
