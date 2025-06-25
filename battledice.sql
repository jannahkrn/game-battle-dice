-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2025 at 11:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `battledice`
--

-- --------------------------------------------------------

--
-- Table structure for table `enemies`
--

CREATE TABLE `enemies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `max_hp` int(11) NOT NULL,
  `unlock_after` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enemies`
--

INSERT INTO `enemies` (`id`, `name`, `description`, `image_path`, `max_hp`, `unlock_after`) VALUES
(1, 'The slacker', '“Group project? Oh, I thought that was optional.”\nVanishes when it’s time to contribute.\n\nBehaviour:\nRandom idle turns, lazy weak attacks', 'images/0613.gif', 24, NULL),
(2, 'The overthinker', 'Analyzes every move… then analyzes the analysis.\nEnds up doing nothing but building walls around every\npossible outcome.\n\nBehaviour:\nAlways defends. Rarely attacks.\nEventually collapses under their own logic', 'images/0612.gif', 28, 1),
(3, 'The burnout', 'You coded too hard… for too long. Now you face the\nghost of your own ambition.\n\nBehaviour:\nDrains your MP', 'images/0614.gif', 26, 2),
(4, 'The AI whisperer', 'Writes nothing themselves — just sweet-talks ChatGPT \nand pastes the result. Sometimes brilliant.\nOften broken.\n\nBehaviour:\nUses unpredictable AI-powered attacks,\nsomeoverpowered, others backfire', 'images/0611.gif', 32, 3);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `result` enum('win','lose') NOT NULL,
  `turns` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `user_id`, `enemy_id`, `result`, `turns`, `created_at`) VALUES
(43, 3, 3, 'win', 7, '2025-05-31 18:45:02'),
(44, 3, 4, 'win', 17, '2025-05-31 18:45:50'),
(47, 1, 2, 'win', 7, '2025-05-31 19:45:41'),
(48, 3, 2, 'win', 7, '2025-06-01 15:04:58'),
(49, 3, 3, 'win', 7, '2025-06-02 04:12:37'),
(60, 3, 1, 'win', 6, '2025-06-03 09:54:31'),
(61, 3, 1, 'win', 6, '2025-06-03 09:56:17'),
(62, 3, 1, 'win', 6, '2025-06-03 09:58:20'),
(63, 3, 1, 'lose', 6, '2025-06-03 12:42:55'),
(64, 3, 1, 'win', 6, '2025-06-03 12:43:22'),
(65, 3, 1, 'lose', 6, '2025-06-03 12:44:46'),
(66, 3, 1, 'win', 6, '2025-06-03 12:45:15'),
(67, 3, 1, 'win', 6, '2025-06-03 14:01:40'),
(68, 3, 1, 'lose', 6, '2025-06-03 14:06:22'),
(69, 3, 1, 'lose', 6, '2025-06-03 14:13:25'),
(70, 3, 1, 'win', 8, '2025-06-03 14:20:00'),
(71, 3, 1, 'lose', 6, '2025-06-03 14:22:14'),
(72, 3, 1, 'lose', 11, '2025-06-03 14:23:10'),
(73, 3, 1, 'win', 8, '2025-06-03 14:41:20'),
(74, 3, 1, 'lose', 8, '2025-06-03 14:42:03'),
(75, 3, 1, 'win', 6, '2025-06-03 16:17:01'),
(76, 3, 1, 'lose', 7, '2025-06-03 16:49:35'),
(77, 3, 1, 'lose', 14, '2025-06-03 17:10:20'),
(78, 3, 1, 'win', 9, '2025-06-03 17:27:41'),
(79, 3, 1, 'win', 8, '2025-06-03 17:40:38'),
(80, 3, 1, 'win', 9, '2025-06-03 17:44:46'),
(81, 3, 1, 'win', 7, '2025-06-03 17:47:29'),
(82, 3, 1, 'win', 7, '2025-06-03 17:52:20'),
(95, 7, 1, 'win', 7, '2025-06-08 11:25:58'),
(96, 7, 2, 'win', 7, '2025-06-08 11:26:55'),
(97, 7, 3, 'lose', 5, '2025-06-08 11:27:50'),
(98, 7, 2, 'lose', 9, '2025-06-08 12:41:37'),
(99, 1, 3, 'lose', 12, '2025-06-08 13:36:15'),
(100, 1, 2, 'win', 12, '2025-06-08 13:58:12'),
(101, 1, 1, 'win', 7, '2025-06-08 14:01:20'),
(102, 1, 1, 'win', 7, '2025-06-08 14:01:52'),
(121, 1, 3, 'lose', 13, '2025-06-08 14:55:00'),
(122, 1, 3, 'lose', 13, '2025-06-08 14:55:16'),
(123, 1, 3, 'lose', 13, '2025-06-08 14:57:11'),
(124, 1, 3, 'lose', 13, '2025-06-08 14:57:15'),
(130, 1, 2, 'lose', 11, '2025-06-08 15:40:57'),
(131, 1, 2, 'win', 13, '2025-06-08 15:41:59'),
(132, 1, 3, 'lose', 8, '2025-06-08 15:42:53'),
(133, 1, 3, 'lose', 6, '2025-06-08 15:43:22'),
(134, 1, 3, 'lose', 7, '2025-06-08 15:43:57'),
(135, 1, 3, 'lose', 6, '2025-06-08 15:44:29'),
(136, 1, 3, 'lose', 11, '2025-06-08 15:45:08'),
(137, 1, 3, 'lose', 7, '2025-06-08 15:45:45'),
(138, 1, 3, 'lose', 7, '2025-06-08 15:46:25'),
(139, 1, 3, 'win', 8, '2025-06-08 15:47:00'),
(140, 1, 4, 'win', 7, '2025-06-08 15:48:00'),
(141, 1, 1, 'win', 11, '2025-06-09 08:08:16'),
(142, 1, 1, 'win', 7, '2025-06-09 08:13:29'),
(143, 1, 2, 'lose', 6, '2025-06-09 08:15:43'),
(144, 1, 3, 'lose', 13, '2025-06-09 08:20:32'),
(145, 1, 4, 'win', 5, '2025-06-09 08:30:29'),
(149, 1, 3, 'lose', 7, '2025-06-09 08:44:57'),
(162, 9, 1, 'win', 8, '2025-06-10 02:25:00'),
(163, 9, 2, 'lose', 13, '2025-06-10 02:26:13'),
(164, 9, 2, 'lose', 15, '2025-06-10 02:27:42'),
(167, 11, 1, 'win', 6, '2025-06-13 16:33:46'),
(168, 11, 1, 'win', 6, '2025-06-13 17:58:21'),
(169, 11, 2, 'lose', 7, '2025-06-13 17:58:53'),
(170, 11, 2, 'win', 7, '2025-06-13 17:59:24'),
(171, 11, 3, 'lose', 6, '2025-06-13 17:59:57'),
(172, 11, 3, 'win', 6, '2025-06-13 18:00:23'),
(173, 11, 4, 'win', 8, '2025-06-13 18:00:59'),
(175, 8, 1, 'win', 6, '2025-06-14 09:44:06'),
(176, 8, 1, 'win', 7, '2025-06-14 09:44:53'),
(177, 8, 1, 'win', 6, '2025-06-14 09:45:22'),
(178, 8, 2, 'lose', 8, '2025-06-14 09:46:11'),
(179, 8, 2, 'lose', 8, '2025-06-14 09:46:55'),
(180, 8, 2, 'win', 12, '2025-06-14 09:47:41'),
(181, 8, 3, 'lose', 6, '2025-06-14 09:48:15'),
(182, 8, 3, 'win', 6, '2025-06-14 09:48:56'),
(183, 8, 4, 'win', 5, '2025-06-14 09:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT curdate(),
  `email` varchar(100) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `email`, `avatar`, `last_login`) VALUES
