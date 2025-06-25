<?php
session_start();
include 'connection.php';

if (isset($_POST['delete_profile'])) {
    if (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];

        mysqli_query($con, "DELETE FROM user_unlocked_enemy WHERE user_id = $user_id");

        $delete_user = mysqli_query($con, "DELETE FROM users WHERE id = $user_id");

        if ($delete_user) {
            session_destroy();
            header("Location: index.php");
            exit();
        } else {
            echo "Gagal menghapus profil: " . mysqli_error($con);
        }
    } else {
        echo "User belum login.";
    }
} else {
    header("Location: profile.php");
    exit();
}
?>
