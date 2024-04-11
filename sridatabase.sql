-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 08:29 AM
-- Server version: 10.4.32-MariaDB-log
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sridatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `agency_id` int(3) NOT NULL,
  `agency_name` varchar(84) DEFAULT NULL,
  `department_id` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`agency_id`, `agency_name`, `department_id`) VALUES
(1, 'Senate', 'CONGRESS OF THE PHILIPPINES'),
(2, 'Senate Electoral Tribunal', 'CONGRESS OF THE PHILIPPINES'),
(3, 'Commission on Appointments', 'CONGRESS OF THE PHILIPPINES'),
(4, 'House of Representatives', 'CONGRESS OF THE PHILIPPINES'),
(5, 'House of Representatives Electoral Tribunal', 'CONGRESS OF THE PHILIPPINES'),
(6, 'The President\'s Offices', 'OFFICE OF THE PRESIDENT'),
(7, 'Office of the Vice-President', 'OFFICE OF THE VICE-PRESIDENT'),
(8, 'Office of the Secretary – DAR', 'DEPARTMENT OF AGRARIAN REFORM'),
(9, 'Office of the Secretary – DA', 'DEPARTMENT OF AGRICULTURE'),
(10, 'Agricultural Credit Policy Council', 'DEPARTMENT OF AGRICULTURE'),
(11, 'Bureau of Fisheries and Aquatic Resources', 'DEPARTMENT OF AGRICULTURE'),
(12, 'Fertilizer and Pesticide Authority', 'DEPARTMENT OF AGRICULTURE'),
(13, 'Philippine Fiber Industry Development Authority', 'DEPARTMENT OF AGRICULTURE'),
(14, 'Philippine Council for Agriculture and Fisheries', 'DEPARTMENT OF AGRICULTURE'),
(15, 'National Fisheries Research and Development Institute', 'DEPARTMENT OF AGRICULTURE'),
(16, 'National Meat Inspection Service', 'DEPARTMENT OF AGRICULTURE'),
(17, 'Philippine Carabao Center', 'DEPARTMENT OF AGRICULTURE'),
(18, 'Philippine Center for Postharvest Development and Mechanization', 'DEPARTMENT OF AGRICULTURE'),
(19, 'Office of the Secretary - DBM', 'DEPARTMENT OF BUDGET AND MANAGEMENT'),
(20, 'Government Procurement Policy Board-Technical Support Office', 'DEPARTMENT OF BUDGET AND MANAGEMENT'),
(21, 'Office of the Secretary - DEPED', 'DEPARTMENT OF EDUCATION'),
(22, 'National Book Development Board', 'DEPARTMENT OF EDUCATION'),
(23, 'National Council for Children\'s Television', 'DEPARTMENT OF EDUCATION'),
(24, 'National Museum', 'DEPARTMENT OF EDUCATION'),
(25, 'Philippine High School for the Arts', 'DEPARTMENT OF EDUCATION'),
(26, 'Early Childhood Care and Development Council', 'DEPARTMENT OF EDUCATION'),
(27, 'Office of the Secretary - DOE', 'DEPARTMENT OF ENERGY'),
(28, 'Office of the Secretary - DENR', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(29, 'Environmental Management Bureau', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(30, 'Mines and Geo-Sciences Bureau', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(31, 'National Mapping and Resource Information Authority', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(32, 'National Water Resources Board', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(33, 'Palawan Council for Sustainable Development Staff', 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(34, 'Office of the Secretary -DOF', 'DEPARTMENT OF FINANCE'),
(35, 'Bureau of Customs', 'DEPARTMENT OF FINANCE'),
(36, 'Bureau of Internal Revenue', 'DEPARTMENT OF FINANCE'),
(37, 'Bureau of Local Government Finance', 'DEPARTMENT OF FINANCE'),
(38, 'Bureau of Treasury', 'DEPARTMENT OF FINANCE'),
(39, 'Central Board of Assessment Appeals', 'DEPARTMENT OF FINANCE'),
(40, 'National Tax Research Center', 'DEPARTMENT OF FINANCE'),
(41, 'Office of the Secretary - DFA', 'DEPARTMENT OF FOREIGN AFFAIRS'),
(42, 'Foreign Service Institute', 'DEPARTMENT OF FOREIGN AFFAIRS'),
(43, 'Technical Cooperation Council of the Philippines', 'DEPARTMENT OF FOREIGN AFFAIRS'),
(44, 'UNESCO National Commission of the Philippines', 'DEPARTMENT OF FOREIGN AFFAIRS'),
(45, 'Office of the Secretary - DOH', 'DEPARTMENT OF HEALTH'),
(46, 'National Nutrition Council', 'DEPARTMENT OF HEALTH'),
(47, 'Philippine National AIDS Council', 'DEPARTMENT OF HEALTH'),
(48, 'Office of the Secretary - DHSUD', 'DEPARTMENT OF HUMAN SETTLEMENTS AND URBAN DEVELOPMENT'),
(49, 'Human Settlements Adjudication Commission', 'DEPARTMENT OF HUMAN SETTLEMENTS AND URBAN DEVELOPMENT'),
(50, 'Office of the Secretary - DICT', 'DEPARTMENT OF INFORMATION AND COMMUNICATIONS TECHNOLOGY'),
(51, 'Cybercrime Investigation and Coordination Center', 'DEPARTMENT OF INFORMATION AND COMMUNICATIONS TECHNOLOGY'),
(52, 'National Privacy Commission', 'DEPARTMENT OF INFORMATION AND COMMUNICATIONS TECHNOLOGY'),
(53, 'National Telecommunications Commission', 'DEPARTMENT OF INFORMATION AND COMMUNICATIONS TECHNOLOGY'),
(54, 'Office of the Secretary - DILG', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(55, 'Bureau of Fire Protection', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(56, 'Bureau of Jail Management and Penology', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(57, 'Local Government Academy', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(58, 'National Commission on Muslim Filipinos', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(59, 'National Police Commission', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(60, 'National Youth Commission', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(61, 'Philippine Commission on Women', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(62, 'Philippine National Police', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(63, 'Philippine Public Safety College', 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(64, 'Office of the Secretary - DOJ', 'DEPARTMENT OF JUSTICE'),
(65, 'Bureau of Corrections', 'DEPARTMENT OF JUSTICE'),
(66, 'Land Registration Authority', 'DEPARTMENT OF JUSTICE'),
(67, 'National Bureau of Investigation', 'DEPARTMENT OF JUSTICE'),
(68, 'Office of the Government Corporate Counsel', 'DEPARTMENT OF JUSTICE'),
(69, 'Office of the Solicitor General', 'DEPARTMENT OF JUSTICE'),
(70, 'Parole and Probation Administration', 'DEPARTMENT OF JUSTICE'),
(71, 'Presidential Commission on Good Government', 'DEPARTMENT OF JUSTICE'),
(72, 'Public Attorney\'s Office', 'DEPARTMENT OF JUSTICE'),
(73, 'Office of the Alternative Dispute Resolution', 'DEPARTMENT OF JUSTICE'),
(74, 'Office of the Secretary - DOLE', 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(75, 'Institute for Labor Studies', 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(76, 'National Conciliation and Mediation Board', 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(77, 'National Labor Relations Commission', 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(78, 'National Wages and Productivity Commission', 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(79, 'Office of the Secretary - DMW', 'DEPARTMENT OF MIGRANT WORKERS'),
(80, 'Overseas Workers Welfare Administration', 'DEPARTMENT OF MIGRANT WORKERS'),
(81, 'Office of the Secretary - DND', 'DEPARTMENT OF NATIONAL DEFENSE'),
(82, 'Government Arsenal', 'DEPARTMENT OF NATIONAL DEFENSE'),
(83, 'National Defense College of the Philippines', 'DEPARTMENT OF NATIONAL DEFENSE'),
(84, 'Office of Civil Defense', 'DEPARTMENT OF NATIONAL DEFENSE'),
(85, 'Philippine Veterans Affairs Office', 'DEPARTMENT OF NATIONAL DEFENSE'),
(86, 'Veterans Memorial Medical Center', 'DEPARTMENT OF NATIONAL DEFENSE'),
(87, 'AFP-Philippine Army', 'DEPARTMENT OF NATIONAL DEFENSE'),
(88, 'AFP-Philippine Air Force', 'DEPARTMENT OF NATIONAL DEFENSE'),
(89, 'AFP-Philippine Navy', 'DEPARTMENT OF NATIONAL DEFENSE'),
(90, 'AFP-General Headquarters', 'DEPARTMENT OF NATIONAL DEFENSE'),
(91, 'Office of the Secretary - DPWH', 'DEPARTMENT OF PUBLIC WORKS AND HIGHWAYS'),
(92, 'Office of the Secretary - DOST', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(93, 'Advanced Science and Technology Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(94, 'Food and Nutrition Research Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(95, 'Forest Products Research and Development Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(96, 'Industrial Technology Development Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(97, 'Metals Industry Research and Development Center', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(98, 'National Academy of Science and Technology', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(99, 'National Research Council of the Philippines', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(100, 'Phil. Atmospheric, Geophysical and Astronomical Services Administration', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(101, 'Phil Council for Agriculture, Aquatic and Natural Resources Research Development', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(102, 'Philippine Council for Health Research and Development', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(103, 'Philippine Institute of Volcanology and Seismology', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(104, 'Philippine Nuclear Research Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(105, 'Philippine Science High School', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(106, 'Philippine Textile Research Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(107, 'Science Education Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(108, 'Science and Technology Information Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(109, 'Technology Application and Promotion Institute', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(110, 'Philippine Council for Industry, Energy and Emerging Technology', 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(111, 'Office of the Secretary - DSWD', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(112, 'Council for the Welfare of Children', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(113, 'Juvenile Justice and Welfare Council', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(114, 'Inter-Country Adoption Board', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(115, 'National Anti-Poverty Commission', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(116, 'National Council on Disability Affairs', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(117, 'National Commission on Indigenous People', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(118, 'Presidential Commission for the Urban Poor', 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(119, 'Office of the Secretary - DOT', 'DEPARTMENT OF TOURISM'),
(120, 'Intramuros Administration', 'DEPARTMENT OF TOURISM'),
(121, 'National Parks Development Committee', 'DEPARTMENT OF TOURISM'),
(122, 'Office of the Secretary - DTI', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(123, 'Board of Investments', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(124, 'Construction Industry Authority of the Philippines', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(125, 'Philippine Trade Training Center', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(126, 'Technical Education and Skills Development Authority', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(127, 'Cooperative Development Authority', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(128, 'Design Center of the Philippines', 'DEPARTMENT OF TRADE AND INDUSTRY'),
(129, 'Office of the Secretary - DOT', 'DEPARTMENT OF TRANSPORTATION'),
(130, 'Civil Aeronautics Board', 'DEPARTMENT OF TRANSPORTATION'),
(131, 'Maritime Industry Authority', 'DEPARTMENT OF TRANSPORTATION'),
(132, 'Office of Transportation Cooperatives', 'DEPARTMENT OF TRANSPORTATION'),
(133, 'Office for Transportation Security', 'DEPARTMENT OF TRANSPORTATION'),
(134, 'Philippine Coast Guard (Civilian)', 'DEPARTMENT OF TRANSPORTATION'),
(135, 'Toll Regulatory Board', 'DEPARTMENT OF TRANSPORTATION'),
(136, 'Office of the Secretary - NEDA', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(137, 'Commission on Population and Development', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(138, 'Philippine National Volunteer Service Coordinating Agency', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(139, 'Public-Private Partnership Center of the Philippines', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(140, 'Philippine Statistical Research and Training Institute Institute', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(141, 'Philippine Statistics Authority', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(142, 'Tariff Commission', 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(143, 'Presidential Communications Operations', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(144, 'Bureau of Broadcast Services', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(145, 'Bureau of Communications Services', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(146, 'National Printing Office', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(147, 'News and Information Bureau', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(148, 'Philippine Information Agency', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(149, 'Presidential Broadcast Staff (RTVM)', 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(150, 'Anti-Red Tape Authority', 'OTHER EXECUTIVE OFFICES'),
(151, 'Career Executive Service Board', 'OTHER EXECUTIVE OFFICES'),
(152, 'Climate Change Commission', 'OTHER EXECUTIVE OFFICES'),
(153, 'Commission on Filipinos Overseas', 'OTHER EXECUTIVE OFFICES'),
(154, 'Commission on Higher Education', 'OTHER EXECUTIVE OFFICES'),
(155, 'Commission on the Filipino Language', 'OTHER EXECUTIVE OFFICES'),
(156, 'Dangerous Drug Board', 'OTHER EXECUTIVE OFFICES'),
(157, 'Games and Amusements Board', 'OTHER EXECUTIVE OFFICES'),
(158, 'Governance Commission for Government-Owned and Controlled Corporations', 'OTHER EXECUTIVE OFFICES'),
(159, 'Mindanao Development Authority', 'OTHER EXECUTIVE OFFICES'),
(160, 'Movie and Television Review and Classification Board', 'OTHER EXECUTIVE OFFICES'),
(161, 'National Commission for Culture and the Arts (Proper)', 'OTHER EXECUTIVE OFFICES'),
(162, 'National Historical Commission of the Philippines', 'OTHER EXECUTIVE OFFICES'),
(163, 'The National Library of the Philippines', 'OTHER EXECUTIVE OFFICES'),
(164, 'National Archives of the Philippines', 'OTHER EXECUTIVE OFFICES'),
(165, 'National Commission of Senior Citizens', 'OTHER EXECUTIVE OFFICES'),
(166, 'National Intelligence Coordinating Agency', 'OTHER EXECUTIVE OFFICES'),
(167, 'National Security Council', 'OTHER EXECUTIVE OFFICES'),
(168, 'Optical Media Board', 'OTHER EXECUTIVE OFFICES'),
(169, 'Philippine Drug Enforcement Agency', 'OTHER EXECUTIVE OFFICES'),
(170, 'Philippine Racing Commission', 'OTHER EXECUTIVE OFFICES'),
(171, 'Philippine Sports Commission', 'OTHER EXECUTIVE OFFICES'),
(172, 'Presidential Legislative Liaison Office', 'OTHER EXECUTIVE OFFICES'),
(173, 'Presidential Management Staff', 'OTHER EXECUTIVE OFFICES'),
(174, 'Film Development Council of the Philippines', 'OTHER EXECUTIVE OFFICES'),
(175, 'Supreme Court of the Philippines and the Lower Courts', 'THE JUDICIARY'),
(176, 'Presidential Electoral Tribunal', 'THE JUDICIARY'),
(177, 'Sandiganbayan', 'THE JUDICIARY'),
(178, 'Court of Appeals', 'THE JUDICIARY'),
(179, 'Court of Tax Appeals', 'THE JUDICIARY'),
(180, 'Civil Service Commission (Proper)', 'CONSTITUTIONAL OFFICES'),
(181, 'Commission on Audit', 'CONSTITUTIONAL OFFICES'),
(182, 'Commission on Elections', 'CONSTITUTIONAL OFFICES'),
(183, 'Office of the Ombudsman', 'OFFICE OF THE OMBUDSMAN'),
(184, 'Commission on Human Rights', 'COMMISSION ON HUMAN RIGHTS'),
(185, 'Human Rights Violations Victims Memorial Commission', 'COMMISSION ON HUMAN RIGHTS'),
(186, 'Legislative-Executive Development Advisory Council', 'JOINT LEGISLATIVE-EXECUTIVE COUNCILS'),
(187, 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(188, 'Marikina Polytechnic College', 'STATE UNIVERSITIES AND COLLEGES'),
(189, 'Philippine Normal University', 'STATE UNIVERSITIES AND COLLEGES'),
(190, 'Philippine State College of Aeronautics', 'STATE UNIVERSITIES AND COLLEGES'),
(191, 'Polytechnic University of the Philippines', 'STATE UNIVERSITIES AND COLLEGES'),
(192, 'Rizal Technological University', 'STATE UNIVERSITIES AND COLLEGES'),
(193, 'Technological University of the Philippines', 'STATE UNIVERSITIES AND COLLEGES'),
(194, 'University of the Philippines System', 'STATE UNIVERSITIES AND COLLEGES'),
(195, 'Don Mariano Marcos Memorial State University', 'STATE UNIVERSITIES AND COLLEGES'),
(196, 'Ilocos Sur Polytechnic State College', 'STATE UNIVERSITIES AND COLLEGES'),
(197, 'Mariano Marcos State University', 'STATE UNIVERSITIES AND COLLEGES'),
(198, 'North Luzon Philippines State College', 'STATE UNIVERSITIES AND COLLEGES'),
(199, 'Pangasinan State University', 'STATE UNIVERSITIES AND COLLEGES'),
(200, 'University of Northern Philippines', 'STATE UNIVERSITIES AND COLLEGES'),
(201, 'Abra State Institute of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(202, 'Apayao State College', 'STATE UNIVERSITIES AND COLLEGES'),
(203, 'Benguet State University', 'STATE UNIVERSITIES AND COLLEGES'),
(204, 'Ifugao State University', 'STATE UNIVERSITIES AND COLLEGES'),
(205, 'Kalinga State University', 'STATE UNIVERSITIES AND COLLEGES'),
(206, 'Mountain Province State University', 'STATE UNIVERSITIES AND COLLEGES'),
(207, 'Batanes State College', 'STATE UNIVERSITIES AND COLLEGES'),
(208, 'Cagayan State University', 'STATE UNIVERSITIES AND COLLEGES'),
(209, 'Isabela State University', 'STATE UNIVERSITIES AND COLLEGES'),
(210, 'Nueva Vizcaya State University', 'STATE UNIVERSITIES AND COLLEGES'),
(211, 'Quirino State University', 'STATE UNIVERSITIES AND COLLEGES'),
(212, 'Aurora State College of Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(213, 'Bataan Peninsula State University', 'STATE UNIVERSITIES AND COLLEGES'),
(214, 'Bulacan Agricultural State College', 'STATE UNIVERSITIES AND COLLEGES'),
(215, 'Bulacan State University', 'STATE UNIVERSITIES AND COLLEGES'),
(216, 'Central Luzon State University', 'STATE UNIVERSITIES AND COLLEGES'),
(217, 'Don Honorio Ventura Technological State University', 'STATE UNIVERSITIES AND COLLEGES'),
(218, 'Nueva Ecija University of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(219, 'Pampanga State Agricultural University', 'STATE UNIVERSITIES AND COLLEGES'),
(220, 'Philippine Merchant Marine Academy', 'STATE UNIVERSITIES AND COLLEGES'),
(221, 'Ramon Magsaysay Technological University', 'STATE UNIVERSITIES AND COLLEGES'),
(222, 'Tarlac College of Agriculture', 'STATE UNIVERSITIES AND COLLEGES'),
(223, 'Tarlac State University', 'STATE UNIVERSITIES AND COLLEGES'),
(224, 'Batangas State University', 'STATE UNIVERSITIES AND COLLEGES'),
(225, 'Cavite State University', 'STATE UNIVERSITIES AND COLLEGES'),
(226, 'Laguna State Polytechnic University', 'STATE UNIVERSITIES AND COLLEGES'),
(227, 'Southern Luzon State University', 'STATE UNIVERSITIES AND COLLEGES'),
(228, 'University of Rizal System', 'STATE UNIVERSITIES AND COLLEGES'),
(229, 'Marinduque State College', 'STATE UNIVERSITIES AND COLLEGES'),
(230, 'Mindoro State College of Agriculture and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(231, 'Occidental Mindoro State College', 'STATE UNIVERSITIES AND COLLEGES'),
(232, 'Palawan State University', 'STATE UNIVERSITIES AND COLLEGES'),
(233, 'Romblon State University', 'STATE UNIVERSITIES AND COLLEGES'),
(234, 'Western Philippines University', 'STATE UNIVERSITIES AND COLLEGES'),
(235, 'Bicol University', 'STATE UNIVERSITIES AND COLLEGES'),
(236, 'Bicol State College of Applied Sciences and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(237, 'Camarines Norte State College', 'STATE UNIVERSITIES AND COLLEGES'),
(238, 'Camarines Sur Polytechnic Colleges', 'STATE UNIVERSITIES AND COLLEGES'),
(239, 'Catanduanes State University', 'STATE UNIVERSITIES AND COLLEGES'),
(240, 'Central Bicol State University of Agriculture', 'STATE UNIVERSITIES AND COLLEGES'),
(241, 'Dr. Emilio B. Espinosa, Sr. Memorial State College of Agriculture and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(242, 'Partido State University', 'STATE UNIVERSITIES AND COLLEGES'),
(243, 'Sorsogon State College', 'STATE UNIVERSITIES AND COLLEGES'),
(244, 'Aklan State University', 'STATE UNIVERSITIES AND COLLEGES'),
(245, 'Capiz State University', 'STATE UNIVERSITIES AND COLLEGES'),
(246, 'Carlos C. Hilado Memorial State College', 'STATE UNIVERSITIES AND COLLEGES'),
(247, 'Guimaras State College', 'STATE UNIVERSITIES AND COLLEGES'),
(248, 'Iloilo State College of Fisheries', 'STATE UNIVERSITIES AND COLLEGES'),
(249, 'Central Philippines State University', 'STATE UNIVERSITIES AND COLLEGES'),
(250, 'Northern Iloilo Polytechnic State College', 'STATE UNIVERSITIES AND COLLEGES'),
(251, 'Northern Negros State College of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(252, 'University of Antique', 'STATE UNIVERSITIES AND COLLEGES'),
(253, 'Iloilo Science and Technology University', 'STATE UNIVERSITIES AND COLLEGES'),
(254, 'West Visayas State University', 'STATE UNIVERSITIES AND COLLEGES'),
(255, 'Bohol Island State University', 'STATE UNIVERSITIES AND COLLEGES'),
(256, 'Cebu Normal University', 'STATE UNIVERSITIES AND COLLEGES'),
(257, 'Cebu Technological University', 'STATE UNIVERSITIES AND COLLEGES'),
(258, 'Negros Oriental State University', 'STATE UNIVERSITIES AND COLLEGES'),
(259, 'Siquijor State College', 'STATE UNIVERSITIES AND COLLEGES'),
(260, 'Eastern Samar State University', 'STATE UNIVERSITIES AND COLLEGES'),
(261, 'Eastern Visayas State University', 'STATE UNIVERSITIES AND COLLEGES'),
(262, 'Leyte Normal University', 'STATE UNIVERSITIES AND COLLEGES'),
(263, 'Naval State University', 'STATE UNIVERSITIES AND COLLEGES'),
(264, 'Northwest Samar State University', 'STATE UNIVERSITIES AND COLLEGES'),
(265, 'Palompon Polytechnic State University', 'STATE UNIVERSITIES AND COLLEGES'),
(266, 'Samar State University', 'STATE UNIVERSITIES AND COLLEGES'),
(267, 'Southern Leyte State University', 'STATE UNIVERSITIES AND COLLEGES'),
(268, 'University of Eastern Philippines', 'STATE UNIVERSITIES AND COLLEGES'),
(269, 'Visayas State University', 'STATE UNIVERSITIES AND COLLEGES'),
(270, 'J.H. Cerilles State College', 'STATE UNIVERSITIES AND COLLEGES'),
(271, 'Jose Rizal Memorial State University', 'STATE UNIVERSITIES AND COLLEGES'),
(272, 'Western Mindanao State University', 'STATE UNIVERSITIES AND COLLEGES'),
(273, 'Zamboanga City State Polytechnic College', 'STATE UNIVERSITIES AND COLLEGES'),
(274, 'Zamboanga State College of Marine Sciences and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(275, 'Bukidnon State University', 'STATE UNIVERSITIES AND COLLEGES'),
(276, 'Camiguin Polytechnic State College', 'STATE UNIVERSITIES AND COLLEGES'),
(277, 'Central Mindanao University', 'STATE UNIVERSITIES AND COLLEGES'),
(278, 'University of Science and Technology of Southern Philippines - Cagayan De Oro Campus', 'STATE UNIVERSITIES AND COLLEGES'),
(279, 'MSU-Iligan Institute of Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(280, 'University of Science and Technology of Southern Philippines - Claveria Campus', 'STATE UNIVERSITIES AND COLLEGES'),
(281, 'Northern Bukidnon State College', 'STATE UNIVERSITIES AND COLLEGES'),
(282, 'Northwestern Mindanao State College of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(283, 'Davao del Norte State College', 'STATE UNIVERSITIES AND COLLEGES'),
(284, 'Davao Del Sur State College', 'STATE UNIVERSITIES AND COLLEGES'),
(285, 'Davao Oriental State College of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(286, 'Southern Philippines Agri-Business and Marine and Aquatic School of Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(287, 'University of Southeastern Philippines', 'STATE UNIVERSITIES AND COLLEGES'),
(288, 'Compostela Valley State College', 'STATE UNIVERSITIES AND COLLEGES'),
(289, 'Cotabato State University', 'STATE UNIVERSITIES AND COLLEGES'),
(290, 'Cotabato Foundation College of Science and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(291, 'South Cotabato State College', 'STATE UNIVERSITIES AND COLLEGES'),
(292, 'Sultan Kudarat State University', 'STATE UNIVERSITIES AND COLLEGES'),
(293, 'University of Southern Mindanao', 'STATE UNIVERSITIES AND COLLEGES'),
(294, 'Agusan del Sur State College of Agriculture and Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(295, 'Caraga State University', 'STATE UNIVERSITIES AND COLLEGES'),
(296, 'Surigao del Sur State University', 'STATE UNIVERSITIES AND COLLEGES'),
(297, 'Surigao State College of Technology', 'STATE UNIVERSITIES AND COLLEGES'),
(298, 'Adiong Memorial Polytechnic State College', 'STATE UNIVERSITIES AND COLLEGES'),
(299, 'Basilan State College', 'STATE UNIVERSITIES AND COLLEGES'),
(300, 'Mindanao State University', 'STATE UNIVERSITIES AND COLLEGES'),
(301, 'MSU-Tawi-Tawi College of Technology and Oceanography', 'STATE UNIVERSITIES AND COLLEGES'),
(302, 'Sulu State College', 'STATE UNIVERSITIES AND COLLEGES'),
(303, 'Tawi-Tawi Regional Agricultural College', 'STATE UNIVERSITIES AND COLLEGES');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'CONGRESS OF THE PHILIPPINES'),
(2, 'OFFICE OF THE PRESIDENT'),
(3, 'OFFICE OF THE VICE-PRESIDENT'),
(4, 'DEPARTMENT OF AGRARIAN REFORM'),
(5, 'DEPARTMENT OF AGRICULTURE'),
(6, 'DEPARTMENT OF BUDGET AND MANAGEMENT'),
(7, 'DEPARTMENT OF EDUCATION'),
(8, 'DEPARTMENT OF ENERGY'),
(9, 'DEPARTMENT OF ENVIRONMENT AND NATURAL RESOURCES'),
(10, 'DEPARTMENT OF FINANCE'),
(11, 'DEPARTMENT OF FOREIGN AFFAIRS'),
(12, 'DEPARTMENT OF HEALTH'),
(13, 'DEPARTMENT OF HUMAN SETTLEMENTS AND URBAN DEVELOPMENT'),
(14, 'DEPARTMENT OF INFORMATION AND COMMUNICATIONS TECHNOLOGY'),
(15, 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT'),
(16, 'DEPARTMENT OF JUSTICE'),
(17, 'DEPARTMENT OF LABOR AND EMPLOYMENT'),
(18, 'DEPARTMENT OF MIGRANT WORKERS'),
(19, 'DEPARTMENT OF NATIONAL DEFENSE'),
(20, 'DEPARTMENT OF PUBLIC WORKS AND HIGHWAYS'),
(21, 'DEPARTMENT OF SCIENCE AND TECHNOLOGY'),
(22, 'DEPARTMENT OF SOCIAL WELFARE AND DEVELOPMENT'),
(23, 'DEPARTMENT OF TOURISM'),
(24, 'DEPARTMENT OF TRADE AND INDUSTRY'),
(25, 'DEPARTMENT OF TRANSPORTATION'),
(26, 'NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
(27, 'PRESIDENTIAL COMMUNICATIONS OPERATIONS OFFICE'),
(28, 'OTHER EXECUTIVE OFFICES'),
(29, 'THE JUDICIARY'),
(30, 'CONSTITUTIONAL OFFICES'),
(31, 'OFFICE OF THE OMBUDSMAN'),
(32, 'COMMISSION ON HUMAN RIGHTS'),
(33, 'JOINT LEGISLATIVE-EXECUTIVE COUNCILS'),
(34, 'STATE UNIVERSITIES AND COLLEGES'),
(35, 'CONGRESS OF THE PHILIPPINES'),
(36, 'DEPARTMENT OF THE INTERIOR AND LOCAL GOVERNMENT');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `submitName` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `_year` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `agency` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `nameGOCC` varchar(255) DEFAULT NULL,
  `nameLWD` varchar(255) DEFAULT NULL,
  `provinceLGU` varchar(255) DEFAULT NULL,
  `cityMunicipalLGU` varchar(255) DEFAULT NULL,
  `nameSUC` varchar(255) DEFAULT NULL,
  `nameOthers` varchar(255) DEFAULT NULL,
  `agencyHead` varchar(255) DEFAULT NULL,
  `_grant` varchar(255) DEFAULT NULL,
  `qualifiedCivilian` varchar(255) DEFAULT NULL,
  `qualifiedMUP` varchar(255) DEFAULT NULL,
  `qualifiedContractual` varchar(255) DEFAULT NULL,
  `qualifiedCasual` varchar(255) DEFAULT NULL,
  `SRIRate` float DEFAULT NULL,
  `ratePaid` float DEFAULT NULL,
  `PSFund` float DEFAULT NULL,
  `totalMOOE` float DEFAULT NULL,
  `travellingExpenses` float DEFAULT NULL,
  `trainingScholarship` float DEFAULT NULL,
  `suppliesMaterialsExpenses` float DEFAULT NULL,
  `utilityExpenses` float DEFAULT NULL,
  `communicationExpenses` float DEFAULT NULL,
  `CIEExpenses` float DEFAULT NULL,
  `PSExpenses` float DEFAULT NULL,
  `GSExpenses` float DEFAULT NULL,
  `repairsMaintenanceExpenses` float DEFAULT NULL,
  `FASubsidy` float DEFAULT NULL,
  `TIPFees` float DEFAULT NULL,
  `laborWages` float DEFAULT NULL,
  `advertisingExpenses` float DEFAULT NULL,
  `printingPublicationExpenses` float DEFAULT NULL,
  `representationExpenses` float DEFAULT NULL,
  `transpoDeliveryExpenses` float DEFAULT NULL,
  `rentLeaseExpenses` float DEFAULT NULL,
  `MDCOExpenses` float DEFAULT NULL,
  `subscriptionExpenses` float DEFAULT NULL,
  `otherExpenses` float DEFAULT NULL,
  `grandTotal` float DEFAULT NULL,
  `nonGrantReason` text DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filesize` float DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `submitName`, `designation`, `contactNumber`, `email`, `_year`, `category`, `department`, `agency`, `university`, `nameGOCC`, `nameLWD`, `provinceLGU`, `cityMunicipalLGU`, `nameSUC`, `nameOthers`, `agencyHead`, `_grant`, `qualifiedCivilian`, `qualifiedMUP`, `qualifiedContractual`, `qualifiedCasual`, `SRIRate`, `ratePaid`, `PSFund`, `totalMOOE`, `travellingExpenses`, `trainingScholarship`, `suppliesMaterialsExpenses`, `utilityExpenses`, `communicationExpenses`, `CIEExpenses`, `PSExpenses`, `GSExpenses`, `repairsMaintenanceExpenses`, `FASubsidy`, `TIPFees`, `laborWages`, `advertisingExpenses`, `printingPublicationExpenses`, `representationExpenses`, `transpoDeliveryExpenses`, `rentLeaseExpenses`, `MDCOExpenses`, `subscriptionExpenses`, `otherExpenses`, `grandTotal`, `nonGrantReason`, `filename`, `filesize`, `filetype`) VALUES
(1, 'Antonio Malabago', 'Agency Head', '0912345678', 'antoniomalabago@doe@gov.ph', 0, 'NGAs', 'DEPARTMENT OF BUDGET AND MANAGEMENT', 'Government Procurement Policy Board-Technical Support Office', '', '', '', '', '', '', '', '', 'YES', '1', '2', '3', '4', 5, 6, 7, 350, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 357, '', 'ISC2 CC Registration Guide.pdf', 841.49, 'application/pdf'),
(2, 'Laurente, Queenie D.', '', '+639283505760', 'queenielaurente08@gmail.com', 2026, 'NGAs', 'DEPARTMENT OF HEALTH', 'National Nutrition Council', '', '', '', '', '', '', '', '', 'YES', '1', '1', '1', '1', 1, 1, 100, 199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 199, 299, '', 'Laurente_CpE-With-Honors-Evaluation_Template.pdf', 332.19, 'application/pdf');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`university_id`, `university_name`) VALUES
(1, 'University of the Philippines System (The National University)'),
(2, 'Eulogio \'Amang\' Rodriguez Institute of Science and Technology'),
(3, 'Marikina Polytechnic College'),
(4, 'Philippine Normal University'),
(5, 'Philippine State College of Aeronautics'),
(6, 'Polytechnic University of the Philippines'),
(7, 'Rizal Technological University'),
(8, 'Technological University of the Philippines'),
(9, 'Don Mariano Marcos Memorial State University'),
(10, 'Ilocos Sur Polytechnic State College'),
(11, 'Mariano Marcos State University'),
(12, 'Pangasinan State University'),
(13, 'University of Northern Philippines'),
(14, 'Abra State Institute of Sciences and Technology'),
(15, 'Apayao State College'),
(16, 'Benguet State University'),
(17, 'Ifugao State University'),
(18, 'Kalinga State University'),
(19, 'Mountain Province State University'),
(20, 'Batanes State College'),
(21, 'Cagayan State University'),
(22, 'Isabela State University'),
(23, 'Nueva Vizcaya State University'),
(24, 'Quirino State University'),
(25, 'Aurora State College of Technology'),
(26, 'Bataan Peninsula State University'),
(27, 'Bulacan Agricultural State College'),
(28, 'Bulacan State University'),
(29, 'Central Luzon State University'),
(30, 'Don Honorio Ventura State University'),
(31, 'Nueva Ecija University of Science and Technology'),
(32, 'Pampanga State Agricultural University'),
(33, 'Philippine Merchant Marine Academy'),
(34, 'President Ramon Magsaysay University'),
(35, 'Tarlac Agricultural University'),
(36, 'Tarlac State University'),
(37, 'Batangas State University'),
(38, 'Cavite State University'),
(39, 'Laguna State Polytechnic University'),
(40, 'Southern Luzon State University'),
(41, 'University of Rizal System'),
(42, 'Marinduque State College'),
(43, 'Mindoro State University'),
(44, 'Occidental Mindoro State College'),
(45, 'Palawan State University'),
(46, 'Romblon State University'),
(47, 'Western Philippines University'),
(48, 'Bicol State College of Applied Sciences and Technology'),
(49, 'Bicol University'),
(50, 'Camarines Norte State College'),
(51, 'Camarines Sur Polytechnic Colleges'),
(52, 'Catanduanes State University'),
(53, 'Central Bicol State University of Agriculture'),
(54, 'Dr. Emilio B. Espinosa, Sr. Memorial State College of Agriculture and Technology'),
(55, 'Partido State University'),
(56, 'Sorsogon State College'),
(57, 'Aklan State University'),
(58, 'Capiz State University'),
(59, 'Carlos Hilado Memorial State University'),
(60, 'Central Philippines State University'),
(61, 'Guimaras State College'),
(62, 'Iloilo Science and Technology University'),
(63, 'Iloilo State University of Fisheries Science and Technology'),
(64, 'Northern Iloilo State University'),
(65, 'Northern Negros State College of Science and Technology'),
(66, 'University of Antique'),
(67, 'West Visayas State University'),
(68, 'Bohol Island State University'),
(69, 'Cebu Normal University'),
(70, 'Cebu Technological University'),
(71, 'Negros Oriental State University'),
(72, 'Siquijor State College'),
(73, 'Biliran Province State University'),
(74, 'Eastern Samar State University'),
(75, 'Eastern Visayas State University'),
(76, 'Leyte Normal University'),
(77, 'Northwest Samar State University'),
(78, 'Palompon Polytechnic State University'),
(79, 'Samar State University'),
(80, 'Southern Leyte State University'),
(81, 'University of Eastern Philippines'),
(82, 'Visayas State University'),
(83, 'Basilan State College'),
(84, 'J.H. Cerilles State College'),
(85, 'Jose Rizal Memorial State University'),
(86, 'Western Mindanao State University'),
(87, 'Zamboanga Peninsula Polytechnic State University'),
(88, 'Zamboanga State College of Marine Sciences and Technology'),
(89, 'Bukidnon State University'),
(90, 'Camiguin Polytechnic State College'),
(91, 'Central Mindanao University'),
(92, 'MSU - Iligan Institute of Technology'),
(93, 'Northern Bukidnon State College'),
(94, 'Northwestern Mindanao State College of Science and Technology'),
(95, 'University of Science and Technology of Southern Philippines-Cagayan de Oro Campus'),
(96, 'University of Science and Technology of Southern Philippines-Claveria Campus'),
(97, 'Davao De Oro State College'),
(98, 'Davao Del Norte State College'),
(99, 'Davao Del Sur State College'),
(100, 'Davao Oriental State University'),
(101, 'Southern Philippines Agri-Business and Marine and Aquatic School of Technology'),
(102, 'University of Southeastern Philippines'),
(103, 'Cotabato Foundation College of Science and Technology'),
(104, 'South Cotabato State College'),
(105, 'Sultan Kudarat State University'),
(106, 'University of Southern Mindanao'),
(107, 'Agusan del Sur State College of Agriculture and Technology'),
(108, 'Caraga State University'),
(109, 'North Eastern Mindanao State University'),
(110, 'Surigao Del Norte State University'),
(111, 'Adiong Memorial State College'),
(112, 'Cotabato State University'),
(113, 'Mindanao State University'),
(114, 'MSU-Tawi-Tawi College of Technology and Oceanography'),
(115, 'Sulu State College'),
(116, 'Tawi-Tawi Regional Agricultural College');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`university_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
