-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2025 at 11:35 AM
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
(1, 'The slacker', '“Group project? Oh, I thought that was optional.”\nVanishes when it’s time to contribute.\n\nBehaviour:\nRandom idle turns, lazy weak attacks', './images/enemy1.jpg', 24, NULL),
(2, 'The overthinker', 'Analyzes every move… then analyzes the analysis.\nEnds up doing nothing but building walls around every\npossible outcome.\n\nBehaviour:\nAlways defends. Rarely attacks.\nEventually collapses under their own logic', './images/enemy2.jpg', 28, 1),
(3, 'The burnout', 'You coded too hard… for too long. Now you face the\nghost of your own ambition.\n\nBehaviour:\nDrains your MP', './images/enemy3.jpg', 26, 2),
(4, 'The AI whisperer', 'Writes nothing themselves — just sweet-talks ChatGPT \nand pastes the result. Sometimes brilliant.\nOften broken.\n\nBehaviour:\nUses unpredictable AI-powered attacks,\nsomeoverpowered, others backfire', './images/enemy4.jpg', 32, 3);

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
(1, 3, 1, 'lose', 0, '2025-05-31 09:53:28'),
(2, 3, 1, 'lose', 0, '2025-05-31 09:54:31'),
(3, 3, 1, 'lose', 0, '2025-05-31 09:55:14'),
(4, 3, 1, 'lose', 4, '2025-05-31 09:56:05'),
(5, 3, 1, 'win', 1, '2025-05-31 09:56:45'),
(6, 3, 1, 'win', 2, '2025-05-31 09:59:06'),
(7, 3, 1, 'win', 2, '2025-05-31 10:01:57'),
(8, 3, 1, 'win', 2, '2025-05-31 10:03:39'),
(9, 3, 1, 'win', 2, '2025-05-31 10:04:03'),
(10, 3, 1, 'win', 2, '2025-05-31 10:04:24'),
(11, 3, 1, 'win', 2, '2025-05-31 10:05:22'),
(12, 3, 1, 'win', 2, '2025-05-31 10:05:38'),
(13, 3, 1, 'win', 2, '2025-05-31 10:07:03'),
(14, 3, 1, 'win', 2, '2025-05-31 10:07:27'),
(15, 3, 1, 'win', 2, '2025-05-31 10:08:29'),
(16, 3, 1, 'win', 2, '2025-05-31 10:09:14'),
(17, 3, 1, 'win', 2, '2025-05-31 10:12:02'),
(18, 3, 1, 'win', 2, '2025-05-31 10:15:03'),
(19, 3, 1, 'win', 2, '2025-05-31 10:15:25'),
(20, 3, 1, 'win', 2, '2025-05-31 10:15:42'),
(21, 3, 1, 'win', 2, '2025-05-31 10:17:54'),
(22, 3, 1, 'win', 2, '2025-05-31 10:21:01'),
(23, 3, 1, 'win', 2, '2025-05-31 10:21:43'),
(24, 3, 1, 'win', 2, '2025-05-31 14:20:33'),
(25, 3, 1, 'win', 2, '2025-05-31 14:22:13'),
(26, 3, 1, 'win', 2, '2025-05-31 14:22:55'),
(27, 3, 2, 'win', 4, '2025-05-31 14:23:10'),
(28, 3, 3, 'win', 4, '2025-05-31 14:23:21'),
(29, 3, 4, 'lose', 4, '2025-05-31 14:23:33'),
(30, 3, 4, 'lose', 4, '2025-05-31 14:24:04'),
(31, 3, 4, 'lose', 4, '2025-05-31 14:24:47'),
(32, 3, 4, 'win', 2, '2025-05-31 14:25:09'),
(33, 3, 3, 'win', 1, '2025-05-31 14:25:33'),
(34, 1, 1, 'win', 1, '2025-05-31 16:03:42'),
(35, 1, 1, 'win', 4, '2025-05-31 16:07:08'),
(36, 1, 1, 'win', 4, '2025-05-31 17:06:59'),
(37, 3, 1, 'win', 4, '2025-05-31 17:59:11'),
(38, 3, 1, 'win', 4, '2025-05-31 17:59:38'),
(39, 3, 1, 'win', 4, '2025-05-31 18:02:05'),
(40, 3, 1, 'win', 4, '2025-05-31 18:05:17'),
(41, 3, 1, 'win', 4, '2025-05-31 18:10:15'),
(42, 3, 1, 'win', 4, '2025-05-31 18:31:40'),
(43, 3, 3, 'win', 7, '2025-05-31 18:45:02'),
(44, 3, 4, 'win', 17, '2025-05-31 18:45:50'),
(45, 3, 1, 'win', 4, '2025-05-31 18:46:07'),
(46, 3, 1, 'win', 4, '2025-05-31 19:44:19'),
(47, 1, 2, 'win', 7, '2025-05-31 19:45:41'),
(48, 3, 2, 'win', 7, '2025-06-01 15:04:58'),
(49, 3, 3, 'win', 7, '2025-06-02 04:12:37'),
(50, 4, 1, 'win', 4, '2025-06-03 06:14:18'),
(51, 3, 1, 'win', 4, '2025-06-03 06:23:45'),
(52, 3, 1, 'win', 4, '2025-06-03 06:35:10'),
(53, 3, 1, 'win', 4, '2025-06-03 06:35:50'),
(54, 3, 1, 'win', 1, '2025-06-03 06:40:54'),
(55, 3, 1, 'win', 1, '2025-06-03 06:41:56'),
(56, 3, 1, 'win', 1, '2025-06-03 09:05:08'),
(57, 3, 1, 'win', 2, '2025-06-03 09:06:56'),
(58, 3, 1, 'win', 4, '2025-06-03 09:26:03'),
(59, 3, 1, 'win', 4, '2025-06-03 09:26:58'),
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
(103, 1, 1, 'win', 1, '2025-06-08 14:06:50'),
(104, 1, 1, 'win', 1, '2025-06-08 14:07:06'),
(105, 1, 1, 'win', 1, '2025-06-08 14:07:57'),
(106, 1, 1, 'win', 1, '2025-06-08 14:08:09'),
(107, 1, 1, 'win', 1, '2025-06-08 14:08:57'),
(108, 1, 1, 'win', 1, '2025-06-08 14:09:07'),
(109, 1, 1, 'win', 1, '2025-06-08 14:09:09'),
(110, 1, 1, 'win', 1, '2025-06-08 14:09:30'),
(111, 1, 1, 'win', 1, '2025-06-08 14:09:52'),
(112, 1, 1, 'win', 1, '2025-06-08 14:10:15'),
(113, 1, 1, 'win', 1, '2025-06-08 14:12:24'),
(114, 1, 1, 'win', 1, '2025-06-08 14:15:48'),
(115, 1, 1, 'win', 1, '2025-06-08 14:50:17'),
(116, 1, 1, 'win', 1, '2025-06-08 14:50:43'),
(117, 1, 1, 'win', 1, '2025-06-08 14:51:29'),
(118, 1, 1, 'win', 1, '2025-06-08 14:52:50'),
(119, 1, 1, 'win', 1, '2025-06-08 14:53:59'),
(120, 1, 1, 'win', 1, '2025-06-08 14:54:02'),
(121, 1, 3, 'lose', 13, '2025-06-08 14:55:00'),
(122, 1, 3, 'lose', 13, '2025-06-08 14:55:16'),
(123, 1, 3, 'lose', 13, '2025-06-08 14:57:11'),
(124, 1, 3, 'lose', 13, '2025-06-08 14:57:15'),
(125, 1, 3, 'win', 1, '2025-06-08 14:57:24'),
(126, 1, 3, 'win', 1, '2025-06-08 15:23:28'),
(127, 1, 3, 'win', 1, '2025-06-08 15:23:33'),
(128, 1, 3, 'win', 1, '2025-06-08 15:23:48'),
(129, 1, 1, 'win', 1, '2025-06-08 15:27:13'),
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
(146, 1, 1, 'win', 1, '2025-06-09 08:43:11'),
(147, 1, 1, 'win', 1, '2025-06-09 08:43:53'),
(148, 1, 1, 'win', 1, '2025-06-09 08:44:21'),
(149, 1, 3, 'lose', 7, '2025-06-09 08:44:57'),
(150, 1, 1, 'win', 1, '2025-06-09 08:48:44'),
(151, 1, 1, 'win', 1, '2025-06-09 08:49:01'),
(152, 1, 3, 'win', 1, '2025-06-09 08:49:15'),
(153, 1, 2, 'win', 1, '2025-06-09 08:49:48'),
(154, 1, 2, 'win', 1, '2025-06-09 08:50:11'),
(155, 1, 1, 'win', 2, '2025-06-09 09:10:49');

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
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `email`, `avatar`) VALUES
(1, 'Noah', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', '2025-05-25', '', 'characterpics/profilpics18.png'),
(3, 'Aya', '$2y$10$PuVv4/o3f6OPu9Us/Tx4e.3RysBITcrhbsXtvRi6nRE7JgfKUR4Yy', '2025-05-30', 'aya@email.com', 'characterpics/profilpics2.png'),
(4, 'upi', '$2y$10$iJwaZzZhYnxL6nLk4DSXg.ga3qOm/D9NdfOhkCbAZalDLONWzXcqS', '2025-06-03', 'Sayyidullupi@gmail.com', NULL),
(7, 'nrm', '$2y$10$ulJNN80J.xs/1kkjPBYHz.4VQqEYj8HrFHSHP5g2MSSIffio8m0ge', '2025-06-08', 'nurmareko@gmail.com', 'characterpics/profilpics2.png');

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
(7, 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
