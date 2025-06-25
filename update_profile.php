<?php
  session_start();
  include 'connection.php';

  if (!$con) {
    die("Database connection failed: " . mysqli_connect_error());
  }

  if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
  }

  $user_id = $_SESSION['user_id'];
  $username = $_POST['username'];
  $character = $_POST['character'];
  $old_password = $_POST['old-password'] ?? '';
  $new_password = $_POST['new-password'] ?? '';

  $updates = [];

  if (!empty($username)) {
    if (!preg_match('/^[a-zA-Z0-9]+$/', $username)) {
      header("Location: profile.php?message=Username must be alphanumeric.");
      exit;
    }

    $check_usrname_query = "
      select id from users
      where username = '$username' and id != $user_id
    ";

    $check_username_result = mysqli_query($con, $check_usrname_query);

    if (mysqli_num_rows($check_username_result) > 0) {
      header("Location: profile.php?message=Username is already taken.");
      exit;
    }

    $updates[] = "username = '$username'";
  }

  if (!empty($character)) {
    $updates[] = "avatar = '$character'";
  }

  if (!empty($new_password)) {
    if (empty($old_password)) {
      header("Location: profile.php?message=Please enter your current password to change it.");
      exit;
    }

    if (strlen($new_password) < 5 || strlen($new_password) > 20) {
      header("Location: profile.php?message=" . urlencode("New password must be 5–20 characters long."));
      exit;
    }

    $query = "SELECT password FROM users WHERE id = $user_id LIMIT 1";
    $result = mysqli_query($con, $query);
    $user = mysqli_fetch_assoc($result);
    $stored_hash = $user['password'];

    if (!password_verify($old_password, $stored_hash)) {
      header("Location: profile.php?message=Current password is incorrect.");
      exit;
    }

    $new_hash = password_hash($new_password, PASSWORD_DEFAULT);
    $updates[] = "password = '$new_hash'";
  } else if (!empty($old_password)) {
    header("Location: profile.php?message=Please enter a new password.");
    exit;
  }

  $update_query = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = $user_id";

  if (mysqli_query($con, $update_query)) {
    $_SESSION['username'] = $username;
    $_SESSION['character'] = $character;
    header("Location: profile.php?success=1");
    exit;
  } else {
    echo "Error updating profile: " . mysqli_error($con);
  }
