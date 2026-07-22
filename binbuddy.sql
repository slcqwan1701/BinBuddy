-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2026 at 03:35 PM
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
-- Database: `binbuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_logs`
--

CREATE TABLE `ai_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `recommendation` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `badge_id` int(11) NOT NULL,
  `badge_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`badge_id`, `badge_name`, `description`) VALUES
(1, 'Eco Beginner', 'Awarded for earning 50 points'),
(2, 'Green Hero', 'Awarded for earning 150 points'),
(3, 'Recycling Champion', 'Awarded for earning 300 points'),
(4, 'BinBuddy Ambassador', 'Awarded for earning 500 points'),
(5, 'Starter', '0 Points'),
(6, 'Community Member', '100 Points'),
(7, 'Active Contributor', '250 Points'),
(8, 'Eco Champion', '500 Points'),
(9, 'Sustainability Advocate', '800 Points'),
(10, 'Community Leader', '1200 Points'),
(11, 'BinBuddy Ambassador', '1800 Points');

-- --------------------------------------------------------

--
-- Table structure for table `badge_tiers`
--

CREATE TABLE `badge_tiers` (
  `tier_id` int(11) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `min_points` int(11) NOT NULL,
  `max_points` int(11) DEFAULT NULL,
  `chevrons` tinyint(4) NOT NULL DEFAULT 1,
  `tier_label` varchar(10) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badge_tiers`
--

INSERT INTO `badge_tiers` (`tier_id`, `slug`, `title`, `description`, `min_points`, `max_points`, `chevrons`, `tier_label`, `sort_order`, `updated_at`) VALUES
(1, 'starter', 'Starter', 'Beginning your BinBuddy journey.', 0, 99, 1, 'I', 0, '2026-07-21 13:24:47'),
(2, 'member', 'Community Member', 'Regular participation in community activities.', 100, 249, 2, 'II', 1, '2026-07-21 13:24:47'),
(3, 'contributor', 'Active Contributor', 'Consistently contributes through reports, events, and recycling.', 250, 499, 3, 'III', 2, '2026-07-21 13:24:47'),
(4, 'champion', 'Eco Champion', 'Strong commitment to protecting the environment.', 500, 799, 1, 'IV', 3, '2026-07-21 13:24:47'),
(5, 'advocate', 'Sustainability Advocate', 'Recognised for continuous positive environmental impact.', 800, 1199, 2, 'V', 4, '2026-07-21 13:24:47'),
(6, 'leader', 'Community Leader', 'A leading contributor who inspires the BinBuddy community.', 1200, 1799, 3, 'VI', 5, '2026-07-21 13:24:47'),
(7, 'ambassador', 'BinBuddy Ambassador', 'Highest recognition for outstanding long-term contribution.', 1800, NULL, 0, '★', 6, '2026-07-21 13:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `bins`
--

CREATE TABLE `bins` (
  `bin_id` int(11) NOT NULL,
  `bin_name` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `bin_location` varchar(255) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `fill_level` int(11) DEFAULT 0,
  `status` enum('empty','normal','almost full','full','overflowing','offline') DEFAULT 'empty',
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bins`
--

INSERT INTO `bins` (`bin_id`, `bin_name`, `area`, `bin_location`, `latitude`, `longitude`, `fill_level`, `status`, `last_updated`) VALUES
(1, 'BIN-00001', 'Subang Jaya', 'Jalan SS15, Subang Jaya', 3.07430000, 101.58890000, 35, 'normal', '2026-07-14 00:51:57'),
(2, 'BIN-00002', 'Subang Jaya', 'USJ 1 Residential Area', 3.06120000, 101.59210000, 85, 'full', '2026-07-02 15:53:06'),
(3, 'BIN-00003', 'Petaling Jaya', 'SS2 Petaling Jaya', 3.11800000, 101.62200000, 50, 'almost full', '2026-07-19 15:37:03'),
(4, 'BIN-00004', 'Petaling Jaya', 'Taman Paramount', 3.10500000, 101.62500000, 20, 'empty', '2026-07-02 15:53:06'),
(5, 'BIN-00005', 'Shah Alam', 'Seksyen 7 Shah Alam', 3.07380000, 101.51830000, 80, 'full', '2026-07-14 05:22:54'),
(7, 'BIN-00007', 'Kuala Lumpur', 'Titiwangsa', 3.17700000, 101.70400000, 25, 'normal', '2026-07-21 14:01:36'),
(8, 'BIN-00008', 'Shah Alam', 'Dataran Shah Alam, Section 14', 3.07330000, 101.51850000, 100, 'full', '2026-07-20 23:48:57'),
(9, 'BIN-00009', 'Kuala Lumpur', 'KLCC Park, Jalan Pinang', 3.15790000, 101.71190000, 100, 'full', '2026-07-20 23:48:57'),
(10, 'BIN-00010', 'Shah Alam', 'Shah Alam Stadium, Persiaran Sukan', 3.08210000, 101.53240000, 28, 'normal', '2026-07-20 23:51:51'),
(11, 'BIN-00011', 'Shah Alam', 'i-City, Seksyen 7', 3.06680000, 101.48490000, 55, 'normal', '2026-07-20 23:51:51'),
(12, 'BIN-00012', 'Shah Alam', 'Kompleks PKNS, Section 2', 3.06890000, 101.50320000, 78, 'almost full', '2026-07-20 23:51:51'),
(13, 'BIN-00013', 'SS15 Subang Jaya', 'Jalan SS15/4, Subang Jaya', 3.07380000, 101.58940000, 25, 'normal', '2026-07-20 23:51:51'),
(14, 'BIN-00014', 'SS15 Subang Jaya', 'SS15 Commercial Centre', 3.07450000, 101.59010000, 72, 'almost full', '2026-07-20 23:51:51'),
(15, 'BIN-00015', 'SS15 Subang Jaya', 'Subang Parade, Jalan SS16/1', 3.08120000, 101.58760000, 18, 'empty', '2026-07-20 23:51:51'),
(16, 'BIN-00016', 'SS15 Subang Jaya', 'Taipan Business Centre, USJ 9', 3.04980000, 101.58590000, 62, 'normal', '2026-07-20 23:51:51'),
(17, 'BIN-00017', 'SS18 Subang Jaya', 'Jalan SS18/1, Subang Jaya', 3.06720000, 101.58230000, 15, 'empty', '2026-07-20 23:51:51'),
(18, 'BIN-00018', 'SS18 Subang Jaya', 'Empire Subang, Jalan SS16/1', 3.08280000, 101.58540000, 44, 'normal', '2026-07-20 23:51:51'),
(19, 'BIN-00019', 'SS18 Subang Jaya', 'Summit USJ, Persiaran Kewajipan', 3.05870000, 101.59210000, 83, 'full', '2026-07-20 23:51:51'),
(20, 'BIN-00020', 'USJ 1', 'Persiaran Kewajipan, USJ 1', 3.04890000, 101.58560000, 88, 'full', '2026-07-20 23:51:51'),
(21, 'BIN-00021', 'USJ 1', 'USJ 1 Recreational Park', 3.04720000, 101.58380000, 32, 'normal', '2026-07-20 23:51:51'),
(22, 'BIN-00022', 'USJ 1', 'Main Place Mall, USJ 21', 3.05410000, 101.59120000, 51, 'normal', '2026-07-20 23:51:51'),
(23, 'BIN-00023', 'USJ 1', 'USJ 3/1 Commercial Area', 3.05160000, 101.58740000, 69, 'almost full', '2026-07-20 23:51:51'),
(24, 'BIN-00024', 'Sunway City', 'Jalan PJS 11/15, Sunway', 3.07310000, 101.60650000, 45, 'normal', '2026-07-20 23:51:51'),
(25, 'BIN-00025', 'Sunway City', 'Sunway Pyramid, Bandar Sunway', 3.07280000, 101.60760000, 91, 'overflowing', '2026-07-20 23:51:51'),
(26, 'BIN-00026', 'Sunway City', 'Sunway University, Jalan Universiti', 3.06760000, 101.60340000, 22, 'empty', '2026-07-20 23:51:51'),
(27, 'BIN-00027', 'Sunway City', 'Sunway Medical Centre, Jalan Lagoon Selatan', 3.06990000, 101.60480000, 58, 'normal', '2026-07-20 23:51:51'),
(28, 'BIN-00028', 'SS2 Petaling Jaya', 'Jalan SS2/24, Petaling Jaya', 3.11780000, 101.62340000, 95, 'overflowing', '2026-07-20 23:51:51'),
(29, 'BIN-00029', 'SS2 Petaling Jaya', 'SS2 Morning Market, Jalan SS2/61', 3.11850000, 101.62410000, 38, 'normal', '2026-07-20 23:51:51'),
(30, 'BIN-00030', 'SS2 Petaling Jaya', 'Digital Mall, Section 14 PJ', 3.11240000, 101.63480000, 74, 'almost full', '2026-07-20 23:51:51'),
(31, 'BIN-00031', 'SS2 Petaling Jaya', 'Paradigm Mall, Kelana Jaya', 3.10560000, 101.59320000, 12, 'empty', '2026-07-20 23:51:51'),
(32, 'BIN-00032', 'Klang', 'Klang Parade, Jalan Meru', 3.04470000, 101.44510000, 41, 'normal', '2026-07-20 23:51:51'),
(33, 'BIN-00033', 'Klang', 'Little India, Jalan Tengku Kelana', 3.04280000, 101.44360000, 86, 'full', '2026-07-20 23:51:51'),
(34, 'BIN-00034', 'Klang', 'Bukit Tinggi, Bandar Botanik', 3.01240000, 101.46780000, 33, 'normal', '2026-07-20 23:51:51'),
(35, 'BIN-00035', 'Klang', 'Port Klang, Pelabuhan Klang', 2.99870000, 101.39240000, 67, 'almost full', '2026-07-20 23:51:51'),
(36, 'BIN-00036', 'Kajang', 'Kajang Town Square', 2.99360000, 101.79040000, 29, 'normal', '2026-07-20 23:51:51'),
(37, 'BIN-00037', 'Kajang', 'Stadium Kajang, Jalan Semenyih', 2.98980000, 101.78760000, 76, 'almost full', '2026-07-20 23:51:51'),
(38, 'BIN-00038', 'Kajang', 'Metro Point Kajang, Jalan Cheras', 2.99610000, 101.78420000, 6, 'empty', '2026-07-21 05:05:53'),
(39, 'BIN-00039', 'Puchong', 'IOI Mall Puchong, Bandar Puchong Jaya', 3.04780000, 101.62010000, 48, 'normal', '2026-07-20 23:51:51'),
(40, 'BIN-00040', 'Puchong', 'Setia Walk, Pusat Bandar Puchong', 3.05120000, 101.62340000, 81, 'full', '2026-07-20 23:51:51'),
(41, 'BIN-00041', 'Puchong', 'Taman Kinrara, Jalan Puchong', 3.05460000, 101.63890000, 19, 'empty', '2026-07-20 23:51:51'),
(42, 'BIN-00042', 'Puchong', 'Puchong Perdana Lake Park', 3.01230000, 101.61240000, 56, 'normal', '2026-07-20 23:51:51'),
(43, 'BIN-00043', 'Cyberjaya', 'Cyberjaya City Centre, Persiaran Multimedia', 2.92130000, 101.65590000, 24, 'empty', '2026-07-20 23:51:51'),
(44, 'BIN-00044', 'Cyberjaya', 'MMU Campus, Persiaran Multimedia', 2.92780000, 101.65340000, 52, 'normal', '2026-07-20 23:51:51'),
(45, 'BIN-00045', 'Cyberjaya', 'DPulze Cyberjaya, Lingkaran Cyber Point Timur', 2.91890000, 101.65120000, 79, 'almost full', '2026-07-20 23:51:51'),
(46, 'BIN-00046', 'Kota Damansara', 'The Curve, Mutiara Damansara', 3.15840000, 101.59560000, 37, 'normal', '2026-07-20 23:51:51'),
(47, 'BIN-00047', 'Kota Damansara', 'IKEA Damansara, Mutiara Damansara', 3.16120000, 101.59280000, 64, 'normal', '2026-07-20 23:51:51'),
(48, 'BIN-00048', 'Kota Damansara', 'Surian Tower, Kota Damansara', 3.15230000, 101.58890000, 92, 'overflowing', '2026-07-20 23:51:51'),
(49, 'BIN-00049', 'Bangi', 'UKM Bangi, Jalan Bangi', 2.92890000, 101.78010000, 21, 'empty', '2026-07-20 23:51:51'),
(50, 'BIN-00050', 'Bangi', 'Bangi Avenue, Seksyen 1', 2.94560000, 101.76230000, 59, 'normal', '2026-07-20 23:51:51'),
(51, 'BIN-00051', 'Bangi', 'Bangi Gateway, Persiaran Bangi', 2.93870000, 101.77120000, 3, 'empty', '2026-07-21 05:06:46'),
(52, 'BIN-00052', 'Rawang', 'Rawang Town Centre, Jalan Bandar Rawang', 3.32140000, 101.57670000, 43, 'normal', '2026-07-20 23:51:51'),
(53, 'BIN-00053', 'Rawang', 'Anggun City, Taman Anggun', 3.31890000, 101.56980000, 71, 'almost full', '2026-07-20 23:51:51'),
(54, 'BIN-00054', 'Rawang', 'Rawang Bypass Rest Area', 3.32980000, 101.58120000, 100, 'full', '2026-07-20 23:51:51'),
(55, 'BIN-00055', 'Sepang', 'KLIA Terminal, Sepang', 2.74560000, 101.70720000, 35, 'normal', '2026-07-20 23:51:51'),
(56, 'BIN-00056', 'Sepang', 'Salak Tinggi, Sepang District', 2.81230000, 101.72340000, 68, 'almost full', '2026-07-20 23:51:51'),
(57, 'BIN-00057', 'Sepang', 'Sungai Pelek Town', 2.64340000, 101.71230000, 27, 'normal', '2026-07-20 23:51:51'),
(58, 'BIN-00058', 'Ampang', 'Ampang Point, Jalan Ampang', 3.15890000, 101.76120000, 0, 'empty', '2026-07-21 14:13:55'),
(59, 'BIN-00059', 'Ampang', 'Taman Dagang, Ampang Jaya', 3.14230000, 101.76890000, 0, 'empty', '2026-07-21 04:43:14'),
(60, 'BIN-00060', 'Ampang', 'Zoo Negara, Hulu Kelang', 3.20890000, 101.75670000, 15, 'empty', '2026-07-20 23:51:51'),
(61, 'BIN-00061', 'Kuala Lumpur', 'Bukit Bintang, Jalan Sultan Ismail', 3.14780000, 101.70890000, 54, 'normal', '2026-07-20 23:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `collection_history`
--

CREATE TABLE `collection_history` (
  `history_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `waste_type` varchar(100) DEFAULT NULL,
  `status` enum('Completed','Cancelled') DEFAULT 'Completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection_history`
--

INSERT INTO `collection_history` (`history_id`, `task_id`, `completed_at`, `remarks`, `request_id`, `user_id`, `pickup_location`, `waste_type`, `status`) VALUES
(1, NULL, '2026-07-20 16:12:06', 'Collection completed by driver', 22, 14, 'Bukit Bintang, Kuala Lumpur', 'Garden Waste', 'Completed'),
(2, NULL, '2026-07-20 16:12:51', 'Collection completed by driver', 18, 19, '60-116, Jalan Desa Makmur, Taman Desa, 58100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur', 'Overflowing Bin', 'Completed'),
(3, NULL, '2026-07-20 16:46:14', 'Collection completed by staff', 21, 14, 'USJ 1, Subang Jaya, Selangor', 'Garden Waste', 'Completed'),
(4, NULL, '2026-07-21 00:10:56', 'Collection completed by driver', 24, 24, 'Sunway City, Subang Jaya, Selangor', 'Bulky Waste', 'Completed'),
(5, NULL, '2026-07-21 00:11:07', 'Collection completed by driver', 25, 24, 'USJ 1, Subang Jaya, Selangor', 'Household Waste', 'Completed'),
(6, NULL, '2026-07-21 14:24:12', 'Collection completed by driver', 30, 19, 'Semenyih', 'Illegal Dumping', 'Completed'),
(7, NULL, '2026-07-21 14:25:27', 'Collection completed by driver', 28, 30, 'Bukit Bintang, Kuala Lumpur', 'Household Waste', 'Completed'),
(8, NULL, '2026-07-21 14:25:36', 'Collection completed by driver', 17, 19, 'SS18, Subang Jaya, Selangor', 'Garden Waste', 'Completed'),
(9, NULL, '2026-07-21 14:30:20', 'Collection completed by driver', 16, 19, 'Sunway City, Subang Jaya, Selangor', 'Recyclable Waste', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `collection_tasks`
--

CREATE TABLE `collection_tasks` (
  `task_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `task_date` date DEFAULT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection_tasks`
--

INSERT INTO `collection_tasks` (`task_id`, `staff_id`, `driver_id`, `request_id`, `report_id`, `task_date`, `status`) VALUES
(6, 26, NULL, 28, NULL, '2026-07-21', 'Pending'),
(7, 26, 17, 30, 34, '2026-07-21', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(10, 22, 21, 'Good Morning Jonathan', '2026-07-20 15:12:57'),
(11, 22, 13, 'Lets Go!!!', '2026-07-20 17:15:21'),
(12, 23, 19, 'Omg that is horrible', '2026-07-21 00:49:31'),
(14, 25, 19, 'love this nessa', '2026-07-21 00:56:42'),
(15, 25, 14, 'Nothing says go green more than that am i right', '2026-07-21 00:57:33'),
(16, 25, 24, 'woah thats deff too much gree', '2026-07-21 08:40:41'),
(18, 23, 30, 'That\'s Horrible', '2026-07-21 13:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `community_posts`
--

CREATE TABLE `community_posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `visibility` enum('visible','hidden') DEFAULT 'visible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_posts`
--

INSERT INTO `community_posts` (`post_id`, `user_id`, `content`, `post_image`, `image`, `created_at`, `visibility`) VALUES
(22, 14, 'Good Morning BinBuddies!!! Lets reycle as much as we can today!!!', '', NULL, '2026-07-20 14:46:05', 'visible'),
(23, 13, 'Saw a bunch of rats just now #disgusted', '', NULL, '2026-07-20 17:10:24', 'visible'),
(25, 19, 'My inspirational for binbuddy!!', '1784595364_Gridfiti_Blog_GreenAesthetic_FoodDrink.jpg', NULL, '2026-07-21 00:56:04', 'visible'),
(26, 24, 'Hi santhiya slay today', '', NULL, '2026-07-21 08:40:04', 'visible');

-- --------------------------------------------------------

--
-- Table structure for table `community_reports`
--

CREATE TABLE `community_reports` (
  `report_id` int(11) NOT NULL,
  `content_type` enum('post','comment') NOT NULL,
  `content_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` enum('Pending','Reviewed','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_reports`
--

INSERT INTO `community_reports` (`report_id`, `content_type`, `content_id`, `reporter_id`, `reason`, `status`, `created_at`) VALUES
(10, 'post', 20, 13, 'Harassment', 'Pending', '2026-07-16 07:59:21'),
(11, 'post', 22, 21, 'Other', 'Reviewed', '2026-07-20 15:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `educational_talks`
--

CREATE TABLE `educational_talks` (
  `talk_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `speaker` varchar(100) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `talk_date` date DEFAULT NULL,
  `talk_time` time DEFAULT NULL,
  `registration_deadline` datetime DEFAULT NULL,
  `max_participants` int(11) DEFAULT 30,
  `image` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `educational_talks`
--

INSERT INTO `educational_talks` (`talk_id`, `title`, `description`, `speaker`, `location`, `talk_date`, `talk_time`, `registration_deadline`, `max_participants`, `image`, `created_by`, `status`, `reviewed_by`, `reviewed_at`, `review_remark`, `created_at`) VALUES
(6, 'Go Green', 'Join small-group wildlife photography tours in the UK and around the world, led by experienced photography guides who know both wildlife and how to photograph it beautifully. Expect expert tuition, exceptional locations, and more time in the field to improve your images.', 'Vijay', 'Sunway Mentari Court', '2026-07-25', '10:00:00', '2026-07-24 00:00:00', 120, '', 25, 'approved', 25, '2026-07-21 08:43:37', NULL, '2026-07-21 00:43:37'),
(7, 'Learning With Nature', 'Since experiencing nature is a healthy part of child development, take your class outdoors and use elements of nature for teaching the usual classroom subjects.', 'Marina Robb and Victoria Mew', 'Jalan Puchong Sermai', '2026-07-25', '10:00:00', '2026-07-24 00:00:00', 100, '', 25, 'approved', 25, '2026-07-21 18:05:02', NULL, '2026-07-21 10:05:02'),
(8, 'Go Green Awarness', 'Change the future with nature', 'Sarah Qualley', 'Sunway University', '2026-07-23', '22:44:00', '2026-07-22 22:44:00', 400, '', 25, 'approved', 25, '2026-07-21 22:44:29', NULL, '2026-07-21 14:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `organiser_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `registration_deadline` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `max_participants` int(11) DEFAULT 30,
  `image` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `organiser_id`, `title`, `description`, `event_date`, `event_time`, `registration_deadline`, `location`, `max_participants`, `image`, `created_by`, `status`, `reviewed_by`, `reviewed_at`, `review_remark`) VALUES
(9, NULL, 'Malaysia Nature Society (MNS)', 'PROTECTING NATURE is protecting our home Join us in making a difference!!!', '2026-07-25', '12:00:00', '2026-07-24 00:00:00', 'JKR 641, Jalan Kelantan, Bukit Persekutuan, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur', 200, '1784628113_Screenshot2026-07-21175950.png', 25, 'approved', 25, '2026-07-21 18:01:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_participants`
--

CREATE TABLE `event_participants` (
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('registered','cancelled') DEFAULT 'registered',
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `registration_no` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `emergency_contact` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_participants`
--

INSERT INTO `event_participants` (`participant_id`, `event_id`, `user_id`, `status`, `joined_at`, `registration_no`, `contact_phone`, `emergency_contact`) VALUES
(15, 9, 24, 'registered', '2026-07-22 12:50:42', 'REG-EV-00015', '0122621276', '');

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `registration_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `illegal_reports`
--

CREATE TABLE `illegal_reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `report_type` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('pending','in_progress','resolved','rejected') DEFAULT 'pending',
  `priority` enum('Low','Medium','High') DEFAULT 'Medium',
  `staff_remark` text DEFAULT NULL,
  `resolution_image` varchar(255) DEFAULT NULL,
  `admin_remark` text DEFAULT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `illegal_reports`
--

INSERT INTO `illegal_reports` (`report_id`, `user_id`, `report_type`, `description`, `location`, `latitude`, `longitude`, `image_path`, `status`, `priority`, `staff_remark`, `resolution_image`, `admin_remark`, `assigned_staff_id`, `created_at`) VALUES
(12, 14, 'Illegal Dumping', 'its already a habit of people throwing rubbish here ', 'Sunway Semenyih ', NULL, NULL, '1784090248_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-15 04:37:28'),
(13, 14, 'Overflowing Bin', 'A lot ', 'Sunway University ', NULL, NULL, '', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-16 00:25:31'),
(14, 14, 'Overflowing Bin', 'ded', 'Sunway University ', NULL, NULL, '1784192927_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-16 09:08:47'),
(15, 13, 'Illegal Dumping', 'Too many trash ', 'jalan SS15', NULL, NULL, '1784258353_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 03:19:13'),
(16, 13, 'Overflowing Bin', 'again', 'jalan SS15', NULL, NULL, '1784258919_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 03:28:39'),
(17, 13, 'Damaged Bin', 'helo ', 'Sunway University ', NULL, NULL, '1784304182_illegaldump.jpeg', 'resolved', 'Medium', '', NULL, NULL, NULL, '2026-07-17 16:03:02'),
(18, 13, 'Overflowing Bin', 'Do something please ', 'Sunway University ', NULL, NULL, '1784304569_illegaldump.jpeg', 'resolved', 'Medium', '', NULL, NULL, NULL, '2026-07-17 16:09:29'),
(19, 13, 'Overflowing Bin', 'Do something please ', 'Sunway University ', NULL, NULL, '1784304668_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 16:11:08'),
(20, 13, 'Overflowing Bin', 'again\r\n', 'Bandar Tasik Kesuma ', NULL, NULL, '1784305041_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 16:17:21'),
(21, 13, 'Missed Collection', 'tt', 'Puchong ', NULL, NULL, '1784305197_illegaldump.jpeg', 'resolved', 'Medium', '', NULL, NULL, NULL, '2026-07-17 16:19:57'),
(22, 13, 'Missed Collection', 'tt', 'Puchong ', NULL, NULL, '1784305457_illegaldump.jpeg', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 16:24:17'),
(23, 13, 'Overflowing Bin', 'hahahha', 'Bandar Tasik Kesuma ', NULL, NULL, '1784305525_jude.webp', 'resolved', 'Medium', NULL, NULL, '', NULL, '2026-07-17 16:25:25'),
(24, 14, 'Overflowing Bin', 'test', 'Bandar Tasik Kesuma ', NULL, NULL, '1784307747_illegaldump.jpeg', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-17 17:02:27'),
(25, 14, 'Damaged Bin', 'fr', 'Bandar Tasik Kesuma ', NULL, NULL, '1784398046_Screenshot 2026-07-17 233109.png', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-18 18:07:26'),
(26, 19, 'Overflowing Bin', 'Help solve this', '60-116, Jalan Desa Makmur, Taman Desa, 58100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur', NULL, NULL, '1784474788_overflowing.jpg', 'resolved', 'Medium', '', NULL, NULL, NULL, '2026-07-19 15:26:28'),
(27, 14, 'Missed Collection', 'There is trash all over the place', 'Semenyih', NULL, NULL, '', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-20 14:50:16'),
(28, 21, 'Overflowing Bin', 'Please solve this issue', 'Puchong', NULL, NULL, '1784559809_overflowing.jpg', 'in_progress', 'Medium', NULL, NULL, '', NULL, '2026-07-20 15:03:29'),
(29, 24, 'Missed Collection', 'So Dirty', 'Sunway Mentari Court', NULL, NULL, '', 'in_progress', 'Medium', '', NULL, '', 26, '2026-07-20 23:44:18'),
(30, 24, 'Illegal Dumping', 'Please solve this issue', 'Taman Sri Haneco', NULL, NULL, '1784611169_illegaldump.jpeg', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-21 05:19:29'),
(31, 24, 'Illegal Dumping', 'Someone dumped the trash in the wrong area', 'Sunway Mentari', NULL, NULL, '', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-21 08:37:57'),
(33, 30, 'Illegal Dumping', 'There is some illegal dumping activity around here!!', 'No 12 Jalan Kesuma 6/1d', NULL, NULL, '1784641683_overflowing.jpg', 'resolved', 'Medium', '', '1784643181_res_33.jpg', '', 26, '2026-07-21 13:48:03'),
(34, 19, 'Illegal Dumping', 'Urgent', 'Semenyih', NULL, NULL, '1784643580_overflowing.jpg', 'in_progress', 'Medium', NULL, NULL, '', 26, '2026-07-21 14:19:40'),
(35, 24, 'Missed Collection', 'Help Solve The Issue', 'Subang', NULL, NULL, '1784703061_cleanalley.jpg', 'pending', 'Medium', NULL, NULL, NULL, NULL, '2026-07-22 06:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `moderation_logs`
--

CREATE TABLE `moderation_logs` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `target_type` enum('post','comment') NOT NULL,
  `target_id` int(11) NOT NULL,
  `action` enum('hide','delete','restore','warn','dismiss_report') NOT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderation_logs`
--

INSERT INTO `moderation_logs` (`log_id`, `admin_id`, `target_type`, `target_id`, `action`, `remark`, `created_at`) VALUES
(1, 18, 'post', 23, 'warn', 'test', '2026-07-21 05:53:01'),
(2, 18, 'post', 22, 'dismiss_report', '', '2026-07-21 06:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` enum('System','Announcement') NOT NULL DEFAULT 'System',
  `related_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `title`, `message`, `notification_type`, `related_id`, `is_read`, `created_at`) VALUES
(74, 14, 'Report Status Updated', 'Your report REP-00012 has been updated to Resolved.', 'System', NULL, 1, '2026-07-15 04:38:20'),
(75, 14, 'New Comment', 'user456 commented on your community post.', 'System', NULL, 0, '2026-07-16 07:59:03'),
(76, 14, 'Report Status Updated', 'Your report REP-00014 has been updated to Resolved.', 'System', NULL, 0, '2026-07-16 09:14:59'),
(77, 14, 'New Comment', 'user456 commented on your community post.', 'System', NULL, 1, '2026-07-16 09:19:04'),
(78, 14, 'Report Status Updated', 'Your report REP-00013 has been updated to Pending.', 'System', NULL, 0, '2026-07-17 02:33:14'),
(79, 14, 'Report Status Updated', 'Your report REP-00013 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 02:33:27'),
(80, 13, 'Pickup Request Updated', 'Your pickup request PU-00011 has been updated to Rejected.', 'System', NULL, 0, '2026-07-17 05:17:46'),
(81, 13, 'Pickup Request Updated', 'Your pickup request PU-00011 has been updated to Approved.', 'System', NULL, 1, '2026-07-17 05:18:57'),
(82, 13, 'Pickup Completed', 'Your pickup request PU-00011 has been completed.', 'System', NULL, 1, '2026-07-17 05:19:47'),
(83, 13, 'Report Status Updated', 'Your report REP-00016 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 05:21:36'),
(84, 13, 'Report Status Updated', 'Your report REP-00015 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 05:21:40'),
(85, 13, 'Pickup Request Updated', 'Your pickup request PU-00011 has been updated to Pending.', 'System', NULL, 0, '2026-07-17 15:29:11'),
(86, 13, 'Report Status Updated', 'Your report REP-00016 has been updated to Resolved.', 'System', NULL, 0, '2026-07-17 15:29:36'),
(87, 13, 'Report Status Updated', 'Your report REP-00016 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 15:29:42'),
(88, 13, 'Report Status Updated', 'Your report REP-00016 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 15:30:12'),
(89, 13, 'Pickup Request Updated', 'Your pickup request PU-00014 has been updated to Approved.', 'System', NULL, 1, '2026-07-17 15:38:15'),
(90, 13, 'Pickup Completed', 'Your pickup request PU-00014 has been completed.', 'System', NULL, 1, '2026-07-17 15:38:39'),
(91, 14, 'Collection Status Updated', 'Your collection request (PU-00009) status has been updated to Pending.', 'System', NULL, 1, '2026-07-17 15:51:13'),
(92, 13, 'Collection Status Updated', 'Your collection request (PU-00013) status has been updated to Assigned.', 'System', NULL, 1, '2026-07-17 15:56:50'),
(93, 13, 'Collection Status Updated', 'Your collection request (PU-00013) status has been updated to Completed.', 'System', NULL, 1, '2026-07-17 15:57:31'),
(94, 13, 'Collection Status Updated', 'Your collection request (PU-00012) status has been updated to Assigned.', 'System', NULL, 1, '2026-07-17 15:57:53'),
(95, 13, 'Collection Status Updated', 'Your collection request (PU-00012) status has been updated to Completed.', 'System', NULL, 1, '2026-07-17 15:59:09'),
(98, 13, 'Report Status Updated', 'Your report REP-00019 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:16:53'),
(101, 13, 'Report Status Updated', 'Your report REP-00020 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:19:09'),
(102, 13, 'Report Status Updated', 'Your report REP-00023 has been updated to Pending.', 'System', NULL, 1, '2026-07-17 16:26:33'),
(103, 13, 'Report Status Updated', 'Your report REP-00023 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:26:39'),
(104, 13, 'Collection Status Updated', 'Your collection request (PU-00011) status has been updated to Completed.', 'System', NULL, 1, '2026-07-17 16:33:58'),
(105, 14, 'Collection Status Updated', 'Your collection request (PU-00010) status has been updated to Completed.', 'System', NULL, 0, '2026-07-17 16:34:14'),
(106, 13, 'Report Status Updated', 'Your report REP-00022 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:36:03'),
(107, 13, 'Report Status Updated', 'Your report REP-00023 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:42:37'),
(108, 13, 'Collection Status Updated', 'Your collection request (PU-00011) status has been updated to Completed.', 'System', NULL, 1, '2026-07-17 16:43:04'),
(109, 14, 'Collection Status Updated', 'Your collection request (PU-00009) status has been updated to Completed.', 'System', NULL, 0, '2026-07-17 16:44:34'),
(110, 13, 'Report Status Updated', 'Your report REP-00019 has been updated to Resolved.', 'System', NULL, 1, '2026-07-17 16:45:47'),
(111, 14, 'Collection Status Updated', 'Your collection request (PU-00010) status has been updated to Assigned.', 'System', NULL, 0, '2026-07-18 18:07:06'),
(112, 14, 'Collection Status Updated', 'Your collection request (PU-00015) status has been updated to Assigned.', 'System', NULL, 1, '2026-07-18 18:07:57'),
(113, 14, 'Collection Task Updated', 'Your collection request (PU-00015) is now Completed.', 'System', NULL, 1, '2026-07-18 18:08:36'),
(114, 14, 'Reward Claim Updated', 'Your reward claim status is now Shipped.', 'System', NULL, 1, '2026-07-19 01:03:01'),
(117, 14, 'Collection Task Updated', 'Your collection request (PU-00010) is now Completed.', 'System', NULL, 1, '2026-07-20 00:05:39'),
(118, 14, 'Collection Task Updated', 'Your collection request (PU-00015) is now In Progress.', 'System', NULL, 1, '2026-07-20 00:26:41'),
(119, 14, 'Collection Task Updated', 'Your collection request (PU-00015) is now Pending.', 'System', NULL, 1, '2026-07-20 00:27:17'),
(120, 19, 'Report Status Updated', 'Your report REP-00026 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 00:53:04'),
(121, 13, 'Report Status Updated', 'Your report REP-00021 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 00:53:31'),
(122, 13, 'Report Status Updated', 'Your report REP-00021 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 00:56:13'),
(123, 13, 'Report Status Updated', 'Your report REP-00021 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 01:02:05'),
(124, 13, 'Report Status Updated', 'Your report REP-00018 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 01:02:15'),
(125, 13, 'Report Status Updated', 'Your report REP-00017 has been updated to Resolved.', 'System', NULL, 1, '2026-07-20 01:02:26'),
(126, 19, 'Report Status Updated', 'Your report REP-00026 has been updated to Resolved.', 'System', NULL, 0, '2026-07-20 01:03:47'),
(127, 19, 'Collection Status Updated', 'Your collection request (PU-00016) status has been updated to Assigned.', 'System', NULL, 0, '2026-07-20 02:21:02'),
(128, 19, 'Collection Status Updated', 'Your collection request (PU-00018) status has been updated to Completed.', 'System', NULL, 0, '2026-07-20 02:21:51'),
(129, 19, 'Collection Status Updated', 'Your collection request (PU-00017) status has been updated to Completed.', 'System', NULL, 0, '2026-07-20 02:22:02'),
(130, 19, 'Collection Status Updated', 'Your collection request (PU-00016) status has been updated to Completed.', 'System', NULL, 0, '2026-07-20 02:22:08'),
(131, 19, 'Pickup Request Updated', 'Your pickup request PK-00018 has been updated to Pending.', 'System', NULL, 0, '2026-07-20 07:25:01'),
(132, 19, 'Pickup Request Updated', 'Your pickup request PK-00017 has been updated to In Progress.', 'System', NULL, 0, '2026-07-20 07:25:09'),
(133, 13, 'Pickup Request Updated', 'Your pickup request PK-00013 has been updated to Completed.', 'System', NULL, 1, '2026-07-20 07:25:14'),
(138, 13, 'Points Updated', 'Your reward points have been updated by the administrator. Current balance: 500 points.', 'System', NULL, 1, '2026-07-20 08:05:24'),
(139, 14, 'Reward Claim Updated', 'Your reward claim status is now Completed.', 'System', NULL, 1, '2026-07-20 08:12:49'),
(140, 14, 'Reward Claim Updated', 'Your reward claim status is now Completed.', 'System', NULL, 1, '2026-07-20 08:13:18'),
(141, 14, 'Reward Claim Updated', 'Your reward claim status is now Approved.', 'System', NULL, 1, '2026-07-20 08:13:28'),
(142, 18, NULL, 'A community post has been reported.', 'System', NULL, 1, '2026-07-20 15:12:16'),
(143, 14, 'New Like', 'Sarah liked your community post.', 'System', NULL, 1, '2026-07-20 15:12:19'),
(144, 14, 'New Comment', 'Sarah commented on your community post.', 'System', NULL, 1, '2026-07-20 15:12:57'),
(150, 14, 'Pickup Request Approved', 'Your pickup request PU-00021 has been approved and assigned to collection staff.', 'System', NULL, 1, '2026-07-20 15:50:00'),
(152, 14, 'Pickup Request Updated', 'Your pickup request PU-00021 status is now Approved.', 'System', NULL, 1, '2026-07-20 15:51:57'),
(153, 14, 'Pickup Request Updated', 'Your pickup request PU-00021 status is now Approved.', 'System', NULL, 1, '2026-07-20 15:59:03'),
(154, 14, 'Pickup Request Approved', 'Your pickup request PU-00022 has been approved and assigned to collection staff.', 'System', NULL, 1, '2026-07-20 16:09:40'),
(156, 14, 'Collection Status Updated', 'Your collection request PU-00022 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-20 16:10:37'),
(157, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00022. Please check your assigned tasks.', 'System', NULL, 0, '2026-07-20 16:10:37'),
(158, 14, 'Collection Status Updated', 'Your collection request PU-00021 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-20 16:10:53'),
(159, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00021. Please check your assigned tasks.', 'System', NULL, 0, '2026-07-20 16:10:53'),
(160, 14, 'Collection Task Updated', 'Your collection request (PU-00022) is now Completed.', 'System', NULL, 1, '2026-07-20 16:12:06'),
(161, 19, 'Collection Task Updated', 'Your collection request (PU-00018) is now Completed.', 'System', NULL, 0, '2026-07-20 16:12:51'),
(162, 14, 'Event Registration Confirmed', 'You are registered for GOTONG-ROYONG BERSAMA. Registration No: REG-EV-00007', 'System', NULL, 1, '2026-07-20 16:18:29'),
(163, 21, 'Report Approved', 'Your report REP-00028 has been approved and forwarded to waste collection staff.', 'System', NULL, 0, '2026-07-20 16:45:35'),
(165, 14, 'Collection Status Updated', 'Your collection request PU-00021 status has been updated to Completed.', 'System', NULL, 0, '2026-07-20 16:46:14'),
(166, 14, 'New Comment', 'Steven commented on your community post.', 'System', NULL, 0, '2026-07-20 17:15:21'),
(167, 24, 'Pickup Request Approved', 'Your pickup request PU-00025 has been approved and assigned to collection staff.', 'System', NULL, 1, '2026-07-21 00:08:26'),
(169, 24, 'Pickup Request Approved', 'Your pickup request PU-00024 has been approved and assigned to collection staff.', 'System', NULL, 1, '2026-07-21 00:08:40'),
(171, 24, 'Collection Status Updated', 'Your collection request PU-00024 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 00:09:23'),
(172, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00024. Please check your assigned tasks.', 'System', NULL, 0, '2026-07-21 00:09:23'),
(173, 24, 'Collection Status Updated', 'Your collection request PU-00025 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 00:09:38'),
(174, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00025. Please check your assigned tasks.', 'System', NULL, 0, '2026-07-21 00:09:38'),
(175, 24, 'Collection Status Updated', 'Your collection request PU-00025 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 00:10:00'),
(176, 24, 'Collection Status Updated', 'Your collection request PU-00024 status has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 00:10:08'),
(177, 24, 'Collection Task Updated', 'Your collection request (PU-00024) is now Completed.', 'System', NULL, 1, '2026-07-21 00:10:56'),
(178, 24, 'Collection Task Updated', 'Your collection request (PU-00025) is now Completed.', 'System', NULL, 1, '2026-07-21 00:11:07'),
(180, 24, 'Event Approved', 'Your event \"Gotong Royong Surau Al-Ikhsan\" was approved by organiser and is now visible to residents.', 'System', NULL, 1, '2026-07-21 00:36:16'),
(181, 14, 'Event Registration Confirmed', 'You are registered for Gotong Royong Surau Al-Ikhsan. Registration No: REG-EV-00010', 'System', NULL, 0, '2026-07-21 00:45:06'),
(182, 14, 'Talk Registration Confirmed', 'You are registered for Go Green. Registration No: REG-TK-00008', 'System', NULL, 0, '2026-07-21 00:45:37'),
(183, 14, 'New Like', 'Steven liked your community post.', 'System', NULL, 0, '2026-07-21 00:46:35'),
(184, 13, 'Event Registration Confirmed', 'You are registered for Gotong Royong Surau Al-Ikhsan. Registration No: REG-EV-00011', 'System', NULL, 0, '2026-07-21 00:47:06'),
(185, 19, 'Talk Registration Confirmed', 'You are registered for Go Green. Registration No: REG-TK-00009', 'System', NULL, 0, '2026-07-21 00:48:40'),
(186, 13, 'New Like', 'Vanessa Merrell liked your community post.', 'System', NULL, 0, '2026-07-21 00:48:52'),
(187, 14, 'New Like', 'Vanessa Merrell liked your community post.', 'System', NULL, 0, '2026-07-21 00:48:53'),
(188, 13, 'New Comment', 'Vanessa Merrell commented on your community post.', 'System', NULL, 0, '2026-07-21 00:49:31'),
(189, 19, 'New Like', 'Sarah liked your community post.', 'System', NULL, 0, '2026-07-21 00:52:56'),
(190, 13, 'New Like', 'Sarah liked your community post.', 'System', NULL, 0, '2026-07-21 00:52:57'),
(191, 19, 'New Comment', 'Sarah commented on your community post.', 'System', NULL, 0, '2026-07-21 00:53:07'),
(192, 19, 'New Like', 'Jude Bellingham liked your community post.', 'System', NULL, 0, '2026-07-21 00:57:07'),
(193, 19, 'New Comment', 'Jude Bellingham commented on your community post.', 'System', NULL, 0, '2026-07-21 00:57:33'),
(194, 24, 'Talk Registration Confirmed', 'You are registered for Go Green. Registration No: REG-TK-00010 You earned 20 reward points.', 'System', NULL, 1, '2026-07-21 01:08:32'),
(195, 24, 'Points Updated', 'Your reward points have been updated by the administrator. Current balance: 10060 points.', 'System', NULL, 1, '2026-07-21 01:22:28'),
(196, 24, 'Points Updated', 'Your reward points have been updated by the administrator. Current balance: 32371 points.', 'System', NULL, 1, '2026-07-21 01:24:41'),
(197, 24, 'Report Approved', 'Your report REP-00029 has been approved and forwarded to waste collection staff.', 'System', NULL, 1, '2026-07-21 04:38:55'),
(198, 26, 'New Report Assigned', 'Report REP-00029 has been assigned to you for investigation.', 'System', NULL, 0, '2026-07-21 04:38:55'),
(199, 13, 'System Update', 'BinBuddy System has been updated!! Sorry for the incovenience', 'Announcement', NULL, 0, '2026-07-21 05:13:17'),
(200, 14, 'System Update', 'BinBuddy System has been updated!! Sorry for the incovenience', 'Announcement', NULL, 0, '2026-07-21 05:13:17'),
(201, 19, 'System Update', 'BinBuddy System has been updated!! Sorry for the incovenience', 'Announcement', NULL, 0, '2026-07-21 05:13:17'),
(202, 21, 'System Update', 'BinBuddy System has been updated!! Sorry for the incovenience', 'Announcement', NULL, 0, '2026-07-21 05:13:17'),
(203, 24, 'System Update', 'BinBuddy System has been updated!! Sorry for the incovenience', 'Announcement', NULL, 1, '2026-07-21 05:13:17'),
(204, 18, 'New Illegal Dumping Report', 'Thurga submitted report REP-00030 (Illegal Dumping). Review and assign staff.', '', NULL, 1, '2026-07-21 05:19:29'),
(205, 24, 'Reward Claim Updated', 'Your reward claim status is now Shipped.', 'System', NULL, 1, '2026-07-21 05:28:54'),
(207, 13, 'Community Warning', 'Test', 'System', NULL, 0, '2026-07-21 05:53:01'),
(208, 18, 'New Illegal Dumping Report', 'Thurga submitted report REP-00031 (Illegal Dumping). Review and assign staff.', '', NULL, 0, '2026-07-21 08:37:57'),
(209, 18, 'New Pickup Request', 'Thurga submitted pickup request PU-00026 for Garden Waste.', '', NULL, 1, '2026-07-21 08:39:13'),
(210, 19, 'New Comment', 'Thurga commented on your community post.', 'System', NULL, 0, '2026-07-21 08:40:41'),
(211, 24, 'Report Status Updated', 'Your report REP-00029 has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 08:45:06'),
(212, 18, 'Report Updated by Staff', 'staff updated REP-00029 to In Progress.', '', NULL, 0, '2026-07-21 08:45:06'),
(213, 24, 'Report Status Updated', 'Your report REP-00029 has been updated to In Progress.', 'System', NULL, 1, '2026-07-21 08:45:31'),
(214, 18, 'Report Updated by Staff', 'staff updated REP-00029 to In Progress.', '', NULL, 0, '2026-07-21 08:45:32'),
(215, 27, 'Event Registration Confirmed', 'You are registered for Gotong Royong Surau Al-Ikhsan. Registration No: REG-EV-00012', 'System', NULL, 0, '2026-07-21 08:55:12'),
(216, 27, 'Talk Registration Confirmed', 'You are registered for Go Green. Registration No: REG-TK-00011', 'System', NULL, 0, '2026-07-21 08:55:25'),
(217, 18, 'New Illegal Dumping Report', 'Joao Felix submitted report REP-00032 (Overflowing Bin). Review and assign staff.', '', NULL, 0, '2026-07-21 09:08:52'),
(218, 18, 'New Pickup Request', 'Joao Felix submitted pickup request PU-00027 for Garden Waste.', '', NULL, 0, '2026-07-21 09:09:37'),
(219, 19, 'New Comment', 'Joao Felix commented on your community post.', 'System', NULL, 0, '2026-07-21 09:10:38'),
(220, 19, 'New Like', 'Joao Felix liked your community post.', 'System', NULL, 0, '2026-07-21 09:10:40'),
(222, 18, 'New Reward Claim', 'Joao Felix claimed \"BinBuddy Sticker Pack\" (50 points). Review the redemption request.', '', NULL, 0, '2026-07-21 09:12:35'),
(223, 18, 'New Illegal Dumping Report', 'Joao Felix submitted report REP-00033 (Illegal Dumping). Review and assign staff.', '', NULL, 0, '2026-07-21 13:48:03'),
(224, 18, 'New Pickup Request', 'Joao Felix submitted pickup request PU-00028 for Household Waste.', '', NULL, 0, '2026-07-21 13:48:48'),
(225, 24, 'New Like', 'Joao Felix liked your community post.', 'System', NULL, 1, '2026-07-21 13:49:38'),
(226, 19, 'New Like', 'Joao Felix liked your community post.', 'System', NULL, 0, '2026-07-21 13:49:40'),
(227, 13, 'New Like', 'Joao Felix liked your community post.', 'System', NULL, 0, '2026-07-21 13:49:43'),
(228, 13, 'New Comment', 'Joao Felix commented on your community post.', 'System', NULL, 0, '2026-07-21 13:49:52'),
(229, 30, 'Event Registration Confirmed', 'You are registered for Gotong Royong Surau Al-Ikhsan. Registration No: REG-EV-00014', 'System', NULL, 0, '2026-07-21 13:50:51'),
(230, 30, 'Talk Registration Confirmed', 'You are registered for Go Green. Registration No: REG-TK-00012', 'System', NULL, 0, '2026-07-21 13:51:17'),
(231, 18, 'New Reward Claim', 'Joao Felix claimed \"BinBuddy Sticker Pack\" (50 points). Review the redemption request.', '', NULL, 0, '2026-07-21 13:52:27'),
(232, 25, 'New Event Pending Approval', 'Thurga submitted \"Recycle Day At Sunway\" for organiser approval.', 'System', NULL, 0, '2026-07-21 13:57:05'),
(233, 18, 'New Event Pending Review', 'Thurga submitted \"Recycle Day At Sunway\" for organiser approval.', '', NULL, 0, '2026-07-21 13:57:05'),
(234, 30, 'Report Approved', 'Your report REP-00033 has been approved and forwarded to waste collection staff.', 'System', NULL, 0, '2026-07-21 14:00:38'),
(235, 26, 'New Report Assigned', 'Report REP-00033 has been assigned to you for investigation.', 'System', NULL, 0, '2026-07-21 14:00:38'),
(236, 30, 'Pickup Request Approved', 'Your pickup request PU-00028 has been approved and assigned to collection staff.', 'System', NULL, 0, '2026-07-21 14:01:04'),
(237, 26, 'New Pickup Assignment', 'Pickup request PU-00028 has been assigned to you for processing.', 'System', NULL, 0, '2026-07-21 14:01:04'),
(238, 13, 'Points Updated', 'Your reward points have been updated by the administrator. Current balance: 480 points.', 'System', NULL, 0, '2026-07-21 14:04:24'),
(239, 30, 'Reward Claim Updated', 'Your reward claim status is now Approved.', 'System', NULL, 0, '2026-07-21 14:05:26'),
(240, 30, 'Report Resolved', 'Your report REP-00033 has been resolved by collection staff.', 'System', NULL, 0, '2026-07-21 14:13:01'),
(241, 18, 'Report Updated by Staff', 'staff updated REP-00033 to Resolved.', '', NULL, 0, '2026-07-21 14:13:01'),
(242, 30, 'Collection Status Updated', 'Your collection request PU-00028 status has been updated to In Progress.', 'System', NULL, 0, '2026-07-21 14:13:23'),
(243, 18, 'Pickup Updated by Staff', 'staff updated collection request PU-00028 to In Progress.', '', NULL, 0, '2026-07-21 14:13:23'),
(244, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00028. Please check your assigned tasks.', 'System', NULL, 0, '2026-07-21 14:13:23'),
(245, 30, 'Collection Status Updated', 'Your collection request PU-00028 status has been updated to In Progress.', 'System', NULL, 0, '2026-07-21 14:14:56'),
(246, 18, 'Pickup Updated by Staff', 'staff updated collection request PU-00028 to In Progress.', '', NULL, 0, '2026-07-21 14:14:56'),
(247, 18, 'New Illegal Dumping Report', 'Vanessa Merrell submitted report REP-00034 (Illegal Dumping). Review and assign staff.', '', NULL, 1, '2026-07-21 14:19:40'),
(248, 19, 'Report Approved', 'Your report REP-00034 has been approved and forwarded to waste collection staff.', 'System', NULL, 0, '2026-07-21 14:20:14'),
(249, 26, 'New Report Assigned', 'Report REP-00034 has been assigned to you for investigation.', 'System', NULL, 0, '2026-07-21 14:20:14'),
(250, 19, 'Pickup Scheduled', 'A pickup task (PU-00030) has been created for your report REP-00034 and assigned to a collection driver.', 'System', NULL, 0, '2026-07-21 14:20:37'),
(251, 17, 'New Collection Task Assigned', 'You have been assigned collection task PU-00030 for report REP-00034.', 'System', NULL, 0, '2026-07-21 14:20:37'),
(252, 18, 'Pickup Created from Report', 'staff created PU-00030 from REP-00034 and assigned Driver.', '', NULL, 0, '2026-07-21 14:20:37'),
(253, 19, 'Collection Task Updated', 'Your collection request (PU-00030) is now Completed.', 'System', NULL, 0, '2026-07-21 14:24:12'),
(254, 30, 'Collection Task Updated', 'Your collection request (PU-00028) is now Completed.', 'System', NULL, 0, '2026-07-21 14:25:28'),
(255, 19, 'Collection Task Updated', 'Your collection request (PU-00017) is now Completed.', 'System', NULL, 0, '2026-07-21 14:25:36'),
(256, 19, 'Collection Completed', 'Your collection request (PU-00016) has been completed.', 'System', NULL, 0, '2026-07-21 14:30:20'),
(257, 24, 'Event Approved', 'Your event \"Recycle Day At Sunway\" was approved by organiser and is now visible to residents.', 'System', NULL, 1, '2026-07-21 14:49:16'),
(258, 18, 'New Illegal Dumping Report', 'Thurga submitted report REP-00035 (Missed Collection). Review and assign staff.', '', NULL, 0, '2026-07-22 06:51:01'),
(259, 18, 'New Pickup Request', 'Thurga submitted pickup request PU-00031 for Bulky Waste.', '', NULL, 0, '2026-07-22 07:44:22'),
(260, 24, 'Event Registration Confirmed', 'You are registered for Malaysia Nature Society (MNS). Registration No: REG-EV-00015', 'System', NULL, 0, '2026-07-22 12:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_requests`
--

CREATE TABLE `pickup_requests` (
  `request_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `waste_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `preferred_date` date DEFAULT NULL,
  `preferred_time` time DEFAULT NULL,
  `status` enum('pending','approved','in_progress','completed','cancelled') DEFAULT 'pending',
  `admin_remark` text DEFAULT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL,
  `driver_status` enum('Pending','Completed') DEFAULT 'Pending',
  `staff_remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pickup_requests`
--

INSERT INTO `pickup_requests` (`request_id`, `report_id`, `user_id`, `driver_id`, `waste_type`, `description`, `pickup_location`, `latitude`, `longitude`, `preferred_date`, `preferred_time`, `status`, `admin_remark`, `assigned_staff_id`, `driver_status`, `staff_remark`, `created_at`) VALUES
(9, NULL, 14, 0, 'Recyclable Waste', 'Overflow ', 'Sunway City, Subang Jaya, Selangor', NULL, NULL, '2026-07-16', NULL, 'completed', NULL, NULL, 'Pending', '', '2026-07-16 00:26:19'),
(10, NULL, 14, 17, 'Household Waste', 'coconut water ', 'USJ 1, Subang Jaya, Selangor', NULL, NULL, '2026-07-16', NULL, '', NULL, NULL, 'Completed', '', '2026-07-16 00:39:27'),
(11, NULL, 13, 17, 'Household Waste', 'anything ', 'Seksyen 7, Shah Alam, Selangor', NULL, NULL, '2026-07-18', NULL, 'completed', NULL, NULL, 'Completed', '', '2026-07-17 05:16:25'),
(12, NULL, 13, 18, 'Garden Waste', 'Sorry but i have alot of trash here ', 'Seksyen 7, Shah Alam, Selangor', NULL, NULL, '2026-07-18', NULL, 'completed', NULL, NULL, 'Completed', '', '2026-07-17 15:33:24'),
(13, NULL, 13, 18, 'Household Waste', 'sorry again but some more ', 'USJ 1, Subang Jaya, Selangor', NULL, NULL, '2026-07-18', NULL, 'completed', '', NULL, 'Completed', '', '2026-07-17 15:33:41'),
(14, NULL, 13, 18, 'Garden Waste', 'again', 'SS15, Subang Jaya, Selangor', NULL, NULL, '2026-07-03', NULL, 'completed', NULL, NULL, 'Completed', '', '2026-07-17 15:33:55'),
(15, NULL, 14, 17, 'Garden Waste', 'ee', 'SS15, Subang Jaya, Selangor', NULL, NULL, '2026-07-01', NULL, '', NULL, NULL, 'Pending', '', '2026-07-18 18:07:41'),
(16, NULL, 19, 17, 'Recyclable Waste', 'Event Trash', 'Sunway City, Subang Jaya, Selangor', NULL, NULL, '2026-07-22', NULL, 'completed', NULL, NULL, 'Completed', '', '2026-07-19 15:50:55'),
(17, NULL, 19, 17, 'Garden Waste', 'A lot of dirt', 'SS18, Subang Jaya, Selangor', NULL, NULL, '2026-07-19', NULL, 'completed', '', NULL, 'Completed', '', '2026-07-19 15:57:36'),
(18, 26, 19, 17, 'Overflowing Bin', 'Help solve this', '60-116, Jalan Desa Makmur, Taman Desa, 58100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur', NULL, NULL, '2026-07-20', NULL, 'completed', '', NULL, 'Completed', '', '2026-07-20 00:45:16'),
(19, NULL, 14, NULL, 'Bulky Waste', 'testing', 'Taman Paramount, Petaling Jaya, Selangor', NULL, NULL, '2026-07-24', NULL, 'pending', NULL, NULL, 'Pending', NULL, '2026-07-20 14:51:37'),
(20, NULL, 21, NULL, 'Household Waste', 'Need some help', 'Seksyen 7, Shah Alam, Selangor', NULL, NULL, '2026-07-22', NULL, 'pending', NULL, NULL, 'Pending', NULL, '2026-07-20 15:06:16'),
(21, NULL, 14, 17, 'Garden Waste', 'Help', 'USJ 1, Subang Jaya, Selangor', NULL, NULL, '2026-07-24', '23:49:00', 'completed', '', NULL, 'Completed', '', '2026-07-20 15:49:32'),
(22, NULL, 14, 17, 'Garden Waste', 'huhu', 'Bukit Bintang, Kuala Lumpur', NULL, NULL, '2026-07-24', '01:08:00', 'completed', '', NULL, 'Completed', '', '2026-07-20 16:09:02'),
(23, 28, 21, NULL, 'Overflowing Bin', 'Please solve this issue', 'Puchong', NULL, NULL, '2026-07-20', NULL, 'approved', NULL, NULL, 'Pending', NULL, '2026-07-20 16:46:51'),
(24, NULL, 24, 17, 'Bulky Waste', 'Need some help', 'Sunway City, Subang Jaya, Selangor', NULL, NULL, '2026-07-23', '20:03:00', 'completed', '', NULL, 'Completed', '', '2026-07-21 00:03:36'),
(25, NULL, 24, 17, 'Household Waste', 'Need some help with stuff', 'USJ 1, Subang Jaya, Selangor', NULL, NULL, '2026-07-21', '08:00:00', 'completed', '', NULL, 'Completed', '', '2026-07-21 00:06:28'),
(26, NULL, 24, NULL, 'Garden Waste', 'Pls come and collect fast', 'SS15, Subang Jaya, Selangor', NULL, NULL, '2026-07-21', '16:45:00', 'pending', NULL, NULL, 'Pending', NULL, '2026-07-21 08:39:13'),
(28, NULL, 30, 17, 'Household Waste', 'Help with the pickup please', 'Bukit Bintang, Kuala Lumpur', NULL, NULL, '2026-07-23', '10:50:00', 'completed', '', 26, 'Completed', '', '2026-07-21 13:48:48'),
(29, 29, 24, NULL, 'Missed Collection', 'So Dirty', 'Sunway Mentari Court', NULL, NULL, '2026-07-21', NULL, 'approved', NULL, NULL, 'Pending', NULL, '2026-07-21 14:15:09'),
(30, 34, 19, 17, 'Illegal Dumping', 'Urgent', 'Semenyih', NULL, NULL, '2026-07-21', NULL, 'completed', NULL, 26, 'Completed', NULL, '2026-07-21 14:20:37'),
(31, NULL, 24, NULL, 'Bulky Waste', 'Need Some Help', 'No 12, Jalan Kesuma 6/1d, Bandar Tasik Kesuma', NULL, NULL, '2026-07-24', '15:44:00', 'pending', NULL, NULL, 'Pending', NULL, '2026-07-22 07:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `point_history`
--

CREATE TABLE `point_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`like_id`, `post_id`, `user_id`, `created_at`) VALUES
(16, 22, 21, '2026-07-20 15:12:19'),
(19, 22, 13, '2026-07-21 00:46:35'),
(22, 23, 19, '2026-07-21 00:48:52'),
(23, 22, 19, '2026-07-21 00:48:53'),
(25, 23, 21, '2026-07-21 00:52:57'),
(26, 25, 19, '2026-07-21 00:56:36'),
(27, 25, 14, '2026-07-21 00:57:07'),
(28, 22, 14, '2026-07-21 00:59:02'),
(30, 26, 30, '2026-07-21 13:49:38'),
(31, 25, 30, '2026-07-21 13:49:40'),
(32, 23, 30, '2026-07-21 13:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `reward_id` int(11) NOT NULL,
  `reward_name` varchar(100) DEFAULT NULL,
  `points_required` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`reward_id`, `reward_name`, `points_required`, `description`) VALUES
(1, 'BinBuddy Sticker Pack', 50, 'Official BinBuddy sticker pack'),
(2, 'RM5 Grab Voucher', 100, 'Redeem a RM5 Grab voucher'),
(3, 'BinBuddy Eco Tote Bag', 150, 'Reusable eco-friendly tote bag'),
(4, 'RM10 Touch \'n Go Credit', 200, 'Redeem RM10 Touch n Go eWallet credit'),
(5, 'BinBuddy Water Bottle', 250, 'Reusable stainless steel water bottle'),
(6, 'Eco Water Bottle', 300, 'Redeem a reusable BinBuddy water bottle'),
(7, 'Eco Tote Bag', 400, 'Redeem a reusable BinBuddy tote bag'),
(8, 'BinBuddy T-Shirt', 500, 'Redeem an exclusive BinBuddy T-Shirt'),
(9, 'BinBuddy Hoodie', 700, 'Limited Edition BinBuddy Hoodie'),
(11, 'BinBuddy Sweatpants', 250, 'Original comfy pants');

-- --------------------------------------------------------

--
-- Table structure for table `reward_claims`
--

CREATE TABLE `reward_claims` (
  `claim_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `tracking_no` varchar(50) DEFAULT NULL,
  `expected_delivery` date DEFAULT NULL,
  `status` enum('Pending','Approved','Shipped','Delivered') DEFAULT 'Pending',
  `admin_remark` text DEFAULT NULL,
  `claimed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reward_claims`
--

INSERT INTO `reward_claims` (`claim_id`, `user_id`, `reward_id`, `full_name`, `phone`, `address`, `tracking_no`, `expected_delivery`, `status`, `admin_remark`, `claimed_at`) VALUES
(1, 14, 1, 'Izwan Riduan', '0128821276', 'NO12 Jalan Kesuma 6/1D', '2309878', '2026-07-30', 'Delivered', NULL, '2026-07-17 02:54:00'),
(2, 14, 2, 'Izwan Riduan', '0128821276', 'NO12 Jalan Kesuma 6/1D', '2309878', '2026-07-25', 'Delivered', NULL, '2026-07-17 02:54:11'),
(3, 13, 1, 'Sarah Paulsan', '0128821276', 'NO12 Jalan Kesuma 6/1D', '433567', '2026-07-18', 'Delivered', NULL, '2026-07-17 03:28:57'),
(4, 14, 1, 'Izwan Riduan', '0128821276', 'No 12', '2309878', '2026-07-23', 'Shipped', '', '2026-07-18 18:35:28'),
(5, 13, 1, 'Marget Qualley', '0128821276', 'NO12 Jalan Kesuma 6/1D', NULL, NULL, 'Pending', NULL, '2026-07-19 17:05:23'),
(6, 14, 2, 'Jonathan Anderson', '0128821276', 'No 12 Jalan Kesuma 6/1d', '12245864', '2026-07-21', 'Approved', '', '2026-07-19 23:56:22'),
(7, 14, 1, 'Jonathan Anderson', '0128821276', 'hauha', '222009122', '2026-07-23', 'Shipped', NULL, '2026-07-20 16:08:38'),
(8, 13, 3, 'Steven', '0128821276', 'NO 12 JALAN KESUMA 6/1D', NULL, NULL, 'Pending', NULL, '2026-07-21 01:12:59'),
(9, 24, 1, 'Thurga', '0122621276', '12, Jalan Kesuma 6/1d', '2200981728', '2026-07-24', 'Shipped', '', '2026-07-21 01:31:55'),
(11, 30, 1, 'Joao Felix', '0122621276', 'No 12 Jalan Kesuma 6/1d', '998172123', '2026-07-24', 'Approved', '', '2026-07-21 13:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `reward_history`
--

CREATE TABLE `reward_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `earned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reward_history`
--

INSERT INTO `reward_history` (`history_id`, `user_id`, `points`, `reason`, `created_at`, `earned_at`) VALUES
(2, 14, 25, 'Joined Educational Talk', '2026-07-21 09:28:56', '2026-07-15 04:27:26'),
(3, 14, 30, 'Joined Community Event', '2026-07-21 09:28:56', '2026-07-15 04:31:39'),
(4, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-15 04:37:28'),
(5, 14, 50, 'Illegal Report Resolved (Report #12)', '2026-07-21 09:28:56', '2026-07-15 04:38:20'),
(6, 14, 25, 'Joined Educational Talk', '2026-07-21 09:28:56', '2026-07-15 04:49:18'),
(7, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-16 00:25:31'),
(8, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-16 09:08:47'),
(9, 14, 50, 'Illegal Report Resolved (Report #14)', '2026-07-21 09:28:56', '2026-07-16 09:14:59'),
(10, 14, 50, 'Illegal Report Resolved (Report #13)', '2026-07-21 09:28:56', '2026-07-17 02:33:27'),
(11, 14, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:28:56', '2026-07-17 02:54:00'),
(12, 14, -100, 'Claimed Reward: RM5 Grab Voucher', '2026-07-21 09:28:56', '2026-07-17 02:54:11'),
(13, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 03:19:13'),
(14, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 03:28:39'),
(15, 13, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:28:56', '2026-07-17 03:28:57'),
(16, 13, 50, 'Illegal Report Resolved (Report #16)', '2026-07-21 09:28:56', '2026-07-17 05:21:36'),
(17, 13, 50, 'Illegal Report Resolved (Report #15)', '2026-07-21 09:28:56', '2026-07-17 05:21:40'),
(18, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 16:03:02'),
(19, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 16:11:09'),
(20, 13, 50, 'Illegal Report Resolved (Report #19)', '2026-07-21 09:28:56', '2026-07-17 16:16:53'),
(21, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 16:17:21'),
(22, 13, 50, 'Illegal Report Resolved (Report #20)', '2026-07-21 09:28:56', '2026-07-17 16:19:09'),
(23, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 16:24:17'),
(24, 13, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 16:25:25'),
(25, 13, 50, 'Illegal Report Resolved (Report #23)', '2026-07-21 09:28:56', '2026-07-17 16:26:39'),
(26, 13, 50, 'Illegal Report Resolved (Report #22)', '2026-07-21 09:28:56', '2026-07-17 16:36:03'),
(27, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-17 17:02:27'),
(28, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-18 18:07:26'),
(29, 14, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:28:56', '2026-07-18 18:35:28'),
(30, 19, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-19 15:26:28'),
(31, 13, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:28:56', '2026-07-19 17:05:23'),
(32, 14, 30, 'Joined Community Event', '2026-07-21 09:28:56', '2026-07-19 23:52:27'),
(33, 14, -100, 'Claimed Reward: RM5 Grab Voucher', '2026-07-21 09:28:56', '2026-07-19 23:56:22'),
(34, 13, 50, 'Illegal Report Resolved (Report #21)', '2026-07-21 09:28:56', '2026-07-20 01:02:05'),
(35, 13, 50, 'Illegal Report Resolved (Report #18)', '2026-07-21 09:28:56', '2026-07-20 01:02:15'),
(36, 13, 50, 'Illegal Report Resolved (Report #17)', '2026-07-21 09:28:56', '2026-07-20 01:02:26'),
(37, 19, 50, 'Illegal Report Resolved (Report #26)', '2026-07-21 09:28:56', '2026-07-20 01:03:47'),
(39, 13, 50, 'Admin Added Points - Refund of points', '2026-07-21 09:28:56', '2026-07-20 08:05:24'),
(40, 14, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-20 14:50:16'),
(41, 14, 25, 'Joined Educational Talk', '2026-07-21 09:28:56', '2026-07-20 14:53:26'),
(42, 21, 30, 'Joined Community Event', '2026-07-21 09:28:56', '2026-07-20 14:59:08'),
(43, 21, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-20 15:03:29'),
(44, 14, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:28:56', '2026-07-20 16:08:38'),
(45, 24, 10, 'Submitted Illegal Dumping Report', '2026-07-21 09:28:56', '2026-07-20 23:44:18'),
(46, 24, 30, 'Submitted Pickup Request', '2026-07-21 09:28:56', '2026-07-21 00:06:28'),
(47, 14, 30, 'Registered for Community Event', '2026-07-21 09:28:56', '2026-07-21 00:45:06'),
(48, 14, 25, 'Registered for Educational Talk', '2026-07-21 09:28:56', '2026-07-21 00:45:37'),
(49, 13, 30, 'Registered for Community Event', '2026-07-21 09:28:56', '2026-07-21 00:47:06'),
(50, 19, 25, 'Registered for Educational Talk', '2026-07-21 09:28:56', '2026-07-21 00:48:40'),
(51, 24, 20, 'Joined educational talk #6', '2026-07-21 09:28:56', '2026-07-21 01:08:32'),
(52, 13, -150, 'Claimed Reward: BinBuddy Eco Tote Bag', '2026-07-21 09:28:56', '2026-07-21 01:12:59'),
(53, 24, 10000, 'Admin Added Points - My friend', '2026-07-21 09:28:56', '2026-07-21 01:22:28'),
(54, 24, 22311, 'Admin Added Points - friend', '2026-07-21 09:28:56', '2026-07-21 01:24:41'),
(55, 24, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 09:31:55', '2026-07-21 01:31:55'),
(56, 24, 10, 'Submitted Illegal Dumping Report', '2026-07-21 13:19:29', '2026-07-21 05:19:29'),
(57, 24, 10, 'Submitted Illegal Dumping Report', '2026-07-21 16:37:57', '2026-07-21 08:37:57'),
(58, 24, 30, 'Submitted Pickup Request', '2026-07-21 16:39:13', '2026-07-21 08:39:13'),
(59, 27, 25, 'Joined community event #8', '2026-07-21 16:55:12', '2026-07-21 08:55:12'),
(60, 27, 20, 'Joined educational talk #6', '2026-07-21 16:55:25', '2026-07-21 08:55:25'),
(65, 30, 10, 'Submitted Illegal Dumping Report', '2026-07-21 21:48:03', '2026-07-21 13:48:03'),
(66, 30, 30, 'Submitted Pickup Request', '2026-07-21 21:48:48', '2026-07-21 13:48:48'),
(67, 30, 25, 'Joined community event #8', '2026-07-21 21:50:51', '2026-07-21 13:50:51'),
(68, 30, 20, 'Joined educational talk #6', '2026-07-21 21:51:17', '2026-07-21 13:51:17'),
(69, 30, -50, 'Claimed Reward: BinBuddy Sticker Pack', '2026-07-21 21:52:27', '2026-07-21 13:52:27'),
(70, 13, 100, 'Admin Added Points - Loyal Customer', '2026-07-21 22:04:24', '2026-07-21 14:04:24'),
(71, 30, 50, 'Illegal Report Resolved (Report #33)', '2026-07-21 22:13:01', '2026-07-21 14:13:01'),
(72, 19, 10, 'Submitted Illegal Dumping Report', '2026-07-21 22:19:40', '2026-07-21 14:19:40'),
(73, 24, 10, 'Submitted Illegal Dumping Report', '2026-07-22 14:51:01', '2026-07-22 06:51:01'),
(74, 24, 30, 'Submitted Pickup Request', '2026-07-22 15:44:22', '2026-07-22 07:44:22'),
(75, 24, 25, 'Joined community event #9', '2026-07-22 20:50:42', '2026-07-22 12:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `start_location` varchar(255) DEFAULT NULL,
  `end_location` varchar(255) DEFAULT NULL,
  `route_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `talk_participants`
--

CREATE TABLE `talk_participants` (
  `participant_id` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('registered','cancelled') DEFAULT 'registered',
  `registration_no` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `emergency_contact` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talk_participants`
--

INSERT INTO `talk_participants` (`participant_id`, `talk_id`, `user_id`, `joined_at`, `status`, `registration_no`, `contact_phone`, `emergency_contact`) VALUES
(8, 6, 14, '2026-07-21 00:45:37', 'registered', 'REG-TK-00008', '0128821276', ''),
(9, 6, 19, '2026-07-21 00:48:40', 'registered', 'REG-TK-00009', '0134437890', ''),
(10, 6, 24, '2026-07-21 01:08:32', 'registered', 'REG-TK-00010', '0122621276', ''),
(11, 6, 27, '2026-07-21 08:55:25', 'registered', 'REG-TK-00011', '017324500', ''),
(12, 6, 30, '2026-07-21 13:51:17', 'registered', 'REG-TK-00012', '0122621276', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('resident','admin','staff','driver','organiser') DEFAULT 'resident',
  `points` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_status` enum('Active','Suspended') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `phone`, `address`, `profile_picture`, `role`, `points`, `created_at`, `account_status`) VALUES
(13, 'Steven', 'user2@gmail.com', '$2y$10$NvcKBdF9G12bxX.JoGW0MOYuyZ8y3oDc/ofMyWYW1.F6L21Z8Vduq', '0128821276', '', '1784567387_Screenshot2026-06-07093536.png', 'resident', 480, '2026-07-02 15:16:06', 'Active'),
(14, 'Jude Bellingham', 'user1@gmail.com', '$2y$10$Vrrn6RtqFa3K.lUHKv1THuwgZYz19w6/1XMYv98rwGaPR/Hniovly', '0128821276', '', '1784091112_jude.webp', 'resident', 60, '2026-07-15 01:03:33', 'Active'),
(17, 'Driver', 'driver@gmail.com', '$2y$10$C40Q/fCQOYRNAbXyx1Ft4eLAohfRlJ02WF5foNPRHL3oWAGj1Hh0S', '', '', NULL, 'driver', 0, '2026-07-17 05:18:25', 'Active'),
(18, 'Admin', 'admin@gmail.com', '$2y$10$mECcD7Y6mYd3fMCcRAWQiuD/1xv7xvtDk3Dl5GlnJQGBFkG/MZxKu', '0128821276', '', '1784594110_Screenshot2026-06-08084049.png', 'admin', 0, '2026-07-17 15:12:33', 'Active'),
(19, 'Vanessa Merrell', 'user3@gmail.com', '$2y$10$oH.m27TU/TXYiBn/8gJkeebCj3VhdoIEz3787FYfw4gbBKt5.UXzC', '0134437890', '', '1784594904_images1.jpg', 'resident', 95, '2026-07-19 14:25:52', 'Active'),
(21, 'Sarah', 'user4@gmail.com', '$2y$10$b2b3N299U.K1VS7YdHJEtOc.z2c2fhWn/Bkz66TpzGGoCk9JSD3SS', '', NULL, NULL, 'resident', 40, '2026-07-20 14:58:44', 'Active'),
(24, 'Thurga', 'thurga@gmail.com', '$2y$10$Pdm7sRq/6mLsXZQkmJolZOComZd.JLLJSkkUwMXu83FvM5laSmC8a', '0122621276', '', '', 'resident', 32436, '2026-07-20 23:34:02', 'Active'),
(25, 'organiser', 'organiser@gmail.com', '$2y$10$zpR7ak0wEJP8AF2cBWHspufsfg8YvBb1A9JkQReuszYkPLptl1EM2', '', '', '', 'organiser', 0, '2026-07-21 00:35:53', 'Active'),
(26, 'staff', 'staff@gmail.com', '$2y$10$GzQ/gRYNSKgZV1flsEG/NufL2gk6MzS.xKF7pjhE/4EmQp7zzDyu.', '', NULL, NULL, 'staff', 0, '2026-07-21 00:36:57', 'Active'),
(27, 'Santhiya', 'santhiya@gmail.com', '$2y$10$Qy0w/Nyy12c1Wi4dYU2gA.GCb.FXvDlqkKB2HPyjJ8EdLouGo0nLi', '017324500', NULL, NULL, 'resident', 45, '2026-07-21 08:49:29', 'Active'),
(28, 'Manveer Kaur', 'manveer@gmail.com', '$2y$10$mVur/eo0Jl0rer9MFrmw8O1kuXspj1hGAIPR.FU2i1xLp15jqi.E2', '', NULL, NULL, 'resident', 0, '2026-07-21 09:06:03', 'Active'),
(30, 'Joao Felix', 'jf@gmail.com', '$2y$10$6arrAxb/jy5vCj.PhsuzdOgVgxDYE.hv1FF0fG/xw8cjtgE16FRPO', '0122621276', 'No 12 Jalan Kesuma 6/1d', '1784642056_jude.webp', 'resident', 85, '2026-07-21 13:46:37', 'Active'),
(31, 'rayna', 'rayna@gmail.com', '$2y$10$iKpQaV4JQY520nS/oS4oLuwxE/.CSvEisWPT/.gApPj/OLmW/KByC', '', NULL, NULL, 'resident', 0, '2026-07-22 06:02:09', 'Active'),
(32, 'Johnson', 'Johnson@gmail.com', '$2y$10$CE/k4iNq8Mjbnk3M2LFb0uprXvEKHOXT0G4uKGWzcJb79nunJrCtq', '', NULL, NULL, 'resident', 0, '2026-07-22 06:08:36', 'Active'),
(33, 'Izwan', 'izwan@gmail.com', '$2y$10$t.4q7zNlwl.C4bNGm2yiJuSdeGVHH4TYhMzs2yzVf7UrXpeVOqAk2', '0195751276', NULL, NULL, 'resident', 0, '2026-07-22 08:43:06', 'Active'),
(34, 'puahoongze', 'pua@gmail.com', '$2y$10$p5f54i.a4fnJ71Ycim9GvOTWvk/sXbrXJUvhE4FVKN0iM72KnYCKq', '', NULL, NULL, 'resident', 0, '2026-07-22 08:58:24', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user_badges`
--

CREATE TABLE `user_badges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_badges`
--

INSERT INTO `user_badges` (`id`, `user_id`, `badge_id`) VALUES
(1, 14, 1),
(2, 14, 2),
(3, 13, 1),
(4, 13, 2),
(5, 13, 3),
(6, 13, 4),
(7, 19, 1),
(8, 24, 1),
(10, 30, 1),
(11, 24, 2),
(12, 24, 3),
(13, 24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE `user_points` (
  `user_id` int(11) NOT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_logs`
--
ALTER TABLE `ai_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`badge_id`);

--
-- Indexes for table `badge_tiers`
--
ALTER TABLE `badge_tiers`
  ADD PRIMARY KEY (`tier_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `bins`
--
ALTER TABLE `bins`
  ADD PRIMARY KEY (`bin_id`);

--
-- Indexes for table `collection_history`
--
ALTER TABLE `collection_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `collection_tasks`
--
ALTER TABLE `collection_tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `community_reports`
--
ALTER TABLE `community_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `educational_talks`
--
ALTER TABLE `educational_talks`
  ADD PRIMARY KEY (`talk_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `organiser_id` (`organiser_id`);

--
-- Indexes for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD PRIMARY KEY (`participant_id`),
  ADD UNIQUE KEY `unique_event_user` (`event_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `illegal_reports`
--
ALTER TABLE `illegal_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_staff_id` (`assigned_staff_id`);

--
-- Indexes for table `moderation_logs`
--
ALTER TABLE `moderation_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `point_history`
--
ALTER TABLE `point_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `unique_like` (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`reward_id`);

--
-- Indexes for table `reward_claims`
--
ALTER TABLE `reward_claims`
  ADD PRIMARY KEY (`claim_id`);

--
-- Indexes for table `reward_history`
--
ALTER TABLE `reward_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `talk_participants`
--
ALTER TABLE `talk_participants`
  ADD PRIMARY KEY (`participant_id`),
  ADD UNIQUE KEY `unique_talk_user` (`talk_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Indexes for table `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_logs`
--
ALTER TABLE `ai_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `badge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `badge_tiers`
--
ALTER TABLE `badge_tiers`
  MODIFY `tier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bins`
--
ALTER TABLE `bins`
  MODIFY `bin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `collection_history`
--
ALTER TABLE `collection_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `collection_tasks`
--
ALTER TABLE `collection_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `community_reports`
--
ALTER TABLE `community_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `educational_talks`
--
ALTER TABLE `educational_talks`
  MODIFY `talk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event_participants`
--
ALTER TABLE `event_participants`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `illegal_reports`
--
ALTER TABLE `illegal_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `moderation_logs`
--
ALTER TABLE `moderation_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `point_history`
--
ALTER TABLE `point_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reward_claims`
--
ALTER TABLE `reward_claims`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reward_history`
--
ALTER TABLE `reward_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `talk_participants`
--
ALTER TABLE `talk_participants`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_badges`
--
ALTER TABLE `user_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ai_logs`
--
ALTER TABLE `ai_logs`
  ADD CONSTRAINT `ai_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `collection_history`
--
ALTER TABLE `collection_history`
  ADD CONSTRAINT `collection_history_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `collection_tasks` (`task_id`);

--
-- Constraints for table `collection_tasks`
--
ALTER TABLE `collection_tasks`
  ADD CONSTRAINT `collection_tasks_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `collection_tasks_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `collection_tasks_ibfk_3` FOREIGN KEY (`request_id`) REFERENCES `pickup_requests` (`request_id`),
  ADD CONSTRAINT `collection_tasks_ibfk_4` FOREIGN KEY (`report_id`) REFERENCES `illegal_reports` (`report_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`post_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `educational_talks`
--
ALTER TABLE `educational_talks`
  ADD CONSTRAINT `educational_talks_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`organiser_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD CONSTRAINT `event_participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `event_participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `event_registrations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `illegal_reports`
--
ALTER TABLE `illegal_reports`
  ADD CONSTRAINT `illegal_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `illegal_reports_ibfk_2` FOREIGN KEY (`assigned_staff_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD CONSTRAINT `pickup_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `point_history`
--
ALTER TABLE `point_history`
  ADD CONSTRAINT `point_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`post_id`),
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `talk_participants`
--
ALTER TABLE `talk_participants`
  ADD CONSTRAINT `talk_participants_ibfk_1` FOREIGN KEY (`talk_id`) REFERENCES `educational_talks` (`talk_id`),
  ADD CONSTRAINT `talk_participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD CONSTRAINT `user_badges_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_badges_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`badge_id`);

--
-- Constraints for table `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