(1, 'Noah', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', '2025-05-25', '', 'characterpics/profilpics2.png', '2025-06-14 11:40:46'),
(3, 'Aya', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', '2025-05-30', 'aya@email.com', 'characterpics/profilpics2.png', '2025-06-14 11:46:04'),
(4, 'upi', '$2y$10$iJwaZzZhYnxL6nLk4DSXg.ga3qOm/D9NdfOhkCbAZalDLONWzXcqS', '2025-06-03', 'Sayyidullupi@gmail.com', NULL, NULL),
(7, 'nrm', '$2y$10$ulJNN80J.xs/1kkjPBYHz.4VQqEYj8HrFHSHP5g2MSSIffio8m0ge', '2025-06-08', 'nurmareko@gmail.com', 'characterpics/profilpics2.png', NULL),
(8, 'eko', '$2y$10$BgfOZtx8hVUuH/pac0t3k.d8aS8v2QY2uM8C5ZLDmpEePX8b49Y6G', '2025-06-09', 'nurmareko@gmail.com', 'characterpics/prfilpics15.png', '2025-06-14 15:01:12'),
(9, 'admin', '$2y$10$j16ifbsGul4.QDKL26pfi.LARcZFPxxuCnWdXsbnZMoNuiVu3IeG6', '2025-06-10', 'admin123@gmail.com', './characterpics/profilpics7.png', NULL),
(11, 'ayaa', '$2y$10$0wfg58hHVYdWpzhYctmzX.Ub9Bj29GbjFPHstUcB6CijDuMD.78Vi', '2025-06-13', 'aya@email.com', 'characterpics/prfilpics15.png', '2025-06-14 00:54:09'),
(12, 'mrX', '$2y$10$gYPPFUKjcpHPuI2.vhi1COG3mYkSWqOa7QDMcI0z9.GIbhKcgzlhy', '2025-06-14', 'xxx@email.com', './characterpics/prfilpics15.png', '2025-06-14 11:42:23'),
(13, '$username', '$2y$10$U.LfmIuq4PiN1TS/P391AeeCK.RJgwhMIjhPVVJBUf92e5RMcV/su', '2025-06-14', 'xxx@email.com', './characterpics/profilpics6.png', '2025-06-14 11:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_unlocked_enemy`
--

CREATE TABLE `user_unlocked_enemy` (
  `user_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_unlocked_enemy`
--

INSERT INTO `user_unlocked_enemy` (`user_id`, `enemy_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 1),
(9, 2),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(13, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enemies`
--
ALTER TABLE `enemies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unlock_after` (`unlock_after`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_unlocked_enemy`
--
ALTER TABLE `user_unlocked_enemy`
  ADD PRIMARY KEY (`user_id`,`enemy_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enemies`
--
ALTER TABLE `enemies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enemies`
--
ALTER TABLE `enemies`
  ADD CONSTRAINT `enemies_ibfk_1` FOREIGN KEY (`unlock_after`) REFERENCES `enemies` (`id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `enemies` (`id`);

--
-- Constraints for table `user_unlocked_enemy`
--
ALTER TABLE `user_unlocked_enemy`
  ADD CONSTRAINT `user_unlocked_enemy_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_unlocked_enemy_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `enemies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
