<?php
session_start();
include 'connection.php';

if (!isset($_SESSION['loggedin'])) {
  header('Location: index.php');
  exit;
}

$files = scandir('characterpics');
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Battle Dice - Profile</title>
  <link rel="stylesheet" href="styles/profile.css">
  <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
  <script src="scripts/profile.js" defer></script>
</head>
<body>

  <?php if (isset($_GET['success']) && $_GET['success'] == 1): ?>
    <script>
      alert("Profile updated successfully!");
    </script>
  <?php endif; ?>

  <video class="video-background" autoplay muted loop>
    <source src="images/bgr4.mp4" type="video/mp4">
  </video>

  <div class="menu">
    <a id="home" href="#">HOME</a>
    <a id="guide" href="#">GUIDE</a>
    <a id="record" href="#">RECORD</a>
    <a id="profile" href="#">PROFILE</a>
  </div>

  <div class="container">
    <h1>PROFILE</h1>
    <div class="profile">
      <img src="<?= $_SESSION['character'] ?>" alt="Avatar" class="avatar">
      <h2 class="name"><?= $_SESSION['username'] ?></h2>
      <p class="last-login">Last login: <?= $_SESSION['last_login'] ?></p>
      <p class="bio">A strategic dice battler ready to conquer!</p>
    </div>

    <div class="button">
      <button type="button" class="edit" id="editBtn">EDIT</button>
      <form method="POST" action="delete.php" onsubmit="return confirm('Are you sure you want to delete your profile?');">
        <button type="submit" name="delete_profile" class="delete delete-modal-btn" id="delete">DELETE</button>
      </form>
    </div>

    <br>
    <div class="tl">
      <a id="thanks">Thanks</a>
      <a id="logout">Logout</a>
    </div>
  </div>

  <div id="editModal" class="modal">
    <div class="modal-content">
      <span class="close" id="closeEdit">&times;</span>
      <form id="updateForm" method="POST" action="update_profile.php">

        <label for="username">username:</label>
        <input type="text" name="username" value="<?= $_SESSION['username'] ?>" required><br><br>

        <label for="old_password">Current Password</label>
        <input type="password" id="old-password" name="old-password" placeholder="current password">
        <button type="button" onclick="togglePassword('old-password')">👁️</button>

        <label for="new_password">New Password</label>
        <input type="password" id="new-password" name="new-password" placeholder="new password">
        <button type="button" onclick="togglePassword('new-password')">👁️</button>

        <?php if (isset($_GET['message'])): ?>
          <p class="error-message"><?= htmlspecialchars($_GET['message']) ?></p>
          <script>
            window.addEventListener("DOMContentLoaded", () => {
              document.getElementById("editModal").style.display = "block";
            });
          </script>
        <?php endif; ?>

        <label for="character">Choose Avatar:</label>
        <button type="button" id="openAvatarPopup">Choose yours</button><br>
        <input type="hidden" name="character" id="selectedAvatar" value="<?= $_SESSION['character'] ?>">
        <img id="avatarPreview" src="<?= $_SESSION['character'] ?>" alt="Preview"><br><br>

        <button type="submit" id="saveBtn">Save</button>
      </form>
    </div>
  </div>

  <div id="avatarPopup" class="modal">
    <div class="modal-content">
      <span class="close-avatar" id="closeAvatar">&times;</span>
      <h3>Select Your Avatar</h3>
      <div class="avatar-grid">
        <?php foreach ($files as $file): ?>
          <?php if ($file !== '.' && $file !== '..'): ?>
            <img src="characterpics/<?= $file ?>" class="avatar-option" data-file="<?= $file ?>">
          <?php endif; ?>
        <?php endforeach; ?>
      </div>
    </div>
  </div>

  <audio id="hoverSound" src="soundeffect/selectcharacterpics.mp3" preload="auto"></audio>
  <audio id="clickSound" src="soundeffect/select-sound-121244.mp3" preload="auto"></audio>

</body>
</html>
