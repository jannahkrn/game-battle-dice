<?php
  require_once 'connection.php';

  $username_value = '';
  $username_error = '';
  $email_value = '';
  $email_error = '';
  $password_value = '';
  $password_error = '';
  $registration_message = 'Already have an account?';

  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (preg_match('/^[a-zA-Z0-9]+$/', $_POST['username']) == 0) {
      $username_value = $_POST['username'];
      $email_value = $_POST['email'];
      $password_value = $_POST['password'];
      $username_error = 'Please use alphanumeric character!';
    } else if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
      $username_value = $_POST['username'];
      $email_value = $_POST['email'];
      $password_value = $_POST['password'];
      $email_error = 'Email is not valid!';
    } else if (strlen($_POST['password']) > 20 || strlen($_POST['password']) < 5) {
      $username_value = $_POST['username'];
      $email_value = $_POST['email'];
      $password_value = $_POST['password'];
      $password_error = 'Password must be between 5<br/>and 20 characters long!';
    } else {
      // Check is username taken
      $username = mysqli_real_escape_string($con, $_POST['username']);
      $sql = "
        select *
        from users
        where username = '$username'
      ";
      $result = mysqli_query($con, $sql);
      if (mysqli_num_rows($result) == 1) {
        $username_value = $_POST['username'];
        $email_value = $_POST['email'];
        $password_value = $_POST['password'];
        $username_error = 'Sorry username is taken!';
      } else {
        $email = mysqli_real_escape_string($con, $_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $avatar = $_POST['avatar'];

        $sql = "
          insert into users (username, password, email, avatar)
          values ('$username', '$password', '$email', '$avatar');
        ";
        if (mysqli_query($con, $sql)) {
          $user_id = mysqli_insert_id($con);
          $sql = "
            insert into user_unlocked_enemy(user_id, enemy_id)
            values ($user_id, 1)
          ";
          if (mysqli_query($con, $sql)) {
            $registration_message = "Registration successful.";
          } else {
            echo "Error: " . mysqli_error($con);
          }
        } else {
          echo "Error: " . mysqli_error($con);
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
    <title>Battle Dice</title>
    <link rel="stylesheet" href="styles/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script src="scripts/togglePassword.js"></script>
  </head>
  <body>
      <video class="video-background" autoplay muted>
      <source src="images/bg7.mp4" type="video/mp4">
      </video>

    <div class="container">
      <h1>REGISTER</h1>
      <form method="POST">

        <h4>CHARACTER:</h4>
        <span>
          <label>
            <input type="radio" name="avatar" value="./characterpics/profilpics7.png" checked></input>
            <img src="./characterpics/profilpics7.png" alt="character picture" width="70">
          </label>
          <label>
            <input type="radio" name="avatar" value="./characterpics/profilpics2.png"></input>
            <img src="./characterpics/profilpics2.png" alt="character picture" width="70">
          </label>
          <label>
            <input type="radio" name="avatar" value="./characterpics/prfilpics15.png"></input>
            <img src="./characterpics/prfilpics15.png" alt="character picture" width="70">
          </label>
          <label>
            <input type="radio" name="avatar" value="./characterpics/profilpics6.png"></input>
            <img src="./characterpics/profilpics6.png" alt="character picture" width="70">
          </label>
        </span>

        <label for="username">USERNAME:</label>
        <input type="text" name="username" id="username" value="<?= $username_value ?>" required></input>
        <p class="error-message"><?= $username_error ?></p>

        <label for="email">EMAIL:</label>
        <input type="email" name="email" id="email" value="<?= $email_value ?>" required></input>
        <p class="error-message"><?= $email_error ?></p>

        <label for="password">PASSWORD:</label>
        <div>
          <input type="password" name="password" id="password" value="<?= $password_value ?>" required></input>
          <button type="button" onclick="togglePassword()">👁️</button>
        </div>
        <p class="error-message"><?= $password_error ?></p>

        <button type="submit" class="register">Register</button>
        <p><?= $registration_message ?><br><a href="login.php">Login</a></p>

      </form>
    </div>
  </body>
</html>
