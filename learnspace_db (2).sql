-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 18, 2026 at 08:50 PM
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
-- Database: `learnspace_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `course_id`, `student_id`, `title`, `description`, `due_date`, `created_at`) VALUES
(1, 1, 1, 'Loje', 'Programo nje loje qe te perdore AI', '2026-01-23', '2026-01-18 17:46:51');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `teacher` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `teacher`, `price`, `duration`) VALUES
(1, 'Programim', 'Ne kete kurs do te trajtohen bazat e programimit', 'Mesues1', 15.00, '2 jave'),
(2, 'Databaze', 'Bazat e databazes', 'Mesues2', 100.00, '1 muaj'),
(3, 'Aplikacion Web', 'Zhvillimi i aplikacioneve web', 'Mesues3', 120.00, '4 muaj');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `enrolled_at`) VALUES
(4, 1, 1, '2026-01-18 16:49:01'),
(5, 1, 3, '2026-01-18 19:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `status` enum('success','failed') NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `user_id`, `email`, `status`, `ip_address`, `attempt_time`) VALUES
(1, 2, 'admin@gmail.com', 'success', '::1', '2026-01-16 17:52:06'),
(2, 1, 'email1@gmail.com', 'success', '::1', '2026-01-17 19:51:01'),
(3, 1, 'email1@gmail.com', 'success', '::1', '2026-01-17 19:53:41'),
(4, 1, 'email1@gmail.com', 'success', '::1', '2026-01-17 19:54:13'),
(5, 1, 'student1@gmail.com', 'success', '::1', '2026-01-18 16:56:08'),
(6, 1, 'student1@gmail.com', '', '::1', '2026-01-18 16:56:24'),
(7, 1, 'student1@gmail.com', 'success', '::1', '2026-01-18 16:56:32'),
(8, 2, 'admin@gmail.com', 'success', '::1', '2026-01-18 18:00:56'),
(9, 1, 'student1@gmail.com', 'success', '::1', '2026-01-18 19:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` enum('pending','paid','failed') DEFAULT 'pending',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `course_id`, `amount`, `status`, `payment_date`) VALUES
(4, 1, 1, 15.00, '', '2026-01-18 16:49:01'),
(5, 1, 3, 120.00, '', '2026-01-18 19:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `remember_logs`
--

CREATE TABLE `remember_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `remember_logs`
--

INSERT INTO `remember_logs` (`id`, `user_id`, `token`, `expires_at`, `created_at`) VALUES
(1, 1, '7d2484d3c64510cecd9ad24594b0c418', '2026-02-17 17:56:08', '2026-01-18 16:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `third_party_logs`
--

CREATE TABLE `third_party_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `third_party_logs`
--

INSERT INTO `third_party_logs` (`id`, `user_id`, `service_name`, `action`, `response`, `created_at`) VALUES
(1, 1, 'PayPal', 'payment_success', 'Sandbox payment completed successfully', '2026-01-18 16:49:01'),
(2, 1, 'PayPal', 'payment_success', 'Sandbox payment completed successfully', '2026-01-18 19:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `photo` varchar(255) DEFAULT 'default.png',
  `status` enum('active','blocked') DEFAULT 'active',
  `email_verified` tinyint(1) DEFAULT 0,
  `verification_code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `photo`, `status`, `email_verified`, `verification_code`, `created_at`) VALUES
(1, 'Student1', 'student1@gmail.com', '$2y$10$QEr/hwKND03VBlKMTqjvTedw9jNc34ZBctcXxylhrDbqJPN52Ey.m', 'user', 'profile_696a76ecf1ea37.13050519.jpg', 'active', 0, '716203b65a8d43f896ad2ab64f1389cb', '2026-01-16 17:35:41'),
(2, 'Admin', 'admin@gmail.com', '$2y$10$QEr/hwKND03VBlKMTqjvTedw9jNc34ZBctcXxylhrDbqJPN52Ey.m', 'admin', 'default.png', 'active', 1, NULL, '2026-01-16 17:51:15'),
(3, 'Student2', 'student2@gmail.com', '$2y$10$GwK0ac0zM4gMFknfWf0i2u3Tr12Bdd4kV5fEDGRemIXp1iErOhicu', 'user', 'profile_696d3237528b85.64101535.jpg', 'active', 1, NULL, '2026-01-18 19:19:19'),
(4, 'Student3', 'student3@gmail.com', '$2y$10$rFUKocQu.OuovcU9axbYHu.f.UOKF2W.OnMBc/tAJDuHt4Ig.35QK', 'user', 'profile_696d32498da149.77593880.jpg', 'active', 1, NULL, '2026-01-18 19:19:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_course_fk` (`course_id`),
  ADD KEY `fk_student` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_fk` (`user_id`),
  ADD KEY `enrollments_course_fk` (`course_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_attempts_user_fk` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_fk` (`user_id`),
  ADD KEY `payments_course_fk` (`course_id`);

--
-- Indexes for table `remember_logs`
--
ALTER TABLE `remember_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remember_logs_user_fk` (`user_id`);

--
-- Indexes for table `third_party_logs`
--
ALTER TABLE `third_party_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `third_party_logs_user_fk` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `remember_logs`
--
ALTER TABLE `remember_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `third_party_logs`
--
ALTER TABLE `third_party_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_course_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_course_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `remember_logs`
--
ALTER TABLE `remember_logs`
  ADD CONSTRAINT `remember_logs_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `third_party_logs`
--
ALTER TABLE `third_party_logs`
  ADD CONSTRAINT `third_party_logs_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
