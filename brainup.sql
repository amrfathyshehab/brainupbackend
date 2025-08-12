-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 12, 2025 at 07:07 AM
-- Server version: 10.11.11-MariaDB-0+deb12u1
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brainup`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `api_token`, `mobile`, `profile_pic`, `deleted_at`) VALUES
(1, 'prodigy', 'prodigy', '$2y$10$ER5/ccNy13tFn7zE.ac9puQ8yTxgtbDqDo/Zr80SJ1J8NbVjz5ybi', NULL, NULL, '2025-04-21 20:11:56', '', '', '1705872745-209.jpg', NULL),
(38, 'Nour Mustafa', 'Nour', '$2y$10$0V8120e/H9hGB9SMB9ChU.X9jUTf7pUy.zTmK0FtngDRuszo0rBuK', NULL, '2024-08-06 16:43:12', '2024-08-06 16:43:12', NULL, '01063165009', '1722951792-562.jpg', NULL),
(39, 'Jana Halaby', 'Jana-Halaby', '$2y$10$HzUc8wzJiUM1fxoDtDw/gOvWCktSaVwl71yG4Kr8thnVUfOQOTdk.', NULL, '2024-08-06 16:48:25', '2024-08-06 16:48:25', NULL, '01277961775', '1722952105-469.jpg', NULL),
(40, 'Mariam Osman', 'Mariam-Osman', '$2y$10$.ZbJaQ43U6vMv4kZk7CVuu3SU9pCGgWGTVWi9CQGyu4/IAuSjNs4q', NULL, '2024-08-06 16:55:16', '2024-08-06 16:55:16', NULL, '01001004308', '1722952516-387.jpg', NULL),
(41, 'Mariz Nabil', 'Mariz-Nabil', '$2y$10$ei1EjzW2GkEY9PmBmSpDTOK8kuX22fXEFGYjs6VRvcigWi352eYoO', NULL, '2024-08-06 16:59:18', '2024-08-06 16:59:18', NULL, '01222257836', '1722952758-655.jpg', NULL),
(42, 'Christy Ahmous', 'Christy', '$2y$10$U4SNxGAvXnl6vmBEqTadEulSRFNnxJHnlb.osCa30usuVZC1anDE.', NULL, '2024-08-06 17:03:32', '2024-08-06 17:03:32', NULL, '01228588169', '1722953012-431.jpg', NULL),
(43, 'Menna Hossam', 'Menna', '$2y$10$LqTAMFUf5eNebKEAgCxi9um3CEotELM95nSOcS68yDNotai.vfOyS', NULL, '2024-08-06 17:06:03', '2024-08-06 17:06:03', NULL, '01011825619', '1722953163-368.jpg', NULL),
(44, 'omar', 'omar', '$2y$10$nAA7vI1huJEGFUfm9Up5OueULJ4jYuymWKPzd2NxitJZ0yDJGBjLS', NULL, '2024-08-06 17:06:03', '2024-08-06 17:06:03', NULL, '01011825619', '1722953163-368.jpg', NULL),
(47, 'Mohanad Ahmed', 'Mohanad', '$2y$10$q5LZcrR2W/ojMiQ.cZPdou60zIaDMZJ8.A1LhDXG6LAtDJdtW0FsG', NULL, '2024-09-07 01:56:58', '2024-09-07 01:56:58', NULL, '01206103056', '1725663418-736.jpg', NULL),
(48, 'Ms. Hoda Saeed', 'hodasaeed', '$2y$10$OM3uvVaWwUitxCD4mS2Av.XBnG3RLtmJim/.JvKipF5gh2T0kaTNm', NULL, '2024-11-09 20:00:56', '2025-04-21 20:08:17', NULL, '01210017078', '1731175256-371.jpg', '2025-04-21 20:08:17'),
(49, 'Safy Moustafa', 'safymoustafa', '$2y$10$YtdfExKTrBkVSqrMlPrAXef9nHdl93xXNvgRAd0n.AMYUvrmW61La', NULL, '2024-11-23 17:04:05', '2024-11-23 17:04:05', NULL, '01098984864', '1732374245-351.jpg', NULL),
(50, 'Huda Elsabagh', 'HudaElsabagh', '$2y$10$2tELbg3DT/Hr6H8vAeigjOGfvJtITF2X1GH9cMSP5J3J1b1rTOmPS', NULL, '2025-04-22 11:43:26', '2025-04-22 11:43:26', NULL, '01210017078', '1745315006-548.jpg', NULL),
(51, 'Amira fathy', 'AMIRAFATHY', '$2y$10$Pv3iexe2iFvUGYEqIqcHYeK8VWe5qwEydYVKJyrGMTfGft3Yhm5Bm', NULL, '2025-04-22 11:48:03', '2025-04-22 11:48:03', NULL, '01070283066', '1745315282-668.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT 0,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `student_quiz` int(11) DEFAULT NULL,
  `student_homework` tinyint(4) DEFAULT NULL,
  `attend_at` datetime NOT NULL,
  `attend_by` bigint(2) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendancequiz`
--

CREATE TABLE `attendancequiz` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `degree_quiz` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_session`
--

CREATE TABLE `attendance_session` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `quiz_degree` int(11) DEFAULT NULL,
  `days` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_session`
--

INSERT INTO `attendance_session` (`id`, `name`, `group_id`, `quiz_degree`, `days`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'omarrrrrr', 1, NULL, 0, '2024-08-04 14:51:46', '2024-08-04 17:19:06', NULL),
(10, 'omar', 1, NULL, 0, '2024-08-04 15:09:10', '2024-08-04 15:09:10', NULL),
(11, 'omar', 1, NULL, 0, '2024-08-04 15:13:59', '2024-08-04 15:13:59', NULL),
(12, 'SEC.2 SCI, & ARTS 20/9', 6, NULL, 0, '2024-09-19 20:09:52', '2024-09-19 20:09:52', NULL),
(13, 'SEC.2 SCI, & ARTS 20/9', 6, NULL, 0, '2024-09-19 20:14:56', '2024-09-22 22:30:33', '2024-09-22 22:30:33'),
(14, 'SEC.2 SCI, & ARTS 20/9', 6, NULL, 0, '2024-09-19 20:15:34', '2024-09-21 05:46:25', '2024-09-21 05:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `bank_questions_sets`
--

CREATE TABLE `bank_questions_sets` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lecture_id` int(10) UNSIGNED DEFAULT NULL,
  `easy` int(11) NOT NULL,
  `medium` int(11) NOT NULL,
  `hard` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_questions_sets`
--

INSERT INTO `bank_questions_sets` (`id`, `category_id`, `lecture_id`, `easy`, `medium`, `hard`, `quiz_id`, `homework_id`, `exam_id`, `created_at`, `updated_at`) VALUES
(3, 13, 50, 19, 19, 19, 8, NULL, NULL, '2024-11-08 16:41:48', '2024-11-08 16:48:08'),
(4, 10, 50, 3, 3, 3, NULL, 12, NULL, '2024-11-08 17:28:35', '2024-11-08 17:28:35'),
(7, 10, 148, 22, 22, 22, NULL, 14, NULL, '2025-08-02 14:15:12', '2025-08-02 14:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `buying_history`
--

CREATE TABLE `buying_history` (
  `id` int(11) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `buy_at` datetime NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `code_id` int(10) UNSIGNED DEFAULT NULL,
  `add_to_session_assistant` bigint(20) UNSIGNED DEFAULT NULL,
  `quiz_done` tinyint(4) NOT NULL DEFAULT 0,
  `homework_done` tinyint(4) NOT NULL DEFAULT 0,
  `expire_at` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `method` varchar(255) NOT NULL DEFAULT 'code',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buying_history`
--

INSERT INTO `buying_history` (`id`, `lecture_id`, `price`, `buy_at`, `student_id`, `code_id`, `add_to_session_assistant`, `quiz_done`, `homework_done`, `expire_at`, `views`, `method`, `created_at`, `updated_at`) VALUES
(131, 92, 60, '2025-03-16 13:00:09', 409, NULL, 1, 0, 0, '2025-06-12 13:00:09', 5, 'code', '2025-03-16 13:00:09', '2025-03-16 13:00:09'),
(132, 87, 60, '2025-04-21 12:46:01', 407, NULL, 1, 0, 0, '2025-07-20 12:46:01', 5, 'code', '2025-04-21 12:46:01', '2025-04-21 12:46:01'),
(138, 151, 12, '2025-08-04 14:21:19', 416, 1501, NULL, 0, 0, '2025-08-26 14:21:19', 22, 'code', '2025-08-04 14:21:19', '2025-08-04 14:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stage` tinyint(4) NOT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 0,
  `img` varchar(255) NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `name`, `description`, `stage`, `visibility`, `img`, `teacher_id`, `section`, `updated_at`, `created_at`) VALUES
(20, 'test', NULL, 3, 0, '1728725435-194.png', 3, 'arts', '2024-10-12 12:30:35', '2024-10-12 12:30:35'),
(23, 'academiclevel ||', 'academiclevel ||', 1, 0, '1730887117-183.jpg', 3, NULL, '2024-11-06 11:58:37', '2024-11-06 11:58:37'),
(24, 'test new 2025', 'test for natlix development', 2, 1, '1730966585-723.jpg', 3, 'scientific', '2024-11-07 10:03:50', '2024-11-07 10:03:05'),
(25, 'test new 99999999', 'تيست', 1, 0, '1730971474-387.jpg', 3, NULL, '2024-11-07 11:24:52', '2024-11-07 11:24:34'),
(29, 'test company', 'dddddddddsss', 33, 0, '1731595136-785.png', 3, NULL, '2024-11-14 16:39:21', '2024-11-14 16:38:56'),
(30, 'test0', 'sdsadssdsa', 1, 0, '1731595229-902.png', 3, NULL, '2024-11-14 16:40:29', '2024-11-14 16:40:29'),
(32, 'tessss', 'qqqqqqq', 11, 1, '1754132894-708.png', 26, NULL, '2025-08-02 14:08:35', '2025-08-02 14:08:14'),
(35, 'test', 'wwwww', 1, 1, '1754306240-162.png', 10, NULL, '2025-08-04 14:17:26', '2025-08-04 14:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `governorate_id` int(11) NOT NULL,
  `city_name_ar` varchar(200) NOT NULL,
  `city_name_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `governorate_id`, `city_name_ar`, `city_name_en`) VALUES
(1, 1, '15 مايو', '15 May'),
(2, 1, 'الازبكية', 'Al Azbakeyah'),
(3, 1, 'البساتين', 'Al Basatin'),
(4, 1, 'التبين', 'Tebin'),
(5, 1, 'الخليفة', 'El-Khalifa'),
(6, 1, 'الدراسة', 'El darrasa'),
(7, 1, 'الدرب الاحمر', 'Aldarb Alahmar'),
(8, 1, 'الزاوية الحمراء', 'Zawya al-Hamra'),
(9, 1, 'الزيتون', 'El-Zaytoun'),
(10, 1, 'الساحل', 'Sahel'),
(11, 1, 'السلام', 'El Salam'),
(12, 1, 'السيدة زينب', 'Sayeda Zeinab'),
(13, 1, 'الشرابية', 'El Sharabeya'),
(14, 1, 'مدينة الشروق', 'Shorouk'),
(15, 1, 'الظاهر', 'El Daher'),
(16, 1, 'العتبة', 'Ataba'),
(17, 1, 'القاهرة الجديدة', 'New Cairo'),
(18, 1, 'المرج', 'El Marg'),
(19, 1, 'عزبة النخل', 'Ezbet el Nakhl'),
(20, 1, 'المطرية', 'Matareya'),
(21, 1, 'المعادى', 'Maadi'),
(22, 1, 'المعصرة', 'Maasara'),
(23, 1, 'المقطم', 'Mokattam'),
(24, 1, 'المنيل', 'Manyal'),
(25, 1, 'الموسكى', 'Mosky'),
(26, 1, 'النزهة', 'Nozha'),
(27, 1, 'الوايلى', 'Waily'),
(28, 1, 'باب الشعرية', 'Bab al-Shereia'),
(29, 1, 'بولاق', 'Bolaq'),
(30, 1, 'جاردن سيتى', 'Garden City'),
(31, 1, 'حدائق القبة', 'Hadayek El-Kobba'),
(32, 1, 'حلوان', 'Helwan'),
(33, 1, 'دار السلام', 'Dar Al Salam'),
(34, 1, 'شبرا', 'Shubra'),
(35, 1, 'طره', 'Tura'),
(36, 1, 'عابدين', 'Abdeen'),
(37, 1, 'عباسية', 'Abaseya'),
(38, 1, 'عين شمس', 'Ain Shams'),
(39, 1, 'مدينة نصر', 'Nasr City'),
(40, 1, 'مصر الجديدة', 'New Heliopolis'),
(41, 1, 'مصر القديمة', 'Masr Al Qadima'),
(42, 1, 'منشية ناصر', 'Mansheya Nasir'),
(43, 1, 'مدينة بدر', 'Badr City'),
(44, 1, 'مدينة العبور', 'Obour City'),
(45, 1, 'وسط البلد', 'Cairo Downtown'),
(46, 1, 'الزمالك', 'Zamalek'),
(47, 1, 'قصر النيل', 'Kasr El Nile'),
(48, 1, 'الرحاب', 'Rehab'),
(49, 1, 'القطامية', 'Katameya'),
(50, 1, 'مدينتي', 'Madinty'),
(51, 1, 'روض الفرج', 'Rod Alfarag'),
(52, 1, 'شيراتون', 'Sheraton'),
(53, 1, 'الجمالية', 'El-Gamaleya'),
(54, 1, 'العاشر من رمضان', '10th of Ramadan City'),
(55, 1, 'الحلمية', 'Helmeyat Alzaytoun'),
(56, 1, 'النزهة الجديدة', 'New Nozha'),
(57, 1, 'العاصمة الإدارية', 'Capital New'),
(58, 2, 'الجيزة', 'Giza'),
(59, 2, 'السادس من أكتوبر', 'Sixth of October'),
(60, 2, 'الشيخ زايد', 'Cheikh Zayed'),
(61, 2, 'الحوامدية', 'Hawamdiyah'),
(62, 2, 'البدرشين', 'Al Badrasheen'),
(63, 2, 'الصف', 'Saf'),
(64, 2, 'أطفيح', 'Atfih'),
(65, 2, 'العياط', 'Al Ayat'),
(66, 2, 'الباويطي', 'Al-Bawaiti'),
(67, 2, 'منشأة القناطر', 'ManshiyetAl Qanater'),
(68, 2, 'أوسيم', 'Oaseem'),
(69, 2, 'كرداسة', 'Kerdasa'),
(70, 2, 'أبو النمرس', 'Abu Nomros'),
(71, 2, 'كفر غطاطي', 'Kafr Ghati'),
(72, 2, 'منشأة البكاري', 'Manshiyet Al Bakari'),
(73, 2, 'الدقى', 'Dokki'),
(74, 2, 'العجوزة', 'Agouza'),
(75, 2, 'الهرم', 'Haram'),
(76, 2, 'الوراق', 'Warraq'),
(77, 2, 'امبابة', 'Imbaba'),
(78, 2, 'بولاق الدكرور', 'Boulaq Dakrour'),
(79, 2, 'الواحات البحرية', 'Al Wahat Al Baharia'),
(80, 2, 'العمرانية', 'Omraneya'),
(81, 2, 'المنيب', 'Moneeb'),
(82, 2, 'بين السرايات', 'Bin Alsarayat'),
(83, 2, 'الكيت كات', 'Kit Kat'),
(84, 2, 'المهندسين', 'Mohandessin'),
(85, 2, 'فيصل', 'Faisal'),
(86, 2, 'أبو رواش', 'Abu Rawash'),
(87, 2, 'حدائق الأهرام', 'Hadayek Alahram'),
(88, 2, 'الحرانية', 'Haraneya'),
(89, 2, 'حدائق اكتوبر', 'Hadayek October'),
(90, 2, 'صفط اللبن', 'Saft Allaban'),
(91, 2, 'القرية الذكية', 'Smart Village'),
(92, 2, 'ارض اللواء', 'Ard Ellwaa'),
(93, 3, 'ابو قير', 'Abu Qir'),
(94, 3, 'الابراهيمية', 'Al Ibrahimeyah'),
(95, 3, 'الأزاريطة', 'Azarita'),
(96, 3, 'الانفوشى', 'Anfoushi'),
(97, 3, 'الدخيلة', 'Dekheila'),
(98, 3, 'السيوف', 'El Soyof'),
(99, 3, 'العامرية', 'Ameria'),
(100, 3, 'اللبان', 'El Labban'),
(101, 3, 'المفروزة', 'Al Mafrouza'),
(102, 3, 'المنتزه', 'El Montaza'),
(103, 3, 'المنشية', 'Mansheya'),
(104, 3, 'الناصرية', 'Naseria'),
(105, 3, 'امبروزو', 'Ambrozo'),
(106, 3, 'باب شرق', 'Bab Sharq'),
(107, 3, 'برج العرب', 'Bourj Alarab'),
(108, 3, 'ستانلى', 'Stanley'),
(109, 3, 'سموحة', 'Smouha'),
(110, 3, 'سيدى بشر', 'Sidi Bishr'),
(111, 3, 'شدس', 'Shads'),
(112, 3, 'غيط العنب', 'Gheet Alenab'),
(113, 3, 'فلمينج', 'Fleming'),
(114, 3, 'فيكتوريا', 'Victoria'),
(115, 3, 'كامب شيزار', 'Camp Shizar'),
(116, 3, 'كرموز', 'Karmooz'),
(117, 3, 'محطة الرمل', 'Mahta Alraml'),
(118, 3, 'مينا البصل', 'Mina El-Basal'),
(119, 3, 'العصافرة', 'Asafra'),
(120, 3, 'العجمي', 'Agamy'),
(121, 3, 'بكوس', 'Bakos'),
(122, 3, 'بولكلي', 'Boulkly'),
(123, 3, 'كليوباترا', 'Cleopatra'),
(124, 3, 'جليم', 'Glim'),
(125, 3, 'المعمورة', 'Al Mamurah'),
(126, 3, 'المندرة', 'Al Mandara'),
(127, 3, 'محرم بك', 'Moharam Bek'),
(128, 3, 'الشاطبي', 'Elshatby'),
(129, 3, 'سيدي جابر', 'Sidi Gaber'),
(130, 3, 'الساحل الشمالي', 'North Coast/sahel'),
(131, 3, 'الحضرة', 'Alhadra'),
(132, 3, 'العطارين', 'Alattarin'),
(133, 3, 'سيدي كرير', 'Sidi Kerir'),
(134, 3, 'الجمرك', 'Elgomrok'),
(135, 3, 'المكس', 'Al Max'),
(136, 3, 'مارينا', 'Marina'),
(137, 4, 'المنصورة', 'Mansoura'),
(138, 4, 'طلخا', 'Talkha'),
(139, 4, 'ميت غمر', 'Mitt Ghamr'),
(140, 4, 'دكرنس', 'Dekernes'),
(141, 4, 'أجا', 'Aga'),
(142, 4, 'منية النصر', 'Menia El Nasr'),
(143, 4, 'السنبلاوين', 'Sinbillawin'),
(144, 4, 'الكردي', 'El Kurdi'),
(145, 4, 'بني عبيد', 'Bani Ubaid'),
(146, 4, 'المنزلة', 'Al Manzala'),
(147, 4, 'تمي الأمديد', 'tami al\'amdid'),
(148, 4, 'الجمالية', 'aljamalia'),
(149, 4, 'شربين', 'Sherbin'),
(150, 4, 'المطرية', 'Mataria'),
(151, 4, 'بلقاس', 'Belqas'),
(152, 4, 'ميت سلسيل', 'Meet Salsil'),
(153, 4, 'جمصة', 'Gamasa'),
(154, 4, 'محلة دمنة', 'Mahalat Damana'),
(155, 4, 'نبروه', 'Nabroh'),
(156, 5, 'الغردقة', 'Hurghada'),
(157, 5, 'رأس غارب', 'Ras Ghareb'),
(158, 5, 'سفاجا', 'Safaga'),
(159, 5, 'القصير', 'El Qusiar'),
(160, 5, 'مرسى علم', 'Marsa Alam'),
(161, 5, 'الشلاتين', 'Shalatin'),
(162, 5, 'حلايب', 'Halaib'),
(163, 5, 'الدهار', 'Aldahar'),
(164, 6, 'دمنهور', 'Damanhour'),
(165, 6, 'كفر الدوار', 'Kafr El Dawar'),
(166, 6, 'رشيد', 'Rashid'),
(167, 6, 'إدكو', 'Edco'),
(168, 6, 'أبو المطامير', 'Abu al-Matamir'),
(169, 6, 'أبو حمص', 'Abu Homs'),
(170, 6, 'الدلنجات', 'Delengat'),
(171, 6, 'المحمودية', 'Mahmoudiyah'),
(172, 6, 'الرحمانية', 'Rahmaniyah'),
(173, 6, 'إيتاي البارود', 'Itai Baroud'),
(174, 6, 'حوش عيسى', 'Housh Eissa'),
(175, 6, 'شبراخيت', 'Shubrakhit'),
(176, 6, 'كوم حمادة', 'Kom Hamada'),
(177, 6, 'بدر', 'Badr'),
(178, 6, 'وادي النطرون', 'Wadi Natrun'),
(179, 6, 'النوبارية الجديدة', 'New Nubaria'),
(180, 6, 'النوبارية', 'Alnoubareya'),
(181, 7, 'الفيوم', 'Fayoum'),
(182, 7, 'الفيوم الجديدة', 'Fayoum El Gedida'),
(183, 7, 'طامية', 'Tamiya'),
(184, 7, 'سنورس', 'Snores'),
(185, 7, 'إطسا', 'Etsa'),
(186, 7, 'إبشواي', 'Epschway'),
(187, 7, 'يوسف الصديق', 'Yusuf El Sediaq'),
(188, 7, 'الحادقة', 'Hadqa'),
(189, 7, 'اطسا', 'Atsa'),
(190, 7, 'الجامعة', 'Algamaa'),
(191, 7, 'السيالة', 'Sayala'),
(192, 8, 'طنطا', 'Tanta'),
(193, 8, 'المحلة الكبرى', 'Al Mahalla Al Kobra'),
(194, 8, 'كفر الزيات', 'Kafr El Zayat'),
(195, 8, 'زفتى', 'Zefta'),
(196, 8, 'السنطة', 'El Santa'),
(197, 8, 'قطور', 'Qutour'),
(198, 8, 'بسيون', 'Basion'),
(199, 8, 'سمنود', 'Samannoud'),
(200, 9, 'الإسماعيلية', 'Ismailia'),
(201, 9, 'فايد', 'Fayed'),
(202, 9, 'القنطرة شرق', 'Qantara Sharq'),
(203, 9, 'القنطرة غرب', 'Qantara Gharb'),
(204, 9, 'التل الكبير', 'El Tal El Kabier'),
(205, 9, 'أبو صوير', 'Abu Sawir'),
(206, 9, 'القصاصين الجديدة', 'Kasasien El Gedida'),
(207, 9, 'نفيشة', 'Nefesha'),
(208, 9, 'الشيخ زايد', 'Sheikh Zayed'),
(209, 10, 'شبين الكوم', 'Shbeen El Koom'),
(210, 10, 'مدينة السادات', 'Sadat City'),
(211, 10, 'منوف', 'Menouf'),
(212, 10, 'سرس الليان', 'Sars El-Layan'),
(213, 10, 'أشمون', 'Ashmon'),
(214, 10, 'الباجور', 'Al Bagor'),
(215, 10, 'قويسنا', 'Quesna'),
(216, 10, 'بركة السبع', 'Berkat El Saba'),
(217, 10, 'تلا', 'Tala'),
(218, 10, 'الشهداء', 'Al Shohada'),
(219, 11, 'المنيا', 'Minya'),
(220, 11, 'المنيا الجديدة', 'Minya El Gedida'),
(221, 11, 'العدوة', 'El Adwa'),
(222, 11, 'مغاغة', 'Magagha'),
(223, 11, 'بني مزار', 'Bani Mazar'),
(224, 11, 'مطاي', 'Mattay'),
(225, 11, 'سمالوط', 'Samalut'),
(226, 11, 'المدينة الفكرية', 'Madinat El Fekria'),
(227, 11, 'ملوي', 'Meloy'),
(228, 11, 'دير مواس', 'Deir Mawas'),
(229, 11, 'ابو قرقاص', 'Abu Qurqas'),
(230, 11, 'ارض سلطان', 'Ard Sultan'),
(231, 12, 'بنها', 'Banha'),
(232, 12, 'قليوب', 'Qalyub'),
(233, 12, 'شبرا الخيمة', 'Shubra Al Khaimah'),
(234, 12, 'القناطر الخيرية', 'Al Qanater Charity'),
(235, 12, 'الخانكة', 'Khanka'),
(236, 12, 'كفر شكر', 'Kafr Shukr'),
(237, 12, 'طوخ', 'Tukh'),
(238, 12, 'قها', 'Qaha'),
(239, 12, 'العبور', 'Obour'),
(240, 12, 'الخصوص', 'Khosous'),
(241, 12, 'شبين القناطر', 'Shibin Al Qanater'),
(242, 12, 'مسطرد', 'Mostorod'),
(243, 13, 'الخارجة', 'El Kharga'),
(244, 13, 'باريس', 'Paris'),
(245, 13, 'موط', 'Mout'),
(246, 13, 'الفرافرة', 'Farafra'),
(247, 13, 'بلاط', 'Balat'),
(248, 13, 'الداخلة', 'Dakhla'),
(249, 14, 'السويس', 'Suez'),
(250, 14, 'الجناين', 'Alganayen'),
(251, 14, 'عتاقة', 'Ataqah'),
(252, 14, 'العين السخنة', 'Ain Sokhna'),
(253, 14, 'فيصل', 'Faysal'),
(254, 15, 'أسوان', 'Aswan'),
(255, 15, 'أسوان الجديدة', 'Aswan El Gedida'),
(256, 15, 'دراو', 'Drau'),
(257, 15, 'كوم أمبو', 'Kom Ombo'),
(258, 15, 'نصر النوبة', 'Nasr Al Nuba'),
(259, 15, 'كلابشة', 'Kalabsha'),
(260, 15, 'إدفو', 'Edfu'),
(261, 15, 'الرديسية', 'Al-Radisiyah'),
(262, 15, 'البصيلية', 'Al Basilia'),
(263, 15, 'السباعية', 'Al Sibaeia'),
(264, 15, 'ابوسمبل السياحية', 'Abo Simbl Al Siyahia'),
(265, 15, 'مرسى علم', 'Marsa Alam'),
(266, 16, 'أسيوط', 'Assiut'),
(267, 16, 'أسيوط الجديدة', 'Assiut El Gedida'),
(268, 16, 'ديروط', 'Dayrout'),
(269, 16, 'منفلوط', 'Manfalut'),
(270, 16, 'القوصية', 'Qusiya'),
(271, 16, 'أبنوب', 'Abnoub'),
(272, 16, 'أبو تيج', 'Abu Tig'),
(273, 16, 'الغنايم', 'El Ghanaim'),
(274, 16, 'ساحل سليم', 'Sahel Selim'),
(275, 16, 'البداري', 'El Badari'),
(276, 16, 'صدفا', 'Sidfa'),
(277, 17, 'بني سويف', 'Bani Sweif'),
(278, 17, 'بني سويف الجديدة', 'Beni Suef El Gedida'),
(279, 17, 'الواسطى', 'Al Wasta'),
(280, 17, 'ناصر', 'Naser'),
(281, 17, 'إهناسيا', 'Ehnasia'),
(282, 17, 'ببا', 'beba'),
(283, 17, 'الفشن', 'Fashn'),
(284, 17, 'سمسطا', 'Somasta'),
(285, 17, 'الاباصيرى', 'Alabbaseri'),
(286, 17, 'مقبل', 'Mokbel'),
(287, 18, 'بورسعيد', 'PorSaid'),
(288, 18, 'بورفؤاد', 'Port Fouad'),
(289, 18, 'العرب', 'Alarab'),
(290, 18, 'حى الزهور', 'Zohour'),
(291, 18, 'حى الشرق', 'Alsharq'),
(292, 18, 'حى الضواحى', 'Aldawahi'),
(293, 18, 'حى المناخ', 'Almanakh'),
(294, 18, 'حى مبارك', 'Mubarak'),
(295, 19, 'دمياط', 'Damietta'),
(296, 19, 'دمياط الجديدة', 'New Damietta'),
(297, 19, 'رأس البر', 'Ras El Bar'),
(298, 19, 'فارسكور', 'Faraskour'),
(299, 19, 'الزرقا', 'Zarqa'),
(300, 19, 'السرو', 'alsaru'),
(301, 19, 'الروضة', 'alruwda'),
(302, 19, 'كفر البطيخ', 'Kafr El-Batikh'),
(303, 19, 'عزبة البرج', 'Azbet Al Burg'),
(304, 19, 'ميت أبو غالب', 'Meet Abou Ghalib'),
(305, 19, 'كفر سعد', 'Kafr Saad'),
(306, 20, 'الزقازيق', 'Zagazig'),
(307, 20, 'العاشر من رمضان', 'Al Ashr Men Ramadan'),
(308, 20, 'منيا القمح', 'Minya Al Qamh'),
(309, 20, 'بلبيس', 'Belbeis'),
(310, 20, 'مشتول السوق', 'Mashtoul El Souq'),
(311, 20, 'القنايات', 'Qenaiat'),
(312, 20, 'أبو حماد', 'Abu Hammad'),
(313, 20, 'القرين', 'El Qurain'),
(314, 20, 'ههيا', 'Hehia'),
(315, 20, 'أبو كبير', 'Abu Kabir'),
(316, 20, 'فاقوس', 'Faccus'),
(317, 20, 'الصالحية الجديدة', 'El Salihia El Gedida'),
(318, 20, 'الإبراهيمية', 'Al Ibrahimiyah'),
(319, 20, 'ديرب نجم', 'Deirb Negm'),
(320, 20, 'كفر صقر', 'Kafr Saqr'),
(321, 20, 'أولاد صقر', 'Awlad Saqr'),
(322, 20, 'الحسينية', 'Husseiniya'),
(323, 20, 'صان الحجر القبلية', 'san alhajar alqablia'),
(324, 20, 'منشأة أبو عمر', 'Manshayat Abu Omar'),
(325, 21, 'الطور', 'Al Toor'),
(326, 21, 'شرم الشيخ', 'Sharm El-Shaikh'),
(327, 21, 'دهب', 'Dahab'),
(328, 21, 'نويبع', 'Nuweiba'),
(329, 21, 'طابا', 'Taba'),
(330, 21, 'سانت كاترين', 'Saint Catherine'),
(331, 21, 'أبو رديس', 'Abu Redis'),
(332, 21, 'أبو زنيمة', 'Abu Zenaima'),
(333, 21, 'رأس سدر', 'Ras Sidr'),
(334, 22, 'كفر الشيخ', 'Kafr El Sheikh'),
(335, 22, 'وسط البلد كفر الشيخ', 'Kafr El Sheikh Downtown'),
(336, 22, 'دسوق', 'Desouq'),
(337, 22, 'فوه', 'Fooh'),
(338, 22, 'مطوبس', 'Metobas'),
(339, 22, 'برج البرلس', 'Burg Al Burullus'),
(340, 22, 'بلطيم', 'Baltim'),
(341, 22, 'مصيف بلطيم', 'Masief Baltim'),
(342, 22, 'الحامول', 'Hamol'),
(343, 22, 'بيلا', 'Bella'),
(344, 22, 'الرياض', 'Riyadh'),
(345, 22, 'سيدي سالم', 'Sidi Salm'),
(346, 22, 'قلين', 'Qellen'),
(347, 22, 'سيدي غازي', 'Sidi Ghazi'),
(348, 23, 'مرسى مطروح', 'Marsa Matrouh'),
(349, 23, 'الحمام', 'El Hamam'),
(350, 23, 'العلمين', 'Alamein'),
(351, 23, 'الضبعة', 'Dabaa'),
(352, 23, 'النجيلة', 'Al-Nagila'),
(353, 23, 'سيدي براني', 'Sidi Brani'),
(354, 23, 'السلوم', 'Salloum'),
(355, 23, 'سيوة', 'Siwa'),
(356, 23, 'مارينا', 'Marina'),
(357, 23, 'الساحل الشمالى', 'North Coast'),
(358, 24, 'الأقصر', 'Luxor'),
(359, 24, 'الأقصر الجديدة', 'New Luxor'),
(360, 24, 'إسنا', 'Esna'),
(361, 24, 'طيبة الجديدة', 'New Tiba'),
(362, 24, 'الزينية', 'Al ziynia'),
(363, 24, 'البياضية', 'Al Bayadieh'),
(364, 24, 'القرنة', 'Al Qarna'),
(365, 24, 'أرمنت', 'Armant'),
(366, 24, 'الطود', 'Al Tud'),
(367, 25, 'قنا', 'Qena'),
(368, 25, 'قنا الجديدة', 'New Qena'),
(369, 25, 'ابو طشت', 'Abu Tesht'),
(370, 25, 'نجع حمادي', 'Nag Hammadi'),
(371, 25, 'دشنا', 'Deshna'),
(372, 25, 'الوقف', 'Alwaqf'),
(373, 25, 'قفط', 'Qaft'),
(374, 25, 'نقادة', 'Naqada'),
(375, 25, 'فرشوط', 'Farshout'),
(376, 25, 'قوص', 'Quos'),
(377, 26, 'العريش', 'Arish'),
(378, 26, 'الشيخ زويد', 'Sheikh Zowaid'),
(379, 26, 'نخل', 'Nakhl'),
(380, 26, 'رفح', 'Rafah'),
(381, 26, 'بئر العبد', 'Bir al-Abed'),
(382, 26, 'الحسنة', 'Al Hasana'),
(383, 27, 'سوهاج', 'Sohag'),
(384, 27, 'سوهاج الجديدة', 'Sohag El Gedida'),
(385, 27, 'أخميم', 'Akhmeem'),
(386, 27, 'أخميم الجديدة', 'Akhmim El Gedida'),
(387, 27, 'البلينا', 'Albalina'),
(388, 27, 'المراغة', 'El Maragha'),
(389, 27, 'المنشأة', 'almunsha\'a'),
(390, 27, 'دار السلام', 'Dar AISalaam'),
(391, 27, 'جرجا', 'Gerga'),
(392, 27, 'جهينة الغربية', 'Jahina Al Gharbia'),
(393, 27, 'ساقلته', 'Saqilatuh'),
(394, 27, 'طما', 'Tama'),
(395, 27, 'طهطا', 'Tahta'),
(396, 27, 'الكوثر', 'Alkawthar'),
(397, 1, 'حدائق حلوان', 'Hadek helwan');

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1392, 'mqwt43mmG8HFAA3PcfTpdZRWkC5VJUUUJ7XPUswJMzAmNfYTrh9hEfQJBDZSH9peQtAkkWd7btSETJfH2y919xv8dD1cDAqfcEYXU9mJSWuzdQkybgQ2JBaqbkWrAwSsrrpHND7E8bpSgBBduPxhGcPQy78Kh1VQhgHE2Qya1CeyC1M4rT1yvsPaGXMb7BnvW1xEZ4fJ', 60, '2025-08-04 13:58:41', '2025-01-05 13:45:44', '2025-08-04 13:58:41'),
(1393, 'xZCzdvYQYMDpengVQ2UcaBZRW4quEmbc1HQRp1uMKXFxkHgSZnVyctQ8qXKfxHraQWhVhukqf1VtdwDSVM2gDxrE4nypYCJfwcDW15tQk5wsnG1NfQk9KNAu2hKtHNgXJsdmUscUurTe6MXfqemGbU5apKBKuGdaAZXBpJv8FaskDfR7Zxpvvc7zhqwa1hwTEW5Dfd1T', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1394, 'PfPbPpvuY3nChQcFecYdCMNkkhhPf7zFh6hq2WpnMKdmwgGHh4HFffUZAVXaKMm7ewnH3KCsUyVBYzv1SzGhMmggyrwTqWUYdtehnZW89w8HZqTgYGh2zK6zpSRudxtVU9uX11nETGRBVGfP3v64wfpbAt64fbQSgqccb2GrXTkWEvVCMyKpEc9rqp3FvsnQs7rzKn8e', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1395, 'NCbNpNM2ByA8mUautSkq8DxwgZ3upCxm7Gc5JduXcq5pH6wv1Ph82t1Zw5MHYHtVHusMpmx9xrcxY2qCx7bJWksAtMChU52zMadFV6RkYQHr1q1aAFBB47KHQQMdcqxsy4epbwSxxw9nFeHutKxuyCgfN6pFUwcZr3T1eedAv8yN9HQwQWE8TwPGW67ysarrKbWky95d', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1396, 'z3PR5ttM7mTByqDXhWTXgfYVHQbxx4cpvVpzN3qQ9MddZz2JJxcW1ZNEtUeSEYUvfW3tk6fGk53aP9nSdXEz7AKQXzu1C8eM4zTK8uHdAhZpH8ycYAx44nBgUDgMQsEV4CBPMKEnwFvddX21M4dfxUJcu7JnPaFVgsdbvpBe2TwVWhnZnuP3QCvsK1BUszVtt9gQBCds', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1397, 'qMa6nZrAs7uUC9gbEa5ZFcbtnkbbqP4DWF4edWBnNf2gmzeNfgcZSuc5k3Y4G7zQDcVRaWxPc1QSV7v5TdPn9nWrZX8Jwg8C7DKUq4RCB3BhezsQY8dGEWreuXBa8DfXChKSDuAXB3RnpAgaUEuTsgz9ANPsRRS2qkRXanUTY3hnrTVd1hH9zP1QaGP31cYgDfpHdMX8', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1398, 'YksWuUVVFktg4N4f2YkE5HbQpQkCRHDfDZYWE5S4qKfcc99S6kVCcuSC3VdeaCTcvNupeyZuaNgWs5pzvUrSxH8GRysQDNScpBvfptrGYUARSkNEyFyeuB2PgR9B5ypx1dBnHQ6seuZfJzS4Fx5AQJtdqrTFsHxy7CmanFetqBbV6yt38cp7AGX3RuXYMW9aeZSm6V56', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1399, 'T8T1ECVpCqs6z3Y9rsD7dfcm9D2V2AAEURD3Br9V9P2hwYQhUAeAGNJ9RYvJzB2qCHGDTvehh1swSQZGzZE1yYZzGCsYdCF5UTEWM5HPzJ5ytsBrf5tCGBWAJpCNGS9A48rhZf3tvbKv6U29nMgG8Y4ctQYcpdA53qwfygB92Ts51FD1cgzdQrvKSEGFa7RqYPymeFT2', 60, NULL, '2025-01-05 13:45:44', '2025-01-05 13:45:44'),
(1400, 'ntKVb4NJ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1401, '8Amt7uvF', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1402, 'qJskmnQG', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1403, '7rXyXAwT', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1404, 'n6PJKkRZ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1405, 'H7HfqwTd', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1406, 'CUNU4MKe', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1407, 'SXEznyK2', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1408, '48wCC3D4', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1409, '8Mg69kdP', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1410, 'BN8GVMy6', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1411, 'zwZCEcxq', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1412, 'rtP21xAX', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1413, 'Ngc2Zbad', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1414, 'RGP2Fgzz', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1415, 'Z4KQdakM', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1416, 'Ug3vB5VH', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1417, 'bgtscyA1', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1418, 'eZKruNhR', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1419, 'J3c8suJC', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1420, '6SpvD2Nf', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1421, 'vzEkYGUe', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1422, 'Z7KtWuUP', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1423, '4QJwCqRX', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1424, 'k1cq7tkR', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1425, 'BFX43xxd', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1426, 'QExRz1An', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1427, '4pVFaESA', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1428, 'FmumDtHA', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1429, 'tgxZaEZG', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1430, '9GCtnkvM', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1431, 'Bkf1vwsV', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1432, '9SAcwkBX', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1433, 'ak41s5sp', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1434, 'BCeptCm7', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1435, 'ppRTD3JE', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1436, 'JbSVruVh', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1437, 'GWGtanAd', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1438, 'V8mmWfk9', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1439, 'zvm5XCf5', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1440, 'pavPquEy', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1441, 'trbFhWNC', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1442, '3u8VwFNH', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1443, 'UCtYFrhv', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1444, 'dWXeHpkt', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1445, 'wYNKrpFK', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1446, 'q5rqpWuT', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1447, 'dyJSP4Az', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1448, '1ETUWKYP', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1449, 'eHHwazab', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1450, 'kTHyFxnC', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1451, 'Qm2ZFJN5', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1452, 'mKS9497U', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1453, 'FEd6dvUf', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1454, 'snm6pw7x', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1455, 'HR2Zn2FQ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1456, 'mQM78Xwx', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1457, 'sZvDXDeH', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1458, 'pMGknwNw', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1459, '1Fbfs31t', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1460, 'SNFZVQSA', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1461, 'eg5a54tn', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1462, 'ARRnJhbp', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1463, 'G9tUzkpU', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1464, 'UahrsnWY', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1465, 'ZC1DfrTS', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1466, 'gsvwww1u', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1467, 'hZHbvU4v', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1468, 'Q3E5fmrP', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1469, 'Vh9w4714', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1470, 'PWEc9zQC', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1471, 'Q5BS66ZE', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1472, 'JbcFevwZ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1473, 'UtXZRWN5', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1474, 'YNYwGBGT', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1475, 'DrNvz8UG', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1476, '4rUvvPcC', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1477, 'AEmhf9tJ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1478, 'RDGAEg3S', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1479, 'WxJW6t1n', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1480, 'hKth7x27', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1481, 'BNvfQ6Zp', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1482, 'sgnHYcBd', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1483, 'UwNWaph9', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1484, 'wg1bz3D9', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1485, 'pFnFEaqW', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1486, 'fq2Avhyk', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1487, 'MEBzpgAS', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1488, 'ebq5sdBt', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1489, 'Qe9J7Eqv', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1490, 'vxZFDsek', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1491, 'JGNkce37', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1492, 'TaD1XMQA', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1493, 'hw9PRvmw', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1494, 'Cx3QWfff', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1495, 'qs9x17wZ', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1496, 'NzyFFThY', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1497, 'WgTHrKW1', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1498, 'dAGQrT7a', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1499, 'BRZm6Qfn', 60, NULL, '2025-01-05 13:47:49', '2025-01-05 13:47:49'),
(1500, 'C', 1, NULL, '2025-08-04 10:27:22', '2025-08-04 10:27:22'),
(1501, 'J', 12, '2025-08-04 14:21:19', '2025-08-04 14:19:34', '2025-08-04 14:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

CREATE TABLE `Countries` (
  `id` int(11) NOT NULL,
  `country_name_ar` varchar(50) NOT NULL,
  `country_name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essay_correction`
--

CREATE TABLE `essay_correction` (
  `id` int(11) NOT NULL,
  `student_answer_id` int(11) NOT NULL,
  `degree` decimal(10,1) NOT NULL,
  `comment` text DEFAULT NULL,
  `draft` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `id` int(11) NOT NULL,
  `governorate_name_ar` varchar(50) NOT NULL,
  `governorate_name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `governorates`
--

INSERT INTO `governorates` (`id`, `governorate_name_ar`, `governorate_name_en`) VALUES
(1, 'القاهرة', 'Cairo'),
(2, 'الجيزة', 'Giza'),
(3, 'الأسكندرية', 'Alexandria'),
(4, 'الدقهلية', 'Dakahlia'),
(5, 'البحر الأحمر', 'Red Sea'),
(6, 'البحيرة', 'Beheira'),
(7, 'الفيوم', 'Fayoum'),
(8, 'الغربية', 'Gharbiya'),
(9, 'الإسماعلية', 'Ismailia'),
(10, 'المنوفية', 'Menofia'),
(11, 'المنيا', 'Minya'),
(12, 'القليوبية', 'Qaliubiya'),
(13, 'الوادي الجديد', 'New Valley'),
(14, 'السويس', 'Suez'),
(15, 'اسوان', 'Aswan'),
(16, 'اسيوط', 'Assiut'),
(17, 'بني سويف', 'Beni Suef'),
(18, 'بورسعيد', 'Port Said'),
(19, 'دمياط', 'Damietta'),
(20, 'الشرقية', 'Sharkia'),
(21, 'جنوب سيناء', 'South Sinai'),
(22, 'كفر الشيخ', 'Kafr Al sheikh'),
(23, 'مطروح', 'Matrouh'),
(24, 'الأقصر', 'Luxor'),
(25, 'قنا', 'Qena'),
(26, 'شمال سيناء', 'North Sinai'),
(27, 'سوهاج', 'Sohag');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stage` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `stage`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'group', 'desc', 2, '2024-08-04 13:35:55', '2024-09-16 22:49:43', '2024-09-16 22:49:43'),
(2, 'Tasc', 'Tasc - Tuesday & Friday at 2 pm', 3, '2024-08-15 14:28:50', '2024-08-15 14:28:50', NULL),
(3, 'TASC Sec [1]', 'Monday 15:00', 1, '2024-08-16 23:50:23', '2024-08-16 23:50:23', NULL),
(4, 'dfsdsgdgsd', NULL, 2, '2024-08-18 21:09:00', '2024-09-16 22:49:52', '2024-09-16 22:49:52'),
(5, 'sherouk', 'ejejejejejej', 1, '2024-08-22 23:08:43', '2024-09-16 22:49:57', '2024-09-16 22:49:57'),
(6, 'Tasc  - Sec 2', 'Tasc  - Sec 2 [Friday at 5 - Monday at 3 (Scientific only)]', 2, '2024-09-16 22:52:36', '2024-09-16 22:52:36', NULL),
(7, 'GHT - Sec 1', 'GHT - Sec 1 - [Saturday at 2:00]', 1, '2024-09-16 22:56:40', '2024-09-16 22:56:40', NULL),
(8, 'GHT - Sec 2', 'GHT - Sec 2 [Saturday at 12 - Thursday at 2.30 ]', 2, '2024-09-16 23:07:27', '2024-09-16 23:07:27', NULL),
(9, 'Future Soft  - Sec 1', 'Future Soft  - Sec 1 [Sunday at 6]', 1, '2024-09-16 23:08:42', '2024-09-16 23:08:42', NULL),
(10, 'Future Soft  - Sec 2', 'Future Soft  - Sec 2 [Saturday at 4.30 - Tuesday at 7:00]', 2, '2024-09-16 23:14:27', '2024-09-16 23:14:27', NULL),
(11, 'Tasc - Prep 2', 'Tasc - Prep 2 [Sunday at 6]', 22, '2024-09-16 23:15:07', '2024-09-16 23:15:07', NULL),
(12, 'Tasc - Prep 3', 'Tasc - Prep 3 [Thursday at 6]', 33, '2024-09-16 23:17:40', '2024-09-16 23:17:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homeworks`
--

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 0,
  `success_rate` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`id`, `title`, `lecture_id`, `visibility`, `success_rate`, `created_at`, `updated_at`) VALUES
(1, 'fhdgh', 1, 0, 20, '2024-08-04 20:26:54', '2024-08-04 20:26:54'),
(2, 'Audra Johnson', 3, 0, 1, '2024-08-07 17:07:34', '2024-08-07 17:07:34'),
(3, 'Homework 1', 7, 0, 60, '2024-08-15 14:39:06', '2024-08-15 14:39:06'),
(4, 'l1 u1 dsfsdm;fsdjo', 4, 0, 50, '2024-08-16 23:54:47', '2024-08-16 23:54:47'),
(5, 'Mohanad', 11, 0, 30, '2024-08-24 22:09:06', '2024-08-24 22:09:06'),
(6, 'lecture 1', 9, 0, 50, '2024-08-28 19:52:04', '2024-08-28 19:52:04'),
(7, 'Jaja', 13, 0, 1, '2024-08-28 20:02:23', '2024-08-28 20:02:23'),
(8, 'Algebra Lecture 1', 18, 0, 55, '2024-09-09 06:27:29', '2024-09-09 06:27:29'),
(9, 'Homework 1', 19, 1, 60, '2024-09-11 23:23:27', '2024-09-23 01:19:44'),
(10, 'test', 12, 1, 10, '2024-09-18 01:34:45', '2024-09-18 01:38:24'),
(11, 'omar', 34, 0, 10, '2024-10-11 02:23:44', '2024-10-11 02:23:44'),
(12, 'Wanda Beck', 50, 1, 97, '2024-11-08 16:09:16', '2024-11-08 16:09:54'),
(13, '22222222222', 145, 0, 100, '2025-08-02 12:12:29', '2025-08-02 12:12:29'),
(14, 'tesss', 148, 0, 100, '2025-08-02 14:15:04', '2025-08-02 14:15:04'),
(15, 'test', 150, 0, 22, '2025-08-03 16:35:10', '2025-08-03 16:35:10'),
(16, 'www', 151, 1, 12, '2025-08-04 14:21:33', '2025-08-04 14:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `visibility` int(1) NOT NULL DEFAULT 0,
  `stage` int(1) NOT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `price` int(2) NOT NULL,
  `v_hw` int(1) NOT NULL DEFAULT 0,
  `v_quiz` int(1) NOT NULL DEFAULT 0,
  `img` varchar(255) NOT NULL,
  `views` int(255) NOT NULL,
  `expired_at` int(255) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `title`, `description`, `visibility`, `stage`, `chapter_id`, `price`, `v_hw`, `v_quiz`, `img`, `views`, `expired_at`, `section`, `teacher_id`, `created_at`, `updated_at`) VALUES
(35, 'name', 'ttt', 0, 3, 20, 44, 0, 0, '1728725623-274.png', 4, 4, 'arts', 3, '2024-10-12 12:33:43', '2024-10-12 12:33:43'),
(48, 'المحاضرة الاولي', 'testttttttttttttttttttttttttttttttttttttttttt', 0, 3, NULL, 50, 0, 0, '1730971379-535.jpg', 3, 7, 'scientific', 3, '2024-11-07 11:22:59', '2024-11-07 11:22:59'),
(49, 'المحاضرة الاولي', '123', 0, 1, 25, 50, 0, 0, '1730971524-413.jpg', 3, 7, NULL, 3, '2024-11-07 11:25:24', '2024-11-07 11:25:51'),
(50, 'Daquan Gilliam', 'Dolor harum reiciend', 0, 1, 23, 749, 0, 0, '1731072858-955.jpg', 20, 722, NULL, 3, '2024-11-08 15:34:18', '2024-11-08 15:34:18'),
(51, 'الدرس الأول', '1d6fe00f975c491a9531912fbaf960f8', 0, 1, NULL, 100, 0, 0, '1731176324-530.jpg', 10, 29, NULL, 3, '2024-11-09 20:18:44', '2024-11-09 20:18:44'),
(52, 'testttttttttttttt0', 'sdwawewe', 0, 33, NULL, 60, 0, 0, '1731595193-803.png', 3, 8, NULL, 3, '2024-11-14 16:39:53', '2024-11-14 16:39:53'),
(53, 'Unit 1', 'Unit 1', 0, 33, NULL, 200, 0, 0, '1732531947-325.png', 10, 19, NULL, 7, '2024-11-25 12:52:27', '2024-11-25 12:52:27'),
(54, '2nd Secondary-Physics-November Revision', '2nd Secondary-Physics-November Revision-Mr.Mahmoud Elsaeed.', 1, 2, NULL, 10, 0, 0, '1732537158-745.jpg', 100, 20, 'scientific', 11, '2024-11-25 13:11:32', '2024-11-25 14:19:18'),
(55, 'الأول الثانوي-لغة عربية-مراجعة نوفمبر', 'الصف الأول الثانوي-اللغة العربية-مراجعة شهر نوفمبر- أ/محمد بكري', 1, 1, NULL, 10, 0, 0, '1732554262-705.jpg', 100, 30, NULL, 7, '2024-11-25 19:04:22', '2024-11-25 19:04:42'),
(56, 'الثاني الثانوي-لغة عربية-مراجعة نوفمبر', 'الصف الثاني الثانوي-اللغة العربية-مراجعة شهر نوفمبر', 1, 2, NULL, 10, 0, 0, '1732558259-905.jpg', 100, 30, 'scientific', 13, '2024-11-25 20:09:06', '2024-11-25 20:10:59'),
(57, '1st Secondary-(Algebra)-Nov. revision', '1st Secondary-Math(Algebra)-November revision', 1, 2, NULL, 10, 0, 0, '1732558802-281.jpg', 100, 30, 'scientific', 10, '2024-11-25 20:20:02', '2025-07-30 13:27:31'),
(58, '3rd Prep-Math-November Revision-Geometry', '3rd Prep-Math-November Revision-Geometry-Mrs.Noha Mohamed', 1, 33, NULL, 10, 0, 0, '1732559707-340.jpg', 100, 30, NULL, 15, '2024-11-25 20:35:07', '2024-11-25 20:35:17'),
(59, '3rd Prep. Arabic-Nov. Revision', 'مراجعة شهر نوفمبر اللغة العربية الصف الثالث الاعدادي', 1, 33, NULL, 10, 0, 0, '1732611384-231.jpg', 100, 30, NULL, 3, '2024-11-26 10:56:24', '2024-11-26 10:56:52'),
(60, '3rd prep Math(Algebra) Nov. Revision', '3rd prep Math(Algebra) November Revision Mrs.Noha Mohamed', 1, 33, NULL, 10, 0, 0, '1732692634-466.jpg', 100, 30, NULL, 10, '2024-11-27 09:30:34', '2024-11-27 09:30:44'),
(61, '1st Sec Math(Geometry) Nov. Revision', '1st Sec Math(Geometry) November . Revision Mr. Ahmed Abdelwahed', 1, 1, NULL, 10, 0, 0, '1732692926-831.jpg', 100, 30, NULL, 10, '2024-11-27 09:35:26', '2024-11-27 09:35:41'),
(62, '2nd Sec Biology November Revision', '2nd Sec Biology November Revision Mrs. Gehan Asem', 1, 2, NULL, 10, 0, 0, '1732694059-213.jpg', 100, 30, 'scientific', 18, '2024-11-27 09:54:19', '2024-11-27 09:54:39'),
(63, '3rd Prep English Nov. Revision', '3rd Prep English Nov. Revision Mrs Amr Fahmy', 1, 33, NULL, 10, 0, 0, '1732697071-173.jpg', 100, 28, NULL, 14, '2024-11-27 10:44:31', '2024-11-27 10:44:50'),
(64, '1st sec English-Nov Revision', '1st sec English-November Revision Mr. Gamal Abou Zied', 1, 1, NULL, 10, 0, 0, '1732697335-950.jpg', 99, 30, NULL, 8, '2024-11-27 10:48:55', '2024-11-27 10:49:07'),
(65, '1st Sec History Nov. Revision', '1st Sec History November. Revision Mr.Omar Raslan', 1, 1, NULL, 10, 0, 0, '1732702656-555.jpg', 100, 28, NULL, 9, '2024-11-27 12:17:36', '2024-11-27 12:18:18'),
(66, '1st Sec-Integrated Sci-Nov. Revision', '1st Secondary-Integrated Science-November Revision Mr. Ahmed Elmahdy', 0, 1, NULL, 10, 0, 0, '1732703100-112.jpg', 100, 30, NULL, 17, '2024-11-27 12:25:00', '2025-01-09 14:11:39'),
(67, '3rd prep Science Nov Revision', '3rd prep Science Nov Revision Mr. Ahmed Abd El-Fattah', 1, 33, NULL, 10, 0, 0, '1732705307-768.jpg', 100, 29, NULL, 16, '2024-11-27 13:01:47', '2024-11-27 13:03:14'),
(68, '1st Sec Philosophy Nov Revision', 'الفلسفة والمنطق الصف الاول الثانوي مراجعة شهر نوفمبر', 1, 1, NULL, 10, 0, 0, '1732711018-893.jpg', 100, 30, NULL, 12, '2024-11-27 14:36:58', '2024-11-27 14:37:18'),
(69, '3rd Prep Algebra Final Revision 1st Term', '3rd Prep Math (Algebra) Final Revision 1st Term Mrs.Noha Mohamed', 1, 33, NULL, 60, 0, 0, '1735638722-553.jpg', 3, 60, NULL, 15, '2024-12-31 11:50:04', '2024-12-31 11:52:02'),
(70, '3rd Prep Math Revision 1st term Geometry', '3rd Prep Math Final Revision 1st term Geometry Mrs.Noha Mohamed', 1, 33, NULL, 60, 0, 0, '1735983394-574.jpg', 3, 60, NULL, 15, '2025-01-04 11:31:09', '2025-01-04 11:36:34'),
(71, '1st Sec (Algebra)  1st Term Revision', '1st Sec Math (Algebra) Final Revision 1st Term Mr.Ahmed Abd El-Wahed', 1, 1, NULL, 60, 0, 0, '1735983915-461.jpg', 3, 60, NULL, 10, '2025-01-04 11:45:15', '2025-01-04 11:45:30'),
(72, '1st Sec Math(Geometry) 1st Term Revision', '1st Sec Math(Geometry) 1st Term Final Revision Mr. Ahmed Abd El-Wahed', 1, 1, NULL, 60, 0, 0, '1735984248-201.jpg', 3, 60, NULL, 10, '2025-01-04 11:50:48', '2025-01-04 11:50:56'),
(73, '3rd Prep English Final Revision Part (1)', '3rd Prep English Final Revision First Term Part (1) Mr. Amr Fhmy', 1, 33, NULL, 60, 0, 0, '1735985089-816.jpg', 3, 60, NULL, 14, '2025-01-04 12:04:49', '2025-01-04 12:06:56'),
(74, '2nd Sec Biology Final Revision Part 1', '2nd Sec Biology Final Revision First  Term Part (1) Mrs. Gehan Asem', 1, 2, NULL, 60, 0, 0, '1735985664-867.jpg', 3, 60, 'scientific', 18, '2025-01-04 12:13:51', '2025-01-04 12:14:24'),
(75, '1st Sec Integrated Science Final Revisio', '1st Sec Integrated Science Final Revision 1st Term Mr. Ahmed El-Mahdy', 1, 1, NULL, 60, 0, 0, '1736058552-370.jpg', 3, 60, NULL, 17, '2025-01-05 08:29:12', '2025-01-05 08:29:23'),
(76, '3rd Prep Arabic Final revision Part 1', '3rd Prep Arabic Final revision First Term Part 1 Mr. Araby Hamed', 1, 33, NULL, 60, 0, 0, '1736059117-974.jpg', 1, 60, NULL, 3, '2025-01-05 08:38:37', '2025-01-05 08:38:49'),
(77, '3rd Prep Science Final Revision Part (1)', '3rd Prep Science Final Revision First Term Part (1) Mr. Ahmed Abd El-Fattah', 1, 33, NULL, 60, 0, 0, '1736059496-216.jpg', 1, 60, NULL, 16, '2025-01-05 08:44:56', '2025-01-05 08:45:07'),
(78, '1st Sec Math Trigonometry Final Revision', '1st Sec Trigonometry Final Revision First Term Mr. Ahmed Abd El-Wahed', 1, 1, NULL, 60, 0, 0, '1736075070-648.jpg', 3, 60, NULL, 10, '2025-01-05 13:04:30', '2025-01-05 13:04:49'),
(79, '2nd Sec Physics Final Revision Part (1)', '2nd Sec Physics Final Revision First Term Part (1) Mr. Mahmoud El-Saeed', 1, 2, NULL, 60, 0, 0, '1736075563-854.jpg', 3, 60, 'scientific', 11, '2025-01-05 13:12:43', '2025-01-05 13:13:11'),
(80, '2nd Sec Physics Final Revision Part (2)', '2nd Sec Physics Final Revision First Term Part (2) Mr. Mahmoud El-Saeed', 1, 2, NULL, 60, 0, 0, '1736075885-346.jpg', 3, 60, 'scientific', 11, '2025-01-05 13:18:05', '2025-01-05 13:18:31'),
(81, '2nd Sec Physics Final Revision Part (3)', '2nd Sec Physics Final Revision First Term Part (3) Mr. Mahmoud Al-Saeed', 1, 2, NULL, 60, 0, 0, '1736193590-492.jpg', 3, 60, 'scientific', 11, '2025-01-06 21:59:50', '2025-01-06 22:00:15'),
(82, '1st Sec Science Final Revision Part 2', '1st Sec Integrated Science Final Revision 1st Term part 2 Mr. Ahmed El-Mahdy', 1, 1, NULL, 60, 0, 0, '1736316893-660.jpg', 3, 60, NULL, 17, '2025-01-08 08:14:53', '2025-01-08 08:16:30'),
(83, '1st Sec Science Final Revision Part3', '1st Sec Integrated Science Final Revision 1st Term Part 3 Mr. Ahmed El-Mahdy', 1, 1, NULL, 60, 0, 0, '1736323035-126.jpg', 3, 60, NULL, 17, '2025-01-08 09:57:15', '2025-01-08 09:57:32'),
(84, '1st sec Arabic Final Revision 1st Term', '1st sec Arabic Final Revision 1st Term Mr.Mohamed Bakry', 1, 1, NULL, 60, 0, 0, '1736581853-638.jpg', 3, 60, NULL, 7, '2025-01-11 09:50:53', '2025-01-11 09:51:08'),
(85, '1st Sec English Final Revision 1st Term', '1st Sec English Final Revision 1st Term Mr.Gamal Abou Zied', 1, 1, NULL, 60, 0, 0, '1736582289-886.jpg', 3, 60, NULL, 8, '2025-01-11 09:58:09', '2025-01-11 09:58:33'),
(86, 'Arabic 3rd primry mrs habiba', 'Arabic 3rd primry mrs habiba', 0, 3, NULL, 60, 0, 0, '1741209222-974.jpg', 50, 90, NULL, 23, '2025-03-05 23:13:42', '2025-03-05 23:13:42'),
(87, 'Arabic 3rd Primary Ms.Habiba', 'نموذج كتابة قصة', 1, 333, NULL, 60, 0, 0, '1745241391-142.jpg', 5, 90, NULL, 23, '2025-03-05 23:52:34', '2025-04-21 15:16:31'),
(88, '3rd primary Arabic Ms.Habiba', 'ثقافات الشعوب', 1, 333, NULL, 60, 0, 0, '1745242396-610.jpg', 5, 90, NULL, 23, '2025-03-06 20:39:34', '2025-04-21 15:33:56'),
(89, '3rd Prim Arabic Ms.Habiba', 'مسرح المدرسة', 1, 333, NULL, 60, 0, 0, '1745241689-485.jpg', 5, 90, NULL, 23, '2025-03-06 20:44:19', '2025-04-21 15:21:29'),
(90, 'Arabic 3rd Prim Ms. Asmaa', 'الغابة المتحجرة', 1, 333, NULL, 60, 0, 0, '1745238805-863.jpg', 5, 90, NULL, 24, '2025-03-06 21:11:39', '2025-04-21 14:33:44'),
(91, 'Arabic 3rd Prim Ms. Naglaa', 'لعبة الكنز', 1, 333, NULL, 60, 0, 0, '1745243098-934.jpg', 5, 90, NULL, 22, '2025-03-06 21:23:20', '2025-04-21 15:44:58'),
(92, 'Math 3rd Prim Ms. Yara', 'Associative Property', 1, 333, NULL, 60, 0, 0, '1741290565-550.jpg', 5, 88, NULL, 21, '2025-03-06 21:49:25', '2025-04-21 16:36:40'),
(93, 'English 3rd Prim Ms.Hadeer', 'unit 7- Lesson1-where are the family?', 1, 333, NULL, 60, 0, 0, '1745253703-474.jpg', 5, 90, NULL, 19, '2025-03-06 22:09:54', '2025-04-21 18:42:27'),
(94, 'English 3rd Prim Ms. Nada', 'Unit 8-Lesson1- At the museum', 1, 333, NULL, 65, 0, 0, '1745258554-674.jpg', 5, 90, NULL, 20, '2025-03-06 22:25:46', '2025-04-21 20:02:34'),
(95, 'Math 3rd Prim (Evaluation)', 'Math 3rd Prim (Evaluation) Ms. Yara', 1, 333, NULL, 65, 0, 0, '1741293289-431.jpg', 5, 89, NULL, 21, '2025-03-06 22:34:49', '2025-03-06 22:35:04'),
(96, 'Math 3rd Prim Ms. Yara', 'Complex Story Problems 4 + 3 = ?', 1, 333, NULL, 60, 0, 0, '1744884860-191.jpg', 5, 88, NULL, 21, '2025-04-17 12:14:20', '2025-04-21 16:36:54'),
(97, 'Math 3rd Prim Ms. Yara', 'Relations between X and ÷', 1, 333, NULL, 60, 0, 0, '1744891936-281.jpg', 5, 88, NULL, 21, '2025-04-17 14:12:16', '2025-04-21 16:40:02'),
(98, 'Math 3rd Prim Ms. Yara', 'Perimeter & Area', 1, 333, NULL, 60, 0, 0, '1744892094-111.jpg', 5, 88, NULL, 21, '2025-04-17 14:14:54', '2025-04-21 16:39:53'),
(99, 'Ms. Nada Osama', 'Unit 8-Lesson 6&7', 1, 333, NULL, 65, 0, 0, '1744893160-929.jpg', 5, 90, NULL, 20, '2025-04-17 14:32:40', '2025-04-21 20:01:17'),
(100, 'Ms. Nada Osama', 'Unit8-Lesson 5', 1, 333, NULL, 65, 0, 0, '1744893298-703.jpg', 5, 90, NULL, 20, '2025-04-17 14:34:58', '2025-04-21 19:59:43'),
(101, 'Ms. Nada Osama', 'Unit8-Lesson 4-Phonics', 1, 333, NULL, 65, 0, 0, '1744893494-934.jpg', 5, 90, NULL, 20, '2025-04-17 14:38:14', '2025-04-21 19:58:24'),
(102, 'Ms. Yara Mahmoud', 'Multiples of 11&12', 1, 333, NULL, 60, 0, 0, '1745245923-598.jpg', 5, 88, NULL, 21, '2025-04-17 15:07:41', '2025-04-21 16:32:03'),
(103, 'Ms. Asmaa Ahmed', 'نشيد الأرض', 1, 333, NULL, 60, 0, 0, '1745233097-164.jpg', 5, 90, NULL, 24, '2025-04-21 12:58:17', '2025-04-21 13:03:35'),
(106, 'Arabic 3rd Primary Ms.Habiba', 'المقايضة', 1, 333, NULL, 60, 0, 0, '1745234719-767.jpg', 5, 90, NULL, 23, '2025-04-21 13:25:19', '2025-04-21 13:25:38'),
(107, 'Arabic 3rd Primary Ms.Habiba', 'تعاون الحي', 1, 333, NULL, 60, 0, 0, '1745236122-165.jpg', 5, 90, NULL, 23, '2025-04-21 13:48:42', '2025-04-21 13:49:59'),
(108, 'Arabic 3rd Primary Ms.Habiba', 'رحلة الموز', 1, 333, NULL, 60, 0, 0, '1745236436-835.jpg', 5, 90, NULL, 23, '2025-04-21 13:53:56', '2025-04-21 15:08:50'),
(109, 'Ms. Asmaa Ahmed', 'كتابة فقرة معلوماتية', 1, 333, NULL, 60, 0, 0, '1745238252-686.jpg', 5, 90, NULL, 24, '2025-04-21 14:24:12', '2025-04-21 14:45:13'),
(110, 'Arabic 3rd Prim Ms. Asmaa', 'اختراع عجيب & نموذج كتابة اعلان', 1, 333, NULL, 60, 0, 0, '1745239501-198.jpg', 5, 88, NULL, 24, '2025-04-21 14:45:01', '2025-04-21 14:46:26'),
(111, 'Arabic 3rd Prim Ms. Asmaa', 'اختي وقصة كفاح', 1, 333, NULL, 60, 0, 0, '1745239913-359.jpg', 5, 89, NULL, 24, '2025-04-21 14:51:53', '2025-04-21 14:53:28'),
(112, 'Arabic 3rd Prim Ms. Asmaa', 'العصور الذهبية', 1, 333, NULL, 60, 0, 0, '1745240219-914.jpg', 5, 90, NULL, 24, '2025-04-21 14:56:59', '2025-04-21 14:58:00'),
(113, 'Arabic 3rd Prim Ms. Asmaa', 'طالب مميز', 1, 333, NULL, 60, 0, 0, '1745240478-750.jpg', 3, 90, NULL, 24, '2025-04-21 15:01:18', '2025-04-21 15:27:52'),
(114, '3rd primary Arabic Ms.Habiba', 'قصة الصديقتان', 1, 333, NULL, 60, 0, 0, '1745242562-541.jpg', 5, 87, NULL, 23, '2025-04-21 15:36:02', '2025-04-21 15:36:52'),
(115, 'Ms. Yara Mahmoud', 'fractions 2', 1, 333, NULL, 60, 0, 0, '1745247282-443.jpg', 5, 87, NULL, 21, '2025-04-21 16:54:42', '2025-04-21 17:05:57'),
(116, 'Ms. Yara Mahmoud', 'fractions 3', 1, 333, NULL, 60, 0, 0, '1745247549-759.jpg', 5, 88, NULL, 21, '2025-04-21 16:59:09', '2025-04-21 17:05:49'),
(117, 'Ms. Yara Mahmoud', 'fractions', 1, 333, NULL, 60, 0, 0, '1745248061-812.jpg', 5, 90, NULL, 21, '2025-04-21 17:07:41', '2025-04-21 19:34:42'),
(118, 'Ms. Yara Mahmoud', 'Telling the time', 1, 333, NULL, 60, 0, 0, '1745248276-420.jpg', 5, 90, NULL, 21, '2025-04-21 17:11:16', '2025-04-21 19:36:04'),
(119, 'Arabic 3rd Prim Ms. Naglaa', 'قصة أستماع أناوأنت', 1, 333, NULL, 60, 0, 0, '1745248630-536.jpg', 5, 87, NULL, 22, '2025-04-21 17:17:10', '2025-04-21 17:22:30'),
(120, 'Arabic 3rd Prim Ms. Naglaa', 'اللغة وسيلة تواصل', 1, 333, NULL, 60, 0, 0, '1745248632-464.jpg', 4, 90, NULL, 22, '2025-04-21 17:17:12', '2025-04-21 17:22:51'),
(121, 'Ms. Naglaa Abd El-Hakeem', 'قصة صندوق الذكريات و انواع الاسم', 1, 333, NULL, 60, 0, 0, '1745249192-163.jpg', 5, 80, NULL, 22, '2025-04-21 17:26:32', '2025-04-21 17:27:17'),
(122, 'Ms. Naglaa Abd El-Hakeem', 'كتابة فقرة اقناعية', 1, 333, NULL, 60, 0, 0, '1745249447-986.jpg', 5, 80, NULL, 22, '2025-04-21 17:30:47', '2025-04-21 17:30:59'),
(123, 'Ms. Naglaa Abd El-Hakeem', 'نريد ان نلعب', 1, 333, NULL, 60, 0, 0, '1745250087-684.jpg', 3, 90, NULL, 22, '2025-04-21 17:41:27', '2025-04-21 17:50:50'),
(124, 'Ms. Naglaa Abd El-Hakeem', 'نشيد اصحاب المهن', 1, 333, NULL, 60, 0, 0, '1745250460-775.jpg', 5, 87, NULL, 22, '2025-04-21 17:47:40', '2025-04-21 18:33:39'),
(125, 'Ms. Naglaa Abd El-Hakeem', 'نموذج كتابة الرأي', 1, 333, NULL, 60, 0, 0, '1745250563-296.jpg', 5, 90, NULL, 22, '2025-04-21 17:49:23', '2025-04-21 18:32:53'),
(126, 'English 3rd Prim Ms.Hadeer', 'unite 7-', 1, 333, NULL, 60, 0, 0, '1745254524-214.jpg', 5, 88, NULL, 19, '2025-04-21 18:55:24', '2025-04-23 13:45:45'),
(127, 'English 3rd Prim Ms.Hadeer', 'unit 7-', 1, 333, NULL, 60, 0, 0, '1745256235-424.jpg', 5, 90, NULL, 19, '2025-04-21 19:23:55', '2025-04-23 13:45:51'),
(129, 'English 3rd Prim Ms.Hadeer', 'unit 9 lesson 1', 1, 333, NULL, 60, 0, 0, '1745407867-485.jpg', 5, 90, NULL, 19, '2025-04-23 13:23:38', '2025-04-23 13:31:07'),
(130, 'English 3rd Prim Ms.Hadeer', 'unit 9 - lesson2 & 3', 1, 333, NULL, 60, 0, 0, '1745409082-828.jpg', 5, 90, NULL, 19, '2025-04-23 13:51:22', '2025-04-23 13:52:44'),
(131, 'English 3rd Prim Ms.Hadeer', 'unit 9- lesson 4 ,5 ,6', 1, 333, NULL, 60, 0, 0, '1745409328-216.jpg', 5, 90, NULL, 19, '2025-04-23 13:55:28', '2025-04-23 13:56:32'),
(132, 'English 3rd Prim Ms.Hadeer', 'unit 9 - lesson 7', 1, 333, NULL, 60, 0, 0, '1745409485-853.jpg', 5, 90, NULL, 19, '2025-04-23 13:58:05', '2025-04-23 13:58:56'),
(133, 'Ms. Nada Osama', 'unit 10 lesson 1-2', 1, 333, NULL, 60, 0, 0, '1745409743-576.jpg', 5, 80, NULL, 20, '2025-04-23 14:02:23', '2025-04-23 14:03:08'),
(134, 'Ms. Nada Osama', 'English unit 10 lesson 3', 1, 333, NULL, 60, 0, 0, '1745829107-922.jpg', 5, 80, NULL, 20, '2025-04-28 11:31:47', '2025-04-28 11:36:20'),
(135, 'Ms. Nada Osama', 'English unit 10', 1, 333, NULL, 60, 0, 0, '1745829259-591.jpg', 5, 80, NULL, 20, '2025-04-28 11:34:19', '2025-04-28 11:36:26'),
(136, 'Ms. Nada Osama', 'english unit 10 lesson 7', 1, 333, NULL, 60, 0, 0, '1745829491-700.jpg', 5, 80, NULL, 20, '2025-04-28 11:38:11', '2025-04-28 11:38:17'),
(137, 'English 3rd Prim Ms.Hadeer', 'unit 11 -lesson 1', 1, 333, NULL, 60, 0, 0, '1747218798-226.jpg', 5, 90, NULL, 19, '2025-05-14 13:33:18', '2025-05-14 13:39:34'),
(138, 'English 3rd Prim Ms.Hadeer', 'unit 11 lesson  2 ,3', 1, 333, NULL, 60, 0, 0, '1747218983-245.jpg', 5, 90, NULL, 19, '2025-05-14 13:36:23', '2025-05-14 13:36:33'),
(139, 'English 3rd Prim Ms.Hadeer', 'unit 11 leson 4......', 1, 333, NULL, 60, 0, 0, '1747219373-335.jpg', 5, 90, NULL, 19, '2025-05-14 13:42:54', '2025-05-14 13:43:00'),
(140, 'English 3rd Prim Ms.Hadeer', 'unit 11 lesson 6', 1, 333, NULL, 60, 0, 0, '1747219535-920.jpg', 5, 90, NULL, 19, '2025-05-14 13:45:35', '2025-05-14 13:46:05'),
(141, 'Ms. Nada Osama', 'Unit 12 Lesson 1-2-3-4', 1, 333, NULL, 60, 0, 0, '1747219954-807.jpg', 5, 90, NULL, 20, '2025-05-14 13:52:34', '2025-05-15 13:20:22'),
(142, 'Ms. Nada Osama', 'unit 12 lesson 5-6', 1, 333, NULL, 60, 0, 0, '1747219992-427.jpg', 5, 90, NULL, 20, '2025-05-14 13:53:12', '2025-05-15 13:20:28'),
(146, 'tesss', 'wwwww', 0, 333, NULL, 222, 0, 0, '1754128418-115.png', 222, 219, NULL, 26, '2025-08-02 12:53:38', '2025-08-02 12:53:38'),
(148, 'test', 'qqqqq', 0, 22, 32, 222, 0, 0, '1754133119-835.png', 222, 222, NULL, 26, '2025-08-02 14:11:59', '2025-08-02 14:11:59'),
(151, 'test', 'wwwww', 1, 1, 35, 12, 0, 0, '1754306313-303.png', 22, 22, NULL, 10, '2025-08-04 14:18:33', '2025-08-04 14:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `sent_by` bigint(20) UNSIGNED NOT NULL,
  `send_to` varchar(11) NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(8, 'App\\Models\\Admin', 38),
(8, 'App\\Models\\Admin', 39),
(8, 'App\\Models\\Admin', 40),
(8, 'App\\Models\\Admin', 41),
(8, 'App\\Models\\Admin', 42),
(8, 'App\\Models\\Admin', 43),
(8, 'App\\Models\\Admin', 50),
(9, 'App\\Models\\Admin', 38),
(9, 'App\\Models\\Admin', 39),
(9, 'App\\Models\\Admin', 40),
(9, 'App\\Models\\Admin', 41),
(9, 'App\\Models\\Admin', 42),
(9, 'App\\Models\\Admin', 43),
(9, 'App\\Models\\Admin', 47),
(9, 'App\\Models\\Admin', 50),
(10, 'App\\Models\\Admin', 38),
(10, 'App\\Models\\Admin', 39),
(10, 'App\\Models\\Admin', 40),
(10, 'App\\Models\\Admin', 41),
(10, 'App\\Models\\Admin', 42),
(10, 'App\\Models\\Admin', 43),
(10, 'App\\Models\\Admin', 50),
(11, 'App\\Models\\Admin', 38),
(11, 'App\\Models\\Admin', 39),
(11, 'App\\Models\\Admin', 40),
(11, 'App\\Models\\Admin', 41),
(11, 'App\\Models\\Admin', 42),
(11, 'App\\Models\\Admin', 43),
(11, 'App\\Models\\Admin', 50),
(12, 'App\\Models\\Admin', 38),
(12, 'App\\Models\\Admin', 39),
(12, 'App\\Models\\Admin', 40),
(12, 'App\\Models\\Admin', 41),
(12, 'App\\Models\\Admin', 42),
(12, 'App\\Models\\Admin', 43),
(12, 'App\\Models\\Admin', 50),
(13, 'App\\Models\\Admin', 38),
(13, 'App\\Models\\Admin', 39),
(13, 'App\\Models\\Admin', 40),
(13, 'App\\Models\\Admin', 41),
(13, 'App\\Models\\Admin', 42),
(13, 'App\\Models\\Admin', 43),
(13, 'App\\Models\\Admin', 50),
(14, 'App\\Models\\Admin', 38),
(14, 'App\\Models\\Admin', 39),
(14, 'App\\Models\\Admin', 40),
(14, 'App\\Models\\Admin', 41),
(14, 'App\\Models\\Admin', 42),
(14, 'App\\Models\\Admin', 43),
(14, 'App\\Models\\Admin', 48),
(14, 'App\\Models\\Admin', 50),
(15, 'App\\Models\\Admin', 38),
(15, 'App\\Models\\Admin', 39),
(15, 'App\\Models\\Admin', 40),
(15, 'App\\Models\\Admin', 41),
(15, 'App\\Models\\Admin', 42),
(15, 'App\\Models\\Admin', 43),
(15, 'App\\Models\\Admin', 50),
(16, 'App\\Models\\Admin', 38),
(16, 'App\\Models\\Admin', 39),
(16, 'App\\Models\\Admin', 40),
(16, 'App\\Models\\Admin', 41),
(16, 'App\\Models\\Admin', 42),
(16, 'App\\Models\\Admin', 43),
(16, 'App\\Models\\Admin', 50),
(17, 'App\\Models\\Admin', 38),
(17, 'App\\Models\\Admin', 39),
(17, 'App\\Models\\Admin', 40),
(17, 'App\\Models\\Admin', 41),
(17, 'App\\Models\\Admin', 42),
(17, 'App\\Models\\Admin', 43),
(17, 'App\\Models\\Admin', 50),
(18, 'App\\Models\\Admin', 38),
(18, 'App\\Models\\Admin', 39),
(18, 'App\\Models\\Admin', 40),
(18, 'App\\Models\\Admin', 41),
(18, 'App\\Models\\Admin', 42),
(18, 'App\\Models\\Admin', 43),
(18, 'App\\Models\\Admin', 49),
(18, 'App\\Models\\Admin', 50),
(20, 'App\\Models\\Admin', 38),
(20, 'App\\Models\\Admin', 39),
(20, 'App\\Models\\Admin', 40),
(20, 'App\\Models\\Admin', 41),
(20, 'App\\Models\\Admin', 42),
(20, 'App\\Models\\Admin', 43),
(20, 'App\\Models\\Admin', 50),
(21, 'App\\Models\\Admin', 38),
(21, 'App\\Models\\Admin', 39),
(21, 'App\\Models\\Admin', 40),
(21, 'App\\Models\\Admin', 41),
(21, 'App\\Models\\Admin', 42),
(21, 'App\\Models\\Admin', 43),
(21, 'App\\Models\\Admin', 47),
(21, 'App\\Models\\Admin', 50),
(23, 'App\\Models\\Admin', 38),
(23, 'App\\Models\\Admin', 39),
(23, 'App\\Models\\Admin', 40),
(23, 'App\\Models\\Admin', 41),
(23, 'App\\Models\\Admin', 42),
(23, 'App\\Models\\Admin', 43),
(23, 'App\\Models\\Admin', 50),
(23, 'App\\Models\\Admin', 51),
(24, 'App\\Models\\Admin', 38),
(24, 'App\\Models\\Admin', 39),
(24, 'App\\Models\\Admin', 40),
(24, 'App\\Models\\Admin', 41),
(24, 'App\\Models\\Admin', 42),
(24, 'App\\Models\\Admin', 43),
(24, 'App\\Models\\Admin', 50),
(25, 'App\\Models\\Admin', 38),
(25, 'App\\Models\\Admin', 39),
(25, 'App\\Models\\Admin', 40),
(25, 'App\\Models\\Admin', 41),
(25, 'App\\Models\\Admin', 42),
(25, 'App\\Models\\Admin', 43),
(25, 'App\\Models\\Admin', 50),
(26, 'App\\Models\\Admin', 38),
(26, 'App\\Models\\Admin', 39),
(26, 'App\\Models\\Admin', 40),
(26, 'App\\Models\\Admin', 41),
(26, 'App\\Models\\Admin', 42),
(26, 'App\\Models\\Admin', 43),
(26, 'App\\Models\\Admin', 50),
(28, 'App\\Models\\Admin', 38),
(28, 'App\\Models\\Admin', 39),
(28, 'App\\Models\\Admin', 40),
(28, 'App\\Models\\Admin', 41),
(28, 'App\\Models\\Admin', 42),
(28, 'App\\Models\\Admin', 43),
(28, 'App\\Models\\Admin', 50),
(31, 'App\\Models\\Admin', 38),
(31, 'App\\Models\\Admin', 39),
(31, 'App\\Models\\Admin', 40),
(31, 'App\\Models\\Admin', 41),
(31, 'App\\Models\\Admin', 42),
(31, 'App\\Models\\Admin', 43),
(31, 'App\\Models\\Admin', 49),
(31, 'App\\Models\\Admin', 50),
(32, 'App\\Models\\Admin', 38),
(32, 'App\\Models\\Admin', 39),
(32, 'App\\Models\\Admin', 40),
(32, 'App\\Models\\Admin', 41),
(32, 'App\\Models\\Admin', 42),
(32, 'App\\Models\\Admin', 43),
(32, 'App\\Models\\Admin', 50),
(33, 'App\\Models\\Admin', 38),
(33, 'App\\Models\\Admin', 39),
(33, 'App\\Models\\Admin', 40),
(33, 'App\\Models\\Admin', 41),
(33, 'App\\Models\\Admin', 42),
(33, 'App\\Models\\Admin', 43),
(33, 'App\\Models\\Admin', 50),
(34, 'App\\Models\\Admin', 38),
(34, 'App\\Models\\Admin', 39),
(34, 'App\\Models\\Admin', 40),
(34, 'App\\Models\\Admin', 41),
(34, 'App\\Models\\Admin', 42),
(34, 'App\\Models\\Admin', 43),
(34, 'App\\Models\\Admin', 50),
(35, 'App\\Models\\Admin', 38),
(35, 'App\\Models\\Admin', 39),
(35, 'App\\Models\\Admin', 40),
(35, 'App\\Models\\Admin', 41),
(35, 'App\\Models\\Admin', 42),
(35, 'App\\Models\\Admin', 43),
(35, 'App\\Models\\Admin', 50),
(36, 'App\\Models\\Admin', 38),
(36, 'App\\Models\\Admin', 39),
(36, 'App\\Models\\Admin', 40),
(36, 'App\\Models\\Admin', 41),
(36, 'App\\Models\\Admin', 42),
(36, 'App\\Models\\Admin', 43),
(36, 'App\\Models\\Admin', 48),
(36, 'App\\Models\\Admin', 50),
(37, 'App\\Models\\Admin', 38),
(37, 'App\\Models\\Admin', 39),
(37, 'App\\Models\\Admin', 40),
(37, 'App\\Models\\Admin', 41),
(37, 'App\\Models\\Admin', 42),
(37, 'App\\Models\\Admin', 43),
(37, 'App\\Models\\Admin', 48),
(37, 'App\\Models\\Admin', 50),
(38, 'App\\Models\\Admin', 38),
(38, 'App\\Models\\Admin', 39),
(38, 'App\\Models\\Admin', 40),
(38, 'App\\Models\\Admin', 41),
(38, 'App\\Models\\Admin', 42),
(38, 'App\\Models\\Admin', 43),
(38, 'App\\Models\\Admin', 48),
(38, 'App\\Models\\Admin', 50),
(39, 'App\\Models\\Admin', 38),
(39, 'App\\Models\\Admin', 39),
(39, 'App\\Models\\Admin', 40),
(39, 'App\\Models\\Admin', 41),
(39, 'App\\Models\\Admin', 42),
(39, 'App\\Models\\Admin', 43),
(39, 'App\\Models\\Admin', 50),
(40, 'App\\Models\\Admin', 38),
(40, 'App\\Models\\Admin', 39),
(40, 'App\\Models\\Admin', 40),
(40, 'App\\Models\\Admin', 41),
(40, 'App\\Models\\Admin', 42),
(40, 'App\\Models\\Admin', 43),
(40, 'App\\Models\\Admin', 48),
(40, 'App\\Models\\Admin', 50),
(41, 'App\\Models\\Admin', 38),
(41, 'App\\Models\\Admin', 39),
(41, 'App\\Models\\Admin', 40),
(41, 'App\\Models\\Admin', 41),
(41, 'App\\Models\\Admin', 42),
(41, 'App\\Models\\Admin', 43),
(41, 'App\\Models\\Admin', 48),
(41, 'App\\Models\\Admin', 50),
(42, 'App\\Models\\Admin', 38),
(42, 'App\\Models\\Admin', 39),
(42, 'App\\Models\\Admin', 40),
(42, 'App\\Models\\Admin', 41),
(42, 'App\\Models\\Admin', 42),
(42, 'App\\Models\\Admin', 43),
(42, 'App\\Models\\Admin', 50),
(43, 'App\\Models\\Admin', 38),
(43, 'App\\Models\\Admin', 39),
(43, 'App\\Models\\Admin', 40),
(43, 'App\\Models\\Admin', 41),
(43, 'App\\Models\\Admin', 42),
(43, 'App\\Models\\Admin', 43),
(43, 'App\\Models\\Admin', 48),
(43, 'App\\Models\\Admin', 50),
(44, 'App\\Models\\Admin', 38),
(44, 'App\\Models\\Admin', 39),
(44, 'App\\Models\\Admin', 40),
(44, 'App\\Models\\Admin', 41),
(44, 'App\\Models\\Admin', 42),
(44, 'App\\Models\\Admin', 43),
(44, 'App\\Models\\Admin', 48),
(44, 'App\\Models\\Admin', 50),
(45, 'App\\Models\\Admin', 38),
(45, 'App\\Models\\Admin', 39),
(45, 'App\\Models\\Admin', 40),
(45, 'App\\Models\\Admin', 41),
(45, 'App\\Models\\Admin', 42),
(45, 'App\\Models\\Admin', 43),
(45, 'App\\Models\\Admin', 44),
(45, 'App\\Models\\Admin', 48),
(45, 'App\\Models\\Admin', 50),
(46, 'App\\Models\\Admin', 38),
(46, 'App\\Models\\Admin', 39),
(46, 'App\\Models\\Admin', 40),
(46, 'App\\Models\\Admin', 41),
(46, 'App\\Models\\Admin', 42),
(46, 'App\\Models\\Admin', 43),
(46, 'App\\Models\\Admin', 44),
(46, 'App\\Models\\Admin', 48),
(46, 'App\\Models\\Admin', 50),
(47, 'App\\Models\\Admin', 38),
(47, 'App\\Models\\Admin', 39),
(47, 'App\\Models\\Admin', 40),
(47, 'App\\Models\\Admin', 41),
(47, 'App\\Models\\Admin', 42),
(47, 'App\\Models\\Admin', 43),
(47, 'App\\Models\\Admin', 50),
(48, 'App\\Models\\Admin', 38),
(48, 'App\\Models\\Admin', 39),
(48, 'App\\Models\\Admin', 40),
(48, 'App\\Models\\Admin', 41),
(48, 'App\\Models\\Admin', 42),
(48, 'App\\Models\\Admin', 43),
(48, 'App\\Models\\Admin', 50),
(49, 'App\\Models\\Admin', 38),
(49, 'App\\Models\\Admin', 39),
(49, 'App\\Models\\Admin', 40),
(49, 'App\\Models\\Admin', 41),
(49, 'App\\Models\\Admin', 42),
(49, 'App\\Models\\Admin', 43),
(49, 'App\\Models\\Admin', 50),
(50, 'App\\Models\\Admin', 38),
(50, 'App\\Models\\Admin', 39),
(50, 'App\\Models\\Admin', 40),
(50, 'App\\Models\\Admin', 41),
(50, 'App\\Models\\Admin', 42),
(50, 'App\\Models\\Admin', 43),
(50, 'App\\Models\\Admin', 50),
(51, 'App\\Models\\Admin', 38),
(51, 'App\\Models\\Admin', 39),
(51, 'App\\Models\\Admin', 40),
(51, 'App\\Models\\Admin', 41),
(51, 'App\\Models\\Admin', 42),
(51, 'App\\Models\\Admin', 43),
(51, 'App\\Models\\Admin', 50),
(52, 'App\\Models\\Admin', 38),
(52, 'App\\Models\\Admin', 39),
(52, 'App\\Models\\Admin', 40),
(52, 'App\\Models\\Admin', 41),
(52, 'App\\Models\\Admin', 42),
(52, 'App\\Models\\Admin', 43),
(52, 'App\\Models\\Admin', 50),
(54, 'App\\Models\\Admin', 38),
(54, 'App\\Models\\Admin', 39),
(54, 'App\\Models\\Admin', 40),
(54, 'App\\Models\\Admin', 41),
(54, 'App\\Models\\Admin', 42),
(54, 'App\\Models\\Admin', 43),
(54, 'App\\Models\\Admin', 50),
(55, 'App\\Models\\Admin', 38),
(55, 'App\\Models\\Admin', 39),
(55, 'App\\Models\\Admin', 40),
(55, 'App\\Models\\Admin', 41),
(55, 'App\\Models\\Admin', 42),
(55, 'App\\Models\\Admin', 43),
(55, 'App\\Models\\Admin', 50),
(56, 'App\\Models\\Admin', 38),
(56, 'App\\Models\\Admin', 39),
(56, 'App\\Models\\Admin', 40),
(56, 'App\\Models\\Admin', 41),
(56, 'App\\Models\\Admin', 42),
(56, 'App\\Models\\Admin', 43),
(56, 'App\\Models\\Admin', 50),
(57, 'App\\Models\\Admin', 38),
(57, 'App\\Models\\Admin', 39),
(57, 'App\\Models\\Admin', 40),
(57, 'App\\Models\\Admin', 41),
(57, 'App\\Models\\Admin', 42),
(57, 'App\\Models\\Admin', 43),
(57, 'App\\Models\\Admin', 50),
(58, 'App\\Models\\Admin', 38),
(58, 'App\\Models\\Admin', 39),
(58, 'App\\Models\\Admin', 40),
(58, 'App\\Models\\Admin', 41),
(58, 'App\\Models\\Admin', 42),
(58, 'App\\Models\\Admin', 43),
(58, 'App\\Models\\Admin', 50),
(59, 'App\\Models\\Admin', 38),
(59, 'App\\Models\\Admin', 39),
(59, 'App\\Models\\Admin', 40),
(59, 'App\\Models\\Admin', 41),
(59, 'App\\Models\\Admin', 42),
(59, 'App\\Models\\Admin', 43),
(59, 'App\\Models\\Admin', 50),
(60, 'App\\Models\\Admin', 38),
(60, 'App\\Models\\Admin', 39),
(60, 'App\\Models\\Admin', 40),
(60, 'App\\Models\\Admin', 41),
(60, 'App\\Models\\Admin', 42),
(60, 'App\\Models\\Admin', 43),
(60, 'App\\Models\\Admin', 49),
(60, 'App\\Models\\Admin', 50);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(9, 'App\\Models\\Admin', 1),
(9, 'App\\Models\\Admin', 44);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_tokens`
--

CREATE TABLE `password_tokens` (
  `id` int(11) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `otp` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `public_name` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `public_name`, `section`, `guard_name`, `created_at`, `updated_at`) VALUES
(8, 'student_edit', 'Edit', 'student', 'admin', NULL, NULL),
(9, 'student_delete', 'Delete', 'student', 'admin', NULL, NULL),
(10, 'lecture_add', 'Add', 'lectures', 'admin', NULL, NULL),
(11, 'lecture_edit', 'Edit', 'lectures', 'admin', NULL, NULL),
(12, 'lecture_delete', 'Delete', 'lectures', 'admin', NULL, NULL),
(13, 'lecture_addstudent', 'Add student on lecture', 'lectures', 'admin', NULL, NULL),
(14, 'lecture_addmatrial', 'Add attachment', 'lectures', 'admin', NULL, NULL),
(15, 'lecture_addvideos', 'Add lecture', 'lectures', 'admin', NULL, NULL),
(16, 'lecture_addcustomvideos', 'Add custom videos', 'lectures', 'admin', NULL, NULL),
(17, 'code_delete', 'Delete', 'Codes', 'admin', NULL, NULL),
(18, 'code_add', 'Add', 'Codes', 'admin', NULL, NULL),
(20, 'request_accept', 'Accept', 'requests', 'admin', NULL, NULL),
(21, 'request_delete', 'Delete', 'requests', 'admin', NULL, NULL),
(23, 'analystics_view', 'View', 'Statistics', 'admin', NULL, NULL),
(24, 'attendance_view', 'View', 'attendance', 'admin', NULL, NULL),
(25, 'attendance_attend', 'Attend', 'attendance', 'admin', NULL, NULL),
(26, 'attendance_edit', 'Edit', 'attendance', 'admin', NULL, NULL),
(28, 'attendance_viewnumberofstudent', 'View number of attendees', 'attendance', 'admin', NULL, NULL),
(31, 'code_update', 'Edit', 'Codes', 'admin', NULL, NULL),
(32, 'group_delete', 'Delete', 'groups', 'admin', NULL, NULL),
(33, 'group_add', 'Add', 'groups', 'admin', NULL, NULL),
(34, 'group_views', 'View', 'groups', 'admin', NULL, NULL),
(35, 'group_update', 'Edit', 'groups', 'admin', NULL, NULL),
(36, 'questionbank_addcategory', 'Add Category', 'question bank', 'admin', NULL, NULL),
(37, 'questionbank_allcategory', 'View Category', 'question bank', 'admin', NULL, NULL),
(38, 'questionbank_updatecategory', 'Edit category', 'question bank', 'admin', NULL, NULL),
(39, 'questionbank_deletecategory', 'Delete category', 'question bank', 'admin', NULL, NULL),
(40, 'questionbank_viewquestionbycategory', 'View Questions', 'question bank', 'admin', NULL, NULL),
(41, 'questionbank_addquestion', 'Add Questions', 'question bank', 'admin', NULL, NULL),
(42, 'questionbank_deletequestion', 'Delete Questions', 'question bank', 'admin', NULL, NULL),
(43, 'questionbank_editquestion', 'Edit Questions', 'question bank', 'admin', NULL, NULL),
(44, 'lecture_view', 'View', 'lectures', 'admin', NULL, NULL),
(45, 'lecture_addquiz', 'Add Exam', 'lectures', 'admin', NULL, NULL),
(46, 'lecture_addHw', 'Add homework', 'lectures', 'admin', NULL, NULL),
(47, 'attendance_viewabsence', 'View Absence', 'attendance', 'admin', NULL, NULL),
(48, 'post_edit', 'Edit', 'Posts', 'admin', NULL, NULL),
(49, 'post_add', 'Add\r\n', 'Posts', 'admin', NULL, NULL),
(50, 'post_delete', 'Delete', 'Posts', 'admin', NULL, NULL),
(51, 'whatsapp_show', 'View', 'Whatsapp', 'admin', NULL, NULL),
(52, 'whatsapp_send', 'Send messages', 'Whatsapp', 'admin', NULL, NULL),
(54, 'exam_add', 'Add\r\n', 'Exams', 'admin', NULL, NULL),
(55, 'exam_edit', 'Edit', 'Exams', 'admin', NULL, NULL),
(56, 'exam_delete', 'Delete', 'Exams', 'admin', NULL, NULL),
(57, 'exam_addquestions', 'Add Questions', 'Exams', 'admin', NULL, NULL),
(58, 'exam_view', 'Students', 'Exams', 'admin', NULL, NULL),
(59, 'code_tracker', 'Code tracker', 'Codes', 'admin', NULL, NULL),
(60, 'code_views', 'Codes table', 'Codes', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Student', 1, 'API TOKEN', '4d1f7b59ff3e8201d72dab262811376cc26b48c6dfb680f0bd6c4a290958d865', '[\"*\"]', NULL, NULL, '2024-07-29 17:03:34', '2024-07-29 17:03:34'),
(2, 'App\\Models\\Student', 2, 'API TOKEN', 'bb8e47d83258a1ecda8dca1e7ffed25795d1dd964a1750ccd9f2fe6bcfa109fd', '[\"*\"]', NULL, NULL, '2024-07-29 17:05:19', '2024-07-29 17:05:19'),
(3, 'App\\Models\\Admin', 1, 'ahmedsabry', 'dafd5f2fe981e1d1fc86d6a71a4552e702900d82ff0ebbc67412265bd9f24df0', '[\"admin\"]', '2024-07-29 23:46:46', NULL, '2024-07-29 17:14:03', '2024-07-29 23:46:46'),
(4, 'App\\Models\\Admin', 1, 'ahmedsabry', 'ebe436cb94268b7133cc62a47121903889e18df0cf02d8e11684a720af2c4fe6', '[\"admin\"]', '2024-07-30 00:31:48', NULL, '2024-07-29 23:58:13', '2024-07-30 00:31:48'),
(5, 'App\\Models\\Admin', 1, 'ahmedsabry', 'e750ec80b74f978c8be058960f020fceda9186d15bc1bcd3d14bf0bed88313f2', '[\"admin\"]', '2024-07-30 21:31:10', NULL, '2024-07-30 04:49:01', '2024-07-30 21:31:10'),
(6, 'App\\Models\\Admin', 1, 'ahmedsabry', '85d4af8e8ba6784561afd66ab6d80d387b5409ad2c56eec59c9c9e618b050f35', '[\"admin\"]', '2024-07-31 16:50:52', NULL, '2024-07-31 16:00:55', '2024-07-31 16:50:52'),
(7, 'App\\Models\\Student', 2, '01124265941', 'd8f50a16235feece776767d01c9640369e25948104174dd89e6c69479f1046e5', '[\"student\"]', '2024-07-31 20:22:24', NULL, '2024-07-31 16:53:54', '2024-07-31 20:22:24'),
(8, 'App\\Models\\Admin', 1, 'ahmedsabry', '6e29e1d9d37d2e87e672f5f5d09cc55b0d99dadf6d433c03f9326a93b187cf16', '[\"admin\"]', '2024-07-31 17:13:38', NULL, '2024-07-31 16:55:49', '2024-07-31 17:13:38'),
(9, 'App\\Models\\Admin', 1, 'ahmedsabry', '13a1653859f4ce6e0317e6415622ffcd3ed6901da3a0037ab30e70354e447fc4', '[\"admin\"]', '2024-07-31 18:26:16', NULL, '2024-07-31 18:25:48', '2024-07-31 18:26:16'),
(10, 'App\\Models\\Student', 2, '01124265941', 'bbb8a0bd3638d49df11dee26c1e4cca8376194d8e7fc14b80d91fa148bd94328', '[\"student\"]', '2024-08-01 19:15:50', NULL, '2024-08-01 19:01:39', '2024-08-01 19:15:50'),
(11, 'App\\Models\\Student', 2, '01124265941', '43ec12f2ec2689f6ede6b1c83a460630036ae04697f61524c44296521091fc58', '[\"student\"]', '2024-08-01 23:17:51', NULL, '2024-08-01 19:17:49', '2024-08-01 23:17:51'),
(12, 'App\\Models\\Admin', 1, 'ahmedsabry', '8903b06a7d746785df21693dc604aaa8ed664226570dc03b1f902e61e1e39d47', '[\"admin\"]', '2024-08-01 21:48:48', NULL, '2024-08-01 21:48:03', '2024-08-01 21:48:48'),
(13, 'App\\Models\\Admin', 1, 'ahmedsabry', '4891c1b2a2f798fef03dd6df466818268425edb0ebb86a185c1653d624d9aafe', '[\"admin\"]', '2024-08-01 22:27:23', NULL, '2024-08-01 22:27:19', '2024-08-01 22:27:23'),
(14, 'App\\Models\\Admin', 1, 'ahmedsabry', 'bc81875002aaeab7158a01b42a56874dad4f5aa830eec6fba0819c7ae9d623da', '[\"admin\"]', '2024-08-03 18:35:57', NULL, '2024-08-02 16:38:27', '2024-08-03 18:35:57'),
(15, 'App\\Models\\Admin', 1, 'ahmedsabry', 'bba8772fd64adeeaa25cb73fa7829c020e4851ac588518990417b37d5526bff3', '[\"admin\"]', '2024-08-02 17:40:59', NULL, '2024-08-02 17:34:42', '2024-08-02 17:40:59'),
(16, 'App\\Models\\Admin', 1, 'ahmedsabry', 'df2359a0efcf3f7cce97bb5470948fd41a2395da29a9391795f417ec0550fc3d', '[\"admin\"]', '2024-08-03 20:39:03', NULL, '2024-08-03 17:57:57', '2024-08-03 20:39:03'),
(17, 'App\\Models\\Admin', 1, 'ahmedsabry', '44c1290951102e231e84d72eff141e2723cf42240e69c266107e8a95120c4ab6', '[\"admin\"]', '2024-08-03 18:38:32', NULL, '2024-08-03 18:38:10', '2024-08-03 18:38:32'),
(18, 'App\\Models\\Admin', 1, 'ahmedsabry', '0ae88b2c044deab382c06c705573e1b1aa40ee894318399f975bd5fd936f15d0', '[\"admin\"]', '2024-08-03 20:01:50', NULL, '2024-08-03 20:01:11', '2024-08-03 20:01:50'),
(19, 'App\\Models\\Admin', 1, 'ahmedsabry', '280a8748deae4b77667c21f534cb523d74424c3f3864236412eb974fdee030b9', '[\"admin\"]', '2024-08-03 23:27:37', NULL, '2024-08-03 20:02:23', '2024-08-03 23:27:37'),
(20, 'App\\Models\\Admin', 1, 'ahmedsabry', '930a85dbba96b671c208652d0758f3f30ab7f6917f157ac5434732bdb7d3ee98', '[\"admin\"]', '2024-08-03 20:38:55', NULL, '2024-08-03 20:36:03', '2024-08-03 20:38:55'),
(21, 'App\\Models\\Admin', 1, 'ahmedsabry', '6c67767cbfec55e53a1686be12fc15b90f392336cb3263f89b7add09ce94ee1d', '[\"admin\"]', '2024-08-04 18:55:15', NULL, '2024-08-03 23:29:53', '2024-08-04 18:55:15'),
(22, 'App\\Models\\Admin', 1, 'ahmedsabry', '8c8501ac3eea3b7808312873df3e708d4e7298fcb81632755f9d1b9029fdd272', '[\"admin\"]', '2024-08-04 01:24:13', NULL, '2024-08-04 00:00:56', '2024-08-04 01:24:13'),
(23, 'App\\Models\\Student', 2, '01124265941', '125bd5986f5a86af52499850cd9224daf16d25fd5184c6353515ca3fee5d3538', '[\"student\"]', '2024-08-04 00:14:12', NULL, '2024-08-04 00:10:52', '2024-08-04 00:14:12'),
(24, 'App\\Models\\Student', 2, '01124265941', 'c8b58220ff25a85e8009d8655d3ac85e03f558214d79dc7697e9e002a2a54e02', '[\"student\"]', '2024-08-04 01:25:41', NULL, '2024-08-04 01:24:41', '2024-08-04 01:25:41'),
(25, 'App\\Models\\Admin', 1, 'ahmedsabry', '4b263b4717ded551dfba96356f7c7dd849a6403554609683571653e8f2dc8357', '[\"admin\"]', '2024-08-04 17:48:00', NULL, '2024-08-04 13:24:11', '2024-08-04 17:48:00'),
(26, 'App\\Models\\Admin', 1, 'ahmedsabry', '7d00923464cf7320bb3a55e5321be9520410addb53cbc9d6659816f7ed208580', '[\"admin\"]', '2024-08-04 20:59:44', NULL, '2024-08-04 19:34:43', '2024-08-04 20:59:44'),
(27, 'App\\Models\\Student', 2, '01124265941', 'a9b3529d49abaebb2a60f955a5ecf353a3b767df858125dc207218eb5ba1fb82', '[\"student\"]', '2024-08-04 20:57:32', NULL, '2024-08-04 19:35:54', '2024-08-04 20:57:32'),
(28, 'App\\Models\\Admin', 1, 'ahmedsabry', 'e4f82d5a29e1ec43a99f865a12960ba4a58ca6a8a8cc831935a9f184d50d3164', '[\"admin\"]', '2024-08-04 21:22:28', NULL, '2024-08-04 21:01:21', '2024-08-04 21:22:28'),
(29, 'App\\Models\\Admin', 1, 'ahmedsabry', '224f033d8c5766b04802149b1cb962c823c278f34d6fbcf577ad9aca869dfbf7', '[\"admin\"]', '2024-08-06 17:06:04', NULL, '2024-08-06 16:28:13', '2024-08-06 17:06:04'),
(30, 'App\\Models\\Admin', 1, 'ahmedsabry', 'eb7cb0ed132ca619172a41fad11e5eac2f81ec07fb9625b1c5e457040045788a', '[\"admin\"]', '2024-08-13 01:44:32', NULL, '2024-08-06 16:40:10', '2024-08-13 01:44:32'),
(31, 'App\\Models\\Admin', 39, 'Jana-Halaby', '81ccc4797bfe02dadf3e50666a9a4cab09cf1a892720edc3e240e97848b652da', '[\"admin\"]', '2024-08-10 21:27:01', NULL, '2024-08-06 17:08:58', '2024-08-10 21:27:01'),
(32, 'App\\Models\\Admin', 1, 'ahmedsabry', '2dc251bc758cad2f01b623ef24eb6d6fea134ceb6632f6269f25fa9354579b15', '[\"admin\"]', '2024-08-07 16:54:11', NULL, '2024-08-07 16:18:17', '2024-08-07 16:54:11'),
(33, 'App\\Models\\Admin', 1, 'ahmedsabry', '39550c50af602515cab6103b920e91b0c2bdff00f20dbff07958333505037fe1', '[\"admin\"]', '2024-08-07 17:33:55', NULL, '2024-08-07 17:02:03', '2024-08-07 17:33:55'),
(34, 'App\\Models\\Admin', 1, 'ahmedsabry', 'd26b75de709b674e389af2b8d93216cee83df7ddd1fcba7719c3b882fab4a185', '[\"admin\"]', '2024-08-07 18:45:29', NULL, '2024-08-07 17:57:06', '2024-08-07 18:45:29'),
(35, 'App\\Models\\Admin', 1, 'AhmedSabry', '5a10f54b6bd6a49a6702d2a093f544d35bea17c7e1f61d61f9273cd092f680ee', '[\"admin\"]', '2024-08-16 23:27:07', NULL, '2024-08-10 21:28:25', '2024-08-16 23:27:07'),
(36, 'App\\Models\\Admin', 1, 'ahmedsabry', '6af3ef6ca7ff50341253b469dfeef09948b8607ffab85ca86b4244ece8f001d9', '[\"admin\"]', '2024-08-12 23:26:12', NULL, '2024-08-12 23:12:07', '2024-08-12 23:26:12'),
(37, 'App\\Models\\Admin', 1, 'ahmedsabry', '46e37895e898c4d1785bf1106419c9e3ae05c71e0e5334c6f41991b7b6bae6d3', '[\"admin\"]', '2024-08-13 01:13:14', NULL, '2024-08-12 23:27:49', '2024-08-13 01:13:14'),
(38, 'App\\Models\\Student', 2, '01124265941', '642d9a62b47acdd9809d907e2d888321527b0ff06a4ff3656b210bee789ec6e3', '[\"student\"]', '2024-08-13 01:23:28', NULL, '2024-08-12 23:28:28', '2024-08-13 01:23:28'),
(39, 'App\\Models\\Admin', 44, 'test', 'e1392711b8818a5535be50d34297d7a4a1c9db11c157f2b1f10a7ad6dea64430', '[\"admin\"]', '2024-08-13 01:28:13', NULL, '2024-08-13 01:17:18', '2024-08-13 01:28:13'),
(40, 'App\\Models\\Admin', 1, 'ahmedsabry', '53756f1ce6bbc903fff677dae4b6d9578869f6300d29ac6535085c107baba91f', '[\"admin\"]', '2024-08-13 02:11:15', NULL, '2024-08-13 01:36:36', '2024-08-13 02:11:15'),
(41, 'App\\Models\\Admin', 38, 'Nour', '7411880fa5fe9bad0e8325901919328989f14584c9b8874c9b09f2596fbba4ea', '[\"admin\"]', '2024-08-20 23:14:08', NULL, '2024-08-15 05:23:09', '2024-08-20 23:14:08'),
(42, 'App\\Models\\Admin', 1, 'ahmedsabry', 'a31f6a8d7f8a99c87ed04ad880f5c985bed5dde554e9a21dd9a84fdda8296dbe', '[\"admin\"]', '2024-08-15 13:08:37', NULL, '2024-08-15 12:55:44', '2024-08-15 13:08:37'),
(43, 'App\\Models\\Admin', 1, 'ahmedsabry', 'c59449eb9506647abf44328f5edff2d6731ebfa9216d29a69468676f37e8a7e2', '[\"admin\"]', '2024-08-18 20:28:23', NULL, '2024-08-15 12:58:16', '2024-08-18 20:28:23'),
(44, 'App\\Models\\Admin', 43, 'Menna', '6bfd9da7947515c0900b5b371bee5bfbb200f6191411a9d190beab4857201e4a', '[\"admin\"]', '2024-08-21 16:10:42', NULL, '2024-08-15 18:36:34', '2024-08-21 16:10:42'),
(45, 'App\\Models\\Admin', 41, 'Mariz-nabil', '34697fcf2725f4f4c767f1528327f1af4635169801039a8b0f666e9cc34d0223', '[\"admin\"]', '2024-08-15 21:02:01', NULL, '2024-08-15 20:54:15', '2024-08-15 21:02:01'),
(46, 'App\\Models\\Admin', 1, 'ahmedsabry', '436c686bdc6e585d164ec9fdcd52a56ffee8631af4d2b368381b1b886190fdc3', '[\"admin\"]', '2024-08-16 23:48:29', NULL, '2024-08-16 23:28:01', '2024-08-16 23:48:29'),
(47, 'App\\Models\\Admin', 40, 'Mariam-Osman', '23a6897b80d30a905ef918c2ead4e219ab944a937e41d1d6f6ed9b1eecffbaa0', '[\"admin\"]', '2024-08-17 00:08:27', NULL, '2024-08-16 23:48:46', '2024-08-17 00:08:27'),
(48, 'App\\Models\\Admin', 1, 'ahmedsabry', '2ad7fddadff446789bdbd038ddf59b48b01227ce1f1a83d8f24ee377556f0e90', '[\"admin\"]', '2024-08-17 01:59:35', NULL, '2024-08-17 01:49:51', '2024-08-17 01:59:35'),
(49, 'App\\Models\\Student', 3, 'API TOKEN', '2a92c424d161d69ed8476de2d6343da5e01d54ac30192e7cf2c1323ac8765480', '[\"*\"]', NULL, NULL, '2024-08-17 01:59:35', '2024-08-17 01:59:35'),
(50, 'App\\Models\\Admin', 1, 'ahmedsabry', '7bff8611e0f064c4abc12c650a2526ba13dbc237a92b31d4cc87c48d298af6a6', '[\"admin\"]', '2024-08-23 15:20:47', NULL, '2024-08-17 16:12:11', '2024-08-23 15:20:47'),
(51, 'App\\Models\\Admin', 1, 'ahmedsabry', 'a491f0892bf030af93e8db5d139013026c92152a14f5cd8bc2ebf7b2b0ac3480', '[\"admin\"]', '2024-08-17 16:25:54', NULL, '2024-08-17 16:18:29', '2024-08-17 16:25:54'),
(52, 'App\\Models\\Admin', 1, 'ahmedsabry', 'f4b95aa1f31a86ad9ff650d18216adebdb6a719fadde9774549b99f162d18440', '[\"admin\"]', '2024-08-18 23:06:27', NULL, '2024-08-18 20:30:41', '2024-08-18 23:06:27'),
(53, 'App\\Models\\Student', 2, '01124265941', '97ec1bb68ec6363c3b9aac3ba6bf41e53513a121acc8cc0c223a218341ab7674', '[\"student\"]', '2024-08-18 21:09:25', NULL, '2024-08-18 20:31:51', '2024-08-18 21:09:25'),
(54, 'App\\Models\\Admin', 1, 'ahmedsabry', '5a519f67ff534ca89debc077016043d3cf857297e95c58a2f27dbca5fb2cf40d', '[\"admin\"]', '2024-08-19 15:48:37', NULL, '2024-08-19 15:34:59', '2024-08-19 15:48:37'),
(55, 'App\\Models\\Student', 2, '01124265941', 'cf977d2df83bc879515cf133ad2b59364a2f043496991bdcf2758de91172ad36', '[\"student\"]', '2024-08-19 16:53:14', NULL, '2024-08-19 15:48:31', '2024-08-19 16:53:14'),
(56, 'App\\Models\\Admin', 1, 'ahmedsabry', 'cb2fbb1b3e15226a02d0740615bda4abf7f957b7eb3078c63b4c4d911dd3fce1', '[\"admin\"]', '2024-08-19 15:50:02', NULL, '2024-08-19 15:49:43', '2024-08-19 15:50:02'),
(57, 'App\\Models\\Admin', 1, 'ahmedsabry', 'dd14a4d6609e91b9955290b96e85022585299f86abab765811c6e00fa4f4927c', '[\"admin\"]', '2024-08-21 20:13:55', NULL, '2024-08-19 15:50:44', '2024-08-21 20:13:55'),
(58, 'App\\Models\\Student', 4, 'API TOKEN', 'd1c3fc92b674e871f9ab81b4522dae89acc9448ebb2456a49729d526c899b881', '[\"*\"]', NULL, NULL, '2024-08-20 22:15:34', '2024-08-20 22:15:34'),
(59, 'App\\Models\\Student', 4, '01141094247', '104fda14a542be563a5d0be9ad7a2ec8363a43334ab7e15c0e312feeb46bf631', '[\"student\"]', '2024-08-22 22:55:24', NULL, '2024-08-20 22:20:01', '2024-08-22 22:55:24'),
(60, 'App\\Models\\Student', 2, '01124265941', '4c9cf804ca69bcebdf0ac0d04d8c7496158fa2186e983b3e2978a3a4d89917c6', '[\"student\"]', '2024-08-22 19:27:07', NULL, '2024-08-21 02:18:39', '2024-08-22 19:27:07'),
(61, 'App\\Models\\Admin', 1, 'ahmedsabry', '655ec43d61bcc93dfd25a79e2993f57d23c29c73a606c2d85bff2d35691fbff7', '[\"admin\"]', '2024-08-21 02:25:25', NULL, '2024-08-21 02:20:34', '2024-08-21 02:25:25'),
(62, 'App\\Models\\Admin', 1, 'ahmedsabry', '270d4e74973ef2a0c658fb62ba979ece2082bdf46d8e2651f026d8be4ea82dd9', '[\"admin\"]', '2024-08-21 20:20:22', NULL, '2024-08-21 20:20:22', '2024-08-21 20:20:22'),
(63, 'App\\Models\\Admin', 1, 'ahmedsabry', '73607e959f8f261db4c6cf4e7ec940641180f7f4b57f120fdd687cb3906cc5cd', '[\"admin\"]', '2024-08-22 23:00:46', NULL, '2024-08-22 18:52:57', '2024-08-22 23:00:46'),
(64, 'App\\Models\\Admin', 1, 'ahmedsabry', '495c2aecc999fdbd8d4fe438070a0a05d0e389844f1d544633931e4207e605b5', '[\"admin\"]', '2024-08-22 19:27:58', NULL, '2024-08-22 19:27:41', '2024-08-22 19:27:58'),
(65, 'App\\Models\\Admin', 38, 'Nour', '1ebd4318333801fd157bf524f6fcec0d64367238a9ab9f6b57202bcab3031f09', '[\"admin\"]', '2024-08-22 22:57:40', NULL, '2024-08-22 22:15:51', '2024-08-22 22:57:40'),
(66, 'App\\Models\\Admin', 42, 'Christy', 'a910ce6a1f1ace667109e83cc92a710778fc3d54b91a71ca25e940f04affcf4e', '[\"admin\"]', '2024-08-22 22:33:13', NULL, '2024-08-22 22:31:18', '2024-08-22 22:33:13'),
(67, 'App\\Models\\Admin', 42, 'Christy', '36201df92f167ffc41d8dc05bf29fc6a912f1faeda4f9200b3d3acd036f46698', '[\"admin\"]', '2024-08-25 12:42:33', NULL, '2024-08-22 22:33:51', '2024-08-25 12:42:33'),
(68, 'App\\Models\\Admin', 41, 'Mariz-nabil', '537c06dcb055d4ea0bc5407abdf068f4479f6dc6052691ae304a132555e8950d', '[\"admin\"]', '2024-08-28 19:22:34', NULL, '2024-08-22 22:38:45', '2024-08-28 19:22:34'),
(69, 'App\\Models\\Student', 5, 'API TOKEN', '0cc4f9a57e412b2da6fc15a8cf36529fe8ffeb4a010a73efbb429e13f30018c1', '[\"*\"]', NULL, NULL, '2024-08-22 22:45:26', '2024-08-22 22:45:26'),
(70, 'App\\Models\\Student', 5, '01223844888', 'a299dbaa2f6751fb32c95b4449410034402ae7e8a31ff944d29e36c1fc67ddec', '[\"student\"]', '2024-08-28 19:15:03', NULL, '2024-08-22 22:57:27', '2024-08-28 19:15:03'),
(71, 'App\\Models\\Student', 6, 'API TOKEN', '61701d1e68f5eca9a4e516e7ea767269a2373c2b47fb09e80c843393e76e53c5', '[\"*\"]', NULL, NULL, '2024-08-22 22:57:29', '2024-08-22 22:57:29'),
(72, 'App\\Models\\Admin', 38, 'Nour', '6ddbbcd7b8a0a708a7526fedf237d3ae5b3f41a700ce3e288a4cb15a7ce5462a', '[\"admin\"]', '2024-08-29 18:23:14', NULL, '2024-08-22 22:59:28', '2024-08-29 18:23:14'),
(73, 'App\\Models\\Admin', 39, 'Jana-Halaby', '15fd829f78847c2a739eaf5323a7ca9fe280fc835bdf4963b3f4ae60c002cc21', '[\"admin\"]', '2024-08-23 04:51:40', NULL, '2024-08-23 04:50:42', '2024-08-23 04:51:40'),
(74, 'App\\Models\\Admin', 1, 'ahmedsabry', 'acdd67862a1f85bd04ace5eff6ef6153672cc31155d7c94bbb390474a9f171db', '[\"admin\"]', '2024-08-23 16:08:52', NULL, '2024-08-23 16:08:42', '2024-08-23 16:08:52'),
(75, 'App\\Models\\Admin', 1, 'AhmedSabry', '6eec03fb7dc24ae07b3d4b5af8ce1771b0e0cbc377afe2de59032e8479e60716', '[\"admin\"]', '2024-08-24 22:11:03', NULL, '2024-08-23 20:05:58', '2024-08-24 22:11:03'),
(76, 'App\\Models\\Student', 7, 'API TOKEN', '4173b2181f1fd35f5179a17fd16eeed09693fe238c41c73324b5f5553389db02', '[\"*\"]', NULL, NULL, '2024-08-24 22:02:13', '2024-08-24 22:02:13'),
(77, 'App\\Models\\Student', 7, '01206103056', 'd2d19d98aa6ed0db99d8ed63905909cec16a361101b281a6845a8e75e70f23f7', '[\"student\"]', '2024-08-30 18:40:32', NULL, '2024-08-24 22:02:41', '2024-08-30 18:40:32'),
(78, 'App\\Models\\Admin', 1, 'ahmedsabry', 'ef61a2cfd044b533223c91f2e62927327426d390136d5c197733f92bb98f8013', '[\"admin\"]', '2024-08-28 19:19:29', NULL, '2024-08-28 19:19:11', '2024-08-28 19:19:29'),
(79, 'App\\Models\\Admin', 42, 'Christy', '4db643d2f6b84341167467dd214761303a3999b7508ea4583fa1c422fc2bba58', '[\"admin\"]', '2024-08-28 21:12:20', NULL, '2024-08-28 19:21:32', '2024-08-28 21:12:20'),
(80, 'App\\Models\\Student', 8, 'API TOKEN', 'b5ec06b345cdb7a1748b7ff8de33e973d80bf16d459d01fa3f4082cec0f6da24', '[\"*\"]', NULL, NULL, '2024-08-28 19:24:24', '2024-08-28 19:24:24'),
(81, 'App\\Models\\Admin', 41, 'Mariz-nabil', 'f1dec0fb84ded2c2fc05158e1ef89d36783c4fbca9829723a55bbd340c3b66f0', '[\"admin\"]', '2024-08-28 20:06:19', NULL, '2024-08-28 19:26:12', '2024-08-28 20:06:19'),
(82, 'App\\Models\\Student', 5, '01223844888', '51746a52f67221db95d25014b382a391e8789404e01cf82cae41da3d5279993f', '[\"student\"]', '2024-08-28 19:36:31', NULL, '2024-08-28 19:31:10', '2024-08-28 19:36:31'),
(83, 'App\\Models\\Admin', 1, 'ahmedsabry', 'e7810694adf03727f500befd92139e6bc3b071a4ad693e62cbb63709c2be2a97', '[\"admin\"]', '2024-09-02 21:00:02', NULL, '2024-08-28 19:35:11', '2024-09-02 21:00:02'),
(84, 'App\\Models\\Student', 9, 'API TOKEN', 'abe11655c5b6c124ef177f5c39f3730cdd5e23c5deb0264174920409a1d6853b', '[\"*\"]', NULL, NULL, '2024-08-28 19:35:43', '2024-08-28 19:35:43'),
(85, 'App\\Models\\Student', 10, 'API TOKEN', '8f94f9c78f238a9228118082016f4317125d4a2052318c90b10b05e7afa071b1', '[\"*\"]', NULL, NULL, '2024-08-28 19:35:50', '2024-08-28 19:35:50'),
(86, 'App\\Models\\Student', 5, '01223844888', '2a75bee6e4ec2d6418e867d2d33817493a03171fbd6d74d7593ec94068942c7a', '[\"student\"]', '2024-08-28 19:58:50', NULL, '2024-08-28 19:37:22', '2024-08-28 19:58:50'),
(87, 'App\\Models\\Admin', 43, 'Menna', 'ab3c1cb877647e65f755a28d27d233978eb058e6b8fc5a59892dc4baee24473c', '[\"admin\"]', '2024-08-28 20:45:15', NULL, '2024-08-28 19:43:13', '2024-08-28 20:45:15'),
(88, 'App\\Models\\Student', 9, '01288804917', '639f89cb4fd058f674208065d160325eed072524e2aa3178cd5939d7574bc356', '[\"student\"]', '2024-08-28 20:14:58', NULL, '2024-08-28 20:09:59', '2024-08-28 20:14:58'),
(89, 'App\\Models\\Student', 11, 'API TOKEN', '0fa0387a1066b78a468082d12f40a032da215e0159d6c049e489328cf5c56ce3', '[\"*\"]', NULL, NULL, '2024-08-28 20:12:58', '2024-08-28 20:12:58'),
(90, 'App\\Models\\Admin', 41, 'Mariz-nabil', '32b60d3cbeae6cb09152d993e97b3d7f40a5b114e517d3d0ec0016d6928672f1', '[\"admin\"]', '2024-08-28 20:15:52', NULL, '2024-08-28 20:15:33', '2024-08-28 20:15:52'),
(91, 'App\\Models\\Student', 11, '01011825619', 'aa9100767142a4cb9a5cdd034f4eb159f7cb3b72c48006e9f77dd685a72c2770', '[\"student\"]', '2024-08-28 20:16:31', NULL, '2024-08-28 20:15:57', '2024-08-28 20:16:31'),
(92, 'App\\Models\\Admin', 1, 'ahmedsabry', '720ffa308711485e659c46b3e01abbe8604ab5f3c21c02075039e6366b69d316', '[\"admin\"]', '2024-09-03 04:39:07', NULL, '2024-08-28 20:38:50', '2024-09-03 04:39:07'),
(93, 'App\\Models\\Student', 5, '01223844888', 'd033a3ee98f326d28cd9764c5ccc40aaf220b17652bd4fea2a1fb320d3b68268', '[\"student\"]', '2024-08-28 21:05:16', NULL, '2024-08-28 20:53:54', '2024-08-28 21:05:16'),
(94, 'App\\Models\\Admin', 1, 'ahmedsabry', '0b274a487dc50748839e9991a54016428b6cbe782701376b7db65c452bd8cc9b', '[\"admin\"]', '2024-08-29 04:28:10', NULL, '2024-08-29 04:24:55', '2024-08-29 04:28:10'),
(95, 'App\\Models\\Admin', 42, 'Christy', '0d32e22283a4435566ba0271b4ebc9ff03643912f49d09d152bd3d217384fba1', '[\"admin\"]', '2024-08-29 23:22:23', NULL, '2024-08-29 18:59:56', '2024-08-29 23:22:23'),
(96, 'App\\Models\\Admin', 1, 'ahmedsabry', 'a5b4b738cb13bda20c7646bfca77c54be5968fc519ed15d1f44092ee96c53dd0', '[\"admin\"]', '2024-08-29 22:24:22', NULL, '2024-08-29 21:34:10', '2024-08-29 22:24:22'),
(97, 'App\\Models\\Admin', 1, 'ahmedsabry', '468f906b8d617c795cfc6a0ba10fbd309311ecb48cd3bb4c09563149a9ec6630', '[\"admin\"]', '2024-08-29 22:44:41', NULL, '2024-08-29 22:26:18', '2024-08-29 22:44:41'),
(98, 'App\\Models\\Admin', 1, 'ahmedsabry', '0fca2935e7e01d6f7fe267814a7891dc45d0af7df6eb6b2e925ce0cd8cc4a3db', '[\"admin\"]', '2024-08-29 23:28:29', NULL, '2024-08-29 22:47:39', '2024-08-29 23:28:29'),
(99, 'App\\Models\\Admin', 1, 'ahmedsabry', '17991bdd01f4e6b46492942757211c52aae787a96a6da9aa65c40eada73575f9', '[\"admin\"]', '2024-09-01 19:36:36', NULL, '2024-09-01 19:36:14', '2024-09-01 19:36:36'),
(100, 'App\\Models\\Admin', 1, 'ahmedsabry', 'a6b35926d56f1e5516396fe2be34efd1039afcaad526227a87a9104aa91df364', '[\"admin\"]', '2024-09-01 21:56:39', NULL, '2024-09-01 19:40:01', '2024-09-01 21:56:39'),
(101, 'App\\Models\\Admin', 1, 'AhmedSabry', '2f7b388153a4cbf3c5bacc078ba48603626746728bdbba0340cf963a0d3b479a', '[\"admin\"]', '2024-09-06 22:21:23', NULL, '2024-09-06 22:20:39', '2024-09-06 22:21:23'),
(102, 'App\\Models\\Admin', 1, 'AhmedSabry', 'cec4a1713819c12ff7d976213e81467e344db58047349529afad2c4f3c5199fd', '[\"admin\"]', '2024-09-09 12:45:58', NULL, '2024-09-07 01:55:10', '2024-09-09 12:45:58'),
(103, 'App\\Models\\Admin', 38, 'Nour', 'c3f726fd44855a3c8ac36ab43fc3984c184da7d3a201cba6bd6dd76e52de2701', '[\"admin\"]', '2024-09-11 18:58:09', NULL, '2024-09-07 21:11:34', '2024-09-11 18:58:09'),
(104, 'App\\Models\\Student', 12, 'API TOKEN', '66b644d81dc08c5778a5a90ad12a2055c69fde0637c19cd12f7f67136c641873', '[\"*\"]', NULL, NULL, '2024-09-07 21:19:40', '2024-09-07 21:19:40'),
(105, 'App\\Models\\Student', 12, '01033636936', '544beb5f081bbdda0672fc6f191305b891b9d50dcd6d7d61a4c99bf467a4c0bc', '[\"student\"]', '2024-09-08 18:19:08', NULL, '2024-09-08 18:13:23', '2024-09-08 18:19:08'),
(106, 'App\\Models\\Admin', 1, 'ahmedsabry', '62a4e6714fc53e8d869e12b06280f3d9106793932d635bf5cdd524f6891e5127', '[\"admin\"]', '2024-09-08 20:44:53', NULL, '2024-09-08 19:11:26', '2024-09-08 20:44:53'),
(107, 'App\\Models\\Student', 2, '01124265941', 'ac6d44c64904ff0d86d40d80d0e52900d16b86fd3f117a5e492585621d500cd4', '[\"student\"]', '2024-09-08 20:39:48', NULL, '2024-09-08 20:33:33', '2024-09-08 20:39:48'),
(108, 'App\\Models\\Student', 2, '01124265941', 'e315e0ed0f596f28f85e46269cad3b8b2dec50172e8af87e05f69250269a63c3', '[\"student\"]', '2024-09-09 03:22:07', NULL, '2024-09-08 20:42:11', '2024-09-09 03:22:07'),
(109, 'App\\Models\\Admin', 38, 'Nour', '7257e6e81b967222d8ebdab8e356f9ddd5a5201d2cfacae4f934c6f43dbfece2', '[\"admin\"]', '2024-09-15 23:49:46', NULL, '2024-09-09 06:11:08', '2024-09-15 23:49:46'),
(110, 'App\\Models\\Admin', 47, 'Mohanad', '336285b6dfd9abc9456c407ff9ae9cd45cc9d16aaec6f34de5378debf3c229ea', '[\"admin\"]', '2024-09-12 19:21:30', NULL, '2024-09-09 12:46:11', '2024-09-12 19:21:30'),
(111, 'App\\Models\\Student', 12, '01033636936', 'ccb95d3882526a0d162118d48ea2286c911c9aba06cfaf08300e7efa1b940036', '[\"student\"]', '2024-09-09 19:21:29', NULL, '2024-09-09 19:15:57', '2024-09-09 19:21:29'),
(112, 'App\\Models\\Student', 12, '01033636936', 'f0309baed87f8603ae6794454bcfc288a0e1ae1b83b7eac63765f67e9fabadb5', '[\"student\"]', '2024-09-09 19:56:17', NULL, '2024-09-09 19:55:19', '2024-09-09 19:56:17'),
(113, 'App\\Models\\Student', 13, 'API TOKEN', '75e25df5f41d99cf8304ed30b75df9ab7b861c199b457cfa002a0e7a36a39452', '[\"*\"]', NULL, NULL, '2024-09-09 19:59:26', '2024-09-09 19:59:26'),
(114, 'App\\Models\\Student', 13, '01033636936', '30cfc6819fb8b0b2e0b44aa4bc4843652abc430cf6194ffefd87f3f290a4d41e', '[\"student\"]', '2024-09-09 20:05:26', NULL, '2024-09-09 20:00:04', '2024-09-09 20:05:26'),
(115, 'App\\Models\\Admin', 1, 'ahmedsabry', '0c373ec786fa9194de8da221ba31d73cb00d09365cc71e216d1bd82260b18c3e', '[\"admin\"]', '2024-09-11 19:19:09', NULL, '2024-09-10 20:27:02', '2024-09-11 19:19:09'),
(116, 'App\\Models\\Student', 4, '01141094247', '16c0dfab0b96bdd23e9d7e1787193bc0c0a90af2befa1060819d19176d8aa1e4', '[\"student\"]', '2024-09-11 01:16:51', NULL, '2024-09-10 22:40:16', '2024-09-11 01:16:51'),
(117, 'App\\Models\\Student', 14, 'API TOKEN', 'bf675e2b30390536e95e6affab7b856a1ba9fa23c686e90002b35249fb751580', '[\"*\"]', NULL, NULL, '2024-09-10 22:57:01', '2024-09-10 22:57:01'),
(118, 'App\\Models\\Student', 15, 'API TOKEN', 'b70685c75aacce475d3590d2189a4a2b77491a53e3b0e6aa3c43cfd1df1ff284', '[\"*\"]', NULL, NULL, '2024-09-10 23:00:22', '2024-09-10 23:00:22'),
(119, 'App\\Models\\Admin', 1, 'ahmedsabry', '280c8519eb1873f9355737baafdeecd21e1ce48cc4fd9efd4b7d43955304e8be', '[\"admin\"]', '2024-09-15 02:39:06', NULL, '2024-09-11 01:30:28', '2024-09-15 02:39:06'),
(120, 'App\\Models\\Student', 2, '01124265941', 'eff0f3cc42f4603483c26b5cfd236ac2eae4de7ce9c8532fe8579b3c6655a853', '[\"student\"]', '2024-09-11 01:44:33', NULL, '2024-09-11 01:43:24', '2024-09-11 01:44:33'),
(121, 'App\\Models\\Admin', 1, 'ahmedsabry', 'd76e79d93ba8482f091e4d6767c3c8a08d87a9076d6ceeb70fe9adafd0152fd8', '[\"admin\"]', '2024-09-11 04:15:14', NULL, '2024-09-11 03:23:11', '2024-09-11 04:15:14'),
(122, 'App\\Models\\Admin', 1, 'ahmedsabry', '1d5ea415ed18de8d39bb672093750a5de46f7f5eeea67de6562c877d3791d649', '[\"admin\"]', '2024-09-11 04:19:44', NULL, '2024-09-11 04:17:41', '2024-09-11 04:19:44'),
(123, 'App\\Models\\Admin', 41, 'Mariz-nabil', 'd14da6f4fb67d37c1699923f4aec59fbf01c25deb759bc8e525d5ef83caba592', '[\"admin\"]', '2024-09-11 19:27:14', NULL, '2024-09-11 19:05:16', '2024-09-11 19:27:14'),
(124, 'App\\Models\\Admin', 1, 'ahmedsabry', '12b5472fc92813358a9be0d95f2a6084fc5cd59f3eac66bea611c891b9dc7733', '[\"admin\"]', '2024-09-16 22:47:00', NULL, '2024-09-11 19:19:50', '2024-09-16 22:47:00'),
(125, 'App\\Models\\Admin', 41, 'Mariz-nabil', 'cd156c2fb29ad026385bb48be72a7fd2bb24a5f8de5fb12f4f8e34a59ea37d2b', '[\"admin\"]', '2024-09-12 01:59:21', NULL, '2024-09-11 19:38:49', '2024-09-12 01:59:21'),
(126, 'App\\Models\\Admin', 1, 'ahmedsabry', '202c657ccdaa9a38bd993ed73b4ca8d2d129092966312ea43cecdc4507b361e2', '[\"admin\"]', '2024-09-11 20:33:27', NULL, '2024-09-11 20:30:23', '2024-09-11 20:33:27'),
(127, 'App\\Models\\Admin', 1, 'ahmedsabry', 'f39c1f5cedb80947c007fa13e66c506d300a2d0744eb20b2a41727994ec4b2a1', '[\"admin\"]', '2024-09-11 21:32:18', NULL, '2024-09-11 20:42:54', '2024-09-11 21:32:18'),
(128, 'App\\Models\\Student', 16, 'API TOKEN', '380b3f67c467e6fee0e62e9439f2ff0aabdef83104e0059e8ea9e97429f094d4', '[\"*\"]', NULL, NULL, '2024-09-11 20:43:38', '2024-09-11 20:43:38'),
(129, 'App\\Models\\Admin', 1, 'ahmedsabry', 'a57c9e28d16eac6dd38429ae1e0d61ed8b76a8cd5696e905bc60e14dcbfaad70', '[\"admin\"]', '2024-09-16 14:39:16', NULL, '2024-09-11 21:24:43', '2024-09-16 14:39:16'),
(130, 'App\\Models\\Student', 17, 'API TOKEN', '722d0c8676e008110dd5f040e1557e7afaa8200f71f9abdd26e21e436c116baa', '[\"*\"]', NULL, NULL, '2024-09-11 21:29:51', '2024-09-11 21:29:51'),
(131, 'App\\Models\\Admin', 1, 'ahmedsabry', 'ad49541dd7a14d1c4927fb7a04a7a41df998f3cb0a065f090f784dbc5dd4e90b', '[\"admin\"]', '2024-09-13 12:39:11', NULL, '2024-09-13 11:51:29', '2024-09-13 12:39:11'),
(132, 'App\\Models\\Student', 18, 'API TOKEN', 'f0af05d1cfeec30b73d359b8c184d8dcac2c2cdb0b03d350bad4720fc943ec53', '[\"*\"]', NULL, NULL, '2024-09-13 22:52:32', '2024-09-13 22:52:32'),
(133, 'App\\Models\\Student', 18, '01063165009', '7c61129dff34adaee91f4de3a027eafc4c525753b9abb1b68acba68a1d94400e', '[\"student\"]', '2024-09-13 23:15:43', NULL, '2024-09-13 22:55:55', '2024-09-13 23:15:43'),
(134, 'App\\Models\\Student', 17, '01141094247', 'aada65fe0383074c60cb2cd71f4726dc34077e087444d4c9785df45d406798c9', '[\"student\"]', '2024-09-13 23:22:23', NULL, '2024-09-13 23:16:19', '2024-09-13 23:22:23'),
(135, 'App\\Models\\Student', 18, '01063165009', 'eb4cbdb647e393d8be07e3bf42b2fc0a4f1805e2bb4b649a4c2a49c2905f106e', '[\"student\"]', '2024-09-13 23:25:12', NULL, '2024-09-13 23:23:24', '2024-09-13 23:25:12'),
(136, 'App\\Models\\Student', 19, 'API TOKEN', '2eb61d8d7a608aea79f9ccff6bc0fba531d42971f812ba641110286f43353767', '[\"*\"]', NULL, NULL, '2024-09-13 23:29:29', '2024-09-13 23:29:29'),
(137, 'App\\Models\\Student', 19, '01063165009', 'e983afbc3c677cb70b414c7a59b1b5b820564e45b9d25165fb1e3bced7fcc894', '[\"student\"]', '2024-09-15 23:17:52', NULL, '2024-09-13 23:30:35', '2024-09-15 23:17:52'),
(138, 'App\\Models\\Student', 19, '01063165009', 'fce68d08ebff1a40478b59f3d08225df6eacf6bd0266813a5c6e6690726f1c0b', '[\"student\"]', '2024-09-14 00:59:57', NULL, '2024-09-14 00:58:07', '2024-09-14 00:59:57'),
(139, 'App\\Models\\Admin', 1, 'ahmedsabry', '4c60f8ace90258719a343298621f216222431ffc3dfa91b57b287f6ccee7c721', '[\"admin\"]', '2024-09-14 17:18:25', NULL, '2024-09-14 01:00:38', '2024-09-14 17:18:25'),
(140, 'App\\Models\\Student', 19, '01063165009', '22782d1b26067327cb7f8a4be792b40f9b7111ea763f67f9ef7722006e77afa9', '[\"student\"]', '2024-09-14 15:56:55', NULL, '2024-09-14 15:49:44', '2024-09-14 15:56:55'),
(141, 'App\\Models\\Student', 17, '01141094247', 'f1e10109dfcd36b39593b0b3d591ef6660baab0b2e2af5e1f0bbaf1bddb70586', '[\"student\"]', '2024-09-14 17:44:49', NULL, '2024-09-14 17:43:35', '2024-09-14 17:44:49'),
(142, 'App\\Models\\Student', 20, 'API TOKEN', '4b6dc83c794e076c559ae0f32711ef1c8f4ce81f9018b80607cec086cb809d9d', '[\"*\"]', NULL, NULL, '2024-09-14 19:00:04', '2024-09-14 19:00:04'),
(143, 'App\\Models\\Student', 20, '01017311164', 'd9764bc604cb511c3965c061bfad03ae2d1ebd986ab5ae355e5cd2769f38c8d3', '[\"student\"]', '2024-09-21 02:59:27', NULL, '2024-09-14 19:00:33', '2024-09-21 02:59:27'),
(144, 'App\\Models\\Student', 21, 'API TOKEN', '95961b2bbafd0dff13590669d72c62ab1cb4dd5467ff66bd56a63d593c180def', '[\"*\"]', NULL, NULL, '2024-09-14 22:20:22', '2024-09-14 22:20:22'),
(145, 'App\\Models\\Student', 22, 'API TOKEN', '095aeaa0aa9c8aa12425d57a1a351cac2721d8a22b57821f02f93019b51481fa', '[\"*\"]', NULL, NULL, '2024-09-14 22:23:13', '2024-09-14 22:23:13'),
(146, 'App\\Models\\Student', 23, 'API TOKEN', 'c6b84c79b147e1cfab38ac29846d76a428d978f0e76fb558467e9fbf07212e8a', '[\"*\"]', NULL, NULL, '2024-09-14 22:23:20', '2024-09-14 22:23:20'),
(147, 'App\\Models\\Student', 24, 'API TOKEN', '2ef769d1617640a748cde4a23d989b2dfd524a1e8d97f5191b4c9040fd8ce903', '[\"*\"]', NULL, NULL, '2024-09-14 22:24:43', '2024-09-14 22:24:43'),
(148, 'App\\Models\\Student', 25, 'API TOKEN', 'e6d82c7f15f3379ae01754ffeca93290a5af93985844eb95386bc76bf7012ea7', '[\"*\"]', NULL, NULL, '2024-09-14 22:26:11', '2024-09-14 22:26:11'),
(149, 'App\\Models\\Student', 26, 'API TOKEN', '0f40b324b040b59fb3db48d4dc6dad0d5b2a02cecae5c55ff9147c32173b1cc6', '[\"*\"]', NULL, NULL, '2024-09-14 22:33:39', '2024-09-14 22:33:39'),
(150, 'App\\Models\\Student', 27, 'API TOKEN', '8bc86065f8bbd0e2d2bb631dd0ed9a1c342fd69d3fa2f57e32086979a5a97dd7', '[\"*\"]', NULL, NULL, '2024-09-14 22:41:53', '2024-09-14 22:41:53'),
(151, 'App\\Models\\Student', 26, '01019258797', 'd2aa282858a2badd48ca85d6c273c20111a9a2fe9c0bccd94a83694c4929f5cf', '[\"student\"]', '2024-09-15 13:39:53', NULL, '2024-09-14 22:45:32', '2024-09-15 13:39:53'),
(152, 'App\\Models\\Student', 28, 'API TOKEN', '3643d30450e028b4ea898d4d6c23a3c8c1b7f86aa5c3352716a1e38ce0075294', '[\"*\"]', NULL, NULL, '2024-09-14 22:45:57', '2024-09-14 22:45:57'),
(153, 'App\\Models\\Student', 29, 'API TOKEN', '13bd56c7b15e1821bb78b68a39356cb646cf94e9fea2ae807b79f86f6d347a4b', '[\"*\"]', NULL, NULL, '2024-09-14 22:48:03', '2024-09-14 22:48:03'),
(154, 'App\\Models\\Student', 27, '01210954955', '14ef773cb8f6dfa5b7be323e3f32ff09b5e0485d57de59a3c13b47b4d1a735eb', '[\"student\"]', '2024-09-14 23:31:47', NULL, '2024-09-14 22:56:49', '2024-09-14 23:31:47'),
(155, 'App\\Models\\Student', 30, 'API TOKEN', 'cc032c14f0161158e109e0dee94b6bad104bc73d5333c3140999d9b3a6a00b24', '[\"*\"]', NULL, NULL, '2024-09-14 22:57:18', '2024-09-14 22:57:18'),
(156, 'App\\Models\\Student', 29, '01226305424', '4c09a0916ff780f8ca79c8d6d7e73dc2f8d6eee0e6e647f162e0f76a87a9e41f', '[\"student\"]', '2024-09-21 23:05:11', NULL, '2024-09-14 23:20:19', '2024-09-21 23:05:11'),
(157, 'App\\Models\\Student', 26, '01019258797', '566a2949ac13fa3c5548e58a524829ff722a4b87a1ea13622ebcf565c58ddb42', '[\"student\"]', '2024-09-21 17:33:31', NULL, '2024-09-14 23:55:57', '2024-09-21 17:33:31'),
(158, 'App\\Models\\Student', 31, 'API TOKEN', 'ef6489f544c21fedf5d6af46114274255564626577ee46daa98c855145e093d4', '[\"*\"]', NULL, NULL, '2024-09-15 00:11:58', '2024-09-15 00:11:58'),
(159, 'App\\Models\\Student', 32, 'API TOKEN', 'd251653b376e5aa98e2a8d7603e1253eb96ac9f07cc926dff316dd4d6b6d72ee', '[\"*\"]', NULL, NULL, '2024-09-15 01:59:56', '2024-09-15 01:59:56'),
(160, 'App\\Models\\Student', 33, 'API TOKEN', '0b2d2b7397472105dade7669dde22d6e97c376cff31376d23fd935e0b4b1d343', '[\"*\"]', NULL, NULL, '2024-09-15 02:14:23', '2024-09-15 02:14:23'),
(161, 'App\\Models\\Student', 34, 'API TOKEN', '6433f1523130270d6e1da8ae67c975589bbfd1887dfb30a989495ef330f06caf', '[\"*\"]', NULL, NULL, '2024-09-15 11:21:15', '2024-09-15 11:21:15'),
(162, 'App\\Models\\Student', 23, '01283383411', '4a0e15ab0e1c0f793cacc0abe707d17bfc0e6b540dd9b336570b4222f9c0553d', '[\"student\"]', '2024-09-21 17:38:30', NULL, '2024-09-15 13:11:00', '2024-09-21 17:38:30'),
(163, 'App\\Models\\Student', 35, 'API TOKEN', '0c4f699bb82b4c66071b5ba76da87a4108e5cc4e6bff8618ac8b018b2b666f27', '[\"*\"]', NULL, NULL, '2024-09-15 14:10:32', '2024-09-15 14:10:32'),
(164, 'App\\Models\\Student', 36, 'API TOKEN', 'd140136c837ecda4c03b3b64247e9b81559077f7045c9abc7a559e95ee221178', '[\"*\"]', NULL, NULL, '2024-09-15 15:55:52', '2024-09-15 15:55:52'),
(165, 'App\\Models\\Student', 37, 'API TOKEN', 'cbe80592188df145f15ed56b7f77dc1086e452ab4d35b9bf3e03ec2a7d00f624', '[\"*\"]', NULL, NULL, '2024-09-15 17:18:00', '2024-09-15 17:18:00'),
(166, 'App\\Models\\Student', 38, 'API TOKEN', 'b2be5e29ef6af76e2f5226bf62f64306c651ac009863d018ffa0351f77960221', '[\"*\"]', NULL, NULL, '2024-09-15 18:58:08', '2024-09-15 18:58:08'),
(167, 'App\\Models\\Admin', 38, 'Nour', '17a2093e0e4cc53cad636ba78e2de444391b1b00ea0ca3fa8c14517507c8ddfd', '[\"admin\"]', '2024-09-22 13:23:32', NULL, '2024-09-15 19:10:24', '2024-09-22 13:23:32'),
(168, 'App\\Models\\Student', 39, 'API TOKEN', 'cbe200f084cc80d270cc565f059e78cff9193cd24496494c310b0bf8902067af', '[\"*\"]', NULL, NULL, '2024-09-15 19:36:53', '2024-09-15 19:36:53'),
(169, 'App\\Models\\Student', 19, '01063165009', '4e4f253243a1d518cbfae0f5a6a17be16e5cba2b391c0dfe85bd7d58aa3d60d0', '[\"student\"]', '2024-09-15 23:20:25', NULL, '2024-09-15 22:30:01', '2024-09-15 23:20:25'),
(170, 'App\\Models\\Student', 34, '01017016045', '184e0b5c4c1ab683c9c29e61626f614219689b0f20bab078015ee4585a750bab', '[\"student\"]', '2024-09-21 02:13:21', NULL, '2024-09-15 22:54:21', '2024-09-21 02:13:21'),
(171, 'App\\Models\\Student', 32, '01003161807', 'ce5b8f0c0e22e3f9b8535486b7d472f361334b9f91378352b2b59e1017639e41', '[\"student\"]', '2024-09-20 12:34:59', NULL, '2024-09-15 23:08:33', '2024-09-20 12:34:59'),
(172, 'App\\Models\\Student', 17, '01141094247', 'e52dac06c8fa7fab0c6a17d9f91d28b4d4fe3d9ab7a5a91219393475682b7245', '[\"student\"]', '2024-09-17 17:32:36', NULL, '2024-09-15 23:18:20', '2024-09-17 17:32:36'),
(173, 'App\\Models\\Student', 19, '01063165009', '8f85a0308132b25f821458a7a2974747cfe747f748622375a301a1529439d20c', '[\"student\"]', '2024-09-15 23:23:40', NULL, '2024-09-15 23:18:59', '2024-09-15 23:23:40'),
(174, 'App\\Models\\Student', 33, '01090378746', 'fb3f9e574b39f00d7dd119eb0a33f228ec0cca4cebd5e84ea4b6e57e994c8d07', '[\"student\"]', '2024-09-19 18:42:56', NULL, '2024-09-15 23:27:29', '2024-09-19 18:42:56'),
(175, 'App\\Models\\Student', 40, 'API TOKEN', '4370d7783296f0a7f8c741561d79d50d99c38c3f6a243b90d4cea7bfd6a80d5f', '[\"*\"]', NULL, NULL, '2024-09-15 23:30:33', '2024-09-15 23:30:33'),
(176, 'App\\Models\\Student', 40, '01277747053', '8cede467a41454b6b091df9a359afaf5ccdcbc1c9654261c48558d5b945af8a8', '[\"student\"]', '2024-09-16 22:30:10', NULL, '2024-09-15 23:33:09', '2024-09-16 22:30:10'),
(177, 'App\\Models\\Student', 40, '01277747053', '030b601f6eb83cc7b42c7f238b620523eb327639b2fe9b9bbba82837c6f4939c', '[\"student\"]', '2024-09-17 19:56:40', NULL, '2024-09-15 23:34:16', '2024-09-17 19:56:40'),
(178, 'App\\Models\\Student', 38, '01202128871', '3350774782cc04140df7d772d545d37c0e9e49b571fa923bbe6de94630fada8e', '[\"student\"]', '2024-09-22 18:09:29', NULL, '2024-09-16 00:04:44', '2024-09-22 18:09:29'),
(179, 'App\\Models\\Student', 41, 'API TOKEN', '98bf71dd5d6a8608c6af8455c8b0da0cb106613402332a7b670e8aa2ce8b54bf', '[\"*\"]', NULL, NULL, '2024-09-16 00:17:22', '2024-09-16 00:17:22'),
(180, 'App\\Models\\Student', 42, 'API TOKEN', 'b6bddd9814bd71ff2d7cca340d1ab0dc2ea99c6b666bd3687a57f9867805e725', '[\"*\"]', NULL, NULL, '2024-09-16 02:24:06', '2024-09-16 02:24:06'),
(181, 'App\\Models\\Student', 40, '01277747053', 'a9eefd97a08eddde6f579b61c5d42c7335a75b58243686c801ab9be06caff4a3', '[\"student\"]', '2024-09-16 03:31:21', NULL, '2024-09-16 03:28:52', '2024-09-16 03:31:21'),
(182, 'App\\Models\\Student', 40, '01277747053', '0df894255a4346509acf0695c14991bac38c78aa4da0e309668d25f63e2d1825', '[\"student\"]', '2024-09-16 11:30:34', NULL, '2024-09-16 11:30:20', '2024-09-16 11:30:34'),
(183, 'App\\Models\\Student', 40, '01277747053', 'f1c93ccd78f5e9f3e37be71345b6b5f1f9d78f8f4f51d85a011f09f74fa72423', '[\"student\"]', '2024-09-17 20:33:27', NULL, '2024-09-16 11:41:25', '2024-09-17 20:33:27'),
(184, 'App\\Models\\Student', 31, '01091014180', 'abd36b5ae22d08a69eb329aa164299aa647e44b91e05edc5fa9ea7d3d424819e', '[\"student\"]', '2024-09-19 19:48:40', NULL, '2024-09-16 12:17:16', '2024-09-19 19:48:40'),
(185, 'App\\Models\\Student', 28, '01099773631', 'd3a160ed9f596b8beeec80425b3f523423ab4f0b7fc12f394fd2d2cfa5fc9666', '[\"student\"]', '2024-09-16 13:47:38', NULL, '2024-09-16 13:38:21', '2024-09-16 13:47:38'),
(186, 'App\\Models\\Student', 28, '01099773631', '811f0ed61f69b48c57dec1f530e94f6aa26d554e1371f79736aaa29479f1b888', '[\"student\"]', '2024-09-16 13:48:24', NULL, '2024-09-16 13:47:48', '2024-09-16 13:48:24'),
(187, 'App\\Models\\Student', 28, '01099773631', '0c640ce7eda7144a787410a469ccdf8a34201b3fe31a6aa464c15b535eb1b09d', '[\"student\"]', '2024-09-20 12:08:29', NULL, '2024-09-16 13:48:30', '2024-09-20 12:08:29'),
(188, 'App\\Models\\Student', 43, 'API TOKEN', '49c2470d1598fa4f349cc0a0a6a6c67d6f0ef8126746f812867932b800918bb9', '[\"*\"]', NULL, NULL, '2024-09-16 13:52:48', '2024-09-16 13:52:48'),
(189, 'App\\Models\\Student', 24, '01007884191', '9c30dd810fd0674a561f8febd4bdb1ae1cb493b133a5e4c8d6febb1b7f730e29', '[\"student\"]', '2024-09-22 17:42:25', NULL, '2024-09-16 13:55:59', '2024-09-22 17:42:25'),
(190, 'App\\Models\\Student', 40, '01277747053', 'c2b69551b20e07ae8ffbf2034c0fc1cf5876f92d39011a7657554f4ba8ad449e', '[\"student\"]', '2024-09-17 14:23:56', NULL, '2024-09-16 14:39:35', '2024-09-17 14:23:56'),
(191, 'App\\Models\\Student', 44, 'API TOKEN', '523ac3e91965007ea243abd275b0b58db96871398aac183cfb14251d6a5dae8c', '[\"*\"]', NULL, NULL, '2024-09-16 15:05:42', '2024-09-16 15:05:42'),
(192, 'App\\Models\\Student', 41, '01020774325', '7ffc704f220ad02c93e34f8740488978880a1aa367dac869df77b23d117b2914', '[\"student\"]', '2024-09-16 18:24:54', NULL, '2024-09-16 18:24:23', '2024-09-16 18:24:54'),
(193, 'App\\Models\\Student', 21, '01093932350', 'aab197b6fdf682f990246c557edecf0861817ef24927ebb78b9a4180a03600a2', '[\"student\"]', '2024-09-16 21:19:46', NULL, '2024-09-16 21:02:35', '2024-09-16 21:19:46'),
(194, 'App\\Models\\Student', 39, '01115983335', '2adab26f75579ba178bcbd1c7d542ab0d381ecec47bf674410e43789241d2b2b', '[\"student\"]', '2024-09-16 21:17:16', NULL, '2024-09-16 21:16:57', '2024-09-16 21:17:16'),
(195, 'App\\Models\\Student', 39, '01115983335', 'c7015df49bf796031e3feb830ac3d48b4d853285e4ccc7790181937e4884f0ac', '[\"student\"]', '2024-09-20 00:50:39', NULL, '2024-09-16 21:18:09', '2024-09-20 00:50:39'),
(196, 'App\\Models\\Admin', 40, 'Mariam-Osman', '197ea1deac5453d3b4cdcac46ac5f917e8ee2318bfe25e1c78c2262358364885', '[\"admin\"]', '2024-09-16 23:38:17', NULL, '2024-09-16 22:47:19', '2024-09-16 23:38:17'),
(197, 'App\\Models\\Admin', 38, 'Nour', '20ea1975c5c1ff28019be070acddcf240de5a6baa4b121ba6e46bbb72f018f53', '[\"admin\"]', '2024-09-23 18:21:30', NULL, '2024-09-16 22:48:03', '2024-09-23 18:21:30'),
(198, 'App\\Models\\Admin', 1, 'AhmedSabry', '8830a0f32fe5ff3ec9bb45d6800fb331a69c37d0179a957dab473c0415f4c942', '[\"admin\"]', '2024-09-23 16:59:56', NULL, '2024-09-16 22:49:30', '2024-09-23 16:59:56'),
(199, 'App\\Models\\Student', 37, '01272754092', '5ea68af463f0cac4aec274213e8213ef862eb44ee5e174e121f58a88d1c2204b', '[\"student\"]', '2024-09-21 18:10:41', NULL, '2024-09-16 23:10:15', '2024-09-21 18:10:41'),
(200, 'App\\Models\\Student', 45, 'API TOKEN', '2d6959101216b1e8ff56c1a3075a2df22454d9c6bcf6bee1b7b7bbf36497c475', '[\"*\"]', NULL, NULL, '2024-09-16 23:21:55', '2024-09-16 23:21:55'),
(201, 'App\\Models\\Student', 46, 'API TOKEN', '6cefe94541cbcdd861b3592e0a4c745d3a4d819d902a5b34a78a2186fd3d500b', '[\"*\"]', NULL, NULL, '2024-09-16 23:58:44', '2024-09-16 23:58:44'),
(202, 'App\\Models\\Student', 40, '01277747053', '0230c063a07a015393d8ddad17fd8109050b6895b1b4d12c8003665665ea392a', '[\"student\"]', '2024-09-17 00:19:41', NULL, '2024-09-17 00:18:06', '2024-09-17 00:19:41'),
(203, 'App\\Models\\Student', 47, 'API TOKEN', '0ec3400b92952fbd4ed6182e5cadbdbea387b08a5569252cd8550957177a17eb', '[\"*\"]', NULL, NULL, '2024-09-17 00:24:50', '2024-09-17 00:24:50'),
(204, 'App\\Models\\Student', 40, '01277747053', 'f8525cd1d72e929775db0bb57fec541935725d70d6165be233385fd81f229eee', '[\"student\"]', '2024-09-17 00:45:04', NULL, '2024-09-17 00:44:11', '2024-09-17 00:45:04'),
(205, 'App\\Models\\Student', 48, 'API TOKEN', '1dfb7cddef5ba054453303470e9a8e17d3976ae6e7f045dcf716507dcc42c3cd', '[\"*\"]', NULL, NULL, '2024-09-17 12:27:02', '2024-09-17 12:27:02'),
(206, 'App\\Models\\Student', 49, 'API TOKEN', '7fd1ed038a2a981db6106549159d8dd86b3c2f4f89cabbc86a78bf4e6b124d07', '[\"*\"]', NULL, NULL, '2024-09-17 12:28:11', '2024-09-17 12:28:11'),
(207, 'App\\Models\\Student', 50, 'API TOKEN', '484899d1dea8cada97de92b8f785e87c7f1967f96a1a12a9926b5a7cd58e3664', '[\"*\"]', NULL, NULL, '2024-09-17 12:29:16', '2024-09-17 12:29:16'),
(208, 'App\\Models\\Student', 51, 'API TOKEN', 'ddf84f7638968ac8d89f21b07ed4a5f0761b99c94ad0a92bcc952cf4d0487867', '[\"*\"]', NULL, NULL, '2024-09-17 12:29:55', '2024-09-17 12:29:55'),
(209, 'App\\Models\\Student', 52, 'API TOKEN', '4a8593402babb2f70bfd6330299b140d7170fd5b6e4bc0a1cc7ca6ea97583603', '[\"*\"]', NULL, NULL, '2024-09-17 12:33:24', '2024-09-17 12:33:24'),
(210, 'App\\Models\\Student', 53, 'API TOKEN', '4216d207e407fa0047aa36c39623eced800d894cfbdffc065a95018126345ddb', '[\"*\"]', NULL, NULL, '2024-09-17 12:37:49', '2024-09-17 12:37:49'),
(211, 'App\\Models\\Student', 54, 'API TOKEN', '79b849a707142b9319a5c9d60ff695ca40697a08185624d9336690dcb2d0372f', '[\"*\"]', NULL, NULL, '2024-09-17 12:40:59', '2024-09-17 12:40:59'),
(212, 'App\\Models\\Student', 55, 'API TOKEN', 'f6a41243798337ec186f8dbae233b4d243a1d342aa5a0187dc791e873707fd4f', '[\"*\"]', NULL, NULL, '2024-09-17 12:43:45', '2024-09-17 12:43:45'),
(213, 'App\\Models\\Student', 56, 'API TOKEN', '3aac2eda867e22e20ba750f191e2598be28cce2e69d4d3411090e8f8a4951d55', '[\"*\"]', NULL, NULL, '2024-09-17 12:45:11', '2024-09-17 12:45:11'),
(214, 'App\\Models\\Student', 57, 'API TOKEN', '78bacc323cf03f89ed90c4f4efeab7ca58ca22ef0340d6494dc343bfca619735', '[\"*\"]', NULL, NULL, '2024-09-17 12:46:54', '2024-09-17 12:46:54'),
(215, 'App\\Models\\Student', 58, 'API TOKEN', '6abe995ce18b94dcdcbcde593b5a74c63115745346d0d9a551e5d46754f6b4e9', '[\"*\"]', NULL, NULL, '2024-09-17 12:47:54', '2024-09-17 12:47:54'),
(216, 'App\\Models\\Student', 59, 'API TOKEN', '5193d78adcbe0023d8128942ea7666d85dab86a340b81c395aab5b38c3c4a8a0', '[\"*\"]', NULL, NULL, '2024-09-17 12:51:17', '2024-09-17 12:51:17'),
(217, 'App\\Models\\Student', 60, 'API TOKEN', 'c79c05b7bf9d4f2880b99ca992d8586349912496de5a2f6b43ea555a557581c2', '[\"*\"]', NULL, NULL, '2024-09-17 12:52:11', '2024-09-17 12:52:11'),
(218, 'App\\Models\\Student', 61, 'API TOKEN', '113177da23ac4be90fc668e3faea77702c80a0c7a85f08b45e905873cbaad884', '[\"*\"]', NULL, NULL, '2024-09-17 12:56:35', '2024-09-17 12:56:35'),
(219, 'App\\Models\\Student', 62, 'API TOKEN', '0d90b665441d003d87d8fa39f491a72f16d3d0e5ae3154e6d1ea2853a5aabe75', '[\"*\"]', NULL, NULL, '2024-09-17 13:00:41', '2024-09-17 13:00:41'),
(220, 'App\\Models\\Student', 63, 'API TOKEN', 'e1ece1b6f69896b6d8e2961365deaa72c8ca739fe762634382a6be2a574dab02', '[\"*\"]', NULL, NULL, '2024-09-17 13:01:05', '2024-09-17 13:01:05'),
(221, 'App\\Models\\Student', 64, 'API TOKEN', '159b2b4b66edc707cb21512e07fd1dcfc510d20abee31cb34454b3067cb7c511', '[\"*\"]', NULL, NULL, '2024-09-17 13:01:42', '2024-09-17 13:01:42'),
(222, 'App\\Models\\Student', 65, 'API TOKEN', '9a23f2a3aab7f0e34ca3b3987988d5c5616fa44da7fd42fad0c5dc05d68423c7', '[\"*\"]', NULL, NULL, '2024-09-17 13:03:03', '2024-09-17 13:03:03'),
(223, 'App\\Models\\Student', 66, 'API TOKEN', '2b4152857efedc136b66bd3e7799b1100f6f8f1a7c8c3ee3c600d1a51f6c60a8', '[\"*\"]', NULL, NULL, '2024-09-17 13:03:16', '2024-09-17 13:03:16'),
(224, 'App\\Models\\Student', 44, '01122788772', 'ae42a413db05fa6b10a85dccb0d83aa841db0d2c880d1557c5af11e813fac221', '[\"student\"]', '2024-09-18 11:35:35', NULL, '2024-09-17 13:25:08', '2024-09-18 11:35:35'),
(225, 'App\\Models\\Student', 67, 'API TOKEN', '239eb919c3e5fadcd5f7caa9a0ec1856fc70b1d91d8326521f33d0ee8b4264e6', '[\"*\"]', NULL, NULL, '2024-09-17 13:29:23', '2024-09-17 13:29:23'),
(226, 'App\\Models\\Student', 68, 'API TOKEN', 'da9acc1eb1722c83f5f64ac66edc49cc8da0e542e3269d5654249a20d32029e5', '[\"*\"]', NULL, NULL, '2024-09-17 13:52:54', '2024-09-17 13:52:54'),
(227, 'App\\Models\\Student', 69, 'API TOKEN', '0fd13a81e5aa4802210c245484730d98d0561152649806a7ca2ec7125b22d6bc', '[\"*\"]', NULL, NULL, '2024-09-17 13:54:48', '2024-09-17 13:54:48'),
(228, 'App\\Models\\Student', 70, 'API TOKEN', '0e8c11c42b410ce57c72bce3a31fac2160ce55e1ea1f6256a7a78796739ea8c6', '[\"*\"]', NULL, NULL, '2024-09-17 14:00:51', '2024-09-17 14:00:51'),
(229, 'App\\Models\\Student', 71, 'API TOKEN', 'd2b97eefa094ce12d2be679f860dd57283756bb165cd986534809d94ccc9a24f', '[\"*\"]', NULL, NULL, '2024-09-17 14:03:15', '2024-09-17 14:03:15'),
(230, 'App\\Models\\Student', 72, 'API TOKEN', '2ca677cd59b2ebf15189b9e4c15a5743ef1b6e6f521ce3bf8b2cea029e1af6e9', '[\"*\"]', NULL, NULL, '2024-09-17 14:07:59', '2024-09-17 14:07:59'),
(231, 'App\\Models\\Student', 73, 'API TOKEN', '4b12e236904385516aa04b148f3a6fef374e045e55bd13089155efbc37bfd188', '[\"*\"]', NULL, NULL, '2024-09-17 14:08:31', '2024-09-17 14:08:31'),
(232, 'App\\Models\\Student', 74, 'API TOKEN', 'd8cebfe7d5b2938067729f9dc839b904e27daf449138772b40b5d10b4ecf2aba', '[\"*\"]', NULL, NULL, '2024-09-17 14:09:05', '2024-09-17 14:09:05'),
(233, 'App\\Models\\Student', 75, 'API TOKEN', '6b41ceaff805615d62aebaff2efa54a713a8731c36d82c57035a21049cc970ad', '[\"*\"]', NULL, NULL, '2024-09-17 14:15:12', '2024-09-17 14:15:12'),
(234, 'App\\Models\\Admin', 1, 'ahmedsabry', 'b77d9f9be2cbccb5ce38313d338ae94919c8c13e4623925903f7a742e5611e9c', '[\"admin\"]', '2024-09-19 06:38:52', NULL, '2024-09-17 14:24:15', '2024-09-19 06:38:52'),
(235, 'App\\Models\\Student', 76, 'API TOKEN', 'ba4b36149da127d978300f786a25d4eae65f2a712a15756b128208a4dd6430aa', '[\"*\"]', NULL, NULL, '2024-09-17 14:32:06', '2024-09-17 14:32:06'),
(236, 'App\\Models\\Student', 77, 'API TOKEN', 'b83e27e196546c0ede3d87a671307e0076af7d453dfa88375d5475ef92f3e19b', '[\"*\"]', NULL, NULL, '2024-09-17 14:33:42', '2024-09-17 14:33:42'),
(237, 'App\\Models\\Student', 78, 'API TOKEN', 'd5913e0547f4a5cb73b305322a8506d427661085503ca55becf543a7606894eb', '[\"*\"]', NULL, NULL, '2024-09-17 14:39:50', '2024-09-17 14:39:50'),
(238, 'App\\Models\\Student', 79, 'API TOKEN', '109c18efb207a7706c9e919a3a8bbfd2ec55fc236581165f4133cd57fcf68d0f', '[\"*\"]', NULL, NULL, '2024-09-17 14:51:55', '2024-09-17 14:51:55'),
(239, 'App\\Models\\Student', 80, 'API TOKEN', '416e1d5cc7bbdbb3efe78c9260693866629d9e3e774275fec0a16923ef42c069', '[\"*\"]', NULL, NULL, '2024-09-17 14:56:04', '2024-09-17 14:56:04'),
(240, 'App\\Models\\Student', 81, 'API TOKEN', 'e7a83c3c605b10b524665d760293e370699a15b9aa9022004805df59af5e47c8', '[\"*\"]', NULL, NULL, '2024-09-17 14:57:34', '2024-09-17 14:57:34'),
(241, 'App\\Models\\Student', 82, 'API TOKEN', '045430366d02693457c46b9df1cb9b5f5d3a3e765e3ec55e45e55856fa7102a2', '[\"*\"]', NULL, NULL, '2024-09-17 15:09:28', '2024-09-17 15:09:28'),
(242, 'App\\Models\\Student', 83, 'API TOKEN', '3888ebd810b86ffd4964a9ea812da85e090ab1a91f5ab363bb32436a1f8f5f67', '[\"*\"]', NULL, NULL, '2024-09-17 15:12:06', '2024-09-17 15:12:06'),
(243, 'App\\Models\\Student', 40, '01277747053', '29d35ba073bcbdbf04c32db55dc5d6f5c9483354b07b3e1aabb53bfb32313eea', '[\"student\"]', '2024-09-17 20:35:24', NULL, '2024-09-17 15:27:04', '2024-09-17 20:35:24'),
(244, 'App\\Models\\Student', 84, 'API TOKEN', '1f8618b4d08246d8e773e0441f60e8d3f908b679a39700bd3cb9f5730ac7d7df', '[\"*\"]', NULL, NULL, '2024-09-17 16:20:34', '2024-09-17 16:20:34'),
(245, 'App\\Models\\Student', 33, '01090378746', 'de403936a9f1a941b945973c1ecc4605ce85c74be7ece7d14bf4578e41aa3697', '[\"student\"]', '2024-09-18 22:41:57', NULL, '2024-09-17 16:24:24', '2024-09-18 22:41:57'),
(246, 'App\\Models\\Student', 85, 'API TOKEN', 'b98babb252c8e7f2f46cac43458b95ad499769011e68970cae04640f1c8a9b62', '[\"*\"]', NULL, NULL, '2024-09-17 16:41:23', '2024-09-17 16:41:23'),
(247, 'App\\Models\\Student', 86, 'API TOKEN', '9591c1b6ba4a33f9920ded4d5e7ade7ff28d444f641205c785ab4122c6b73bf6', '[\"*\"]', NULL, NULL, '2024-09-17 16:41:26', '2024-09-17 16:41:26'),
(248, 'App\\Models\\Student', 87, 'API TOKEN', '33fe25fe30dbf94eb404de09d26318eca7e6b7951250748051bff2e980228674', '[\"*\"]', NULL, NULL, '2024-09-17 16:44:28', '2024-09-17 16:44:28'),
(249, 'App\\Models\\Student', 88, 'API TOKEN', 'eca71a3fc0ba2b0e82e94e9f914810747fc4519fcab4f196b0346163b8573a8f', '[\"*\"]', NULL, NULL, '2024-09-17 16:52:38', '2024-09-17 16:52:38'),
(250, 'App\\Models\\Student', 89, 'API TOKEN', '03319ebc67a539601d9a095c974185a5ca41a4db49eaed387b622d2b48842cd6', '[\"*\"]', NULL, NULL, '2024-09-17 16:52:41', '2024-09-17 16:52:41'),
(251, 'App\\Models\\Student', 90, 'API TOKEN', 'ff801cb5e60245894b0e18cc2ce81f69121b6c014986be580b4709a11037dc38', '[\"*\"]', NULL, NULL, '2024-09-17 16:56:56', '2024-09-17 16:56:56'),
(252, 'App\\Models\\Student', 91, 'API TOKEN', '978aede1690cec785b62349333c2ede6cd74512d1d467b7ba42d00c807d8ade9', '[\"*\"]', NULL, NULL, '2024-09-17 17:02:19', '2024-09-17 17:02:19'),
(253, 'App\\Models\\Student', 92, 'API TOKEN', '3202b0034813f80fa3e1c7da79c286415c3ab492181501946f262ecce1c5c0a9', '[\"*\"]', NULL, NULL, '2024-09-17 17:07:04', '2024-09-17 17:07:04'),
(254, 'App\\Models\\Student', 93, 'API TOKEN', 'f63378131610b409f1104640dc3b05e4056ebf07c9446d9c05af9bb4a640f818', '[\"*\"]', NULL, NULL, '2024-09-17 17:22:43', '2024-09-17 17:22:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(255, 'App\\Models\\Student', 94, 'API TOKEN', 'de663f41cf8bed4a48dace50500e072241ea48dc681704be4b8e41e5895be718', '[\"*\"]', NULL, NULL, '2024-09-17 17:30:52', '2024-09-17 17:30:52'),
(256, 'App\\Models\\Student', 95, 'API TOKEN', 'e70a049ec3d9892195a02ee024758ec9ce204191d6ff4398db22cde14837b248', '[\"*\"]', NULL, NULL, '2024-09-17 17:31:57', '2024-09-17 17:31:57'),
(257, 'App\\Models\\Student', 62, '01009394733', '03aab7c1c19e6196d021e1412b7ca2a2d6436e7a9a0210404eb276a574e9fb13', '[\"student\"]', '2024-09-17 18:00:09', NULL, '2024-09-17 17:37:48', '2024-09-17 18:00:09'),
(258, 'App\\Models\\Student', 96, 'API TOKEN', '16331113be8fb32324c50269d01162940ae1113c39c4b6b48fd8a80bd6ff22a7', '[\"*\"]', NULL, NULL, '2024-09-17 17:45:49', '2024-09-17 17:45:49'),
(259, 'App\\Models\\Student', 97, 'API TOKEN', 'd3417f5d1e94b806705a12f7babda649c1e47234b2d91c782effbff45016b39a', '[\"*\"]', NULL, NULL, '2024-09-17 18:00:10', '2024-09-17 18:00:10'),
(260, 'App\\Models\\Student', 98, 'API TOKEN', '4d9e1d506f7d8d576fcf7688bd50966e985c5ac23cd4268ed2e6a1b7798201f2', '[\"*\"]', NULL, NULL, '2024-09-17 18:22:54', '2024-09-17 18:22:54'),
(261, 'App\\Models\\Admin', 40, 'Mariam-Osman', '09ba899473882e2a91636e032249172c471d35059d5d88f551c73e136013a840', '[\"admin\"]', '2024-09-24 15:02:28', NULL, '2024-09-17 18:41:12', '2024-09-24 15:02:28'),
(262, 'App\\Models\\Student', 99, 'API TOKEN', 'c5af7a6301e8bf71b33f4f0ff979034449650e9d1a1a9b1ecd7cca062ff1cca4', '[\"*\"]', NULL, NULL, '2024-09-17 18:42:04', '2024-09-17 18:42:04'),
(263, 'App\\Models\\Student', 100, 'API TOKEN', 'b90cc5265b2ddd53279cd188c7ab282a74fbbc516eba2c8417e22eadb9692c54', '[\"*\"]', NULL, NULL, '2024-09-17 18:50:42', '2024-09-17 18:50:42'),
(264, 'App\\Models\\Student', 101, 'API TOKEN', '2e84a5d04f769b319953c6c7fa1b7448a7193e67b46d07f1d6df26c859c37d0b', '[\"*\"]', NULL, NULL, '2024-09-17 18:54:15', '2024-09-17 18:54:15'),
(265, 'App\\Models\\Student', 102, 'API TOKEN', '68afb30324bb17f0e7a26e2acd88c2302fcdbd92b7cf48bffc6a52705347cded', '[\"*\"]', NULL, NULL, '2024-09-17 18:55:49', '2024-09-17 18:55:49'),
(266, 'App\\Models\\Student', 87, '01149961794', '338a0b1718eaf17b23a13b59c64094c864bf026438fc42c210b52300a4313108', '[\"student\"]', '2024-09-19 16:58:27', NULL, '2024-09-17 19:04:17', '2024-09-19 16:58:27'),
(267, 'App\\Models\\Student', 54, '01011085651', 'f0577e6520be5215a0674a838497ac1f8df1c5b77e7ee729a1e4de8bf031b7ca', '[\"student\"]', '2024-09-17 21:59:48', NULL, '2024-09-17 19:04:32', '2024-09-17 21:59:48'),
(268, 'App\\Models\\Student', 74, '01019671855', 'b7517e6b723d92f893416a9bdff928c6612b753e370f28275c1e8b00ad8db5e9', '[\"student\"]', '2024-09-23 23:18:08', NULL, '2024-09-17 19:07:30', '2024-09-23 23:18:08'),
(269, 'App\\Models\\Student', 56, '01201050282', '25f2075fc70afb7f4ff8019fb8b2a198eb726276cc6aebb5255061a435ad0a8e', '[\"student\"]', '2024-09-17 19:25:51', NULL, '2024-09-17 19:10:05', '2024-09-17 19:25:51'),
(270, 'App\\Models\\Student', 101, '01553632830', '97c3a2cab6e40d555876de4e9c2c8778a6d5a9a96c22a4833f53dc29b8cde483', '[\"student\"]', '2024-09-23 19:08:50', NULL, '2024-09-17 19:16:38', '2024-09-23 19:08:50'),
(271, 'App\\Models\\Student', 51, '01012244852', 'b1250f62cd3016a5c9e3d014d9193c5fdac97444428eb95ef4a3f2ed1817d3ee', '[\"student\"]', '2024-09-17 19:26:59', NULL, '2024-09-17 19:24:27', '2024-09-17 19:26:59'),
(272, 'App\\Models\\Student', 51, '01012244852', '3684ac6c12c7165222f7ac9fa2e0076fdb73a1f7fabaeba38ab9f1b3adb8fe4b', '[\"student\"]', '2024-09-23 19:08:49', NULL, '2024-09-17 19:27:13', '2024-09-23 19:08:49'),
(273, 'App\\Models\\Student', 90, '01012347190', '2cd92acebe75799df35c8b8440bf135150ad0876c076d0c513936599da91bece', '[\"student\"]', '2024-09-21 20:25:50', NULL, '2024-09-17 19:27:56', '2024-09-21 20:25:50'),
(274, 'App\\Models\\Student', 95, '01066856131', '1a6fb4e11ee3cb060c8a8b3313835f1ea3d460f6b9f371df2f93669645262a57', '[\"student\"]', '2024-09-17 19:58:58', NULL, '2024-09-17 19:29:09', '2024-09-17 19:58:58'),
(275, 'App\\Models\\Student', 103, 'API TOKEN', '0d001bbf02ec07e25b4990d945b5e37a30250926c0644a8d6917d713ca946777', '[\"*\"]', NULL, NULL, '2024-09-17 19:33:15', '2024-09-17 19:33:15'),
(276, 'App\\Models\\Student', 53, '01017899581', '09e802bcaeaf22d82d3a0cfe87fdb5fb6472f0441f72b9d791b5a6ae56c46ec8', '[\"student\"]', '2024-09-24 19:37:19', NULL, '2024-09-17 19:39:27', '2024-09-24 19:37:19'),
(277, 'App\\Models\\Student', 102, '01211600340', '584a957b720de86270b74861be32587651730e7d5c3f9c706232a9f11c3d1df6', '[\"student\"]', '2024-09-20 01:48:12', NULL, '2024-09-17 19:39:54', '2024-09-20 01:48:12'),
(278, 'App\\Models\\Student', 79, '01032173104', 'b1f3f9853d3ab50eb4596dacdcade26bdc34f2d9f5f605489c72ad94fd847c48', '[\"student\"]', '2024-09-22 18:56:11', NULL, '2024-09-17 19:43:05', '2024-09-22 18:56:11'),
(279, 'App\\Models\\Student', 99, '01011954281', 'ea8e2fecac020a189d7a3b58ded022d79d7a5cd03dfc32dc71bd23ebd9ad7948', '[\"student\"]', '2024-09-22 01:56:27', NULL, '2024-09-17 19:44:02', '2024-09-22 01:56:27'),
(280, 'App\\Models\\Student', 67, '01098154974', 'de8e53fa3972670f87da28107b5f33fa8441aaba65f047133dfd883635ddf612', '[\"student\"]', '2024-09-17 19:48:17', NULL, '2024-09-17 19:46:15', '2024-09-17 19:48:17'),
(281, 'App\\Models\\Student', 61, '01277029439', '24fb6d294484cf1622aaaf1a664601a45dfc08308cc619853473dd4f11e37d98', '[\"student\"]', '2024-09-23 19:56:00', NULL, '2024-09-17 19:46:38', '2024-09-23 19:56:00'),
(282, 'App\\Models\\Student', 52, '01027709097', 'd38292f32df11d7ccb2b8642796dac67485181d25aa8f90dfbcac4baaece81b0', '[\"student\"]', '2024-09-21 08:02:33', NULL, '2024-09-17 19:47:32', '2024-09-21 08:02:33'),
(283, 'App\\Models\\Student', 73, '01033704934', '1e46988caf789f314355ca2855ea97190bd60852341878007b85ece729927e6a', '[\"student\"]', '2024-09-24 03:58:18', NULL, '2024-09-17 19:47:47', '2024-09-24 03:58:18'),
(284, 'App\\Models\\Student', 104, 'API TOKEN', '3110c6caff40bb20967e38334673c241dc36b33624de5c1796e2815457527371', '[\"*\"]', NULL, NULL, '2024-09-17 19:49:32', '2024-09-17 19:49:32'),
(285, 'App\\Models\\Student', 104, '01154506829', 'bacc5c7c2316e5ba38561af98b2239407b933f06873bae59ffd4a8e1465002bd', '[\"student\"]', '2024-09-23 10:31:05', NULL, '2024-09-17 19:50:50', '2024-09-23 10:31:05'),
(286, 'App\\Models\\Student', 58, '01061231437', 'ecbb67f1f2a7c99f3cfe0b039d2ab6ecfcc7779abaa69b0e507c83ef78bf22bd', '[\"student\"]', '2024-09-23 23:44:23', NULL, '2024-09-17 19:51:27', '2024-09-23 23:44:23'),
(287, 'App\\Models\\Student', 105, 'API TOKEN', 'b15ec32390dac39f5f5d89b6863242dbefa599979677889e0fca9801ba460d6c', '[\"*\"]', NULL, NULL, '2024-09-17 19:51:36', '2024-09-17 19:51:36'),
(288, 'App\\Models\\Admin', 42, 'Christy', '5fbe62ba0c8e550b37ce4a470e04a58bc09b1a98ab82b39b15b15f7d2c2cdf69', '[\"admin\"]', '2024-09-17 21:36:54', NULL, '2024-09-17 19:57:44', '2024-09-17 21:36:54'),
(289, 'App\\Models\\Student', 106, 'API TOKEN', '1b8bd3b10a18fd42033761dae859fca22d00b553b90ac51f81e5609068906cc4', '[\"*\"]', NULL, NULL, '2024-09-17 19:59:26', '2024-09-17 19:59:26'),
(290, 'App\\Models\\Student', 107, 'API TOKEN', 'ff2cb61fd557d651eb5de063ac25cee521fb4c93e07f45b9774a638c8ed09880', '[\"*\"]', NULL, NULL, '2024-09-17 20:02:44', '2024-09-17 20:02:44'),
(291, 'App\\Models\\Student', 95, '01066856131', 'ad4488f53dddee6dba2012ceccf02121a3be11c195b737d32388272e5ea830aa', '[\"student\"]', '2024-09-17 20:06:18', NULL, '2024-09-17 20:02:59', '2024-09-17 20:06:18'),
(292, 'App\\Models\\Student', 95, '01066856131', '4e641f2c1482aacbc7363f43d8d500896ecf208d6c9073e8d43d5ab174551872', '[\"student\"]', '2024-09-17 20:12:00', NULL, '2024-09-17 20:09:27', '2024-09-17 20:12:00'),
(293, 'App\\Models\\Student', 95, '01066856131', 'abfdb8ae0e09b1c106c01ceeb3758cef24f9d714374396cac3cd2e21447df624', '[\"student\"]', '2024-09-24 15:50:27', NULL, '2024-09-17 20:12:47', '2024-09-24 15:50:27'),
(294, 'App\\Models\\Student', 108, 'API TOKEN', 'c9d6bfe4f6b999419612a0547dda94ccf078a7cff4c488fa5855aa9a8fd7eed2', '[\"*\"]', NULL, NULL, '2024-09-17 20:17:17', '2024-09-17 20:17:17'),
(295, 'App\\Models\\Student', 103, '01559365501', '211f72a9e2816c691850a26a0832301e2d0c283dc0d147ef3d08d2b70b416b70', '[\"student\"]', '2024-09-23 23:08:56', NULL, '2024-09-17 20:18:09', '2024-09-23 23:08:56'),
(296, 'App\\Models\\Student', 100, '01100055431', 'bf43e8f4e17295b57edb3d3f2a7b4e1d92ff2201e5658daf2997cfca5707807d', '[\"student\"]', '2024-09-23 19:14:39', NULL, '2024-09-17 20:21:09', '2024-09-23 19:14:39'),
(297, 'App\\Models\\Student', 109, 'API TOKEN', 'bb091fe7f72ed1473f5fcf7931d19b94b9b91645ad16542534db052adec7aee8', '[\"*\"]', NULL, NULL, '2024-09-17 20:27:27', '2024-09-17 20:27:27'),
(298, 'App\\Models\\Student', 62, '01009394733', '25e2557eb6749e7314249a5f04f5e7fab3dca0208e19cf277b82ba567b722f76', '[\"student\"]', '2024-09-18 17:46:17', NULL, '2024-09-17 20:29:04', '2024-09-18 17:46:17'),
(299, 'App\\Models\\Student', 110, 'API TOKEN', '9f12bc6fd223e4df985e0308b351a30d7961bafec386b4b74d6906ef91f74a4a', '[\"*\"]', NULL, NULL, '2024-09-17 20:33:53', '2024-09-17 20:33:53'),
(300, 'App\\Models\\Student', 111, 'API TOKEN', 'ab81f230501bee3be004f97604aa8b5a01d728e4de226c1b1deb8ad1dc494572', '[\"*\"]', NULL, NULL, '2024-09-17 20:36:00', '2024-09-17 20:36:00'),
(301, 'App\\Models\\Student', 40, '01277747053', '18f875031eec11865efc7fb91371939b795923837cb00528d00c2100a67961ea', '[\"student\"]', '2024-09-17 21:32:08', NULL, '2024-09-17 20:36:19', '2024-09-17 21:32:08'),
(302, 'App\\Models\\Student', 112, 'API TOKEN', '1ae46d28c1a9dd80fdae6bfb66f27221ee5d8e0790fc28926b1581befb6f9e1e', '[\"*\"]', NULL, NULL, '2024-09-17 20:37:18', '2024-09-17 20:37:18'),
(303, 'App\\Models\\Student', 113, 'API TOKEN', '8484c8cde138d16ef34859deb95c779a3c52b354a18580942addb73d5c1f5534', '[\"*\"]', NULL, NULL, '2024-09-17 20:41:54', '2024-09-17 20:41:54'),
(304, 'App\\Models\\Student', 114, 'API TOKEN', 'd92b0ac5ecc0783b93454ad8d0e3b30a60bc6b80fbc7b8e53d439df9b8dd5d53', '[\"*\"]', NULL, NULL, '2024-09-17 20:42:05', '2024-09-17 20:42:05'),
(305, 'App\\Models\\Student', 107, '01153749749', 'b0fee9761f9658f917ce71be67698d71e584cea299da0b2a8f30496309fa8675', '[\"student\"]', '2024-09-21 21:10:45', NULL, '2024-09-17 20:42:20', '2024-09-21 21:10:45'),
(306, 'App\\Models\\Student', 108, '01101102268', '33a4bcbab812c8c9b7ad5ff88830caa2b2a697e9b7af379a6e1ce940e6b87c9e', '[\"student\"]', '2024-09-24 19:09:05', NULL, '2024-09-17 20:42:41', '2024-09-24 19:09:05'),
(307, 'App\\Models\\Student', 17, '01141094247', '90144890f8eb10a8701f44eef6c74b17d7358904684cebe8709b98091cbe1846', '[\"student\"]', '2024-09-18 22:08:53', NULL, '2024-09-17 20:43:43', '2024-09-18 22:08:53'),
(308, 'App\\Models\\Student', 114, '01033890548', 'b7f1585b0bcf8b7e15d5e25835cc92eb4ad48b5392a4ee10bebea759f920d660', '[\"student\"]', '2024-09-21 01:32:33', NULL, '2024-09-17 20:45:57', '2024-09-21 01:32:33'),
(309, 'App\\Models\\Student', 111, '01201905932', '7b9ab5987f7b3bde43e5787c2be9b9de79ded9824b277580fa72b3b5745daf17', '[\"student\"]', '2024-09-17 20:57:45', NULL, '2024-09-17 20:48:57', '2024-09-17 20:57:45'),
(310, 'App\\Models\\Student', 113, '01283929037', 'b81970c64ceb6df8dc9a250d21fa1510e0b7170c24ce62188d416c07f4578657', '[\"student\"]', '2024-09-22 18:39:43', NULL, '2024-09-17 20:49:52', '2024-09-22 18:39:43'),
(311, 'App\\Models\\Student', 89, '01206970361', '458c3e6e5eec9ef25f68b437549d128e511cdaf08cd19e9caf59c340d7db9254', '[\"student\"]', '2024-09-23 22:39:20', NULL, '2024-09-17 20:53:57', '2024-09-23 22:39:20'),
(312, 'App\\Models\\Student', 105, '01220031456', 'a97dc1300c0f6a1d912c58a82786c591f2e338b92221ee76910adaec786a330c', '[\"student\"]', '2024-09-17 20:56:50', NULL, '2024-09-17 20:56:49', '2024-09-17 20:56:50'),
(313, 'App\\Models\\Student', 115, 'API TOKEN', '2f6885bd1c08a1871f5a8ec1f00a6f8f035f4ddd8dd88ad90c0244b38cb28494', '[\"*\"]', NULL, NULL, '2024-09-17 21:06:08', '2024-09-17 21:06:08'),
(314, 'App\\Models\\Student', 116, 'API TOKEN', '1feb38f3efe09e0efceb5db556e3a955cb18c4de7a8dbf1669c0798758dd902e', '[\"*\"]', NULL, NULL, '2024-09-17 21:08:32', '2024-09-17 21:08:32'),
(315, 'App\\Models\\Student', 117, 'API TOKEN', 'c56a3743196f29acaba4cb4355300ded795dda1d6a9ec4e1633f1a237bec6f79', '[\"*\"]', NULL, NULL, '2024-09-17 21:09:05', '2024-09-17 21:09:05'),
(316, 'App\\Models\\Student', 118, 'API TOKEN', '0a34c936e5460a4c84bb74b1385a397005d312b8f80f85c6e7c2395f4dccfde9', '[\"*\"]', NULL, NULL, '2024-09-17 21:09:14', '2024-09-17 21:09:14'),
(317, 'App\\Models\\Student', 119, 'API TOKEN', '3ab25a882251322c874814416dc0c54855b01bb6719f3daad01b21afb4e190f6', '[\"*\"]', NULL, NULL, '2024-09-17 21:11:45', '2024-09-17 21:11:45'),
(318, 'App\\Models\\Student', 115, '01281111919', '54347f566d36db6f572384dd4690f1f90daeb00e6be06194f6c6586839883b5b', '[\"student\"]', '2024-09-24 18:45:38', NULL, '2024-09-17 21:17:54', '2024-09-24 18:45:38'),
(319, 'App\\Models\\Student', 116, '01017986133', '36e09e9f283c2c732cddc588dfbde4d5cf58daf1fbd65d0fc1ac98a6c4a0ae91', '[\"student\"]', '2024-09-24 06:01:04', NULL, '2024-09-17 21:18:37', '2024-09-24 06:01:04'),
(320, 'App\\Models\\Student', 118, '01018484028', '64b29a70be7475a68769ec608c9e5611e12937fecc878d5caf83b3baa71f0b7f', '[\"student\"]', '2024-09-17 22:02:15', NULL, '2024-09-17 21:19:41', '2024-09-17 22:02:15'),
(321, 'App\\Models\\Student', 120, 'API TOKEN', 'b74790ef3b2d530b6dc7e723e04d524c26965207a52483991ef5e60cfe4ce2da', '[\"*\"]', NULL, NULL, '2024-09-17 21:20:48', '2024-09-17 21:20:48'),
(322, 'App\\Models\\Student', 121, 'API TOKEN', '76c416d54e7894e0b63d4a9dfe87ddcf1bcc0dc6f3e21dd0754afecfe95e412b', '[\"*\"]', NULL, NULL, '2024-09-17 21:28:02', '2024-09-17 21:28:02'),
(323, 'App\\Models\\Student', 40, '01277747053', 'd601f23824dcff689e779e12e246585380dc4878a3fc541adde3cb49d4eeda49', '[\"student\"]', '2024-09-17 22:23:59', NULL, '2024-09-17 21:32:50', '2024-09-17 22:23:59'),
(324, 'App\\Models\\Student', 122, 'API TOKEN', 'f343620faa8a8f15309c4eda7fc88dd84a9dc3798541641e8fb4b56684394084', '[\"*\"]', NULL, NULL, '2024-09-17 21:32:54', '2024-09-17 21:32:54'),
(325, 'App\\Models\\Student', 122, '01007468492', 'b9f15d4f41c87a7a93876adde7d0954ac10484b4d8a1d0a17b304b6aafda30dd', '[\"student\"]', '2024-09-18 00:26:57', NULL, '2024-09-17 21:33:38', '2024-09-18 00:26:57'),
(326, 'App\\Models\\Student', 123, 'API TOKEN', '8c5c5f0de984bba086c932c3a04b9535c493931dfd96305cbf29f245f26caf34', '[\"*\"]', NULL, NULL, '2024-09-17 21:34:45', '2024-09-17 21:34:45'),
(327, 'App\\Models\\Student', 120, '01020260629', '5266b4535947e55b743b0fad1e9aa165ff4f827c11b2a7e3f887135530a94cac', '[\"student\"]', '2024-09-18 20:16:58', NULL, '2024-09-17 21:35:01', '2024-09-18 20:16:58'),
(328, 'App\\Models\\Student', 69, '01018212582', '0968b681d08bcf8a274be6775bf91db9b799f92f9898c7be04726c5a7e721890', '[\"student\"]', '2024-09-23 02:02:23', NULL, '2024-09-17 21:36:32', '2024-09-23 02:02:23'),
(329, 'App\\Models\\Admin', 42, 'Christy', '2e7c950d2e720d6076ca1c4de18b08d2a212a406adae09cbd211d2a4643d59d9', '[\"admin\"]', '2024-09-24 01:26:28', NULL, '2024-09-17 21:37:16', '2024-09-24 01:26:28'),
(330, 'App\\Models\\Student', 112, '01013873861', 'a1b49104284ed6a81a4403a55fd00e4367596bdc7aa3c406085d5619123379b8', '[\"student\"]', '2024-09-18 13:16:31', NULL, '2024-09-17 21:44:07', '2024-09-18 13:16:31'),
(331, 'App\\Models\\Student', 124, 'API TOKEN', '69a57b4beda1176a868eefcb011b7507dc96b544fa91b03162ea9394947810f0', '[\"*\"]', NULL, NULL, '2024-09-17 21:47:15', '2024-09-17 21:47:15'),
(332, 'App\\Models\\Student', 125, 'API TOKEN', '1279cb3bce1ae1593327cb2104129737d87adbef8c8a40964724a20dbf572881', '[\"*\"]', NULL, NULL, '2024-09-17 21:51:11', '2024-09-17 21:51:11'),
(333, 'App\\Models\\Student', 123, '01127273692', 'c2e4bf175b513fec022648a871107fcf1368d4fa935bdabaef5f445ec36a3129', '[\"student\"]', '2024-09-24 20:48:58', NULL, '2024-09-17 21:54:05', '2024-09-24 20:48:58'),
(334, 'App\\Models\\Student', 126, 'API TOKEN', 'ada8e71400bb59af5876728e68238beb1244dcf3882a5498c8014f5375f0b87a', '[\"*\"]', NULL, NULL, '2024-09-17 21:58:18', '2024-09-17 21:58:18'),
(335, 'App\\Models\\Student', 127, 'API TOKEN', '86d6e2ce47040b4df1868d14df3d3f8bb0eddfddcfbc306f7deb6efa0ab184a3', '[\"*\"]', NULL, NULL, '2024-09-17 22:02:10', '2024-09-17 22:02:10'),
(336, 'App\\Models\\Student', 128, 'API TOKEN', 'a91b58751955b9bd9aacdef1a53e94588c62a3c4bd3a7e1448476aeba233fdd6', '[\"*\"]', NULL, NULL, '2024-09-17 22:13:38', '2024-09-17 22:13:38'),
(337, 'App\\Models\\Student', 128, '01200299052', 'd0e12378a1b29a79bc3364641c9af0b35e74fed28deccfec22eea6df6861638b', '[\"student\"]', '2024-09-18 00:01:41', NULL, '2024-09-17 22:14:39', '2024-09-18 00:01:41'),
(338, 'App\\Models\\Student', 124, '01222702364', '6ccfa4a978767102f58f31a2e7bc43cddd95c13e98082b236dff801065c63e7f', '[\"student\"]', '2024-09-23 23:16:22', NULL, '2024-09-17 22:20:12', '2024-09-23 23:16:22'),
(339, 'App\\Models\\Student', 97, '01282050281', 'b5088ab7b9753926ea26c7ddfbb2b2704fd1239f6a4d5dceaa5d9a50b6dd5fcd', '[\"student\"]', '2024-09-18 23:12:49', NULL, '2024-09-17 22:21:26', '2024-09-18 23:12:49'),
(340, 'App\\Models\\Student', 129, 'API TOKEN', '06639cdb24db4e54b9ad413c2bb72030ef1c3ca15d3c080e41315f9ca38ef95e', '[\"*\"]', NULL, NULL, '2024-09-17 22:23:20', '2024-09-17 22:23:20'),
(341, 'App\\Models\\Student', 130, 'API TOKEN', '3e98c9b4e799f8f3559fd06e293f4acdcb0939151412b9a45593ea717cdbdf8e', '[\"*\"]', NULL, NULL, '2024-09-17 22:24:03', '2024-09-17 22:24:03'),
(342, 'App\\Models\\Student', 71, '01090103755', '779a99123779389387adbffb1a7dd7e510b1f59aa7c6ace3c9825f8142ded32f', '[\"student\"]', '2024-09-24 20:12:06', NULL, '2024-09-17 22:25:14', '2024-09-24 20:12:06'),
(343, 'App\\Models\\Student', 129, '01016654407', '2556d980b874f3e7e7ddb2a11f55121a46c5e452071c2dedcc088b4b9ad92612', '[\"student\"]', '2024-09-22 00:23:06', NULL, '2024-09-17 22:26:08', '2024-09-22 00:23:06'),
(344, 'App\\Models\\Student', 131, 'API TOKEN', '0499621e2c9584037eaca7753c0a56253c46b8f5d695a0d1d478639500a211e7', '[\"*\"]', NULL, NULL, '2024-09-17 22:28:00', '2024-09-17 22:28:00'),
(345, 'App\\Models\\Student', 132, 'API TOKEN', '4e35bd89563900a29d489d8d3b7f5d1edb11c80e8cb15f4890e2806b6caa4a27', '[\"*\"]', NULL, NULL, '2024-09-17 22:28:31', '2024-09-17 22:28:31'),
(346, 'App\\Models\\Student', 130, '01090466844', '969c1d7fe7b72be32fdef563ac3d614d9c76795f009d0e58296cf23f31c2a825', '[\"student\"]', '2024-09-23 20:14:58', NULL, '2024-09-17 22:30:45', '2024-09-23 20:14:58'),
(347, 'App\\Models\\Student', 40, '01277747053', '2f016be72cb5f3fb404cba5aadcaaae03dd3a17c50169a8bb3125ea828f9dce7', '[\"student\"]', '2024-09-18 21:48:59', NULL, '2024-09-17 22:30:56', '2024-09-18 21:48:59'),
(348, 'App\\Models\\Student', 63, '01210690424', 'a1bff313696b72a867875299daae84f40468daa2aa1661ab3bd824ed59430436', '[\"student\"]', '2024-09-17 22:33:21', NULL, '2024-09-17 22:33:10', '2024-09-17 22:33:21'),
(349, 'App\\Models\\Student', 133, 'API TOKEN', '74bc3072565cccc48418a7d31c02779cbd092d02f0d90068267f438e23bccd04', '[\"*\"]', NULL, NULL, '2024-09-17 22:34:53', '2024-09-17 22:34:53'),
(350, 'App\\Models\\Student', 63, '01210690424', '7de9abe9f9871c2471f0869793f0dfa1680176a9c188af00d26c0fc93d360884', '[\"student\"]', '2024-09-23 22:57:56', NULL, '2024-09-17 22:36:53', '2024-09-23 22:57:56'),
(351, 'App\\Models\\Student', 134, 'API TOKEN', 'f976137b3f844d19a38c4c3ff4df389566bad59ce9491cfebde1be99c169c87b', '[\"*\"]', NULL, NULL, '2024-09-17 22:40:21', '2024-09-17 22:40:21'),
(352, 'App\\Models\\Student', 126, '01111797951', 'ca97878a1a15a90f2e31ed47b048b7b55914da2fb6ed955b3f07cb184056bf57', '[\"student\"]', '2024-09-24 06:45:26', NULL, '2024-09-17 22:41:22', '2024-09-24 06:45:26'),
(353, 'App\\Models\\Student', 135, 'API TOKEN', 'fb3b181a062cdffcad24324e78f90a74ffe1688cd31a12b5df58b0eb9c34d890', '[\"*\"]', NULL, NULL, '2024-09-17 22:45:06', '2024-09-17 22:45:06'),
(354, 'App\\Models\\Student', 86, '01019188321', '566102933f68f679780c2fa51a0179bd3c9921e090dceeec37fe01ae4cb82d56', '[\"student\"]', '2024-09-23 21:38:51', NULL, '2024-09-17 22:52:57', '2024-09-23 21:38:51'),
(355, 'App\\Models\\Student', 115, '01281111919', 'cb2ed7ebb6115058586ae865b4fc3f54f8431fb210cef48f5d0e456bf64357e8', '[\"student\"]', '2024-09-17 23:05:55', NULL, '2024-09-17 23:04:01', '2024-09-17 23:05:55'),
(356, 'App\\Models\\Student', 136, 'API TOKEN', '1959e7becc632957a8bd1863083d84cc370b8b53f0cf952296b44b7470408faf', '[\"*\"]', NULL, NULL, '2024-09-17 23:05:01', '2024-09-17 23:05:01'),
(357, 'App\\Models\\Student', 131, '01118774181', '5ed39acdfd5faa4fce1a8ce26dcfe78de887c62b27672de55d9a62c5bec7df37', '[\"student\"]', '2024-09-18 00:52:48', NULL, '2024-09-17 23:16:49', '2024-09-18 00:52:48'),
(358, 'App\\Models\\Student', 137, 'API TOKEN', 'c42a036ea4bc1db51f2ef74837345c6e9ca1cd239024ca9128690aa7429e34b5', '[\"*\"]', NULL, NULL, '2024-09-17 23:18:15', '2024-09-17 23:18:15'),
(359, 'App\\Models\\Student', 138, 'API TOKEN', '45cd8952899e2993b2e8c765b14c565a1a8a93606aa478091a9a64f13866213d', '[\"*\"]', NULL, NULL, '2024-09-17 23:26:11', '2024-09-17 23:26:11'),
(360, 'App\\Models\\Student', 66, '01012722565', '9f2a4a695b9dbeeef5c68da9d1b1e22cd6593848a1536af6425191714adf8faf', '[\"student\"]', '2024-09-24 20:16:10', NULL, '2024-09-17 23:27:30', '2024-09-24 20:16:10'),
(361, 'App\\Models\\Student', 139, 'API TOKEN', 'af2b16cb8dae3482f298aa075f4814c3d3e89b2a7d996a527786471bc54a2932', '[\"*\"]', NULL, NULL, '2024-09-17 23:28:54', '2024-09-17 23:28:54'),
(362, 'App\\Models\\Student', 138, '01065427463', '91790eb57530a9e1274d5abde158601058bed2f55754515470b6706a1f9a9485', '[\"student\"]', '2024-09-24 13:07:24', NULL, '2024-09-17 23:32:11', '2024-09-24 13:07:24'),
(363, 'App\\Models\\Student', 140, 'API TOKEN', 'fba07d4eca12fddd9a2f8b2e1937f678301ed87009fc69d8f6c5a3e32205157c', '[\"*\"]', NULL, NULL, '2024-09-17 23:34:30', '2024-09-17 23:34:30'),
(364, 'App\\Models\\Student', 139, '01011403830', '09d0259210985fe62aaab01fe6587718aa66b4eaa0b493aadc9eff7bee81429d', '[\"student\"]', '2024-09-18 05:27:12', NULL, '2024-09-17 23:43:52', '2024-09-18 05:27:12'),
(365, 'App\\Models\\Student', 141, 'API TOKEN', '45bb9ef38dee9497fe595237dd0f233a5994b13e9ab2295f9fe31c7c7b967640', '[\"*\"]', NULL, NULL, '2024-09-17 23:54:20', '2024-09-17 23:54:20'),
(366, 'App\\Models\\Student', 142, 'API TOKEN', '273e68688a4c9745324e6c2b9685a25297d0635f3d1770a8ff5aad61bf096009', '[\"*\"]', NULL, NULL, '2024-09-17 23:54:59', '2024-09-17 23:54:59'),
(367, 'App\\Models\\Student', 140, '01113944094', '823f8eb8b512cdac6b79427a7efb00ff7a1f64f56b772b7c8e91d17d040d873d', '[\"student\"]', '2024-09-18 00:03:18', NULL, '2024-09-18 00:03:13', '2024-09-18 00:03:18'),
(368, 'App\\Models\\Student', 141, '01002866155', 'd3ed4ed7b091d5283c70c68cff75d220417c527f6838fbfbccba0aaf8d66fe2c', '[\"student\"]', '2024-09-18 00:13:17', NULL, '2024-09-18 00:03:31', '2024-09-18 00:13:17'),
(369, 'App\\Models\\Student', 143, 'API TOKEN', '3e5fce2f829f7918facdf0f6a0b062e4e9b9d38455d9ef6b32058534a5a8809f', '[\"*\"]', NULL, NULL, '2024-09-18 00:04:58', '2024-09-18 00:04:58'),
(370, 'App\\Models\\Student', 76, '01093946300', 'c46c9c05de1478432f7a9fa79edc06d14cc9e3a7b726b499683ca6a0e386fc7e', '[\"student\"]', '2024-09-23 19:13:23', NULL, '2024-09-18 00:06:02', '2024-09-23 19:13:23'),
(371, 'App\\Models\\Student', 127, '01062578018', '81ae58261309f056f1c379a7f3fe75377658b43278a0169645b9300b248364ea', '[\"student\"]', '2024-09-24 00:52:44', NULL, '2024-09-18 00:07:28', '2024-09-24 00:52:44'),
(372, 'App\\Models\\Student', 144, 'API TOKEN', 'c3fdc34ee31bf97f0cebcb2dfec7ab1556f3b71fa9f7851d9f6978cf1d76cabc', '[\"*\"]', NULL, NULL, '2024-09-18 00:11:00', '2024-09-18 00:11:00'),
(373, 'App\\Models\\Student', 145, 'API TOKEN', '5b09991908347734d87781b41ebe51b8c9b82f4a0a813b71b0fca819adf69f1a', '[\"*\"]', NULL, NULL, '2024-09-18 00:11:31', '2024-09-18 00:11:31'),
(374, 'App\\Models\\Student', 144, '01066634666', '407750d9d75bf1f91bb651c5d236acdb14c3f46b27a55e0720c9a35d3cf42db2', '[\"student\"]', '2024-09-23 23:00:26', NULL, '2024-09-18 00:12:41', '2024-09-23 23:00:26'),
(375, 'App\\Models\\Student', 146, 'API TOKEN', '6129f7eb9b29a4dba3469ff6a993cd9d84a12103437cfa9a8c5d4103bffd7a2d', '[\"*\"]', NULL, NULL, '2024-09-18 00:16:41', '2024-09-18 00:16:41'),
(376, 'App\\Models\\Student', 82, '01000812890', '7dd15aa8f06ca783f5f76207640369d0e97f2c843f1449bb09a4255daca1b9ae', '[\"student\"]', '2024-09-18 00:30:44', NULL, '2024-09-18 00:30:08', '2024-09-18 00:30:44'),
(377, 'App\\Models\\Student', 80, '01142312226', 'c734b68938dddc73e8b83e2b7dfcd1caa4c52ce353b7be7282ec7da74a0693cf', '[\"student\"]', '2024-09-18 00:35:45', NULL, '2024-09-18 00:34:02', '2024-09-18 00:35:45'),
(378, 'App\\Models\\Student', 119, '01066262364', '354f542401bb741c226c942aa40758150dfb45b1375bc95b1cf157b6f4053025', '[\"student\"]', '2024-09-20 14:29:57', NULL, '2024-09-18 00:38:09', '2024-09-20 14:29:57'),
(379, 'App\\Models\\Student', 147, 'API TOKEN', '8f33769367e771a0b70a76beefc7d0b66cf2f82490dfa1aa17a07d8cf8f57d93', '[\"*\"]', NULL, NULL, '2024-09-18 00:59:12', '2024-09-18 00:59:12'),
(380, 'App\\Models\\Student', 145, '01096862316', 'a94a4a14f75976985b3f237ab3d1b8b3a93f142581a4a0fdff81d2732df59f37', '[\"student\"]', '2024-09-24 02:15:44', NULL, '2024-09-18 01:23:29', '2024-09-24 02:15:44'),
(381, 'App\\Models\\Admin', 1, 'ahmedsabry', '8e74e7c468760d63b4996c514071dfd3cc8d5a9257a276b77cae51ae00244f47', '[\"admin\"]', '2024-09-18 01:38:32', NULL, '2024-09-18 01:34:10', '2024-09-18 01:38:32'),
(382, 'App\\Models\\Student', 40, '01277747053', '0e8b13616c193fcbaa8f0b6d8a3be133bc21b217ec849ef1c94a1dc1bd86d69f', '[\"student\"]', '2024-09-18 01:44:26', NULL, '2024-09-18 01:39:50', '2024-09-18 01:44:26'),
(383, 'App\\Models\\Student', 91, '01030977550', '3b4eb8d511ae949157d917fb4d547d3c0926e30ba926343c9908b8e401dd2181', '[\"student\"]', '2024-09-22 15:55:20', NULL, '2024-09-18 01:51:15', '2024-09-22 15:55:20'),
(384, 'App\\Models\\Student', 111, '01201905932', '1009674cf1e0e47d880ef5751d6f48bebebd7c15b9bad44f08b333f2c41900d3', '[\"student\"]', '2024-09-18 01:51:37', NULL, '2024-09-18 01:51:37', '2024-09-18 01:51:37'),
(385, 'App\\Models\\Student', 142, '01281433419', '0069dcd107544821dae4a465643c2ad25c2bca3d2ae2125422c9284a2d074492', '[\"student\"]', '2024-09-23 23:32:45', NULL, '2024-09-18 02:49:50', '2024-09-23 23:32:45'),
(386, 'App\\Models\\Student', 148, 'API TOKEN', '9c0990fc8c9e9c43c834851e880638e1443154bf7d593917ac4de39cdcb15e9d', '[\"*\"]', NULL, NULL, '2024-09-18 02:53:20', '2024-09-18 02:53:20'),
(387, 'App\\Models\\Admin', 1, 'ahmedsabry', '1e35202a1524609c9441ca7be8ba809350bfc843b68c52b880e5dd02526a7ad1', '[\"admin\"]', '2024-09-18 04:48:24', NULL, '2024-09-18 04:44:50', '2024-09-18 04:48:24'),
(388, 'App\\Models\\Admin', 1, 'ahmedsabry', '1f35403fcd73bd0282c133475efff8ef7348327e20be8a39a25191e7191d6574', '[\"admin\"]', '2024-09-18 05:38:47', NULL, '2024-09-18 04:58:52', '2024-09-18 05:38:47'),
(389, 'App\\Models\\Student', 70, '01122552484', 'b70a6730fd64ddd4ceb2ce7f42b11c269be1a5984f9ed9927d868602d546b66e', '[\"student\"]', '2024-09-24 22:47:41', NULL, '2024-09-18 11:39:40', '2024-09-24 22:47:41'),
(390, 'App\\Models\\Student', 149, 'API TOKEN', 'b9191f71f24c4a5f9997306f03957ee6f74543326ce443c91f6c2dd18f81ebf9', '[\"*\"]', NULL, NULL, '2024-09-18 12:47:05', '2024-09-18 12:47:05'),
(391, 'App\\Models\\Student', 28, '01099773631', '40e64fd5c9554ed52aae44d731c018c92650061243469d3a3e3291259860f07e', '[\"student\"]', '2024-09-23 16:30:10', NULL, '2024-09-18 14:42:55', '2024-09-23 16:30:10'),
(392, 'App\\Models\\Student', 81, '01024887357', 'b4092f60dc5d42ae32becb8d5f9dd1f35a70835781ca3a6d73f4d9905c1940f3', '[\"student\"]', '2024-09-24 15:31:52', NULL, '2024-09-18 14:51:47', '2024-09-24 15:31:52'),
(393, 'App\\Models\\Student', 48, '01119635808', 'bca3adb13174f663b160b546ed2cce98f4c57b35a5f1ab271aa20b6405e037ec', '[\"student\"]', '2024-09-18 14:55:52', NULL, '2024-09-18 14:55:50', '2024-09-18 14:55:52'),
(394, 'App\\Models\\Student', 137, '01151189228', '465b052a3d760005e753c272bb7071ff6678cdc292865302368d99cab5f6e316', '[\"student\"]', '2024-09-18 15:16:04', NULL, '2024-09-18 15:15:21', '2024-09-18 15:16:04'),
(395, 'App\\Models\\Student', 104, '01154506829', 'e2275d89ddb321f747af1e890d7d283cdc598284b4122168149a98cd321f8025', '[\"student\"]', '2024-09-23 01:33:29', NULL, '2024-09-18 15:34:27', '2024-09-23 01:33:29'),
(396, 'App\\Models\\Student', 150, 'API TOKEN', 'd9bf74605a548084c42114c9f89e3622520f706dfbeb100329c82f05bb9ad5af', '[\"*\"]', NULL, NULL, '2024-09-18 16:43:57', '2024-09-18 16:43:57'),
(397, 'App\\Models\\Student', 150, '01017895560', 'a8212985f650d28024d9e057d0738704ed33c523dc322dd7969e997a6e404031', '[\"student\"]', '2024-09-24 19:02:33', NULL, '2024-09-18 17:05:39', '2024-09-24 19:02:33'),
(398, 'App\\Models\\Student', 92, '01023254523', '53e27c23a2f6dcf54f5902fed2aef9f5ebaf8bc7834f9b226b8c02f13e67c097', '[\"student\"]', '2024-09-22 14:31:52', NULL, '2024-09-18 17:34:56', '2024-09-22 14:31:52'),
(399, 'App\\Models\\Student', 133, '01009517939', 'e732b9d65d2b82d801515ee0d34b23bb52f3b0e5f5095b9eaaf81af738ecff1f', '[\"student\"]', '2024-09-25 15:25:05', NULL, '2024-09-18 18:35:34', '2024-09-25 15:25:05'),
(400, 'App\\Models\\Student', 106, '01126804887', '94a57d431d8f28be2945e0028c6e70eb66fae96c1b269a7d2a0bb238c3876b94', '[\"student\"]', '2024-09-19 01:50:22', NULL, '2024-09-18 18:52:33', '2024-09-19 01:50:22'),
(401, 'App\\Models\\Student', 62, '01009394733', '95d6702cea4fa8069fb824d61dd0d2f7aa40fbdd23db11f0f786c5fd713fab31', '[\"student\"]', '2024-09-19 23:52:00', NULL, '2024-09-18 19:43:55', '2024-09-19 23:52:00'),
(402, 'App\\Models\\Student', 36, '01094309626', 'de3ded88bcfe2207e3cfbb6e7abb8b3bfa7bfcd8c079bc927715a12c18eee6f2', '[\"student\"]', '2024-09-22 08:49:41', NULL, '2024-09-18 20:14:58', '2024-09-22 08:49:41'),
(403, 'App\\Models\\Student', 151, 'API TOKEN', 'fbd6b1ec5657917cae09310b451b51b755f62674733f58da8c874de1285a9176', '[\"*\"]', NULL, NULL, '2024-09-18 20:17:30', '2024-09-18 20:17:30'),
(404, 'App\\Models\\Student', 109, '01097029037', 'ce8602bd36b2ee90ad69fa05adc49380331d624065c5c7052451cd7e8e251d09', '[\"student\"]', '2024-09-24 00:58:18', NULL, '2024-09-18 20:54:28', '2024-09-24 00:58:18'),
(405, 'App\\Models\\Student', 132, '01113774495', '56fdfb7fe73781adbe7e24f34d7fe5fe32bf248a623f45c02077df5762baff19', '[\"student\"]', '2024-09-25 08:04:45', NULL, '2024-09-18 21:04:08', '2024-09-25 08:04:45'),
(406, 'App\\Models\\Student', 152, 'API TOKEN', '56ce732762c89c97e0122d918e4e10b894ecb5a974d9515b7099e90aa042b647', '[\"*\"]', NULL, NULL, '2024-09-18 21:56:30', '2024-09-18 21:56:30'),
(407, 'App\\Models\\Student', 152, '01228588169', '390d650d4832ae9937fa0c0ff42fe19bb62b99c1518e9bad6b9b50ff00be3630', '[\"student\"]', '2024-09-19 18:36:05', NULL, '2024-09-18 21:57:15', '2024-09-19 18:36:05'),
(408, 'App\\Models\\Student', 65, '01007153889', 'a53bb8135562c628bc6a301c687c33ea3b4ee98024268d1f3535a8eb61975a2d', '[\"student\"]', '2024-09-24 22:29:07', NULL, '2024-09-18 22:19:40', '2024-09-24 22:29:07'),
(409, 'App\\Models\\Student', 64, '01064130508', 'f456e3decd5d4468ec5d73d3621ef5eb28db62c89fdce81cbb4a64a042958bea', '[\"student\"]', '2024-09-23 13:22:54', NULL, '2024-09-18 22:21:02', '2024-09-23 13:22:54'),
(410, 'App\\Models\\Student', 46, '01001397857', 'b334bb217791f3fc04be1d563e933fe8f02f9fcde3dae682300301beee5f18de', '[\"student\"]', '2024-09-24 04:30:17', NULL, '2024-09-19 00:59:48', '2024-09-24 04:30:17'),
(411, 'App\\Models\\Student', 33, '01090378746', 'c3c4972f7a1dd3e079390886bf36c8386fd8f75fe354331d778ec9b6be2619e0', '[\"student\"]', '2024-09-19 01:09:07', NULL, '2024-09-19 01:08:49', '2024-09-19 01:09:07'),
(412, 'App\\Models\\Student', 132, '01113774495', '2d102e302488d94b83f6b2d4e0a7726483665f6dbe204768e3115903a0907c32', '[\"student\"]', '2024-09-20 03:47:46', NULL, '2024-09-19 02:23:20', '2024-09-20 03:47:46'),
(413, 'App\\Models\\Student', 49, '01122271152', 'a828f394d8acc225d08e9d7eb402ddfc032c290eb16eaa0dc2f034a19a5795fa', '[\"student\"]', '2024-09-19 02:38:50', NULL, '2024-09-19 02:34:29', '2024-09-19 02:38:50'),
(414, 'App\\Models\\Student', 84, '01063307508', '32aba60fa1e12744b8f7ac8a8856522769c4e49b18bc6697ff1ded0ec1fa59cc', '[\"student\"]', '2024-09-19 05:16:53', NULL, '2024-09-19 05:02:07', '2024-09-19 05:16:53'),
(415, 'App\\Models\\Admin', 1, 'ahmedsabry', 'e2ca2ade708fbcfe96a8507408b70d35c3bd36cd566693540abb031c8005f074', '[\"admin\"]', '2024-09-19 05:37:32', NULL, '2024-09-19 05:37:24', '2024-09-19 05:37:32'),
(416, 'App\\Models\\Student', 27, '01210954955', '76fd3584d1b8edc1bfa44fbf6c66fada86c034c1e7874da3afe4ecc217c54d91', '[\"student\"]', '2024-09-19 07:42:48', NULL, '2024-09-19 06:16:44', '2024-09-19 07:42:48'),
(417, 'App\\Models\\Student', 53, '01017899581', '9d9e65594b06a507ae45a30d926e0ebc81c0785d289d5efbbd3aa3f6d1e554ad', '[\"student\"]', '2024-09-23 07:08:27', NULL, '2024-09-19 12:55:28', '2024-09-23 07:08:27'),
(418, 'App\\Models\\Student', 124, '01222702364', '9ad861e67446a133c0fdf56c58584231cc0a2895d08e5db69a1fa7ec90df3eb5', '[\"student\"]', '2024-09-21 22:51:44', NULL, '2024-09-19 13:21:32', '2024-09-21 22:51:44'),
(419, 'App\\Models\\Student', 42, '01100418327', 'a3964d39fb7ba3e081bad906d9db6c5a80f6e00c1ec7f21697e386470ae1e995', '[\"student\"]', '2024-09-20 01:25:48', NULL, '2024-09-19 14:09:25', '2024-09-20 01:25:48'),
(420, 'App\\Models\\Student', 153, 'API TOKEN', '0ba1fe2cde0069c8845e07f5a99a7225368c309bfc9714471f2978db8d720805', '[\"*\"]', NULL, NULL, '2024-09-19 16:03:14', '2024-09-19 16:03:14'),
(421, 'App\\Models\\Student', 110, '01016531767', 'd3cc3d10e65800eb05cbbfac590c21b3fdce6fd5e2fa7d221e7d5d327e123af4', '[\"student\"]', '2024-09-19 16:13:21', NULL, '2024-09-19 16:12:19', '2024-09-19 16:13:21'),
(422, 'App\\Models\\Student', 88, '01021350133', '1ab573ee7e7e49fb35577b65f54886d91ec5a5f8abbab1e291d6d6f91e5ed33e', '[\"student\"]', '2024-09-19 16:22:11', NULL, '2024-09-19 16:22:10', '2024-09-19 16:22:11'),
(423, 'App\\Models\\Student', 40, '01277747053', '2a4ef2b21ca36d130260a0adb62106bfaf35b447355ae71ef7b18d1d26de768b', '[\"student\"]', '2024-09-19 18:37:51', NULL, '2024-09-19 18:37:37', '2024-09-19 18:37:51'),
(424, 'App\\Models\\Student', 152, '01228588169', '39c797987db32fa7aad20e7baed05cf7a896f63f2af498d87ca30eb4bc485e93', '[\"student\"]', '2024-09-22 22:18:44', NULL, '2024-09-19 18:38:23', '2024-09-22 22:18:44'),
(425, 'App\\Models\\Student', 154, 'API TOKEN', '0fdebf2d25752add397a50705adc8317fb9cc83869a31e6e6dbedc90bab103cb', '[\"*\"]', NULL, NULL, '2024-09-19 19:56:30', '2024-09-19 19:56:30'),
(426, 'App\\Models\\Student', 151, '01098538219', '20801dcaead8765007d8d7630dd279a305229fcc65d48828ae949565c24ae616', '[\"student\"]', '2024-09-23 19:21:12', NULL, '2024-09-19 19:59:05', '2024-09-23 19:21:12'),
(427, 'App\\Models\\Student', 155, 'API TOKEN', 'b25ccb0a8e2cb266459096e8e56a5cf92db3b254596ea8c77e929e1b101ac8b7', '[\"*\"]', NULL, NULL, '2024-09-19 20:50:41', '2024-09-19 20:50:41'),
(428, 'App\\Models\\Student', 85, '01024779920', '8399442c78786ca4670250524b42ec9856479ef0058780d55e65adbf777918fd', '[\"student\"]', '2024-09-22 13:03:34', NULL, '2024-09-19 21:15:54', '2024-09-22 13:03:34'),
(429, 'App\\Models\\Student', 44, '01122788772', '6f2abffbc8493fd818df4566fbeac503640998d0f492721c12c81b01ec431f05', '[\"student\"]', '2024-09-21 17:48:04', NULL, '2024-09-19 21:16:06', '2024-09-21 17:48:04'),
(430, 'App\\Models\\Student', 156, 'API TOKEN', '1364a5bf2c1b8ae8ae0fc1fd47a0640b640186c068a230571c54297952667ec5', '[\"*\"]', NULL, NULL, '2024-09-19 21:52:16', '2024-09-19 21:52:16'),
(431, 'App\\Models\\Student', 45, '01289373810', 'ac15b9e74006adbbe0865e178451ed872ccb847088d3695087ef27272ae199df', '[\"student\"]', '2024-09-19 23:10:27', NULL, '2024-09-19 23:09:22', '2024-09-19 23:10:27'),
(432, 'App\\Models\\Student', 157, 'API TOKEN', '3924ea765ab4e69d23d0fdbbdd9e60e0ae2759e998128c81cd3153a783ac8e7c', '[\"*\"]', NULL, NULL, '2024-09-19 23:33:16', '2024-09-19 23:33:16'),
(433, 'App\\Models\\Student', 47, '01010824553', 'e75899cc1a897d5aa35390679f9133bb46ed5aeff7b1f4ae076e59db1376d5da', '[\"student\"]', '2024-09-24 04:54:30', NULL, '2024-09-20 00:08:21', '2024-09-24 04:54:30'),
(434, 'App\\Models\\Student', 158, 'API TOKEN', 'f9a72dbbf6230030fcf24ec908b2cc36ef63a09266bd52fbbd537bc5e8e5b8bd', '[\"*\"]', NULL, NULL, '2024-09-20 00:46:48', '2024-09-20 00:46:48'),
(435, 'App\\Models\\Student', 90, '01012347190', '42269a72afc3ff1f60aceb21ca6510dd3325c148d75d3aacea71841ffcb0651f', '[\"student\"]', '2024-09-20 00:57:11', NULL, '2024-09-20 00:56:09', '2024-09-20 00:57:11'),
(436, 'App\\Models\\Student', 159, 'API TOKEN', '405de494eb34ef5a379ff0bd22ab78d0fc6c1a27d53010828ee5587a45e83d20', '[\"*\"]', NULL, NULL, '2024-09-20 02:39:09', '2024-09-20 02:39:09'),
(437, 'App\\Models\\Student', 160, 'API TOKEN', 'a1b7708ac3208c70204758741eff3dd689fa849d930c83282cc0c09a2844ad2d', '[\"*\"]', NULL, NULL, '2024-09-20 03:18:53', '2024-09-20 03:18:53'),
(438, 'App\\Models\\Student', 25, '01011664483', 'c675577be0811db81548c46450c6c0c2ec251d49c8948af38df65f7c66a48da5', '[\"student\"]', '2024-09-25 19:47:00', NULL, '2024-09-20 03:34:59', '2024-09-25 19:47:00'),
(439, 'App\\Models\\Student', 161, 'API TOKEN', '63412af26004e073d5a30e0c4620cb7a87b9ca4d9564dac14987f63b7d495e0c', '[\"*\"]', NULL, NULL, '2024-09-20 07:02:21', '2024-09-20 07:02:21'),
(440, 'App\\Models\\Student', 62, '01009394733', '58285bb0db01b0e309571d1418851e9924b7791de0b3dd768796c565555b2078', '[\"student\"]', '2024-09-20 21:21:16', NULL, '2024-09-20 12:19:35', '2024-09-20 21:21:16'),
(441, 'App\\Models\\Student', 78, '01092089622', '35c9622a28ae01b1a6a0ffe23b597037e769f055c6f1c04ecf67615c70c9fa67', '[\"student\"]', '2024-09-22 22:48:32', NULL, '2024-09-20 12:52:36', '2024-09-22 22:48:32'),
(442, 'App\\Models\\Student', 119, '01066262364', '70a5fa587a46bd00a5b0a798e2cb12c9557a09698164cf89dd7319b3bf61db4e', '[\"student\"]', '2024-09-20 15:45:17', NULL, '2024-09-20 14:19:10', '2024-09-20 15:45:17'),
(443, 'App\\Models\\Student', 80, '01142312226', '589dfc4b3022e34edbce08d4b722053342b49b0516c861700455e4459b0442f2', '[\"student\"]', '2024-09-21 02:09:52', NULL, '2024-09-20 14:26:46', '2024-09-21 02:09:52'),
(444, 'App\\Models\\Student', 162, 'API TOKEN', '7e3c81944d9a87a64db8b8a04780bd3282c31e8f3e0bf881d51b341f41564a5c', '[\"*\"]', NULL, NULL, '2024-09-20 14:29:22', '2024-09-20 14:29:22'),
(445, 'App\\Models\\Student', 162, '01279418076', '302f8d3fd3fa44d7afd1c7a6ae75d2181d851a2441a8ae70e7b7201f61c341da', '[\"student\"]', '2024-09-21 02:55:17', NULL, '2024-09-20 14:31:01', '2024-09-21 02:55:17'),
(446, 'App\\Models\\Student', 125, '01092394227', 'febdf787c441429cadbcd903a825dbb86782a61aa58f12f0c8272c9cd9ec8807', '[\"student\"]', '2024-09-24 20:35:21', NULL, '2024-09-20 17:09:00', '2024-09-24 20:35:21'),
(447, 'App\\Models\\Student', 134, '01553392533', 'f0aa93def9d471ce7722902ff0423b5b43036a759838b77ceccf7339b02b409a', '[\"student\"]', '2024-09-25 14:34:53', NULL, '2024-09-20 17:43:06', '2024-09-25 14:34:53'),
(448, 'App\\Models\\Student', 153, '01066188542', 'd6f1565ffac6a452de174a638e584cdc5b96b1046fd99158aa236dd0d522b89e', '[\"student\"]', '2024-09-20 17:55:30', NULL, '2024-09-20 17:55:13', '2024-09-20 17:55:30'),
(449, 'App\\Models\\Student', 160, '01286666445', 'b7c5288ff4b6595e8a023cad080077e5be25db9bbdab989c11b54e89434988e5', '[\"student\"]', '2024-09-20 21:57:01', NULL, '2024-09-20 21:56:41', '2024-09-20 21:57:01'),
(450, 'App\\Models\\Student', 68, '01205183617', '4ba309612914c16901135b64bb594a80da1a15400f4d6e8d06847e6dc42eecf3', '[\"student\"]', '2024-09-25 16:48:06', NULL, '2024-09-20 23:37:00', '2024-09-25 16:48:06'),
(451, 'App\\Models\\Student', 130, '01090466844', '8bc5bbe12bad3ec084f815d9baa3677eb05c6b4511cb7b2cb74c1c209a5c3a7f', '[\"student\"]', '2024-09-20 23:42:46', NULL, '2024-09-20 23:42:23', '2024-09-20 23:42:46'),
(452, 'App\\Models\\Student', 163, 'API TOKEN', '75acfcd98e42b1096dc8de27bf2a8625347d22bc4118e1211f43a5bcd6ca4cf4', '[\"*\"]', NULL, NULL, '2024-09-20 23:50:14', '2024-09-20 23:50:14'),
(453, 'App\\Models\\Student', 164, 'API TOKEN', '7665ba5f80da42991486b2e2e0bf4eb67cea6d9d33b474dbbe026e94051268d6', '[\"*\"]', NULL, NULL, '2024-09-20 23:54:44', '2024-09-20 23:54:44'),
(454, 'App\\Models\\Student', 62, '01009394733', 'dad3232f20a8caa4d698e7757dbed8ab016699530924c9f1bbf62c7663ffa093', '[\"student\"]', '2024-09-21 01:05:48', NULL, '2024-09-21 01:04:34', '2024-09-21 01:05:48'),
(455, 'App\\Models\\Student', 165, 'API TOKEN', '08b2263e8b73061674963bc65651e04ffd4ff09468ce67442708d4f6fac74a36', '[\"*\"]', NULL, NULL, '2024-09-21 01:25:04', '2024-09-21 01:25:04'),
(456, 'App\\Models\\Student', 80, '01142312226', '5c848f21d31766a8c8d93dde1a8232437ac1cd5ca7f546099897d37b4d323bff', '[\"student\"]', '2024-09-21 02:12:22', NULL, '2024-09-21 02:11:05', '2024-09-21 02:12:22'),
(457, 'App\\Models\\Student', 166, 'API TOKEN', 'b4ab99332f992fe12137920e62721bf25c8069753b7b07744b013607a3240848', '[\"*\"]', NULL, NULL, '2024-09-21 02:14:21', '2024-09-21 02:14:21'),
(458, 'App\\Models\\Student', 167, 'API TOKEN', '70a53a71276fea18f85050e4ef8832cf4af9eddbc47dc1bb3ccba6b6f3b8061b', '[\"*\"]', NULL, NULL, '2024-09-21 02:17:55', '2024-09-21 02:17:55'),
(459, 'App\\Models\\Student', 168, 'API TOKEN', '79c3599aeec745f4cc97de7e8615ff52449180271075f2e02a86cf38073ba867', '[\"*\"]', NULL, NULL, '2024-09-21 02:19:33', '2024-09-21 02:19:33'),
(460, 'App\\Models\\Student', 169, 'API TOKEN', '14962b1e5849bb01763e5a7659163037a923cfd4261807f41f836e9c01d4af95', '[\"*\"]', NULL, NULL, '2024-09-21 02:20:09', '2024-09-21 02:20:09'),
(461, 'App\\Models\\Student', 170, 'API TOKEN', '2e6e2c0ee1d51115b3a29e9d09860f79c510242fee142a014ada3cde59c0313f', '[\"*\"]', NULL, NULL, '2024-09-21 02:22:07', '2024-09-21 02:22:07'),
(462, 'App\\Models\\Student', 171, 'API TOKEN', 'a6fa294011b8a0835bedd4442270140568cd06b2312f576e873e06ceccb456f1', '[\"*\"]', NULL, NULL, '2024-09-21 02:22:39', '2024-09-21 02:22:39'),
(463, 'App\\Models\\Student', 172, 'API TOKEN', 'b661e76d4873f65760dcaa31abd23b9a85f0df85eea516ce415dd8282321d7ab', '[\"*\"]', NULL, NULL, '2024-09-21 02:25:17', '2024-09-21 02:25:17'),
(464, 'App\\Models\\Student', 173, 'API TOKEN', '35d91fa7bc2850b0fb14ac389759a0d7b1ebea6943da2894a2a8570880b4fa35', '[\"*\"]', NULL, NULL, '2024-09-21 02:26:06', '2024-09-21 02:26:06'),
(465, 'App\\Models\\Student', 174, 'API TOKEN', '9f854c9e3a358b70997c14d602c7a404a6dc955791b68d498e438515f42dc8bb', '[\"*\"]', NULL, NULL, '2024-09-21 02:27:39', '2024-09-21 02:27:39'),
(466, 'App\\Models\\Student', 175, 'API TOKEN', '17222e2cca2e7be5fde229e185746d3dffc71b213dc2c9bb41618ad5bdd41dac', '[\"*\"]', NULL, NULL, '2024-09-21 02:29:07', '2024-09-21 02:29:07'),
(467, 'App\\Models\\Student', 176, 'API TOKEN', '6a2f74d1cff4b39ea01ed4b91743f393da9af9f6ff2891cb72fcbbeba8982e95', '[\"*\"]', NULL, NULL, '2024-09-21 02:31:14', '2024-09-21 02:31:14'),
(468, 'App\\Models\\Student', 177, 'API TOKEN', '5d34b5603801cfbcd805f6801ac2ae9092ee83ad7cc1270c5a624cb534e0b8f8', '[\"*\"]', NULL, NULL, '2024-09-21 02:32:17', '2024-09-21 02:32:17'),
(469, 'App\\Models\\Student', 178, 'API TOKEN', 'df1b98fecbf19fa27daf9b37dac6a858c98593566c07bd97dc8f54396b9583dd', '[\"*\"]', NULL, NULL, '2024-09-21 02:35:59', '2024-09-21 02:35:59'),
(470, 'App\\Models\\Student', 179, 'API TOKEN', 'aecff58b525f83d9f3407ed5cd0f2aa88ae77e8b98addd918af786392f8a008c', '[\"*\"]', NULL, NULL, '2024-09-21 02:59:45', '2024-09-21 02:59:45'),
(471, 'App\\Models\\Student', 180, 'API TOKEN', '17c78a391607b3ded7283b30ac4a12b5377d5eef40ca003d514c7b7e1f54c4bb', '[\"*\"]', NULL, NULL, '2024-09-21 03:00:13', '2024-09-21 03:00:13'),
(472, 'App\\Models\\Student', 162, '01279418076', 'd404f6d08b596c086da9acf882b64305bae09e5153477601d05df5bec9e61113', '[\"student\"]', '2024-09-23 12:38:04', NULL, '2024-09-21 03:00:25', '2024-09-23 12:38:04'),
(473, 'App\\Models\\Student', 181, 'API TOKEN', '5dd07d7e36793eecfb54b3c7320fdb27e7c38fb672b002a3daf01fb9299ffd0e', '[\"*\"]', NULL, NULL, '2024-09-21 03:04:37', '2024-09-21 03:04:37'),
(474, 'App\\Models\\Student', 182, 'API TOKEN', 'c1432651d257e9a9207e52545108b67b5a41e096e6730ea16daebd73e35b18e1', '[\"*\"]', NULL, NULL, '2024-09-21 03:09:01', '2024-09-21 03:09:01'),
(475, 'App\\Models\\Student', 183, 'API TOKEN', '06710f87eaa8b02e0ff046a4bfafa0515a622d7b49bbf9b97e68171767c9d05e', '[\"*\"]', NULL, NULL, '2024-09-21 03:16:33', '2024-09-21 03:16:33'),
(476, 'App\\Models\\Student', 170, '01227223388', 'a85de44175bf6e69a08167f9c7a07c45462be3d53d309d61dfc507fd356fceaf', '[\"student\"]', '2024-09-22 20:23:55', NULL, '2024-09-21 03:24:01', '2024-09-22 20:23:55'),
(477, 'App\\Models\\Student', 167, '01070464299', '7a0e117973e761f372428912f2c58ae86df6f3faa65e5395613388b24a001641', '[\"student\"]', '2024-09-25 02:15:46', NULL, '2024-09-21 03:24:27', '2024-09-25 02:15:46'),
(478, 'App\\Models\\Student', 184, 'API TOKEN', '0a14d73e8ead9bb273432fee5d1495f1a62cf4ca97d05409160841d76158c211', '[\"*\"]', NULL, NULL, '2024-09-21 03:24:32', '2024-09-21 03:24:32'),
(479, 'App\\Models\\Student', 185, 'API TOKEN', '05c5dae2e2c26a6ee093d6c383a85fc017b7cd85de9f41075a6e75ec26647b98', '[\"*\"]', NULL, NULL, '2024-09-21 03:26:49', '2024-09-21 03:26:49'),
(480, 'App\\Models\\Student', 180, '01153753424', 'd66b1e4ed3c869d9f78630e2ec3c96a0812892d9eb944fe20916ee7087dc9837', '[\"student\"]', '2024-09-25 06:14:50', NULL, '2024-09-21 03:29:30', '2024-09-25 06:14:50'),
(481, 'App\\Models\\Student', 182, '01122853856', '7fac790e05bf40a09aa99331f1508ce8afd6b15140e4faed501648c97f2ada97', '[\"student\"]', '2024-09-21 03:30:26', NULL, '2024-09-21 03:30:25', '2024-09-21 03:30:26'),
(482, 'App\\Models\\Student', 186, 'API TOKEN', '0a02d3eb45fb58860f2b037245f60c9341b749320859291a0512efc5412e5378', '[\"*\"]', NULL, NULL, '2024-09-21 03:30:57', '2024-09-21 03:30:57'),
(483, 'App\\Models\\Student', 163, '01080066098', 'abe69e2f5b221444cc57f1a28c7b064a33e96f2d0c79647167507fb2e88bcdee', '[\"student\"]', '2024-09-21 03:31:36', NULL, '2024-09-21 03:31:02', '2024-09-21 03:31:36'),
(484, 'App\\Models\\Student', 187, 'API TOKEN', '25138d838a1fca2bd19d6fa7701c2e9c8f8488262416879293480470ee5dea25', '[\"*\"]', NULL, NULL, '2024-09-21 03:32:12', '2024-09-21 03:32:12'),
(485, 'App\\Models\\Student', 188, 'API TOKEN', '9eab79d0eed73c4aec61ee5823168ec90ae7522feff195a9e1ebaa4eedd185ec', '[\"*\"]', NULL, NULL, '2024-09-21 03:34:40', '2024-09-21 03:34:40'),
(486, 'App\\Models\\Student', 189, 'API TOKEN', 'a6dbd59ef26b29e4e0892315bd0bb5545991b5137a1e3e393a65365bd81b74df', '[\"*\"]', NULL, NULL, '2024-09-21 03:42:02', '2024-09-21 03:42:02'),
(487, 'App\\Models\\Student', 190, 'API TOKEN', '4ea372ce948c786fda10c21f51061be691de32dd64c9ed98e00a782802713831', '[\"*\"]', NULL, NULL, '2024-09-21 03:46:37', '2024-09-21 03:46:37'),
(488, 'App\\Models\\Student', 174, '01007148174', '09cbb125267db3e3d0b149fd7ecc6894f0177c1a0432801e12fd09d8c5a3c401', '[\"student\"]', '2024-09-21 03:50:40', NULL, '2024-09-21 03:50:39', '2024-09-21 03:50:40'),
(489, 'App\\Models\\Student', 174, '01007148174', 'd0796fbe75e876771ea2f45ed551b9de2734e3c54dbc155e45a62e36bab31a76', '[\"student\"]', '2024-09-21 03:52:57', NULL, '2024-09-21 03:51:21', '2024-09-21 03:52:57'),
(490, 'App\\Models\\Student', 174, '01007148174', '05f60dd31b651ffe781c51fd00bf31193b1db4f046d96046f136825a73e4e5e2', '[\"student\"]', '2024-09-21 03:54:02', NULL, '2024-09-21 03:53:29', '2024-09-21 03:54:02'),
(491, 'App\\Models\\Student', 191, 'API TOKEN', '30ee4645dcc93d7c3fd1d48f619a8eb56322c7bb3ce0abf8423be2b644d9ea38', '[\"*\"]', NULL, NULL, '2024-09-21 04:11:34', '2024-09-21 04:11:34'),
(492, 'App\\Models\\Student', 192, 'API TOKEN', '517f6034a9ace511eac08c35663300c35f6f15ff90a3271619dc8997eec87e8d', '[\"*\"]', NULL, NULL, '2024-09-21 04:35:57', '2024-09-21 04:35:57'),
(493, 'App\\Models\\Student', 174, '01007148174', '8042a1cbb671dd231296792297fa68db3df5cf0db66608d4872ae94fd4a6bd8a', '[\"student\"]', '2024-09-21 04:40:49', NULL, '2024-09-21 04:40:09', '2024-09-21 04:40:49'),
(494, 'App\\Models\\Admin', 1, 'ahmedsabry', '3c89aef7d13e586fe26d86e255031969c2dc788d281d481bb3160ab231b16133', '[\"admin\"]', '2024-09-21 06:00:05', NULL, '2024-09-21 05:17:25', '2024-09-21 06:00:05'),
(495, 'App\\Models\\Student', 193, 'API TOKEN', 'b0693fbf65bfe9b034dce467d014d45362024b7f8ca9d6d6d2414daaa93ff51f', '[\"*\"]', NULL, NULL, '2024-09-21 08:14:40', '2024-09-21 08:14:40'),
(496, 'App\\Models\\Student', 177, '01020194079', 'a797cbdfa7adaef44f548cea5967c5d15659073ab6f1c60274d3f7b7db7c1ab6', '[\"student\"]', '2024-09-25 15:36:05', NULL, '2024-09-21 09:43:24', '2024-09-25 15:36:05'),
(497, 'App\\Models\\Student', 194, 'API TOKEN', 'd9e7ab0c17c7c9071a4778de9b62cfba04f7d8da26a2a0f369da16c5e65dafe5', '[\"*\"]', NULL, NULL, '2024-09-21 09:44:37', '2024-09-21 09:44:37'),
(498, 'App\\Models\\Student', 52, '01027709097', 'e6266dc640f5f137c1ec1758c40a135889071ed7c8c3fe61a061acea07dc190f', '[\"student\"]', '2024-09-25 16:57:53', NULL, '2024-09-21 10:21:52', '2024-09-25 16:57:53'),
(499, 'App\\Models\\Student', 195, 'API TOKEN', 'ec225e16e9df6d4cab25505ee3e0b380c414b77fd2f4460116611a8774b17acf', '[\"*\"]', NULL, NULL, '2024-09-21 10:44:36', '2024-09-21 10:44:36'),
(500, 'App\\Models\\Student', 196, 'API TOKEN', 'a5fa183ef52087fca2795d981f01dfa1e937ceb0b843100edf6407caf40a1ca4', '[\"*\"]', NULL, NULL, '2024-09-21 10:51:03', '2024-09-21 10:51:03'),
(501, 'App\\Models\\Student', 164, '01008115968', '2edef8e9ee6cc31d670ae26af070d34dc6a08646bd5a031a6e699e93a8152fb0', '[\"student\"]', '2024-09-22 16:04:33', NULL, '2024-09-21 10:59:20', '2024-09-22 16:04:33'),
(502, 'App\\Models\\Student', 66, '01012722565', '66c7af708940c387dd502615592a21f92ea256ccdf9984aa7d6d5c2fbd179bcd', '[\"student\"]', '2024-09-24 20:47:10', NULL, '2024-09-21 11:06:35', '2024-09-24 20:47:10'),
(503, 'App\\Models\\Student', 197, 'API TOKEN', '91d10f89e74922d0108ee577397833cd4f8967ae01bc6477186d89b2fcc6e344', '[\"*\"]', NULL, NULL, '2024-09-21 11:29:18', '2024-09-21 11:29:18'),
(504, 'App\\Models\\Student', 172, '01279681845', 'd10e560548ef132333899420b00b22db3dcf8761df559b12a082e3c607b668a3', '[\"student\"]', '2024-09-23 15:45:41', NULL, '2024-09-21 11:40:40', '2024-09-23 15:45:41'),
(505, 'App\\Models\\Student', 188, '01008433182', 'b258681220d6de6da65c2ce24edc23f1872b2832e9fbc675fceaa53d5e5ee46a', '[\"student\"]', '2024-09-23 21:59:40', NULL, '2024-09-21 11:55:13', '2024-09-23 21:59:40');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(506, 'App\\Models\\Student', 198, 'API TOKEN', 'c2f3df6ce8707118a4ebaf54392d9cec03d6b4c4b46c4285fcd149e425d4e3fc', '[\"*\"]', NULL, NULL, '2024-09-21 12:04:31', '2024-09-21 12:04:31'),
(507, 'App\\Models\\Student', 162, '01279418076', '20e3e48654bf9c0abfb29d2940521a7ae189141aeb5df59eb44b92934d3f4bb5', '[\"student\"]', '2024-09-21 14:07:34', NULL, '2024-09-21 12:09:27', '2024-09-21 14:07:34'),
(508, 'App\\Models\\Student', 199, 'API TOKEN', 'e998a766c233bb8ea92f480982ca0948a5d6c57bbbd93827ad417c1a5f51f5e6', '[\"*\"]', NULL, NULL, '2024-09-21 12:11:26', '2024-09-21 12:11:26'),
(509, 'App\\Models\\Student', 168, '01068719655', 'be50aebb78836af4af6206b01197047a4ea392a641026d87055be0da1909a568', '[\"student\"]', '2024-09-25 22:19:01', NULL, '2024-09-21 12:20:52', '2024-09-25 22:19:01'),
(510, 'App\\Models\\Student', 200, 'API TOKEN', '873551006cb86854c40f55e0bdf02b2ff2401b3b11e3d612638041fb3d6d80c7', '[\"*\"]', NULL, NULL, '2024-09-21 12:51:00', '2024-09-21 12:51:00'),
(511, 'App\\Models\\Student', 201, 'API TOKEN', '9098cb30eaf110bd45d1fdd1eaa6322b46b79d7da8ffcbca77c0132714e5b687', '[\"*\"]', NULL, NULL, '2024-09-21 13:16:13', '2024-09-21 13:16:13'),
(512, 'App\\Models\\Student', 153, '01066188542', 'd1968fcdb12c701d4e3688726eda0d1278f5f134456318cfd35cc8c9c19401d1', '[\"student\"]', '2024-09-23 00:16:22', NULL, '2024-09-21 13:32:05', '2024-09-23 00:16:22'),
(513, 'App\\Models\\Student', 171, '01110124347', '4201a3a82017749cfe18cb2bcd18f92ecaa106dacce63109fd687f9c8ccc37fb', '[\"student\"]', '2024-09-21 13:45:12', NULL, '2024-09-21 13:39:52', '2024-09-21 13:45:12'),
(514, 'App\\Models\\Student', 194, '01024086706', 'f62f048819713df25bbb6ac9d8d5890a27ca5d773706050a6391dd5af1280a94', '[\"student\"]', '2024-09-21 13:53:20', NULL, '2024-09-21 13:50:34', '2024-09-21 13:53:20'),
(515, 'App\\Models\\Student', 202, 'API TOKEN', '214dc4283aac7fb70a454f3a628514689ce1bc4c20c49df27859a2a9510e32c8', '[\"*\"]', NULL, NULL, '2024-09-21 14:13:30', '2024-09-21 14:13:30'),
(516, 'App\\Models\\Student', 203, 'API TOKEN', 'f632cc32ba8a6dba3d5a73ce6f2cd3202077b7dab683729eb917c1e19f731ab3', '[\"*\"]', NULL, NULL, '2024-09-21 14:34:30', '2024-09-21 14:34:30'),
(517, 'App\\Models\\Student', 176, '01021105031', 'bc70c90bb0e9c6a89b57412bec53adbb566e6afb2c135167ed5451cb41a1577e', '[\"student\"]', '2024-09-23 07:00:04', NULL, '2024-09-21 14:44:29', '2024-09-23 07:00:04'),
(518, 'App\\Models\\Student', 162, '01279418076', 'bb81b11c87274f05b9c96dd260b2aafedeb28fb5a1277dd7248b677028ac597e', '[\"student\"]', '2024-09-21 15:10:15', NULL, '2024-09-21 15:08:48', '2024-09-21 15:10:15'),
(519, 'App\\Models\\Student', 202, '01221816177', '76cece60ae652a4be74ef108df585fd0285c0f599e5edcf55f600cd84e2b4eb1', '[\"student\"]', '2024-09-23 16:47:23', NULL, '2024-09-21 15:16:28', '2024-09-23 16:47:23'),
(520, 'App\\Models\\Student', 202, '01221816177', '7eed8390c7447ee9ecdd352ae5e38458bd6019ecb7a8e67fb79e4880529a55dd', '[\"student\"]', '2024-09-25 18:31:02', NULL, '2024-09-21 15:17:26', '2024-09-25 18:31:02'),
(521, 'App\\Models\\Student', 204, 'API TOKEN', 'b28de59b3dd3dfa7f11b5b0611170c9e06ae38f59b59250a4e1dbbf62f77fdde', '[\"*\"]', NULL, NULL, '2024-09-21 15:33:36', '2024-09-21 15:33:36'),
(522, 'App\\Models\\Student', 205, 'API TOKEN', 'a708d6627122ccabd40116765ff7b956fb8edabd6ec5428f222da26122fd2f9e', '[\"*\"]', NULL, NULL, '2024-09-21 15:46:27', '2024-09-21 15:46:27'),
(523, 'App\\Models\\Student', 206, 'API TOKEN', '703595296ebad9e5a5d7854c00d1bacfa5a2d831626adcf0c26c3dc25aabafd1', '[\"*\"]', NULL, NULL, '2024-09-21 16:30:24', '2024-09-21 16:30:24'),
(524, 'App\\Models\\Student', 197, '01030731073', '8c7f561e85fdda26d752dc1816c0bcfa51b8ccdfcbf71edbd2b95df679fba6d2', '[\"student\"]', '2024-09-22 19:38:55', NULL, '2024-09-21 16:38:52', '2024-09-22 19:38:55'),
(525, 'App\\Models\\Student', 201, '01555599013', '2d8f88abd8311b7103b8faa57eb242ed3a225dd3f20db1555c2284e2a6c3db67', '[\"student\"]', '2024-09-25 17:02:05', NULL, '2024-09-21 16:43:34', '2024-09-25 17:02:05'),
(526, 'App\\Models\\Student', 207, 'API TOKEN', '5a284f65ca6cecede1cdff762f1c1fa5acf5f88ae630f8a5939fece59edef6a9', '[\"*\"]', NULL, NULL, '2024-09-21 17:16:07', '2024-09-21 17:16:07'),
(527, 'App\\Models\\Student', 84, '01063307508', '199027d0df7f008cfe15a3c890fa9299605b81c7a1614524deff67caed7ca454', '[\"student\"]', '2024-09-21 17:23:14', NULL, '2024-09-21 17:17:33', '2024-09-21 17:23:14'),
(528, 'App\\Models\\Student', 80, '01142312226', 'd7e5b299dcfd7440d8c7969a3fe6426ca35539d6fa8c47a2b6faec75b9be74f1', '[\"student\"]', '2024-09-25 20:56:49', NULL, '2024-09-21 17:18:05', '2024-09-25 20:56:49'),
(529, 'App\\Models\\Student', 165, '01201909028', '8fade33a5b3dc8d7167a83b0f54012a8d2ffce563a9c3443e018504fd282ba4b', '[\"student\"]', '2024-09-21 17:32:49', NULL, '2024-09-21 17:30:42', '2024-09-21 17:32:49'),
(530, 'App\\Models\\Student', 157, '01097375381', '6310f19a4b39dfb2f61d870b370007f036f49419db9af1ff4039547ab15e27e5', '[\"student\"]', '2024-09-24 15:49:20', NULL, '2024-09-21 17:53:22', '2024-09-24 15:49:20'),
(531, 'App\\Models\\Student', 126, '01111797951', '032a77711c2229e9b93e6fc4d73a5322fadae525b30cf799b315f88ea9b6a8e1', '[\"student\"]', '2024-09-22 18:58:40', NULL, '2024-09-21 18:14:50', '2024-09-22 18:58:40'),
(532, 'App\\Models\\Student', 208, 'API TOKEN', '258d5c6940da2f5b673ea7d8f4ab5d067eef8b2a2998612400e23a03f73e2d84', '[\"*\"]', NULL, NULL, '2024-09-21 18:18:25', '2024-09-21 18:18:25'),
(533, 'App\\Models\\Student', 209, 'API TOKEN', 'd39bc28af101e059cc37e610ea29ab923cf46253a20f21d1a441e40b93e4a0bd', '[\"*\"]', NULL, NULL, '2024-09-21 18:22:37', '2024-09-21 18:22:37'),
(534, 'App\\Models\\Student', 210, 'API TOKEN', 'bcebd356bd3ee1f758e899fc9ef2deb56f1b4b4f553ae5a5afd3e8e550ec93fe', '[\"*\"]', NULL, NULL, '2024-09-21 18:25:51', '2024-09-21 18:25:51'),
(535, 'App\\Models\\Student', 211, 'API TOKEN', '49cc16458b7bdfe9c4cee6c2e245644b3b2fb68df4d50b08ff6965ff02d9eb25', '[\"*\"]', NULL, NULL, '2024-09-21 18:29:26', '2024-09-21 18:29:26'),
(536, 'App\\Models\\Student', 205, '01065652012', '2d2b405f09426392d9dfb89b00d55123842e789b29ceda4eaae09ab88198c556', '[\"student\"]', '2024-09-21 19:42:14', NULL, '2024-09-21 18:30:53', '2024-09-21 19:42:14'),
(537, 'App\\Models\\Student', 131, '01118774181', 'f3d2ea378c99e5c43e16dee1d73abc33d3bc12a1edaae26e05e456088ee7fc3f', '[\"student\"]', '2024-09-24 21:54:23', NULL, '2024-09-21 18:32:49', '2024-09-24 21:54:23'),
(538, 'App\\Models\\Student', 211, '01001115337', '5bedb96d2d69b6ae9283f855c7280fe9d1f3461d6229681f2114ef3003222931', '[\"student\"]', '2024-09-25 14:57:52', NULL, '2024-09-21 18:37:24', '2024-09-25 14:57:52'),
(539, 'App\\Models\\Student', 208, '01030054380', '211ec7f5262c38fdbdb57b100036982ee57316dbb6ff884d9d36db15703348a3', '[\"student\"]', '2024-09-21 18:40:05', NULL, '2024-09-21 18:37:39', '2024-09-21 18:40:05'),
(540, 'App\\Models\\Student', 198, '01068773426', '3283d386c21f5d714a46c77db83b9329edcce05b56d779ec0ddfccf604f16d56', '[\"student\"]', '2024-09-26 07:02:43', NULL, '2024-09-21 18:37:52', '2024-09-26 07:02:43'),
(541, 'App\\Models\\Student', 64, '01064130508', '96779510a9b79d717a95119e8bd98fd7c43ad9c916fb0a72f2946bad42e84736', '[\"student\"]', '2024-09-24 19:33:33', NULL, '2024-09-21 19:09:14', '2024-09-24 19:33:33'),
(542, 'App\\Models\\Student', 199, '01282493211', '8096f5c9e2c90c3a652fcb5a9a53b4eeacd2e7bdf982a80da10a7a0f83402f57', '[\"student\"]', '2024-09-21 19:13:51', NULL, '2024-09-21 19:13:36', '2024-09-21 19:13:51'),
(543, 'App\\Models\\Student', 186, '01126077836', '2c9c5531e974ee282b862b374d61b38ba4d43c4518e03b6cdd34844c78da280e', '[\"student\"]', '2024-09-22 22:37:19', NULL, '2024-09-21 19:36:26', '2024-09-22 22:37:19'),
(544, 'App\\Models\\Student', 166, '01110098884', '13df6241f42e4127610e543e3aa5f30f166bae48240782019536b9a3bd510028', '[\"student\"]', '2024-09-22 03:50:05', NULL, '2024-09-21 20:06:43', '2024-09-22 03:50:05'),
(545, 'App\\Models\\Student', 184, '01023711747', '596de910d32360c9b055f38bfda0de8ccababda5780034bb67d534ad48f56e2b', '[\"student\"]', '2024-09-22 11:24:25', NULL, '2024-09-21 20:08:16', '2024-09-22 11:24:25'),
(546, 'App\\Models\\Student', 212, 'API TOKEN', '26386492ccb0f3bf16a635882754d1d7ab1e409a8269b0d6c783405ac03c071c', '[\"*\"]', NULL, NULL, '2024-09-21 20:25:05', '2024-09-21 20:25:05'),
(547, 'App\\Models\\Student', 209, '01098707665', '71f05a8d8cb5e6290dca730edfcbc578f4fc6134296de5e485513abb6d707e94', '[\"student\"]', '2024-09-23 22:59:11', NULL, '2024-09-21 20:28:17', '2024-09-23 22:59:11'),
(548, 'App\\Models\\Student', 209, '01098707665', '6fa05c67de7f5b9845a1bc268b481c218daed7f50714cd496cd3403c9aa47905', '[\"student\"]', '2024-09-21 20:29:50', NULL, '2024-09-21 20:29:49', '2024-09-21 20:29:50'),
(549, 'App\\Models\\Student', 213, 'API TOKEN', '5ae227efc7c089cf943039e063c5b32992dac7700cfea7865635fca1632f188b', '[\"*\"]', NULL, NULL, '2024-09-21 20:33:47', '2024-09-21 20:33:47'),
(550, 'App\\Models\\Student', 214, 'API TOKEN', '6a9e8279959c4a6c40661d3bd11682acac2689ea4d5b17468b3d0858a19d7387', '[\"*\"]', NULL, NULL, '2024-09-21 21:01:16', '2024-09-21 21:01:16'),
(551, 'App\\Models\\Student', 215, 'API TOKEN', '57731a96629dc4374ac576fcb58e63fb8eee52842033329fc1645310ea9df9a0', '[\"*\"]', NULL, NULL, '2024-09-21 21:01:46', '2024-09-21 21:01:46'),
(552, 'App\\Models\\Student', 191, '01032560568', '95eb86a44b14fd8a98d392dbedc0b3b6140059a9242fd680978d9907a332a745', '[\"student\"]', '2024-09-25 13:26:41', NULL, '2024-09-21 21:12:15', '2024-09-25 13:26:41'),
(553, 'App\\Models\\Student', 181, '01007954848', 'cd6101e3efe6abd95dea20d696fb7bb8a469e79a9924496cbc7133fc01da98ce', '[\"student\"]', '2024-09-21 21:21:07', NULL, '2024-09-21 21:20:26', '2024-09-21 21:21:07'),
(554, 'App\\Models\\Student', 216, 'API TOKEN', 'a2b47b8a3f22737bf1ffd4e39f5edbd4e5e9690c5cee83839cff8265365eaf23', '[\"*\"]', NULL, NULL, '2024-09-21 21:50:20', '2024-09-21 21:50:20'),
(555, 'App\\Models\\Student', 174, '01007148174', 'a3cefb8880e8eda43ea9849508fae7bf51e4c3863a955a4ab6f837639e659d58', '[\"student\"]', '2024-09-21 21:55:51', NULL, '2024-09-21 21:55:03', '2024-09-21 21:55:51'),
(556, 'App\\Models\\Student', 217, 'API TOKEN', 'f9f0fd3389ab0cdb675c7cb200126ce29b81b0ee010eedca35f4625dd1857463', '[\"*\"]', NULL, NULL, '2024-09-21 22:20:54', '2024-09-21 22:20:54'),
(557, 'App\\Models\\Student', 218, 'API TOKEN', 'a32e9c7781a2a8d87d505b0c202fd6877d3e0f70a689c850d2a8da5c522fdf47', '[\"*\"]', NULL, NULL, '2024-09-21 22:28:00', '2024-09-21 22:28:00'),
(558, 'App\\Models\\Student', 219, 'API TOKEN', 'b436b34b2398aa9d4c52ef35d917dc5b7498fcfbe7a77b619b90d11878dd57cd', '[\"*\"]', NULL, NULL, '2024-09-21 22:31:16', '2024-09-21 22:31:16'),
(559, 'App\\Models\\Student', 220, 'API TOKEN', '1293f94d658c2d0ca90cf8683704acbd9dbc83b78bdcef84ea35b67e889c9425', '[\"*\"]', NULL, NULL, '2024-09-21 22:52:47', '2024-09-21 22:52:47'),
(560, 'App\\Models\\Student', 221, 'API TOKEN', '7dcfb93d090a72f289d645d99dc7d25901dc41037bbcfb8d969d41ce6db28a22', '[\"*\"]', NULL, NULL, '2024-09-21 23:02:37', '2024-09-21 23:02:37'),
(561, 'App\\Models\\Student', 222, 'API TOKEN', 'a4994ab8ad0c571b2ce6b3d4fd9b722e40e61ade638b7259c1392b1283af0a16', '[\"*\"]', NULL, NULL, '2024-09-21 23:07:59', '2024-09-21 23:07:59'),
(562, 'App\\Models\\Student', 223, 'API TOKEN', 'd4c7bc8493841fcbe412bad48b9551cb2490e64d52d0f3470830c86dde817b7d', '[\"*\"]', NULL, NULL, '2024-09-21 23:35:10', '2024-09-21 23:35:10'),
(563, 'App\\Models\\Student', 222, '01274070879', 'c22a7bfd5b3992fec2b3fbe3448a6f3d8c9f028a79226fb9e8e1be89a9180423', '[\"student\"]', '2024-09-23 21:29:11', NULL, '2024-09-21 23:45:25', '2024-09-23 21:29:11'),
(564, 'App\\Models\\Student', 216, '01032719802', '18db6eca1303b3104de08178b8fbcf9a387b15777f8018159c6433b3168db978', '[\"student\"]', '2024-09-24 21:59:56', NULL, '2024-09-21 23:48:58', '2024-09-24 21:59:56'),
(565, 'App\\Models\\Student', 219, '01092686917', '88a28ca4a47b6c852728a2be20fb9cfca8c4a5728a48b3bf86635322342e2cc7', '[\"student\"]', '2024-09-25 22:54:14', NULL, '2024-09-21 23:50:54', '2024-09-25 22:54:14'),
(566, 'App\\Models\\Student', 224, 'API TOKEN', '5dfc3f6147b02c5487778a0b001b08a6648748e4bf2fbe44595b9520cb13d39d', '[\"*\"]', NULL, NULL, '2024-09-21 23:57:11', '2024-09-21 23:57:11'),
(567, 'App\\Models\\Student', 218, '01024497978', 'd07a22c4f02e9f7783cc8ea2d8542d51c9cb3af0717a87bb0d8cf0c5ff868c25', '[\"student\"]', '2024-09-22 00:01:31', NULL, '2024-09-21 23:57:49', '2024-09-22 00:01:31'),
(568, 'App\\Models\\Student', 225, 'API TOKEN', 'aee35c2c1be6d5001f0cf9272ebbce674fadc47e8cdc419854eef08bac7cd9b5', '[\"*\"]', NULL, NULL, '2024-09-22 00:11:56', '2024-09-22 00:11:56'),
(569, 'App\\Models\\Student', 215, '01029447920', '45dd31f926b977b8cd756e00aa5f212ad690edaa9832c4d348281d259dd40c4e', '[\"student\"]', '2024-09-22 00:28:11', NULL, '2024-09-22 00:27:07', '2024-09-22 00:28:11'),
(570, 'App\\Models\\Student', 215, '01029447920', 'b5b5e11d60b32003ea087646ddae5268d87301fb65968ede4be736ecd51881d2', '[\"student\"]', '2024-09-22 00:30:09', NULL, '2024-09-22 00:29:01', '2024-09-22 00:30:09'),
(571, 'App\\Models\\Student', 220, '01097823193', '8c631097e77d1006d8e7fe2b7b68140cc547002d41324377cf81b59218776d79', '[\"student\"]', '2024-09-22 00:42:06', NULL, '2024-09-22 00:40:43', '2024-09-22 00:42:06'),
(572, 'App\\Models\\Student', 212, '01147999330', 'c072c1db0151123940f5b0f7480536016d97904391e31bfb2b04493b24ec1144', '[\"student\"]', '2024-09-24 13:07:55', NULL, '2024-09-22 01:09:19', '2024-09-24 13:07:55'),
(573, 'App\\Models\\Admin', 1, 'ahmedsabry', '67731f1720f45d8f58614ac1eaf14a90774d57b36b1f6d283c1d8ae2cab45e6e', '[\"admin\"]', '2024-09-25 07:59:05', NULL, '2024-09-22 01:59:15', '2024-09-25 07:59:05'),
(574, 'App\\Models\\Student', 173, '01014439576', '14adc7f56e13617b464946ee5ef9cf0d8abae1d889a02140c46904250fba4c35', '[\"student\"]', '2024-09-22 02:00:35', NULL, '2024-09-22 01:59:46', '2024-09-22 02:00:35'),
(575, 'App\\Models\\Student', 173, '01014439576', 'c00565c68eb49c152d85f5c379a6db28283395004d3467f06cba68e6450521b8', '[\"student\"]', '2024-09-22 02:01:01', NULL, '2024-09-22 02:01:01', '2024-09-22 02:01:01'),
(576, 'App\\Models\\Student', 183, '01096974323', 'b14694bb7e6e75200957f9211063ab1664753d9e04bd2b32df787969cbecfff3', '[\"student\"]', '2024-09-22 02:01:40', NULL, '2024-09-22 02:01:23', '2024-09-22 02:01:40'),
(577, 'App\\Models\\Student', 173, '01014439576', '69dddf4617b8cd527f2f2e6d63ca02561431bc09d62d36bfc9b983ef822a8e84', '[\"student\"]', '2024-09-22 02:01:46', NULL, '2024-09-22 02:01:32', '2024-09-22 02:01:46'),
(578, 'App\\Models\\Student', 215, '01029447920', '6e321dfd96b14ac9978775bf6870f954e63328949bddaec04bfd35cd68dda658', '[\"student\"]', '2024-09-22 05:18:17', NULL, '2024-09-22 05:18:17', '2024-09-22 05:18:17'),
(579, 'App\\Models\\Student', 204, '01011425106', '261e5bb5cb9a1504b1ecdd2d3c9d814c6cf7107f76b93e9bf2512b17257d3922', '[\"student\"]', '2024-09-22 07:08:16', NULL, '2024-09-22 07:04:00', '2024-09-22 07:08:16'),
(580, 'App\\Models\\Student', 175, '01211264848', '585ed482f74f9534367576e9ac5424c127ce18fd7cd8437b94daf75e6c7ca3f0', '[\"student\"]', '2024-09-22 07:32:10', NULL, '2024-09-22 07:32:09', '2024-09-22 07:32:10'),
(581, 'App\\Models\\Student', 226, 'API TOKEN', '75a1f4c5faead9355aa76814cbcf0ef9635d9e67051c1241c59bceb7b7bb81ba', '[\"*\"]', NULL, NULL, '2024-09-22 08:27:13', '2024-09-22 08:27:13'),
(582, 'App\\Models\\Student', 34, '01017016045', 'e2284212ba37cda6cf7693cf04ca71b48f1ec393e3fa7b183495c9d5ed92e856', '[\"student\"]', '2024-09-22 19:50:33', NULL, '2024-09-22 13:00:06', '2024-09-22 19:50:33'),
(583, 'App\\Models\\Student', 26, '01019258797', '161301d5c06754be3486d8dd3927a167a6d2c3c8f8267380addf27453819d574', '[\"student\"]', '2024-09-24 12:46:57', NULL, '2024-09-22 13:02:48', '2024-09-24 12:46:57'),
(584, 'App\\Models\\Student', 227, 'API TOKEN', '41f579f31f163c78d53d377c08a369698007dcbb85ec156822755eb762dcc9be', '[\"*\"]', NULL, NULL, '2024-09-22 13:32:30', '2024-09-22 13:32:30'),
(585, 'App\\Models\\Student', 228, 'API TOKEN', '582be9b3983154fc1b84b26ec8515cd3693fbb2ed3f3000c4e2f34d200038b24', '[\"*\"]', NULL, NULL, '2024-09-22 13:33:45', '2024-09-22 13:33:45'),
(586, 'App\\Models\\Student', 229, 'API TOKEN', 'c4d87852c4bcc7f53cdc1bd817301213ee9f300e69b0f6a0c8bcd2de4c573bf8', '[\"*\"]', NULL, NULL, '2024-09-22 13:36:06', '2024-09-22 13:36:06'),
(587, 'App\\Models\\Student', 230, 'API TOKEN', 'b39311a376b8738fb4d9678a87fb87515656cc84ead16af7e397234c1685a93d', '[\"*\"]', NULL, NULL, '2024-09-22 13:37:30', '2024-09-22 13:37:30'),
(588, 'App\\Models\\Student', 44, '01122788772', '5d3748301e65753eaa48e90a2145f794a815f6e4eabef7fd1530de35288ddbbe', '[\"student\"]', '2024-09-25 18:48:49', NULL, '2024-09-22 14:24:43', '2024-09-25 18:48:49'),
(589, 'App\\Models\\Student', 55, '01229877388', '23db02f9b7a1a133e4f56bd91f2c9cbe2175b6c80bff84215e8e19231fc0c78a', '[\"student\"]', '2024-09-25 23:29:13', NULL, '2024-09-22 14:41:44', '2024-09-25 23:29:13'),
(590, 'App\\Models\\Student', 231, 'API TOKEN', '4eec3d098848523c7c3d60a3259494d29559f485d90f491337282f0fd70152a4', '[\"*\"]', NULL, NULL, '2024-09-22 14:50:07', '2024-09-22 14:50:07'),
(591, 'App\\Models\\Student', 215, '01029447920', 'f21c684beaaa315eadc16f026f259d41f2578dcf91b44bd7bc6b35eef9fb51c7', '[\"student\"]', '2024-09-22 15:50:32', NULL, '2024-09-22 15:49:56', '2024-09-22 15:50:32'),
(592, 'App\\Models\\Student', 232, 'API TOKEN', '22635c53c8f7a76f1db6a557856f4496504ee4d5b2025dc4a36584f41f737a1a', '[\"*\"]', NULL, NULL, '2024-09-22 17:51:20', '2024-09-22 17:51:20'),
(593, 'App\\Models\\Student', 93, '01095310921', 'd39c24242c5236e8df42ded85bb2b71d931db74419940c3123732a8a2ce0179c', '[\"student\"]', '2024-09-24 23:24:35', NULL, '2024-09-22 18:13:12', '2024-09-24 23:24:35'),
(594, 'App\\Models\\Student', 214, '01007715771', '18c7f40995b0bfdd74c8d72993c274e9873dc0ce66fc3393fbda523b35880758', '[\"student\"]', '2024-09-25 18:17:06', NULL, '2024-09-22 18:15:07', '2024-09-25 18:17:06'),
(595, 'App\\Models\\Student', 232, '01098921892', '5570a57de92d26e692054269df92d89034adc5a8cd402d8c5c13f0daf0aa92db', '[\"student\"]', '2024-09-22 21:49:29', NULL, '2024-09-22 18:36:59', '2024-09-22 21:49:29'),
(596, 'App\\Models\\Student', 79, '01032173104', '5dae2761275118afec3cdb06d7c87cb225a4f52774450122729203de2b32ba6b', '[\"student\"]', '2024-09-22 18:56:41', NULL, '2024-09-22 18:56:40', '2024-09-22 18:56:41'),
(597, 'App\\Models\\Student', 79, '01032173104', 'ff8fe29373f0a54310a06cf4d8d2d7232f6a9b1160e0029a52ff35c05a4ef914', '[\"student\"]', '2024-09-22 19:05:17', NULL, '2024-09-22 19:05:16', '2024-09-22 19:05:17'),
(598, 'App\\Models\\Student', 233, 'API TOKEN', 'c102cc79ed25c9f68447db117f500ff08eacdd4fe512f24dc1bb2866a9662325', '[\"*\"]', NULL, NULL, '2024-09-22 19:05:18', '2024-09-22 19:05:18'),
(599, 'App\\Models\\Student', 233, '01001004308', '1aff49ef5e8d725ee30c95e05dde415924a400b08fb1f44a49dde4c510ffc9c6', '[\"student\"]', '2024-09-22 20:50:04', NULL, '2024-09-22 19:05:51', '2024-09-22 20:50:04'),
(600, 'App\\Models\\Student', 67, '01098154974', 'b251c9d7d22f4ebdfecb401f212a065e58b2dc3d7afa5899161804a1be1a396d', '[\"student\"]', '2024-09-22 19:34:50', NULL, '2024-09-22 19:34:12', '2024-09-22 19:34:50'),
(601, 'App\\Models\\Student', 210, '01063839762', '218fcebdd477385dde082188e8f857cde28d31b612e64d8c1bc435bbd773dc2f', '[\"student\"]', '2024-09-22 23:44:22', NULL, '2024-09-22 19:36:23', '2024-09-22 23:44:22'),
(602, 'App\\Models\\Student', 181, '01007954848', 'b005469613d2e14b525795998aaeb8717f9fc7ef565ec7da203577000977122a', '[\"student\"]', '2024-09-22 19:47:24', NULL, '2024-09-22 19:45:53', '2024-09-22 19:47:24'),
(603, 'App\\Models\\Student', 231, '01117900550', '9323d3663e8fe9987ea800e6fc974637511469c851a3b6c68f7320971bbe08e1', '[\"student\"]', '2024-09-22 20:16:22', NULL, '2024-09-22 20:15:41', '2024-09-22 20:16:22'),
(604, 'App\\Models\\Student', 234, 'API TOKEN', '9c5c73c1daa2c1c6c7e6998aeee58617be6d83b06be60a162afb08a99b85e435', '[\"*\"]', NULL, NULL, '2024-09-22 20:16:27', '2024-09-22 20:16:27'),
(605, 'App\\Models\\Student', 215, '01029447920', '089b7bb44a3beb5b3d95ce0facc8350e2e9c9ab9abe7af7460d7b7aa4def41f3', '[\"student\"]', '2024-09-22 20:18:17', NULL, '2024-09-22 20:16:40', '2024-09-22 20:18:17'),
(606, 'App\\Models\\Student', 185, '01150062690', 'd6f9fdc20f176f691beb022022afb469d0cec869e70fe7223d8f96b6e893ad89', '[\"student\"]', '2024-09-22 21:40:37', NULL, '2024-09-22 20:16:44', '2024-09-22 21:40:37'),
(607, 'App\\Models\\Admin', 42, 'Christy', '2b69b8d1f82e94260e0af1ecdbf971500f78f5362438d12b97f6173bd990aca8', '[\"admin\"]', '2024-09-25 17:52:37', NULL, '2024-09-22 20:21:28', '2024-09-25 17:52:37'),
(608, 'App\\Models\\Student', 215, '01029447920', 'd21777f898c95ec66d3409b069821da7501f66fb0fb01b032938383499cd2952', '[\"student\"]', '2024-09-22 20:27:11', NULL, '2024-09-22 20:27:10', '2024-09-22 20:27:11'),
(609, 'App\\Models\\Student', 226, '01018430693', '9ea26c03951e428b6958b1fefeebd68cd6f45121105e4736521dbb1ada0eef02', '[\"student\"]', '2024-09-24 22:15:38', NULL, '2024-09-22 21:02:12', '2024-09-24 22:15:38'),
(610, 'App\\Models\\Student', 232, '01098921892', '122827e4cdee1ba568f2e996e00b8a7e5029ccbd2227c29317bf205d2d325bb4', '[\"student\"]', '2024-09-22 21:51:00', NULL, '2024-09-22 21:50:59', '2024-09-22 21:51:00'),
(611, 'App\\Models\\Student', 232, '01098921892', '8045259e15445b4c043abe9d745e04d3fbe46d228daaa062643076dc8526b26d', '[\"student\"]', '2024-09-25 20:06:58', NULL, '2024-09-22 21:51:43', '2024-09-25 20:06:58'),
(612, 'App\\Models\\Student', 232, '01098921892', 'cee8b920b3e4e6203be289685a267ada655c75327d79baf000bbde194e43d4ba', '[\"student\"]', '2024-09-26 02:45:42', NULL, '2024-09-22 21:56:12', '2024-09-26 02:45:42'),
(613, 'App\\Models\\Student', 40, '01277747053', '7d99bd53b31bc3a5f4cd94d07c372420bb5981ced26cc8314caaef00a74d5a00', '[\"student\"]', '2024-09-23 18:47:05', NULL, '2024-09-22 22:18:59', '2024-09-23 18:47:05'),
(614, 'App\\Models\\Student', 196, '01000804733', '6f8f541e128cef9e4921bdd98aa9498ec1fd42b8c785f4034bef1446cc9b81a3', '[\"student\"]', '2024-09-22 22:22:57', NULL, '2024-09-22 22:22:42', '2024-09-22 22:22:57'),
(615, 'App\\Models\\Student', 178, '01010727941', '58572d4a538b69282905a300d60178966c00080d5cbab748e4e97cd79a2a1187', '[\"student\"]', '2024-09-25 20:03:14', NULL, '2024-09-22 22:50:14', '2024-09-25 20:03:14'),
(616, 'App\\Models\\Student', 50, '01040823123', '6b507470f37931908beab6cd4e0105e698109421513e3bd1b4d2a0442c2d13f2', '[\"student\"]', '2024-09-23 00:52:31', NULL, '2024-09-22 23:03:37', '2024-09-23 00:52:31'),
(617, 'App\\Models\\Student', 195, '01205305614', '8f014980cb6d1566047dc11f0ce35cbe8c700a6dfd428dea5b384023e3b10b2d', '[\"student\"]', '2024-09-25 13:20:27', NULL, '2024-09-22 23:03:55', '2024-09-25 13:20:27'),
(618, 'App\\Models\\Admin', 1, 'ahmedsabry', '9ff6523f708d991b904baec67eeb78db5b6b53fcf5044abe6227884a8f9bbfa2', '[\"admin\"]', '2024-09-23 00:07:52', NULL, '2024-09-23 00:00:42', '2024-09-23 00:07:52'),
(619, 'App\\Models\\Student', 235, 'API TOKEN', '312cb558c4ccf5384264b42ad8f2f5b23c85c59b06f41a302a687ed8b1efeab6', '[\"*\"]', NULL, NULL, '2024-09-23 00:03:09', '2024-09-23 00:03:09'),
(620, 'App\\Models\\Student', 227, '01111212486', 'a3ddb4b2a0cf27ccbc747a906aff8f9598792e5f19a0977cdafd05d612df8312', '[\"student\"]', '2024-09-25 12:39:19', NULL, '2024-09-23 00:29:34', '2024-09-25 12:39:19'),
(621, 'App\\Models\\Student', 181, '01007954848', '3dcee3751de6d08d5bb5941e78d5c21f955882a13a5eed1c065926a9eb7c2f4b', '[\"student\"]', '2024-09-23 00:49:34', NULL, '2024-09-23 00:32:10', '2024-09-23 00:49:34'),
(622, 'App\\Models\\Student', 236, 'API TOKEN', 'dd5dab93e36186adc0602423c422f6d24c3cb9bb1bdcdbfb540867b6ab31909c', '[\"*\"]', NULL, NULL, '2024-09-23 01:02:06', '2024-09-23 01:02:06'),
(623, 'App\\Models\\Student', 152, '01228588169', '9634964120504a1ef301f01d4b969a5769d99f304a8f7f8e2c86799ff2e7836b', '[\"student\"]', '2024-09-23 01:19:10', NULL, '2024-09-23 01:12:01', '2024-09-23 01:19:10'),
(624, 'App\\Models\\Admin', 1, 'Ahmedsabry', 'cee9f4c81bf0853eb28d4109f4bd51ee863e8f5cb94e62bba71e2bc248506cbd', '[\"admin\"]', '2024-09-23 01:20:46', NULL, '2024-09-23 01:14:07', '2024-09-23 01:20:46'),
(625, 'App\\Models\\Student', 152, '01228588169', '2864495aa29e116e7ab19f7dc74339c9c6908f299e2c0436a3c14370bbb91822', '[\"student\"]', '2024-09-23 01:19:36', NULL, '2024-09-23 01:19:27', '2024-09-23 01:19:36'),
(626, 'App\\Models\\Student', 78, '01092089622', '1ddd068995ef5aeb7f60d83fea4d04b2e57160170777ce0d4a2fdac154ac480c', '[\"student\"]', '2024-09-25 19:12:15', NULL, '2024-09-23 02:28:22', '2024-09-25 19:12:15'),
(627, 'App\\Models\\Admin', 38, 'Nour', '646120257040c1b8ef0a2258baa52e0c291e709c7fb3838330008d6773d8b37b', '[\"admin\"]', '2024-09-26 01:56:09', NULL, '2024-09-23 03:01:23', '2024-09-26 01:56:09'),
(628, 'App\\Models\\Student', 237, 'API TOKEN', '1aed137403027f2a6ad6aea45405b3fa83efb18b4cdef6a323f439460b6a9411', '[\"*\"]', NULL, NULL, '2024-09-23 06:49:18', '2024-09-23 06:49:18'),
(629, 'App\\Models\\Student', 213, '01096789041', '0ee4cecfbd717e8ec8e07b390f56d8c1828d9d201620e3dcdbe9103efe529763', '[\"student\"]', '2024-09-23 07:23:00', NULL, '2024-09-23 07:21:51', '2024-09-23 07:23:00'),
(630, 'App\\Models\\Student', 72, '01020842396', '9f4c87e4e02db5b37f3a212e3555b9d479001f8dd8a9d5b142142dc4621774d1', '[\"student\"]', '2024-09-25 14:47:49', NULL, '2024-09-23 11:06:26', '2024-09-25 14:47:49'),
(631, 'App\\Models\\Student', 17, '01141094247', '139ea74f76e4af57d6f5f188eaef4a58f11ed97840421ef23951bbd0125aa908', '[\"student\"]', '2024-09-24 04:44:13', NULL, '2024-09-23 12:38:10', '2024-09-24 04:44:13'),
(632, 'App\\Models\\Student', 62, '01009394733', '0fee57bd007e86a9f55882df236d956dab6719f6141485a75849d0b3715ffc6a', '[\"student\"]', '2024-09-23 19:08:32', NULL, '2024-09-23 13:10:42', '2024-09-23 19:08:32'),
(633, 'App\\Models\\Student', 17, '01141094247', '8d1f4c138697d391d5ef6fb08e18ffcf4004af287111189c018492faf96a69f5', '[\"student\"]', '2024-09-23 13:26:16', NULL, '2024-09-23 13:23:26', '2024-09-23 13:26:16'),
(634, 'App\\Models\\Admin', 1, 'ahmedsabry', '36e3362ee6f3c4493b505c234de02540d41f7eda50e32c0fc018ae34d73b4c53', '[\"admin\"]', '2024-09-23 13:25:39', NULL, '2024-09-23 13:25:25', '2024-09-23 13:25:39'),
(635, 'App\\Models\\Student', 189, '01001511646', '072481039b9cc9cd123ad90cffa39b8d8e35fc8ec90a8905ccd7c0d88dfa5c69', '[\"student\"]', '2024-09-23 14:39:27', NULL, '2024-09-23 14:39:27', '2024-09-23 14:39:27'),
(636, 'App\\Models\\Student', 83, '01095666501', '0f14f0f6d5c2845962e595113a2e75fceb14ce6e89ef347b384a4eb053c295e9', '[\"student\"]', '2024-09-23 15:50:58', NULL, '2024-09-23 15:49:57', '2024-09-23 15:50:58'),
(637, 'App\\Models\\Student', 156, '01020555063', '6d868bf06e1a28189fbf70846e8c612b60372a2c82f1b594bf533f4a9f88fde7', '[\"student\"]', '2024-09-23 16:03:34', NULL, '2024-09-23 15:57:34', '2024-09-23 16:03:34'),
(638, 'App\\Models\\Student', 192, '01111147846', 'fb4089df5246824a044a73e3b6b35ac75deeabddfc6a753c7c3217445333bcb5', '[\"student\"]', '2024-09-23 16:01:24', NULL, '2024-09-23 16:01:10', '2024-09-23 16:01:24'),
(639, 'App\\Models\\Student', 229, '01033900374', 'be4162cccbc7d6c536276d0efc336ee0ad8c6153edee5fe906c1d6f2d2e0a52a', '[\"student\"]', '2024-09-26 04:57:28', NULL, '2024-09-23 17:23:52', '2024-09-26 04:57:28'),
(640, 'App\\Models\\Student', 238, 'API TOKEN', '9bf515ff1e34adf3f806d9102503fc30ba71df6af43ea55b93d676e8c1442b65', '[\"*\"]', NULL, NULL, '2024-09-23 17:54:37', '2024-09-23 17:54:37'),
(641, 'App\\Models\\Student', 233, '01001004308', '84b8979c5573d3bfb9fc58dfb9b950d73824923bf31c8282593f1fdc17ff43e8', '[\"student\"]', '2024-09-26 00:11:03', NULL, '2024-09-23 17:59:42', '2024-09-26 00:11:03'),
(642, 'App\\Models\\Student', 239, 'API TOKEN', '237c8f5118cee22cf6ee039a77f84ea25684b3c4f5d49bc9335b094f5c1d9d48', '[\"*\"]', NULL, NULL, '2024-09-23 18:15:52', '2024-09-23 18:15:52'),
(643, 'App\\Models\\Student', 114, '01033890548', '3460704bf6829b61b0d910d570efbbe21114e5b809c80a7821b4ef229426b4e7', '[\"student\"]', '2024-09-24 00:45:16', NULL, '2024-09-23 19:08:21', '2024-09-24 00:45:16'),
(644, 'App\\Models\\Student', 75, '01552409348', 'e9a7baa3ae88518b9dc1c64f3d764d963fcb2be9a63c94f4ed52e274ada82b64', '[\"student\"]', '2024-09-25 17:29:54', NULL, '2024-09-23 19:08:32', '2024-09-25 17:29:54'),
(645, 'App\\Models\\Student', 140, '01113944094', 'a39a0df870c8257fa0937e5bf6a4ba2df3d4b670a6fad51e195c4e517959fa16', '[\"student\"]', '2024-09-23 23:02:22', NULL, '2024-09-23 20:12:11', '2024-09-23 23:02:22'),
(646, 'App\\Models\\Student', 207, '01101223443', 'afd0bc9f75e0fbf2e1cd543189d9107ee5e38fbddf5492fb836264da2bb76add', '[\"student\"]', '2024-09-23 20:17:43', NULL, '2024-09-23 20:17:28', '2024-09-23 20:17:43'),
(647, 'App\\Models\\Student', 240, 'API TOKEN', 'd6ef7585a408a039fcdc55d169eda282bc58b48109c4b3b22e3621d091b5dd18', '[\"*\"]', NULL, NULL, '2024-09-23 20:48:39', '2024-09-23 20:48:39'),
(648, 'App\\Models\\Student', 241, 'API TOKEN', '5753c166342edb9ced628b98b2ca056bfffaed81a90722d2697e1545d0da2451', '[\"*\"]', NULL, NULL, '2024-09-23 20:53:34', '2024-09-23 20:53:34'),
(649, 'App\\Models\\Student', 206, '01111136036', 'd7ee868f19e759e03faa728091511c07cf044b3b0cc8d959d5d9a592b44a82c3', '[\"student\"]', '2024-09-25 18:52:42', NULL, '2024-09-23 22:49:52', '2024-09-25 18:52:42'),
(650, 'App\\Models\\Student', 240, '01556121557', '286106b5e5880bac088ff21c043259534d12d212a232b970dc125fb39036c78d', '[\"student\"]', '2024-09-25 00:30:03', NULL, '2024-09-23 22:56:36', '2024-09-25 00:30:03'),
(651, 'App\\Models\\Student', 239, '01274100636', '8dc876f67007745f35d9baf7d9027f5cd215fed1be05fae96f71fc9f5476077e', '[\"student\"]', '2024-09-25 18:13:49', NULL, '2024-09-23 23:04:46', '2024-09-25 18:13:49'),
(652, 'App\\Models\\Student', 23, '01283383411', '7c3aae65a10a25990f2bec1a76cc263aaf2367707060a13e29e0e5ea03a2e07e', '[\"student\"]', '2024-09-26 02:48:48', NULL, '2024-09-23 23:09:43', '2024-09-26 02:48:48'),
(653, 'App\\Models\\Student', 207, '01101223443', '4e19f6fa8dbdc7b1b24c9816361343d12548e4655d244ada56094e6e63562531', '[\"student\"]', '2024-09-23 23:26:30', NULL, '2024-09-23 23:26:28', '2024-09-23 23:26:30'),
(654, 'App\\Models\\Student', 113, '01283929037', '92d5e60c551d38ba383ccd4faa63a4315a43d3e10a7f787ceb6b47245b10484f', '[\"student\"]', '2024-09-23 23:42:18', NULL, '2024-09-23 23:41:07', '2024-09-23 23:42:18'),
(655, 'App\\Models\\Student', 86, '01019188321', 'ffd4d32221cc831dcd0b56713032701d88c3cb8096a05dde58399aeec4e8aeb2', '[\"student\"]', '2024-09-24 01:13:03', NULL, '2024-09-24 00:03:17', '2024-09-24 01:13:03'),
(656, 'App\\Models\\Student', 242, 'API TOKEN', '6bf89baf55f58e4cb0e54199d92a29b74e6aea1e2a59f1ab7947bbf59245184a', '[\"*\"]', NULL, NULL, '2024-09-24 00:09:25', '2024-09-24 00:09:25'),
(657, 'App\\Models\\Student', 132, '01113774495', '5098a67427af880156b3049b5f3418c254acc16bc70a467a49d2d6762fe456ca', '[\"student\"]', '2024-09-26 08:51:47', NULL, '2024-09-24 01:17:19', '2024-09-26 08:51:47'),
(658, 'App\\Models\\Student', 237, '01061616330', 'db1eab00caca18619f17ea4ac6b594627ce039436ac566ac6717dcb86568713c', '[\"student\"]', '2024-09-24 01:25:28', NULL, '2024-09-24 01:24:39', '2024-09-24 01:25:28'),
(659, 'App\\Models\\Student', 31, '01091014180', '5ac0ba1256f5f16cc192188cba073dbf192c2aa3bc26224cfc5bd51a59f7d369', '[\"student\"]', '2024-09-25 20:28:37', NULL, '2024-09-24 02:02:23', '2024-09-25 20:28:37'),
(660, 'App\\Models\\Student', 238, '01153949417', 'd2f1e9ca46bb61d3e8265d919da206278d86e2231ff000093b4d02894966f5e7', '[\"student\"]', '2024-09-24 02:46:39', NULL, '2024-09-24 02:46:00', '2024-09-24 02:46:39'),
(661, 'App\\Models\\Admin', 38, 'Nour', 'c989a351162e2213629868a806086a71ab6c3f35b638dc1fdcd7a2fe9255818a', '[\"admin\"]', '2024-09-24 04:57:46', NULL, '2024-09-24 04:02:56', '2024-09-24 04:57:46'),
(662, 'App\\Models\\Student', 35, '01501137044', '7c21e84d6d13b8ebba324097302460fd98f38eacce57135cfe8639ca4f21b3c4', '[\"student\"]', '2024-09-24 17:24:07', NULL, '2024-09-24 04:26:13', '2024-09-24 17:24:07'),
(663, 'App\\Models\\Student', 27, '01210954955', '197312396f4614ea2c18795b979a295b00302c67b8db6bd3a32d36a9fedc10e0', '[\"student\"]', '2024-09-25 00:20:00', NULL, '2024-09-24 04:27:09', '2024-09-25 00:20:00'),
(664, 'App\\Models\\Student', 29, '01226305424', 'f25287298945283b2ceb716f7d624caca36a29605e532390d2f85abbed08fac8', '[\"student\"]', '2024-09-25 03:30:35', NULL, '2024-09-24 04:30:42', '2024-09-25 03:30:35'),
(665, 'App\\Models\\Student', 243, 'API TOKEN', 'c99cd134f899c8c6b0b5d46f7683c736d2c12d953f05547648c34537ca5715e2', '[\"*\"]', NULL, NULL, '2024-09-24 06:03:56', '2024-09-24 06:03:56'),
(666, 'App\\Models\\Student', 26, '01019258797', '9d449de53fa7d0534edcd859658c10ce55ada34325a2855147160f4a9984b165', '[\"student\"]', '2024-09-24 08:53:32', NULL, '2024-09-24 08:36:15', '2024-09-24 08:53:32'),
(667, 'App\\Models\\Student', 121, '01144007855', 'b626e9b1614be955bade7325f75f5f3e000ff312194952a7d277f7f11a665c70', '[\"student\"]', '2024-09-25 19:39:51', NULL, '2024-09-24 09:25:59', '2024-09-25 19:39:51'),
(668, 'App\\Models\\Student', 244, 'API TOKEN', '2c1c6b9f1048d45c13b0e33caf26e5d980c7dcbf05edb11a681969a5ec1d0e74', '[\"*\"]', NULL, NULL, '2024-09-24 12:36:04', '2024-09-24 12:36:04'),
(669, 'App\\Models\\Admin', 40, 'Mariam-Osman', '30517b1b5574d65cd45246abd04ef330ad4c19c55e53bce4b2359a8ce1b84203', '[\"admin\"]', '2024-09-24 14:14:43', NULL, '2024-09-24 12:43:58', '2024-09-24 14:14:43'),
(670, 'App\\Models\\Student', 244, '01012523225', 'e85a6650d24f52c9055adf0bb6a132f47dac678d55e4bd517d841587049e7917', '[\"student\"]', '2024-09-24 13:03:35', NULL, '2024-09-24 12:45:24', '2024-09-24 13:03:35'),
(671, 'App\\Models\\Student', 244, '01012523225', '95b17792a84857d11b59b71af9d564191c138fd93ade4ac6df6d0e6d17391324', '[\"student\"]', '2024-09-24 12:46:12', NULL, '2024-09-24 12:45:57', '2024-09-24 12:46:12'),
(672, 'App\\Models\\Student', 245, 'API TOKEN', '6140b11c82e6f5e3eb1c9188a12d6d527da174201d590e3ccfe90bc26d24d21c', '[\"*\"]', NULL, NULL, '2024-09-24 14:21:11', '2024-09-24 14:21:11'),
(673, 'App\\Models\\Student', 89, '01206970361', '7879057325df0cf24a1dd8d34fcdb6618042d1ab06e55567fc112df66d569b38', '[\"student\"]', '2024-09-24 22:22:16', NULL, '2024-09-24 16:00:26', '2024-09-24 22:22:16'),
(674, 'App\\Models\\Student', 124, '01222702364', 'a3aa0b52b4689f89d7bbeec79297b1fdeee187e96bbd59f0707e08d50198e7c2', '[\"student\"]', '2024-09-24 16:39:26', NULL, '2024-09-24 16:38:18', '2024-09-24 16:39:26'),
(675, 'App\\Models\\Student', 62, '01009394733', '74f5bdd3b6e7dcdb71d56c439b69ffc0c60eb0a03461f2190a772cb328986a47', '[\"student\"]', '2024-09-24 20:24:13', NULL, '2024-09-24 16:53:25', '2024-09-24 20:24:13'),
(676, 'App\\Models\\Student', 72, '01020842396', 'a72b49433655ab22289eda64b92d8522ca021ef4667b554fa9561deeba605ba6', '[\"student\"]', '2024-09-26 08:13:17', NULL, '2024-09-24 17:33:18', '2024-09-26 08:13:17'),
(677, 'App\\Models\\Student', 171, '01110124347', '06ec45d9d83575d0267a4f5b310ef00b9fda928b3659b276468e9ab4f810c15e', '[\"student\"]', '2024-09-25 21:39:27', NULL, '2024-09-24 17:47:07', '2024-09-25 21:39:27'),
(678, 'App\\Models\\Admin', 1, 'AhmedSabry', 'cea3f0adad88cc1011550b94e9f2337495bde4b9455be1f06c150a9b7e6b6dbb', '[\"admin\"]', '2024-09-24 18:58:17', NULL, '2024-09-24 17:55:32', '2024-09-24 18:58:17'),
(679, 'App\\Models\\Student', 45, '01289373810', '83a6b2655bb3c1fe258396ccab2044e74e78524806c4799850d86d1e305e25e5', '[\"student\"]', '2024-09-25 00:50:41', NULL, '2024-09-24 18:03:38', '2024-09-25 00:50:41'),
(680, 'App\\Models\\Student', 228, '01010005847', '4817cd2b32f50073a82f8afad61968bb99ab2063b2ccd714b34048925f343d22', '[\"student\"]', '2024-09-25 14:19:06', NULL, '2024-09-24 18:19:02', '2024-09-25 14:19:06'),
(681, 'App\\Models\\Student', 125, '01092394227', '6f387690f85f55ae21e7e25d149f93186123ef80ada370456b76b502fd0b1c00', '[\"student\"]', '2024-09-25 20:49:03', NULL, '2024-09-24 18:20:37', '2024-09-25 20:49:03'),
(682, 'App\\Models\\Student', 238, '01153949417', 'f048e652e9c0b53ad1b86a67cf1ab0bfcf21234ab1052816a0ee002c543aa255', '[\"student\"]', '2024-09-24 22:49:56', NULL, '2024-09-24 19:06:26', '2024-09-24 22:49:56'),
(683, 'App\\Models\\Student', 241, '01143126266', '8385e05a4a14994d0af9fc59360fe17c1b9611e7df062bfdedb652be90f71eef', '[\"student\"]', '2024-09-25 19:30:04', NULL, '2024-09-24 19:35:23', '2024-09-25 19:30:04'),
(684, 'App\\Models\\Student', 53, '01017899581', '35dde585f6e43d12ef2aa08b08d8980fe9f3cc94c0670990a329a8785f7dd506', '[\"student\"]', '2024-09-25 15:18:02', NULL, '2024-09-24 19:37:30', '2024-09-25 15:18:02'),
(685, 'App\\Models\\Student', 53, '01017899581', '00152db38fde4a13be37ba2a20a19a91a8df3768ccd618e8d14c4cbc7b3966e7', '[\"student\"]', '2024-09-24 19:38:52', NULL, '2024-09-24 19:38:34', '2024-09-24 19:38:52'),
(686, 'App\\Models\\Student', 61, '01277029439', '465fca0f682a3edb7d4d9384034f4cd00dbff34d711f5c5f4b3a885503ea0ac9', '[\"student\"]', '2024-09-25 23:45:04', NULL, '2024-09-24 19:55:56', '2024-09-25 23:45:04'),
(687, 'App\\Models\\Admin', 40, 'Mariam-Osman', 'f22071b72bcf51b3d645e25e8470acf670bdc8ac1c2c22d11baf39a8ddf07154', '[\"admin\"]', '2024-09-26 00:37:33', NULL, '2024-09-24 20:22:46', '2024-09-26 00:37:33'),
(688, 'App\\Models\\Student', 62, '01009394733', '01daffa4c323422920fac8f87a6f9f8c301ad0512698b64ed46ceef8c783a3f1', '[\"student\"]', '2024-09-25 07:26:09', NULL, '2024-09-24 20:53:35', '2024-09-25 07:26:09'),
(689, 'App\\Models\\Student', 87, '01149961794', 'd39a063aa5b225a9062625b0023888f1f63ddf1423ae553246f8690df93d13b1', '[\"student\"]', '2024-09-25 15:16:28', NULL, '2024-09-24 21:08:24', '2024-09-25 15:16:28'),
(690, 'App\\Models\\Admin', 1, 'AhmedSabry', 'bd8b77fabf048cea9f75b5a102b74218efe3932fb064fc66d58907b5c13110a8', '[\"admin\"]', '2024-09-25 00:49:19', NULL, '2024-09-24 21:13:07', '2024-09-25 00:49:19'),
(691, 'App\\Models\\Student', 108, '01101102268', '4273b5531cf326d0161f93ea4db06d99c45354f1c235ecaca3e08823863a91a3', '[\"student\"]', '2024-09-25 16:38:54', NULL, '2024-09-24 21:23:40', '2024-09-25 16:38:54'),
(692, 'App\\Models\\Admin', 42, 'Christy', 'dd80990b4134fddd4ca8197b5fb3cfbf0f3c6af1f6d65c8d1f045bf5cafc15da', '[\"admin\"]', '2024-09-26 00:03:24', NULL, '2024-09-24 23:04:25', '2024-09-26 00:03:24'),
(693, 'App\\Models\\Student', 80, '01142312226', '24ffe6a3f9884ca5a4128ffbbc928849472d4cf0a58213ace7bf7a3f3254b1cd', '[\"student\"]', '2024-09-24 23:18:40', NULL, '2024-09-24 23:18:21', '2024-09-24 23:18:40'),
(694, 'App\\Models\\Student', 246, 'API TOKEN', '1efbbe3ab62a1f1fe86ea434e664e856ebec4eacd878e0812c7e43963380c34e', '[\"*\"]', NULL, NULL, '2024-09-25 00:25:51', '2024-09-25 00:25:51'),
(695, 'App\\Models\\Student', 107, '01153749749', 'c2fa7d5c27d2ca76dbbeb26da31d98a2e560328748c3b2ad195257bb94f940a0', '[\"student\"]', '2024-09-25 16:44:20', NULL, '2024-09-25 00:33:42', '2024-09-25 16:44:20'),
(696, 'App\\Models\\Student', 247, 'API TOKEN', 'c863ccba47c69ac700888515aacdecb13ec5415864a88ab6d7ae8c6f1d63f5d2', '[\"*\"]', NULL, NULL, '2024-09-25 00:35:31', '2024-09-25 00:35:31'),
(697, 'App\\Models\\Student', 248, 'API TOKEN', '9e046c329305fc7f6584bf462154f943b6dcbca2fc77fe932bad5f3e3316143b', '[\"*\"]', NULL, NULL, '2024-09-25 00:36:27', '2024-09-25 00:36:27'),
(698, 'App\\Models\\Student', 148, '01068869813', '62f94442b8c9380c7a43a7293309c5ff93fbffeeb27786532700299878710b28', '[\"student\"]', '2024-09-25 01:48:16', NULL, '2024-09-25 01:40:59', '2024-09-25 01:48:16'),
(699, 'App\\Models\\Student', 249, 'API TOKEN', '0ac05d5a803b0c0ed143243c9506d32e22184429ce351db6bbdb7ea7b580ca97', '[\"*\"]', NULL, NULL, '2024-09-25 10:00:45', '2024-09-25 10:00:45'),
(700, 'App\\Models\\Student', 250, 'API TOKEN', '7efd7694f6c0bd33cee616c9d18fb36e9e1dc5237a8e03864bf42ad19502cbbb', '[\"*\"]', NULL, NULL, '2024-09-25 12:04:58', '2024-09-25 12:04:58'),
(701, 'App\\Models\\Student', 142, '01281433419', '31bc1685df4186d7165b56004b1207f8bb05a8e23de25470e604d7394761f173', '[\"student\"]', '2024-09-25 12:20:11', NULL, '2024-09-25 12:19:52', '2024-09-25 12:20:11'),
(702, 'App\\Models\\Student', 227, '01111212486', '850a954ba12829a5769f00cd5dd6e3945b0b6c34c03f25f121e04134b6faa98a', '[\"student\"]', '2024-09-25 12:44:12', NULL, '2024-09-25 12:44:12', '2024-09-25 12:44:12'),
(703, 'App\\Models\\Student', 227, '01111212486', '72cc6c93f347d4181c78ed0ec8e4475f16f4f22614a1bd48df93ee55cf38f787', '[\"student\"]', '2024-09-26 01:29:09', NULL, '2024-09-25 12:44:40', '2024-09-26 01:29:09'),
(704, 'App\\Models\\Student', 251, 'API TOKEN', 'e5a561b65947d5cb4146e057af0761c0f587dc50d2bf70ac91a133229aaedcee', '[\"*\"]', NULL, NULL, '2024-09-25 13:28:09', '2024-09-25 13:28:09'),
(705, 'App\\Models\\Student', 252, 'API TOKEN', '4accc209a8d6d7841115e0903c976e062453cead3e71fe9a694648a0aa8f9a0b', '[\"*\"]', NULL, NULL, '2024-09-25 13:42:00', '2024-09-25 13:42:00'),
(706, 'App\\Models\\Student', 253, 'API TOKEN', '45fe7c687e5bb7da770e74bffeba05bbb39cc14c4ad001561230e2a196681f1a', '[\"*\"]', NULL, NULL, '2024-09-25 13:53:43', '2024-09-25 13:53:43'),
(707, 'App\\Models\\Student', 51, '01012244852', '5597f8f9a2143e99ab2e7035ef0207bf676a8351ecee00c777101c3e66b503ba', '[\"student\"]', '2024-09-25 21:13:00', NULL, '2024-09-25 15:05:01', '2024-09-25 21:13:00'),
(708, 'App\\Models\\Student', 110, '01016531767', '33396871aaca16f8464ea1639165aafce554ea52128fc1744de842de5356db50', '[\"student\"]', '2024-09-25 15:27:03', NULL, '2024-09-25 15:25:10', '2024-09-25 15:27:03'),
(709, 'App\\Models\\Student', 254, 'API TOKEN', '3f753287aa4b3fbac21072aa1dc9b84fe72f1ac7f7a194f069ec6c92e6871a4c', '[\"*\"]', NULL, NULL, '2024-09-25 15:45:25', '2024-09-25 15:45:25'),
(710, 'App\\Models\\Student', 123, '01127273692', 'c989249af02ceaaddb93b09be7b3a9de0f70e65bff36844ca496c6aa5ed9131f', '[\"student\"]', '2024-09-25 19:55:27', NULL, '2024-09-25 16:08:38', '2024-09-25 19:55:27'),
(711, 'App\\Models\\Student', 248, '01223515445', '7c8ec4ef6aaed54afeb157b30fd5182e51db9a9f9daa5445d4e782a72489f30d', '[\"student\"]', '2024-09-25 16:26:51', NULL, '2024-09-25 16:23:59', '2024-09-25 16:26:51'),
(712, 'App\\Models\\Student', 253, '01551471308', 'ed6c94de56eb5f461dca120ab3d273d2573637d53e3798c3134b1ba133b9d0bd', '[\"student\"]', '2024-09-25 19:38:15', NULL, '2024-09-25 16:28:44', '2024-09-25 19:38:15'),
(713, 'App\\Models\\Student', 255, 'API TOKEN', '2aeebfaec6131f12e5be905cad76513592e7b647bfd4a0b69f1b740eed1c911b', '[\"*\"]', NULL, NULL, '2024-09-25 16:42:45', '2024-09-25 16:42:45'),
(714, 'App\\Models\\Student', 62, '01009394733', '9b2878a5277eeea9417ccd99cd820f043670566424c6a65a86350b098c4e7ac2', '[\"student\"]', '2024-09-25 21:58:12', NULL, '2024-09-25 17:03:56', '2024-09-25 21:58:12'),
(715, 'App\\Models\\Student', 217, '01158705552', '0f15de14409e7ccb48ed7fde514a6ad44454ebf40d116825ccb396d52164608e', '[\"student\"]', '2024-09-25 21:38:03', NULL, '2024-09-25 17:11:49', '2024-09-25 21:38:03'),
(716, 'App\\Models\\Student', 250, '01118916828', '42b5771a2a9a8d8341d2e567f00c737df57f8ce25386150880b09563cbffcbf7', '[\"student\"]', '2024-09-25 17:55:17', NULL, '2024-09-25 17:54:30', '2024-09-25 17:55:17'),
(717, 'App\\Models\\Student', 254, '01009196102', '013db08ae94c93ad6dcfaedba39fa7f03afcdb6da584f4579cde64dbe0cc3c0c', '[\"student\"]', '2024-09-25 18:01:28', NULL, '2024-09-25 18:00:54', '2024-09-25 18:01:28'),
(718, 'App\\Models\\Student', 256, 'API TOKEN', '24cd06c713ce7de066fae1959091725cbf9c59925c7ec8155425d1ba6fda82f1', '[\"*\"]', NULL, NULL, '2024-09-25 18:04:05', '2024-09-25 18:04:05'),
(719, 'App\\Models\\Student', 256, '01112776677', '74af1e933b9276c85b0c10d4d3893eaf1d6576f88f88388cab8523e6e51b8f37', '[\"student\"]', '2024-09-25 18:11:35', NULL, '2024-09-25 18:11:35', '2024-09-25 18:11:35'),
(720, 'App\\Models\\Student', 71, '01090103755', 'fdcd61a2c50f3c17e853441d2add07417c6cd66bcac41be871d15e2ece8bfd57', '[\"student\"]', '2024-09-26 00:09:38', NULL, '2024-09-25 18:20:36', '2024-09-26 00:09:38'),
(721, 'App\\Models\\Student', 70, '01122552484', '517fe17478febf91cba34309b3809d0c3a22a620bef4ecb8f159cadf8b5e2567', '[\"student\"]', '2024-09-25 18:22:57', NULL, '2024-09-25 18:22:40', '2024-09-25 18:22:57'),
(722, 'App\\Models\\Student', 139, '01011403830', '7b4267522097e1f204a1f0944ddac90a30e146bd66d6176fce7bc03bd9c0b140', '[\"student\"]', '2024-09-26 07:04:06', NULL, '2024-09-25 18:25:10', '2024-09-26 07:04:06'),
(723, 'App\\Models\\Student', 95, '01066856131', '913dec0f906359ad21a3597bc25190f8830ed7871f8764844bbc80740546f3e6', '[\"student\"]', '2024-09-25 18:42:17', NULL, '2024-09-25 18:41:13', '2024-09-25 18:42:17'),
(724, 'App\\Models\\Student', 133, '01009517939', '03904a7241a3d044a9b81fcf8d0045dbbba96e52b53be3192364f0ceb010a0ed', '[\"student\"]', '2024-09-25 18:50:24', NULL, '2024-09-25 18:50:06', '2024-09-25 18:50:24'),
(725, 'App\\Models\\Student', 112, '01013873861', '79f3c9c3226c10749bd354a0ec8a9d651a61e6c404f993f54225e9848c25e1d1', '[\"student\"]', '2024-09-26 10:26:32', NULL, '2024-09-25 19:16:11', '2024-09-26 10:26:32'),
(726, 'App\\Models\\Student', 97, '01282050281', '344e9f198975ff3c824d4cba85bde063a81fbcd3869e2f3f02c2575a58ed34ef', '[\"student\"]', '2024-09-25 23:54:42', NULL, '2024-09-25 19:22:02', '2024-09-25 23:54:42'),
(727, 'App\\Models\\Student', 74, '01019671855', 'fa85665005a1d35596c685e4efc277c07e6d636e8fe7d7e97609f2c0815d3e0f', '[\"student\"]', '2024-09-25 19:27:11', NULL, '2024-09-25 19:24:56', '2024-09-25 19:27:11'),
(728, 'App\\Models\\Student', 67, '01098154974', '0301e903822cbd4079b22ff47f645b7775c8907fd0889a6f5a14aa53336edf6f', '[\"student\"]', '2024-09-25 19:30:53', NULL, '2024-09-25 19:26:35', '2024-09-25 19:30:53'),
(729, 'App\\Models\\Student', 54, '01011085651', '46aac745362831d802ec67d4c2545fc984370028b7d28ed6c77f85597d67a519', '[\"student\"]', '2024-09-25 19:45:09', NULL, '2024-09-25 19:42:13', '2024-09-25 19:45:09'),
(730, 'App\\Models\\Student', 246, '01026615692', '8f24ea01ef48b471c9f5194a931599b7bbf3013a6eecbce7045268dc6a7cc147', '[\"student\"]', '2024-09-25 20:30:05', NULL, '2024-09-25 20:30:05', '2024-09-25 20:30:05'),
(731, 'App\\Models\\Student', 54, '01011085651', '5d4eda03fd022d1e12119222c31757dffc23309888e8f1eecc16f462995b5523', '[\"student\"]', '2024-09-25 20:39:06', NULL, '2024-09-25 20:31:42', '2024-09-25 20:39:06'),
(732, 'App\\Models\\Student', 31, '01091014180', '794e0c8d35e101e6a8324219a9852ebecfcf468db71f5895640b7519ade5523e', '[\"student\"]', '2024-09-25 21:48:17', NULL, '2024-09-25 20:49:30', '2024-09-25 21:48:17'),
(733, 'App\\Models\\Student', 257, 'API TOKEN', '20ba5fd17e209140fc555d4f622e1189b76f157ef2a5c48f63e258e513262946', '[\"*\"]', NULL, NULL, '2024-09-25 21:20:25', '2024-09-25 21:20:25'),
(734, 'App\\Models\\Student', 258, 'API TOKEN', '983e050edd12c2daa572404af9c7e2e5c5d6c4d3a46084e6a11ce346691abd2a', '[\"*\"]', NULL, NULL, '2024-09-25 22:20:01', '2024-09-25 22:20:01'),
(735, 'App\\Models\\Student', 132, '01113774495', '80fa295e4ae3be4f244b672bbc1c6a911ea1bb9edfff72b50ce9b9e6acae8ed0', '[\"student\"]', '2024-09-26 07:28:00', NULL, '2024-09-25 22:31:08', '2024-09-26 07:28:00'),
(736, 'App\\Models\\Student', 82, '01000812890', '429470dec5bebd0d18426f32f981e967286d1986ce7adb565f53d62809087beb', '[\"student\"]', '2024-09-25 22:41:06', NULL, '2024-09-25 22:40:45', '2024-09-25 22:41:06'),
(737, 'App\\Models\\Student', 73, '01033704934', 'fbce39411e7d923dc8ba0af32c28f13eb0873e12fd1633f6ff388dad68bcf341', '[\"student\"]', '2024-09-25 22:45:30', NULL, '2024-09-25 22:45:26', '2024-09-25 22:45:30'),
(738, 'App\\Models\\Student', 245, '01060866493', '78e508dc6d6474a935580915a057b84938a1030f502a8f1ed0ccb2149c3ce260', '[\"student\"]', '2024-09-25 22:47:38', NULL, '2024-09-25 22:46:22', '2024-09-25 22:47:38'),
(739, 'App\\Models\\Admin', 39, 'Jana-Halaby', 'aea6ed419729af61b3cf2ef181313e7ec7934bb92d15649e29f16921c9883a58', '[\"admin\"]', '2024-09-25 23:55:34', NULL, '2024-09-25 23:15:52', '2024-09-25 23:55:34'),
(740, 'App\\Models\\Student', 259, 'API TOKEN', 'dc308eef440cbfa9c7da2aa8fa9756c5d21fb5871d78bd49ad42e294de371e08', '[\"*\"]', NULL, NULL, '2024-09-25 23:30:44', '2024-09-25 23:30:44'),
(741, 'App\\Models\\Student', 260, 'API TOKEN', '0ecadf4788175d97a486b74b32771baed9d2d5ad025dcbce9cfeb916c6d57378', '[\"*\"]', NULL, NULL, '2024-09-25 23:34:14', '2024-09-25 23:34:14'),
(742, 'App\\Models\\Student', 261, 'API TOKEN', '3047a2c9a1150fa75b5cf8037b372aff31d180cdfce7e9cbd152786a06f99a70', '[\"*\"]', NULL, NULL, '2024-09-25 23:37:05', '2024-09-25 23:37:05'),
(743, 'App\\Models\\Student', 262, 'API TOKEN', 'd0f9515560d581782c029e2c7ef9587b674a372f6fb722a95ba1ac1ca4fc3eb6', '[\"*\"]', NULL, NULL, '2024-09-25 23:39:07', '2024-09-25 23:39:07'),
(744, 'App\\Models\\Admin', 39, 'Jana-Halaby', 'f84d6e71ae670874b54ac93dc50c7bd8b43312f3f04e4ffd610049c9dab853b0', '[\"admin\"]', '2024-09-25 23:56:37', NULL, '2024-09-25 23:56:27', '2024-09-25 23:56:37'),
(745, 'App\\Models\\Student', 71, '01090103755', '95291eae3afc797903b36c2de7181d684f2218460fa3860a3e9e530539a50cbb', '[\"student\"]', '2024-09-26 00:14:18', NULL, '2024-09-26 00:14:10', '2024-09-26 00:14:18'),
(746, 'App\\Models\\Student', 263, 'API TOKEN', '52f20c2e15027c5a15465849542c76d8b451f47a8bc78cad1f2f2b9afefcbdc6', '[\"*\"]', NULL, NULL, '2024-09-26 00:26:35', '2024-09-26 00:26:35'),
(747, 'App\\Models\\Student', 263, '01145388548', 'e5ff85b2cd09a37be872d328d2ef4ad5d71f5d7f476ea03ebacc651f52a32c11', '[\"student\"]', '2024-09-26 00:27:23', NULL, '2024-09-26 00:27:23', '2024-09-26 00:27:23'),
(748, 'App\\Models\\Student', 109, '01097029037', '216a6934920cf5e10c9b8e12836268e077539c446ecb149f6154450f3cde2be1', '[\"student\"]', '2024-09-26 01:19:35', NULL, '2024-09-26 01:19:11', '2024-09-26 01:19:35'),
(749, 'App\\Models\\Student', 264, 'API TOKEN', 'ebcda421c13ccf8ba901745d4e3519c27de441f91a003ca68d522c874cb901c4', '[\"*\"]', NULL, NULL, '2024-09-26 02:28:53', '2024-09-26 02:28:53'),
(750, 'App\\Models\\Student', 46, '01001397857', '1991e00153639c13579f1dd6ca327072e9f6a483d5668eda179764f4669018a3', '[\"student\"]', '2024-09-26 06:35:01', NULL, '2024-09-26 06:34:40', '2024-09-26 06:35:01'),
(751, 'App\\Models\\Student', 127, '01062578018', '5350683e0ba6ad081bea371c36a108d59aed994b1eddeabdda67b4fef04a6da7', '[\"student\"]', '2024-09-26 09:51:17', NULL, '2024-09-26 09:50:45', '2024-09-26 09:51:17'),
(752, 'App\\Models\\Student', 265, 'API TOKEN', '3d77699dfce1a447433ea35b8f4f4b82e18bbb9ca37a4d6d88d7db0a792d90ce', '[\"*\"]', NULL, NULL, '2024-09-27 05:09:58', '2024-09-27 05:09:58');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(753, 'App\\Models\\Admin', 1, 'prodigy', '352240e372cfaf55bafc6f2b1e58e4683e5425953e05425e47ed3ca4e217588a', '[\"admin\"]', '2024-10-01 16:45:43', NULL, '2024-10-01 14:30:58', '2024-10-01 16:45:43'),
(754, 'App\\Models\\Admin', 1, 'prodigy', 'c0f3d1a7d826abfc4bd48d239590694bbaadd46cc1ad59ce36b32405ecaa748b', '[\"admin\"]', '2024-10-01 20:23:17', NULL, '2024-10-01 14:37:51', '2024-10-01 20:23:17'),
(755, 'App\\Models\\Admin', 1, 'prodigy', '031728447222ceafcc43824544cd8a6954baf55b573d92f3d720971239815ea3', '[\"admin\"]', '2024-10-10 10:44:57', NULL, '2024-10-10 09:58:47', '2024-10-10 10:44:57'),
(756, 'App\\Models\\Admin', 1, 'prodigy', 'c788bcdfde10d9bc538c8f3b0b63aa1f1c2ba69b7face2635a8d2941f32544a1', '[\"admin\"]', '2024-10-10 11:55:45', NULL, '2024-10-10 11:26:49', '2024-10-10 11:55:45'),
(757, 'App\\Models\\Admin', 1, 'prodigy', 'e0401cce3ca1f810aeebb7f87c2e1855e6d5dc8f2f2f05b9ca66fd3966f68907', '[\"admin\"]', '2024-10-10 12:08:06', NULL, '2024-10-10 12:00:27', '2024-10-10 12:08:06'),
(758, 'App\\Models\\Teacher', 3, 'omarahmed', 'fd7942e55ccdd20c8898505ea60d5029540bfabc29b44028fb3936f94aac8c3c', '[\"admin\"]', NULL, NULL, '2024-10-10 12:08:09', '2024-10-10 12:08:09'),
(759, 'App\\Models\\Teacher', 3, 'omarahmed', '1f84f197b649305175ba58004929de61f81ad53b35e7a47c23f6b2610fbe98d6', '[\"admin\"]', '2024-10-11 03:56:07', NULL, '2024-10-10 12:11:30', '2024-10-11 03:56:07'),
(760, 'App\\Models\\Admin', 1, 'prodigy', '7877ccc792fd0f1e961ce8ebde6eec991e402e723f207b352bb10f0100ca64e6', '[\"admin\"]', '2024-10-12 11:29:16', NULL, '2024-10-11 15:32:08', '2024-10-12 11:29:16'),
(761, 'App\\Models\\Student', 265, '01016046298', '315022833dec9902f05f52363667cb1ff56150b1fd5caa30009428c38abd4581', '[\"student\"]', '2024-10-11 16:48:28', NULL, '2024-10-11 16:33:35', '2024-10-11 16:48:28'),
(762, 'App\\Models\\Admin', 1, 'prodigy', '90d099dd671b92ccbdb384e058717bfefb88ab22820256c7c74f55b43d533851', '[\"admin\"]', '2024-10-14 09:52:37', NULL, '2024-10-12 08:06:03', '2024-10-14 09:52:37'),
(763, 'App\\Models\\Admin', 1, 'prodigy', '3da22cfb3f8dc2382f1aeb3215ec8034d36ece244da6450116d50fbe17766442', '[\"admin\"]', '2024-10-12 10:09:56', NULL, '2024-10-12 10:09:09', '2024-10-12 10:09:56'),
(764, 'App\\Models\\Admin', 1, 'prodigy', '3fa85c8e1f859d672edaa07b8ccdefbc0125dfc3108f0e20e0eaaa1a13da94b9', '[\"admin\"]', '2024-10-12 11:49:00', NULL, '2024-10-12 10:14:03', '2024-10-12 11:49:00'),
(765, 'App\\Models\\Teacher', 3, 'omarahmed', '6d4e57f8a3a56399fd7ea6bfd5d07f6aa8b77cedd9d7b584a4cfc58ff9f716d2', '[\"admin\"]', NULL, NULL, '2024-10-12 11:29:46', '2024-10-12 11:29:46'),
(766, 'App\\Models\\Teacher', 3, 'omarahmed', '7fa1938bd30b68fbde9a43256b2ae0f27ebca885d0617d51f8b497a603f2c024', '[\"admin\"]', NULL, NULL, '2024-10-12 11:34:21', '2024-10-12 11:34:21'),
(767, 'App\\Models\\Teacher', 3, 'omarahmed', '503af859c429dc9ae3391a0a0807495172f03419bbec5104e5e1ee9d446b4f6b', '[\"admin\"]', NULL, NULL, '2024-10-12 11:40:13', '2024-10-12 11:40:13'),
(768, 'App\\Models\\Teacher', 3, 'omarahmed', '4b1492498574b91b3ede1602f006e2261a4ebe692e452f739fd494c6c7e8dad1', '[\"admin\"]', '2024-10-12 11:42:11', NULL, '2024-10-12 11:41:54', '2024-10-12 11:42:11'),
(769, 'App\\Models\\Admin', 1, 'prodigy', '9a1ba4f41e70ab81d5388d31333b4d225752d125fe50b1bb313b99c79c6a17fd', '[\"admin\"]', '2024-10-12 12:01:23', NULL, '2024-10-12 11:43:08', '2024-10-12 12:01:23'),
(770, 'App\\Models\\Admin', 1, 'prodigy', '2396f22d70dc2d7a28bfa462bbf76b4d61fe5b625b89db6444494a7d6e8a5637', '[\"admin\"]', '2024-10-12 11:51:47', NULL, '2024-10-12 11:50:33', '2024-10-12 11:51:47'),
(771, 'App\\Models\\Admin', 1, 'prodigy', '2970729c21ad61aafdcca80e752938a81726954d68bcda86e9eba1f8d2099830', '[\"admin\"]', '2024-10-12 11:52:29', NULL, '2024-10-12 11:51:54', '2024-10-12 11:52:29'),
(772, 'App\\Models\\Teacher', 3, 'omarahmed', '8e1fed8628fe96e1b5485d135457396139dabe8d9b9ea2a6aaa285de30a58051', '[\"admin\"]', '2024-10-12 12:00:10', NULL, '2024-10-12 11:52:44', '2024-10-12 12:00:10'),
(773, 'App\\Models\\Admin', 1, 'prodigy', 'bc65f110d41755f72ff84336edf101d0b7d44ba2bb887f35e228cb19b948998c', '[\"admin\"]', '2024-10-12 12:05:28', NULL, '2024-10-12 12:03:08', '2024-10-12 12:05:28'),
(774, 'App\\Models\\Teacher', 3, 'omarahmed', '3e58b7b5dbb01caaeeacca090d4ec4927d31ef718e1b382d00075547c7d5521b', '[\"admin\"]', '2024-10-12 12:33:56', NULL, '2024-10-12 12:05:40', '2024-10-12 12:33:56'),
(775, 'App\\Models\\Teacher', 3, 'omarahmed', '30ba33af760aa41ba88e909f2cfa2b90763e0e5730ba61867d38cc3f2ccb39d6', '[\"admin\"]', '2024-10-12 12:51:33', NULL, '2024-10-12 12:28:36', '2024-10-12 12:51:33'),
(776, 'App\\Models\\Admin', 1, 'prodigy', '9c0f22b127f9e85ac93a5b06fb82dcab571c5674fe2ba9740e9a9f3678dda379', '[\"admin\"]', '2024-10-14 21:19:17', NULL, '2024-10-14 21:09:50', '2024-10-14 21:19:17'),
(777, 'App\\Models\\Admin', 1, 'prodigy', 'dad0e3cf79d801bfa5335c255a6b2aa831643102debdda5083ba6867bc414f98', '[\"admin\"]', '2024-10-22 11:14:35', NULL, '2024-10-22 11:06:59', '2024-10-22 11:14:35'),
(778, 'App\\Models\\Admin', 1, 'prodigy', '123313f0b0a9bc94ec69e0e7bb642648dd4e6064e78510b73bfe35f580dee4c5', '[\"admin\"]', '2024-10-22 13:29:28', NULL, '2024-10-22 12:18:28', '2024-10-22 13:29:28'),
(779, 'App\\Models\\Admin', 1, 'prodigy', 'b286f2047609be257951f240711c78392b7c8f7b3b3e96505d6f46c4a97b14fb', '[\"admin\"]', '2024-10-22 15:27:34', NULL, '2024-10-22 14:06:41', '2024-10-22 15:27:34'),
(780, 'App\\Models\\Admin', 1, 'Prodigy', 'f2fbb5fd7592ffc0bc9fe4c928f024a9b136c824a91efdd545fa49b4b3bd6a34', '[\"admin\"]', '2024-10-22 14:37:17', NULL, '2024-10-22 14:34:54', '2024-10-22 14:37:17'),
(781, 'App\\Models\\Admin', 1, 'Prodigy', '0471ac5aaf8f99ac7de6ddd0dcf8b99c426dc6e182880397cac112496ea259f0', '[\"admin\"]', '2024-10-22 14:38:17', NULL, '2024-10-22 14:38:16', '2024-10-22 14:38:17'),
(782, 'App\\Models\\Admin', 44, 'test', '18825cb94ce5a9fb0073c67606d05b2e451333bdad5a8ed5bce4b6bcc781386a', '[\"admin\"]', '2024-10-27 09:30:23', NULL, '2024-10-27 09:30:23', '2024-10-27 09:30:23'),
(783, 'App\\Models\\Admin', 44, 'omar', '187231970c137af4c17877318dd89a0584100f989de05e3947f0ee39bd57665d', '[\"admin\"]', '2024-10-27 09:32:37', NULL, '2024-10-27 09:31:18', '2024-10-27 09:32:37'),
(784, 'App\\Models\\Student', 266, 'API TOKEN', 'f1b7d26273bb0eddf8c5b876c07b56a77d9c9bf401da5dafea2c064a07fa8859', '[\"*\"]', NULL, NULL, '2024-10-27 13:15:19', '2024-10-27 13:15:19'),
(785, 'App\\Models\\Admin', 44, 'omar', 'a6bed6a831f055f5d44565c26b22aa2354dd7a2b5a6dce2ada05804c6f8730c6', '[\"admin\"]', '2024-10-27 13:16:17', NULL, '2024-10-27 13:15:59', '2024-10-27 13:16:17'),
(786, 'App\\Models\\Student', 266, '01148375189', 'd1598e77fc87557fe00bbdd5c52058d9ee6e8001e36a785f6b030a7c63caa6a1', '[\"student\"]', '2024-10-27 13:52:45', NULL, '2024-10-27 13:46:43', '2024-10-27 13:52:45'),
(787, 'App\\Models\\Student', 266, '01148375189', '60414633b86425855a2b713028438f8659e55ef6dc435aeba08dc04058765c90', '[\"student\"]', '2024-10-27 13:57:13', NULL, '2024-10-27 13:53:42', '2024-10-27 13:57:13'),
(788, 'App\\Models\\Student', 266, '01148375189', '448feb656dfef0a6a4c8fcd85cc8440e3bf659285c8cbae9fced8f1e0caf445d', '[\"student\"]', '2024-10-27 14:38:21', NULL, '2024-10-27 14:38:20', '2024-10-27 14:38:21'),
(789, 'App\\Models\\Student', 266, '01148375189', '63a49e7905c4c8428dc697ced68bffa0b3f8a7dbca4e42940559ae5cf2e25aca', '[\"student\"]', '2024-10-27 14:49:26', NULL, '2024-10-27 14:49:26', '2024-10-27 14:49:26'),
(790, 'App\\Models\\Student', 266, '01148375189', '3701d43bd9d526bf9927fa0e3cf547f2b4e1333d13c126292ab7e327e32c66fe', '[\"student\"]', '2024-10-27 15:17:31', NULL, '2024-10-27 14:55:03', '2024-10-27 15:17:31'),
(791, 'App\\Models\\Student', 266, '01148375189', '9c5cb7d5961716a89750e4ecdc5cc31cadaf95f365696c88b07bca6685ad4e17', '[\"student\"]', '2024-10-27 15:08:20', NULL, '2024-10-27 15:05:16', '2024-10-27 15:08:20'),
(792, 'App\\Models\\Admin', 1, 'Prodigy', 'df989048c22420f88c8555946ac1454879a6abb5a893077ed3f5c5b763bac9d9', '[\"admin\"]', '2024-11-01 21:54:16', NULL, '2024-10-28 12:22:15', '2024-11-01 21:54:16'),
(793, 'App\\Models\\Admin', 1, 'Prodigy', 'd8fd7e22f5189935e4d0911e720202a894d4d28908589c37593a0ca2f7201223', '[\"admin\"]', '2024-10-28 22:17:28', NULL, '2024-10-28 21:58:56', '2024-10-28 22:17:28'),
(794, 'App\\Models\\Admin', 44, 'omar', 'f30bbc44a4237b5fd54dfb81b97ec7f2808fab101d30f10c844702f4e9c20fa7', '[\"admin\"]', '2024-10-29 10:37:06', NULL, '2024-10-29 09:54:38', '2024-10-29 10:37:06'),
(795, 'App\\Models\\Admin', 44, 'omar', '838abd04e033ebd8704353844ea1c13d60edffd3049bc4c6438736ec68bfbc9f', '[\"admin\"]', '2024-10-29 10:44:46', NULL, '2024-10-29 10:44:22', '2024-10-29 10:44:46'),
(796, 'App\\Models\\Admin', 1, 'Prodigy', '09daea7cf0182f74d76ae00d39746fb9a1ae6ed4e86f6f1e3849b63a6a6eca0e', '[\"admin\"]', '2024-11-01 22:38:35', NULL, '2024-11-01 21:56:16', '2024-11-01 22:38:35'),
(797, 'App\\Models\\Admin', 44, 'omar', '1e13b347beab4c992d694a93c94c23ea27a34197acb518e2dea8bfd214f5787e', '[\"admin\"]', '2024-11-06 10:43:51', NULL, '2024-11-06 10:18:08', '2024-11-06 10:43:51'),
(798, 'App\\Models\\Admin', 44, 'omar', 'ab719baea6da1cbe498e03763b2110f9e39e4ba4e67d88820395132692f29614', '[\"admin\"]', '2024-11-06 12:17:09', NULL, '2024-11-06 10:18:15', '2024-11-06 12:17:09'),
(799, 'App\\Models\\Teacher', 2, 'omar123', '6c46947cc34498aedcd757138ce1fae91a184cdc8c7cc2ea223f93be9733622f', '[\"admin\"]', '2024-11-06 11:04:55', NULL, '2024-11-06 10:20:28', '2024-11-06 11:04:55'),
(800, 'App\\Models\\Teacher', 2, 'omar123', '93b95d2efaa6697f62aea59ef18a0c176d95c5c6c7059c3b6962a4fb0679a89f', '[\"admin\"]', '2024-11-06 11:53:47', NULL, '2024-11-06 11:53:46', '2024-11-06 11:53:47'),
(801, 'App\\Models\\Admin', 44, 'omar', '51b2ac4091713aeab3baf1ad58f3c7d57074fa946c57adc4d70392ec26e298a1', '[\"admin\"]', '2024-11-07 14:14:31', NULL, '2024-11-06 13:24:31', '2024-11-07 14:14:31'),
(802, 'App\\Models\\Admin', 44, 'omar', 'd838b55e6a40af0529f98e8f162d823dc3a8ca731fa0a75df19d4d5cf2177490', '[\"admin\"]', '2024-11-06 14:04:43', NULL, '2024-11-06 14:03:56', '2024-11-06 14:04:43'),
(803, 'App\\Models\\Admin', 44, 'omar', '131a5624e1e58ae7f954155ce8e01b5e051d4821ca74efee4ee648439633118e', '[\"admin\"]', '2024-11-08 17:31:05', NULL, '2024-11-08 15:29:03', '2024-11-08 17:31:05'),
(804, 'App\\Models\\Admin', 44, 'omar', 'b8ae7c61653c9b65f2871a819a07d8d9035d9a9e1fece2234e7e60a9444ee4d4', '[\"admin\"]', '2024-11-08 17:31:53', NULL, '2024-11-08 17:31:29', '2024-11-08 17:31:53'),
(805, 'App\\Models\\Student', 265, '01016046298', '30d0e8c999f8efb0505156963d68d62644689337a377c411b7d5dc3e621604a1', '[\"student\"]', '2024-11-08 17:41:57', NULL, '2024-11-08 17:32:01', '2024-11-08 17:41:57'),
(806, 'App\\Models\\Admin', 1, 'Prodigy', '97d044aec8188d91fed4fea20117d5267a436a903c20246d0f5073cc3e242955', '[\"admin\"]', '2024-11-14 14:02:23', NULL, '2024-11-09 18:21:39', '2024-11-14 14:02:23'),
(807, 'App\\Models\\Admin', 1, 'Prodigy', 'cc0509645d515c43a3356f38843c43ce8c9d2222e88b4c3d5a9b9962fc33667b', '[\"admin\"]', '2024-11-15 22:10:49', NULL, '2024-11-09 21:29:28', '2024-11-15 22:10:49'),
(808, 'App\\Models\\Admin', 1, 'Prodigy', '01bcae9c2bf393997ef9947578b34df1eebfb35acd91a25171f69bd78e81f19a', '[\"admin\"]', '2024-11-09 21:35:14', NULL, '2024-11-09 21:33:58', '2024-11-09 21:35:14'),
(809, 'App\\Models\\Student', 266, '01148375189', '84e3946101630378f042dab254761c487038f36cda0f85a6bd3c7f83a528cf19', '[\"student\"]', '2024-11-10 13:49:09', NULL, '2024-11-10 13:09:59', '2024-11-10 13:49:09'),
(810, 'App\\Models\\Admin', 44, 'omar', '97fdd2cebd0fbaeaed63832bc0f7077919cc5ea948cc50b1bd1c851902d2ad8c', '[\"admin\"]', '2024-11-10 14:02:29', NULL, '2024-11-10 13:51:41', '2024-11-10 14:02:29'),
(811, 'App\\Models\\Admin', 44, 'omar', '2eb1cef2e1233dec98554fd597b371c1ac3129868dc7323bf4b13056f5622053', '[\"admin\"]', '2024-11-10 15:21:40', NULL, '2024-11-10 15:21:33', '2024-11-10 15:21:40'),
(812, 'App\\Models\\Student', 267, 'API TOKEN', 'bf8255641074c6f7cde99af1dfb5fd81162988a9e9e352237919ac6864bf2ece', '[\"*\"]', NULL, NULL, '2024-11-13 09:09:27', '2024-11-13 09:09:27'),
(813, 'App\\Models\\Admin', 44, 'omar', '46da2c18dd52c479101d6a6d6a27762ccf9ca210177a2c725e4353840cb5d729', '[\"admin\"]', '2024-11-13 15:00:31', NULL, '2024-11-13 14:45:37', '2024-11-13 15:00:31'),
(814, 'App\\Models\\Admin', 44, 'omar', '67145ff49d34700ad488068eed111a745d58315fc49caf59506115ad1c991c7b', '[\"admin\"]', '2024-11-13 15:08:59', NULL, '2024-11-13 15:03:16', '2024-11-13 15:08:59'),
(815, 'App\\Models\\Admin', 44, 'omar', 'bb3ebcd98e941cdbe27b3c6859ee20894154c31618fecbf987fd1798e1efd66b', '[\"admin\"]', '2024-11-13 15:19:35', NULL, '2024-11-13 15:10:44', '2024-11-13 15:19:35'),
(816, 'App\\Models\\Student', 268, 'API TOKEN', 'dea4619d0f58ce1105e3cca85f977254d36cc80d6fe8bc8621a9c9480ebf1481', '[\"*\"]', NULL, NULL, '2024-11-14 11:44:17', '2024-11-14 11:44:17'),
(817, 'App\\Models\\Student', 268, '01000379176', '4c6074b4c8270499b283d4ed28a25d3c4e0ff13d4b0876f30f73d53ee7201868', '[\"student\"]', '2024-11-14 12:36:58', NULL, '2024-11-14 12:34:23', '2024-11-14 12:36:58'),
(818, 'App\\Models\\Admin', 44, 'omar', 'cf6035cb1cc4eb5068cee914d7b6c848135815a957431393483535a27c40e774', '[\"admin\"]', '2024-11-14 12:56:24', NULL, '2024-11-14 12:44:57', '2024-11-14 12:56:24'),
(819, 'App\\Models\\Admin', 48, 'hodasaeed', '12e8e5d8ad6e47c910b18d202e54ce95ad5260ac6b70bdeb83fba48e363622a2', '[\"admin\"]', '2024-11-14 14:05:19', NULL, '2024-11-14 13:57:52', '2024-11-14 14:05:19'),
(820, 'App\\Models\\Admin', 44, 'omar', '259c4016be1c2ab19b5bd4fcb5d41f92a86d52162900df4c54d0011c0205f4cf', '[\"admin\"]', '2024-11-14 16:06:19', NULL, '2024-11-14 15:43:12', '2024-11-14 16:06:19'),
(821, 'App\\Models\\Admin', 44, 'omar', '9b1b7f42e781f0ca1e4026c2dd851705a627a7bb7fbefaf086227d3d94993335', '[\"admin\"]', '2024-11-14 16:42:29', NULL, '2024-11-14 16:38:06', '2024-11-14 16:42:29'),
(822, 'App\\Models\\Student', 268, '01000379176', '9cdf1a8be483edd1f38a7523368054d1a16567ee832b79ad593aba29d8f5434e', '[\"student\"]', '2024-11-23 15:06:17', NULL, '2024-11-23 15:05:07', '2024-11-23 15:06:17'),
(823, 'App\\Models\\Admin', 1, 'Prodigy', 'b420269b2ab45c04af06693d94264f0f0314e239af6e96a0c0ce62cc876b3337', '[\"admin\"]', '2024-11-30 13:48:28', NULL, '2024-11-23 16:32:05', '2024-11-30 13:48:28'),
(824, 'App\\Models\\Student', 269, 'API TOKEN', '24b3c89e03e76ffceab8ee4eeda34a2ea594aa75f0d7f188ea8b125609dfb5b2', '[\"*\"]', NULL, NULL, '2024-11-24 14:08:31', '2024-11-24 14:08:31'),
(825, 'App\\Models\\Student', 269, '01145217525', '18803a4c30c3f5142c20374c8d8dd8b5a33aa67d4128317a4395ec604d65fea1', '[\"student\"]', '2024-11-24 14:33:19', NULL, '2024-11-24 14:09:35', '2024-11-24 14:33:19'),
(826, 'App\\Models\\Student', 269, '01145217525', 'e7d1a6362c541496ec53af7a2c8de621649e495a70cf3b6393129118250236d1', '[\"student\"]', '2024-11-24 14:22:09', NULL, '2024-11-24 14:20:49', '2024-11-24 14:22:09'),
(827, 'App\\Models\\Student', 269, '01145217525', 'c89cb5b787cf5a5b08dbef51e534b7f88dd4501c421fc963df89e8572904c180', '[\"student\"]', '2024-11-24 14:29:01', NULL, '2024-11-24 14:23:29', '2024-11-24 14:29:01'),
(828, 'App\\Models\\Student', 269, '01145217525', '5d34a06c1b2a5b4ca078a59303dd448bf79934de2e22990a5c64e33c34dbb4bf', '[\"student\"]', '2024-11-25 14:05:21', NULL, '2024-11-24 14:30:12', '2024-11-25 14:05:21'),
(829, 'App\\Models\\Admin', 44, 'omar', '6bbcc0d09508f10a3040b455c70d8fc66672b779bc7c2d5040778ed7e1ee2dba', '[\"admin\"]', '2024-11-27 10:01:09', NULL, '2024-11-24 14:34:08', '2024-11-27 10:01:09'),
(830, 'App\\Models\\Admin', 1, 'Prodigy', 'e24154af09aba5438a7e60fb2f915d118ac157e9eac3d2b873e3330ea6f5863d', '[\"admin\"]', '2024-11-25 12:58:06', NULL, '2024-11-25 12:49:06', '2024-11-25 12:58:06'),
(831, 'App\\Models\\Student', 269, '01145217525', 'ecaf9f6b3df108c0aec274b07b567d9fdda426b2c01d1f69ba678e69eb5cbbdf', '[\"student\"]', '2024-11-25 13:22:56', NULL, '2024-11-25 13:22:35', '2024-11-25 13:22:56'),
(832, 'App\\Models\\Student', 270, 'API TOKEN', '0e81b3a84fd5e36b5b0af919c4f4c29170ab805e3dc09fe537e0df6e28cd56a0', '[\"*\"]', NULL, NULL, '2024-11-25 13:28:10', '2024-11-25 13:28:10'),
(833, 'App\\Models\\Student', 270, '01000379179', 'c53a4f8862881863699f7275134d90d301b1a86aba7f724aa5560817e3208aa0', '[\"student\"]', '2024-11-25 14:25:17', NULL, '2024-11-25 13:29:50', '2024-11-25 14:25:17'),
(834, 'App\\Models\\Student', 270, '01000379179', '9c1fc1a78f1ead29bfdde74102e3b3502546acc3a9dac0caaf8107fb019a1b9c', '[\"student\"]', '2024-11-25 16:37:45', NULL, '2024-11-25 13:42:26', '2024-11-25 16:37:45'),
(835, 'App\\Models\\Admin', 44, 'omar', '08f091a389a2cb1294199f1334d3c904a9a11843b7bd035f1b0db34fe711ddd6', '[\"admin\"]', '2024-11-27 10:52:07', NULL, '2024-11-25 14:20:15', '2024-11-27 10:52:07'),
(836, 'App\\Models\\Student', 270, '01000379179', 'e35f9d7c80de40b1cd7d7ca3c4ef0a2b9ff4d7c76642c5c983b01af004a14e9e', '[\"student\"]', '2024-11-25 16:46:55', NULL, '2024-11-25 16:27:53', '2024-11-25 16:46:55'),
(837, 'App\\Models\\Student', 270, '01000379179', '75a7dbe9f31855376f4b2e2af6bd74f08e631077d9e3a67aa3aba98db5f585b1', '[\"student\"]', '2024-11-25 22:28:18', NULL, '2024-11-25 22:25:32', '2024-11-25 22:28:18'),
(838, 'App\\Models\\Admin', 1, 'Prodigy', '64cd566a0f629eb38ceb50164bb97b8c2709b1cd5917f61b050c724ed0fb812e', '[\"admin\"]', '2024-11-25 23:24:16', NULL, '2024-11-25 23:18:57', '2024-11-25 23:24:16'),
(839, 'App\\Models\\Admin', 44, 'omar', 'b8ef314f8b8a1686eca0dc05c805b6088e0b67898dc5350d6c4f82dd9b870963', '[\"admin\"]', '2024-11-26 15:14:33', NULL, '2024-11-26 14:58:22', '2024-11-26 15:14:33'),
(840, 'App\\Models\\Admin', 1, 'prodigy', 'de5db4fc4d8c416395df390b08427a52b7c4f7b9f909c59c0258aca700275092', '[\"admin\"]', '2024-11-26 20:45:03', NULL, '2024-11-26 20:44:46', '2024-11-26 20:45:03'),
(841, 'App\\Models\\Admin', 44, 'omar', '4ca0de249b2d929253a3cc9986085a61556f05739e8482b2d2b7aa5b038bcb9b', '[\"admin\"]', '2024-12-02 13:25:46', NULL, '2024-11-27 10:28:30', '2024-12-02 13:25:46'),
(842, 'App\\Models\\Student', 270, '01000379179', 'c8c0db48d4c1a1b721cd692faae8b7c3fa4bc6c751de7977f54243c8f0d77ec4', '[\"student\"]', '2024-11-27 11:30:36', NULL, '2024-11-27 10:31:06', '2024-11-27 11:30:36'),
(843, 'App\\Models\\Student', 270, '01000379179', '8b748e93c812f4805f04abd57e46d3446b3a9f082aff9215716d670dbecd879c', '[\"student\"]', '2024-11-27 11:16:56', NULL, '2024-11-27 10:53:06', '2024-11-27 11:16:56'),
(844, 'App\\Models\\Admin', 44, 'omar', '9e7a9f82826a28f485f7527ae9b80170dcde9966b4f4d5a18c4638f648d04513', '[\"admin\"]', '2024-11-28 13:14:31', NULL, '2024-11-27 11:18:10', '2024-11-28 13:14:31'),
(845, 'App\\Models\\Student', 271, 'API TOKEN', 'c7eb7a5888d2bc71f4b485728e3a1ecbe7ad0eb8fd559ec2a48fd785d4606a9c', '[\"*\"]', NULL, NULL, '2024-11-28 10:27:46', '2024-11-28 10:27:46'),
(846, 'App\\Models\\Student', 271, '01124113266', 'defe1c72a47671e34816c137ab1c3f296a3f57fcd3c9c4938a5784b61a5152c6', '[\"student\"]', '2024-12-02 21:44:23', NULL, '2024-11-28 10:32:54', '2024-12-02 21:44:23'),
(847, 'App\\Models\\Student', 272, 'API TOKEN', 'b2a444ed1a1cffe10aed7f0cda6fab68f5d2a56bd4a46053e78773fbd0e76976', '[\"*\"]', NULL, NULL, '2024-11-28 12:59:12', '2024-11-28 12:59:12'),
(848, 'App\\Models\\Admin', 49, 'Safymoustafa', 'a0ccfb4eefcd951e328ba77e540bb4067c5eec71ae59ea1ae0428d3603069173', '[\"admin\"]', '2024-11-28 16:15:09', NULL, '2024-11-28 13:22:50', '2024-11-28 16:15:09'),
(849, 'App\\Models\\Student', 273, 'API TOKEN', 'f706c0df81788bddddf0ccab13dd3d75cf20e9feb01977cbbe0746257574ac83', '[\"*\"]', NULL, NULL, '2024-11-28 13:48:22', '2024-11-28 13:48:22'),
(850, 'App\\Models\\Student', 274, 'API TOKEN', '68b657c97700facd0f8ffc97406bf0acb5785ce119d36dd39e0f00555bc9bd05', '[\"*\"]', NULL, NULL, '2024-11-28 14:16:11', '2024-11-28 14:16:11'),
(851, 'App\\Models\\Student', 275, 'API TOKEN', 'd52579b5d83acaf140bdba52d6e21be8298a472da26eac3655759972fc06f8af', '[\"*\"]', NULL, NULL, '2024-11-28 14:19:46', '2024-11-28 14:19:46'),
(852, 'App\\Models\\Student', 276, 'API TOKEN', 'f81ad36621c59cc038a91ee7406caa578ac0ddfb8fef5389f0bb647c66f99afd', '[\"*\"]', NULL, NULL, '2024-11-28 14:36:54', '2024-11-28 14:36:54'),
(853, 'App\\Models\\Student', 277, 'API TOKEN', 'e3d91b062f447197ee01b642d38a669c772c5a82f55836b1728e6cf3f8b137ec', '[\"*\"]', NULL, NULL, '2024-11-28 15:03:30', '2024-11-28 15:03:30'),
(854, 'App\\Models\\Student', 278, 'API TOKEN', 'aa310b34f65b4c11b4eb530ae2aff7a124ebdf7e16dbd8c30398d32b6a6b2062', '[\"*\"]', NULL, NULL, '2024-11-28 15:41:16', '2024-11-28 15:41:16'),
(855, 'App\\Models\\Student', 279, 'API TOKEN', '85365238c84303715dcd24fb798eecca9bde5852df3bf6e9eebb65a2fb310e31', '[\"*\"]', NULL, NULL, '2024-11-28 15:43:24', '2024-11-28 15:43:24'),
(856, 'App\\Models\\Student', 280, 'API TOKEN', '9455f1e6dd16de604184739f626d6f2cfc9e3d98d1958e4ed81152eb78d552ef', '[\"*\"]', NULL, NULL, '2024-11-28 15:44:56', '2024-11-28 15:44:56'),
(857, 'App\\Models\\Student', 281, 'API TOKEN', '42ca72f7d5162bf976fc449183ad4745131e00314d2ba966a12538214d7d2a7c', '[\"*\"]', NULL, NULL, '2024-11-28 15:47:24', '2024-11-28 15:47:24'),
(858, 'App\\Models\\Student', 282, 'API TOKEN', 'caed3ea2e2933727a8bb6172e8b9deede6a4cb031dc1485950b2f0cfa8a5188c', '[\"*\"]', NULL, NULL, '2024-11-28 15:57:33', '2024-11-28 15:57:33'),
(859, 'App\\Models\\Student', 283, 'API TOKEN', 'b8b453a8f57b9faf8ffa5e3c2ac62f19f32e7c46b8589780a7aaa1a4f852ab31', '[\"*\"]', NULL, NULL, '2024-11-28 16:23:53', '2024-11-28 16:23:53'),
(860, 'App\\Models\\Student', 284, 'API TOKEN', '20f7b40057e6a55c76255c2ddb203d52fd974a4a37d6ffdf76507406d5830372', '[\"*\"]', NULL, NULL, '2024-11-28 16:28:07', '2024-11-28 16:28:07'),
(861, 'App\\Models\\Student', 285, 'API TOKEN', '93e517ce5234a70fbaee861798832a8b6d3a5f8b6d34d32ea8474fa98891da86', '[\"*\"]', NULL, NULL, '2024-11-28 17:03:33', '2024-11-28 17:03:33'),
(862, 'App\\Models\\Student', 286, 'API TOKEN', '6a1f0995ca81ea30bf591cdca6f80f0b2473a156dc7d4da8b061f1980890449c', '[\"*\"]', NULL, NULL, '2024-11-28 17:11:44', '2024-11-28 17:11:44'),
(863, 'App\\Models\\Student', 287, 'API TOKEN', '0bec6234b5d427459fe132b9de8e5e3b4ce729ec6f6ae579a0e77ba1e77b0596', '[\"*\"]', NULL, NULL, '2024-11-28 17:41:02', '2024-11-28 17:41:02'),
(864, 'App\\Models\\Student', 288, 'API TOKEN', '8def9220bd973aeff857e59f78dda9df432ed9c7b7f914ea44edfbb16046b160', '[\"*\"]', NULL, NULL, '2024-11-28 18:03:23', '2024-11-28 18:03:23'),
(865, 'App\\Models\\Student', 289, 'API TOKEN', 'c8372d3199645879489e1c202c25b515a017d8b4565875c03724b3810ea2f796', '[\"*\"]', NULL, NULL, '2024-11-28 18:50:03', '2024-11-28 18:50:03'),
(866, 'App\\Models\\Student', 290, 'API TOKEN', '82884d0724de64e782e21984a6d5413fd5f804eae11c1fe35c54566db873ccc6', '[\"*\"]', NULL, NULL, '2024-11-28 20:40:12', '2024-11-28 20:40:12'),
(867, 'App\\Models\\Student', 291, 'API TOKEN', '0eefa8fb0a72d7909060c63ebc79d88b0780a4a3d6844993f1f905c74c52ce3c', '[\"*\"]', NULL, NULL, '2024-11-28 20:44:09', '2024-11-28 20:44:09'),
(868, 'App\\Models\\Student', 292, 'API TOKEN', 'e429440ff5a444a32fb0f9b5f05708863821c8417799c6c2e385ce742e1a5d05', '[\"*\"]', NULL, NULL, '2024-11-28 21:25:03', '2024-11-28 21:25:03'),
(869, 'App\\Models\\Student', 293, 'API TOKEN', '292aca8229fda678f4924c9c223e0feeb481ceaea49c755425805319ecda5d09', '[\"*\"]', NULL, NULL, '2024-11-28 21:37:07', '2024-11-28 21:37:07'),
(870, 'App\\Models\\Student', 294, 'API TOKEN', '7be0d16508835c5853f913d05f79ff9e73c80ad0b35f3853a46fde1bf7d56186', '[\"*\"]', NULL, NULL, '2024-11-28 22:51:16', '2024-11-28 22:51:16'),
(871, 'App\\Models\\Student', 295, 'API TOKEN', '506ccb8bb15f5e343b8824c910e4f6eeff4b20990c027eb2e5b85dbcb5440997', '[\"*\"]', NULL, NULL, '2024-11-29 01:07:23', '2024-11-29 01:07:23'),
(872, 'App\\Models\\Student', 296, 'API TOKEN', 'c832a7d96ce70374ac93486db64899fc2e55fd1b457a15603bf77bc8723a5542', '[\"*\"]', NULL, NULL, '2024-11-29 11:50:45', '2024-11-29 11:50:45'),
(873, 'App\\Models\\Student', 285, '01016014670', '86734985c7485047657ce006c272737860d747652c5360186786f338a0bd5f34', '[\"student\"]', '2024-12-04 22:18:59', NULL, '2024-11-29 13:05:21', '2024-12-04 22:18:59'),
(874, 'App\\Models\\Student', 297, 'API TOKEN', 'a1a5995478a9d797d150207a2da3d7ac780163cd8f3801201b937dfd68583cf7', '[\"*\"]', NULL, NULL, '2024-11-29 13:11:46', '2024-11-29 13:11:46'),
(875, 'App\\Models\\Student', 273, '01018828058', 'e7efe912afff144084ccbc161bcf6b34c8bd72952bae34f213340ed27d71e10f', '[\"student\"]', '2024-11-30 16:56:23', NULL, '2024-11-29 13:42:32', '2024-11-30 16:56:23'),
(876, 'App\\Models\\Student', 298, 'API TOKEN', '5b300bade83abc44b9822cf0c8b845945353794660ea0a7b004728e1aff9449c', '[\"*\"]', NULL, NULL, '2024-11-29 13:48:20', '2024-11-29 13:48:20'),
(877, 'App\\Models\\Student', 277, '01068293097', '7f91512dab46c25f9d98609a0ac0a35fa5bcc6d9a761dda805b31d9c41cfe54f', '[\"student\"]', '2024-12-04 19:29:55', NULL, '2024-11-29 13:48:57', '2024-12-04 19:29:55'),
(878, 'App\\Models\\Student', 299, 'API TOKEN', '586327abe30e82c6559a1410e0f4b64ab94e94062713d9f51c3d68c50728fb7f', '[\"*\"]', NULL, NULL, '2024-11-29 13:50:30', '2024-11-29 13:50:30'),
(879, 'App\\Models\\Student', 289, '01090839039', 'c048b216e56a5327f0b570c5dc6586eea63aa8e6278492ce2509c68087e7b749', '[\"student\"]', '2024-12-04 19:27:36', NULL, '2024-11-29 14:49:47', '2024-12-04 19:27:36'),
(880, 'App\\Models\\Student', 300, 'API TOKEN', 'c0ae492e0190a4bd197c21134f6175cd8e6667a3377f641f98be32406061da8b', '[\"*\"]', NULL, NULL, '2024-11-29 15:01:49', '2024-11-29 15:01:49'),
(881, 'App\\Models\\Student', 301, 'API TOKEN', '3b34aa2aa344060233def1e65cd243b9cf8dca25206b8ec60e63650c39d916ef', '[\"*\"]', NULL, NULL, '2024-11-29 15:13:23', '2024-11-29 15:13:23'),
(882, 'App\\Models\\Student', 288, '01061722499', '23cf93337db50eb5ef9a7fa3c6f339c90c3e3f2353185ea7329c3bbe9ad3e3bd', '[\"student\"]', '2024-12-05 00:11:54', NULL, '2024-11-29 15:14:05', '2024-12-05 00:11:54'),
(883, 'App\\Models\\Student', 273, '01018828058', '2511ee7cff3b70086613212ec186d097b3da33f8e927f62876dabeb5b541db01', '[\"student\"]', '2024-11-29 16:44:30', NULL, '2024-11-29 15:46:34', '2024-11-29 16:44:30'),
(884, 'App\\Models\\Student', 302, 'API TOKEN', '85018f2d9c37e08bbda72fa9748c92d6d45fabec11a5a9f2908adcc188c0ffeb', '[\"*\"]', NULL, NULL, '2024-11-29 16:15:39', '2024-11-29 16:15:39'),
(885, 'App\\Models\\Student', 292, '01158629083', '00e503ec291b231a714f51f457b9ac9ebb8000fdf38775db273f3cd437785bfb', '[\"student\"]', '2024-11-29 21:59:55', NULL, '2024-11-29 16:30:16', '2024-11-29 21:59:55'),
(886, 'App\\Models\\Student', 303, 'API TOKEN', 'c461a198f21c7a4b20f4b10d40947025476cc299ccd7a3c7e85fb74e20dd7d51', '[\"*\"]', NULL, NULL, '2024-11-29 16:49:57', '2024-11-29 16:49:57'),
(887, 'App\\Models\\Student', 304, 'API TOKEN', 'e2a6af951658643cc61095984945843d483bb7dc5ec58fae4e00d2131ecaf71f', '[\"*\"]', NULL, NULL, '2024-11-29 17:09:31', '2024-11-29 17:09:31'),
(888, 'App\\Models\\Student', 305, 'API TOKEN', '99530241eb050254ddf00bfcc291964586a45ddbace33f9afc571f8d58b01a4c', '[\"*\"]', NULL, NULL, '2024-11-29 17:13:20', '2024-11-29 17:13:20'),
(889, 'App\\Models\\Student', 306, 'API TOKEN', '7cef96cc026388c8f57e5601db1d128c55c682abfe1ff2bebf7f4150bb932aac', '[\"*\"]', NULL, NULL, '2024-11-29 17:14:26', '2024-11-29 17:14:26'),
(890, 'App\\Models\\Student', 307, 'API TOKEN', '255f3d938423eb6a42654ba2bed80257022f12cea64f3efa85f8c8be8c3bb8dc', '[\"*\"]', NULL, NULL, '2024-11-29 17:22:35', '2024-11-29 17:22:35'),
(891, 'App\\Models\\Student', 308, 'API TOKEN', 'cc39a798092b3807fb48f90712f7f93340525f026c800befe4329d4480bbbbb8', '[\"*\"]', NULL, NULL, '2024-11-29 17:22:40', '2024-11-29 17:22:40'),
(892, 'App\\Models\\Student', 309, 'API TOKEN', 'a4dc9a63e749c061142df19a0183d4021568ca9346806dc8e7748e14b30b69f5', '[\"*\"]', NULL, NULL, '2024-11-29 17:31:40', '2024-11-29 17:31:40'),
(893, 'App\\Models\\Student', 310, 'API TOKEN', '69a43c9d2c158274d5c2cba95d18ab0e1f1027d66a41a85a6690cf06e83a085f', '[\"*\"]', NULL, NULL, '2024-11-29 17:42:26', '2024-11-29 17:42:26'),
(894, 'App\\Models\\Student', 292, '01158629083', 'cf6b8eb9144741c28de4cf105f680ce3d6d49738a409ee23892e0f9b41afa44d', '[\"student\"]', '2024-11-29 18:46:52', NULL, '2024-11-29 18:25:22', '2024-11-29 18:46:52'),
(895, 'App\\Models\\Student', 311, 'API TOKEN', '92b826dab61035a4e79be958d1b3860817724f77283f6b41b75970bd8f9c7737', '[\"*\"]', NULL, NULL, '2024-11-29 18:26:47', '2024-11-29 18:26:47'),
(896, 'App\\Models\\Student', 312, 'API TOKEN', '09600e22eade317f5b05511ae50083fdbb77be3f630709dc5521976f0260613b', '[\"*\"]', NULL, NULL, '2024-11-29 18:33:59', '2024-11-29 18:33:59'),
(897, 'App\\Models\\Student', 313, 'API TOKEN', 'a0cd23e05837ee7958381822817f3b798f46044c7867a1bc66ebe7b13bd02646', '[\"*\"]', NULL, NULL, '2024-11-29 18:42:41', '2024-11-29 18:42:41'),
(898, 'App\\Models\\Student', 314, 'API TOKEN', '9c78b6e2b73f85765317fe3294c1da1f36f2a0ce74c0ec15781dbe20198b1501', '[\"*\"]', NULL, NULL, '2024-11-29 18:58:36', '2024-11-29 18:58:36'),
(899, 'App\\Models\\Student', 315, 'API TOKEN', '160f12b3f3c7c455dee1d2c95fe3430827f346901ddbd13b3db7c17195141e4b', '[\"*\"]', NULL, NULL, '2024-11-29 19:17:04', '2024-11-29 19:17:04'),
(900, 'App\\Models\\Student', 316, 'API TOKEN', '0eb94c57ff535dc15d2b7fda91f89025e216f573e50046048a8faf353c88b941', '[\"*\"]', NULL, NULL, '2024-11-29 21:24:45', '2024-11-29 21:24:45'),
(901, 'App\\Models\\Student', 292, '01158629083', 'f06d431537f34292af7c5ce9d964b39ac80827d535d84f38a90e67e609987ae3', '[\"student\"]', '2024-12-02 20:51:46', NULL, '2024-11-29 22:00:24', '2024-12-02 20:51:46'),
(902, 'App\\Models\\Student', 281, '01143881128', 'd5db6287d12f54b685a69929d7ab0ecdda20a6a5bb624db9d56376ea1597b5ae', '[\"student\"]', '2024-12-01 19:43:20', NULL, '2024-11-29 22:09:56', '2024-12-01 19:43:20'),
(903, 'App\\Models\\Student', 276, '01118898879', 'ea03bd605e77a4f7e1e18acaee08204e4740d8bf22b244d766a0cb71b01d806e', '[\"student\"]', '2024-12-03 22:52:22', NULL, '2024-11-29 22:17:56', '2024-12-03 22:52:22'),
(904, 'App\\Models\\Student', 317, 'API TOKEN', 'a2a4707a351bf7955ac4a5fd8465cbb95f19c60f7677cdd4859e9331224e680a', '[\"*\"]', NULL, NULL, '2024-11-29 22:18:10', '2024-11-29 22:18:10'),
(905, 'App\\Models\\Student', 294, '01065020969', '1cf08c2189cd1ba5d27fd7079f25bb8fa0747784243719ef3904461e9e49ea64', '[\"student\"]', '2024-11-29 22:27:15', NULL, '2024-11-29 22:25:36', '2024-11-29 22:27:15'),
(906, 'App\\Models\\Student', 276, '01118898879', 'b3a23529e3ff0feefa2e09f2debd2eb1808cc8a5d91d989e24f5ba449ed6efb8', '[\"student\"]', '2024-12-03 02:28:50', NULL, '2024-11-29 23:51:03', '2024-12-03 02:28:50'),
(907, 'App\\Models\\Student', 318, 'API TOKEN', '4fccb618a421452091b4b49daf0e63fc8ea7412982fe2a35c506bffec65f5161', '[\"*\"]', NULL, NULL, '2024-11-30 09:43:37', '2024-11-30 09:43:37'),
(908, 'App\\Models\\Student', 319, 'API TOKEN', '55c33af42ecc0db24b129f91170ea85db52050c11cdf56f0f7304385658deaad', '[\"*\"]', NULL, NULL, '2024-11-30 10:17:18', '2024-11-30 10:17:18'),
(909, 'App\\Models\\Student', 320, 'API TOKEN', '0cb65daaed65f00411585654b7bce92b855b051527f7c5465eefed3bf30358bf', '[\"*\"]', NULL, NULL, '2024-11-30 10:27:01', '2024-11-30 10:27:01'),
(910, 'App\\Models\\Student', 321, 'API TOKEN', '575ce1eaaf1fa0aa5dd606d387619e6229cb3cafd0d6b8b0015f88e8a28da67e', '[\"*\"]', NULL, NULL, '2024-11-30 10:48:28', '2024-11-30 10:48:28'),
(911, 'App\\Models\\Student', 322, 'API TOKEN', 'c47d4374f204b36ac0493b896de2c670baab177899fd492f767d85bed47343a1', '[\"*\"]', NULL, NULL, '2024-11-30 12:44:32', '2024-11-30 12:44:32'),
(912, 'App\\Models\\Student', 317, '01555180361', '8a4bfe52918b3224bf241d297f1e40f0497040431013b31dfb00881fa97a0eac', '[\"student\"]', '2024-11-30 13:48:20', NULL, '2024-11-30 13:20:36', '2024-11-30 13:48:20'),
(913, 'App\\Models\\Student', 323, 'API TOKEN', 'f675d2395b3c7a0aa5221b43bb92b85b21fb8643c6a177d2d70bf29329143e7b', '[\"*\"]', NULL, NULL, '2024-11-30 13:34:41', '2024-11-30 13:34:41'),
(914, 'App\\Models\\Student', 298, '01066624500', '68d9582f7dfbe1ea784d904dadbeb1592d66536ef94731e61f04717db7d6c550', '[\"student\"]', '2024-12-06 20:43:48', NULL, '2024-11-30 13:53:01', '2024-12-06 20:43:48'),
(915, 'App\\Models\\Student', 322, '01012430090', '4e161b51bcd91acf1720f71ca06d125aa24396cf2bd52d02e8fa5865f9cf358a', '[\"student\"]', '2024-11-30 22:29:35', NULL, '2024-11-30 13:54:26', '2024-11-30 22:29:35'),
(916, 'App\\Models\\Student', 324, 'API TOKEN', 'd306e65b9d0125fed3e957130d7cf55a183a39622cb46f08adeb8a3ad30e4077', '[\"*\"]', NULL, NULL, '2024-11-30 13:55:44', '2024-11-30 13:55:44'),
(917, 'App\\Models\\Student', 300, '01013311446', 'db240d498ab0212b23be083c83e19975684124329bb0beaa4ac34d332612093f', '[\"student\"]', '2024-11-30 15:21:35', NULL, '2024-11-30 13:59:50', '2024-11-30 15:21:35'),
(918, 'App\\Models\\Student', 325, 'API TOKEN', '765a4c090f22141eef945aaa94f7cae8fd0a4ec12aac37acd0e7104f568e23e4', '[\"*\"]', NULL, NULL, '2024-11-30 14:17:39', '2024-11-30 14:17:39'),
(919, 'App\\Models\\Student', 318, '01220356958', '5e46f5b78bbbadb159152e1d5f417f4bf6c37ea1ea329f281007f655bc82152f', '[\"student\"]', '2024-12-05 06:11:57', NULL, '2024-11-30 14:36:16', '2024-12-05 06:11:57'),
(920, 'App\\Models\\Student', 326, 'API TOKEN', '7836de16d44c59e266108048ea1c4176bd8385e19f32620f02dc6667c17bbee9', '[\"*\"]', NULL, NULL, '2024-11-30 15:34:31', '2024-11-30 15:34:31'),
(921, 'App\\Models\\Student', 327, 'API TOKEN', '6b6d7dcdfea59f7829acffe5445abae714f62fbb863a958f429f58cc67fbf709', '[\"*\"]', NULL, NULL, '2024-11-30 15:49:00', '2024-11-30 15:49:00'),
(922, 'App\\Models\\Student', 304, '01019551233', '7368e659f08134c8a84c2a1a5da1661165b0a99d38a965ac4d19a54ca12f6846', '[\"student\"]', '2024-11-30 16:13:05', NULL, '2024-11-30 16:11:44', '2024-11-30 16:13:05'),
(923, 'App\\Models\\Student', 309, '01019811348', 'bfdbdc58fa4bf29cbc1dd8a7a15a631bc0f3b40063d64088c7342cf10c04425d', '[\"student\"]', '2024-11-30 18:16:19', NULL, '2024-11-30 16:21:16', '2024-11-30 18:16:19'),
(924, 'App\\Models\\Student', 310, '01019590264', '3e68856178e2c68b88b1e27fce110375bd521274c6df6b0ead166ad676975bd4', '[\"student\"]', '2024-12-03 06:15:36', NULL, '2024-11-30 16:47:18', '2024-12-03 06:15:36'),
(925, 'App\\Models\\Student', 328, 'API TOKEN', '5d7a7bdc494323ea9fdcd9404e1ef20de638c1084cc3e499928dedfadbb1d5e8', '[\"*\"]', NULL, NULL, '2024-11-30 16:52:13', '2024-11-30 16:52:13'),
(926, 'App\\Models\\Student', 293, '01001161542', '226f67bd4e48e25421870ec41af1e745e9e01b67a63a0794cebd9eea7ca55f4c', '[\"student\"]', '2024-12-05 00:07:55', NULL, '2024-11-30 17:21:33', '2024-12-05 00:07:55'),
(927, 'App\\Models\\Student', 329, 'API TOKEN', '497ba2ae0f9a56a8fa8e4216bad21b64b50406327c0b5ca8d75295efaa22971f', '[\"*\"]', NULL, NULL, '2024-11-30 19:45:15', '2024-11-30 19:45:15'),
(928, 'App\\Models\\Student', 296, '01024505188', '0eedbca24fbe935ec2d585b0f9041a617bc56875a983489e25c5204ef4347941', '[\"student\"]', '2024-12-01 18:02:20', NULL, '2024-11-30 19:54:36', '2024-12-01 18:02:20'),
(929, 'App\\Models\\Student', 273, '01018828058', 'c5a6bb2e37e843dd13cb2a44da5ba34544fb1690faf9df86fccc776f98914958', '[\"student\"]', '2024-11-30 20:05:13', NULL, '2024-11-30 20:04:50', '2024-11-30 20:05:13'),
(930, 'App\\Models\\Student', 318, '01220356958', '09fd4ba9d57be802d497bac5a5127d61298e86b8bf978fc607400624088900f7', '[\"student\"]', '2024-12-05 06:10:50', NULL, '2024-11-30 20:13:34', '2024-12-05 06:10:50'),
(931, 'App\\Models\\Student', 318, '01220356958', '22ad3fddd821e87bf75535722cc9bafb2471d97e804a8ad72c37342f9df80845', '[\"student\"]', '2024-11-30 20:37:26', NULL, '2024-11-30 20:19:33', '2024-11-30 20:37:26'),
(932, 'App\\Models\\Student', 330, 'API TOKEN', '70fde38d34b7adbc2a2956c3f7781bbb59680918d2bacb4e3a5f454fbb1968a2', '[\"*\"]', NULL, NULL, '2024-11-30 20:24:25', '2024-11-30 20:24:25'),
(933, 'App\\Models\\Student', 331, 'API TOKEN', '2930cfbbbaf430b95934a699a440cd8d1048ff1e77ab5547c21261741da87e3c', '[\"*\"]', NULL, NULL, '2024-11-30 21:44:32', '2024-11-30 21:44:32'),
(934, 'App\\Models\\Student', 274, '01228739109', '2cc18319015301b66e5dc4410fb28064eee30d12c64fba75ae8cbd24c6a93cb5', '[\"student\"]', '2024-11-30 21:56:03', NULL, '2024-11-30 21:51:04', '2024-11-30 21:56:03'),
(935, 'App\\Models\\Student', 274, '01228739109', '736ae5b0faf7d7f6861ab2240ac6458864a9d147601b67d15383bc3434d2008a', '[\"student\"]', '2024-12-04 13:42:38', NULL, '2024-11-30 22:00:48', '2024-12-04 13:42:38'),
(936, 'App\\Models\\Student', 332, 'API TOKEN', '92f487afe5334640425e07a1d95bac609c1dc9e01b3ead4b8e54d922fe4744f5', '[\"*\"]', NULL, NULL, '2024-11-30 22:52:40', '2024-11-30 22:52:40'),
(937, 'App\\Models\\Student', 277, '01068293097', 'ed525d84e201cda742edf4657a22045c9674bad4aed52bd6dfae6260b32ceee1', '[\"student\"]', '2024-12-04 22:03:06', NULL, '2024-11-30 23:15:01', '2024-12-04 22:03:06'),
(938, 'App\\Models\\Student', 315, '01017726025', 'a8f9761c512d8ddccc62b27a64b37eb23cf40f36937b04e4f8ec304b5e44fc24', '[\"student\"]', '2024-12-04 15:50:43', NULL, '2024-12-01 08:08:35', '2024-12-04 15:50:43'),
(939, 'App\\Models\\Admin', 1, 'Prodigy', 'bd2ef687e60d2bf427ecdc7d79698a0caef0ad275202b7fb8a7d01ebcb407091', '[\"admin\"]', '2024-12-01 18:25:27', NULL, '2024-12-01 08:41:45', '2024-12-01 18:25:27'),
(940, 'App\\Models\\Student', 333, 'API TOKEN', '5409b53acf6d6c1418cdf0a9ac3aa6d4a051efe8f1527c59f3c9f94279e0889d', '[\"*\"]', NULL, NULL, '2024-12-01 08:48:22', '2024-12-01 08:48:22'),
(941, 'App\\Models\\Student', 333, '01024273333', '6edfc2ae4c1042eb94b92c2e56ad56a496ca1904df394e813784dc2de0ccc46c', '[\"student\"]', '2024-12-01 08:52:55', NULL, '2024-12-01 08:48:44', '2024-12-01 08:52:55'),
(942, 'App\\Models\\Student', 329, '01030733380', 'ad83f4ea36857821b3a6c2473f27c06b0e98ab1c814c2fb35e8d6973be7f0491', '[\"student\"]', '2024-12-02 18:59:46', NULL, '2024-12-01 12:32:48', '2024-12-02 18:59:46'),
(943, 'App\\Models\\Student', 285, '01016014670', '59141f4569a81dc366f08d1871392d47e5a10606f08e7f209e0987d617544b16', '[\"student\"]', '2024-12-02 18:56:52', NULL, '2024-12-01 14:44:49', '2024-12-02 18:56:52'),
(944, 'App\\Models\\Student', 271, '01124113266', 'af643d63c4d78f642adf49a9062d65b9cff73b1352710ef252c63a60ecace616', '[\"student\"]', '2024-12-01 21:24:47', NULL, '2024-12-01 15:46:09', '2024-12-01 21:24:47'),
(945, 'App\\Models\\Student', 301, '01033199523', '20105f622247fe5495f37f81d55240f58ac77b1e5cad201428438ea493009b5b', '[\"student\"]', '2024-12-03 22:34:02', NULL, '2024-12-01 16:35:48', '2024-12-03 22:34:02'),
(946, 'App\\Models\\Student', 334, 'API TOKEN', '246eb4e6315b5c344e5709560affb4665e5476a04e00fdcf840f60174118944a', '[\"*\"]', NULL, NULL, '2024-12-01 17:45:24', '2024-12-01 17:45:24'),
(947, 'App\\Models\\Student', 335, 'API TOKEN', 'd9ee2b13c07f28bbfd4290fa1ab88108ea91808f0d50c011f38c47eada6d83fb', '[\"*\"]', NULL, NULL, '2024-12-01 17:49:52', '2024-12-01 17:49:52'),
(948, 'App\\Models\\Student', 336, 'API TOKEN', 'e205b39479e941d29a4d16499a5b6c3633dfb704f6420e55c3d0f8de2597dbb5', '[\"*\"]', NULL, NULL, '2024-12-01 18:07:24', '2024-12-01 18:07:24'),
(949, 'App\\Models\\Student', 337, 'API TOKEN', '6f7dc60c2908a985f551c8afddcc95daa543544053358bd9ad848d88651e97d7', '[\"*\"]', NULL, NULL, '2024-12-01 18:13:51', '2024-12-01 18:13:51'),
(950, 'App\\Models\\Student', 332, '01014531415', 'cdbd9522aa14952feee29bf927bb7392f4b3e7c81cc4eb091a569402f80265e8', '[\"student\"]', '2024-12-02 00:51:02', NULL, '2024-12-01 18:40:07', '2024-12-02 00:51:02'),
(951, 'App\\Models\\Student', 338, 'API TOKEN', 'e9e68abdfb96d4e11e73b5f25ec02efe4cdcb02d15fc73b9408b4fb108b7768c', '[\"*\"]', NULL, NULL, '2024-12-01 18:49:09', '2024-12-01 18:49:09'),
(952, 'App\\Models\\Admin', 1, 'prodigy', '6fd2ecc07d97b9684b8ac073c9d3be7a15ad54a4aa3184fe6399d11173adaa15', '[\"admin\"]', '2024-12-01 19:34:07', NULL, '2024-12-01 18:57:42', '2024-12-01 19:34:07'),
(953, 'App\\Models\\Student', 338, '01001234567', '47c6e8d8e95721df205d010ad6a264201e00ed956376acb43d73e8c245de0c01', '[\"student\"]', '2024-12-01 19:00:18', NULL, '2024-12-01 18:59:49', '2024-12-01 19:00:18'),
(954, 'App\\Models\\Student', 339, 'API TOKEN', 'e3185bde73dae69c726bc1c19bd9d4328296c5a79ee425e453aaa18c67fbe7c7', '[\"*\"]', NULL, NULL, '2024-12-01 19:05:45', '2024-12-01 19:05:45'),
(955, 'App\\Models\\Student', 273, '01018828058', 'c35058c877c11ad718ffc97b262d801f181964cde0de4f01254ec74f571e2c53', '[\"student\"]', '2024-12-05 20:32:52', NULL, '2024-12-01 19:21:03', '2024-12-05 20:32:52'),
(956, 'App\\Models\\Student', 340, 'API TOKEN', '025ee964ecf6f773e36f3f8f4c72a0d373cc74272471d6f7142c212bc92fa67b', '[\"*\"]', NULL, NULL, '2024-12-01 19:36:10', '2024-12-01 19:36:10'),
(957, 'App\\Models\\Admin', 1, 'Prodigy', '98c593aee6b6c11596d9012aa6274eea821423f1d607a9ae809ebf620fa162aa', '[\"admin\"]', '2024-12-07 17:18:34', NULL, '2024-12-01 19:37:24', '2024-12-07 17:18:34'),
(958, 'App\\Models\\Student', 340, '01001234567', '40c4be2fd428bac701e8018be10a0008328e0749ce93eefcc5812de222c26d93', '[\"student\"]', '2024-12-01 20:10:25', NULL, '2024-12-01 19:38:02', '2024-12-01 20:10:25'),
(959, 'App\\Models\\Student', 331, '01554231344', '9f252d26f2c347a3651f7aba9a7671ca15c1d580672c35c6e467b4ab5cb77b16', '[\"student\"]', '2024-12-01 20:07:26', NULL, '2024-12-01 20:03:41', '2024-12-01 20:07:26'),
(960, 'App\\Models\\Student', 341, 'API TOKEN', '88bd82a46f6af977ad5194c53dd007f4e617233d5d941d05f89565aafaa83a84', '[\"*\"]', NULL, NULL, '2024-12-01 20:48:54', '2024-12-01 20:48:54'),
(961, 'App\\Models\\Student', 342, 'API TOKEN', '3c8f182b32ee12777d0f7485fb96dd525edf01bb05c835fab786ca359e33ef8d', '[\"*\"]', NULL, NULL, '2024-12-01 20:49:24', '2024-12-01 20:49:24'),
(962, 'App\\Models\\Student', 326, '01200413567', '32c65ad92d0e2ebed4dfb596842036b841d1c236e6ce7ade9fc9d29d37abe183', '[\"student\"]', '2024-12-07 07:59:16', NULL, '2024-12-01 20:52:54', '2024-12-07 07:59:16'),
(963, 'App\\Models\\Student', 343, 'API TOKEN', '28f1e2841a5c7d36e6e204d0a14310897ebab19f161f237c6441f02c30a23b09', '[\"*\"]', NULL, NULL, '2024-12-01 22:15:20', '2024-12-01 22:15:20'),
(964, 'App\\Models\\Student', 344, 'API TOKEN', 'ab87867f97a4717313acf1f5c5c59584362e5ccabe2127ee52171c89e11893ec', '[\"*\"]', NULL, NULL, '2024-12-01 22:16:51', '2024-12-01 22:16:51'),
(965, 'App\\Models\\Student', 306, '01080895502', '743e894eb664a6c0b90d1d4ae7363ff3916cf7c5eab2b813ec1a9131971423c8', '[\"student\"]', '2024-12-01 22:48:23', NULL, '2024-12-01 22:46:58', '2024-12-01 22:48:23'),
(966, 'App\\Models\\Student', 306, '01080895502', 'dbf927c72cea3a98f60111ca28730ccd50719c3f0c78b5262c902787739a4281', '[\"student\"]', '2024-12-04 18:00:44', NULL, '2024-12-01 22:48:44', '2024-12-04 18:00:44'),
(967, 'App\\Models\\Student', 328, '01024324738', 'eb53e85d885077378e27835ac1b717804a58130ea7617ee3b0a29bf909412f72', '[\"student\"]', '2024-12-02 08:23:31', NULL, '2024-12-02 08:22:57', '2024-12-02 08:23:31'),
(968, 'App\\Models\\Student', 337, '01033720053', '5242e8cdd0a101960e21f7490d922a884ee3be7aeca12fc924539f545dcc172e', '[\"student\"]', '2024-12-02 17:43:49', NULL, '2024-12-02 17:42:08', '2024-12-02 17:43:49'),
(969, 'App\\Models\\Student', 337, '01033720053', 'e779465ccc545d9c056ee2548a03f71d1202435aa930cfe40e570698f8e8a633', '[\"student\"]', '2024-12-04 17:25:19', NULL, '2024-12-02 17:44:53', '2024-12-04 17:25:19'),
(970, 'App\\Models\\Student', 345, 'API TOKEN', '7aae79d89642f452b44b610ef2f2cdcb3d79a9d8259f2fe3dd52859d00a225e0', '[\"*\"]', NULL, NULL, '2024-12-02 17:51:23', '2024-12-02 17:51:23'),
(971, 'App\\Models\\Student', 335, '01122026266', 'd5fa4880b2eb80e09c66eeb29c4a11307848102cd69c1548014af9c21abf8769', '[\"student\"]', '2024-12-02 18:57:18', NULL, '2024-12-02 18:18:16', '2024-12-02 18:57:18'),
(972, 'App\\Models\\Student', 335, '01122026266', '4a0bc4885976a038548e585ec31fa29d49e8264cd0054e8dea19d8f97bb9db10', '[\"student\"]', '2024-12-02 20:21:47', NULL, '2024-12-02 18:58:58', '2024-12-02 20:21:47'),
(973, 'App\\Models\\Student', 328, '01024324738', '841a48d1cacce19b776adce18d67401f0fef5b82b29b12219113fb345d5f06bc', '[\"student\"]', '2024-12-02 20:35:40', NULL, '2024-12-02 19:49:20', '2024-12-02 20:35:40'),
(974, 'App\\Models\\Student', 335, '01122026266', 'e908fbcebb0915fbd6cf059d5ad950ef04855cc40772790246acda70ebb823ce', '[\"student\"]', '2024-12-02 20:31:59', NULL, '2024-12-02 20:26:53', '2024-12-02 20:31:59'),
(975, 'App\\Models\\Student', 335, '01122026266', '2e0afcc0431b7f0b69f2f930cdd83bb2f40b37ee450718c7c67be7964de5bab8', '[\"student\"]', '2024-12-04 19:40:13', NULL, '2024-12-02 20:32:44', '2024-12-04 19:40:13'),
(976, 'App\\Models\\Student', 306, '01080895502', '3049d435b4c7f604ede029238c1819cdf4dda3a8fdcf56ab50b903a84b10dcce', '[\"student\"]', '2024-12-04 21:22:56', NULL, '2024-12-02 21:56:14', '2024-12-04 21:22:56'),
(977, 'App\\Models\\Student', 280, '01017757002', '053e262b4705f4a4121664d4e4a57815700f2177bbe68bdc986ad5fab19144e5', '[\"student\"]', '2024-12-04 00:37:25', NULL, '2024-12-02 23:34:10', '2024-12-04 00:37:25'),
(978, 'App\\Models\\Student', 309, '01019811348', 'c4d98ad9fff6fcd0c6683cd292e61ef0557a60c9da4da0b9e2e857ad150ebf54', '[\"student\"]', '2024-12-03 16:00:46', NULL, '2024-12-03 06:15:54', '2024-12-03 16:00:46'),
(979, 'App\\Models\\Student', 271, '01124113266', '65cd1f91218dc3138392380c4ef5fe8e0d07ef8327cff4f5df5a60b949f03bbc', '[\"student\"]', '2024-12-03 19:16:57', NULL, '2024-12-03 18:54:17', '2024-12-03 19:16:57'),
(980, 'App\\Models\\Student', 346, 'API TOKEN', '24442c95e4faaccb3fb11579222903a258f02d13d54c35f10b329e1889da6803', '[\"*\"]', NULL, NULL, '2024-12-03 19:19:22', '2024-12-03 19:19:22'),
(981, 'App\\Models\\Student', 326, '01200413567', '60884e95933ba18f3a491224ad8b2dcddb383232e222ccfc5d41573434b13540', '[\"student\"]', '2024-12-03 19:31:36', NULL, '2024-12-03 19:31:02', '2024-12-03 19:31:36'),
(982, 'App\\Models\\Student', 326, '01200413567', '4b5dbb8c6e3746c7e92cbcbecb42a9f0f8e1c5652a180c6900f5690ff42371f0', '[\"student\"]', '2024-12-06 16:45:40', NULL, '2024-12-03 19:34:04', '2024-12-06 16:45:40'),
(983, 'App\\Models\\Student', 328, '01024324738', 'f9c877a95f80d469273821b6ea2bd72e2dece37e2fbdee25664a164dd8922089', '[\"student\"]', '2024-12-03 19:40:24', NULL, '2024-12-03 19:39:54', '2024-12-03 19:40:24'),
(984, 'App\\Models\\Student', 347, 'API TOKEN', '0de18d845f6a6556dec32fe0fcd16f835b51631205432b9a40d91d659b5da089', '[\"*\"]', NULL, NULL, '2024-12-04 13:58:04', '2024-12-04 13:58:04'),
(985, 'App\\Models\\Student', 348, 'API TOKEN', '2d1df9ab15532fd0a4de20bfa403670d29f8de4ea2cb8535e3e28218d20dcd83', '[\"*\"]', NULL, NULL, '2024-12-04 14:37:50', '2024-12-04 14:37:50'),
(986, 'App\\Models\\Student', 349, 'API TOKEN', '41c2117b8474e40ce7c27bd1e4e3e9848adb7f6aa4d505c41e1a76da9e11f49c', '[\"*\"]', NULL, NULL, '2024-12-04 14:47:45', '2024-12-04 14:47:45'),
(987, 'App\\Models\\Student', 315, '01017726025', '80555bb5f08c01060664f377654f46453b65de86d0c51304c8f21aeba9a3bcae', '[\"student\"]', '2024-12-04 16:08:27', NULL, '2024-12-04 15:51:21', '2024-12-04 16:08:27'),
(988, 'App\\Models\\Student', 350, 'API TOKEN', '264e086d016444948c5c6ad07d9aecf51e7bb08c445bc298bce348075f545658', '[\"*\"]', NULL, NULL, '2024-12-04 16:00:22', '2024-12-04 16:00:22'),
(989, 'App\\Models\\Student', 315, '01017726025', '3635dc9da76d8592b67fb86f65a4247ca5b6f13106c7a4a8ea39c0f7486cf6d1', '[\"student\"]', '2024-12-04 22:36:15', NULL, '2024-12-04 16:00:25', '2024-12-04 22:36:15'),
(990, 'App\\Models\\Student', 315, '01017726025', 'e06f8cb75984e319b6923b8f9b58a911fc415d86ac2a3260e73253d649675f7c', '[\"student\"]', '2024-12-04 21:12:23', NULL, '2024-12-04 16:08:48', '2024-12-04 21:12:23'),
(991, 'App\\Models\\Student', 348, '01006282378', '03cd53a7bf1f5cb72aeb675b703fafe93801f1ba30c4d2cf139b6cc81d74ce4b', '[\"student\"]', '2024-12-04 18:54:07', NULL, '2024-12-04 16:20:21', '2024-12-04 18:54:07'),
(992, 'App\\Models\\Student', 315, '01017726025', 'a89614afade44763e518f1f9686382fa5a2dd032d2ba6f014d4ead92e98e18e7', '[\"student\"]', '2024-12-04 17:06:57', NULL, '2024-12-04 17:06:48', '2024-12-04 17:06:57'),
(993, 'App\\Models\\Student', 351, 'API TOKEN', 'e9dd092390edcd79074c86732fb932023b2502e8701b74d407cefbfb1762464c', '[\"*\"]', NULL, NULL, '2024-12-04 17:38:22', '2024-12-04 17:38:22'),
(994, 'App\\Models\\Student', 346, '01553661592', 'dd35ae92d610ca58b237486eef9df79ea500ac715c6e96763c73431d2fc12fd8', '[\"student\"]', '2024-12-04 17:46:16', NULL, '2024-12-04 17:40:02', '2024-12-04 17:46:16'),
(995, 'App\\Models\\Student', 352, 'API TOKEN', 'c4085cd80f54ecb66fa1a1e6b9d6c0d36c57d22f8472e1971a32176138076c3a', '[\"*\"]', NULL, NULL, '2024-12-04 17:49:31', '2024-12-04 17:49:31'),
(996, 'App\\Models\\Student', 353, 'API TOKEN', '389a8b34f374966460d3f5408008037933d9feffc5f4b375da88ef784bed1976', '[\"*\"]', NULL, NULL, '2024-12-04 17:52:11', '2024-12-04 17:52:11'),
(997, 'App\\Models\\Student', 354, 'API TOKEN', '61fd9cec3c4531883dbbafbc9b1a41ea65c7e49243ecded2cfb983589b7e8270', '[\"*\"]', NULL, NULL, '2024-12-04 18:00:54', '2024-12-04 18:00:54'),
(998, 'App\\Models\\Student', 355, 'API TOKEN', '2753f9601106a5a6aab71673d00261beca6f04a0657e5ededf3d33fadb410973', '[\"*\"]', NULL, NULL, '2024-12-04 18:09:03', '2024-12-04 18:09:03'),
(999, 'App\\Models\\Student', 356, 'API TOKEN', '40ccc5476259c738ff86d74d14ec4aac7fbf0302e7e5abcde32a6d69279566b0', '[\"*\"]', NULL, NULL, '2024-12-04 18:15:07', '2024-12-04 18:15:07'),
(1000, 'App\\Models\\Student', 292, '01158629083', 'ab2c69d8e79a0ed0c15b56595b35f519df8ffaea2aaa1a427c17cc84a4e6a4f5', '[\"student\"]', '2024-12-04 20:22:51', NULL, '2024-12-04 18:25:59', '2024-12-04 20:22:51'),
(1001, 'App\\Models\\Student', 352, '01146694710', 'aa7136cd491dd9f0d527e1f424ca53cae2bfda0e611c88b18bdcbc6546a42f5a', '[\"student\"]', '2024-12-04 18:53:17', NULL, '2024-12-04 18:50:51', '2024-12-04 18:53:17'),
(1002, 'App\\Models\\Student', 356, '01061150541', '986a662e9032247b0e9edb9394cb9bc8f5001f7b695791b29bc0e0c75b552b50', '[\"student\"]', '2024-12-08 21:49:11', NULL, '2024-12-04 18:58:35', '2024-12-08 21:49:11'),
(1003, 'App\\Models\\Student', 305, '01000540106', 'adbdee053490c6d595262791a629ddbf6d4f424a4f50c415ae3f944d99b9cc28', '[\"student\"]', '2024-12-08 22:27:31', NULL, '2024-12-04 19:15:40', '2024-12-08 22:27:31'),
(1004, 'App\\Models\\Student', 353, '01095252021', '37dd99a41715b2a27f39dbc20567d4a847338eeb8d1b840a81e0125db8592bef', '[\"student\"]', '2024-12-04 19:33:45', NULL, '2024-12-04 19:32:32', '2024-12-04 19:33:45'),
(1005, 'App\\Models\\Student', 357, 'API TOKEN', 'f1facca4ce614650aaf49e1636d480c042e421e77ee530ffc8f860a2ca7375ae', '[\"*\"]', NULL, NULL, '2024-12-04 19:45:07', '2024-12-04 19:45:07');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1006, 'App\\Models\\Student', 358, 'API TOKEN', 'd92f221ab6d2037ad829667f7fa0fa8d82e6733d15ac1e24dc1cf6adc9907710', '[\"*\"]', NULL, NULL, '2024-12-04 20:17:07', '2024-12-04 20:17:07'),
(1007, 'App\\Models\\Student', 359, 'API TOKEN', 'b52d3355270b8717b4239f5e3876a1051508ca02f7183bc324f2cbfbf9ad43fd', '[\"*\"]', NULL, NULL, '2024-12-04 20:22:16', '2024-12-04 20:22:16'),
(1008, 'App\\Models\\Student', 288, '01061722499', 'fe5411b90b4a76eb81589d8800d9ab6437b28bdbaa6fc766382f7b5eb74a9fbe', '[\"student\"]', '2024-12-04 23:57:52', NULL, '2024-12-04 20:29:51', '2024-12-04 23:57:52'),
(1009, 'App\\Models\\Student', 354, '01150322386', '0613419534115c3534d5974aec962ec364b0192896b25993f4eea20976368e00', '[\"student\"]', '2024-12-04 21:02:35', NULL, '2024-12-04 21:01:29', '2024-12-04 21:02:35'),
(1010, 'App\\Models\\Student', 354, '01150322386', '6998a99976a37f5540b28890a2f1992a3644a465644ee6101965600350a83c8f', '[\"student\"]', '2024-12-05 09:32:39', NULL, '2024-12-04 21:06:13', '2024-12-05 09:32:39'),
(1011, 'App\\Models\\Student', 349, '01027591985', 'e803a1c340cd1ddfe971c0fe80fc83960d2c6adaf5f9afe12ffd814558071962', '[\"student\"]', '2024-12-04 22:25:47', NULL, '2024-12-04 21:12:33', '2024-12-04 22:25:47'),
(1012, 'App\\Models\\Student', 360, 'API TOKEN', '70f4acac65d83ebf0356e97077be89f6c50b89fb5c704dbac380c671cdc93f64', '[\"*\"]', NULL, NULL, '2024-12-04 21:17:36', '2024-12-04 21:17:36'),
(1013, 'App\\Models\\Student', 315, '01017726025', '70cbdb63f5c9e3da948740f46eeb8b38d451192c4a96ec4ce63b7f8cae5c3644', '[\"student\"]', '2024-12-04 22:12:39', NULL, '2024-12-04 22:12:30', '2024-12-04 22:12:39'),
(1014, 'App\\Models\\Student', 354, '01150322386', 'f0e2f9fd4dd5f6491285b31baee0a2aa357ae66f58f247b07ad286ba88be6ce7', '[\"student\"]', '2024-12-04 22:36:42', NULL, '2024-12-04 22:31:03', '2024-12-04 22:36:42'),
(1015, 'App\\Models\\Student', 361, 'API TOKEN', '6a17f630f77cf0685887d0390c112a143b58a821272d74f84bf9b6a8c13ae6a3', '[\"*\"]', NULL, NULL, '2024-12-04 22:47:02', '2024-12-04 22:47:02'),
(1016, 'App\\Models\\Student', 345, '01022004243', '38a532493fdd5e404965df74b953e84fe54779d2883af80ed08aaf9998203baa', '[\"student\"]', '2024-12-04 23:31:38', NULL, '2024-12-04 23:25:30', '2024-12-04 23:31:38'),
(1017, 'App\\Models\\Student', 337, '01033720053', '597461c59fd492fda02ea710bb95051d3c497b15a3c821888a49a77ed9e56a46', '[\"student\"]', '2024-12-05 03:28:09', NULL, '2024-12-04 23:34:55', '2024-12-05 03:28:09'),
(1018, 'App\\Models\\Student', 362, 'API TOKEN', '5f24a004164e96957aa9dae32c76efc5dd9b30ec6cde123d91667148eb39cad3', '[\"*\"]', NULL, NULL, '2024-12-04 23:39:55', '2024-12-04 23:39:55'),
(1019, 'App\\Models\\Student', 361, '01030390101', 'e1d832761e4a9b66505baa0a5e33630c5538e3dc82cdcdff551ffe1d2e008d92', '[\"student\"]', '2024-12-08 19:34:55', NULL, '2024-12-05 17:29:10', '2024-12-08 19:34:55'),
(1020, 'App\\Models\\Student', 363, 'API TOKEN', 'c04073a9797dc91878ccaaa8741ab99bf663761d5ac63bec731ab4a528abdaff', '[\"*\"]', NULL, NULL, '2024-12-06 01:49:30', '2024-12-06 01:49:30'),
(1021, 'App\\Models\\Student', 364, 'API TOKEN', '26886d07c7898bd35b24e14d966f030b69e00fa9fb6c8fde8d0dda19ed777324', '[\"*\"]', NULL, NULL, '2024-12-06 12:04:30', '2024-12-06 12:04:30'),
(1022, 'App\\Models\\Student', 365, 'API TOKEN', 'eef9d7c2f2a6fb88cc06234d54d5c75f42d541aa68941a04f8eaaadc1bcaa5e8', '[\"*\"]', NULL, NULL, '2024-12-06 18:38:31', '2024-12-06 18:38:31'),
(1023, 'App\\Models\\Student', 366, 'API TOKEN', '59974976c550387fd4397f61dc8aa1e0eb12e267e08f13d5ee8365103800d469', '[\"*\"]', NULL, NULL, '2024-12-07 17:18:17', '2024-12-07 17:18:17'),
(1024, 'App\\Models\\Student', 366, '01091009720', '98b1a241e8f6e716722b26f94f02d3cb2075801ae4921c810b8e71af0c59cdf9', '[\"student\"]', '2024-12-07 19:36:14', NULL, '2024-12-07 17:22:33', '2024-12-07 19:36:14'),
(1025, 'App\\Models\\Student', 292, '01158629083', '8c2512a82f93c0fdcf3da5e33eff236c09d78d19117e1dfe39afb5d4c79c2221', '[\"student\"]', '2024-12-13 13:39:47', NULL, '2024-12-07 19:35:47', '2024-12-13 13:39:47'),
(1026, 'App\\Models\\Student', 293, '01001161542', 'fbf22c64337f07e15f0108f869f22c20b480f27d74bcfd3b6554f869ceb33604', '[\"student\"]', '2024-12-08 10:45:09', NULL, '2024-12-08 10:45:08', '2024-12-08 10:45:09'),
(1027, 'App\\Models\\Admin', 1, 'Prodigy', '4d21d745d4572e4bc193b6146b4a6cb2ddf11cc3597d72376269dc5613b15f9d', '[\"admin\"]', '2024-12-15 21:44:16', NULL, '2024-12-09 09:41:48', '2024-12-15 21:44:16'),
(1028, 'App\\Models\\Student', 276, '01118898879', '4ae4c9cf11c001b63c7bd8adf13b520f86124f469c6d5b257221d2b74acf97fd', '[\"student\"]', '2024-12-09 23:48:20', NULL, '2024-12-09 21:34:19', '2024-12-09 23:48:20'),
(1029, 'App\\Models\\Student', 367, 'API TOKEN', '9298fa03bcf9762714153084661bb3fb7f84cfbf468e20566bdcf53f43026751', '[\"*\"]', NULL, NULL, '2024-12-10 12:54:06', '2024-12-10 12:54:06'),
(1030, 'App\\Models\\Student', 367, '01066940721', '5088d22853d833201561f4cfdf78b5adc1d73a9fce1dda443b7c3cfb8ae8537a', '[\"student\"]', '2024-12-16 21:41:30', NULL, '2024-12-10 12:56:08', '2024-12-16 21:41:30'),
(1031, 'App\\Models\\Student', 367, '01066940721', 'f2e90b4d3b25482d5a7ed3d9cef26eb4d1fdb8a7565ce82a7a6c90bb0827640b', '[\"student\"]', '2024-12-10 19:26:46', NULL, '2024-12-10 12:58:29', '2024-12-10 19:26:46'),
(1032, 'App\\Models\\Student', 368, 'API TOKEN', '1f0d43df61493a113202302f4ceea5ad2301a213b16b84c1bee5eec537e50af4', '[\"*\"]', NULL, NULL, '2024-12-10 17:22:14', '2024-12-10 17:22:14'),
(1033, 'App\\Models\\Student', 349, '01027591985', '0ae7f6e4e78c3120ec0d0838d124f73303873feffd8891821e37603e01b5050d', '[\"student\"]', '2024-12-10 17:49:50', NULL, '2024-12-10 17:45:51', '2024-12-10 17:49:50'),
(1034, 'App\\Models\\Student', 285, '01016014670', '3824b314f1f468aed32f30d8f9ab9fb933c87b6e933fbd7b74acfc1036b8166a', '[\"student\"]', '2024-12-10 18:25:23', NULL, '2024-12-10 18:24:25', '2024-12-10 18:25:23'),
(1035, 'App\\Models\\Student', 301, '01033199523', '248ece343e01e7d94ad12888c08620701740f4ee530ca813accfbc19983fadf1', '[\"student\"]', '2024-12-14 17:17:22', NULL, '2024-12-10 19:46:46', '2024-12-14 17:17:22'),
(1036, 'App\\Models\\Student', 289, '01090839039', '7362bd108f31a777b4d3ca7e525b53c76e2dc969cf0a830a265a12872f833ed2', '[\"student\"]', '2024-12-10 19:55:14', NULL, '2024-12-10 19:49:33', '2024-12-10 19:55:14'),
(1037, 'App\\Models\\Student', 364, '01124646085', 'a3d3efd0323cab688f3826bc038005a79ea65c9c1def426a7566b37538e0123b', '[\"student\"]', '2024-12-11 19:12:28', NULL, '2024-12-11 18:58:50', '2024-12-11 19:12:28'),
(1038, 'App\\Models\\Student', 274, '01228739109', 'b775bc2b04f206423737845587006a7f9c3c8cf4266b558c71857eb6319ad1c4', '[\"student\"]', '2024-12-12 00:06:23', NULL, '2024-12-12 00:04:50', '2024-12-12 00:06:23'),
(1039, 'App\\Models\\Student', 369, 'API TOKEN', '798343a37d92ca506548e56fe4d1479c2594aa7b3310ff857cb540dbf8474246', '[\"*\"]', NULL, NULL, '2024-12-12 21:06:16', '2024-12-12 21:06:16'),
(1040, 'App\\Models\\Student', 306, '01080895502', '85d2fd44e34f36a8792fd9e9e32fe1d1d675cc5542ab3b738e4734eb83bd5673', '[\"student\"]', '2024-12-13 15:36:00', NULL, '2024-12-13 15:35:30', '2024-12-13 15:36:00'),
(1041, 'App\\Models\\Student', 279, '01092875531', '2a91d4b2589613254f0ac1696560e01126609550ea397158012ef0484523701d', '[\"student\"]', '2024-12-13 16:45:02', NULL, '2024-12-13 16:44:45', '2024-12-13 16:45:02'),
(1042, 'App\\Models\\Student', 279, '01092875531', 'c6aa1c30faec46108c7426606def9f757036113381b22fa3202bd8f60e1254f3', '[\"student\"]', '2024-12-13 20:07:52', NULL, '2024-12-13 20:07:48', '2024-12-13 20:07:52'),
(1043, 'App\\Models\\Student', 322, '01012430090', '4af3c175a72a8e0b587972aaadd2788989d20ebf993a2ce6452de5aa978ddaee', '[\"student\"]', '2024-12-14 12:51:33', NULL, '2024-12-14 12:49:13', '2024-12-14 12:51:33'),
(1044, 'App\\Models\\Student', 345, '01022004243', 'bd432fd806627326fa2768209e62673613af0fd48857ecaad626cf889290c7c9', '[\"student\"]', '2024-12-14 14:32:13', NULL, '2024-12-14 14:31:52', '2024-12-14 14:32:13'),
(1045, 'App\\Models\\Student', 292, '01158629083', 'd8437b0cd17fd3be8e498a853aa8c992fba6ab9cb7bcafd46d14e2e75d94bbe5', '[\"student\"]', '2024-12-21 20:17:05', NULL, '2024-12-14 20:34:06', '2024-12-21 20:17:05'),
(1046, 'App\\Models\\Student', 309, '01019811348', '0ae48a82767848fccb41e411e5587f984630c214c36fd19b40a401e63efcb3f8', '[\"student\"]', '2024-12-16 12:40:15', NULL, '2024-12-16 12:39:14', '2024-12-16 12:40:15'),
(1047, 'App\\Models\\Student', 285, '01016014670', '963ef13cd4f1dfcd8ae09b3ce7b18650013fae1f0ca81a18e1748ee8fdaf4dec', '[\"student\"]', '2024-12-17 19:12:09', NULL, '2024-12-17 19:11:27', '2024-12-17 19:12:09'),
(1048, 'App\\Models\\Student', 367, '01066940721', '1a0b3e878d49afe7fd70df97d3b1d6fa46e3806833d1623c6b5ebb05da4c5cdc', '[\"student\"]', '2024-12-23 08:21:03', NULL, '2024-12-17 23:44:09', '2024-12-23 08:21:03'),
(1049, 'App\\Models\\Student', 370, 'API TOKEN', '51c8524fecfb259dbe1f1c3aa817ad909172d111d1a2c41cc7bf433f0c57dcab', '[\"*\"]', NULL, NULL, '2024-12-19 16:26:52', '2024-12-19 16:26:52'),
(1050, 'App\\Models\\Student', 334, '01127923539', '5fa6d8ac20146a4da005a79e9119553cc327c0937b2673b6579eaabe8e4f758b', '[\"student\"]', '2024-12-23 12:21:23', NULL, '2024-12-19 18:41:40', '2024-12-23 12:21:23'),
(1051, 'App\\Models\\Student', 371, 'API TOKEN', '2dcad9330a8b940becb0f52e9e2f86e9432ce11d5d7ed40182e7e12c71467155', '[\"*\"]', NULL, NULL, '2024-12-20 22:34:10', '2024-12-20 22:34:10'),
(1052, 'App\\Models\\Student', 274, '01228739109', '70f4a7babdb21c218b5d69708203f92c5e9ac8678e5b1e2e1ec1bc8cba6b41b9', '[\"student\"]', '2024-12-27 21:53:41', NULL, '2024-12-21 00:34:10', '2024-12-27 21:53:41'),
(1053, 'App\\Models\\Student', 346, '01553661592', 'e5f454c289c0113b86ded548a4511ee7e6ca24b1117021451e564f0326371918', '[\"student\"]', '2024-12-24 13:53:25', NULL, '2024-12-22 19:35:13', '2024-12-24 13:53:25'),
(1054, 'App\\Models\\Student', 372, 'API TOKEN', 'a69ba5070fc54447d88c97468549d5e2842118283f9cc11cac839440f1740d2b', '[\"*\"]', NULL, NULL, '2024-12-23 11:38:43', '2024-12-23 11:38:43'),
(1055, 'App\\Models\\Admin', 44, 'omar', 'a64c0f17eca32e4babacc58f1368952c9b1b768c7d524b72a05fca1cef5012bb', '[\"admin\"]', '2024-12-23 11:55:33', NULL, '2024-12-23 11:55:09', '2024-12-23 11:55:33'),
(1056, 'App\\Models\\Admin', 44, 'omar', 'bcc1090d4cd4b2f7b9b7c5579865816e042dff608ca091bba211aeaa974c8da2', '[\"admin\"]', '2024-12-23 11:57:41', NULL, '2024-12-23 11:57:41', '2024-12-23 11:57:41'),
(1057, 'App\\Models\\Admin', 44, 'omar', 'ff6d4e76e6fadc11ad00244b7639ef285587c1f6041b9bcd2b419be39dd6e0d0', '[\"admin\"]', NULL, NULL, '2024-12-23 11:57:53', '2024-12-23 11:57:53'),
(1058, 'App\\Models\\Student', 284, '01224591930', 'e2f38908128d4651199c5c56dff0d00d8b815a936f25692e534f4ecf0744f73c', '[\"student\"]', '2024-12-23 13:32:25', NULL, '2024-12-23 13:05:27', '2024-12-23 13:32:25'),
(1059, 'App\\Models\\Admin', 44, 'omar', '5cea942a4e5bc4a10777bdf93e4a716b6b70b6aa9d78d71b86179aa0c9e2f995', '[\"admin\"]', '2024-12-23 13:07:27', NULL, '2024-12-23 13:06:33', '2024-12-23 13:07:27'),
(1060, 'App\\Models\\Admin', 1, 'prodigy', '3bbfa95566b26698a0bbf0668a6ea23cca8c80036ad5658484dfb678c929a23a', '[\"admin\"]', '2024-12-23 13:54:37', NULL, '2024-12-23 13:08:32', '2024-12-23 13:54:37'),
(1061, 'App\\Models\\Student', 373, 'API TOKEN', 'b64aeb305f124f38c71c774385c79d83dca7a8d48107b40a73293f02a992b1f7', '[\"*\"]', NULL, NULL, '2024-12-23 13:17:04', '2024-12-23 13:17:04'),
(1062, 'App\\Models\\Student', 374, 'API TOKEN', 'c3229d4acd8bc0e47d54369f30ecbac177fdeb27f1f54a32a74828de91edb306', '[\"*\"]', NULL, NULL, '2024-12-23 13:21:01', '2024-12-23 13:21:01'),
(1063, 'App\\Models\\Student', 375, 'API TOKEN', '1c851d54a48302f9fa3867c5dca367788181d9e722af1e1caae447240581a0f0', '[\"*\"]', NULL, NULL, '2024-12-23 13:58:46', '2024-12-23 13:58:46'),
(1064, 'App\\Models\\Student', 376, 'API TOKEN', '031c1afebd14d6f0d13e22b3d7a926260e74db08abd32c6169d5a200ba24185c', '[\"*\"]', NULL, NULL, '2024-12-23 14:01:35', '2024-12-23 14:01:35'),
(1065, 'App\\Models\\Student', 377, 'API TOKEN', '4a62f962761c444c59fcf9c9f2b5f1aa1e792a7a8457ae8973735918f6eed012', '[\"*\"]', NULL, NULL, '2024-12-23 14:07:07', '2024-12-23 14:07:07'),
(1066, 'App\\Models\\Student', 378, 'API TOKEN', 'e52c1d748446193e832ed9f9305bb2bfa7a5bc776596972e767a4cf817c2b55a', '[\"*\"]', NULL, NULL, '2024-12-23 14:22:14', '2024-12-23 14:22:14'),
(1067, 'App\\Models\\Student', 379, 'API TOKEN', 'f596e6210ff4fb5a2331b8bdf36735bbcdbbf7cc0c6de5fed8cce0910e8f2175', '[\"*\"]', NULL, NULL, '2024-12-23 17:09:01', '2024-12-23 17:09:01'),
(1068, 'App\\Models\\Student', 277, '01068293097', '11c7ff28956ece4272c7b28b0f58de536ca81941e3718993b376296285cf8620', '[\"student\"]', '2024-12-30 13:10:31', NULL, '2024-12-23 22:17:39', '2024-12-30 13:10:31'),
(1069, 'App\\Models\\Student', 298, '01066624500', 'da2eace498e3a6da36312eb77dfb4aadabeed7bef6f49bffa0bc013921eacf59', '[\"student\"]', '2024-12-24 10:28:11', NULL, '2024-12-24 09:48:32', '2024-12-24 10:28:11'),
(1070, 'App\\Models\\Student', 380, 'API TOKEN', 'b60b7264e88e70caa3f2de554103889c79870082caeb4e5cf24562cad12498aa', '[\"*\"]', NULL, NULL, '2024-12-25 01:23:46', '2024-12-25 01:23:46'),
(1071, 'App\\Models\\Student', 381, 'API TOKEN', 'ea7e99889ec696a30ecb847ba6cc00c5a0af9ecdc65c4146ea38997573711a24', '[\"*\"]', NULL, NULL, '2024-12-25 13:05:41', '2024-12-25 13:05:41'),
(1072, 'App\\Models\\Student', 382, 'API TOKEN', '95293383f1619fe76a1c6003673deaecce3eb76547fc1a955039b168238b893a', '[\"*\"]', NULL, NULL, '2024-12-26 14:01:27', '2024-12-26 14:01:27'),
(1073, 'App\\Models\\Student', 292, '01158629083', '1622f0a0da51129006c8a1ba1dacbabdfc641cfc9a55a1862430c36c8977fca7', '[\"student\"]', '2024-12-27 17:29:48', NULL, '2024-12-27 17:29:47', '2024-12-27 17:29:48'),
(1074, 'App\\Models\\Student', 349, '01027591985', '9df11e04587cbd738d2e2d663f35d805c552ae73f2ada98b751f567c227cd86c', '[\"student\"]', '2024-12-27 20:23:15', NULL, '2024-12-27 20:22:22', '2024-12-27 20:23:15'),
(1075, 'App\\Models\\Student', 316, '01097497098', '7017f3776e0c364de5f5bc125c831748ec8940e2006d7136c297f4f612522af9', '[\"student\"]', '2024-12-27 20:33:21', NULL, '2024-12-27 20:30:55', '2024-12-27 20:33:21'),
(1076, 'App\\Models\\Student', 383, 'API TOKEN', '4138329756955c39577c1bdf05e74e02147eaf81f7fef44bcbe52b24b90c7419', '[\"*\"]', NULL, NULL, '2024-12-27 20:37:52', '2024-12-27 20:37:52'),
(1077, 'App\\Models\\Student', 292, '01158629083', 'eb65155cff45c64a9163fe3083b5438d44b5241d12f606fc7e8cfb61ac7c1429', '[\"student\"]', '2024-12-27 20:45:20', NULL, '2024-12-27 20:44:56', '2024-12-27 20:45:20'),
(1078, 'App\\Models\\Student', 276, '01118898879', 'bacd7c3fe9929d3794048dc9aadaa8932eb51b56bb7d42b608561232c9810429', '[\"student\"]', '2024-12-27 20:50:45', NULL, '2024-12-27 20:49:00', '2024-12-27 20:50:45'),
(1079, 'App\\Models\\Student', 279, '01092875531', 'd1021abd2e71825fbd698c4988655a62c1bbc5e6fbc0db47df828342941256a8', '[\"student\"]', '2024-12-27 20:52:14', NULL, '2024-12-27 20:51:54', '2024-12-27 20:52:14'),
(1080, 'App\\Models\\Student', 384, 'API TOKEN', '5b62b1d482e9484938660069539151bbb9b8743f0d6a1ebef4b3d47319ee3037', '[\"*\"]', NULL, NULL, '2024-12-27 20:52:20', '2024-12-27 20:52:20'),
(1081, 'App\\Models\\Student', 385, 'API TOKEN', 'f013a2c89bf55a2db3bd497af1079c7482bc0b4be006a39f88a770bfa7e962fb', '[\"*\"]', NULL, NULL, '2024-12-27 20:54:18', '2024-12-27 20:54:18'),
(1082, 'App\\Models\\Student', 386, 'API TOKEN', 'a4677d65cbdea8e8fe3ed65287ba532652c033ae5b2cfe04b7d337f81e947439', '[\"*\"]', NULL, NULL, '2024-12-27 20:55:05', '2024-12-27 20:55:05'),
(1083, 'App\\Models\\Student', 387, 'API TOKEN', '83b6f09e00171489fb447b3bce1062660e8668f316f2bbe4535eb0940dc6aeab', '[\"*\"]', NULL, NULL, '2024-12-27 21:08:31', '2024-12-27 21:08:31'),
(1084, 'App\\Models\\Student', 342, '01026093759', '71d1c1eaca8ec0dc49a6e2fbd9233c4780ab7bcf65ba6ecc04881ac4ee43cebd', '[\"student\"]', '2024-12-28 17:57:09', NULL, '2024-12-27 21:22:50', '2024-12-28 17:57:09'),
(1085, 'App\\Models\\Student', 277, '01068293097', 'c30df72ecd8da62851fc94383e3e92eaec5bfb79efaa99db56ad6d62f0a242e0', '[\"student\"]', '2024-12-27 21:43:11', NULL, '2024-12-27 21:41:58', '2024-12-27 21:43:11'),
(1086, 'App\\Models\\Student', 315, '01017726025', 'bd74f2d3381272f84903a0594ac0644a063b95c58fd9fbfb0526cc171c82edcf', '[\"student\"]', '2024-12-27 21:50:17', NULL, '2024-12-27 21:46:05', '2024-12-27 21:50:17'),
(1087, 'App\\Models\\Student', 388, 'API TOKEN', '87a1020feaf711ab34c69421b260381c75a02ed28c187a2d59e40dff1ce213ca', '[\"*\"]', NULL, NULL, '2024-12-27 21:53:18', '2024-12-27 21:53:18'),
(1088, 'App\\Models\\Student', 295, '01142288101', '56612001b4f8082925aefcfe75fc297f28d7bee9db747bda1d5576a0e78fbc53', '[\"student\"]', '2024-12-28 15:20:52', NULL, '2024-12-27 22:04:16', '2024-12-28 15:20:52'),
(1089, 'App\\Models\\Student', 389, 'API TOKEN', 'b0e4186048545f71c4697e8536d767a8539b04ec651fedb8d1fbce6b6c8c0705', '[\"*\"]', NULL, NULL, '2024-12-27 22:04:28', '2024-12-27 22:04:28'),
(1090, 'App\\Models\\Student', 390, 'API TOKEN', 'd421fc9e217c92f60c2333ecba4b755523df4ada096be3bcf8f2a820bcac50c6', '[\"*\"]', NULL, NULL, '2024-12-27 22:05:45', '2024-12-27 22:05:45'),
(1091, 'App\\Models\\Student', 311, '01146599669', '8c6cccc4b19eb0bf28647c166aa0597ddec06d7243d8b41ad21aabbdde6f1d3c', '[\"student\"]', '2024-12-27 22:41:28', NULL, '2024-12-27 22:22:13', '2024-12-27 22:41:28'),
(1092, 'App\\Models\\Student', 391, 'API TOKEN', '439fa4221d232479ff2463b121444d7a17287228705186059ac0c814420a3215', '[\"*\"]', NULL, NULL, '2024-12-27 22:33:53', '2024-12-27 22:33:53'),
(1093, 'App\\Models\\Student', 392, 'API TOKEN', 'd70df06ce702256077cb47146fa4bbf67b3b0975a9f427735e00e8f8bf7070b3', '[\"*\"]', NULL, NULL, '2024-12-27 23:48:36', '2024-12-27 23:48:36'),
(1094, 'App\\Models\\Student', 393, 'API TOKEN', 'e9745261a018898345ff059216387059a5a5b152e077f2ac9f74dfa53b1c4048', '[\"*\"]', NULL, NULL, '2024-12-28 00:10:25', '2024-12-28 00:10:25'),
(1095, 'App\\Models\\Student', 318, '01220356958', '18cc6038a04cd7a45ebaf900e6e08a01281e5521bc01d3c59bbd6e6adb6609b0', '[\"student\"]', '2024-12-28 10:48:16', NULL, '2024-12-28 10:47:45', '2024-12-28 10:48:16'),
(1096, 'App\\Models\\Student', 394, 'API TOKEN', '61b9873390dd8324eb9f5b4a31c5e578ef442d5f05e0ad8c1e1295786c277a5a', '[\"*\"]', NULL, NULL, '2024-12-28 10:54:15', '2024-12-28 10:54:15'),
(1097, 'App\\Models\\Student', 395, 'API TOKEN', 'b54e4945f6e29da5ad021c17e81746cabadfa01fd4d9d242ef0278d2ec05dd01', '[\"*\"]', NULL, NULL, '2024-12-28 14:44:17', '2024-12-28 14:44:17'),
(1098, 'App\\Models\\Student', 335, '01122026266', '2e830cb0a6d73ac53f6c297cf67fb293cb0b23d1d33673fb88c3409efaf8ffe2', '[\"student\"]', '2024-12-30 18:02:29', NULL, '2024-12-28 19:47:26', '2024-12-30 18:02:29'),
(1099, 'App\\Models\\Student', 285, '01016014670', '43411f07a801e8ff09fc136634f4489e7641a84f4a9a6a630871c6d52bf183bd', '[\"student\"]', '2024-12-29 19:03:46', NULL, '2024-12-29 19:03:02', '2024-12-29 19:03:46'),
(1100, 'App\\Models\\Student', 396, 'API TOKEN', '1a61bfabb9d4f0aead7075ab031f40c2bc1dc63a97cc621fd538b0a6db16c7e2', '[\"*\"]', NULL, NULL, '2024-12-29 22:36:16', '2024-12-29 22:36:16'),
(1101, 'App\\Models\\Student', 306, '01080895502', '543704e2134276f8f7e87b7552305b2b69e9d1dac08ee80febfa2b5311d5ad21', '[\"student\"]', '2024-12-29 23:51:37', NULL, '2024-12-29 23:51:22', '2024-12-29 23:51:37'),
(1102, 'App\\Models\\Student', 288, '01061722499', 'a193bb0de594029c9d39f7e2b4453eae4a681a5af51212e5a1594ac052ec36fb', '[\"student\"]', '2024-12-30 17:42:24', NULL, '2024-12-30 17:42:03', '2024-12-30 17:42:24'),
(1103, 'App\\Models\\Student', 364, '01124646085', '556efe512798a0a1cafe6f7759f7954da079965a484c58f7e5ed2472c572d123', '[\"student\"]', '2024-12-31 19:16:54', NULL, '2024-12-30 18:13:11', '2024-12-31 19:16:54'),
(1104, 'App\\Models\\Admin', 1, 'Prodigy', '7e00e8fc5c7c582f38bf139c1c5d4afaeef0847b4ff66f67616f8d0891b97a5b', '[\"admin\"]', '2025-01-06 22:01:37', NULL, '2024-12-31 09:20:40', '2025-01-06 22:01:37'),
(1105, 'App\\Models\\Student', 397, 'API TOKEN', '100ecfb9425d3f809d3382bc0e8ce78b353ac87d87880a38a5ad6a578d8ab307', '[\"*\"]', NULL, NULL, '2024-12-31 13:10:21', '2024-12-31 13:10:21'),
(1106, 'App\\Models\\Student', 398, 'API TOKEN', '234b4def067a3ecbd59234c1d2e7b83013873ef7f1b5e2ac290a504402c13e80', '[\"*\"]', NULL, NULL, '2024-12-31 19:05:08', '2024-12-31 19:05:08'),
(1107, 'App\\Models\\Student', 399, 'API TOKEN', 'f93d7aa555bf065cd1b7c30677a83efc496060e955381f36757b30a0e64afc49', '[\"*\"]', NULL, NULL, '2024-12-31 22:30:58', '2024-12-31 22:30:58'),
(1108, 'App\\Models\\Student', 371, '01055850471', 'd8225553f52701ebbac67458507d34e5c94ac578a8d046032512900da910f38f', '[\"student\"]', '2025-01-01 15:13:23', NULL, '2025-01-01 13:40:13', '2025-01-01 15:13:23'),
(1109, 'App\\Models\\Student', 345, '01022004243', 'e49374e44eca2e50d7d8591e418224928b0a5437d2997ab454156dad9d46ad04', '[\"student\"]', '2025-01-01 16:20:20', NULL, '2025-01-01 16:15:30', '2025-01-01 16:20:20'),
(1110, 'App\\Models\\Student', 400, 'API TOKEN', '9dea0891fafafd8350f8aab0beae66b5efc212e9375369dba089563ebb8eb57a', '[\"*\"]', NULL, NULL, '2025-01-01 21:28:18', '2025-01-01 21:28:18'),
(1111, 'App\\Models\\Student', 398, '01000441854', '182e521ecf4d005f84631d963562e13318f0d5c620ee57c1862cc940b4c4a7ac', '[\"student\"]', '2025-01-06 17:21:22', NULL, '2025-01-01 22:05:20', '2025-01-06 17:21:22'),
(1112, 'App\\Models\\Student', 379, '01064367688', 'f2f60cbd07af755f2775d96878cf6f176a55248feeac0847854c30528b891b29', '[\"student\"]', '2025-01-04 07:26:04', NULL, '2025-01-01 22:13:46', '2025-01-04 07:26:04'),
(1113, 'App\\Models\\Student', 396, '01014180005', '19a2ab213f53b4c92553d252c47159a49b75b09128a19f4494656994bb2fc6f1', '[\"student\"]', '2025-01-01 23:51:36', NULL, '2025-01-01 23:50:45', '2025-01-01 23:51:36'),
(1114, 'App\\Models\\Student', 401, 'API TOKEN', '01b3bab95a13766c5d791c87d69de75a5f0d93430d87c4bddd6392ed14a20f6c', '[\"*\"]', NULL, NULL, '2025-01-02 14:57:08', '2025-01-02 14:57:08'),
(1115, 'App\\Models\\Student', 402, 'API TOKEN', '4994f0900fdf3440541a169d55f81c800b107eb1ca08b3f1a2960ba29593bae4', '[\"*\"]', NULL, NULL, '2025-01-03 18:15:39', '2025-01-03 18:15:39'),
(1116, 'App\\Models\\Student', 377, '01277074746', 'c9fd0f4c2eb6c747cc527f042cf64eb9e43a12c1de19f208019c0d2cd00d5737', '[\"student\"]', '2025-01-03 22:56:04', NULL, '2025-01-03 22:54:30', '2025-01-03 22:56:04'),
(1117, 'App\\Models\\Student', 292, '01158629083', '70593e1de680dfa162d5cf927a473296c95f12d53eff6c6c009a349b87108144', '[\"student\"]', '2025-01-08 10:08:50', NULL, '2025-01-04 10:52:35', '2025-01-08 10:08:50'),
(1118, 'App\\Models\\Admin', 49, 'Safymoustafa', '735cbadef04e071b591e0a086eb57ee3e0a8b2f05215e61d9a94a0134b93d10f', '[\"admin\"]', '2025-01-04 12:41:58', NULL, '2025-01-04 12:41:47', '2025-01-04 12:41:58'),
(1119, 'App\\Models\\Student', 280, '01017757002', 'c1617b46abe728fe36478861b371c2fd76e92356e7cb2e6f2a868b40bf37f265', '[\"student\"]', '2025-01-08 16:13:55', NULL, '2025-01-04 20:52:05', '2025-01-08 16:13:55'),
(1120, 'App\\Models\\Admin', 49, 'safymoustafa', '773ec8c715695c4bcc12b2117c7fd876a3061c96507987c40d51793213d88e4e', '[\"admin\"]', '2025-01-05 13:47:49', NULL, '2025-01-05 13:39:19', '2025-01-05 13:47:49'),
(1121, 'App\\Models\\Student', 403, 'API TOKEN', 'afc8e7ef3364a9bd495aad6ff236c6a683b509d6d8a2dabb00227eb279dcb7c3', '[\"*\"]', NULL, NULL, '2025-01-05 14:13:54', '2025-01-05 14:13:54'),
(1122, 'App\\Models\\Student', 403, '01141441494', '7fef56cee3c4e9befff199c7d808b8e2e7d01539d4ce1ff99c1944a5c4641bc9', '[\"student\"]', '2025-01-05 14:17:08', NULL, '2025-01-05 14:15:12', '2025-01-05 14:17:08'),
(1123, 'App\\Models\\Student', 362, '01018619744', '0ce5d11f11e3a1c3b5c53f1382c745473a71393a36646c95cec573a9fec82ad6', '[\"student\"]', '2025-01-05 19:50:32', NULL, '2025-01-05 19:47:15', '2025-01-05 19:50:32'),
(1124, 'App\\Models\\Student', 404, 'API TOKEN', 'cdb96645e2527b2379fbf90e4448f1714d0735a105b1a43b7a956fb10da27bd0', '[\"*\"]', NULL, NULL, '2025-01-05 19:55:32', '2025-01-05 19:55:32'),
(1125, 'App\\Models\\Student', 293, '01001161542', 'b7a35318e8029361003014f6525c2eec090b57febfaf2411a4e37c35289f518e', '[\"student\"]', '2025-01-08 17:55:35', NULL, '2025-01-05 21:04:50', '2025-01-08 17:55:35'),
(1126, 'App\\Models\\Student', 306, '01080895502', '436910b176e176c5dbd2fe47117080773508d8969e77f52e535df27780da4edd', '[\"student\"]', '2025-01-06 14:10:04', NULL, '2025-01-06 14:09:48', '2025-01-06 14:10:04'),
(1127, 'App\\Models\\Student', 277, '01068293097', 'd019716ed13838ca66c03b8236d0fe37a0dac998ffcd44114128737dc3ff0e6e', '[\"student\"]', '2025-01-13 17:35:14', NULL, '2025-01-06 22:58:37', '2025-01-13 17:35:14'),
(1128, 'App\\Models\\Student', 395, '01272076710', 'bb7b666243fcb6a202e6bc791205b339306d305a239b8e4ed52aed03ab96ed8c', '[\"student\"]', '2025-01-07 12:08:01', NULL, '2025-01-07 12:02:49', '2025-01-07 12:08:01'),
(1129, 'App\\Models\\Student', 285, '01016014670', '37b327468f8ef9d7f70c57ac338878422dc64abb10ad5d7644aaa7eef7d830e1', '[\"student\"]', '2025-01-07 23:07:02', NULL, '2025-01-07 23:04:54', '2025-01-07 23:07:02'),
(1130, 'App\\Models\\Student', 405, 'API TOKEN', '0bb30dcd6fc03e69c8e53fcf3a1ad31b719b674eff7bbe2f24fc497ade84af81', '[\"*\"]', NULL, NULL, '2025-01-08 01:18:12', '2025-01-08 01:18:12'),
(1131, 'App\\Models\\Admin', 1, 'Prodigy', '361c982801acdf81383c822e0fb22ef249363c568abcd64d25211893c40805b7', '[\"admin\"]', '2025-01-13 11:21:49', NULL, '2025-01-08 08:09:59', '2025-01-13 11:21:49'),
(1132, 'App\\Models\\Student', 318, '01220356958', 'a2a56b5f1bec8be3962a820884b16f8b13021634c30c870e58589a0d813b8c24', '[\"student\"]', '2025-01-13 07:59:16', NULL, '2025-01-08 12:18:05', '2025-01-13 07:59:16'),
(1133, 'App\\Models\\Student', 335, '01122026266', '2511e54cf1ca267d0898802d6ee83252831683e83a1d22e3ebc564257c381670', '[\"student\"]', '2025-01-08 12:58:04', NULL, '2025-01-08 12:56:08', '2025-01-08 12:58:04'),
(1134, 'App\\Models\\Student', 406, 'API TOKEN', '1290a7de447e2aab0630425b4cbe0355113fbc46b6008ab5b067d3266b008e23', '[\"*\"]', NULL, NULL, '2025-01-08 14:29:58', '2025-01-08 14:29:58'),
(1135, 'App\\Models\\Student', 354, '01150322386', 'dc598a87f56d021d25ef327b96f2eb36d94e63850b91903a9aee1b3e18acaaf2', '[\"student\"]', '2025-01-08 14:38:34', NULL, '2025-01-08 14:36:42', '2025-01-08 14:38:34'),
(1136, 'App\\Models\\Student', 356, '01061150541', 'd9078324f3ebcb58b966ede5df57047c3b182e5a8cec5dfe26a6818d03913af7', '[\"student\"]', '2025-01-10 15:31:23', NULL, '2025-01-10 15:29:35', '2025-01-10 15:31:23'),
(1137, 'App\\Models\\Student', 398, '01000441854', '7265d201451d277ba4abfea64adb9fc301e3a8c68ab12fb4249cd0ddeaa8054b', '[\"student\"]', '2025-01-11 21:11:53', NULL, '2025-01-11 21:11:22', '2025-01-11 21:11:53'),
(1138, 'App\\Models\\Student', 345, '01022004243', '722b870016085834a4432921a55a4e963fdf015291a78812a3b2f7f2a9776562', '[\"student\"]', '2025-01-12 10:34:35', NULL, '2025-01-12 10:34:07', '2025-01-12 10:34:35'),
(1139, 'App\\Models\\Student', 292, '01158629083', 'af941c2503efac2a711a724fbb8835e7da830c8efca32dcfc7952510df99e31e', '[\"student\"]', '2025-01-12 18:40:07', NULL, '2025-01-12 18:37:52', '2025-01-12 18:40:07'),
(1140, 'App\\Models\\Student', 292, '01158629083', '9d2117179ea10b5a8439aa9410de7c76bbdc0ef7920674112d4613c4f572a7f6', '[\"student\"]', '2025-01-15 17:50:40', NULL, '2025-01-12 18:42:48', '2025-01-15 17:50:40'),
(1141, 'App\\Models\\Student', 306, '01080895502', '1017681baf8eb438ae0eafeac576e1aec6af2a703ce90630fa81f0b32ca2c558', '[\"student\"]', '2025-01-13 16:19:36', NULL, '2025-01-13 16:19:12', '2025-01-13 16:19:36'),
(1142, 'App\\Models\\Student', 285, '01016014670', '641edcc67ed6221a3bfebf8553dda918c4e0fd0b7d05984314a445bd186f5406', '[\"student\"]', '2025-01-13 22:54:41', NULL, '2025-01-13 22:32:05', '2025-01-13 22:54:41'),
(1143, 'App\\Models\\Student', 288, '01061722499', '09cd4ad58eca8b84f7089e905887a9fe1e2be9159464f15bd2131d64ee63a864', '[\"student\"]', '2025-01-17 04:45:37', NULL, '2025-01-14 13:21:20', '2025-01-17 04:45:37'),
(1144, 'App\\Models\\Student', 364, '01124646085', 'a3025e8e0399fdca06d01e20980266ec78955116dfbd4255160498d18c1cadcb', '[\"student\"]', '2025-01-14 20:20:09', NULL, '2025-01-14 19:18:45', '2025-01-14 20:20:09'),
(1145, 'App\\Models\\Student', 288, '01061722499', 'c983ecc81f74961dd2dad3fa25416260c157bf86ab82484dd688b21fc1b0ce20', '[\"student\"]', '2025-01-15 07:33:28', NULL, '2025-01-14 21:48:08', '2025-01-15 07:33:28'),
(1146, 'App\\Models\\Student', 276, '01118898879', 'c46f7031755d966a45808974edc983e1c8c44cdab40d8cac6fb29c35096d095c', '[\"student\"]', '2025-01-15 16:03:17', NULL, '2025-01-15 16:03:07', '2025-01-15 16:03:17'),
(1147, 'App\\Models\\Student', 346, '01553661592', '1a39839bd44a0f7f983cdb64a8ee8e5a848d591e19837bd78dfc4d6d95f9732f', '[\"student\"]', '2025-01-19 12:13:22', NULL, '2025-01-19 12:12:16', '2025-01-19 12:13:22'),
(1148, 'App\\Models\\Student', 396, '01014180005', 'df2a5b0b8040469c560b714da31995b890eae59cdddf0a5a9a46d7a888a9a9b7', '[\"student\"]', '2025-01-19 15:52:46', NULL, '2025-01-19 15:46:33', '2025-01-19 15:52:46'),
(1149, 'App\\Models\\Student', 295, '01142288101', 'e7c082a9f11de7878eaebd20d33ce6778081a20e009d72bfe69f96eeba0c8468', '[\"student\"]', '2025-01-25 20:33:34', NULL, '2025-01-25 20:30:00', '2025-01-25 20:33:34'),
(1150, 'App\\Models\\Admin', 44, 'omar', 'eaff8dec9f3caf25b7a51890d7e00076b7cb5ce16d9993396a68ed3abfab57c4', '[\"admin\"]', '2025-01-28 09:44:15', NULL, '2025-01-28 09:20:05', '2025-01-28 09:44:15'),
(1151, 'App\\Models\\Admin', 44, 'omar', 'b2cfa5a7c96ba09d8840d1788010d138f53a4effcaa194e77155501789e83678', '[\"admin\"]', '2025-01-29 10:45:56', NULL, '2025-01-28 15:52:20', '2025-01-29 10:45:56'),
(1152, 'App\\Models\\Admin', 44, 'omar', '3ea161bcaf1e96bd53bb66c0915ca8632c423dd911983d0f5e08abc91809e19f', '[\"admin\"]', '2025-01-28 16:32:12', NULL, '2025-01-28 16:32:09', '2025-01-28 16:32:12'),
(1153, 'App\\Models\\Admin', 1, 'Prodigy', '2839c9fddd5bfed639ab95bfb335fc62d0366d36c7f9be182c1ab16778e79e76', '[\"admin\"]', '2025-03-03 10:14:00', NULL, '2025-02-26 13:13:07', '2025-03-03 10:14:00'),
(1154, 'App\\Models\\Admin', 44, 'omar', '0d4766ac66120d5197e1f98628e86907f0971c5a385d8378352692f98b014c1a', '[\"admin\"]', '2025-03-02 10:42:16', NULL, '2025-03-02 10:42:13', '2025-03-02 10:42:16'),
(1155, 'App\\Models\\Admin', 44, 'omar', 'f48bf420adcab9be20476a43626b27a624e022a6d199319cb20e7ee624f7de78', '[\"admin\"]', '2025-03-02 10:47:24', NULL, '2025-03-02 10:47:11', '2025-03-02 10:47:24'),
(1156, 'App\\Models\\Admin', 1, 'Prodigy', '057e387a2ac0c31eb5105aab1b764fc47717eebc204f8769a973fd7b8b30b8d4', '[\"admin\"]', '2025-03-09 21:31:36', NULL, '2025-03-05 22:25:44', '2025-03-09 21:31:36'),
(1157, 'App\\Models\\Admin', 1, 'Prodigy', 'a9037873b2c48bf3a3dd650174da17775a4fa8cc0b083cf97a259bb0c77a2a17', '[\"admin\"]', '2025-03-08 20:35:07', NULL, '2025-03-05 23:07:32', '2025-03-08 20:35:07'),
(1158, 'App\\Models\\Student', 407, 'API TOKEN', '88240b65f30447652a8c238d238d034ad988c9ed90d40f74bb0cc6f3db076b3f', '[\"*\"]', NULL, NULL, '2025-03-06 21:25:08', '2025-03-06 21:25:08'),
(1159, 'App\\Models\\Student', 407, '01152393524', '1dc0a223a8e94a0f3689d30cd844e3a43ee92cf22487ad8d509e8dee81b44cec', '[\"student\"]', '2025-03-07 20:42:28', NULL, '2025-03-06 21:36:25', '2025-03-07 20:42:28'),
(1160, 'App\\Models\\Student', 407, '01152393524', '5caead6a208457f6b067c80df5761ddf3a463581171475a0769e404aef9640e4', '[\"student\"]', '2025-03-12 07:08:23', NULL, '2025-03-07 20:42:47', '2025-03-12 07:08:23'),
(1161, 'App\\Models\\Student', 408, 'API TOKEN', 'a6c86b890fc607c111835bf4ceac0b0898e056599630211973f2d1a1e62290a5', '[\"*\"]', NULL, NULL, '2025-03-09 11:33:54', '2025-03-09 11:33:54'),
(1162, 'App\\Models\\Student', 408, '01017495881', '8d8b2d44521a16f540c2d67e78516f8e7e9e3454afd851a87df7bef6f5a45432', '[\"student\"]', '2025-03-10 22:42:47', NULL, '2025-03-10 00:24:16', '2025-03-10 22:42:47'),
(1163, 'App\\Models\\Student', 408, '01017495881', 'db541f76ca4ece9c52b7d2d20bbf33bffe7c0a41a4dda34ae300a2451ef74a86', '[\"student\"]', '2025-03-11 19:47:50', NULL, '2025-03-10 16:50:17', '2025-03-11 19:47:50'),
(1164, 'App\\Models\\Student', 409, 'API TOKEN', '61526a38817060771bb09779c7f9f3c518863404cd80544f9553773006ec8c1e', '[\"*\"]', NULL, NULL, '2025-03-12 11:05:05', '2025-03-12 11:05:05'),
(1165, 'App\\Models\\Admin', 1, 'prodigy', '91ba05446a163bb817b656fc4e03e1d5d92d1e19075103d3eaca8b92937dd3bd', '[\"admin\"]', '2025-03-19 14:12:47', NULL, '2025-03-16 09:02:14', '2025-03-19 14:12:47'),
(1166, 'App\\Models\\Student', 409, '01068658007', 'a922cf645201eb6b7ff0901b5a4e6e759030fd92ed05bb2d72b3ed2abf5f5daf', '[\"student\"]', '2025-03-16 12:14:31', NULL, '2025-03-16 10:57:59', '2025-03-16 12:14:31'),
(1167, 'App\\Models\\Admin', 1, 'Prodigy', '3b5ebdb81ea58014b80dd941ab235f05f2f859e0015546f1b81d4447bf244787', '[\"admin\"]', '2025-03-16 14:34:08', NULL, '2025-03-16 12:55:35', '2025-03-16 14:34:08'),
(1168, 'App\\Models\\Admin', 1, 'Prodigy', '161f30cf74638da27c0a276afbb25262a19108706eabc1fee633af18a2a91c5a', '[\"admin\"]', '2025-03-16 13:15:32', NULL, '2025-03-16 13:13:53', '2025-03-16 13:15:32'),
(1169, 'App\\Models\\Student', 409, '01068658007', 'a64fe3ab02e0d09189967bb637d261040de393389eb1ec902f7248e6633d99b3', '[\"student\"]', '2025-03-16 16:43:11', NULL, '2025-03-16 13:21:41', '2025-03-16 16:43:11'),
(1170, 'App\\Models\\Student', 410, 'API TOKEN', '6be51cc81fe2faada821cab7a82e21a761a403e7b20e7deb4774834379eea097', '[\"*\"]', NULL, NULL, '2025-03-16 13:37:22', '2025-03-16 13:37:22'),
(1171, 'App\\Models\\Student', 409, '01068658007', 'bcf3b296c5381da26007b5fae910a6d119c922af93ebc8589a5c4eb8c83524de', '[\"student\"]', '2025-03-20 21:53:12', NULL, '2025-03-16 16:32:24', '2025-03-20 21:53:12'),
(1172, 'App\\Models\\Student', 407, '01152393524', '2a45b2035ef16ad0a6bf17b30107a30e3136cd155b5d2a1d6d372f5e23b25e74', '[\"student\"]', '2025-03-24 07:30:45', NULL, '2025-03-19 14:13:55', '2025-03-24 07:30:45'),
(1173, 'App\\Models\\Student', 411, 'API TOKEN', 'a94615903fc852147bea44f3864b73b6f9b0e47ad1c387e539f02eb3c9d94032', '[\"*\"]', NULL, NULL, '2025-03-25 21:43:45', '2025-03-25 21:43:45'),
(1174, 'App\\Models\\Student', 412, 'API TOKEN', 'ec472d4d83a5cdc96e8a849f501b9792ff0b204083be160e48845e35b08d1ba7', '[\"*\"]', NULL, NULL, '2025-03-25 21:52:56', '2025-03-25 21:52:56'),
(1175, 'App\\Models\\Admin', 1, 'prodigy', '4a1c4107d095dcfa163673c0eda7c3b1d66329a9a11654ef86160b4faf897ad5', '[\"admin\"]', '2025-03-27 19:03:09', NULL, '2025-03-26 08:33:35', '2025-03-27 19:03:09'),
(1176, 'App\\Models\\Student', 411, '01008331515', '9421cc9a92af37c7f019b10570d55f2261cbd160f7f437421e6b8adb27d613d6', '[\"student\"]', '2025-03-28 19:28:14', NULL, '2025-03-26 08:46:13', '2025-03-28 19:28:14'),
(1177, 'App\\Models\\Student', 411, '01008331515', 'abf398d8ba4195bde4fdc176f5381ac9c93d56cd7d3daa4a4eea68b9028b5eff', '[\"student\"]', '2025-03-27 03:23:39', NULL, '2025-03-26 09:01:35', '2025-03-27 03:23:39'),
(1178, 'App\\Models\\Admin', 1, 'prodigy', 'd94231a500a23846be9aeaefa1366a47cc04246fd37050b4a8d6095ebbfbb9f6', '[\"admin\"]', '2025-03-26 10:52:17', NULL, '2025-03-26 10:39:15', '2025-03-26 10:52:17'),
(1179, 'App\\Models\\Student', 411, '01008331515', '0b8dadc7c0d61dba611d256b2d6aeaee7954ea58ba21c159114b3dfbe1084585', '[\"student\"]', '2025-03-27 09:03:53', NULL, '2025-03-27 09:00:12', '2025-03-27 09:03:53'),
(1180, 'App\\Models\\Student', 411, '01008331515', 'c43fd4dc64e1541d2cbfc6e28982d2ae988c97227f9d4ef270eb179bb0290e98', '[\"student\"]', '2025-03-28 14:25:19', NULL, '2025-03-28 14:18:37', '2025-03-28 14:25:19'),
(1181, 'App\\Models\\Student', 407, '01152393524', '87016b3d916042971de699ba2b02c27f17a205d3c31e036091d29832ff79094a', '[\"student\"]', '2025-04-06 21:25:35', NULL, '2025-04-03 11:01:27', '2025-04-06 21:25:35'),
(1182, 'App\\Models\\Student', 411, '01008331515', 'a9e784438ec5968e8f67aa1b424c575cac60523d3a695523429aacf3b651fd8e', '[\"student\"]', '2025-04-15 00:23:25', NULL, '2025-04-10 03:24:17', '2025-04-15 00:23:25'),
(1183, 'App\\Models\\Student', 413, 'API TOKEN', '1296620e2e0a14bfc91d66a8b2b6a84a47faba28b713b3e7be45cdb03ff591d2', '[\"*\"]', NULL, NULL, '2025-04-12 22:24:19', '2025-04-12 22:24:19'),
(1184, 'App\\Models\\Student', 407, '01152393524', 'c052bd8211ca497f6832e0fd199c8034fe3231f66fa44e728fac763881efec23', '[\"student\"]', '2025-04-21 21:19:53', NULL, '2025-04-14 23:09:52', '2025-04-21 21:19:53'),
(1185, 'App\\Models\\Admin', 1, 'Prodigy', '836031f612aa50ae7d1d9d2a99b25718aa75c2d4a59654631d99136597157b81', '[\"admin\"]', '2025-04-23 14:03:24', NULL, '2025-04-17 10:48:46', '2025-04-23 14:03:24'),
(1186, 'App\\Models\\Admin', 1, 'prodigy', 'a22d0cfed7201b977b169a63c66dd923cd85df8209a970b0dab392bc297bb543', '[\"admin\"]', '2025-04-22 13:20:46', NULL, '2025-04-17 11:18:07', '2025-04-22 13:20:46'),
(1187, 'App\\Models\\Admin', 48, 'hodasaeed', 'd2a913f418d60db383efaf97a26907d9f831762cfd37e866078519ea3cad38ec', '[\"admin\"]', '2025-04-17 12:23:48', NULL, '2025-04-17 12:22:02', '2025-04-17 12:23:48'),
(1188, 'App\\Models\\Student', 414, 'API TOKEN', 'ea691401fb09982c68f6de48d875331ac3ebead26ec9c17ee8217602be79a912', '[\"*\"]', NULL, NULL, '2025-04-17 12:29:00', '2025-04-17 12:29:00'),
(1189, 'App\\Models\\Student', 414, '01070283066', '8b8d6795f1182229fa5df5a8b391073883d434986eb45b16d210317c5a4f80f6', '[\"student\"]', '2025-04-17 13:35:25', NULL, '2025-04-17 12:29:26', '2025-04-17 13:35:25'),
(1190, 'App\\Models\\Student', 408, '01017495881', '4502508f803f7a48d693a8e3b54a0484f78a9f68102308d1e83a20dbcf25c6fc', '[\"student\"]', '2025-04-26 09:32:20', NULL, '2025-04-19 14:50:15', '2025-04-26 09:32:20'),
(1191, 'App\\Models\\Admin', 1, 'Prodigy', '2e55ee1375d0e44697ae5edb1310383a53ebddc59ddc5c1a3fdd3cb6b8d980ec', '[\"admin\"]', '2025-04-21 20:20:47', NULL, '2025-04-21 12:09:29', '2025-04-21 20:20:47'),
(1192, 'App\\Models\\Student', 407, '01152393524', 'bc5f803b16e9aca1aff02c1131d43ba0c578672db0a7c3dc8aaf7d9846942be2', '[\"student\"]', '2025-04-25 15:03:30', NULL, '2025-04-22 14:08:42', '2025-04-25 15:03:30'),
(1193, 'App\\Models\\Admin', 1, 'Prodigy', '94ba917dc36a636521caa2770b3538b426f49aaf7d99f9c3f48aeb2f78be72eb', '[\"admin\"]', '2025-04-28 14:07:49', NULL, '2025-04-28 11:25:28', '2025-04-28 14:07:49'),
(1194, 'App\\Models\\Student', 407, '01152393524', '9728a4358966687f28b2c17c843bfe7d3f503de07bc87dd15e61ec32a71cf9aa', '[\"student\"]', '2025-05-02 16:24:49', NULL, '2025-05-02 16:11:07', '2025-05-02 16:24:49'),
(1195, 'App\\Models\\Student', 415, 'API TOKEN', '76199e1d4c2d5d4cb9fd48d21ec49fabb7d40936bf9c83132a9420fd6f301755', '[\"*\"]', NULL, NULL, '2025-05-03 19:56:23', '2025-05-03 19:56:23'),
(1196, 'App\\Models\\Student', 408, '01017495881', 'ce8cc6a568e3bc36930bc5684dae3449d1cf8bb26ea0e2ac142f0db267480d20', '[\"student\"]', '2025-05-14 18:40:41', NULL, '2025-05-11 20:49:30', '2025-05-14 18:40:41'),
(1197, 'App\\Models\\Admin', 1, 'Prodigy', 'c459b4944d4c09bb437c9897c108ec2dd2c9b08b8214bacaac5df2f429fbf51a', '[\"admin\"]', '2025-05-15 13:21:10', NULL, '2025-05-14 13:18:40', '2025-05-15 13:21:10'),
(1198, 'App\\Models\\Student', 407, '01152393524', 'c1a6df348cd5c8d36cffdf02202249a9c4e786934cb05493df918ed6cac5ee79', '[\"student\"]', '2025-05-16 11:06:49', NULL, '2025-05-16 11:04:26', '2025-05-16 11:06:49'),
(1199, 'App\\Models\\Student', 407, '01152393524', 'e87efa7ab5dd11c9a36ee9a41e3ccac53a16538582b0e8f44779d9156a6e4bed', '[\"student\"]', '2025-05-16 15:36:32', NULL, '2025-05-16 15:36:08', '2025-05-16 15:36:32'),
(1200, 'App\\Models\\Student', 409, '01068658007', '4725436c061c9f9e498550518e022831bc3ee39aaf7f95ffc04f57b76cb00d94', '[\"student\"]', '2025-05-22 13:46:45', NULL, '2025-05-18 09:04:12', '2025-05-22 13:46:45'),
(1201, 'App\\Models\\Student', 409, '01068658007', '549363d010f22dd89d1130969151499792509587cc80bd5e19203c4248385237', '[\"student\"]', '2025-05-22 23:20:14', NULL, '2025-05-18 09:06:10', '2025-05-22 23:20:14'),
(1202, 'App\\Models\\Student', 408, '01017495881', '8343c6a00e87f5ff0f95cec8dfe8113a3d1a4cf38c9ebdbe354f0be09612dfad', '[\"student\"]', '2025-05-23 11:27:44', NULL, '2025-05-20 15:15:30', '2025-05-23 11:27:44'),
(1203, 'App\\Models\\Admin', 44, 'Omar', '2cba6d8e48b473991b9d28395eaf8867896448b728c9c62420f8de1b1a0daa0a', '[\"admin\"]', '2025-07-30 13:11:14', NULL, '2025-07-30 13:10:39', '2025-07-30 13:11:14'),
(1204, 'App\\Models\\Admin', 44, 'omar', 'c361e2ccb7b5c2b3c16c58946c886345c7f494e5dd008225d2aaa4922e9a074d', '[\"admin\"]', '2025-07-30 13:25:17', NULL, '2025-07-30 13:11:57', '2025-07-30 13:25:17'),
(1205, 'App\\Models\\Admin', 44, 'omar', '3382962ea1352386f132161efbffe8ed656aaaf341eabe4ce7ddcaf5e089a3b6', '[\"admin\"]', '2025-07-30 13:14:03', NULL, '2025-07-30 13:14:02', '2025-07-30 13:14:03'),
(1206, 'App\\Models\\Admin', 44, 'omar', '95fc58ba68265762258caf303cef1679268ed60c49dcf3837d3cf4da7f23aed5', '[\"admin\"]', '2025-08-02 12:51:30', NULL, '2025-07-30 13:14:16', '2025-08-02 12:51:30'),
(1207, 'App\\Models\\Admin', 44, 'omar', '3ef1b96bede085223158394d691a70472f762438079d36d6fa8f147aa6309edc', '[\"admin\"]', NULL, NULL, '2025-07-30 13:15:31', '2025-07-30 13:15:31'),
(1208, 'App\\Models\\Admin', 44, 'omar', '193799f54e097b202dded2beebc44065f4ba1ee9bc5ffb897fb7a133ec28b688', '[\"admin\"]', NULL, NULL, '2025-07-30 13:16:45', '2025-07-30 13:16:45'),
(1209, 'App\\Models\\Admin', 44, 'omar', '7266c7a5a592f84fcf38b26315582d5c105bb8f0c467cbd39ad4ea8dd57a1c89', '[\"admin\"]', NULL, NULL, '2025-07-30 13:16:56', '2025-07-30 13:16:56'),
(1210, 'App\\Models\\Admin', 44, 'omar', 'c587fa150d13b80b4182ac640de440179bae16427851c53a614be52370fcbd30', '[\"admin\"]', NULL, NULL, '2025-07-30 13:16:59', '2025-07-30 13:16:59'),
(1211, 'App\\Models\\Admin', 44, 'omar', '1a69b2269b63e80228b5d3c7a7e330a4885fd3c72a34ab44538a41062c8fdef4', '[\"admin\"]', NULL, NULL, '2025-07-30 13:17:03', '2025-07-30 13:17:03'),
(1212, 'App\\Models\\Admin', 44, 'omar', '47cf25b888587023ea9d8f6cc5588a3ee9df550ba00786d53b3ce7bb66d8868c', '[\"admin\"]', NULL, NULL, '2025-07-30 13:17:09', '2025-07-30 13:17:09'),
(1213, 'App\\Models\\Admin', 44, 'omar', '911a42691f52278914a1adaa9d40ff25e8254410a4aba68c92f7c7059dd45f4d', '[\"admin\"]', NULL, NULL, '2025-07-30 13:17:21', '2025-07-30 13:17:21'),
(1214, 'App\\Models\\Admin', 44, 'omar', 'f79b9f9b2a5ef989ac035106b8dee47e5b8b0798ff33681d86a8c6a0faddb654', '[\"admin\"]', '2025-07-30 14:01:27', NULL, '2025-07-30 13:18:05', '2025-07-30 14:01:27'),
(1215, 'App\\Models\\Admin', 44, 'omar', 'eca3c66801d78749c438fb62bfd559a808575d83347a8024bfb0fe2eac1c07b8', '[\"admin\"]', NULL, NULL, '2025-08-02 11:41:58', '2025-08-02 11:41:58'),
(1216, 'App\\Models\\Admin', 44, 'omar', '3db707b7a129e4062a6d71233416ea2db3a28ccef524c7ad8203b2bd81fe1049', '[\"admin\"]', '2025-08-02 12:49:46', NULL, '2025-08-02 11:43:56', '2025-08-02 12:49:46'),
(1217, 'App\\Models\\Teacher', 26, 'test22', 'd92b639eb98393b75c6e31caef8221f671323c45a80765199fda1da41174ade3', '[\"teacher\"]', '2025-08-02 12:55:08', NULL, '2025-08-02 12:51:59', '2025-08-02 12:55:08'),
(1218, 'App\\Models\\Teacher', 26, 'test22', 'ecdabfa7246a7393d5ea1415c4ec60cbad53a4510ba42b224c890d3993210f46', '[\"teacher\"]', NULL, NULL, '2025-08-02 13:29:19', '2025-08-02 13:29:19'),
(1219, 'App\\Models\\Teacher', 26, 'test22', '583f30529ea0d75319cb7666f7210cf7aeef35193b57dfdea86af010e4d88d13', '[\"teacher\"]', NULL, NULL, '2025-08-02 13:35:08', '2025-08-02 13:35:08'),
(1220, 'App\\Models\\Teacher', 26, 'test22', '1f50395ce336cd82fa36db1bc0a6fd13e3732a843597dfea2698cd88d7cd5e2a', '[\"teacher\"]', NULL, NULL, '2025-08-02 13:38:12', '2025-08-02 13:38:12'),
(1221, 'App\\Models\\Teacher', 26, 'test22', '35c156274e0f45d14c6c8189de437b0cb95695a4a03edea0797752922438bbc7', '[\"teacher\"]', '2025-08-02 14:16:43', NULL, '2025-08-02 13:39:28', '2025-08-02 14:16:43'),
(1222, 'App\\Models\\Admin', 44, 'omar', '06cfd6a0c81a98b569452808f9ce33562957fe14e1b5ef956a73b2ddb70719d8', '[\"admin\"]', '2025-08-03 09:27:44', NULL, '2025-08-03 09:26:38', '2025-08-03 09:27:44'),
(1223, 'App\\Models\\Teacher', 26, 'test22', '2d0ffd43fcdb1a0b1bff2ced44393f96bfff15a0599228b0f4d62435f5cf988c', '[\"teacher\"]', '2025-08-03 09:28:38', NULL, '2025-08-03 09:28:33', '2025-08-03 09:28:38'),
(1224, 'App\\Models\\Admin', 44, 'omar', '0189d3279f33c915d92cd53f03f8a01fca1f735b2c5d036e6b7dd3b05ec33818', '[\"admin\"]', NULL, NULL, '2025-08-03 09:29:58', '2025-08-03 09:29:58'),
(1225, 'App\\Models\\Admin', 44, 'omar', 'b7a27b54629750495815afb42c67d159c3af2d21aa965f734785a10b3f21f599', '[\"admin\"]', NULL, NULL, '2025-08-03 09:30:06', '2025-08-03 09:30:06'),
(1226, 'App\\Models\\Admin', 44, 'omar', '8a25e567ad9dda5d34101f470ea66bdaba12b180cb5e316d9a8ebbf50b97d292', '[\"admin\"]', '2025-08-03 12:00:24', NULL, '2025-08-03 09:30:15', '2025-08-03 12:00:24'),
(1227, 'App\\Models\\Admin', 44, 'omar', '74f28d2c37bc15bca5fc946c481978ed7f3972246d32cbd0784f77dcd9947971', '[\"admin\"]', '2025-08-03 11:33:58', NULL, '2025-08-03 09:31:33', '2025-08-03 11:33:58'),
(1228, 'App\\Models\\Admin', 44, 'omar', 'a459c8cad8ffb25059cfcc132e7fe96b6bd2fe58d20335d4d40da68b259074ce', '[\"admin\"]', '2025-08-03 15:13:47', NULL, '2025-08-03 12:02:12', '2025-08-03 15:13:47'),
(1229, 'App\\Models\\Admin', 44, 'omar', 'bb1730d439704defc5d00741952e2fbbc9699ebef6b7c06cf04df427a1f4fecf', '[\"admin\"]', '2025-08-03 12:22:36', NULL, '2025-08-03 12:04:44', '2025-08-03 12:22:36'),
(1230, 'App\\Models\\Student', 416, 'API TOKEN', '9b6286648c7d7283a53ca184dd99fa755f0555432b26be47e32c1fc381ad985e', '[\"*\"]', NULL, NULL, '2025-08-03 12:23:41', '2025-08-03 12:23:41'),
(1231, 'App\\Models\\Admin', 44, 'omar', 'f56a261a0f469110651080eb2462753c3676c89bc65c46d59ec1d39ed83f6f98', '[\"admin\"]', '2025-08-03 12:24:00', NULL, '2025-08-03 12:23:54', '2025-08-03 12:24:00'),
(1232, 'App\\Models\\Student', 416, '01205465494', '4b86b3571db7f29cad7ad9d2b759010517a817336ccb0518658b39291a641f1b', '[\"student\"]', '2025-08-03 12:28:09', NULL, '2025-08-03 12:24:07', '2025-08-03 12:28:09'),
(1233, 'App\\Models\\Admin', 44, 'omar', '525246e2fb3066503dad8f29771729818bb8fc265f14c6b94daa288c36f3b8b7', '[\"admin\"]', NULL, NULL, '2025-08-03 15:32:25', '2025-08-03 15:32:25'),
(1234, 'App\\Models\\Admin', 44, 'omar', '69b29d1e7483d03b26b136171ffac4401c5a62c39555d7317433aaf183bda2fe', '[\"admin\"]', '2025-08-03 15:49:06', NULL, '2025-08-03 15:32:27', '2025-08-03 15:49:06'),
(1235, 'App\\Models\\Admin', 44, 'omar', 'f8019fec0915e9802e54daddd27945849608a2536d07323fdb5996be02c84b3d', '[\"admin\"]', NULL, NULL, '2025-08-03 16:02:56', '2025-08-03 16:02:56'),
(1236, 'App\\Models\\Admin', 44, 'omar', 'dbdd3d2a3942f888c2c0f36f99b06d9dd7f737083f35279c1657cc84dda7b05f', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:11', '2025-08-03 16:03:11'),
(1237, 'App\\Models\\Admin', 44, 'omar', '1589d5bfa60781673211d6f36555fd776e00d843329b8deeda9aa10cd5cea54a', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:12', '2025-08-03 16:03:12'),
(1238, 'App\\Models\\Admin', 44, 'omar', '9eda6e41d67dd1b2f61fcc299492e06a37e0f4b0b03f799808795321ce6385ad', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:13', '2025-08-03 16:03:13'),
(1239, 'App\\Models\\Admin', 44, 'omar', 'cc4b982737a57fd6485593147297e50bb99426ebcf1ceaffe1b8c462d4ef506c', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:13', '2025-08-03 16:03:13'),
(1240, 'App\\Models\\Admin', 44, 'omar', '3e0aece4df523e7e0b3d88a4c09c2f0b02ab6fb19c78e3f79d6231bcbb6276b0', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:40', '2025-08-03 16:03:40'),
(1241, 'App\\Models\\Admin', 44, 'omar', 'db2c5a2536501014f506dadd1b07823e93a7a42e969907350c111dcd5b289862', '[\"admin\"]', NULL, NULL, '2025-08-03 16:03:47', '2025-08-03 16:03:47'),
(1242, 'App\\Models\\Admin', 44, 'omar', '26856f67f5447dbf06839aa87d1d87f72dd1cc357274e559d1170794319733cf', '[\"admin\"]', '2025-08-03 16:50:24', NULL, '2025-08-03 16:04:02', '2025-08-03 16:50:24'),
(1243, 'App\\Models\\Admin', 44, 'omar', 'd88c978d734a67bf03f986a73c65932bf52b188acc6f81b79999b73be9de0e11', '[\"admin\"]', NULL, NULL, '2025-08-04 09:09:51', '2025-08-04 09:09:51'),
(1244, 'App\\Models\\Admin', 44, 'omar', '39ea3ed4afda15b9f2092b066d8b0176913f692b9300745507d88bd22c627e3a', '[\"admin\"]', NULL, NULL, '2025-08-04 09:10:21', '2025-08-04 09:10:21'),
(1245, 'App\\Models\\Admin', 44, 'omar', 'aa4f76834a17ad110bec7bedd8552c276e2bfe4ac3ceb806c0e80745816927c3', '[\"admin\"]', NULL, NULL, '2025-08-04 09:10:32', '2025-08-04 09:10:32'),
(1246, 'App\\Models\\Admin', 44, 'omar', '3654259b31c20133ea7a871f6407d0b39fda4cc9c0e3f0160e459590cd7dc2ab', '[\"admin\"]', NULL, NULL, '2025-08-04 09:11:42', '2025-08-04 09:11:42'),
(1247, 'App\\Models\\Admin', 44, 'omar', 'acc9b1f0d69bd2a041638257a6709e4e4b3403195242f7e87e54234b4765e703', '[\"admin\"]', '2025-08-04 09:35:05', NULL, '2025-08-04 09:11:47', '2025-08-04 09:35:05'),
(1248, 'App\\Models\\Admin', 44, 'omar', '46124aad877dac9f066c7e64bbba4d8dc0abf7827461daf0fb28debde49bd058', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:06', '2025-08-04 10:02:06'),
(1249, 'App\\Models\\Admin', 44, 'omar', 'ded9acf42ac2a1ae2d17547e55d29b6e8233abd87ad5a102db68380a244b5795', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:13', '2025-08-04 10:02:13'),
(1250, 'App\\Models\\Admin', 44, 'omar', '178ae1b3c4e6a0cd4f9e57e5bec087a27f04635d71abf485b1cbbbbbb776d23c', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:13', '2025-08-04 10:02:13'),
(1251, 'App\\Models\\Admin', 44, 'omar', 'aaaae1a66c3982fb4ce7c10bedaba13992b13b016c1191273e3ff9fb4a8ca698', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:15', '2025-08-04 10:02:15'),
(1252, 'App\\Models\\Admin', 44, 'omar', 'de87a93eae1d0a08c37028f35a9294bf3e3d5c4bdf1a83a6fbc25f1e91323470', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:32', '2025-08-04 10:02:32'),
(1253, 'App\\Models\\Admin', 44, 'omar', '59921fdf6bd60612f093ab98484fabd6d7bb74dbbd08751d2f4e0c03fdffc18d', '[\"admin\"]', NULL, NULL, '2025-08-04 10:02:54', '2025-08-04 10:02:54'),
(1254, 'App\\Models\\Admin', 44, 'omar', '49a9b7ed2ca621e725360780cea27a11029c65c3b82e636462b48dfdd50a0140', '[\"admin\"]', NULL, NULL, '2025-08-04 10:03:08', '2025-08-04 10:03:08'),
(1255, 'App\\Models\\Admin', 44, 'omar', '98524bfbcd17c86085d03c398065016a52a68783ace004f46ee59f7fb67c80e6', '[\"admin\"]', NULL, NULL, '2025-08-04 10:04:34', '2025-08-04 10:04:34'),
(1256, 'App\\Models\\Admin', 44, 'omar', '293b9f234d74b162c97bd3e213b81d0c2efe3b8b8b888726262e4be37d51a8b0', '[\"admin\"]', NULL, NULL, '2025-08-04 10:05:44', '2025-08-04 10:05:44');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1257, 'App\\Models\\Admin', 44, 'OMAR', 'd30919bf377e503033034a8ca171fae2e1aa5ea3de2ac13d47f9f32e95d6ec39', '[\"admin\"]', NULL, NULL, '2025-08-04 10:07:27', '2025-08-04 10:07:27'),
(1258, 'App\\Models\\Admin', 44, 'omar', 'b821f8f4ef073a5471baffee298db960eabed556832b359cc2c37f21cff6d5d6', '[\"admin\"]', '2025-08-04 12:00:05', NULL, '2025-08-04 10:08:03', '2025-08-04 12:00:05'),
(1259, 'App\\Models\\Admin', 44, 'omar', '060cc19bbfbcaba68fe2d92174df28f886d744516a620e68ecd210b228ef01d6', '[\"admin\"]', '2025-08-04 12:49:09', NULL, '2025-08-04 12:04:30', '2025-08-04 12:49:09'),
(1260, 'App\\Models\\Admin', 44, 'omar', '76fcad789b3edb1582034595a6b61f97f526d58c5a1e7ed59ec50cdd45601cf2', '[\"admin\"]', '2025-08-04 12:52:30', NULL, '2025-08-04 12:51:47', '2025-08-04 12:52:30'),
(1261, 'App\\Models\\Teacher', 27, 'test23', 'f62d2209004e86ab96e2c5e89f66c2a4d21af345611d23ee66e4bce5e19dd1ea', '[\"teacher\"]', '2025-08-04 13:05:47', NULL, '2025-08-04 12:52:35', '2025-08-04 13:05:47'),
(1262, 'App\\Models\\Teacher', 27, 'test23', 'b05cceb95144e351ab0b105a658f9ac7c3ccfe0f69be04075c1615af9ed19157', '[\"teacher\"]', '2025-08-04 13:05:36', NULL, '2025-08-04 13:05:20', '2025-08-04 13:05:36'),
(1263, 'App\\Models\\Admin', 44, 'omar', '2262cd78c14fc3abbdb5b3bc309e742169a0b0fe1182fee6203e49c112e22bda', '[\"admin\"]', '2025-08-04 13:09:27', NULL, '2025-08-04 13:09:16', '2025-08-04 13:09:27'),
(1264, 'App\\Models\\Student', 416, '01205465494', '6ec8965ddf66983769c9bb69d5594da1635594be7563691aa56a3c1897a83677', '[\"student\"]', '2025-08-04 14:34:36', NULL, '2025-08-04 13:09:45', '2025-08-04 14:34:36'),
(1265, 'App\\Models\\Student', 416, '01205465494', '62787d8f9723048848cd4f9d886baf030fa47e6dc7d3408111f055a719aef084', '[\"student\"]', '2025-08-04 14:26:52', NULL, '2025-08-04 13:10:02', '2025-08-04 14:26:52'),
(1266, 'App\\Models\\Admin', 44, 'omar', 'add9de71362dcf45c7f6a08bed3cfd00e178a8f221a6a26766258f5c97aaf240', '[\"admin\"]', '2025-08-04 14:23:47', NULL, '2025-08-04 13:17:49', '2025-08-04 14:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `stage` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `stage`, `created_at`, `updated_at`) VALUES
(12, '<h1>&nbsp;</h1><p>qqqqq</p>', 1, '2025-08-04 13:18:02', '2025-08-04 13:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `questionbank_categories`
--

CREATE TABLE `questionbank_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stage` tinytext NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questionbank_categories`
--

INSERT INTO `questionbank_categories` (`id`, `name`, `stage`, `section`, `created_at`, `updated_at`) VALUES
(10, 'test', '2', 'scientific', '2024-09-13 12:23:28', '2024-10-11 03:52:24'),
(11, 'omar', '3', 'arts', '2024-09-13 12:25:21', '2024-09-13 12:32:47'),
(13, 'category', '2', 'scientific', '2024-10-11 03:45:29', '2024-10-11 03:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `questionbank_question`
--

CREATE TABLE `questionbank_question` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `answer1` longtext DEFAULT NULL,
  `answer2` longtext DEFAULT NULL,
  `answer3` longtext DEFAULT NULL,
  `answer4` longtext DEFAULT NULL,
  `hint` text DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `is_essay` tinyint(4) NOT NULL DEFAULT 0,
  `degree` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `vdo_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questionbank_question`
--

INSERT INTO `questionbank_question` (`id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `hint`, `correct_answer`, `difficulty`, `is_essay`, `degree`, `category_id`, `quiz_id`, `homework_id`, `exam_id`, `platform`, `vdo_id`, `created_at`, `updated_at`) VALUES
(92, '<h1>&nbsp;</h1><p>ttt</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', NULL, 'answer2', NULL, 0, 44, NULL, 8, NULL, NULL, NULL, NULL, '2024-11-08 16:56:47', '2024-11-08 16:56:47'),
(95, '<h1>&nbsp;</h1><p>ff</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', NULL, 'answer4', NULL, 0, 44, NULL, 8, NULL, NULL, NULL, NULL, '2024-11-08 17:13:03', '2024-11-08 17:13:03'),
(96, '<h1>&nbsp;</h1><p>ttt</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', NULL, 'answer2', NULL, 0, 4, NULL, 8, NULL, NULL, NULL, NULL, '2024-11-08 17:21:31', '2024-11-08 17:21:31'),
(97, '<h1>&nbsp;</h1><p>ff</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', NULL, 'answer3', NULL, 0, 6, NULL, 8, NULL, NULL, NULL, NULL, '2024-11-08 17:24:06', '2024-11-08 17:24:06'),
(98, '<h1>&nbsp;</h1><p>dd</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', '<h1>&nbsp;</h1><h2>D</h2>', 'answer1', NULL, 0, 2, NULL, 8, NULL, NULL, 'vdocipher', 'a687056b-e0ba-4f59-a349-f16a193ca654', '2024-11-08 17:26:13', '2024-11-08 17:26:13'),
(102, '<h1>aaaaaaaa</h1><p>&nbsp;</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', '<h1>&nbsp;</h1><h2>D</h2>', 'answer1', 'easy', 0, 22222, 10, NULL, NULL, NULL, 'vimeo', '22222', '2025-08-02 12:54:32', '2025-08-02 12:54:32'),
(103, '<h1>&nbsp;</h1><p>wwwww</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', NULL, 'answer1', NULL, 0, 1, NULL, NULL, 14, NULL, NULL, NULL, '2025-08-02 14:15:19', '2025-08-02 14:15:19'),
(106, '<h1>22</h1><p>&nbsp;</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', '<h1>&nbsp;</h1><h2>D</h2>', 'answer2', NULL, 0, 22, NULL, NULL, 16, NULL, NULL, NULL, '2025-08-04 14:21:48', '2025-08-04 14:21:48'),
(107, '<h1>qqqq</h1><p>&nbsp;</p>', '<h1>&nbsp;</h1><h2>A</h2>', '<h1>&nbsp;</h1><h2>B</h2>', '<h1>&nbsp;</h1><h2>C</h2>', '<h1>&nbsp;</h1><h2>D</h2>', '<h1>&nbsp;</h1><h2>D</h2>', 'answer1', NULL, 0, 22, NULL, 11, NULL, NULL, NULL, NULL, '2025-08-04 14:22:12', '2025-08-04 14:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `success_rate` tinyint(4) NOT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `duration`, `lecture_id`, `success_rate`, `visibility`, `created_at`, `updated_at`) VALUES
(8, 2, 50, 20, 0, '2024-11-08 16:34:56', '2024-11-08 16:36:32'),
(11, 12, 151, 22, 0, '2025-08-04 14:22:04', '2025-08-04 14:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(9, 'superadmin', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions_lectures`
--

CREATE TABLE `sessions_lectures` (
  `id` int(11) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `stage` int(11) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `parent_mobile` varchar(11) NOT NULL,
  `parent_mobile2` varchar(11) DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `school` varchar(255) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `api_token` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `username`, `password`, `stage`, `mobile`, `parent_mobile`, `parent_mobile2`, `area`, `profile_pic`, `lastseen`, `parent_id`, `school`, `active`, `api_token`, `section`, `approved_by`, `amount`, `remember_token`, `created_at`, `updated_at`) VALUES
(265, 'Cathleen', 'omarahmed', '$2y$10$1PtrRIhH0DZ5Erl9FepUTuCNF7lJoJciybChdfFUOIsyLGUKTgA6m', 3, '01016046298', '85766666666', '78576666666', '1', '1727402997-247.jpg', NULL, 551603, 'Quod dolore id sed', 1, NULL, 'scientific', 1, 0, NULL, '2024-09-27 05:09:58', '2024-10-11 16:33:30'),
(407, 'Mohamed Ahmed', 'mohamed3a', '$2y$10$TUABx2iow8vqpS2EwPGubOZ2cDpiLLPW91R06ZA9lTSG7yFfSbR0O', 333, '01152393524', '01225658732', NULL, '1', '1741289108-945.jpg', NULL, 829195, 'MHLS', 1, NULL, NULL, 1, 0, NULL, '2025-03-06 21:25:08', '2025-04-22 14:08:13'),
(408, 'Mazen moataz', 'mazen', '$2y$10$ROdS2n.lziMfNOyj2R65gefsYMfprXVDk4RSzqj0S6HE8zSit50KO', 333, '01017495881', '01003414810', '01005005816', '39', '1741512834-705.jpg', NULL, 863830, 'Manaret Heliopolis', 1, NULL, NULL, 1, 0, NULL, '2025-03-09 11:33:54', '2025-03-09 21:31:35'),
(409, 'Monzer', 'Hatem', '$2y$10$qrgz63gT5CtDv/WtWqCBQ.kRRHn.Qf6lZJnIyXm7yAW/zHl/8/5Hq', 333, '01068658007', '01017222480', '01001793338', '17', '1741770305-593.jpg', NULL, 407414, 'Manaret Heliopolis', 1, NULL, NULL, 1, 0, NULL, '2025-03-12 11:05:05', '2025-03-16 09:02:53'),
(411, 'Mohamed', 'Mohamef', '$2y$10$g2pmMwnsDKNZUGmACkhcNuDw4hkes8SaPRPDNkMAqZPnTc2PIyTZ6', 333, '01008331515', '01092920155', '01008331515', '39', '1742931825-709.jpg', NULL, 163320, 'Manaret Heliopolis schools', 1, NULL, NULL, 1, 0, NULL, '2025-03-25 21:43:45', '2025-03-26 08:34:18'),
(412, 'Mohamed Khaled', 'Mohamed', '$2y$10$DHolzBr9DSEUrvHQlSHTdepz6yEKPgyahB3UUYCxj5sW9zJp4rJMK', 333, '01111370037', '01008331515', '01092920155', '39', '1742932376-510.jpg', NULL, 584081, 'Manaret Heliopolis schools', 0, NULL, NULL, NULL, 0, NULL, '2025-03-25 21:52:56', '2025-03-25 21:52:56'),
(413, 'Eyad Ahmed', 'Eyad16', '$2y$10$0Qej2yW.QwHBEThZutKRsO6IGHHAQe1DyOf1fYKGwzqJq6o5vcC62', 33, '01000378737', '01000572085', '01114448757', '39', '1744489459-597.png', NULL, 321511, 'Manaret heliopolis', 0, NULL, NULL, NULL, 0, NULL, '2025-04-12 22:24:19', '2025-04-12 22:24:19'),
(415, 'Gamal', 'Gamal', '$2y$10$EYn3RBJvaWEozcKkbR411.zaoTHW47lQ/qNVYvz.I25TMP0rNc7qK', 2, '01080895502', '01015454759', '01080895502', '8', '1746291383-522.jpg', NULL, 594052, 'Alaola', 0, NULL, 'scientific', NULL, 0, NULL, '2025-05-03 19:56:23', '2025-05-03 19:56:23'),
(416, 'test', 'test', '$2y$10$7qsu0sDi24USncg1d6YqbeU3DewB3UpSQEr9eb8I31GASOlb.mFMG', 1, '01205465494', '01205465494', NULL, '1', '1754213021-647.png', NULL, 216130, 'wwwww', 1, NULL, NULL, 44, 1, NULL, '2025-08-03 12:23:41', '2025-08-03 12:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `student_answers`
--

CREATE TABLE `student_answers` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `student_answer` varchar(255) DEFAULT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `n` int(11) DEFAULT NULL,
  `draft` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_results`
--

CREATE TABLE `student_results` (
  `id` int(11) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `student_degree` int(11) NOT NULL,
  `assignment_degree` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `username`, `password`, `subject`, `mobile`, `profile_pic`, `description`, `remember_token`, `api_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lillian omar', 'sazidamyje', '$2y$10$kgfWryc6yd1KSCQNWDVDOOjPWbI/FWf/lgcZZqK0sG.y3GEKqCpnm', 'تاريخ', '01111111111', '1727790068-419.jpg', 'Sapiente fugit iust', NULL, NULL, '2024-10-01 16:41:08', '2024-10-10 11:47:00', '2024-10-10 11:47:00'),
(2, 'omar teacher', 'omar123', '$2y$10$nAA7vI1huJEGFUfm9Up5OueULJ4jYuymWKPzd2NxitJZ0yDJGBjLS', 'الفيزياء', '01016046298', '1728543670-908.jpg', '01016046298', NULL, NULL, '2024-10-10 10:01:10', '2024-11-26 11:45:21', '2024-11-26 11:45:21'),
(3, 'Mr. Araby Hamed', 'arabyhamed', '$2y$10$OVXhmqS3bxYxi0CggafFEuV1N/q7AEx2UPl4JEoFSxpuuvy3qvpoa', 'اللغة العربية', '01115729781', '1730491965-355.jpg', 'فارق بخبرة 28 سنة ، ارتقاء ، شرح مبسط تدريبات واختبارات للصف الثالث الإعدادي والأول الثانوي.', NULL, NULL, '2024-10-10 11:49:38', '2024-11-09 18:43:38', NULL),
(4, 'Kelly Blanchard', 'piqunexu', '$2y$10$Ykg92hDDkkl1nhVY1iw9XOc1Zn0njvNG.LELVu.I0LY5oOFRfRQU2', 'math', '01016046292', '1729584543-166.jpg', 'Commodo adipisci nes', NULL, NULL, '2024-10-22 11:09:03', '2024-10-29 09:54:49', '2024-10-29 09:54:49'),
(5, 'Ronan Blair', 'tidimepo', '$2y$10$CYI1VhCZPYsplsyQR1zF1eD7KU/ZIo88e5IpyPXALtVVIX6FRzqjy', 'spanish', '01016046292', '1729584761-430.jpg', 'Illum qui dolor rat', NULL, NULL, '2024-10-22 11:12:41', '2024-10-29 09:54:54', '2024-10-29 09:54:54'),
(6, 'omar fahmy', 'zugofijupo', '$2y$10$lYnhud/1Pf844B8LP7JNQe8z5FTtrBZAdrs5wWRxLaglgo14cfOq6', 'اللغة العربية', '01016046292', '1729584874-388.png', 'Elit mollit volupta', NULL, NULL, '2024-10-22 11:14:34', '2024-10-29 09:54:52', '2024-10-29 09:54:52'),
(7, 'Mr.Mohamed Bakry', 'MohamedBakry', '$2y$10$9yRdiNhN1WbDBGca.mbRg.ZAdryj.uoVDHqyNPF8Tes.9j/CjwYzi', 'اللغة العربية', '01060268152', '1730492259-903.jpg', 'خبرة 15 سنة في المرحلتين الإعدادية والثانوية شرح مبسط ، تدريبات متنوعة ، أختبارات دورية.', NULL, NULL, '2024-11-01 22:17:40', '2024-11-01 22:17:40', NULL),
(8, 'Mr.Gamal Abuzead', 'GamalAbuzead', '$2y$10$.HMGOHnicGEKGYJRBsWhJOwzqvzltKL9h/tLE5KriysIo2f/Z.x7C', 'english', '01006558027', '1730493010-829.jpg', 'خريج تربية إنجليزي ، خبرة 27سنة ، منصة Prodigy فلسفتها قائمة على مساعدة الطالب من  Zero  للــ Hero\r\nالمنصة هدفها الإرتقاء بالطالب ومستواه العلمي', NULL, NULL, '2024-11-01 22:30:10', '2024-11-01 22:30:10', NULL),
(9, 'MR.Omar Raslan', 'OmarRaslan', '$2y$10$ZtubFC8X0gV/EtAA1h4ZgOw/EczzoCtbsS8rqPtRtMc06ATmKOd5G', 'تاريخ', '01024273333', '1730493341-775.jpg', 'مدرس أول تاريخ\r\nخبرة أكثر من 25 سنه في مجال التربية والتعليم ،معانا مش هتتعلم بس تاريخ ..هنعيش التاريخ مع بعض.', NULL, NULL, '2024-11-01 22:35:41', '2024-11-01 22:35:41', NULL),
(10, 'Mr. Ahmed Abd El-Wahed', 'mrahmedabdelwahed', '$2y$10$eKn6Ctn0KGstJfrWJ8HUKOxpxL5dF.IISCCqiOvd.2KuytivHt6au', 'math', '01000735518', '1731170075-849.jpg', 'Mr. Ahmed Abd El-Wahed\r\nMaths Teacher', NULL, NULL, '2024-11-09 18:34:35', '2024-11-09 19:08:08', NULL),
(11, 'Mr.Mahmoud El-Saeed', 'mahmoudsaeed', '$2y$10$QZhLFEd2uVTJ/cDK1.LMse4Yb2dO4hBGyarelqz9mWAftYwz1Kppe', 'physics', '01007964906', '1731170533-494.jpg', 'بكالوريوس العلوم(physics _chemistry) خبرة ١٢ سنة تدريس physics أسلوب شرح سهل للمفاهيم العلمية تبسيط بدون تسطيح', NULL, NULL, '2024-11-09 18:42:13', '2024-11-09 19:08:37', NULL),
(12, 'Mr.Sherief El-Houseiny', 'sheriefelhouseiny', '$2y$10$9DdN1wJhnqhq7tIiypLDzOmQwzPJx3MsG1rb4obcRAxarZHbtFGMm', 'فلسفة و منطق', '01145310113', '1731171064-140.jpg', 'خبرة 20سنة في طرق تدريس المواد الفلسفية، مؤلف كتاب امتحانك للثانوية العامة، عضو في وضع الاسئلة في المركز القومي للامتحانات', NULL, NULL, '2024-11-09 18:51:04', '2024-11-27 14:30:43', NULL),
(13, 'Ms. Fatma Salah', 'fatmasalah', '$2y$10$jyyfaq22c18mL18TyPzhDOVAaP4wAdOxfbr.x5gq2BHvIkmMoxSyK', 'اللغة العربية', '01091009720', '1731171787-895.jpg', 'Ms. Fatma Salah\r\nArabic Teacher', NULL, NULL, '2024-11-09 19:03:07', '2024-11-09 19:03:07', NULL),
(14, 'Mr. Amr Fahmy', 'amrfahmy', '$2y$10$2PZm1daec4rikDtFz.HDluFx1ZksG65q3angWlw1zD1Jt3yT78Rqi', 'english', '01273408721', '1731172072-398.jpg', 'Mr. Amr Fahmy\r\nEnglish Teacher', NULL, NULL, '2024-11-09 19:07:52', '2024-11-09 19:07:52', NULL),
(15, 'Mrs. Noha Mohamed', 'nohamohamed', '$2y$10$PpcpNd8dixjpK0azsMiYqO9WgvyJ0lMzfLEtZOYhtpzNJ8DCa8KhK', 'math', '01013154457', '1731172939-348.jpg', 'مع ميس نها ال (Maths) مفيهوش مشكلة', NULL, NULL, '2024-11-09 19:22:19', '2024-11-09 19:28:51', NULL),
(16, 'Mr. Ahmed Abd El-fattah', 'ahmedabdelfattah', '$2y$10$91Zmpeth4GA259N532KrDOq3ecvlddtd/wbWSV848cXVmTDEjDx3.', 'science', '01066940721', '1731174058-993.jpg', 'Mr. Ahmed Abd El-fattah\r\nScience Teacher', NULL, NULL, '2024-11-09 19:40:58', '2024-11-27 13:00:02', NULL),
(17, 'Mr. Ahmed El-Mahdy', 'ahmedelmahdy', '$2y$10$vqf8URaOmVkBCDtIhM6w7ehsS50BtXX3ffbAHArTN8AX7G2WGtkEy', 'integrated science', '01005845257', '1731174274-688.jpg', 'Mr. Ahmed El-Mahdy\r\nIntegrated Science Teacher', NULL, NULL, '2024-11-09 19:44:34', '2024-11-25 20:23:45', NULL),
(18, 'Mrs. Gehan Asem', 'gehanasem', '$2y$10$jz80qP9HCBXrpPuVEzwZEutpuLOn10eFuj.xaVe54T1XdheHNzdTu', 'biology', '01000953120', '1732611225-861.jpg', 'Mrs. Gehan Asem Biology', NULL, NULL, '2024-11-26 10:53:45', '2024-11-28 09:55:56', NULL),
(19, 'Hadeer Salem', 'hadeersalem', '$2y$10$o7.OSBVJdpVaM2anFcWgVe/79SIKNNZQu917LsLDxXebEL..RB9J6', 'english', '01004320363', '1745316150-480.jpg', 'English Teacher', NULL, NULL, '2025-03-03 05:50:46', '2025-04-22 12:02:30', NULL),
(20, 'Nada Osama', 'nadaosama', '$2y$10$u44ONXOyB1hRbv/lEdYs2uzP5PucKlHfjGOLcIUEOHgYX2k7U2OTS', 'english', '01003965627', '1745316307-979.jpg', 'English teacher', NULL, NULL, '2025-03-03 05:55:47', '2025-04-22 12:05:07', NULL),
(21, 'Ms. Yara Mahmoud', 'yaramahmoud', '$2y$10$u/usutaiOrb.LUGoYMUWV.smCpv7bD50TfGTrWOX2gAp5W9OOhqO.', 'math', '01003965627', '1745400831-517.jpg', 'Math Teacher', NULL, NULL, '2025-03-03 06:01:54', '2025-04-23 11:33:51', NULL),
(22, 'Ms. Naglaa Abd El-Hakeem', 'naglaaabdelhakeem', '$2y$10$3CQFR2DspMdMJ.3hoTyLOuRGvesz3ajZsEuPLOpsOgZ2SixopGlIm', 'اللغة العربية', '01003965627', '1745323776-737.jpg', 'Arabic teacher', NULL, NULL, '2025-03-03 06:07:36', '2025-04-22 14:09:36', NULL),
(23, 'Ms. Habiba Mohamed', 'habibamohamed', '$2y$10$atGvMV1BZmo5iMgcVxuEQ.QAm8FhxkD3Ntemw.ZXZUautWhPQo/Om', 'اللغة العربية', '01003965627', '1745400767-227.jpg', 'Arabic Teacher', NULL, NULL, '2025-03-03 06:14:45', '2025-04-23 11:32:47', NULL),
(24, 'Ms.Asmaa Ahmed', 'asmaaahmed', '$2y$10$jesLfZLeSIW07wnm.BZUOOMELUglBrzlJqRaLKGsWYl.XROyOj4qS', 'اللغة العربية', '01003965627', '1745315584-704.jpg', 'Arabic Teacher', NULL, NULL, '2025-03-03 06:20:45', '2025-04-22 12:26:07', NULL),
(25, 'test', 'test', '$2y$10$Z4HEDy1H2EQhjSeyVS2uFutHFUtrE9awMnEP56u.kMX7bXl.Cxpwm', 'الرياضيات', '01205465494', '1754127935-356.png', 'wwwwwwwwwwww', NULL, NULL, '2025-08-02 12:26:47', '2025-08-02 12:45:42', '2025-08-02 12:45:42'),
(26, 'test', 'test22', '$2y$10$0ii6bERCVThvwqS8.zK3uuaLsDhQfYyFB3gCdLzsnXu6w8y6/RrTG', 'اللغة العربية', '01205465494', '1754128185-529.png', 'wwwww', NULL, NULL, '2025-08-02 12:49:45', '2025-08-03 12:22:33', '2025-08-03 12:22:33'),
(27, 'test', 'test23', '$2y$10$Bj/BfGskII7uXN891s449uf6CwVcVW.7JoqAAeBtpBQP236eKTYmi', 'chemistry', '01205465494', '1754301149-910.png', 'teeeeeeee', NULL, NULL, '2025-08-04 12:52:29', '2025-08-04 12:52:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trialexam`
--

CREATE TABLE `trialexam` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stage` tinyint(4) NOT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `v_model` tinyint(4) NOT NULL DEFAULT 0,
  `is_buying` tinyint(4) NOT NULL DEFAULT 1,
  `nextlecture` int(10) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `success_rate` int(11) NOT NULL,
  `edu_type` tinyint(4) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trialexam_history`
--

CREATE TABLE `trialexam_history` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `code_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL,
  `vdo_id` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `lecture_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`, `description`, `is_public`, `vdo_id`, `platform`, `lecture_id`, `teacher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, 'fff', 'fddf', 0, '20b3fb5786484f148c770817659fc465', 'vdocipher', 52, 3, '2024-11-24 14:34:37', '2024-11-24 14:52:26', '2024-11-24 14:52:26'),
(33, 'Mr.Mahmoud El-Saeed', '2nd Secondary-Physics-November Revision-Mr.Mahmoud Elsaeed', 1, 'e3761843f78145d783ffd0ded5589233', 'vdocipher', 54, 11, '2024-11-25 13:13:29', '2024-11-25 13:13:29', NULL),
(34, 'Mr.Mohamed Bakry', 'الصف الأول الثانوي - اللغة العربية - مراجعة شهر نوفمبر - أ/ محمد بكري', 1, '20b3fb5786484f148c770817659fc465', 'vdocipher', 55, 7, '2024-11-25 19:06:00', '2024-11-25 19:06:00', NULL),
(35, 'Ms. Fatma Salah', 'الصف الثاني الثانوي-اللغة العربية-مراجعة شهر نوفمبر-أ.فاطمة صلاح', 1, '9d7ea3f899e2463dbcc98158af324f95', 'vdocipher', 56, 13, '2024-11-25 20:13:26', '2024-11-25 20:13:26', NULL),
(36, 'Mr. Ahmed Abd El-Wahed', '1st Secondary-Math (Algebra) - November revision', 1, '9dca0d60fd2848ac8c08e3730cfc938a', 'vdocipher', 57, 10, '2024-11-25 20:21:31', '2024-11-25 20:21:31', NULL),
(37, 'Mrs. Noha Mohamed', '3rd Prep-Math-November Revision-Geometry-Mrs.Noha Mohamed', 1, '470d1bbeae554af18286d77c4c9d2b5a', 'vdocipher', 58, 15, '2024-11-25 20:36:36', '2024-11-25 20:36:36', NULL),
(38, 'Mr. Araby Hamed', 'مراجعة اللغة العربية للصف الثالث الاعدادي (شهر نوفمبر) أ/ عربي حامد', 1, 'f1971beaed36437d807c798b5eaf94ef', 'vdocipher', 59, 3, '2024-11-26 10:58:15', '2024-11-26 10:58:15', NULL),
(39, 'Mrs. Noha Mohamed', '3rd Prep-Math(Algebra)-November Revision-Mrs.Noha Mohamed.mp4', 1, '89f559106a914f518ad0c3b8623e088d', 'vdocipher', 60, 10, '2024-11-27 09:32:45', '2024-11-27 09:32:45', NULL),
(40, 'Mr. Ahmed Abd El-Wahed', '1st Sec-Math (Geometry)-November Revision-Mr.Ahmed Abdelwahied', 1, '8b581ae457344714bdf4b2db0314a859', 'vdocipher', 61, 10, '2024-11-27 09:37:00', '2024-11-27 09:37:00', NULL),
(41, 'Mrs. Gehan Asem', '2nd Sec Biology November Revision Mrs. Gehan Asem', 1, '91a551f4789d4d418d2444dee75dfa3d', 'vdocipher', 62, 18, '2024-11-27 09:56:24', '2024-11-27 09:56:24', NULL),
(42, 'Mr. Amr Fahmy', '3rd prep english OL Nov Revision Mr. Amr Fahmy', 1, '97a3c39398f048d5b1ffc8577e32ac23', 'vdocipher', 63, 14, '2024-11-27 10:45:57', '2024-11-27 10:45:57', NULL),
(43, 'Mr. Gamal Abou Zied', '1st sec English-November Revision. Mr. Gamal Abouzied', 1, '9bebf51046f64030a7f23deb8ce047ab', 'vdocipher', 64, 8, '2024-11-27 10:50:23', '2024-11-27 10:50:23', NULL),
(44, 'MR.Omar Raslan', '1st Sec History November Revision Mr. Omar Raslan', 1, '40421f41405d4e4d87941bf8b432c50c', 'vdocipher', 65, 9, '2024-11-27 12:20:45', '2024-11-27 12:20:45', NULL),
(45, 'Mr. Ahmed El-Mahdy', '1st Secondary-Integrated Science-November Revision Mr. Ahmed Elmahdy', 1, '4c62f87f62a64684ae1982b35a1c084f', 'vdocipher', 66, 17, '2024-11-27 12:26:08', '2024-11-27 12:26:08', NULL),
(46, 'Mr. Ahmed Abd El-Fattah', '3rd prep Science Nov Revision Mr. Ahmed Abd El-Fattah', 1, '7980e8c52c61480c9b4f6c1c9c8840dc', 'vdocipher', 67, 16, '2024-11-27 13:05:08', '2024-11-27 13:05:08', NULL),
(47, 'Mr.Sherief El-Houseiny', '1st Sec Philosophy Nov Revision', 1, '41abf4b30da1468ea18f98f71c5e2f40', 'vdocipher', 68, 12, '2024-11-27 14:37:57', '2024-11-27 14:37:57', NULL),
(48, 'Mrs. Noha Mohamed', '3rd Prep Math (algebra) Final Revision 1st Term Mrs.Noha Mohamed', 0, '3eda159ee8a54abaa79936cf100fed11', 'vdocipher', 69, 15, '2024-12-31 12:10:02', '2024-12-31 12:10:02', NULL),
(49, 'Mrs. Noha Mohamed', '3rd Prep Math (Geometry) Final Revision First Term', 0, '57fb60efca6c45b0a11761087977c6fb', 'vdocipher', 70, 15, '2025-01-04 11:38:49', '2025-01-04 11:38:49', NULL),
(50, 'Mr. Ahmed Abd El-Wahed', '1st Sec Math (Algebra) First Term Final Revision Mr. Ahmed Abd El-Wahed', 0, 'c50784a2d9054fcab4268ee1ac872156', 'vdocipher', 71, 10, '2025-01-04 11:47:38', '2025-01-04 11:47:38', NULL),
(51, 'Mr. Ahmed Abd El-Wahed', '1st Sec Geometry Final Revision First Term Mr. Ahmed Abe El-Wahed', 0, '04beb7eb0b5242f99061c290b3a3ef2d', 'vdocipher', 72, 10, '2025-01-04 11:52:28', '2025-01-04 11:52:28', NULL),
(52, 'Mr. Amr Fahmy', '3rd Prep English Final Revision First Term Part (1) Mr. Amr Fahmy', 0, 'c429f2918d874c578dc7b440ff83244b', 'vdocipher', 73, 14, '2025-01-04 12:05:57', '2025-01-04 12:05:57', NULL),
(53, 'Mrs. Gehan Asem', '2nd Sec Biology Final Revision First  Term Part (1) Mrs. Gehan Asem', 0, '8a520c005d0745f292d9f1a19bb7331e', 'vdocipher', 74, 18, '2025-01-04 12:19:37', '2025-01-04 12:19:37', NULL),
(54, 'Mr. Ahmed El-Mahdy', '1st Sec Integrated Science Final Revision First Term Part(1) Mr. Ahmed El-Mahdy', 0, '956bb60124a34910ba9b994358f7af15', 'vdocipher', 75, 17, '2025-01-05 08:31:54', '2025-01-05 08:31:54', NULL),
(55, 'Mr. Araby Hamed', '3rd Prep Arabic Final revision First Term Part 1 Mr. Araby Hamed', 0, 'ad11ac8b489e41d7adde655d8895960c', 'vdocipher', 76, 3, '2025-01-05 08:39:34', '2025-01-05 08:39:34', NULL),
(56, 'Mr. Ahmed Abd El-Fattah', '3rd Prep Science Final Revision First Term Part (1) Mr. Ahmed Abd El-Fattah', 0, 'cf7354f06efb4d9ab28052340522cbba', 'vdocipher', 77, 16, '2025-01-05 08:46:07', '2025-01-05 08:46:07', NULL),
(57, 'Mr. Ahmed Abd El-Wahed', '1st Sec Trigonometry Final Revision First Term Mr. Ahmed Abd El-Wahed', 0, 'f601ec7b6b934ccc8d569b529766f03e', 'vdocipher', 78, 10, '2025-01-05 13:05:32', '2025-01-05 13:05:32', NULL),
(58, 'Mr. Mahmoud El-Saeed', '2nd Sec Physics Final Revision First Term Part (1) Mr. Mahmoud El-Saeed', 0, '72e100bff2e7496a98795004eecc098b', 'vdocipher', 79, 11, '2025-01-05 13:14:25', '2025-01-05 13:14:25', NULL),
(59, 'Mr. Mahmoud El-Saeed', '2nd Sec Physics Final Revision First Term Part (2) Mr. Mahmoud El-Saeed', 0, '7f9e2b3ff2f744248316364f6f5ab68c', 'vdocipher', 80, 11, '2025-01-05 13:19:29', '2025-01-05 13:19:29', NULL),
(60, 'Mr. Mahmoud Al-Saeed', '2nd Sec Physics Final Revision First Term Part (3) Mr. Mahmoud Al-Saeed', 0, '237c54cc6a7a45c8895803882018c361', 'vdocipher', 81, 11, '2025-01-06 22:01:37', '2025-01-06 22:01:37', NULL),
(61, 'Mr. Ahmed El-Mahdy', '1st Sec Integrated Science Final Revision 1st Term Part 2 Mr. Ahmed El-Mahdy', 0, '168a847815f848e0b4b84ad52411b526', 'vdocipher', 82, 17, '2025-01-08 08:17:20', '2025-01-08 08:17:20', NULL),
(62, 'Mr. Ahmed El-Mahdy', '1st Sec Integrated Science Final Revision 1st Term Part 3 Mr. Ahmed El-Mahdy', 1, 'c60983032ee749ba9c883d085c1f5a1b', 'vdocipher', 83, 17, '2025-01-08 09:58:25', '2025-01-08 09:58:25', NULL),
(63, 'Mr.Mohamed Bakry', '1st sec Arabic Final Revision 1st Term Mr.Mohamed Bakry', 0, '1f82d37a26fa4a4e91832fe10167f289', 'vdocipher', 84, 7, '2025-01-11 09:52:20', '2025-01-11 09:52:20', NULL),
(64, 'Ms.Habiba', 'نموذج كتابة قصة', 1, 'bf608243731e48a59a3d335fc133d922', 'vdocipher', 87, 23, '2025-03-06 00:17:53', '2025-04-21 15:16:45', NULL),
(65, 'Ms. Habiba Mohamed', 'ثقافات الشعوب', 1, 'feab4167f523418d920f7b65726ef586', 'vdocipher', 88, 23, '2025-03-06 20:41:46', '2025-04-21 15:11:36', NULL),
(66, '3rd Prim Arabic Ms.Habiba(3)', 'مسرح المدرسة', 1, 'd658d87d603f488eb4242fcdeb760068', 'vdocipher', 89, 23, '2025-03-06 20:50:24', '2025-04-21 15:10:28', NULL),
(67, 'Ms.Habiba Mohamed (4)', 'قصة الصديقتان', 1, '6a6700cc80394570a94420d829c009ea', 'vdocipher', 89, 23, '2025-03-06 21:09:26', '2025-04-21 15:17:43', '2025-04-21 15:17:43'),
(68, 'Ms. Asmaa Ahmed', 'غة عربية الغابة المتحجرة الصف الثالث الابتدائي', 1, '18e97dc3321245d1a3b5a0ca664f1b92', 'vdocipher', 90, 24, '2025-03-06 21:13:09', '2025-04-21 14:18:31', NULL),
(69, 'Ms. Asmaa Ahmed', 'Arabic 3rd Prim Ms. Asmaa(2)', 1, 'f28d6607912642b7a636bd6a4b9950b5', 'vdocipher', 90, 24, '2025-03-06 21:14:24', '2025-04-21 14:19:13', '2025-04-21 14:19:13'),
(70, 'Ms. Asmaa Ahmed', 'Arabic 3rd Prim Ms. Asmaa (2)', 1, 'f28d6607912642b7a636bd6a4b9950b5', 'vdocipher', 90, 24, '2025-03-06 21:20:11', '2025-03-06 21:20:22', '2025-03-06 21:20:22'),
(71, 'Ms. Naglaa Abd El-Hakeem', 'لعبة الكنز', 1, '9de83e8c9904419ba34455c3d2b7dbc2', 'vdocipher', 91, 22, '2025-03-06 21:28:58', '2025-04-21 15:40:52', NULL),
(72, 'Ms. Naglaa Abd El-Hakeem', 'Arabic 3rd Prim Ms. Naglaa  (2)', 1, 'f10340ce293a4828b54f07086cd7413b', 'vdocipher', 91, 22, '2025-03-06 21:30:20', '2025-03-08 17:00:16', '2025-03-08 17:00:16'),
(73, 'Ms. Yara Mahmoud', 'Multiples of 11&12', 1, 'f07f161b7e624568a7b28fae6d5aac2e', 'vdocipher', 92, 21, '2025-03-06 21:50:56', '2025-04-21 16:35:48', '2025-04-21 16:35:48'),
(74, 'Ms. Yara Mahmoud', 'Associative Property', 1, '7400f47b2eac479ea4670932f676cad5', 'vdocipher', 92, 21, '2025-03-06 21:53:15', '2025-04-21 16:11:12', NULL),
(75, 'Ms. Yara Mahmoud', 'Relations between X and ÷', 1, '401a7cf9af60482d8495109146c83d6e', 'vdocipher', 92, 21, '2025-03-06 21:54:56', '2025-04-21 16:27:28', '2025-04-21 16:27:28'),
(76, 'Ms. Yara Mahmoud', 'Perimeter & Area', 1, 'a590b9cb7d3b49f381f54d1abeaa2181', 'vdocipher', 92, 21, '2025-03-06 21:55:35', '2025-04-21 16:29:14', '2025-04-21 16:29:14'),
(77, 'Ms. Asmaa Ahmed', 'Arabic Ms. Asmaa Ahmed (3)', 1, '3cf71ded916b4f2f875c338b3a0945c1', 'vdocipher', 90, 24, '2025-03-06 22:07:11', '2025-04-21 14:25:22', '2025-04-21 14:25:22'),
(78, 'Ms. Hadeer Salem', 'English 3rd Prim Ms.Hadeer(2)', 1, 'e02bc1c7b35841149a43ef75cdd28801', 'vdocipher', 93, 19, '2025-03-06 22:12:10', '2025-04-21 18:38:33', '2025-04-21 18:38:33'),
(79, 'Ms. Hadeer Salem', 'unit 7- Lesson1-where are the family?', 1, '6ce92f0375a54a2592f0423401413b8c', 'vdocipher', 93, 19, '2025-03-06 22:19:39', '2025-04-21 18:40:41', NULL),
(80, 'Ms. Hadeer Salem', 'English 3rd Prim Ms.Hadeer(3)', 1, 'c3ef2342263c4f7ea2dcdfca8770be7d', 'vdocipher', 93, 19, '2025-03-06 22:22:53', '2025-04-21 18:38:14', '2025-04-21 18:38:14'),
(81, 'Ms. Nada Osama', 'Unit 8-Lesson1- At the museum', 1, 'd400a3134a614e41a7c2f5288bcb6d64', 'vdocipher', 94, 20, '2025-03-06 22:28:26', '2025-04-21 19:45:11', NULL),
(82, 'Ms. Nada Osama', 'Unit8-Lesson 4-Phonics', 1, '422bb8376af046e59c336327acee5bf0', 'vdocipher', 94, 20, '2025-03-06 22:30:02', '2025-04-21 19:58:44', '2025-04-21 19:58:44'),
(83, 'Ms. Nada Osama', 'Unit8-Lesson 5', 1, '2e938eecff0f47038d0c7fe8e6203d07', 'vdocipher', 94, 20, '2025-03-06 22:31:15', '2025-04-21 20:00:19', '2025-04-21 20:00:19'),
(84, 'Ms. Nada Osama', 'Unit 8-Lesson 6&7', 1, 'af101fa41c524ecf895b43afa7902996', 'vdocipher', 94, 20, '2025-03-06 22:32:01', '2025-04-21 20:01:42', '2025-04-21 20:01:42'),
(85, 'Ms. Yara Mahmoud', 'Math 3rd Prim (Evaluation) Ms.Yara', 1, '0a1b6f3592474d4f9802c2bcd786e0cb', 'vdocipher', 95, 21, '2025-03-06 22:35:53', '2025-03-06 22:35:53', NULL),
(86, 'Ms. Yara Mahmoud', '4 + 3 = ?', 1, 'f35bd8448c0a44cd93dcbdc413b998a7', 'vdocipher', 92, 21, '2025-04-17 11:23:41', '2025-04-21 16:22:17', '2025-04-21 16:22:17'),
(87, 'Arabic 3rd Primary Ms.Habiba', 'قصة الصديقتان للصف الثالث الابتدائي', 1, '6a6700cc80394570a94420d829c009ea', 'vdocipher', 88, 23, '2025-04-17 11:44:45', '2025-04-21 15:29:29', '2025-04-21 15:29:29'),
(88, 'Ms. Yara Mahmoud', 'Math 3rd Prim Ms. Yara - fractions 2', 1, '82e841dd58514285a02ea9a672b325c1', 'vdocipher', 92, 21, '2025-04-17 15:03:02', '2025-04-21 16:06:14', '2025-04-21 16:06:14'),
(89, 'Ms. Habiba Mohamed', 'المقايضة', 1, 'c7e5a76622bd4aff8cad40ee9cd5e069', 'vdocipher', 87, 23, '2025-04-21 13:00:08', '2025-04-21 13:21:12', '2025-04-21 13:21:12'),
(90, 'Ms. Habiba Mohamed', 'المقايضة', 1, 'c7e5a76622bd4aff8cad40ee9cd5e069', 'vdocipher', 88, 23, '2025-04-21 13:03:09', '2025-04-21 13:21:27', '2025-04-21 13:21:27'),
(91, 'Arabic 3rd Primary Ms.Habiba', 'المقايضة', 1, 'c7e5a76622bd4aff8cad40ee9cd5e069', 'vdocipher', 89, 23, '2025-04-21 13:23:38', '2025-04-21 13:44:03', '2025-04-21 13:44:03'),
(92, 'Arabic 3rd Primary Ms.Habiba', 'تعاون الحي', 1, '7b24d10c65204cb7bda018a2c3d71119', 'vdocipher', 106, 23, '2025-04-21 13:38:01', '2025-04-21 13:41:16', '2025-04-21 13:41:16'),
(93, 'Arabic 3rd Primary Ms.Habiba', 'Ms.Habiba-المقايضة', 1, 'c7e5a76622bd4aff8cad40ee9cd5e069', 'vdocipher', 106, 23, '2025-04-21 13:40:51', '2025-04-21 13:40:51', NULL),
(94, 'Arabic 3rd Primary Ms.Habiba', 'تعاون الحي', 1, '7b24d10c65204cb7bda018a2c3d71119', 'vdocipher', 106, 23, '2025-04-21 13:46:14', '2025-04-21 13:49:44', '2025-04-21 13:49:44'),
(95, 'Arabic 3rd Primary Ms.Habiba', 'تعاون الحي', 1, '7b24d10c65204cb7bda018a2c3d71119', 'vdocipher', 107, 23, '2025-04-21 13:49:22', '2025-04-21 13:49:27', NULL),
(96, 'Arabic 3rd Primary Ms.Habiba', 'رحلة الموز', 1, 'bdd195545f6e4b1d888cf97d89a5e15a', 'vdocipher', 108, 23, '2025-04-21 13:54:40', '2025-04-21 13:54:40', NULL),
(97, 'Arabic 3rd Prim Ms. Asmaa', 'لغة عربية نشيد الارض الصف الثالث الابتدائي', 1, 'f28d6607912642b7a636bd6a4b9950b5', 'vdocipher', 103, 24, '2025-04-21 14:05:30', '2025-04-21 14:05:30', NULL),
(98, 'Arabic 3rd Prim Ms. Asmaa', 'كتابة فقرة معلوماتية', 1, '3cf71ded916b4f2f875c338b3a0945c1', 'vdocipher', 109, 24, '2025-04-21 14:24:59', '2025-04-21 14:24:59', NULL),
(99, 'Arabic 3rd Prim Ms. Asmaa', 'اختراع عجيب & نموذج كتابة اعلان', 1, '54f0549fd9a648478c7f00512fada948', 'vdocipher', 110, 24, '2025-04-21 14:46:14', '2025-04-21 14:46:14', NULL),
(100, 'Arabic 3rd Prim Ms. Asmaa', 'اختي وقصة كفاح', 1, 'd2d91b57fd53481791af6da62ea1b2ff', 'vdocipher', 111, 24, '2025-04-21 14:52:43', '2025-04-21 14:52:43', NULL),
(101, 'Arabic 3rd Prim Ms. Asmaa', 'العصور الذهبية', 1, 'a47c83e286884abb8d63611ef3fd57a2', 'vdocipher', 112, 24, '2025-04-21 14:57:41', '2025-04-21 14:57:41', NULL),
(102, 'Ms. Asmaa Ahmed', 'طالب مميز', 1, '757df5b1c75e4192b73841665415ebb1', 'vdocipher', 113, 24, '2025-04-21 15:27:43', '2025-04-21 15:27:43', NULL),
(103, 'Arabic 3rd Primary Ms.Habiba', 'قصة الصديقتان', 1, '6a6700cc80394570a94420d829c009ea', 'vdocipher', 114, 23, '2025-04-21 15:36:43', '2025-04-21 15:36:43', NULL),
(104, 'Ms. Yara Mahmoud', 'Complex Story Problems 4 + 3 = ?...', 1, 'f35bd8448c0a44cd93dcbdc413b998a7', 'vdocipher', 96, 21, '2025-04-21 16:21:16', '2025-04-21 16:24:49', NULL),
(105, 'Ms. Yara Mahmoud', 'Relations between X and ÷', 1, '401a7cf9af60482d8495109146c83d6e', 'vdocipher', 97, 21, '2025-04-21 16:26:02', '2025-04-21 16:26:02', NULL),
(106, 'Ms. Yara Mahmoud', 'Perimeter & Area', 1, 'a590b9cb7d3b49f381f54d1abeaa2181', 'vdocipher', 98, 21, '2025-04-21 16:28:22', '2025-04-21 16:28:22', NULL),
(107, 'Ms. Yara Mahmoud', 'Multiples of 11&12', 1, 'f07f161b7e624568a7b28fae6d5aac2e', 'vdocipher', 102, 21, '2025-04-21 16:33:09', '2025-04-21 16:33:16', NULL),
(108, 'Ms. Yara Mahmoud', 'fractions 2', 1, '82e841dd58514285a02ea9a672b325c1', 'vdocipher', 115, 21, '2025-04-21 16:55:17', '2025-04-21 16:55:17', NULL),
(109, 'Ms. Yara Mahmoud', 'fractions 3', 1, '585487a71589483bbd40b1b2207710ff', 'vdocipher', 116, 21, '2025-04-21 17:00:23', '2025-04-21 17:00:23', NULL),
(110, 'Ms. Naglaa Abd El-Hakeem', 'قصة أستماع أناوأنت', 1, '170ac8feba804e078bc7de31ce8e451b', 'vdocipher', 119, 22, '2025-04-21 17:18:15', '2025-04-21 17:22:04', NULL),
(111, 'Ms. Naglaa Abd El-Hakeem', 'اللغة وسيلة تواصل', 1, 'b5cfc458c0174090a257dadf5d0fd631', 'vdocipher', 120, 22, '2025-04-21 17:20:12', '2025-04-21 17:20:12', NULL),
(112, 'Ms. Naglaa Abd El-Hakeem', 'قصة صندوق الذكريات و انواع الاسم', 1, '4c2a29c112764680b0209003ef6a376d', 'vdocipher', 121, 22, '2025-04-21 17:27:21', '2025-04-21 17:27:21', NULL),
(113, 'Ms. Naglaa Abd El-Hakeem', 'كتابة فقرة اقناعية', 1, 'b0e4f5b1f2c249548ac22735d6b18066', 'vdocipher', 122, 22, '2025-04-21 17:31:48', '2025-04-21 17:31:48', NULL),
(114, 'Ms. Naglaa Abd El-Hakeem', 'نريد ان نلعب', 1, '600f6d02ec6d4d6ba576f5666ed1b97b', 'vdocipher', 123, 22, '2025-04-21 17:50:40', '2025-04-21 17:50:40', NULL),
(115, 'Ms. Naglaa Abd El-Hakeem', 'نموذج كتابة الرأي', 1, 'ae34234fdbb64944a3de1b3c4eb052af', 'vdocipher', 125, 22, '2025-04-21 18:33:28', '2025-04-21 18:33:28', NULL),
(116, 'Ms. Naglaa Abd El-Hakeem', 'نشيد اصحاب المهن', 1, 'd164824438ca43888ba18b23cb5821bb', 'vdocipher', 124, 22, '2025-04-21 18:34:29', '2025-04-21 18:34:29', NULL),
(117, 'English 3rd Prim Ms.Hadeer', 'unite 7- lesson 6', 1, 'e02bc1c7b35841149a43ef75cdd28801', 'vdocipher', 126, 19, '2025-04-21 18:57:37', '2025-04-21 18:57:37', NULL),
(118, 'English 3rd Prim Ms.Hadeer', 'unit 7-lesson 7.', 1, 'c3ef2342263c4f7ea2dcdfca8770be7d', 'vdocipher', 127, 19, '2025-04-21 19:25:02', '2025-04-21 19:25:02', NULL),
(119, 'Ms. Yara Mahmoud', 'fractions', 1, 'e0c59ce6459148fc80f48ea5fbbd0f38', 'vdocipher', 117, 21, '2025-04-21 19:34:25', '2025-04-21 19:34:25', NULL),
(120, 'Ms. Yara Mahmoud', 'Telling the time...', 1, '1f58b5e36f194355a40a7797e8f0efbe', 'vdocipher', 118, 21, '2025-04-21 19:35:45', '2025-04-21 19:35:45', NULL),
(121, 'Ms. Nada Osama', 'Unit8-Lesson 4-Phonics', 1, '422bb8376af046e59c336327acee5bf0', 'vdocipher', 101, 20, '2025-04-21 19:57:32', '2025-04-21 19:57:32', NULL),
(122, 'Ms. Nada Osama', 'Unit8-Lesson 5', 1, '2e938eecff0f47038d0c7fe8e6203d07', 'vdocipher', 100, 20, '2025-04-21 19:59:33', '2025-04-21 19:59:33', NULL),
(123, 'Ms. Nada Osama', 'Unit 8-Lesson 6&7', 1, 'af101fa41c524ecf895b43afa7902996', 'vdocipher', 99, 20, '2025-04-21 20:01:00', '2025-04-21 20:01:00', NULL),
(125, 'Ms. Hadeer Salem', 'unit 9 lesson 1', 1, '2cc77df33b2f485988f6eb1e43b656cd', 'vdocipher', 129, 19, '2025-04-23 13:25:38', '2025-04-23 13:25:38', NULL),
(126, 'Ms. Hadeer Salem', 'unit 9 - lesson2 & 3...', 1, '3dcd727eeff44cd6b23f46bb784713e4', 'vdocipher', 130, 19, '2025-04-23 13:52:24', '2025-04-23 13:52:24', NULL),
(127, 'Ms. Hadeer Salem', 'unit 9- lesson 4 ,5 ,6', 1, '0f9b3088b01345a8a20f7e0a84a06d80', 'vdocipher', 131, 19, '2025-04-23 13:56:09', '2025-04-23 13:56:09', NULL),
(128, 'Ms. Hadeer Salem', 'unit 9-lesson 7', 1, '9ac70ee98ef54149822c0d6426ea6b5b', 'vdocipher', 132, 19, '2025-04-23 13:58:38', '2025-04-23 13:58:38', NULL),
(129, 'Ms. Nada Osama', 'unit 10 lesson 1-2', 1, '6b672d1930604430ba7818c926c45e5b', 'vdocipher', 133, 20, '2025-04-23 14:02:58', '2025-04-23 14:02:58', NULL),
(130, 'Ms. Nada Osama', 'English unit 10 lesson 3-6', 1, '72b659af04044778aeac6757cff2f022', 'vdocipher', 134, 20, '2025-04-28 11:32:28', '2025-04-28 11:32:28', NULL),
(131, 'Ms. Nada Osama', 'English unit 10 lesson 4-5', 1, '0928c729c3aa495a9524f713c5b8a9bf', 'vdocipher', 135, 20, '2025-04-28 11:35:52', '2025-04-28 11:35:52', NULL),
(132, 'Ms. Nada Osama', 'english unit 10 lesson 7', 1, 'daeee9b9fe3b4624878a54c51cda5da6', 'vdocipher', 136, 20, '2025-04-28 11:38:50', '2025-04-28 11:38:50', NULL),
(133, 'Ms. Hadeer Salem', 'unit 11 - Lesson1', 1, '0fc9e24d089048c289cbd9b60303792d', 'vdocipher', 137, 19, '2025-05-14 13:34:08', '2025-05-14 13:34:08', NULL),
(134, 'Ms. Hadeer Salem', 'unit 11 lesson 2 ,3', 1, '47305599108f418fa8ee0654dda93c18', 'vdocipher', 138, 19, '2025-05-14 13:39:10', '2025-05-14 13:40:07', NULL),
(135, 'Ms. Hadeer Salem', 'unit 11 lesson 4...', 1, '29e85e03f5b84fbc8b41eaa821b58f50', 'vdocipher', 139, 19, '2025-05-14 13:43:32', '2025-05-14 13:43:32', NULL),
(136, 'Ms. Hadeer Salem', 'unit 11 lesson 6', 1, 'b4840dfab42f4b6bad36a1c2cb8a49f0', 'vdocipher', 140, 19, '2025-05-14 13:45:56', '2025-05-14 13:45:56', NULL),
(137, 'Ms. Nada Osama', 'Unit 12 Lesson 1-2-3-4', 1, '9fbdfc8b728341a89b4504ebd59fe6db', 'vdocipher', 141, 20, '2025-05-15 13:20:09', '2025-05-15 13:20:09', NULL),
(138, 'Ms. Nada Osama', 'unit 12 lesson 5-6', 1, '59869f05ee2246bf8a7a979c32ee8cda', 'vdocipher', 142, 20, '2025-05-15 13:21:03', '2025-05-15 13:21:03', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`username`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`teacher_id`),
  ADD KEY `lecture_id` (`lecture_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `attend_by` (`attend_by`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendancequiz`
--
ALTER TABLE `attendancequiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `lecture_id` (`lecture_id`);

--
-- Indexes for table `attendance_session`
--
ALTER TABLE `attendance_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `bank_questions_sets`
--
ALTER TABLE `bank_questions_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `buying_history`
--
ALTER TABLE `buying_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `add_to_session_assistant` (`add_to_session_assistant`),
  ADD KEY `code_id` (`code_id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essay_correction`
--
ALTER TABLE `essay_correction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_answer_id` (`student_answer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `sent_by` (`sent_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionbank_categories`
--
ALTER TABLE `questionbank_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionbank_question`
--
ALTER TABLE `questionbank_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions_lectures`
--
ALTER TABLE `sessions_lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `sessions_lectures_ibfk_2` (`session_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `area` (`area`);

--
-- Indexes for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `q_id` (`q_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `student_results`
--
ALTER TABLE `student_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `exams_id` (`exam_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trialexam`
--
ALTER TABLE `trialexam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nextlecture` (`nextlecture`);

--
-- Indexes for table `trialexam_history`
--
ALTER TABLE `trialexam_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `code_id` (`code_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attendancequiz`
--
ALTER TABLE `attendancequiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_session`
--
ALTER TABLE `attendance_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bank_questions_sets`
--
ALTER TABLE `bank_questions_sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `buying_history`
--
ALTER TABLE `buying_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1502;

--
-- AUTO_INCREMENT for table `Countries`
--
ALTER TABLE `Countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essay_correction`
--
ALTER TABLE `essay_correction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_tokens`
--
ALTER TABLE `password_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1267;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `questionbank_categories`
--
ALTER TABLE `questionbank_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `questionbank_question`
--
ALTER TABLE `questionbank_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sessions_lectures`
--
ALTER TABLE `sessions_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `student_results`
--
ALTER TABLE `student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `trialexam`
--
ALTER TABLE `trialexam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trialexam_history`
--
ALTER TABLE `trialexam_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`attend_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_5` FOREIGN KEY (`lecture_id`) REFERENCES `attendance_session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendancequiz`
--
ALTER TABLE `attendancequiz`
  ADD CONSTRAINT `attendancequiz_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendancequiz_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance_session`
--
ALTER TABLE `attendance_session`
  ADD CONSTRAINT `attendance_session_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bank_questions_sets`
--
ALTER TABLE `bank_questions_sets`
  ADD CONSTRAINT `bank_questions_sets_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questionbank_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_questions_sets_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_questions_sets_ibfk_3` FOREIGN KEY (`homework_id`) REFERENCES `homeworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_questions_sets_ibfk_4` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_questions_sets_ibfk_5` FOREIGN KEY (`exam_id`) REFERENCES `trialexam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_questions_sets_ibfk_6` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buying_history`
--
ALTER TABLE `buying_history`
  ADD CONSTRAINT `buying_history_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buying_history_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buying_history_ibfk_3` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `essay_correction`
--
ALTER TABLE `essay_correction`
  ADD CONSTRAINT `essay_correction_ibfk_1` FOREIGN KEY (`student_answer_id`) REFERENCES `student_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lectures_ibfk_2` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sent_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD CONSTRAINT `password_tokens_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questionbank_question`
--
ALTER TABLE `questionbank_question`
  ADD CONSTRAINT `questionbank_question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questionbank_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questionbank_question_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homeworks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questionbank_question_ibfk_3` FOREIGN KEY (`exam_id`) REFERENCES `trialexam` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questionbank_question_ibfk_4` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions_lectures`
--
ALTER TABLE `sessions_lectures`
  ADD CONSTRAINT `sessions_lectures_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_lectures_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `attendance_session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD CONSTRAINT `student_answers_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homeworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_5` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_6` FOREIGN KEY (`exam_id`) REFERENCES `trialexam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_7` FOREIGN KEY (`q_id`) REFERENCES `questionbank_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_results`
--
ALTER TABLE `student_results`
  ADD CONSTRAINT `student_results_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_results_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homeworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_results_ibfk_3` FOREIGN KEY (`exam_id`) REFERENCES `trialexam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_results_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trialexam`
--
ALTER TABLE `trialexam`
  ADD CONSTRAINT `trialexam_ibfk_1` FOREIGN KEY (`nextlecture`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trialexam_history`
--
ALTER TABLE `trialexam_history`
  ADD CONSTRAINT `trialexam_history_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `trialexam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trialexam_history_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trialexam_history_ibfk_3` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
