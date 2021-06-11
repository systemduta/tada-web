-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2021 at 11:06 AM
-- Server version: 10.2.31-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duatanga_maesaapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_merchants`
--

CREATE TABLE `category_merchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_merchants`
--

INSERT INTO `category_merchants` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'food and beverages', '2021-05-10 10:45:46', NULL),
(2, 'fashion', '2021-05-10 10:47:24', NULL),
(3, 'education', '2021-05-10 10:47:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `user_id`, `name`, `short_description`, `long_description`, `category_id`, `background`, `created_at`, `updated_at`) VALUES
(1, 59, 'Maesa Group', 'Deskripsi Maesa Group', 'Deskripsi Maesa Group', 1, 'Capture.PNG', '2021-05-11 13:21:45', '2021-05-11 13:21:45'),
(5, 64, 'Trenggono PTE LTD', 'ad', 'Perusahaan yang mandiri', 1, 'kemenag.png', '2021-05-25 07:23:29', '2021-05-25 07:23:29'),
(6, 65, 'System Duta Inc', 'Sys', 'Duta Inc', 2, '1.jpg', '2021-05-25 07:34:40', '2021-05-25 07:34:40'),
(7, 66, 'Sultan Inc.', 'Ini adalah perusahaan fashion by sultan', 'Fajrul sultan Inc yang membawa perubahan', 2, 'Screenshot from 2021-05-20 10-51-48.png', '2021-06-01 09:46:16', '2021-06-01 09:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_04_23_021229_create_merchants_table', 1),
(10, '2021_04_23_023120_create_category_merchants_table', 1),
(11, '2021_05_01_001525_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00641292d5d95edc199182d0203a765d5344df8a80bb81697cc9ebec1cde076c12096ad0b8f0b144', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:42:21', '2021-05-03 09:42:21', '2022-05-03 16:42:21'),
('016e45376a0f2ab43da1e92ab36b5322741b7294e024562a585862b7d41bfd6d38d67605f6eef257', 65, 1, 'maesaintern', '[]', 0, '2021-05-25 08:52:13', '2021-05-25 08:52:13', '2022-05-25 15:52:13'),
('039f12238f41acd33b231a66eabd5f7ef6740b34bf51f16368b4be66412eecef9c3a8c378ca4549e', 64, 1, 'maesaintern', '[]', 0, '2021-05-31 03:17:25', '2021-05-31 03:17:25', '2022-05-31 10:17:25'),
('03d1ad63584e0572e93e7678c376b2665480be43ab18c4f9ea20dffa8f81b01430ccb886342e7437', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:31:42', '2021-05-03 09:31:42', '2022-05-03 16:31:42'),
('0d1fd7f153e0bb13ac4761d22f4b687de41cc0c2a09edbb79f5ff82283ab7187e7e4dc71d9691102', 1, 1, 'maesaintern', '[]', 0, '2021-04-30 22:23:00', '2021-04-30 22:23:00', '2022-05-01 05:23:00'),
('0d936ec163146c1bcf223edf73e20fcaf62e26dcab2756532804699edd0c2e635bca225053eed853', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:35:46', '2021-05-03 09:35:46', '2022-05-03 16:35:46'),
('0dfc96fcba8a8c9eb5e6571f1f49b91cb2c79aa787ae7ba32598d76a6c70ee44fa783532f4bef802', 66, 1, 'maesaintern', '[]', 0, '2021-06-04 07:01:08', '2021-06-04 07:01:08', '2022-06-04 14:01:08'),
('133d85368678656cff6180f37b691f036f0097d6829c0d9668b4d56652430895a8ee9ace2c822d9f', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:43:12', '2021-05-03 09:43:12', '2022-05-03 16:43:12'),
('1510ec9c14d9bfb372b78df21a438065024d68a76f3e22543414f664d1cb44a37833971a0d31bb60', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 10:02:31', '2021-05-03 10:02:31', '2022-05-03 17:02:31'),
('167b4b0af1a65ce9bf213fd518a0b47164b690b0e13e1ac62c0851bb4eb3dee0e300be6e4f13628e', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 02:46:33', '2021-05-24 02:46:33', '2022-05-24 09:46:33'),
('18d192dec98bbd6b66df924ad9654918d4e512eaf24544cfa7055f719b24cc133ad3fe70a3fa42b7', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:52:52', '2021-05-03 09:52:52', '2022-05-03 16:52:52'),
('1d2ed90a14ddd748b8656d423f4ade326d3417679ba8d2ae8eaff42d6c975980b751ca78825666db', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:58:33', '2021-05-03 09:58:33', '2022-05-03 16:58:33'),
('1d6380d01cdaaec6539138342adc863a1f8be18c7378738684bcaa35a4d58f14654ac595a54694d1', 1, 1, 'maesaintern', '[]', 0, '2021-04-30 22:04:36', '2021-04-30 22:04:36', '2022-05-01 05:04:36'),
('20189545b49c9dc034eb436111fde64ad558bf1f028c483fc5f23d8ebbe01d7a4dad6338c242a1fc', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:59:44', '2021-05-03 09:59:44', '2022-05-03 16:59:44'),
('29743edf777f90abaa29fec278479bfaf1e08cd6626aa7f61e929148bfdc3dace75681563a165aaa', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 04:01:21', '2021-05-24 04:01:21', '2022-05-24 11:01:21'),
('2b77765082eeafb9d91d82b46458ec3b3a3c50e4f927ab900873e0d819b46b264c8205f707d6d198', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:41:37', '2021-05-03 09:41:37', '2022-05-03 16:41:37'),
('2eba9e1cf93eca350434f7d0dad1f169573299961054984ca1d36b0d6fabb8cffd770ad66ac5c1b7', 64, 1, 'maesaintern', '[]', 0, '2021-05-31 02:49:15', '2021-05-31 02:49:15', '2022-05-31 09:49:15'),
('304a43d298dfbbf6af9fa0761bf822520d93e84945d766f75b6e652370582bc33948b9f20f3d024f', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 02:45:02', '2021-05-24 02:45:02', '2022-05-24 09:45:02'),
('3a29a1c3cab9c64cac674c89dbe8a4b02d5add65a3f4d1470a9e41ae12765cbc1d697e2228d6268c', 1, 1, 'maesaintern', '[]', 0, '2021-05-28 03:22:28', '2021-05-28 03:22:28', '2022-05-28 10:22:28'),
('3c37d86eb8e8e1ebf348509d47801c60ccf65c06fc0180377afa5ec0ecad61234736dbd3a01fe452', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:46:09', '2021-05-03 09:46:09', '2022-05-03 16:46:09'),
('3d433b4f2045e2150fa38dca9356b038f46f6d16db95b9250aec51ddec698006fe861c68d488f51a', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:38:37', '2021-05-03 09:38:37', '2022-05-03 16:38:37'),
('4b9fa72ce00cffd856e19411f0052953987a3b591f66e2e0078cfa9c4baaff92a0ed00a9038519ae', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 08:36:26', '2021-05-03 08:36:26', '2022-05-03 15:36:26'),
('4defa31bb868585f7ac9a55a0a8860446513b39ecdb7be3d960dbe58ae4fcb4b22bf41028ffacb04', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:53:47', '2021-05-03 09:53:47', '2022-05-03 16:53:47'),
('4ee60d63e30b84a888bd0749917688f1f78c35754c54f9d5dcd449dd5184173bde031fc1c741fc52', 66, 1, 'maesaintern', '[]', 0, '2021-06-07 03:38:40', '2021-06-07 03:38:40', '2022-06-07 10:38:40'),
('518295ee77535a6ed10f2b1252fb50bea4d4d9b498716c510985fb789f7ed3ff79620fdca81d045f', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:38:18', '2021-05-03 09:38:18', '2022-05-03 16:38:18'),
('552a3314e697581452f52ffa41b1a00d2bb408bf35dcade475f4e6a6bb2debb16ef607bd1c21a496', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:40:45', '2021-05-03 09:40:45', '2022-05-03 16:40:45'),
('58e947b048967b76e386dc7ac44e139dd9206c0daae06b93d6c38fcd779eedb5ae9414e2904567bf', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:50:27', '2021-05-03 09:50:27', '2022-05-03 16:50:27'),
('5c0fb1d3a3490c9b5e0ac66a0897dba162bdec979b90813d23a70ef43fd3eddf19002a4c06bad768', 64, 1, 'maesaintern', '[]', 0, '2021-05-28 03:37:25', '2021-05-28 03:37:25', '2022-05-28 10:37:25'),
('5f22a7cb3e53d0c42fbc2ca230e45eb26da49cde3adb159439a4d9bc51b39dad1a1ece8993f45ae1', 64, 1, 'maesaintern', '[]', 0, '2021-05-28 09:58:39', '2021-05-28 09:58:39', '2022-05-28 16:58:39'),
('5f3f30fb30c580ad5b6f1d97a32f3528ebcf826857638f085e445028150549e513e70f1555fe8d24', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:46:26', '2021-05-03 09:46:26', '2022-05-03 16:46:26'),
('5f4f3080c0a06f94008e4336407d7f54c7e193533b69da8be8402dfc8272d73994a2effa7a622bb8', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:52:18', '2021-05-03 09:52:18', '2022-05-03 16:52:18'),
('5fd2ecb9256b74f959ed724a4b3efeb8d893d964fef987b92edd6c1a77bb3fb5b491073ca1edf9ca', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:34:23', '2021-05-03 09:34:23', '2022-05-03 16:34:23'),
('62e27151b056d67d42edb04dfa01236402f973d973e4245a6dc942feadd304374a692d1a19742867', 66, 1, 'maesaintern', '[]', 0, '2021-06-02 09:29:16', '2021-06-02 09:29:16', '2022-06-02 16:29:16'),
('64561f389ed9fc9b3583a2bd7218f7d75f70fe915bbaae434d49c780f057fa58e85b00f4569e63f5', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 10:00:08', '2021-05-03 10:00:08', '2022-05-03 17:00:08'),
('661c1ecdd36beb50c4300e8e5dec227045400cf096d3234e93518cc955f1d69bac34c220aee323a2', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:51:45', '2021-05-03 09:51:45', '2022-05-03 16:51:45'),
('68a2b2edf0d26775b635a341c262fa5b67dd447a1500e485e0819bd93b248b1ed3f3abc736db5060', 64, 1, 'maesaintern', '[]', 0, '2021-05-28 09:59:27', '2021-05-28 09:59:27', '2022-05-28 16:59:27'),
('6b146bf725399118272a66a86afdb6d78b25059e91b7515c229cb1a12c9ad0e477b3aecf0ba9cf9d', 66, 1, 'maesaintern', '[]', 0, '2021-06-04 04:18:38', '2021-06-04 04:18:38', '2022-06-04 11:18:38'),
('6c9aef892fa686ce66dd84666a621ca88f380bf90e9da4346fac69dd7ea720b581e1f34a47c29c82', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:48:51', '2021-05-03 09:48:51', '2022-05-03 16:48:51'),
('6caf3d4bd8839b5dadf273132f03e67a0ded0f2ec2843a0e9413099d9d32493ca37849633273a7ad', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:48:23', '2021-05-03 09:48:23', '2022-05-03 16:48:23'),
('6ddebc4a152669e46bd7593266269669972e7019f91d52133d63d62651792528fc6895f75ad37e3f', 66, 1, 'maesaintern', '[]', 0, '2021-06-02 08:15:48', '2021-06-02 08:15:48', '2022-06-02 15:15:48'),
('6f1b6617c5ee75294ed72e2c1a3551e2599707797a06ddb996c1aee48e23f0514c564a5a2a78eae1', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 02:36:26', '2021-05-24 02:36:26', '2022-05-24 09:36:26'),
('707bb3ef86ae21910752cdbe55a0a5ae4aa0e495126f4e086abd42b2ce83d38563d59664efac84b9', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:45:19', '2021-05-03 09:45:19', '2022-05-03 16:45:19'),
('7aa85811a4e4bec43dcc30b487bfbf9f3f0013ff025ebb59a9d3917d0e779fb8ac99115a4f422de3', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:40:27', '2021-05-03 09:40:27', '2022-05-03 16:40:27'),
('839384bd0f2ff0fb31286468d75cb746fcf00fa2f3fd9b8ba5111e614a6e5a575cc26f16dbeb79c0', 64, 1, 'maesaintern', '[]', 0, '2021-05-28 09:59:07', '2021-05-28 09:59:07', '2022-05-28 16:59:07'),
('855abe651c91057262c695c4623c1d9f394266998cdeeeeec3a739079aa5bcdff99ac138b725f64b', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 02:47:00', '2021-05-24 02:47:00', '2022-05-24 09:47:00'),
('8674227356714a3f98b212e1739b7a70ded3ab843b6ed3290d45c40993a190d56d722939e4140713', 65, 1, 'maesaintern', '[]', 0, '2021-05-25 09:18:36', '2021-05-25 09:18:36', '2022-05-25 16:18:36'),
('87767d2c48ae0177b4e01f1536efafc3a67b40d9a494d9b02679bba909e4bdfc5a1f5400df6a2e46', 1, 1, 'maesaintern', '[]', 0, '2021-04-30 22:09:30', '2021-04-30 22:09:30', '2022-05-01 05:09:30'),
('91356998434f4534d155170cffc193ea5578ecd924d84b1ce470de58eb953f33e3cce289c906e8de', 1, 1, 'maesaintern', '[]', 0, '2021-05-24 02:45:37', '2021-05-24 02:45:37', '2022-05-24 09:45:37'),
('9754da192730500726787e950420a891d7e1773404e080eec6b18038dc3372730f8c55bc5c699f22', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 10:01:00', '2021-05-03 10:01:00', '2022-05-03 17:01:00'),
('979c327e71077bd7337f523882b4846fab8d72a6ea859a0af3b135b01609c158ef22391d08f77884', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:49:49', '2021-05-03 09:49:49', '2022-05-03 16:49:49'),
('9abd5a56b93bead17a1d10169a850d3ed3a288e92da917b8380aa09a9b43fc9c4434192c4883398d', 66, 1, 'maesaintern', '[]', 0, '2021-06-07 03:45:48', '2021-06-07 03:45:48', '2022-06-07 10:45:48'),
('9d0f8e12eda2ebfa54f84a64a41aa034129a9ab5e99bf4e15005869eeaec5688bae71980fb4cf1bc', 1, 1, 'maesaintern', '[]', 0, '2021-05-25 02:14:12', '2021-05-25 02:14:12', '2022-05-25 09:14:12'),
('9da176ea2ebd8ea4579e712da4ce5a275a4375be2c16541b3070f2e79d63b265bb3fe0ca6045a8b6', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:56:22', '2021-05-03 09:56:22', '2022-05-03 16:56:22'),
('a4c2f385b51c944e2ba1031345b797a320eedbb60f7a5ba42069bef28edfc709c83f94cbb8242e55', 1, 1, 'maesaintern', '[]', 0, '2021-04-30 22:04:05', '2021-04-30 22:04:05', '2022-05-01 05:04:05'),
('a8d3cbcc02118e183ebe1a77c67c4378070d78fc8c11fae6c229d774ecb911a56023f500bc4ecd7a', 66, 1, 'maesaintern', '[]', 0, '2021-06-02 09:17:15', '2021-06-02 09:17:15', '2022-06-02 16:17:15'),
('aa8eb526f832cf9217637d4486037e1eea96b29ec91ebcdaee387b5e2f75a478a8edc4af3cba5688', 66, 1, 'maesaintern', '[]', 0, '2021-06-04 01:58:13', '2021-06-04 01:58:13', '2022-06-04 08:58:13'),
('ad0b9645ff43906aa695675e054d9ae4b9817337fc7329348bfb2ee46671d0cff6a9c63c1032a4c3', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:43:33', '2021-05-03 09:43:33', '2022-05-03 16:43:33'),
('afdc36247bf220a30ffbd75c8866adbc66b2623bc1493dc921ad13722645dc8e60f6672f6e2526e4', 64, 1, 'maesaintern', '[]', 0, '2021-05-31 02:10:55', '2021-05-31 02:10:55', '2022-05-31 09:10:55'),
('b00ef34b1b09b538bfcc72208ff5ae7c53e0f3eaf190a7f56b19f7540caeccb1d6dde3415d575b8d', 64, 1, 'maesaintern', '[]', 0, '2021-05-31 02:11:05', '2021-05-31 02:11:05', '2022-05-31 09:11:05'),
('b1feca94d0a6abe45ad663d58b7ce0ac4ce61a704539a820c042a14a8c0db89129e7498eceba9d69', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:51:01', '2021-05-03 09:51:01', '2022-05-03 16:51:01'),
('b807b4b1282b484a041e1906fe23335be93500068075359289339b324edcfe306e9975fa505b9832', 1, 1, 'maesaintern', '[]', 0, '2021-05-02 15:16:02', '2021-05-02 15:16:02', '2022-05-02 22:16:02'),
('b9b9d9bf5d613e79fe03b83e2b2ae6a9bbf06c3cfe9925dff9b2042ddb69f4426e56a286e5780721', 64, 1, 'maesaintern', '[]', 0, '2021-05-31 08:58:09', '2021-05-31 08:58:09', '2022-05-31 15:58:09'),
('c367cff003581dff18b7d233082c62d53d20b8f8a28046203a82ed98c61a92746fb5f4e84c25fb79', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:46:41', '2021-05-03 09:46:41', '2022-05-03 16:46:41'),
('c5668a89351d913bc70674792d2ac5bcf841c430652dea5e7826670f42d239fda284d13b5681a841', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:57:59', '2021-05-03 09:57:59', '2022-05-03 16:57:59'),
('c5febe76d9ce8a69c2fa6a27275bd31e62559545db6851d9c56cd8e408d386027448dbd98a44b40b', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:36:43', '2021-05-03 09:36:43', '2022-05-03 16:36:43'),
('c6a71a49c279f6714b4773cee0ffbb572f2d678b49cf1064c3a0ccead20518e67a32e617595c2271', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:49:14', '2021-05-03 09:49:14', '2022-05-03 16:49:14'),
('d54da2eb9249b6aad837d41efc8b50886ff5e5dce8695561a5b83831bcf72da4065182371158271e', 1, 1, 'maesaintern', '[]', 0, '2021-04-30 23:00:59', '2021-04-30 23:00:59', '2022-05-01 06:00:59'),
('dfd6e41bf5b435523bb0d856aa0d33b12c24f948f1648a6aead03c9759a229f74ba0271f2eeb71cd', 66, 1, 'maesaintern', '[]', 0, '2021-06-04 01:46:40', '2021-06-04 01:46:40', '2022-06-04 08:46:40'),
('f2a961141f5b9d5f1b2fee5d1bd660b4468fba2397761d357cd74567541c8c5cc3ff435277536c24', 1, 1, 'maesaintern', '[]', 0, '2021-05-28 03:22:16', '2021-05-28 03:22:16', '2022-05-28 10:22:16'),
('f640a631e366bd54642d6efdceaa1562c93b89c27f6e59735ed4534a0e69bfe456e32891cd111f9f', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:42:49', '2021-05-03 09:42:49', '2022-05-03 16:42:49'),
('f87193f5dd2e416a3f175cfbf711a33e20f95c2b0d86438af73502f3af6b55267cd1582ddd59050a', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 10:00:30', '2021-05-03 10:00:30', '2022-05-03 17:00:30'),
('f90c43a9cf2d1c0049d8f2a29d8dea4cf94c0175d307863484131acf5fa069e38b4fb64c4b04c0aa', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:55:11', '2021-05-03 09:55:11', '2022-05-03 16:55:11'),
('fa8d28f93c8cbd45e72d1fba8615db938347757df3ab5c0514df5eac7963130671d592440001f677', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:57:08', '2021-05-03 09:57:08', '2022-05-03 16:57:08'),
('fc075e0fcbc2033cf2c17e1eae243d88093a9d4fc88af1ba37a358ab9977976693f998460809ac90', 1, 1, 'maesaintern', '[]', 0, '2021-05-03 09:57:34', '2021-05-03 09:57:34', '2022-05-03 16:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'hKZcNfZhLN4qvWxyqjC5TqdXSJSlHbn8JiZvMXi4', NULL, 'http://localhost', 1, 0, 0, '2021-04-30 22:00:49', '2021-04-30 22:00:49'),
(2, NULL, 'Laravel Password Grant Client', 'Q8Dct1BHJKlcNpfiKvdM2uq0QcvOgQhB2MUc0dMp', 'users', 'http://localhost', 0, 1, 0, '2021-04-30 22:00:49', '2021-04-30 22:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-30 22:00:49', '2021-04-30 22:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
('11', 'ACEH'),
('12', 'SUMATERA UTARA'),
('13', 'SUMATERA BARAT'),
('14', 'RIAU'),
('15', 'JAMBI'),
('16', 'SUMATERA SELATAN'),
('17', 'BENGKULU'),
('18', 'LAMPUNG'),
('19', 'KEPULAUAN BANGKA BELITUNG'),
('21', 'KEPULAUAN RIAU'),
('31', 'DKI JAKARTA'),
('32', 'JAWA BARAT'),
('33', 'JAWA TENGAH'),
('34', 'DI YOGYAKARTA'),
('35', 'JAWA TIMUR'),
('36', 'BANTEN'),
('51', 'BALI'),
('52', 'NUSA TENGGARA BARAT'),
('53', 'NUSA TENGGARA TIMUR'),
('61', 'KALIMANTAN BARAT'),
('62', 'KALIMANTAN TENGAH'),
('63', 'KALIMANTAN SELATAN'),
('64', 'KALIMANTAN TIMUR'),
('65', 'KALIMANTAN UTARA'),
('71', 'SULAWESI UTARA'),
('72', 'SULAWESI TENGAH'),
('73', 'SULAWESI SELATAN'),
('74', 'SULAWESI TENGGARA'),
('75', 'GORONTALO'),
('76', 'SULAWESI BARAT'),
('81', 'MALUKU'),
('82', 'MALUKU UTARA'),
('91', 'PAPUA BARAT'),
('94', 'PAPUA');

-- --------------------------------------------------------

--
-- Table structure for table `regencies`
--

CREATE TABLE `regencies` (
  `id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `regencies`
