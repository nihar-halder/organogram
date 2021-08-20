-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 23, 2021 at 12:57 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `organogram`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` smallint UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Department A', NULL, '2021-06-21 16:42:05', NULL),
(2, 'Department B', NULL, '2021-06-21 16:42:05', NULL),
(3, 'Department C', NULL, '2021-06-21 16:42:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_employee_role_relation`
--

CREATE TABLE `department_employee_role_relation` (
  `id` mediumint NOT NULL,
  `department_id` smallint UNSIGNED NOT NULL,
  `employee_id` mediumint UNSIGNED NOT NULL,
  `role_id` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=latin1;

--
-- Dumping data for table `department_employee_role_relation`
--

INSERT INTO `department_employee_role_relation` (`id`, `department_id`, `employee_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2021-06-23 08:56:05', NULL),
(2, 1, 2, 2, '2021-06-23 08:56:05', NULL),
(3, 1, 3, 2, '2021-06-23 09:02:17', NULL),
(4, 1, 4, 3, '2021-06-23 09:02:17', NULL),
(5, 1, 5, 3, '2021-06-23 09:02:17', NULL),
(6, 1, 6, 4, '2021-06-23 09:02:17', NULL),
(7, 1, 20, 4, '2021-06-23 09:02:17', NULL),
(8, 1, 19, 4, '2021-06-23 09:02:17', NULL),
(9, 1, 18, 5, '2021-06-23 09:02:17', NULL),
(10, 1, 17, 5, '2021-06-23 09:02:17', NULL),
(11, 1, 16, 5, '2021-06-23 09:02:17', NULL),
(12, 1, 15, 6, '2021-06-23 09:02:17', NULL),
(13, 1, 14, 6, '2021-06-23 09:02:17', NULL),
(14, 1, 13, 6, '2021-06-23 09:02:17', NULL),
(15, 1, 12, 6, '2021-06-23 09:02:17', NULL),
(16, 1, 11, 6, '2021-06-23 09:02:17', NULL),
(17, 1, 10, 6, '2021-06-23 09:02:17', NULL),
(18, 1, 7, 6, '2021-06-23 09:02:17', NULL),
(19, 1, 8, 6, '2021-06-23 09:02:17', NULL),
(20, 1, 9, 6, '2021-06-23 09:02:17', NULL),
(21, 2, 3, 1, '2021-06-23 09:15:12', NULL),
(22, 2, 4, 2, '2021-06-23 09:15:12', NULL),
(23, 2, 5, 2, '2021-06-23 09:15:12', NULL),
(24, 2, 6, 3, '2021-06-23 09:15:12', NULL),
(25, 2, 7, 3, '2021-06-23 09:15:12', NULL),
(26, 2, 8, 4, '2021-06-23 09:15:12', NULL),
(27, 2, 9, 5, '2021-06-23 09:15:12', NULL),
(28, 2, 21, 6, '2021-06-23 09:15:12', NULL),
(29, 2, 22, 6, '2021-06-23 09:15:12', NULL),
(30, 2, 23, 6, '2021-06-23 09:15:12', NULL),
(31, 2, 24, 6, '2021-06-23 09:15:12', NULL),
(32, 2, 25, 6, '2021-06-23 09:15:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` mediumint UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `created_at`) VALUES
(1, 'Em 1', 'em1@test.com', '2021-06-23 08:38:31'),
(2, 'Em 2', 'em2@test.com', '2021-06-23 08:38:31'),
(3, 'Em 3', 'em3@test.com', '2021-06-23 08:39:54'),
(4, 'Em 4', 'em4@test.com', '2021-06-23 08:39:54'),
(5, 'Em 5', 'em5@test.com', '2021-06-23 08:52:16'),
(6, 'Em 6', 'em6@test.com', '2021-06-23 08:52:16'),
(7, 'Em 7', 'em7@test.com', '2021-06-23 08:52:16'),
(8, 'Em 8', 'em8@test.com', '2021-06-23 08:52:16'),
(9, 'Em 9', 'em9@test.com', '2021-06-23 08:52:16'),
(10, 'Em 10', 'em10@test.com', '2021-06-23 08:52:16'),
(11, 'Em 11', 'em11@test.com', '2021-06-23 08:52:16'),
(12, 'Em 12', 'em12@test.com', '2021-06-23 08:52:16'),
(13, 'Em 13', 'em13@test.com', '2021-06-23 08:52:16'),
(14, 'Em 14', 'em14@test.com', '2021-06-23 08:52:16'),
(15, 'Em 15', 'em15@test.com', '2021-06-23 08:52:16'),
(16, 'Em 16', 'em16@test.com', '2021-06-23 08:52:16'),
(17, 'Em 17', 'em17@test.com', '2021-06-23 08:52:16'),
(18, 'Em 18', 'em18@test.com', '2021-06-23 08:52:16'),
(19, 'Em 19', 'em19@test.com', '2021-06-23 08:52:16'),
(20, 'Em 20', 'em20@test.com', '2021-06-23 08:52:16'),
(21, 'Em 21', 'em21@test.com', '2021-06-23 08:52:16'),
(22, 'Em 22', 'em22@test.com', '2021-06-23 08:52:16'),
(23, 'Em 23', 'em23@test.com', '2021-06-23 08:52:16'),
(24, 'Em 24', 'em24@test.com', '2021-06-23 08:52:16'),
(25, 'Em 25', 'em25@test.com', '2021-06-23 08:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `priority` smallint UNSIGNED NOT NULL COMMENT 'Samllest value is the most powerfull. Ex: priority = 1 is the most powerfull then 2, after that 3 .....  It''s can''t be editable. So autoincremented value is used for role priority logic.',
  `name` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=latin1;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`priority`, `name`, `created_at`, `updated_at`) VALUES
(1, 'First priority', '2021-06-21 09:45:49', NULL),
(2, 'Second Priority', '2021-06-21 09:45:49', NULL),
(3, 'Third Priority', '2021-06-21 09:45:49', NULL),
(4, 'Forth Priority', '2021-06-21 09:48:15', NULL),
(5, 'Fifth Priority', '2021-06-21 09:48:15', NULL),
(6, '6th Priority', '2021-06-21 09:50:01', NULL),
(7, '7th Priority', '2021-06-21 09:50:01', NULL),
(8, '8th Priority', '2021-06-21 09:50:01', NULL),
(9, '9th Priority', '2021-06-21 09:50:01', NULL),
(10, '10th Priority', '2021-06-21 09:50:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` smallint UNSIGNED NOT NULL,
  `priority_id` smallint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `priority_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'CEO', NULL, '2021-06-21 09:46:58', NULL),
(2, 2, 'COO', NULL, '2021-06-21 09:46:58', NULL),
(3, 3, 'GENERAL MANAGER', NULL, '2021-06-21 09:46:58', '2021-06-21 09:48:57'),
(4, 4, 'MANAGER', NULL, '2021-06-21 09:49:24', NULL),
(5, 5, 'SUPERVISOR', NULL, '2021-06-21 09:49:24', NULL),
(6, 6, 'STAFF', NULL, '2021-06-21 09:50:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_name_unique` (`name`);

--
-- Indexes for table `department_employee_role_relation`
--
ALTER TABLE `department_employee_role_relation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_id_employee_id_role_id_unique` (`department_id`,`employee_id`,`role_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`priority`),
  ADD UNIQUE KEY `priority_name_unique` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name_unique` (`name`),
  ADD KEY `priority_id` (`priority_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department_employee_role_relation`
--
ALTER TABLE `department_employee_role_relation`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `priority` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Samllest value is the most powerfull. Ex: priority = 1 is the most powerfull then 2, after that 3 .....  It''s can''t be editable. So autoincremented value is used for role priority logic.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department_employee_role_relation`
--
ALTER TABLE `department_employee_role_relation`
  ADD CONSTRAINT `department_employee_role_relation_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_employee_role_relation_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_employee_role_relation_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`priority`);
COMMIT;
