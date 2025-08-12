-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 21, 2024 at 12:38 PM
-- Server version: 10.11.6-MariaDB-0+deb12u1
-- PHP Version: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sabry`
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
(1, 'prodigy', 'prodigy', '$2y$10$H2/tkGdgsaWwfhO4qjYULOFZZbcogxycvYB6cr2BsJu5XPgnu5r3S', NULL, NULL, '2024-10-10 11:45:38', '', '', '1705872745-209.jpg', NULL),
(38, 'Nour Mustafa', 'Nour', '$2y$10$0V8120e/H9hGB9SMB9ChU.X9jUTf7pUy.zTmK0FtngDRuszo0rBuK', NULL, '2024-08-06 16:43:12', '2024-08-06 16:43:12', NULL, '01063165009', '1722951792-562.jpg', NULL),
(39, 'Jana Halaby', 'Jana-Halaby', '$2y$10$HzUc8wzJiUM1fxoDtDw/gOvWCktSaVwl71yG4Kr8thnVUfOQOTdk.', NULL, '2024-08-06 16:48:25', '2024-08-06 16:48:25', NULL, '01277961775', '1722952105-469.jpg', NULL),
(40, 'Mariam Osman', 'Mariam-Osman', '$2y$10$.ZbJaQ43U6vMv4kZk7CVuu3SU9pCGgWGTVWi9CQGyu4/IAuSjNs4q', NULL, '2024-08-06 16:55:16', '2024-08-06 16:55:16', NULL, '01001004308', '1722952516-387.jpg', NULL),
(41, 'Mariz Nabil', 'Mariz-Nabil', '$2y$10$ei1EjzW2GkEY9PmBmSpDTOK8kuX22fXEFGYjs6VRvcigWi352eYoO', NULL, '2024-08-06 16:59:18', '2024-08-06 16:59:18', NULL, '01222257836', '1722952758-655.jpg', NULL),
(42, 'Christy Ahmous', 'Christy', '$2y$10$U4SNxGAvXnl6vmBEqTadEulSRFNnxJHnlb.osCa30usuVZC1anDE.', NULL, '2024-08-06 17:03:32', '2024-08-06 17:03:32', NULL, '01228588169', '1722953012-431.jpg', NULL),
(43, 'Menna Hossam', 'Menna', '$2y$10$LqTAMFUf5eNebKEAgCxi9um3CEotELM95nSOcS68yDNotai.vfOyS', NULL, '2024-08-06 17:06:03', '2024-08-06 17:06:03', NULL, '01011825619', '1722953163-368.jpg', NULL),
(44, 'test', 'test', '$2y$10$nAA7vI1huJEGFUfm9Up5OueULJ4jYuymWKPzd2NxitJZ0yDJGBjLS', NULL, '2024-08-06 17:06:03', '2024-08-06 17:06:03', NULL, '01011825619', '1722953163-368.jpg', NULL),
(47, 'Mohanad Ahmed', 'Mohanad', '$2y$10$q5LZcrR2W/ojMiQ.cZPdou60zIaDMZJ8.A1LhDXG6LAtDJdtW0FsG', NULL, '2024-09-07 01:56:58', '2024-09-07 01:56:58', NULL, '01206103056', '1725663418-736.jpg', NULL);

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

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `address`, `is_public`, `teacher_id`, `lecture_id`, `created_at`, `updated_at`) VALUES
(37, 'me.png', 0, 3, 34, '2024-10-11 02:22:00', '2024-10-11 02:22:00');

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
(20, 'test', NULL, 3, 0, '1728725435-194.png', 3, 'arts', '2024-10-12 12:30:35', '2024-10-12 12:30:35');

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
(11, 'omar', 34, 0, 10, '2024-10-11 02:23:44', '2024-10-11 02:23:44');

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
(34, 'omar', 'omar', 0, 1, NULL, 11, 0, 0, '1728554207-834.png', 1, 111, NULL, 3, '2024-10-10 12:56:47', '2024-10-11 02:02:34'),
(35, 'name', 'ttt', 0, 3, 20, 44, 0, 0, '1728725623-274.png', 4, 4, 'arts', 3, '2024-10-12 12:33:43', '2024-10-12 12:33:43');

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
(9, 'App\\Models\\Admin', 38),
(9, 'App\\Models\\Admin', 39),
(9, 'App\\Models\\Admin', 40),
(9, 'App\\Models\\Admin', 41),
(9, 'App\\Models\\Admin', 42),
(9, 'App\\Models\\Admin', 43),
(9, 'App\\Models\\Admin', 47),
(10, 'App\\Models\\Admin', 38),
(10, 'App\\Models\\Admin', 39),
(10, 'App\\Models\\Admin', 40),
(10, 'App\\Models\\Admin', 41),
(10, 'App\\Models\\Admin', 42),
(10, 'App\\Models\\Admin', 43),
(11, 'App\\Models\\Admin', 38),
(11, 'App\\Models\\Admin', 39),
(11, 'App\\Models\\Admin', 40),
(11, 'App\\Models\\Admin', 41),
(11, 'App\\Models\\Admin', 42),
(11, 'App\\Models\\Admin', 43),
(12, 'App\\Models\\Admin', 38),
(12, 'App\\Models\\Admin', 39),
(12, 'App\\Models\\Admin', 40),
(12, 'App\\Models\\Admin', 41),
(12, 'App\\Models\\Admin', 42),
(12, 'App\\Models\\Admin', 43),
(13, 'App\\Models\\Admin', 38),
(13, 'App\\Models\\Admin', 39),
(13, 'App\\Models\\Admin', 40),
(13, 'App\\Models\\Admin', 41),
(13, 'App\\Models\\Admin', 42),
(13, 'App\\Models\\Admin', 43),
(14, 'App\\Models\\Admin', 38),
(14, 'App\\Models\\Admin', 39),
(14, 'App\\Models\\Admin', 40),
(14, 'App\\Models\\Admin', 41),
(14, 'App\\Models\\Admin', 42),
(14, 'App\\Models\\Admin', 43),
(15, 'App\\Models\\Admin', 38),
(15, 'App\\Models\\Admin', 39),
(15, 'App\\Models\\Admin', 40),
(15, 'App\\Models\\Admin', 41),
(15, 'App\\Models\\Admin', 42),
(15, 'App\\Models\\Admin', 43),
(16, 'App\\Models\\Admin', 38),
(16, 'App\\Models\\Admin', 39),
(16, 'App\\Models\\Admin', 40),
(16, 'App\\Models\\Admin', 41),
(16, 'App\\Models\\Admin', 42),
(16, 'App\\Models\\Admin', 43),
(17, 'App\\Models\\Admin', 38),
(17, 'App\\Models\\Admin', 39),
(17, 'App\\Models\\Admin', 40),
(17, 'App\\Models\\Admin', 41),
(17, 'App\\Models\\Admin', 42),
(17, 'App\\Models\\Admin', 43),
(18, 'App\\Models\\Admin', 38),
(18, 'App\\Models\\Admin', 39),
(18, 'App\\Models\\Admin', 40),
(18, 'App\\Models\\Admin', 41),
(18, 'App\\Models\\Admin', 42),
(18, 'App\\Models\\Admin', 43),
(20, 'App\\Models\\Admin', 38),
(20, 'App\\Models\\Admin', 39),
(20, 'App\\Models\\Admin', 40),
(20, 'App\\Models\\Admin', 41),
(20, 'App\\Models\\Admin', 42),
(20, 'App\\Models\\Admin', 43),
(21, 'App\\Models\\Admin', 38),
(21, 'App\\Models\\Admin', 39),
(21, 'App\\Models\\Admin', 40),
(21, 'App\\Models\\Admin', 41),
(21, 'App\\Models\\Admin', 42),
(21, 'App\\Models\\Admin', 43),
(21, 'App\\Models\\Admin', 47),
(23, 'App\\Models\\Admin', 38),
(23, 'App\\Models\\Admin', 39),
(23, 'App\\Models\\Admin', 40),
(23, 'App\\Models\\Admin', 41),
(23, 'App\\Models\\Admin', 42),
(23, 'App\\Models\\Admin', 43),
(24, 'App\\Models\\Admin', 38),
(24, 'App\\Models\\Admin', 39),
(24, 'App\\Models\\Admin', 40),
(24, 'App\\Models\\Admin', 41),
(24, 'App\\Models\\Admin', 42),
(24, 'App\\Models\\Admin', 43),
(25, 'App\\Models\\Admin', 38),
(25, 'App\\Models\\Admin', 39),
(25, 'App\\Models\\Admin', 40),
(25, 'App\\Models\\Admin', 41),
(25, 'App\\Models\\Admin', 42),
(25, 'App\\Models\\Admin', 43),
(26, 'App\\Models\\Admin', 38),
(26, 'App\\Models\\Admin', 39),
(26, 'App\\Models\\Admin', 40),
(26, 'App\\Models\\Admin', 41),
(26, 'App\\Models\\Admin', 42),
(26, 'App\\Models\\Admin', 43),
(28, 'App\\Models\\Admin', 38),
(28, 'App\\Models\\Admin', 39),
(28, 'App\\Models\\Admin', 40),
(28, 'App\\Models\\Admin', 41),
(28, 'App\\Models\\Admin', 42),
(28, 'App\\Models\\Admin', 43),
(31, 'App\\Models\\Admin', 38),
(31, 'App\\Models\\Admin', 39),
(31, 'App\\Models\\Admin', 40),
(31, 'App\\Models\\Admin', 41),
(31, 'App\\Models\\Admin', 42),
(31, 'App\\Models\\Admin', 43),
(32, 'App\\Models\\Admin', 38),
(32, 'App\\Models\\Admin', 39),
(32, 'App\\Models\\Admin', 40),
(32, 'App\\Models\\Admin', 41),
(32, 'App\\Models\\Admin', 42),
(32, 'App\\Models\\Admin', 43),
(33, 'App\\Models\\Admin', 38),
(33, 'App\\Models\\Admin', 39),
(33, 'App\\Models\\Admin', 40),
(33, 'App\\Models\\Admin', 41),
(33, 'App\\Models\\Admin', 42),
(33, 'App\\Models\\Admin', 43),
(34, 'App\\Models\\Admin', 38),
(34, 'App\\Models\\Admin', 39),
(34, 'App\\Models\\Admin', 40),
(34, 'App\\Models\\Admin', 41),
(34, 'App\\Models\\Admin', 42),
(34, 'App\\Models\\Admin', 43),
(35, 'App\\Models\\Admin', 38),
(35, 'App\\Models\\Admin', 39),
(35, 'App\\Models\\Admin', 40),
(35, 'App\\Models\\Admin', 41),
(35, 'App\\Models\\Admin', 42),
(35, 'App\\Models\\Admin', 43),
(36, 'App\\Models\\Admin', 38),
(36, 'App\\Models\\Admin', 39),
(36, 'App\\Models\\Admin', 40),
(36, 'App\\Models\\Admin', 41),
(36, 'App\\Models\\Admin', 42),
(36, 'App\\Models\\Admin', 43),
(37, 'App\\Models\\Admin', 38),
(37, 'App\\Models\\Admin', 39),
(37, 'App\\Models\\Admin', 40),
(37, 'App\\Models\\Admin', 41),
(37, 'App\\Models\\Admin', 42),
(37, 'App\\Models\\Admin', 43),
(38, 'App\\Models\\Admin', 38),
(38, 'App\\Models\\Admin', 39),
(38, 'App\\Models\\Admin', 40),
(38, 'App\\Models\\Admin', 41),
(38, 'App\\Models\\Admin', 42),
(38, 'App\\Models\\Admin', 43),
(39, 'App\\Models\\Admin', 38),
(39, 'App\\Models\\Admin', 39),
(39, 'App\\Models\\Admin', 40),
(39, 'App\\Models\\Admin', 41),
(39, 'App\\Models\\Admin', 42),
(39, 'App\\Models\\Admin', 43),
(40, 'App\\Models\\Admin', 38),
(40, 'App\\Models\\Admin', 39),
(40, 'App\\Models\\Admin', 40),
(40, 'App\\Models\\Admin', 41),
(40, 'App\\Models\\Admin', 42),
(40, 'App\\Models\\Admin', 43),
(41, 'App\\Models\\Admin', 38),
(41, 'App\\Models\\Admin', 39),
(41, 'App\\Models\\Admin', 40),
(41, 'App\\Models\\Admin', 41),
(41, 'App\\Models\\Admin', 42),
(41, 'App\\Models\\Admin', 43),
(42, 'App\\Models\\Admin', 38),
(42, 'App\\Models\\Admin', 39),
(42, 'App\\Models\\Admin', 40),
(42, 'App\\Models\\Admin', 41),
(42, 'App\\Models\\Admin', 42),
(42, 'App\\Models\\Admin', 43),
(43, 'App\\Models\\Admin', 38),
(43, 'App\\Models\\Admin', 39),
(43, 'App\\Models\\Admin', 40),
(43, 'App\\Models\\Admin', 41),
(43, 'App\\Models\\Admin', 42),
(43, 'App\\Models\\Admin', 43),
(44, 'App\\Models\\Admin', 38),
(44, 'App\\Models\\Admin', 39),
(44, 'App\\Models\\Admin', 40),
(44, 'App\\Models\\Admin', 41),
(44, 'App\\Models\\Admin', 42),
(44, 'App\\Models\\Admin', 43),
(45, 'App\\Models\\Admin', 38),
(45, 'App\\Models\\Admin', 39),
(45, 'App\\Models\\Admin', 40),
(45, 'App\\Models\\Admin', 41),
(45, 'App\\Models\\Admin', 42),
(45, 'App\\Models\\Admin', 43),
(45, 'App\\Models\\Admin', 44),
(46, 'App\\Models\\Admin', 38),
(46, 'App\\Models\\Admin', 39),
(46, 'App\\Models\\Admin', 40),
(46, 'App\\Models\\Admin', 41),
(46, 'App\\Models\\Admin', 42),
(46, 'App\\Models\\Admin', 43),
(46, 'App\\Models\\Admin', 44),
(47, 'App\\Models\\Admin', 38),
(47, 'App\\Models\\Admin', 39),
(47, 'App\\Models\\Admin', 40),
(47, 'App\\Models\\Admin', 41),
(47, 'App\\Models\\Admin', 42),
(47, 'App\\Models\\Admin', 43),
(48, 'App\\Models\\Admin', 38),
(48, 'App\\Models\\Admin', 39),
(48, 'App\\Models\\Admin', 40),
(48, 'App\\Models\\Admin', 41),
(48, 'App\\Models\\Admin', 42),
(48, 'App\\Models\\Admin', 43),
(49, 'App\\Models\\Admin', 38),
(49, 'App\\Models\\Admin', 39),
(49, 'App\\Models\\Admin', 40),
(49, 'App\\Models\\Admin', 41),
(49, 'App\\Models\\Admin', 42),
(49, 'App\\Models\\Admin', 43),
(50, 'App\\Models\\Admin', 38),
(50, 'App\\Models\\Admin', 39),
(50, 'App\\Models\\Admin', 40),
(50, 'App\\Models\\Admin', 41),
(50, 'App\\Models\\Admin', 42),
(50, 'App\\Models\\Admin', 43),
(51, 'App\\Models\\Admin', 38),
(51, 'App\\Models\\Admin', 39),
(51, 'App\\Models\\Admin', 40),
(51, 'App\\Models\\Admin', 41),
(51, 'App\\Models\\Admin', 42),
(51, 'App\\Models\\Admin', 43),
(52, 'App\\Models\\Admin', 38),
(52, 'App\\Models\\Admin', 39),
(52, 'App\\Models\\Admin', 40),
(52, 'App\\Models\\Admin', 41),
(52, 'App\\Models\\Admin', 42),
(52, 'App\\Models\\Admin', 43),
(54, 'App\\Models\\Admin', 38),
(54, 'App\\Models\\Admin', 39),
(54, 'App\\Models\\Admin', 40),
(54, 'App\\Models\\Admin', 41),
(54, 'App\\Models\\Admin', 42),
(54, 'App\\Models\\Admin', 43),
(55, 'App\\Models\\Admin', 38),
(55, 'App\\Models\\Admin', 39),
(55, 'App\\Models\\Admin', 40),
(55, 'App\\Models\\Admin', 41),
(55, 'App\\Models\\Admin', 42),
(55, 'App\\Models\\Admin', 43),
(56, 'App\\Models\\Admin', 38),
(56, 'App\\Models\\Admin', 39),
(56, 'App\\Models\\Admin', 40),
(56, 'App\\Models\\Admin', 41),
(56, 'App\\Models\\Admin', 42),
(56, 'App\\Models\\Admin', 43),
(57, 'App\\Models\\Admin', 38),
(57, 'App\\Models\\Admin', 39),
(57, 'App\\Models\\Admin', 40),
(57, 'App\\Models\\Admin', 41),
(57, 'App\\Models\\Admin', 42),
(57, 'App\\Models\\Admin', 43),
(58, 'App\\Models\\Admin', 38),
(58, 'App\\Models\\Admin', 39),
(58, 'App\\Models\\Admin', 40),
(58, 'App\\Models\\Admin', 41),
(58, 'App\\Models\\Admin', 42),
(58, 'App\\Models\\Admin', 43),
(59, 'App\\Models\\Admin', 38),
(59, 'App\\Models\\Admin', 39),
(59, 'App\\Models\\Admin', 40),
(59, 'App\\Models\\Admin', 41),
(59, 'App\\Models\\Admin', 42),
(59, 'App\\Models\\Admin', 43),
(60, 'App\\Models\\Admin', 38),
(60, 'App\\Models\\Admin', 39),
(60, 'App\\Models\\Admin', 40),
(60, 'App\\Models\\Admin', 41),
(60, 'App\\Models\\Admin', 42),
(60, 'App\\Models\\Admin', 43);

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
(9, 'App\\Models\\Admin', 37);

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
(776, 'App\\Models\\Admin', 1, 'prodigy', '9c0f22b127f9e85ac93a5b06fb82dcab571c5674fe2ba9740e9a9f3678dda379', '[\"admin\"]', '2024-10-14 21:19:17', NULL, '2024-10-14 21:09:50', '2024-10-14 21:19:17');

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
(7, 10, 34, 100, 0, '2024-10-11 02:29:47', '2024-10-11 02:29:47');

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
  `stage` tinyint(4) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `parent_mobile` varchar(11) NOT NULL,
  `parent_mobile2` varchar(11) DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `profile_pic` text NOT NULL DEFAULT '\'student.png\'',
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
(265, 'Cathleen', 'omarahmed', '$2y$10$1PtrRIhH0DZ5Erl9FepUTuCNF7lJoJciybChdfFUOIsyLGUKTgA6m', 3, '01016046298', '85766666666', '78576666666', '1', '1727402997-247.jpg', NULL, 551603, 'Quod dolore id sed', 1, NULL, 'scientific', 1, 0, NULL, '2024-09-27 05:09:58', '2024-10-11 16:33:30');

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
(2, 'omar teacher', 'omar123', '$2y$10$UNIvY.g3hItwSQ9mYxgpkODIwOow6rM0/PCnCOR.lO/3PNl0HhVB2', 'الفيزياء', '01016046298', '1728543670-908.jpg', '01016046298', NULL, NULL, '2024-10-10 10:01:10', '2024-10-10 11:47:39', '2024-10-10 11:47:39'),
(3, 'Omar Ahmed', 'omarahmed', '$2y$10$s8K2KzURo3uVSwSR.I064um1JVgoJr7dyIYdbTFwj9fgG2bUcBTIO', 'فلسفة و علم', '01016046298', '1728550533-996.png', 'Itaque esse accusant', NULL, NULL, '2024-10-10 11:49:38', '2024-10-10 12:08:06', NULL);

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buying_history`
--
ALTER TABLE `buying_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1392;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=777;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questionbank_categories`
--
ALTER TABLE `questionbank_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `questionbank_question`
--
ALTER TABLE `questionbank_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