--

INSERT INTO `regencies` (`id`, `province_id`, `name`) VALUES
('1101', '11', 'KABUPATEN SIMEULUE'),
('1102', '11', 'KABUPATEN ACEH SINGKIL'),
('1103', '11', 'KABUPATEN ACEH SELATAN'),
('1104', '11', 'KABUPATEN ACEH TENGGARA'),
('1105', '11', 'KABUPATEN ACEH TIMUR'),
('1106', '11', 'KABUPATEN ACEH TENGAH'),
('1107', '11', 'KABUPATEN ACEH BARAT'),
('1108', '11', 'KABUPATEN ACEH BESAR'),
('1109', '11', 'KABUPATEN PIDIE'),
('1110', '11', 'KABUPATEN BIREUEN'),
('1111', '11', 'KABUPATEN ACEH UTARA'),
('1112', '11', 'KABUPATEN ACEH BARAT DAYA'),
('1113', '11', 'KABUPATEN GAYO LUES'),
('1114', '11', 'KABUPATEN ACEH TAMIANG'),
('1115', '11', 'KABUPATEN NAGAN RAYA'),
('1116', '11', 'KABUPATEN ACEH JAYA'),
('1117', '11', 'KABUPATEN BENER MERIAH'),
('1118', '11', 'KABUPATEN PIDIE JAYA'),
('1171', '11', 'KOTA BANDA ACEH'),
('1172', '11', 'KOTA SABANG'),
('1173', '11', 'KOTA LANGSA'),
('1174', '11', 'KOTA LHOKSEUMAWE'),
('1175', '11', 'KOTA SUBULUSSALAM'),
('1201', '12', 'KABUPATEN NIAS'),
('1202', '12', 'KABUPATEN MANDAILING NATAL'),
('1203', '12', 'KABUPATEN TAPANULI SELATAN'),
('1204', '12', 'KABUPATEN TAPANULI TENGAH'),
('1205', '12', 'KABUPATEN TAPANULI UTARA'),
('1206', '12', 'KABUPATEN TOBA SAMOSIR'),
('1207', '12', 'KABUPATEN LABUHAN BATU'),
('1208', '12', 'KABUPATEN ASAHAN'),
('1209', '12', 'KABUPATEN SIMALUNGUN'),
('1210', '12', 'KABUPATEN DAIRI'),
('1211', '12', 'KABUPATEN KARO'),
('1212', '12', 'KABUPATEN DELI SERDANG'),
('1213', '12', 'KABUPATEN LANGKAT'),
('1214', '12', 'KABUPATEN NIAS SELATAN'),
('1215', '12', 'KABUPATEN HUMBANG HASUNDUTAN'),
('1216', '12', 'KABUPATEN PAKPAK BHARAT'),
('1217', '12', 'KABUPATEN SAMOSIR'),
('1218', '12', 'KABUPATEN SERDANG BEDAGAI'),
('1219', '12', 'KABUPATEN BATU BARA'),
('1220', '12', 'KABUPATEN PADANG LAWAS UTARA'),
('1221', '12', 'KABUPATEN PADANG LAWAS'),
('1222', '12', 'KABUPATEN LABUHAN BATU SELATAN'),
('1223', '12', 'KABUPATEN LABUHAN BATU UTARA'),
('1224', '12', 'KABUPATEN NIAS UTARA'),
('1225', '12', 'KABUPATEN NIAS BARAT'),
('1271', '12', 'KOTA SIBOLGA'),
('1272', '12', 'KOTA TANJUNG BALAI'),
('1273', '12', 'KOTA PEMATANG SIANTAR'),
('1274', '12', 'KOTA TEBING TINGGI'),
('1275', '12', 'KOTA MEDAN'),
('1276', '12', 'KOTA BINJAI'),
('1277', '12', 'KOTA PADANGSIDIMPUAN'),
('1278', '12', 'KOTA GUNUNGSITOLI'),
('1301', '13', 'KABUPATEN KEPULAUAN MENTAWAI'),
('1302', '13', 'KABUPATEN PESISIR SELATAN'),
('1303', '13', 'KABUPATEN SOLOK'),
('1304', '13', 'KABUPATEN SIJUNJUNG'),
('1305', '13', 'KABUPATEN TANAH DATAR'),
('1306', '13', 'KABUPATEN PADANG PARIAMAN'),
('1307', '13', 'KABUPATEN AGAM'),
('1308', '13', 'KABUPATEN LIMA PULUH KOTA'),
('1309', '13', 'KABUPATEN PASAMAN'),
('1310', '13', 'KABUPATEN SOLOK SELATAN'),
('1311', '13', 'KABUPATEN DHARMASRAYA'),
('1312', '13', 'KABUPATEN PASAMAN BARAT'),
('1371', '13', 'KOTA PADANG'),
('1372', '13', 'KOTA SOLOK'),
('1373', '13', 'KOTA SAWAH LUNTO'),
('1374', '13', 'KOTA PADANG PANJANG'),
('1375', '13', 'KOTA BUKITTINGGI'),
('1376', '13', 'KOTA PAYAKUMBUH'),
('1377', '13', 'KOTA PARIAMAN'),
('1401', '14', 'KABUPATEN KUANTAN SINGINGI'),
('1402', '14', 'KABUPATEN INDRAGIRI HULU'),
('1403', '14', 'KABUPATEN INDRAGIRI HILIR'),
('1404', '14', 'KABUPATEN PELALAWAN'),
('1405', '14', 'KABUPATEN S I A K'),
('1406', '14', 'KABUPATEN KAMPAR'),
('1407', '14', 'KABUPATEN ROKAN HULU'),
('1408', '14', 'KABUPATEN BENGKALIS'),
('1409', '14', 'KABUPATEN ROKAN HILIR'),
('1410', '14', 'KABUPATEN KEPULAUAN MERANTI'),
('1471', '14', 'KOTA PEKANBARU'),
('1473', '14', 'KOTA D U M A I'),
('1501', '15', 'KABUPATEN KERINCI'),
('1502', '15', 'KABUPATEN MERANGIN'),
('1503', '15', 'KABUPATEN SAROLANGUN'),
('1504', '15', 'KABUPATEN BATANG HARI'),
('1505', '15', 'KABUPATEN MUARO JAMBI'),
('1506', '15', 'KABUPATEN TANJUNG JABUNG TIMUR'),
('1507', '15', 'KABUPATEN TANJUNG JABUNG BARAT'),
('1508', '15', 'KABUPATEN TEBO'),
('1509', '15', 'KABUPATEN BUNGO'),
('1571', '15', 'KOTA JAMBI'),
('1572', '15', 'KOTA SUNGAI PENUH'),
('1601', '16', 'KABUPATEN OGAN KOMERING ULU'),
('1602', '16', 'KABUPATEN OGAN KOMERING ILIR'),
('1603', '16', 'KABUPATEN MUARA ENIM'),
('1604', '16', 'KABUPATEN LAHAT'),
('1605', '16', 'KABUPATEN MUSI RAWAS'),
('1606', '16', 'KABUPATEN MUSI BANYUASIN'),
('1607', '16', 'KABUPATEN BANYU ASIN'),
('1608', '16', 'KABUPATEN OGAN KOMERING ULU SELATAN'),
('1609', '16', 'KABUPATEN OGAN KOMERING ULU TIMUR'),
('1610', '16', 'KABUPATEN OGAN ILIR'),
('1611', '16', 'KABUPATEN EMPAT LAWANG'),
('1612', '16', 'KABUPATEN PENUKAL ABAB LEMATANG ILIR'),
('1613', '16', 'KABUPATEN MUSI RAWAS UTARA'),
('1671', '16', 'KOTA PALEMBANG'),
('1672', '16', 'KOTA PRABUMULIH'),
('1673', '16', 'KOTA PAGAR ALAM'),
('1674', '16', 'KOTA LUBUKLINGGAU'),
('1701', '17', 'KABUPATEN BENGKULU SELATAN'),
('1702', '17', 'KABUPATEN REJANG LEBONG'),
('1703', '17', 'KABUPATEN BENGKULU UTARA'),
('1704', '17', 'KABUPATEN KAUR'),
('1705', '17', 'KABUPATEN SELUMA'),
('1706', '17', 'KABUPATEN MUKOMUKO'),
('1707', '17', 'KABUPATEN LEBONG'),
('1708', '17', 'KABUPATEN KEPAHIANG'),
('1709', '17', 'KABUPATEN BENGKULU TENGAH'),
('1771', '17', 'KOTA BENGKULU'),
('1801', '18', 'KABUPATEN LAMPUNG BARAT'),
('1802', '18', 'KABUPATEN TANGGAMUS'),
('1803', '18', 'KABUPATEN LAMPUNG SELATAN'),
('1804', '18', 'KABUPATEN LAMPUNG TIMUR'),
('1805', '18', 'KABUPATEN LAMPUNG TENGAH'),
('1806', '18', 'KABUPATEN LAMPUNG UTARA'),
('1807', '18', 'KABUPATEN WAY KANAN'),
('1808', '18', 'KABUPATEN TULANGBAWANG'),
('1809', '18', 'KABUPATEN PESAWARAN'),
('1810', '18', 'KABUPATEN PRINGSEWU'),
('1811', '18', 'KABUPATEN MESUJI'),
('1812', '18', 'KABUPATEN TULANG BAWANG BARAT'),
('1813', '18', 'KABUPATEN PESISIR BARAT'),
('1871', '18', 'KOTA BANDAR LAMPUNG'),
('1872', '18', 'KOTA METRO'),
('1901', '19', 'KABUPATEN BANGKA'),
('1902', '19', 'KABUPATEN BELITUNG'),
('1903', '19', 'KABUPATEN BANGKA BARAT'),
('1904', '19', 'KABUPATEN BANGKA TENGAH'),
('1905', '19', 'KABUPATEN BANGKA SELATAN'),
('1906', '19', 'KABUPATEN BELITUNG TIMUR'),
('1971', '19', 'KOTA PANGKAL PINANG'),
('2101', '21', 'KABUPATEN KARIMUN'),
('2102', '21', 'KABUPATEN BINTAN'),
('2103', '21', 'KABUPATEN NATUNA'),
('2104', '21', 'KABUPATEN LINGGA'),
('2105', '21', 'KABUPATEN KEPULAUAN ANAMBAS'),
('2171', '21', 'KOTA B A T A M'),
('2172', '21', 'KOTA TANJUNG PINANG'),
('3101', '31', 'KABUPATEN KEPULAUAN SERIBU'),
('3171', '31', 'KOTA JAKARTA SELATAN'),
('3172', '31', 'KOTA JAKARTA TIMUR'),
('3173', '31', 'KOTA JAKARTA PUSAT'),
('3174', '31', 'KOTA JAKARTA BARAT'),
('3175', '31', 'KOTA JAKARTA UTARA'),
('3201', '32', 'KABUPATEN BOGOR'),
('3202', '32', 'KABUPATEN SUKABUMI'),
('3203', '32', 'KABUPATEN CIANJUR'),
('3204', '32', 'KABUPATEN BANDUNG'),
('3205', '32', 'KABUPATEN GARUT'),
('3206', '32', 'KABUPATEN TASIKMALAYA'),
('3207', '32', 'KABUPATEN CIAMIS'),
('3208', '32', 'KABUPATEN KUNINGAN'),
('3209', '32', 'KABUPATEN CIREBON'),
('3210', '32', 'KABUPATEN MAJALENGKA'),
('3211', '32', 'KABUPATEN SUMEDANG'),
('3212', '32', 'KABUPATEN INDRAMAYU'),
('3213', '32', 'KABUPATEN SUBANG'),
('3214', '32', 'KABUPATEN PURWAKARTA'),
('3215', '32', 'KABUPATEN KARAWANG'),
('3216', '32', 'KABUPATEN BEKASI'),
('3217', '32', 'KABUPATEN BANDUNG BARAT'),
('3218', '32', 'KABUPATEN PANGANDARAN'),
('3271', '32', 'KOTA BOGOR'),
('3272', '32', 'KOTA SUKABUMI'),
('3273', '32', 'KOTA BANDUNG'),
('3274', '32', 'KOTA CIREBON'),
('3275', '32', 'KOTA BEKASI'),
('3276', '32', 'KOTA DEPOK'),
('3277', '32', 'KOTA CIMAHI'),
('3278', '32', 'KOTA TASIKMALAYA'),
('3279', '32', 'KOTA BANJAR'),
('3301', '33', 'KABUPATEN CILACAP'),
('3302', '33', 'KABUPATEN BANYUMAS'),
('3303', '33', 'KABUPATEN PURBALINGGA'),
('3304', '33', 'KABUPATEN BANJARNEGARA'),
('3305', '33', 'KABUPATEN KEBUMEN'),
('3306', '33', 'KABUPATEN PURWOREJO'),
('3307', '33', 'KABUPATEN WONOSOBO'),
('3308', '33', 'KABUPATEN MAGELANG'),
('3309', '33', 'KABUPATEN BOYOLALI'),
('3310', '33', 'KABUPATEN KLATEN'),
('3311', '33', 'KABUPATEN SUKOHARJO'),
('3312', '33', 'KABUPATEN WONOGIRI'),
('3313', '33', 'KABUPATEN KARANGANYAR'),
('3314', '33', 'KABUPATEN SRAGEN'),
('3315', '33', 'KABUPATEN GROBOGAN'),
('3316', '33', 'KABUPATEN BLORA'),
('3317', '33', 'KABUPATEN REMBANG'),
('3318', '33', 'KABUPATEN PATI'),
('3319', '33', 'KABUPATEN KUDUS'),
('3320', '33', 'KABUPATEN JEPARA'),
('3321', '33', 'KABUPATEN DEMAK'),
('3322', '33', 'KABUPATEN SEMARANG'),
('3323', '33', 'KABUPATEN TEMANGGUNG'),
('3324', '33', 'KABUPATEN KENDAL'),
('3325', '33', 'KABUPATEN BATANG'),
('3326', '33', 'KABUPATEN PEKALONGAN'),
('3327', '33', 'KABUPATEN PEMALANG'),
('3328', '33', 'KABUPATEN TEGAL'),
('3329', '33', 'KABUPATEN BREBES'),
('3371', '33', 'KOTA MAGELANG'),
('3372', '33', 'KOTA SURAKARTA'),
('3373', '33', 'KOTA SALATIGA'),
('3374', '33', 'KOTA SEMARANG'),
('3375', '33', 'KOTA PEKALONGAN'),
('3376', '33', 'KOTA TEGAL'),
('3401', '34', 'KABUPATEN KULON PROGO'),
('3402', '34', 'KABUPATEN BANTUL'),
('3403', '34', 'KABUPATEN GUNUNG KIDUL'),
('3404', '34', 'KABUPATEN SLEMAN'),
('3471', '34', 'KOTA YOGYAKARTA'),
('3501', '35', 'KABUPATEN PACITAN'),
('3502', '35', 'KABUPATEN PONOROGO'),
('3503', '35', 'KABUPATEN TRENGGALEK'),
('3504', '35', 'KABUPATEN TULUNGAGUNG'),
('3505', '35', 'KABUPATEN BLITAR'),
('3506', '35', 'KABUPATEN KEDIRI'),
('3507', '35', 'KABUPATEN MALANG'),
('3508', '35', 'KABUPATEN LUMAJANG'),
('3509', '35', 'KABUPATEN JEMBER'),
('3510', '35', 'KABUPATEN BANYUWANGI'),
('3511', '35', 'KABUPATEN BONDOWOSO'),
('3512', '35', 'KABUPATEN SITUBONDO'),
('3513', '35', 'KABUPATEN PROBOLINGGO'),
('3514', '35', 'KABUPATEN PASURUAN'),
('3515', '35', 'KABUPATEN SIDOARJO'),
('3516', '35', 'KABUPATEN MOJOKERTO'),
('3517', '35', 'KABUPATEN JOMBANG'),
('3518', '35', 'KABUPATEN NGANJUK'),
('3519', '35', 'KABUPATEN MADIUN'),
('3520', '35', 'KABUPATEN MAGETAN'),
('3521', '35', 'KABUPATEN NGAWI'),
('3522', '35', 'KABUPATEN BOJONEGORO'),
('3523', '35', 'KABUPATEN TUBAN'),
('3524', '35', 'KABUPATEN LAMONGAN'),
('3525', '35', 'KABUPATEN GRESIK'),
('3526', '35', 'KABUPATEN BANGKALAN'),
('3527', '35', 'KABUPATEN SAMPANG'),
('3528', '35', 'KABUPATEN PAMEKASAN'),
('3529', '35', 'KABUPATEN SUMENEP'),
('3571', '35', 'KOTA KEDIRI'),
('3572', '35', 'KOTA BLITAR'),
('3573', '35', 'KOTA MALANG'),
('3574', '35', 'KOTA PROBOLINGGO'),
('3575', '35', 'KOTA PASURUAN'),
('3576', '35', 'KOTA MOJOKERTO'),
('3577', '35', 'KOTA MADIUN'),
('3578', '35', 'KOTA SURABAYA'),
('3579', '35', 'KOTA BATU'),
('3601', '36', 'KABUPATEN PANDEGLANG'),
('3602', '36', 'KABUPATEN LEBAK'),
('3603', '36', 'KABUPATEN TANGERANG'),
('3604', '36', 'KABUPATEN SERANG'),
('3671', '36', 'KOTA TANGERANG'),
('3672', '36', 'KOTA CILEGON'),
('3673', '36', 'KOTA SERANG'),
('3674', '36', 'KOTA TANGERANG SELATAN'),
('5101', '51', 'KABUPATEN JEMBRANA'),
('5102', '51', 'KABUPATEN TABANAN'),
('5103', '51', 'KABUPATEN BADUNG'),
('5104', '51', 'KABUPATEN GIANYAR'),
('5105', '51', 'KABUPATEN KLUNGKUNG'),
('5106', '51', 'KABUPATEN BANGLI'),
('5107', '51', 'KABUPATEN KARANG ASEM'),
('5108', '51', 'KABUPATEN BULELENG'),
('5171', '51', 'KOTA DENPASAR'),
('5201', '52', 'KABUPATEN LOMBOK BARAT'),
('5202', '52', 'KABUPATEN LOMBOK TENGAH'),
('5203', '52', 'KABUPATEN LOMBOK TIMUR'),
('5204', '52', 'KABUPATEN SUMBAWA'),
('5205', '52', 'KABUPATEN DOMPU'),
('5206', '52', 'KABUPATEN BIMA'),
('5207', '52', 'KABUPATEN SUMBAWA BARAT'),
('5208', '52', 'KABUPATEN LOMBOK UTARA'),
('5271', '52', 'KOTA MATARAM'),
('5272', '52', 'KOTA BIMA'),
('5301', '53', 'KABUPATEN SUMBA BARAT'),
('5302', '53', 'KABUPATEN SUMBA TIMUR'),
('5303', '53', 'KABUPATEN KUPANG'),
('5304', '53', 'KABUPATEN TIMOR TENGAH SELATAN'),
('5305', '53', 'KABUPATEN TIMOR TENGAH UTARA'),
('5306', '53', 'KABUPATEN BELU'),
('5307', '53', 'KABUPATEN ALOR'),
('5308', '53', 'KABUPATEN LEMBATA'),
('5309', '53', 'KABUPATEN FLORES TIMUR'),
('5310', '53', 'KABUPATEN SIKKA'),
('5311', '53', 'KABUPATEN ENDE'),
('5312', '53', 'KABUPATEN NGADA'),
('5313', '53', 'KABUPATEN MANGGARAI'),
('5314', '53', 'KABUPATEN ROTE NDAO'),
('5315', '53', 'KABUPATEN MANGGARAI BARAT'),
('5316', '53', 'KABUPATEN SUMBA TENGAH'),
('5317', '53', 'KABUPATEN SUMBA BARAT DAYA'),
('5318', '53', 'KABUPATEN NAGEKEO'),
('5319', '53', 'KABUPATEN MANGGARAI TIMUR'),
('5320', '53', 'KABUPATEN SABU RAIJUA'),
('5321', '53', 'KABUPATEN MALAKA'),
('5371', '53', 'KOTA KUPANG'),
('6101', '61', 'KABUPATEN SAMBAS'),
('6102', '61', 'KABUPATEN BENGKAYANG'),
('6103', '61', 'KABUPATEN LANDAK'),
('6104', '61', 'KABUPATEN MEMPAWAH'),
('6105', '61', 'KABUPATEN SANGGAU'),
('6106', '61', 'KABUPATEN KETAPANG'),
('6107', '61', 'KABUPATEN SINTANG'),
('6108', '61', 'KABUPATEN KAPUAS HULU'),
('6109', '61', 'KABUPATEN SEKADAU'),
('6110', '61', 'KABUPATEN MELAWI'),
('6111', '61', 'KABUPATEN KAYONG UTARA'),
('6112', '61', 'KABUPATEN KUBU RAYA'),
('6171', '61', 'KOTA PONTIANAK'),
('6172', '61', 'KOTA SINGKAWANG'),
('6201', '62', 'KABUPATEN KOTAWARINGIN BARAT'),
('6202', '62', 'KABUPATEN KOTAWARINGIN TIMUR'),
('6203', '62', 'KABUPATEN KAPUAS'),
('6204', '62', 'KABUPATEN BARITO SELATAN'),
('6205', '62', 'KABUPATEN BARITO UTARA'),
('6206', '62', 'KABUPATEN SUKAMARA'),
('6207', '62', 'KABUPATEN LAMANDAU'),
('6208', '62', 'KABUPATEN SERUYAN'),
('6209', '62', 'KABUPATEN KATINGAN'),
('6210', '62', 'KABUPATEN PULANG PISAU'),
('6211', '62', 'KABUPATEN GUNUNG MAS'),
('6212', '62', 'KABUPATEN BARITO TIMUR'),
('6213', '62', 'KABUPATEN MURUNG RAYA'),
('6271', '62', 'KOTA PALANGKA RAYA'),
('6301', '63', 'KABUPATEN TANAH LAUT'),
('6302', '63', 'KABUPATEN KOTA BARU'),
('6303', '63', 'KABUPATEN BANJAR'),
('6304', '63', 'KABUPATEN BARITO KUALA'),
('6305', '63', 'KABUPATEN TAPIN'),
('6306', '63', 'KABUPATEN HULU SUNGAI SELATAN'),
('6307', '63', 'KABUPATEN HULU SUNGAI TENGAH'),
('6308', '63', 'KABUPATEN HULU SUNGAI UTARA'),
('6309', '63', 'KABUPATEN TABALONG'),
('6310', '63', 'KABUPATEN TANAH BUMBU'),
('6311', '63', 'KABUPATEN BALANGAN'),
('6371', '63', 'KOTA BANJARMASIN'),
('6372', '63', 'KOTA BANJAR BARU'),
('6401', '64', 'KABUPATEN PASER'),
('6402', '64', 'KABUPATEN KUTAI BARAT'),
('6403', '64', 'KABUPATEN KUTAI KARTANEGARA'),
('6404', '64', 'KABUPATEN KUTAI TIMUR'),
('6405', '64', 'KABUPATEN BERAU'),
('6409', '64', 'KABUPATEN PENAJAM PASER UTARA'),
('6411', '64', 'KABUPATEN MAHAKAM HULU'),
('6471', '64', 'KOTA BALIKPAPAN'),
('6472', '64', 'KOTA SAMARINDA'),
('6474', '64', 'KOTA BONTANG'),
('6501', '65', 'KABUPATEN MALINAU'),
('6502', '65', 'KABUPATEN BULUNGAN'),
('6503', '65', 'KABUPATEN TANA TIDUNG'),
('6504', '65', 'KABUPATEN NUNUKAN'),
('6571', '65', 'KOTA TARAKAN'),
('7101', '71', 'KABUPATEN BOLAANG MONGONDOW'),
('7102', '71', 'KABUPATEN MINAHASA'),
('7103', '71', 'KABUPATEN KEPULAUAN SANGIHE'),
('7104', '71', 'KABUPATEN KEPULAUAN TALAUD'),
('7105', '71', 'KABUPATEN MINAHASA SELATAN'),
('7106', '71', 'KABUPATEN MINAHASA UTARA'),
('7107', '71', 'KABUPATEN BOLAANG MONGONDOW UTARA'),
('7108', '71', 'KABUPATEN SIAU TAGULANDANG BIARO'),
('7109', '71', 'KABUPATEN MINAHASA TENGGARA'),
('7110', '71', 'KABUPATEN BOLAANG MONGONDOW SELATAN'),
('7111', '71', 'KABUPATEN BOLAANG MONGONDOW TIMUR'),
('7171', '71', 'KOTA MANADO'),
('7172', '71', 'KOTA BITUNG'),
('7173', '71', 'KOTA TOMOHON'),
('7174', '71', 'KOTA KOTAMOBAGU'),
('7201', '72', 'KABUPATEN BANGGAI KEPULAUAN'),
('7202', '72', 'KABUPATEN BANGGAI'),
('7203', '72', 'KABUPATEN MOROWALI'),
('7204', '72', 'KABUPATEN POSO'),
('7205', '72', 'KABUPATEN DONGGALA'),
('7206', '72', 'KABUPATEN TOLI-TOLI'),
('7207', '72', 'KABUPATEN BUOL'),
('7208', '72', 'KABUPATEN PARIGI MOUTONG'),
('7209', '72', 'KABUPATEN TOJO UNA-UNA'),
('7210', '72', 'KABUPATEN SIGI'),
('7211', '72', 'KABUPATEN BANGGAI LAUT'),
('7212', '72', 'KABUPATEN MOROWALI UTARA'),
('7271', '72', 'KOTA PALU'),
('7301', '73', 'KABUPATEN KEPULAUAN SELAYAR'),
('7302', '73', 'KABUPATEN BULUKUMBA'),
('7303', '73', 'KABUPATEN BANTAENG'),
('7304', '73', 'KABUPATEN JENEPONTO'),
('7305', '73', 'KABUPATEN TAKALAR'),
('7306', '73', 'KABUPATEN GOWA'),
('7307', '73', 'KABUPATEN SINJAI'),
('7308', '73', 'KABUPATEN MAROS'),
('7309', '73', 'KABUPATEN PANGKAJENE DAN KEPULAUAN'),
('7310', '73', 'KABUPATEN BARRU'),
('7311', '73', 'KABUPATEN BONE'),
('7312', '73', 'KABUPATEN SOPPENG'),
('7313', '73', 'KABUPATEN WAJO'),
('7314', '73', 'KABUPATEN SIDENRENG RAPPANG'),
('7315', '73', 'KABUPATEN PINRANG'),
('7316', '73', 'KABUPATEN ENREKANG'),
('7317', '73', 'KABUPATEN LUWU'),
('7318', '73', 'KABUPATEN TANA TORAJA'),
('7322', '73', 'KABUPATEN LUWU UTARA'),
('7325', '73', 'KABUPATEN LUWU TIMUR'),
('7326', '73', 'KABUPATEN TORAJA UTARA'),
('7371', '73', 'KOTA MAKASSAR'),
('7372', '73', 'KOTA PAREPARE'),
('7373', '73', 'KOTA PALOPO'),
('7401', '74', 'KABUPATEN BUTON'),
('7402', '74', 'KABUPATEN MUNA'),
('7403', '74', 'KABUPATEN KONAWE'),
('7404', '74', 'KABUPATEN KOLAKA'),
('7405', '74', 'KABUPATEN KONAWE SELATAN'),
('7406', '74', 'KABUPATEN BOMBANA'),
('7407', '74', 'KABUPATEN WAKATOBI'),
('7408', '74', 'KABUPATEN KOLAKA UTARA'),
('7409', '74', 'KABUPATEN BUTON UTARA'),
('7410', '74', 'KABUPATEN KONAWE UTARA'),
('7411', '74', 'KABUPATEN KOLAKA TIMUR'),
('7412', '74', 'KABUPATEN KONAWE KEPULAUAN'),
('7413', '74', 'KABUPATEN MUNA BARAT'),
('7414', '74', 'KABUPATEN BUTON TENGAH'),
('7415', '74', 'KABUPATEN BUTON SELATAN'),
('7471', '74', 'KOTA KENDARI'),
('7472', '74', 'KOTA BAUBAU'),
('7501', '75', 'KABUPATEN BOALEMO'),
('7502', '75', 'KABUPATEN GORONTALO'),
('7503', '75', 'KABUPATEN POHUWATO'),
('7504', '75', 'KABUPATEN BONE BOLANGO'),
('7505', '75', 'KABUPATEN GORONTALO UTARA'),
('7571', '75', 'KOTA GORONTALO'),
('7601', '76', 'KABUPATEN MAJENE'),
('7602', '76', 'KABUPATEN POLEWALI MANDAR'),
('7603', '76', 'KABUPATEN MAMASA'),
('7604', '76', 'KABUPATEN MAMUJU'),
('7605', '76', 'KABUPATEN MAMUJU UTARA'),
('7606', '76', 'KABUPATEN MAMUJU TENGAH'),
('8101', '81', 'KABUPATEN MALUKU TENGGARA BARAT'),
('8102', '81', 'KABUPATEN MALUKU TENGGARA'),
('8103', '81', 'KABUPATEN MALUKU TENGAH'),
('8104', '81', 'KABUPATEN BURU'),
('8105', '81', 'KABUPATEN KEPULAUAN ARU'),
('8106', '81', 'KABUPATEN SERAM BAGIAN BARAT'),
('8107', '81', 'KABUPATEN SERAM BAGIAN TIMUR'),
('8108', '81', 'KABUPATEN MALUKU BARAT DAYA'),
('8109', '81', 'KABUPATEN BURU SELATAN'),
('8171', '81', 'KOTA AMBON'),
('8172', '81', 'KOTA TUAL'),
('8201', '82', 'KABUPATEN HALMAHERA BARAT'),
('8202', '82', 'KABUPATEN HALMAHERA TENGAH'),
('8203', '82', 'KABUPATEN KEPULAUAN SULA'),
('8204', '82', 'KABUPATEN HALMAHERA SELATAN'),
('8205', '82', 'KABUPATEN HALMAHERA UTARA'),
('8206', '82', 'KABUPATEN HALMAHERA TIMUR'),
('8207', '82', 'KABUPATEN PULAU MOROTAI'),
('8208', '82', 'KABUPATEN PULAU TALIABU'),
('8271', '82', 'KOTA TERNATE'),
('8272', '82', 'KOTA TIDORE KEPULAUAN'),
('9101', '91', 'KABUPATEN FAKFAK'),
('9102', '91', 'KABUPATEN KAIMANA'),
('9103', '91', 'KABUPATEN TELUK WONDAMA'),
('9104', '91', 'KABUPATEN TELUK BINTUNI'),
('9105', '91', 'KABUPATEN MANOKWARI'),
('9106', '91', 'KABUPATEN SORONG SELATAN'),
('9107', '91', 'KABUPATEN SORONG'),
('9108', '91', 'KABUPATEN RAJA AMPAT'),
('9109', '91', 'KABUPATEN TAMBRAUW'),
('9110', '91', 'KABUPATEN MAYBRAT'),
('9111', '91', 'KABUPATEN MANOKWARI SELATAN'),
('9112', '91', 'KABUPATEN PEGUNUNGAN ARFAK'),
('9171', '91', 'KOTA SORONG'),
('9401', '94', 'KABUPATEN MERAUKE'),
('9402', '94', 'KABUPATEN JAYAWIJAYA'),
('9403', '94', 'KABUPATEN JAYAPURA'),
('9404', '94', 'KABUPATEN NABIRE'),
('9408', '94', 'KABUPATEN KEPULAUAN YAPEN'),
('9409', '94', 'KABUPATEN BIAK NUMFOR'),
('9410', '94', 'KABUPATEN PANIAI'),
('9411', '94', 'KABUPATEN PUNCAK JAYA'),
('9412', '94', 'KABUPATEN MIMIKA'),
('9413', '94', 'KABUPATEN BOVEN DIGOEL'),
('9414', '94', 'KABUPATEN MAPPI'),
('9415', '94', 'KABUPATEN ASMAT'),
('9416', '94', 'KABUPATEN YAHUKIMO'),
('9417', '94', 'KABUPATEN PEGUNUNGAN BINTANG'),
('9418', '94', 'KABUPATEN TOLIKARA'),
('9419', '94', 'KABUPATEN SARMI'),
('9420', '94', 'KABUPATEN KEEROM'),
('9426', '94', 'KABUPATEN WAROPEN'),
('9427', '94', 'KABUPATEN SUPIORI'),
('9428', '94', 'KABUPATEN MAMBERAMO RAYA'),
('9429', '94', 'KABUPATEN NDUGA'),
('9430', '94', 'KABUPATEN LANNY JAYA'),
('9431', '94', 'KABUPATEN MAMBERAMO TENGAH'),
('9432', '94', 'KABUPATEN YALIMO'),
('9433', '94', 'KABUPATEN PUNCAK'),
('9434', '94', 'KABUPATEN DOGIYAI'),
('9435', '94', 'KABUPATEN INTAN JAYA'),
('9436', '94', 'KABUPATEN DEIYAI'),
('9471', '94', 'KOTA JAYAPURA');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `photo`, `gender`, `tanggal_lahir`, `province_id`, `city_id`, `email`, `email_verified_at`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kurniadi Ahmad Wijaya', '0812212112', '452d424504fa0503810106318a6d00bd.jpg', 'Laki-Laki', '2021-04-08', NULL, NULL, 'kurniadiahmadwijaya@gmail.com', '2021-04-30 22:03:57', 0, '$2y$10$FXcjWsLM9Z88WwD77O6LW.hPAR6h2swkjbM2r7Wq57A/hIuI14TC2', NULL, '2021-04-30 22:03:42', '2021-04-30 23:01:06'),
(18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maximuxporter5@gmail.com', '2021-04-21 02:35:14', 0, '$2y$10$qKUenVEwrUm09IJEw6eUzuKXY5C0ZgvUXvzN46RWHrzCqJq659PRi', NULL, '2021-04-21 02:34:48', '2021-04-21 02:35:14'),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ricky123@gmail.com', NULL, 0, '$2y$10$dVVOQfSGZ.OyVGNgbGFQh.Gp9Phivq4k3HXchnfgEAbeaUCMGlL/y', '857462', '2021-04-21 04:47:24', '2021-04-21 04:47:24'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tes123@gmail.com', NULL, 0, '$2y$10$PO6UVF45UwHGQ37Vm5TcEODnt69O2g8gmlAnE/rc9bsJmIBG/T9xe', '848146', '2021-04-21 05:50:07', '2021-04-21 05:50:07'),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lalala@gmail.com', NULL, 0, '$2y$10$Kxz14kH/GzOny5VquEzQI.9uKeZhuNr0nZkHqifIdb.sjgMR3TQJm', '273299', '2021-04-21 05:53:45', '2021-04-21 05:53:45'),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alexanderlexify67@gmail.com', '2021-04-21 07:00:58', 0, '$2y$10$TVg3s8MR/zZEvPXJgWQ4tOooR5NVzMRYpJhqED7.ShrZ0D6VTYfcq', NULL, '2021-04-21 07:00:31', '2021-04-21 07:00:58'),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rickyrgg24@gmail.com', NULL, 0, '$2y$10$.2MCXk.YnkbXPuzoVz2LQuEo59.qHWIr7ljA10nReEbtAYm4lVYdG', '773204', '2021-04-24 01:04:37', '2021-04-24 01:04:37'),
(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'berlandoricky@gmail.com', NULL, 0, '$2y$10$GZ7U8cRDA5PmXdnn801nY.fpxTPhd4iqyaGEyLAK6HPaP69H.RY92', '895163', '2021-04-25 16:51:31', '2021-04-25 16:51:31'),
(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lalala1234@gmail.com', NULL, 0, '$2y$10$B0I2sTTTUeZrgXyYimR6VOpOp8KeZCojcjlHv626MgIye5PGIPEMm', '499456', '2021-04-27 02:23:49', '2021-04-27 02:23:49'),
(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bellaacalistaa@gmail.com', NULL, 1, '$2y$10$l1Y945es8.6dCfQONiTMguSpEA6Qx2iykOnUxpu5l3slHOUcR4uSm', '387869', '2021-05-11 13:21:43', '2021-05-11 13:21:43'),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'calistabellaa03@gmail.com', NULL, 1, '$2y$10$Q4uEMgFA/3okZLy9RH.TMe.rpqJL1/3zPYbBqTLV6hyDHmN7na8Xa', '502625', '2021-05-11 14:50:06', '2021-05-11 14:50:06'),
(65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'systemduta@gmail.com', '2021-06-02 08:15:31', 1, '$2y$10$5VHQkKPauYp9jq6MyrMXD./S65awOHcX4Ca4ho0iIQc4BGKN.11DO', NULL, '2021-05-25 07:34:38', '2021-06-02 08:15:31'),
(66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'schoolmyrobotic@gmail.com', '2021-06-02 08:10:41', 1, '$2y$10$9jwpLeOsv7aCUVTycD0w.u5kd2DQGzKMT8Z2GDhR7zbfjJY5wmIe6', NULL, '2021-06-01 09:46:13', '2021-06-02 08:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_transaction` int(11) NOT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_merchants`
--
ALTER TABLE `category_merchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchants_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regencies`
--
ALTER TABLE `regencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_merchants`
--
ALTER TABLE `category_merchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
