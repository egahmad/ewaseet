-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 01, 2021 at 04:55 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ireti`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_events`
--

CREATE TABLE `action_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_id` bigint(20) UNSIGNED NOT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `exception` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext COLLATE utf8mb4_unicode_ci,
  `changes` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `action_events`
--

INSERT INTO `action_events` (`id`, `batch_id`, `user_id`, `name`, `actionable_type`, `actionable_id`, `target_type`, `target_id`, `model_type`, `model_id`, `fields`, `status`, `exception`, `created_at`, `updated_at`, `original`, `changes`) VALUES
(1, '950066bd-1ca1-4bfc-9cbd-83d4fda8737b', 1, 'Update', 'Modules\\User\\Entities\\SuperAdmin', 1, 'Modules\\User\\Entities\\SuperAdmin', 1, 'Modules\\User\\Entities\\SuperAdmin', 1, '', 'finished', '', '2021-11-30 14:26:02', '2021-11-30 14:26:02', '{\"first_name\":\"Abdallah \",\"user_id\":\"?\",\"image\":null,\"fax\":null,\"address\":null,\"zip_code\":null,\"contact_number\":null,\"state_id\":null,\"city_id\":null}', '{\"first_name\":\"Abdallah\",\"user_id\":\"abdo1234\",\"image\":\"3SIk63cWCLu7hVsHBGD2p8z5eN9vyhitGpmzgqOV.png\",\"fax\":\"2142343\",\"address\":\"hasgdhasbvdhas h\",\"zip_code\":\"562346g\",\"contact_number\":\"0113465365\",\"state_id\":\"2\",\"city_id\":\"60\"}'),
(2, '95006737-241b-47b8-9c4a-25e977413f00', 1, 'Create', 'Modules\\User\\Entities\\Admin', 2, 'Modules\\User\\Entities\\Admin', 2, 'Modules\\User\\Entities\\Admin', 2, '', 'finished', '', '2021-11-30 14:27:22', '2021-11-30 14:27:22', NULL, '{\"first_name\":\"admin\",\"last_name\":\"1\",\"user_id\":\"admin1234\",\"image\":\"CJKmqkPWoGruezbADHlsIEresgcLGSlZWLmnAR62.png\",\"email\":\"admin@admin.com\",\"contact_number\":\"01172347432\",\"fax\":\"324243\",\"state_id\":\"3\",\"city_id\":\"93\",\"zip_code\":\"32424\",\"address\":\"hdwfhbefbehbf\",\"user_type\":\"admin\",\"updated_at\":\"2021-11-30T16:27:22.000000Z\",\"created_at\":\"2021-11-30T16:27:22.000000Z\",\"id\":2}'),
(3, '95006855-2f0f-4064-ad20-421512d8eadc', 2, 'Create', 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, '', 'finished', '', '2021-11-30 14:30:29', '2021-11-30 14:30:29', NULL, '{\"first_name\":\"employer\",\"last_name\":\"1\",\"user_id\":\"employer1\",\"image\":\"cNS8cX9ldHrCVKMbbrDWWUfBT8D8S0vS8k9iQIAq.png\",\"email\":\"employer@gmail.com\",\"contact_number\":\"01134435435\",\"fax\":\"3245323\",\"state_id\":\"2\",\"city_id\":\"69\",\"zip_code\":\"623546d\",\"address\":\"jdjbewjb cje c\",\"user_type\":\"employer\",\"updated_at\":\"2021-11-30T16:30:29.000000Z\",\"created_at\":\"2021-11-30T16:30:29.000000Z\",\"id\":3}'),
(4, '9500687e-6c4d-4348-9ca2-fccb60fd6369', 2, 'Update', 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, '', 'finished', '', '2021-11-30 14:30:56', '2021-11-30 14:30:56', '[]', '{\"payment_type\":\"Salary\",\"company_name\":\"compnay 1\",\"billable_rate\":\"1.5\",\"administration_fee\":\"22\",\"class_wc_code\":\"dhb44\",\"fein_number\":\"3\",\"service_provider\":\"service provider\",\"office_number\":\"4\",\"miscellaneous_fee\":\"22\",\"fedex_amount\":\"23\",\"payment_method\":\"Payapal\",\"note\":\"wbjebcuesb\",\"permission\":\"Yes\",\"insurance_submitting_method\":\"Document\",\"insurance_document_path\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/temp\\/php4bxHhX\"}'),
(5, '950068d3-4bda-40ca-b485-53ce9857df49', 2, 'Create', 'Modules\\Employer\\Entities\\Employee', 1, 'Modules\\Employer\\Entities\\Employee', 1, 'Modules\\Employer\\Entities\\Employee', 1, '', 'finished', '', '2021-11-30 14:31:52', '2021-11-30 14:31:52', NULL, '{\"first_name\":\"employee\",\"last_name\":\"1\",\"job_type\":\"carpenter\",\"status\":\"0\",\"employer_id\":3,\"email\":\"employee@gmail.com\",\"contact_number\":\"0123746376\",\"address\":\"bhc jdsbc dsb\",\"payment_type\":\"1\",\"payment_amount\":\"4\",\"overtime_payment_amount\":\"5\",\"billable_rate\":\"1.5\",\"updated_at\":\"2021-11-30T16:31:52.000000Z\",\"created_at\":\"2021-11-30T16:31:52.000000Z\",\"id\":1}'),
(7, '950069c1-5b86-4f14-b1ae-5ac54b40f4ea', 3, 'Delete', 'Modules\\Employer\\Entities\\Employee', 2, 'Modules\\Employer\\Entities\\Employee', 2, 'Modules\\Employer\\Entities\\Employee', 2, '', 'finished', '', '2021-11-30 14:34:28', '2021-11-30 14:34:28', NULL, NULL),
(8, '95024d24-d346-48bd-8249-db2d56177169', 2, 'Create', 'Modules\\Employer\\Entities\\Employer', 13, 'Modules\\Employer\\Entities\\Employer', 13, 'Modules\\Employer\\Entities\\Employer', 13, '', 'finished', '', '2021-12-01 13:06:07', '2021-12-01 13:06:07', NULL, '{\"first_name\":\"test\",\"last_name\":\"two\",\"user_id\":\"test1\",\"image\":\"AVFX2M6CoxcFrrGqyhGin0KbcMPZwmto4gnvNUPO.jpg\",\"email\":\"test1@gmail.com\",\"contact_number\":\"2736374\",\"fax\":\"4237647352\",\"state_id\":\"2\",\"city_id\":\"61\",\"zip_code\":\"gfg\",\"address\":\"bjhbh\",\"user_type\":\"employer\",\"updated_at\":\"2021-12-01T15:06:07.000000Z\",\"created_at\":\"2021-12-01T15:06:07.000000Z\",\"id\":13}'),
(9, '95024e8b-b661-4a70-a067-72b694682604', 2, 'Create', 'Modules\\Employer\\Entities\\Employer', 14, 'Modules\\Employer\\Entities\\Employer', 14, 'Modules\\Employer\\Entities\\Employer', 14, '', 'finished', '', '2021-12-01 13:10:02', '2021-12-01 13:10:02', NULL, '{\"first_name\":\"test\",\"last_name\":\"3\",\"user_id\":\"test3\",\"image\":\"Ryf65503wLqeBpWZXtwIOZ5R2HUrC5cSIwuxbEJO.png\",\"email\":\"b@b.com\",\"contact_number\":\"011676767\",\"fax\":\"767655455\",\"state_id\":\"2\",\"city_id\":\"61\",\"zip_code\":\"5465677\",\"address\":\"gihgujhinknkn\",\"user_type\":\"employer\",\"updated_at\":\"2021-12-01T15:10:02.000000Z\",\"created_at\":\"2021-12-01T15:10:02.000000Z\",\"id\":14}'),
(10, '9502525c-0824-48a5-8362-674974a67ecf', 2, 'Update', 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, '', 'finished', '', '2021-12-01 13:20:42', '2021-12-01 13:20:42', '[]', '[]'),
(11, '95025260-fcd0-463b-9e82-f97ab45690db', 2, 'Update', 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, 'Modules\\Employer\\Entities\\Employer', 3, '', 'finished', '', '2021-12-01 13:20:45', '2021-12-01 13:20:45', '[]', '{\"payment_type\":\"Salary\",\"company_name\":\"compnay 1\",\"billable_rate\":\"2\",\"administration_fee\":\"22\",\"class_wc_code\":\"dhb44\",\"fein_number\":\"3\",\"service_provider\":\"service provider\",\"office_number\":\"4\",\"miscellaneous_fee\":\"22\",\"fedex_amount\":\"23\",\"payment_method\":\"Payapal\",\"note\":\"wbjebcuesb\",\"permission\":\"No\",\"insurance_submitting_method\":\"Document\",\"insurance_document_path\":null}'),
(12, '95025b7a-9c43-4945-8967-665e51914b3d', 2, 'Create', 'Modules\\Employer\\Entities\\Employer', 16, 'Modules\\Employer\\Entities\\Employer', 16, 'Modules\\Employer\\Entities\\Employer', 16, '', 'finished', '', '2021-12-01 13:46:12', '2021-12-01 13:46:12', NULL, '{\"first_name\":\"test\",\"last_name\":\"4\",\"user_id\":\"test4\",\"image\":\"tXQBeqwvzD8PxHWk4cBF2xKAbe9Ez0XXabaUZgQK.png\",\"email\":\"test4@a.com\",\"contact_number\":\"435435435\",\"fax\":null,\"state_id\":\"2\",\"city_id\":\"60\",\"zip_code\":\"dssf\",\"address\":\"rgrgetgertgert\",\"user_type\":\"employer\",\"updated_at\":\"2021-12-01T15:46:12.000000Z\",\"created_at\":\"2021-12-01T15:46:12.000000Z\",\"id\":16}');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alexander City', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(2, 1, 'Andalusia', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(3, 1, 'Anniston', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(4, 1, 'Athens', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(5, 1, 'Atmore', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(6, 1, 'Auburn', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(7, 1, 'Bessemer', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(8, 1, 'Birmingham', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(9, 1, 'Chickasaw', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(10, 1, 'Clanton', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(11, 1, 'Cullman', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(12, 1, 'Decatur', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(13, 1, 'Demopolis', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(14, 1, 'Dothan', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(15, 1, 'Enterprise', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(16, 1, 'Eufaula', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(17, 1, 'Florence', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(18, 1, 'Fort Payne', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(19, 1, 'Gadsden', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(20, 1, 'Greenville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(21, 1, 'Guntersville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(22, 1, 'Huntsville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(23, 1, 'Jasper', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(24, 1, 'Marion', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(25, 1, 'Mobile', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(26, 1, 'Montgomery', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(27, 1, 'Opelika', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(28, 1, 'Ozark', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(29, 1, 'Phenix City', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(30, 1, 'Prichard', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(31, 1, 'Scottsboro', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(32, 1, 'Selma', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(33, 1, 'Sheffield', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(34, 1, 'Sylacauga', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(35, 1, 'Talladega', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(36, 1, 'Troy', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(37, 1, 'Tuscaloosa', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(38, 1, 'Tuscumbia', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(39, 1, 'Tuskegee', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(40, 1, 'Alaska', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(41, 1, 'Anchorage', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(42, 1, 'Cordova', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(43, 1, 'Fairbanks', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(44, 1, 'Haines', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(45, 1, 'Homer', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(46, 1, 'Juneau', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(47, 1, 'Ketchikan', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(48, 1, 'Kodiak', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(49, 1, 'Kotzebue', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(50, 1, 'Nome', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(51, 1, 'Palmer', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(52, 1, 'Seward', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(53, 1, 'Sitka', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(54, 1, 'Skagway', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(55, 1, 'Valdez', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(56, 2, 'Ajo', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(57, 2, 'Avondale', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(58, 2, 'Bisbee', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(59, 2, 'Casa Grande', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(60, 2, 'Chandler', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(61, 2, 'Clifton', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(62, 2, 'Douglas', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(63, 2, 'Flagstaff', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(64, 2, 'Florence', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(65, 2, 'Gila Bend', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(66, 2, 'Glendale', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(67, 2, 'Globe', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(68, 2, 'Kingman', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(69, 2, 'Lake Havasu City', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(70, 2, 'Mesa', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(71, 2, 'Nogales', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(72, 2, 'Oraibi', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(73, 2, 'Phoenix', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(74, 2, 'Prescott', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(75, 2, 'Scottsdale', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(76, 2, 'Sierra Vista', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(77, 2, 'Tempe', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(78, 2, 'Tombstone', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(79, 2, 'Tucson', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(80, 2, 'Walpi', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(81, 2, 'Window Rock', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(82, 2, 'Winslow', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(83, 2, 'Yuma', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(84, 3, 'Arkadelphia', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(85, 3, 'Arkansas Post', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(86, 3, 'Batesville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(87, 3, 'Benton', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(88, 3, 'Blytheville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(89, 3, 'Camden', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(90, 3, 'Conway', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(91, 3, 'Crossett', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(92, 3, 'El Dorado', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(93, 3, 'Fayetteville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(94, 3, 'Forrest City', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(95, 3, 'Fort Smith', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(96, 3, 'Harrison', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(97, 3, 'Helena', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(98, 3, 'Hope', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(99, 3, 'Hot Springs', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(100, 3, 'Jacksonville', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(101, 3, 'Jonesboro', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(102, 3, 'Little Rock', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(103, 3, 'Magnolia', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(104, 3, 'Morrilton', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(105, 3, 'Newport', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(106, 3, 'North Little Rock', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(107, 3, 'Osceola', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(108, 3, 'Pine Bluff', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(109, 3, 'Rogers', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(110, 3, 'Searcy', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(111, 3, 'Stuttgart', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(112, 3, 'Van Buren', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(113, 3, 'West Memphis', '2021-11-30 14:24:08', '2021-11-30 14:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` bigint(20) NOT NULL,
  `overtime_payment_amount` bigint(20) NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billable_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `job_type`, `employer_id`, `payment_type`, `payment_amount`, `overtime_payment_amount`, `address`, `email`, `contact_number`, `billable_rate`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'employee', '1', 'carpenter', 3, '1', 4, 5, 'bhc jdsbc dsb', 'employee@gmail.com', '0123746376', '1.5', '0', '2021-11-30 14:31:52', '2021-11-30 14:31:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employer_details`
--

CREATE TABLE `employer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billable_rate` int(11) DEFAULT NULL,
  `administration_fee` int(11) DEFAULT NULL,
  `class_wc_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fein_number` int(11) DEFAULT NULL,
  `service_provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_number` int(11) DEFAULT NULL,
  `miscellaneous_fee` int(11) DEFAULT NULL,
  `fedex_amount` int(11) DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `insurance_submitting_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance_document_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employer_details`
--

INSERT INTO `employer_details` (`id`, `user_id`, `company_name`, `billable_rate`, `administration_fee`, `class_wc_code`, `fein_number`, `service_provider`, `office_number`, `miscellaneous_fee`, `fedex_amount`, `payment_type`, `payment_method`, `note`, `permission`, `insurance_submitting_method`, `insurance_document_path`, `created_at`, `updated_at`) VALUES
(1, 3, 'compnay 1', 2, 22, 'dhb44', 3, 'service provider', 4, 22, 23, 'Salary', 'Payapal', 'wbjebcuesb', 'No', NULL, NULL, '2021-11-30 14:30:29', '2021-12-01 13:20:45'),
(2, 13, 'company 2', 1, NULL, '45trrt', 6, 'service provider', 4, NULL, 5, 'Hourly', 'Echeck Approval', 'yugyybhb', 'Yes', 'Document', '/Applications/XAMPP/xamppfiles/temp/phpBQPhnV', '2021-12-01 13:06:07', '2021-12-01 13:06:07'),
(3, 14, 'company 3', 1, 5, '32736t', 5, 'service provider', 4, 4, 5, 'Salary', 'Echeck Approval', 'jhgubhu', 'Yes', 'Document', '/Applications/XAMPP/xamppfiles/temp/phpfDCdUc', '2021-12-01 13:10:02', '2021-12-01 13:10:02'),
(4, 16, 'company 2', 1, NULL, '344dfcd', 4, 'dccs', 5, NULL, 5, 'Salary', 'Echeck Approval', 'fvvfdvf', 'No', NULL, NULL, '2021-12-01 13:46:12', '2021-12-01 13:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_employees_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_01_01_000000_create_action_events_table', 1),
(5, '2019_05_10_000000_add_fields_to_action_events_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2021_01_30_142258_create_permission_tables', 1),
(9, '2021_02_04_161904_create_states_table', 1),
(10, '2021_02_04_161910_create_cities_table', 1),
(11, '2021_11_26_132031_create_employer_details_table', 1),
(12, '9999_12_31_000000_add_foreign_keys_to_all_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Modules\\User\\Entities\\SuperAdmin', 1),
(2, 'Modules\\User\\Entities\\Admin', 2),
(3, 'Modules\\Employer\\Entities\\Employer', 3),
(3, 'Modules\\Employer\\Entities\\Employer', 13),
(3, 'Modules\\Employer\\Entities\\Employer', 14),
(3, 'Modules\\Employer\\Entities\\Employer', 16);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admins.index', 'web', NULL, NULL),
(2, 'admins.show', 'web', NULL, NULL),
(3, 'admins.create', 'web', NULL, NULL),
(4, 'admins.update', 'web', NULL, NULL),
(5, 'admins.delete', 'web', NULL, NULL),
(6, 'users.index', 'web', NULL, NULL),
(7, 'users.show', 'web', NULL, NULL),
(8, 'users.create', 'web', NULL, NULL),
(9, 'users.update', 'web', NULL, NULL),
(10, 'users.delete', 'web', NULL, NULL),
(11, 'super_admins.index', 'web', NULL, NULL),
(12, 'super_admins.show', 'web', NULL, NULL),
(13, 'super_admins.create', 'web', NULL, NULL),
(14, 'super_admins.update', 'web', NULL, NULL),
(15, 'super_admins.delete', 'web', NULL, NULL),
(16, 'employers.index', 'web', NULL, NULL),
(17, 'employers.show', 'web', NULL, NULL),
(18, 'employers.create', 'web', NULL, NULL),
(19, 'employers.update', 'web', NULL, NULL),
(20, 'employers.delete', 'web', NULL, NULL),
(21, 'employees.index', 'web', NULL, NULL),
(22, 'employees.show', 'web', NULL, NULL),
(23, 'employees.create', 'web', NULL, NULL),
(24, 'employees.update', 'web', NULL, NULL),
(25, 'employees.delete', 'web', NULL, NULL),
(26, 'cities.index', 'web', NULL, NULL),
(27, 'cities.show', 'web', NULL, NULL),
(28, 'cities.create', 'web', NULL, NULL),
(29, 'cities.update', 'web', NULL, NULL),
(30, 'cities.delete', 'web', NULL, NULL),
(31, 'states.index', 'web', NULL, NULL),
(32, 'states.show', 'web', NULL, NULL),
(33, 'states.create', 'web', NULL, NULL),
(34, 'states.update', 'web', NULL, NULL),
(35, 'states.delete', 'web', NULL, NULL),
(36, 'roles.index', 'web', NULL, NULL),
(37, 'roles.show', 'web', NULL, NULL),
(38, 'roles.create', 'web', NULL, NULL),
(39, 'roles.update', 'web', NULL, NULL),
(40, 'roles.delete', 'web', NULL, NULL),
(41, 'permissions.index', 'web', NULL, NULL),
(42, 'permissions.show', 'web', NULL, NULL),
(43, 'permissions.create', 'web', NULL, NULL),
(44, 'permissions.update', 'web', NULL, NULL),
(45, 'permissions.delete', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(2, 'admin', 'web', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(3, 'employer', 'web', '2021-11-30 14:24:08', '2021-11-30 14:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(1, 2),
(2, 2),
(6, 2),
(7, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(6, 3),
(7, 3),
(16, 3),
(17, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Alabama', 'Al', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(2, 'Arizona', 'Ar', '2021-11-30 14:24:08', '2021-11-30 14:24:08'),
(3, 'Arkansas', 'Ar', '2021-11-30 14:24:08', '2021-11-30 14:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` enum('super_admin','admin','employer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `first_name`, `last_name`, `user_id`, `email`, `password`, `email_verified_at`, `remember_token`, `image`, `fax`, `address`, `zip_code`, `contact_number`, `state_id`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super_admin', 'Abdallah', 'Ali', 'abdo1234', 'superadmin@admin.com', '$2y$10$N7xUcD3A44CebppWtzbb9OoX/S11vMBKlDsyvjkmZkuWYQ0LPXD2.', '2021-11-30 14:24:08', '6QTQyIicrP5fAjbrrwjtltCJdbKDRhuJnGBidOAs1Nw6HKVNptiidpmP6yMu', '3SIk63cWCLu7hVsHBGD2p8z5eN9vyhitGpmzgqOV.png', '2142343', 'hasgdhasbvdhas h', '562346g', '0113465365', 2, 60, '2021-11-30 14:24:08', '2021-11-30 14:26:02', NULL),
(2, 'admin', 'admin', '1', 'admin1234', 'admin@admin.com', '$2y$10$LDtkzXu5C/ggp0o/RSmrB.mNpousEplG4Uqiodxb1j2oqYh4CMOwi', NULL, NULL, 'CJKmqkPWoGruezbADHlsIEresgcLGSlZWLmnAR62.png', '324243', 'hdwfhbefbehbf', '32424', '01172347432', 3, 93, '2021-11-30 14:27:22', '2021-11-30 14:27:22', NULL),
(3, 'employer', 'employer', '1', 'employer1', 'employer@gmail.com', '$2y$10$/kl33gATkYkqgtwLWj8SOOQ1L.Gpi77aOCo6Yu6qUuH/VCWKGAc3q', NULL, NULL, 'cNS8cX9ldHrCVKMbbrDWWUfBT8D8S0vS8k9iQIAq.png', '3245323', 'jdjbewjb cje c', '623546d', '01134435435', 2, 69, '2021-11-30 14:30:29', '2021-12-01 13:20:45', NULL),
(13, 'employer', 'test', 'two', 'test1', 'test1@gmail.com', '$2y$10$KAGkNodPvFmp4HZh5oUT6OedXxaC.Tgs7vEacbqxOV42loTak2G.y', NULL, NULL, 'AVFX2M6CoxcFrrGqyhGin0KbcMPZwmto4gnvNUPO.jpg', '4237647352', 'bjhbh', 'gfg', '2736374', 2, 61, '2021-12-01 13:06:07', '2021-12-01 13:06:07', NULL),
(14, 'employer', 'test', '3', 'test3', 'b@b.com', '$2y$10$JXkJzG3MA8tPdojsMw6zO.uJJtg/W3Sr.bCuVXUwe5rQNsYcROcie', NULL, NULL, 'Ryf65503wLqeBpWZXtwIOZ5R2HUrC5cSIwuxbEJO.png', '767655455', 'gihgujhinknkn', '5465677', '011676767', 2, 61, '2021-12-01 13:10:02', '2021-12-01 13:10:02', NULL),
(16, 'employer', 'test', '4', 'test4', 'test4@a.com', '$2y$10$AjIh.NchsGLE3S0NMHK2JOsd8rCawg43uiUHpqbtx2oRjTAaUMUcq', NULL, NULL, 'tXQBeqwvzD8PxHWk4cBF2xKAbe9Ez0XXabaUZgQK.png', NULL, 'rgrgetgertgert', 'dssf', '435435435', 2, 60, '2021-12-01 13:46:12', '2021-12-01 13:46:12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_events`
--
ALTER TABLE `action_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  ADD KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  ADD KEY `action_events_user_id_index` (`user_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `employer_details`
--
ALTER TABLE `employer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_state_id_foreign` (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_events`
--
ALTER TABLE `action_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_details`
--
ALTER TABLE `employer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `employer_details`
--
ALTER TABLE `employer_details`
  ADD CONSTRAINT `employer_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
