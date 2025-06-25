<?php
  session_start();

  require_once 'connection.php';
  $username_value = '';
  $password_value = '';
  $username_error = '';
  $password_error = '';

  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($con, $_POST['username']);
    $sql = "
      select *
      from users
      where username = '$username'
    ";
    $result = mysqli_query($con, $sql);

    $is_user_exist = mysqli_num_rows($result) == 1;
    if ($is_user_exist) {
      $row = mysqli_fetch_assoc($result);
      if (password_verify($_POST['password'], $row['password'])) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['character'] = $row['avatar'];
        date_default_timezone_set('Asia/Jakarta');
        $now = date('Y-m-d H:i:s');
        mysqli_query($con, "UPDATE users SET last_login = '$now' WHERE id = {$row['id']}");
        $_SESSION['last_login'] = $now;


        header('Location: home.php');
        exit;
      } else {
        $username_value = $username;
        $password_value = $_POST['password'];
        $password_error = 'Wrong password!';
      }
    } else {
      $username_value = $username;
      $password_value = $_POST['password'];
      $username_error = 'Username not found!';
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <script src="scripts/login.js"></script>
    <script src="scripts/togglePassword.js"></script>
  </head>
  <body>
    <video class="video-background" autoplay muted>
      <source src="images/bg7.mp4" type="video/mp4">
    </video>

    <div class="container">
      <h1>LOGIN</h1>

      <form method="POST">

        <label for="username">USERNAME:</label>
        <input type="text" id="username" name="username" value="<?= $username_value ?>" required>
        <p class="error-message"><?= $username_error ?></p>

       <label for="password">PASSWORD:</label>
      <div>
        <input type="password" id="password" name="password" value="<?= $password_value ?>" required>
        <button type="button" onclick="togglePassword()">👁️</button>
      </div>
      <p class="error-message"><?= $password_error ?></p>

        <br>
        <a class="register" href="register.php">Register</a>
        <br>
        <button type="submit">Login</button>

      </form>
    </div>
  </body>
</html>
