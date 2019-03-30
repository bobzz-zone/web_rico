-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2018 at 08:50 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cicool`
--

-- --------------------------------------------------------

--
-- Table structure for table `aauth_groups`
--

CREATE TABLE IF NOT EXISTS `aauth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `aauth_groups`
--

INSERT INTO `aauth_groups` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Superadmin Group'),
(2, 'Public', 'Public Group'),
(3, 'Default', 'Default Access Group'),
(4, 'Member', 'Member Access Group');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_group_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_group_to_group` (
  `group_id` int(11) unsigned NOT NULL,
  `subgroup_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_login_attempts`
--

CREATE TABLE IF NOT EXISTS `aauth_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(39) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perms`
--

CREATE TABLE IF NOT EXISTS `aauth_perms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `aauth_perms`
--

INSERT INTO `aauth_perms` (`id`, `name`, `definition`) VALUES
(1, 'menu_dashboard', NULL),
(2, 'menu_crud_builder', NULL),
(3, 'menu_api_builder', NULL),
(4, 'menu_page_builder', NULL),
(5, 'menu_form_builder', NULL),
(6, 'menu_menu', NULL),
(7, 'menu_auth', NULL),
(8, 'menu_user', NULL),
(9, 'menu_group', NULL),
(10, 'menu_access', NULL),
(11, 'menu_permission', NULL),
(12, 'menu_api_documentation', NULL),
(13, 'menu_web_documentation', NULL),
(14, 'menu_settings', NULL),
(15, 'user_list', NULL),
(16, 'user_update_status', NULL),
(17, 'user_export', NULL),
(18, 'user_add', NULL),
(19, 'user_update', NULL),
(20, 'user_update_profile', NULL),
(21, 'user_update_password', NULL),
(22, 'user_profile', NULL),
(23, 'user_view', NULL),
(24, 'user_delete', NULL),
(25, 'blog_list', NULL),
(26, 'blog_export', NULL),
(27, 'blog_add', NULL),
(28, 'blog_update', NULL),
(29, 'blog_view', NULL),
(30, 'blog_delete', NULL),
(31, 'form_list', NULL),
(32, 'form_export', NULL),
(33, 'form_add', NULL),
(34, 'form_update', NULL),
(35, 'form_view', NULL),
(36, 'form_manage', NULL),
(37, 'form_delete', NULL),
(38, 'crud_list', NULL),
(39, 'crud_export', NULL),
(40, 'crud_add', NULL),
(41, 'crud_update', NULL),
(42, 'crud_view', NULL),
(43, 'crud_delete', NULL),
(44, 'rest_list', NULL),
(45, 'rest_export', NULL),
(46, 'rest_add', NULL),
(47, 'rest_update', NULL),
(48, 'rest_view', NULL),
(49, 'rest_delete', NULL),
(50, 'group_list', NULL),
(51, 'group_export', NULL),
(52, 'group_add', NULL),
(53, 'group_update', NULL),
(54, 'group_view', NULL),
(55, 'group_delete', NULL),
(56, 'permission_list', NULL),
(57, 'permission_export', NULL),
(58, 'permission_add', NULL),
(59, 'permission_update', NULL),
(60, 'permission_view', NULL),
(61, 'permission_delete', NULL),
(62, 'access_list', NULL),
(63, 'access_add', NULL),
(64, 'access_update', NULL),
(65, 'menu_list', NULL),
(66, 'menu_add', NULL),
(67, 'menu_update', NULL),
(68, 'menu_delete', NULL),
(69, 'menu_save_ordering', NULL),
(70, 'menu_type_add', NULL),
(71, 'page_list', NULL),
(72, 'page_export', NULL),
(73, 'page_add', NULL),
(74, 'page_update', NULL),
(75, 'page_view', NULL),
(76, 'page_delete', NULL),
(77, 'setting', NULL),
(78, 'setting_update', NULL),
(79, 'dashboard', NULL),
(80, 'extension_list', NULL),
(81, 'extension_activate', NULL),
(82, 'extension_deactivate', NULL),
(83, 'm_kategori_add', ''),
(84, 'm_kategori_update', ''),
(85, 'm_kategori_view', ''),
(86, 'm_kategori_delete', ''),
(87, 'm_kategori_list', ''),
(88, 'm_barang_add', ''),
(89, 'm_barang_update', ''),
(90, 'm_barang_view', ''),
(91, 'm_barang_delete', ''),
(92, 'm_barang_list', ''),
(93, 'm_agama_add', ''),
(94, 'm_agama_update', ''),
(95, 'm_agama_view', ''),
(96, 'm_agama_delete', ''),
(97, 'm_agama_list', ''),
(98, 'm_bed_add', ''),
(99, 'm_bed_update', ''),
(100, 'm_bed_view', ''),
(101, 'm_bed_delete', ''),
(102, 'm_bed_list', ''),
(103, 'm_artikel_add', ''),
(104, 'm_artikel_update', ''),
(105, 'm_artikel_view', ''),
(106, 'm_artikel_delete', ''),
(107, 'm_artikel_list', ''),
(108, 'm_cara_bayar_add', ''),
(109, 'm_cara_bayar_update', ''),
(110, 'm_cara_bayar_view', ''),
(111, 'm_cara_bayar_delete', ''),
(112, 'm_cara_bayar_list', ''),
(113, 'm_dokter_add', ''),
(114, 'm_dokter_update', ''),
(115, 'm_dokter_view', ''),
(116, 'm_dokter_delete', ''),
(117, 'm_dokter_list', ''),
(118, 'm_jenis_layanan_add', ''),
(119, 'm_jenis_layanan_update', ''),
(120, 'm_jenis_layanan_view', ''),
(121, 'm_jenis_layanan_delete', ''),
(122, 'm_jenis_layanan_list', ''),
(123, 'm_kelas_add', ''),
(124, 'm_kelas_update', ''),
(125, 'm_kelas_view', ''),
(126, 'm_kelas_delete', ''),
(127, 'm_kelas_list', ''),
(133, 'lokasi_kelas_add', ''),
(134, 'lokasi_kelas_update', ''),
(135, 'lokasi_kelas_view', ''),
(136, 'lokasi_kelas_delete', ''),
(137, 'lokasi_kelas_list', ''),
(138, 'm_poli_add', ''),
(139, 'm_poli_update', ''),
(140, 'm_poli_view', ''),
(141, 'm_poli_delete', ''),
(142, 'm_poli_list', ''),
(143, 'm_universitas_add', ''),
(144, 'm_universitas_update', ''),
(145, 'm_universitas_view', ''),
(146, 'm_universitas_delete', ''),
(147, 'm_universitas_list', ''),
(148, 'm_status_pernikahan_add', ''),
(149, 'm_status_pernikahan_update', ''),
(150, 'm_status_pernikahan_view', ''),
(151, 'm_status_pernikahan_delete', ''),
(152, 'm_status_pernikahan_list', ''),
(153, 'pasien_add', ''),
(154, 'pasien_update', ''),
(155, 'pasien_view', ''),
(156, 'pasien_delete', ''),
(157, 'pasien_list', ''),
(158, 'pengguna_add', ''),
(159, 'pengguna_update', ''),
(160, 'pengguna_view', ''),
(161, 'pengguna_delete', ''),
(162, 'pengguna_list', ''),
(163, 'rekam_medis_add', ''),
(164, 'rekam_medis_update', ''),
(165, 'rekam_medis_view', ''),
(166, 'rekam_medis_delete', ''),
(167, 'rekam_medis_list', ''),
(168, 'antrian_add', ''),
(169, 'antrian_update', ''),
(170, 'antrian_view', ''),
(171, 'antrian_delete', ''),
(172, 'antrian_list', '');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_perm_to_group` (
  `perm_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_user`
--

CREATE TABLE IF NOT EXISTS `aauth_perm_to_user` (
  `perm_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_pms`
--

CREATE TABLE IF NOT EXISTS `aauth_pms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) unsigned NOT NULL,
  `receiver_id` int(11) unsigned NOT NULL,
  `title` varchar(225) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) DEFAULT NULL,
  `pm_deleted_receiver` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user`
--

CREATE TABLE IF NOT EXISTS `aauth_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_users`
--

CREATE TABLE IF NOT EXISTS `aauth_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `oauth_uid` text,
  `oauth_provider` varchar(100) DEFAULT NULL,
  `pass` varchar(64) NOT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `avatar` text NOT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `top_secret` varchar(16) DEFAULT NULL,
  `ip_address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `aauth_users`
--

INSERT INTO `aauth_users` (`id`, `email`, `oauth_uid`, `oauth_provider`, `pass`, `username`, `full_name`, `avatar`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `top_secret`, `ip_address`) VALUES
(1, 'admin@mail.com', NULL, NULL, 'ec225039f1cb0c48ad528709e8e0184991e637d96db175f094b6b2037ec1a3c2', 'admin', 'admin', '', 0, '2018-07-05 18:50:52', '2018-07-05 18:50:52', '2018-07-05 18:50:30', NULL, NULL, NULL, NULL, NULL, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_user_to_group` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_user_to_group`
--

INSERT INTO `aauth_user_to_group` (`user_id`, `group_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_variables`
--

CREATE TABLE IF NOT EXISTS `aauth_user_variables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE IF NOT EXISTS `antrian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_registrasi` varchar(10) NOT NULL,
  `no_rekam_medis` varchar(10) NOT NULL,
  `id_jenis_layanan` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_hari` int(11) NOT NULL,
  `nomor_urut` int(11) NOT NULL,
  `perkiraan_jam` time DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 menunggu, 1 sudah dipanggil',
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id`, `no_registrasi`, `no_rekam_medis`, `id_jenis_layanan`, `id_pengguna`, `id_poli`, `id_dokter`, `id_pasien`, `id_hari`, `nomor_urut`, `perkiraan_jam`, `tanggal`, `date_add`, `status`, `deleted`) VALUES
(1, '', '', 1, 1, 1, 1, 1, 1, 1, '00:00:00', NULL, '2018-06-20 16:29:15', 1, 1),
(2, '', '', 1, 1, 1, 1, 1, 1, 2, '00:00:00', NULL, '2018-06-20 16:29:15', 0, 1),
(3, '', '', 1, 1, 1, 1, 1, 1, 3, '00:00:00', NULL, '2018-06-20 16:29:15', 0, 1),
(4, '', '', 1, 1, 1, 1, 1, 1, 3, '00:00:00', NULL, '2018-06-22 02:08:28', 0, 1),
(5, '9990', '1234', 1, 1, 0, 1, 1, 7, 1, '07:30:00', '2018-07-01', '2018-06-27 00:30:49', 0, 1),
(6, '3073', '1234', 0, 1, 1, 1, 1, 7, 1, '07:30:00', '2018-07-01', '2018-06-27 00:32:09', 0, 1),
(7, '7501', '1234', 0, 1, 1, 1, 1, 7, 2, '07:40:00', '2018-07-01', '2018-06-27 00:32:39', 0, 1),
(8, '4645', '1234', 0, 1, 1, 1, 1, 7, 3, '07:50:00', '2018-07-01', '2018-06-27 00:32:49', 0, 1),
(9, '6614', '1234', 0, 1, 1, 1, 1, 6, 1, '07:30:00', '2018-06-30', '2018-06-27 01:36:18', 0, 1),
(10, '6785', '1234', 0, 1, 2, 1, 1, 6, 1, '07:30:00', '2018-06-30', '2018-06-27 01:36:58', 0, 1),
(11, '9202', '4567', 0, 13, 1, 1, 2, 4, 1, '00:00:07', '2018-06-28', '2018-06-28 05:00:00', 0, 1),
(12, '1698', '4563', 0, 13, 1, 2, 3, 2, 1, '00:00:07', '2018-07-03', '2018-06-28 05:22:25', 0, 1),
(13, '4584', '4563', 0, 13, 1, 1, 3, 1, 1, '00:00:07', '2018-07-02', '2018-06-28 07:10:21', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE IF NOT EXISTS `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(2, 1, 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', 1, 1, 0, NULL, 1529630931),
(3, 2, 'gko884g88ww04c84ckogooc44o0ow4wcgsscscko', 1, 1, 0, NULL, 1529633885),
(4, 3, 'gc08w8ck40wsgoco4g4soo8cwc0owok4c4ogk0gg', 1, 1, 0, NULL, 1529640786),
(5, 4, '0k0g8wsocgc8w4gc4sow0k4oks44ks0okoo0ow8s', 1, 1, 0, NULL, 1529642294),
(6, 5, '048cok44wk04wgos84k08w4gcggws4400co0g0s8', 1, 1, 0, NULL, 1529647463),
(7, 6, 'cksgksg00k4sso0ooo00swcws0s0ckw8g88ggkkc', 1, 1, 0, NULL, 1529649206),
(8, 7, 'wwws4ooowc0gcs8soow0gkgoks8s8k80kk4kwo4c', 1, 1, 0, NULL, 1529649663),
(9, 8, '4ggosso08gskkccsc8k4sos0ock08o8400csgkos', 1, 1, 0, NULL, 1529649772),
(10, 9, 'c84c8w488k80og8w800o8sckow80s80ks004ck00', 1, 1, 0, NULL, 1529650126),
(11, 10, 'cw4ok44cwkgg8ssoog8gcc0ckcskg8gc0ow0c804', 1, 1, 0, NULL, 1529651430),
(12, 11, '8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0', 1, 1, 0, NULL, 1529652447),
(13, 12, '0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4', 1, 1, 0, NULL, 1529653639),
(14, 13, '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', 1, 1, 0, NULL, 1529656322),
(15, 14, '4gco48ccoook8o4ow4k8k488c84ks0cc4go444co', 1, 1, 0, NULL, 1529658394);

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE IF NOT EXISTS `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `api_token` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  `response_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=584 ;

--
-- Dumping data for table `api_logs`
--

INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(1, 'api/key/generate', 'get', '{"Host":"localhost","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko\\/20100101 Firefox\\/59.0","Accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","Accept-Language":"en-US,en;q=0.5","Accept-Encoding":"gzip, deflate","Cookie":"_ga=GA1.1.829020762.1522055350; __utma=111872281.829020762.1522055350.1527052518.1527151131.39; __utmz=111872281.1525235751.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); G_ENABLED_IDPS=google; __tawkuuid=e::localhost::q33ED3vvmkSNBVG573G9607ywMGB2qLklO3gbp7NtIi+Sb1IvisqTI+U1s8SCglW::2","Connection":"keep-alive","Upgrade-Insecure-Requests":"1","Cache-Control":"max-age=0"}', '', '', '127.0.0.1', 1529514788, 0.114742, '0', 403, '{"status":false,"error":"Invalid API key "}'),
(2, 'api/key', 'put', '{"cache-control":"no-cache","Postman-Token":"dd7cf5aa-aede-4303-821a-1c79c0ad3a6f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","accept-encoding":"gzip, deflate","content-length":"0","Connection":"keep-alive"}', '', '', '::1', 1529514876, 0.192259, '0', 403, '{"status":false,"error":"Invalid API key "}'),
(3, 'api/key', 'put', '{"cache-control":"no-cache","Postman-Token":"38630c1f-706d-45fe-a526-a17edbe1aa4e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=3usf3hobmliekgc3hcba4ksj0nvmdo3r","accept-encoding":"gzip, deflate","content-length":"0","Connection":"keep-alive"}', '', '', '::1', 1529514922, 0.29886, '1', 201, '{"status":true,"key":"ocws8ss088g8cc0k08wscgwo0gswkoo0gswk44w8"}'),
(4, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"422979d7-3cbc-49e8-ad70-47af33064039","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=3usf3hobmliekgc3hcba4ksj0nvmdo3r","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------319896194350732907742577","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630551, 0.311332, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(5, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"07bc1968-7818-4292-b586-dc481cf3e82e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------749916683844919167925117","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630591, 0.167573, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(6, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"1e796e3f-0303-47eb-9c26-22894acc511a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------267751362729486461755746","content-length":"398","Connection":"keep-alive","username":"0498349729384732","password":"12345","is_bpjs":"1"}', '', '', '::1', 1529630600, 0.117641, '1', 200, '{"code":0,"id":0,"email":"0498349729384732","password":"12345","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(7, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"ef9c84a8-39b5-49d0-88c1-30152517dd0b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------414538596921176039656157","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630607, 0.178026, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(8, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"7c59c2a4-cf8f-438b-ad49-0a4c48ed8ddd","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------001113926053938664651216","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630704, 0.103907, '1', 200, '{"code":0,"id":0,"username":"alipxsulistio@gmail.com","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(9, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"298456c6-3d1f-40ef-887f-bcbd7283a697","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------999080479908892867662054","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630739, 0.169095, '1', 0, ''),
(10, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"0448900c-03c5-43e3-8c8b-b583d7921e76","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------394933372596565239813488","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630764, NULL, '1', 0, ''),
(11, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"f8a8b931-7b73-4051-ace8-301fb7fb804d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------543711891126716803733802","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630811, NULL, '1', 0, ''),
(12, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"d1af5709-2aac-475a-9573-2b6d2c7c005c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------006249367873271608795115","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630840, 0.221948, '1', 200, '{"code":0,"id":0,"email":"alipxsulistio@gmail.com","password":"1234","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(13, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"50b117d1-d834-425a-9aa0-11456e1e3446","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------013697932278650366228818","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630915, NULL, '1', 0, ''),
(14, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"9160e143-05d0-49a4-9226-0fa55808617b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fdest5ahva62sng8994sp1kivjo0fi5k","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------504501984696149990466014","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630931, NULL, '1', 0, ''),
(15, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"db43a6e6-afc7-4bbb-bb03-2b73e090df69","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fdest5ahva62sng8994sp1kivjo0fi5k","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------001438360382289195759177","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630983, 0.236402, '1', 200, '{"code":1,"id":"1","username":"alipxsulistio@gmail.com","password":"1234","user_data":{"id":"1","nama":"Alip","telpon":"082141019485","use_bpjs":"1","no_bpjs":"0498349729384732","email":"alipxsulistio@gmail.com","level":"1","no_ktp":"","alamat":"","id_kelurahan":"1","id_kecamatan":"1","id_kota":"1","id_provinsi":"1","id_negara":"1","image":"default.png","date_add":"2018-06-20 23:41:10","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","message":"Login Success"}'),
(16, 'api/artikel', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"577176b7-ceb2-4a82-9de9-f45582974fdd","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fdest5ahva62sng8994sp1kivjo0fi5k","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631631, 0.267032, '1', 0, ''),
(17, 'api/artikel', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"1085ce3b-279c-4aaf-8e30-2d7475e2f1a0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nk2ssva198sgc27vdmvsb24bor550uue","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631661, 0.412644, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(18, 'api/artikel', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"ba772e63-7279-4c9d-b9db-443cec75af93","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nk2ssva198sgc27vdmvsb24bor550uue","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631716, 0.331417, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(19, 'api/artikel', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"dc13cb55-ab54-4a90-baf1-144e58b70f98","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nk2ssva198sgc27vdmvsb24bor550uue","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631745, 0.0992289, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(20, 'api/darurat', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"2671edd4-6708-4648-9ba4-1be21041f173","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nk2ssva198sgc27vdmvsb24bor550uue","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------517080496705972363909590","content-length":"158","Connection":"keep-alive","id":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631955, 0.312933, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(21, 'api/darurat', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"eedb8b4a-86a4-4cff-b4fe-2453ef42458e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=e3sffua8oiefqirvhrkejhdiasg6190r","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------187046954922493133281666","content-length":"158","Connection":"keep-alive","id":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529631987, 0.254092, '1', 200, '{"code":1,"message":"Generating Ambulance data","result":{"id_atribut":"1","nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}}'),
(22, 'api/master/jenis_layanan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"8970bc54-965b-4f1e-b068-d47624af795d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=e3sffua8oiefqirvhrkejhdiasg6190r","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632137, 0.328071, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(23, 'api/master/jenis_layanan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"03218e05-ce24-4546-81ac-04655cb4839c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=e3sffua8oiefqirvhrkejhdiasg6190r","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632212, 0.120052, '1', 200, '{"code":1,"message":"List Data","result":[{"id":"1","nama":"IGD","deskripsi":"IGD","date_add":"2018-06-22 08:50:09","deleted":"1"},{"id":"2","nama":"Rawat Inap","deskripsi":"","date_add":"2018-06-20 23:32:41","deleted":"1"},{"id":"3","nama":"Rawat Jalan","deskripsi":"","date_add":"2018-06-20 23:32:48","deleted":"1"},{"id":"4","nama":"Medical Checkup","deskripsi":"","date_add":"2018-06-20 23:33:03","deleted":"1"}]}'),
(24, 'api/master/poli/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a15c6a09-d04d-40f6-b5c1-fce7ef00546c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=e3sffua8oiefqirvhrkejhdiasg6190r","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632256, 0.0720611, '1', 0, ''),
(25, 'api/master/poli/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"0cb856e9-7dbb-4ce9-92a8-39ba03ab1227","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632278, 0.107063, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"umum","id_lokasi":"1","gambar":"default.png","date_add":"2018-06-20 23:23:26","deleted":"1"},{"id":"2","nama_poli":"lansia","id_lokasi":"1","gambar":"default.png","date_add":"2018-06-20 23:24:45","deleted":"1"}]}'),
(26, 'api/master/dokter/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"4ca7a2f0-a61c-4d6b-b683-159a92ded055","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632306, 0.157975, '1', 0, ''),
(27, 'api/master/dokter/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"3b10df33-6327-4d6f-aef1-a164642d510f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632323, 0.103145, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"","date_add":"2018-06-20 23:26:51","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"","date_add":"2018-06-20 23:26:57","deleted":"1"}]}'),
(28, 'api/profile/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"b98fe379-e9da-48bf-8c38-624e5e792ab5","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632380, 0.209448, '1', 0, ''),
(29, 'api/profile/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"3acd914d-a7a5-4f94-a1f4-45fb5145bd0d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632458, 0.197945, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"1","nama":"Alip","telpon":"082141019485","use_bpjs":"1","no_bpjs":"0498349729384732","email":"alipxsulistio@gmail.com","password":"7110eda4d09e062aa5e4a390b0a572ac0d2c0220","level":"1","no_ktp":"","alamat":"","id_kelurahan":"1","id_kecamatan":"1","id_kota":"1","id_provinsi":"1","id_negara":"1","image":"default.png","date_add":"2018-06-20 23:41:10","status_login":"1","deleted":"1","kode_aktivasi":"","fb_id":null,"g_id":null,"last_view_notif":null,"token":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","token_fcm":"","device_id":""}}'),
(30, 'api/lainnya/bantuan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"698a592e-696a-4362-9f5c-ab717dca5da8","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632523, 0.141255, '1', 0, ''),
(31, 'api/lainnya/bantuan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"5f904568-7c48-4f13-b0b1-6cb9619b9efc","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=70qjtbpjf83m80idk1s414qqbcr9j0k1","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632601, 0.18897, '1', 200, '{"code":1,"message":"bantuan","result":{"id":"1","judul":"Bantuan","isi":"Isi","date_add":"2018-06-22 08:56:38","deleted":"1"}}'),
(32, 'api/lainnya/informasi_kelas_biaya/index', 'get', '{"cache-control":"no-cache","Postman-Token":"a053baee-b92b-411b-bafa-3141be074eef","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', '', '', '::1', 1529632656, 0.24068, '0', 403, '{"status":false,"error":"Invalid API key "}'),
(33, 'api/lainnya/informasi_kelas_biaya/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"bb7b165b-65b3-4ca2-8d2c-611579fbfca6","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632662, 0.19408, '1', 200, '{"code":0,"message":"Empty data","result":[]}'),
(34, 'api/lainnya/informasi_kelas_biaya/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"dabbc047-76ef-4654-9c2b-ff2402cca234","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632700, 0.096072, '1', 200, '{"code":1,"message":"list biaya","result":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","deleted":"1"},{"id":"3","nama":"kelas 3","rate_biaya":"240000","date_add":"2018-06-20 23:37:29","deleted":"1"}]}'),
(35, 'api/antrian/pantau/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"8d78cdc2-5965-4310-a99d-cc3d05e5ab68","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632759, 0.177627, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(36, 'api/antrian/pantau/index', 'get', '{"id_poli":"1","id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a8092607-0215-46e7-a242-3770d85a737b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632812, 0.328603, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(37, 'api/antrian/pantau/index', 'get', '{"id_poli":"1","id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c660284c-31be-41e8-82bc-0649ed78585e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632901, 0.190837, '1', 200, '{"code":1,"message":"Last antrian","result":{"id":"2","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"2","date_add":"2018-06-20 23:29:15","status":"0"}}'),
(38, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c229a0e8-ab6f-4c4d-9ebc-07c365fec8b1","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=34ktcl2sfulkfmajvf8ies01ilm1lfng","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632956, 0.615128, '1', 0, ''),
(39, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"57b2eddf-4493-46dc-a20d-6902d1bb8730","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fe5hl0qe4h7ekpgc9qgtl9l9inipb6nc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529632974, 0.184313, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(40, 'api/antrian/notifikasi_keterlambatan/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"78c9e82b-2ec4-4e2d-895e-899f2fb2edda","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fe5hl0qe4h7ekpgc9qgtl9l9inipb6nc","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------952403180523327166513740","content-length":"183","Connection":"keep-alive","notifikasi":"Dokter A terlambat"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529633044, 0.145958, '1', 0, ''),
(41, 'api/antrian/notifikasi_keterlambatan/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"32930890-9077-4462-811a-08f96d187001","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fe5hl0qe4h7ekpgc9qgtl9l9inipb6nc","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------514896094204050703603418","content-length":"183","Connection":"keep-alive","notifikasi":"Dokter A terlambat"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529633054, 0.276579, '1', 200, '{"code":1,"message":"ok inserted","data":{"notifikasi":"Dokter A terlambat"}}'),
(42, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"ef95c70b-e383-4cb5-9bba-cb1981d99c94","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fe5hl0qe4h7ekpgc9qgtl9l9inipb6nc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529633058, 0.178553, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","add_by":"0"}}'),
(43, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"3cf2195f-62b5-4592-bf76-47206a7c51b1","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=fe5hl0qe4h7ekpgc9qgtl9l9inipb6nc","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------053764412799202951701044","content-length":"379","Connection":"keep-alive","poli":"1","jenis_layanan":"1","dokter":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529633289, 0.142854, '1', 0, ''),
(44, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"cb2dec3c-736f-41d9-854a-88baaf3b9aa0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=7pamhdr7svqs6tqkqatvgkn5691eatq7","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------899112713084818556969717","content-length":"379","Connection":"keep-alive","poli":"1","jenis_layanan":"1","dokter":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529633308, 0.240698, '1', 200, '{"code":1,"message":"Success, queuing","result":{"poli":"1","jenis_layanan":"1","dokter":"1"}}'),
(45, 'api/auth/signup', 'post', '{"cache-control":"no-cache","Postman-Token":"62411354-9aab-4ffa-a1c8-5891ff3db96b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=7pamhdr7svqs6tqkqatvgkn5691eatq7","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------651983041782891266170037","content-length":"971","Connection":"keep-alive","nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"asdf","no_ktp":"04387439423","alamat":"jl Klayatan 2"}', '', '', '::1', 1529633809, 0.179317, '1', 0, ''),
(46, 'api/auth/signup', 'post', '{"cache-control":"no-cache","Postman-Token":"622e2f94-7b9e-4ce6-8f90-beb77e1ed631","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=plh21epjqej0alcdklu9m2p0enivojjk","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------870972607471267765968787","content-length":"971","Connection":"keep-alive","nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"asdf","no_ktp":"04387439423","alamat":"jl Klayatan 2"}', '', '', '::1', 1529633885, 7.57731, '1', 0, ''),
(47, 'api/auth/signup', 'post', '{"cache-control":"no-cache","Postman-Token":"2331dec1-7c7b-4ea3-9d1e-97cd3f922e6e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=plh21epjqej0alcdklu9m2p0enivojjk","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------375645098167310204900766","content-length":"971","Connection":"keep-alive","nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"asdf","no_ktp":"04387439423","alamat":"jl Klayatan 2"}', '', '', '::1', 1529633954, 0.101459, '1', 201, '{"code":0,"message":"no_bpjs is already used, please enter new no_bpjs","result":{"nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"3da541559918a808c2402bba5012f6c60b27661c","no_ktp":"04387439423","alamat":"jl Klayatan 2"}}'),
(48, 'api/auth/signup', 'post', '{"cache-control":"no-cache","Postman-Token":"011cc7d2-4d91-4dbf-8da0-7032abb96f02","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=plh21epjqej0alcdklu9m2p0enivojjk","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------966105174081614598619542","content-length":"971","Connection":"keep-alive","nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"asdf","no_ktp":"04387439423","alamat":"jl Klayatan 2"}', '', '', '::1', 1529634023, 0.211666, '1', 201, '{"code":0,"message":"email is already used, please enter new email","result":{"nama":"Alip Sulistio","telpon":"081212121","use_bpjs":"0","no_bpjs":"","email":"alipxsulistio@mail.com","password":"3da541559918a808c2402bba5012f6c60b27661c","no_ktp":"04387439423","alamat":"jl Klayatan 2"}}'),
(49, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"32","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"01991","nama":"joe"}', '', '', '192.168.0.2', 1529640786, NULL, '1', 0, ''),
(50, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"32","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"01991","nama":"joe"}', '', '', '192.168.0.2', 1529642293, 0.642623, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address","result":{"telpon":"","nama":"joe","level":1,"image":"no_image.png","deleted":"3","key":"0k0g8wsocgc8w4gc4sow0k4oks44ks0okoo0ow8s","kode_aktivasi":"913374","telpon_message":"Please verify your phone number"}}'),
(51, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"32","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"10192","nama":"don"}', '', '', '192.168.0.2', 1529647463, 0.504457, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"don","level":1,"image":"no_image.png","deleted":"3","key":"048cok44wk04wgos84k08w4gcggws4400co0g0s8","kode_aktivasi":"239867"}}'),
(52, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"83722","nama":"haha"}', '', '', '192.168.0.2', 1529649206, 0.674267, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"haha","level":1,"image":"no_image.png","deleted":"3","key":"cksgksg00k4sso0ooo00swcws0s0ckw8g88ggkkc","kode_aktivasi":"743467"}}'),
(53, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"35","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"6363636","nama":"dono"}', '', '', '192.168.0.2', 1529649662, 0.470847, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"dono","level":1,"image":"no_image.png","deleted":"3","key":"wwws4ooowc0gcs8soow0gkgoks8s8k80kk4kwo4c","kode_aktivasi":"500663"}}'),
(54, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"525255","nama":"joko"}', '', '', '192.168.0.2', 1529649772, 0.486168, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"joko","level":1,"image":"no_image.png","deleted":"3","key":"4ggosso08gskkccsc8k4sos0ock08o8400csgkos","kode_aktivasi":"209959"}}'),
(55, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"35","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"13732627","nama":"eko"}', '', '', '192.168.0.2', 1529650126, 0.533146, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"eko","level":1,"image":"no_image.png","deleted":"3","key":"c84c8w488k80og8w800o8sckow80s80ks004ck00","kode_aktivasi":"487149"}}'),
(56, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"487149"}', '', '', '192.168.0.2', 1529650143, 0.186562, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"9","nama":"eko","telpon":"","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 13:48:46","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"c84c8w488k80og8w800o8sckow80s80ks004ck00"}'),
(57, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651142, 0.416444, '1', 0, ''),
(58, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651185, 0.134053, '1', 0, ''),
(59, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651249, 0.142465, '1', 200, '{"code":0,"id":0,"email":"eko","password":"a","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(60, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"1663662","nama":"edi"}', '', '', '192.168.0.2', 1529651429, 0.357638, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"edi","level":1,"image":"no_image.png","deleted":"3","key":"cw4ok44cwkgg8ssoog8gcc0ckcskg8gc0ow0c804","kode_aktivasi":"257868"}}'),
(61, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"257868"}', '', '', '192.168.0.2', 1529651444, 0.24794, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"10","nama":"edi","telpon":"","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:10:30","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"cw4ok44cwkgg8ssoog8gcc0ckcskg8gc0ow0c804"}'),
(62, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"edi","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651465, 0.119295, '1', 200, '{"code":0,"id":0,"email":"edi","password":"a","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(63, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"36","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"636252526","nama":"eko"}', '', '', '192.168.0.2', 1529652447, 0.362563, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"636252526","nama":"eko","level":1,"image":"no_image.png","deleted":"3","key":"8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0","kode_aktivasi":"636486"}}'),
(64, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"636486"}', '', '', '192.168.0.2', 1529652460, 0.298018, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"11","nama":"eko","telpon":"636252526","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:27:27","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0"}'),
(65, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529652481, 0.0926878, '1', 200, '{"code":0,"id":0,"email":"eko","password":"a","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(66, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"30","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"123","nama":"edi"}', '', '', '192.168.0.2', 1529653639, 0.879358, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"123","nama":"edi","level":1,"image":"no_image.png","deleted":"3","key":"0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4","kode_aktivasi":"451639"}}'),
(67, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"451639"}', '', '', '192.168.0.2', 1529653654, 0.162238, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"12","nama":"edi","telpon":"123","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:47:19","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4"}'),
(68, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"123","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529653670, 0.672859, '1', 200, '{"code":0,"id":0,"email":"123","password":"a","user_data":"[]","message":"Oops, we couldn''t find your account"}'),
(69, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"43","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","no_bpjs":"0001","use_bpjs":"1","nama":"edi"}', '', '', '192.168.0.2', 1529656322, 0.372489, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"no_bpjs":"0001","use_bpjs":"1","nama":"edi","level":1,"image":"no_image.png","deleted":"3","key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","kode_aktivasi":"741542"}}'),
(70, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"741542"}', '', '', '192.168.0.2', 1529656347, 0.274928, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8"}'),
(71, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529656369, 0.213528, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}'),
(72, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529656578, 0.282895, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}'),
(73, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"41","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"123","use_bpjs":"0","nama":"eko"}', '', '', '192.168.0.2', 1529658373, 0.202544, '1', 201, '{"code":0,"message":"telpon is already used, please enter new telpon","result":{"password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","telpon":"123","use_bpjs":"0","nama":"eko"}}'),
(74, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"44","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","email":"a@a.a","password":"a","use_bpjs":"0","nama":"eko"}', '', '', '192.168.0.2', 1529658394, 5.77589, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"email":"a@a.a","use_bpjs":"0","nama":"eko","level":1,"image":"no_image.png","deleted":"3","key":"4gco48ccoook8o4ow4k8k488c84ks0cc4go444co","kode_aktivasi":"232473"}}'),
(75, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"232473"}', '', '', '192.168.0.2', 1529658416, 0.227808, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"14","nama":"eko","telpon":"","use_bpjs":"0","no_bpjs":"0","email":"a@a.a","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 16:06:34","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"4gco48ccoook8o4ow4k8k488c84ks0cc4go444co"}'),
(76, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"37","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"a@a.a","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529658435, 0.260858, '1', 200, '{"code":1,"id":"14","username":"a@a.a","password":"a","user_data":{"id":"14","nama":"eko","telpon":"","use_bpjs":"0","no_bpjs":"0","email":"a@a.a","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 16:06:34","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"4gco48ccoook8o4ow4k8k488c84ks0cc4go444co","message":"Login Success"}'),
(77, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529659501, 0.650054, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(78, 'api/auth/signin', 'post', '{"AUTH-KEY":"0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529660254, 0.235431, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}'),
(79, 'api/master/poli/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"ee22a219-8335-4cd2-87df-bdd2ad1d90e2","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=g8e3oljmp6hfo5gjd3gadgeci25m817s","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985230, 0.155379, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"umum","estimasi_waktu":"0","id_lokasi":"1","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"lansia","estimasi_waktu":"0","id_lokasi":"1","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(80, 'api/master/dokter/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a072e3bd-310d-4abb-9cf8-51a9a3349264","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=hqrpn6a17ff6j2qmeccrumdibng7ato0","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985238, 0.109262, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","id_poli":"0","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","id_poli":"0","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(81, 'api/lainnya/informasi_kelas_biaya/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"1b518fba-fe00-4525-9ba6-5283ea98bbeb","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=hqrpn6a17ff6j2qmeccrumdibng7ato0","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985250, 0.0993071, '1', 200, '{"code":1,"message":"list biaya","result":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"},{"id":"3","nama":"kelas 3","rate_biaya":"240000","date_add":"2018-06-20 23:37:29","add_by":"0","deleted":"1"}]}'),
(82, 'api/artikel', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"b3b6bd56-5259-4476-87c0-b1708141daf1","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=hqrpn6a17ff6j2qmeccrumdibng7ato0","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985266, 0.19021, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(83, 'api/pasien/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c4c80169-1f3c-4b32-9cda-5dd2915aa028","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=hqrpn6a17ff6j2qmeccrumdibng7ato0","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985513, 0.222172, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1"}]}'),
(84, 'api/lainnya/bantuan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d7eeffa5-ea0e-4223-938a-c2daf404576d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=hqrpn6a17ff6j2qmeccrumdibng7ato0","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529985913, 0.238902, '1', 200, '{"code":1,"message":"bantuan","result":{"id":"1","judul":"Bantuan","isi":"Isi","date_add":"2018-06-22 08:56:38","deleted":"1"}}'),
(85, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"3650d113-c7ad-47a5-8726-cb29a641cbdf","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=8lsfdemd0i8mpkhjlhkjpu7mbig3dnjc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986058, 0.170474, '1', 0, ''),
(86, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f619ada7-9137-4ce0-a4bd-d90acd9aea38","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=8lsfdemd0i8mpkhjlhkjpu7mbig3dnjc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986087, 0.191648, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(87, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"e5d0f968-0b29-4c8c-87d7-0afb5a03a4fa","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=8lsfdemd0i8mpkhjlhkjpu7mbig3dnjc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986393, 0.221164, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(88, 'api/konfigurasi/index', 'get', '{"name":"nomor_ambulance","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"23a53343-4e8c-47e3-94b3-e982cac58ff9","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=u6p3devnll32h7l0sqkl0974spvv2dlb","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986600, 0.195719, '1', 200, '{"code":1,"message":"Generating konfigurasi info","result":{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}}'),
(89, 'api/konfigurasi/index', 'get', '{"name":"nomor_ambulance","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"8d6978c0-b02d-47b6-91fe-f34b2190c66f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=u6p3devnll32h7l0sqkl0974spvv2dlb","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986734, 0.185099, '1', 400, '{"code":0,"message":"cannot process request","result":[]}'),
(90, 'api/konfigurasi/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a94290f5-1add-40d4-89a7-8f676f45aafb","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986742, 0.127107, '1', 200, '{"code":1,"message":"Generating konfigurasi info","result":{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}}'),
(91, 'api/konfigurasi/index/multiple', 'get', '{"multiple":null,"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c24ee84c-5605-438c-81bc-605b88e16155","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986778, 0.105762, '1', 200, '{"code":1,"message":"Generating konfigurasi info","result":{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}}'),
(92, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"7855fd67-08bd-454e-bcaf-542358d2f2f8","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986789, NULL, '1', 0, ''),
(93, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"042b5eef-ea21-4ed2-8911-f037971459ab","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529986822, NULL, '1', 0, ''),
(94, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"328f8dce-5dc9-4894-8778-71a66794e488","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987034, NULL, '1', 0, ''),
(95, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"960cf8a5-7b18-41ac-93a9-3273a270e4b5","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=dne7dr2pfmuus9sukjtocan7p85safsc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987076, NULL, '1', 0, ''),
(96, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"6ac2bbb3-d3b4-434a-aa43-15e48d822f6f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987166, NULL, '1', 0, ''),
(97, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"e78b590f-2dbd-4fd6-92ea-2489ee47cf6f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987187, 0.217151, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":{"dbdriver":"mysqli","compress":false,"delete_hack":true,"stricton":false,"dsn":"","username":"phpmyadmin","password":"aptikma","hostname":"localhost","database":"api_antrian","subdriver":null,"dbprefix":"","char_set":"utf8mb4","dbcollat":"utf8_general_ci","encrypt":false,"swap_pre":"","port":"","pconnect":false,"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":false,"db_debug":true,"benchmark":0,"query_count":0,"bind_marker":"?","save_queries":true,"queries":[],"query_times":[],"data_cache":[],"trans_enabled":true,"trans_strict":true,"cache_on":false,"cachedir":"","cache_autodel":false,"CACHE":null,"failover":[]}}'),
(98, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a2b4f46a-80e3-4b45-abe1-b42ec9c51569","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987234, NULL, '1', 0, ''),
(99, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"78202885-c50b-4b8d-a6a1-4d31fd514ae0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987266, NULL, '1', 0, ''),
(100, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"779dd3e9-5051-49ea-b892-8592124ee187","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987353, NULL, '1', 0, ''),
(101, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d40ca094-45d6-46a1-96cc-2cbae593c424","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ubbabtjn6i6rui6u182hosp1fslnl0j7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987385, NULL, '1', 0, ''),
(102, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f0c77ab3-7cae-4b0c-ab50-282655bda03e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987413, 0.0889459, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""},{"nama_atribut":"nomor_dokter","nilai_atribut":"495899493","komentar":"nomor darutat dokter","penjelasan":"","nama_label":""}]}'),
(103, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"0f7dbca5-a296-4b39-b897-0383bfc629bc","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987465, 0.119898, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""},{"nama_atribut":"nomor_dokter","nilai_atribut":"495899493","komentar":"nomor darutat dokter","penjelasan":"","nama_label":""}]}'),
(104, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"4b1a5a39-e094-443f-8714-56ebae7696b6","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987480, 0.102405, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""},{"nama_atribut":"nomor_dokter","nilai_atribut":"495899493","komentar":"nomor darutat dokter","penjelasan":"","nama_label":""}]}'),
(105, 'api/konfigurasi/multiple', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"7658a33e-30ad-41a9-8809-c939b0f952a6","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987484, 0.089674, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}]}'),
(106, 'api/konfigurasi/multiple', 'get', '{"id":"1,3","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"95c603d5-0641-44ef-a733-d861989b84f1","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987489, 0.15065, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""}]}'),
(107, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"4c67cf19-aad2-44ab-a1f7-8b170ee6558c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987552, 0.239273, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(108, 'api/antrian/pantau/index', 'get', '{"id_poli":"1","id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d2574dbb-e198-44ae-b372-2057066edfcb","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987573, 0.0965509, '1', 200, '{"code":1,"message":"Last antrian","result":{"id":"2","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"2","date_add":"2018-06-20 23:29:15","status":"0"}}'),
(109, 'api/antrian/pantau/index', 'get', '{"id_poli":"1","id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"0694ee3a-6801-4387-a4a3-320e81cbf256","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=q5c0u8170p36bqrdic44in249o8ibjqe","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987965, 0.173669, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(110, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f23b1e65-74de-4c05-93a6-7d3d98e8ac3f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529987975, 0.192087, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(111, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"3656adef-e04b-40db-bf77-3dcb4bac56df","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988000, 0.1057, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(112, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f7fa07be-7f5d-4666-a3b6-171454f53d9d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988038, 0.222981, '1', 0, ''),
(113, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"88d013ed-4658-45e1-807e-3f3d725e28d0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988096, 0.100692, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(114, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"39984d9c-665d-45d1-a59f-fd56877a39e3","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988120, 0.060766, '1', 0, ''),
(115, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"38c9b2ac-6818-46d9-b163-0ddf990ed716","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988144, 0.108848, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(116, 'api/antrian/pantau/index', 'get', '{"id":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"fdf8d432-5e0c-4863-8e30-16ea1d0f2d19","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988169, 0.0941851, '1', 0, ''),
(117, 'api/antrian/pantau/index', 'get', '{"id":"2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"537366be-47ef-4836-9e89-50a2870d1d72","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988198, 0.127333, '1', 200, '{"code":1,"message":"Last antrian","result":{"id":"2","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"2","date_add":"2018-06-20 23:29:15","status":"0"}}'),
(118, 'api/antrian/pantau/list', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d9e692f1-176f-4043-bdcd-98e89d2b4a64","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ejp01rja45n5nctidgcaim90pc4kldl7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529988964, 1.34071, '1', 200, '{"code":1,"message":"Last antrian","result":{"id":"2","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"2","date_add":"2018-06-20 23:29:15","status":"0"}}'),
(119, 'api/antrian/pantau/list', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d63a904a-45d1-4343-bf4e-13447cdd3a76","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=t6b2hrt8hv44ri5leert1h82e1afmraa","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529989000, 0.876147, '1', 200, '{"code":1,"message":"List antrian","result":[{"id":"2","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"2","date_add":"2018-06-20 23:29:15","status":"0"},{"id":"3","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"3","date_add":"2018-06-20 23:29:15","status":"0"},{"id":"4","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"1","nomor_urut":"3","date_add":"2018-06-22 09:08:28","status":"0"}]}'),
(120, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"67593051-be72-4c92-a66b-1e5bebf91ac4","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=t6b2hrt8hv44ri5leert1h82e1afmraa","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529989703, 0.546349, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(121, 'api/konfigurasi/multiple', 'get', '{"id":"1,2","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c3ee6bb1-2cb1-437c-9cf7-2a75d0007e49","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=m6ad5fce2pg0rs2mns8h0aed3b5up9hg","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1529989844, 0.362579, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_ambulance","nilai_atribut":"890489384","komentar":"Nomor telpon darurat ambulan","penjelasan":"","nama_label":""},{"nama_atribut":"nomor_dokter","nilai_atribut":"495899493","komentar":"nomor darutat dokter","penjelasan":"","nama_label":""}]}'),
(122, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999443, 0.612401, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(123, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999456, 0.178718, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(124, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999690, 0.137702, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(125, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999694, 0.146773, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(126, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999765, 0.294065, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(127, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999768, 0.152989, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(128, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999819, 0.152553, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(129, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999825, 0.135969, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(130, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999888, 0.149801, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(131, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999893, 0.229212, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(132, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999972, 0.140863, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(133, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1529999976, 0.101152, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(134, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000091, 0.134749, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(135, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000095, 0.111438, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(136, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000108, 0.120455, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(137, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000178, 0.157637, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(138, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000181, 0.129428, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(139, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000184, 0.126204, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(140, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000186, 0.265951, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(141, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000577, 0.174984, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(142, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000583, 0.176587, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(143, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530000583, 0.114137, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(144, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001364, 0.178774, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(145, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001367, 0.113841, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(146, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001367, 0.123765, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(147, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001435, 0.135404, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(148, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001460, 0.130015, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(149, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001460, 0.135104, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(150, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001551, 0.139367, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(151, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001553, 0.138576, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(152, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001554, 0.13009, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(153, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001624, 0.412094, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(154, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001626, 0.87634, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(155, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001627, 0.11095, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(156, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001708, 0.164369, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(157, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001713, 0.118875, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(158, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001713, 0.100742, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(159, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001782, 0.168127, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(160, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001784, 0.103079, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(161, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530001784, 0.094286, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(162, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530002331, 0.116238, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(163, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004065, 0.1291, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(164, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004204, 0.114456, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(165, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004751, 0.125403, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(166, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004751, 0.141273, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(167, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004767, 0.15358, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(168, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530004782, 0.311639, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(169, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530005971, 0.146093, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(170, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006005, 0.103124, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(171, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006006, 0.104914, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(172, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006019, 0.118758, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(173, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006021, 0.146822, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(174, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006021, 0.113021, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(175, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006022, 0.110815, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(176, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006024, 0.0944428, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(177, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006036, 0.268713, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(178, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006222, 0.206267, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(179, 'api/pasien/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d9e69d6c-f2a5-4bdd-855f-bca36074d352","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=m6ad5fce2pg0rs2mns8h0aed3b5up9hg","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530006274, 0.187952, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1"}]}'),
(180, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006292, 0.105763, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(181, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006292, 0.143158, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(182, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006332, 0.136205, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(183, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006453, 0.145634, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(184, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006453, 0.0971022, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(185, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006455, 0.102931, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(186, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006510, 0.0963821, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(187, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006513, 0.0947201, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(188, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006513, 0.100321, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(189, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006515, 0.123195, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(190, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006516, 0.084991, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(191, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006516, 0.0903451, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(192, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006518, 0.136566, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(193, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006518, 0.105181, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(194, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006519, 0.113377, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(195, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006532, 0.126667, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(196, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530006556, 0.0996189, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(197, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"1689cb4e-a91b-4a82-a07e-e9ecc8c62baa","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=f0t8bgmsjodm1hpmdhfphff3q40dtjor","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007101, 0.243525, '1', 0, ''),
(198, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"c9fdd8f1-f6f2-4ff6-ab1c-eb60b4c3e523","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=nlrqapm4aksii6mncprrrt9o4b8hhb3m","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007119, 0.190601, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1"}],"agama":{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null},"status_pernikahan":{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null},"kelas":{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}}'),
(199, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"e0e99185-2c65-4111-81f1-e383fe126f92","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=nlrqapm4aksii6mncprrrt9o4b8hhb3m","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007137, 0.267755, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1"}],"agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"},{"id":"3","nama":"kelas 3","rate_biaya":"240000","date_add":"2018-06-20 23:37:29","add_by":"0","deleted":"1"}]}'),
(200, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530007224, 15.7396, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(201, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530007244, 1.24145, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(202, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530007245, 0.531722, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(203, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530007246, 0.824553, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(204, 'api/myhelp/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530007259, 0.988723, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"0","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}],"agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"},{"id":"3","nama":"kelas 3","rate_biaya":"240000","date_add":"2018-06-20 23:37:29","add_by":"0","deleted":"1"}]}'),
(205, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"4197c55b-af19-487d-976c-aea3b9ca7e69","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=nlrqapm4aksii6mncprrrt9o4b8hhb3m","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007697, 0.630288, '1', 0, ''),
(206, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"03c311b0-f08d-42e2-9ae5-0d77fca7449e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=7hlp0vtn0nm29rf5pnp13rp8agvtqtc3","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007724, 0.0527618, '1', 0, ''),
(207, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"6f66b51b-8261-4942-8600-1de88239e0c5","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=7hlp0vtn0nm29rf5pnp13rp8agvtqtc3","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007744, 0.46351, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(208, 'api/myhelp/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a9e7dcca-9927-4ca4-9351-57eb39a7ea5c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=7hlp0vtn0nm29rf5pnp13rp8agvtqtc3","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530007780, 0.135878, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"},{"id":"3","nama":"kelas 3","rate_biaya":"240000","date_add":"2018-06-20 23:37:29","add_by":"0","deleted":"1"}]}'),
(209, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"6ea68a1f-416b-43dc-8531-f9c0f0307461","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=7hlp0vtn0nm29rf5pnp13rp8agvtqtc3","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------927077844014518608468019","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530055344, 0.193895, '1', 0, ''),
(210, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"ee045a2e-ed90-47a4-ad01-e85ca84fc6a7","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=1stklq35tjqlnvejbjmakocph49cqi0h","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------631489924069305014947967","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530055372, 0.0458119, '1', 0, ''),
(211, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f938c32f-c03d-4f10-b29d-8c49f66dfc3b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=1stklq35tjqlnvejbjmakocph49cqi0h","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------744114823068831483299055","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530055569, 0.104933, '1', 0, ''),
(212, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a4cf7558-719b-41d4-9d17-20fef8e5df44","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=1stklq35tjqlnvejbjmakocph49cqi0h","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------476050789091897317348639","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530056565, 0.66564, '1', 0, ''),
(213, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"eb0d965e-b393-4e44-a01c-b224fdcf0771","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=6blbfdqm6f0hf1b88v0ianed4itgspf8","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------248558046363635231440021","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"3"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530056584, 0.125671, '1', 0, ''),
(214, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"79fbde51-aab4-4f24-9d2b-d3f37b5909a1","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=6blbfdqm6f0hf1b88v0ianed4itgspf8","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------284364401503256607602933","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"3"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057046, 0.11829, '1', 0, ''),
(215, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"2e9f8112-f047-46c0-ac87-7bda040ffd9d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------731777614956384812079700","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"4"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057057, 0.0937829, '1', 0, '');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(216, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"124c485d-d5e2-4a4b-a101-1f343440896b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------982606198962193353799542","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"5"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057095, 0.100048, '1', 0, ''),
(217, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"85cc70ed-62be-4d3e-ad7a-8340d7ab7cea","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------208031420184920027600741","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"4"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057102, 0.0915802, '1', 0, ''),
(218, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"69027dcc-2f19-420b-9025-713c23ecdb8a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------052251910769770596612011","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"4"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057181, 0.0987389, '1', 0, ''),
(219, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"dedb7920-4f71-4d87-ab4f-cd6ebc0d8483","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------137725638692186476844569","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057192, 0.0999069, '1', 0, ''),
(220, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"69d0cccf-e87d-4fa3-8146-b53dbc905475","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------465978621791439552605614","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057264, 0.621163, '1', 0, ''),
(221, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"4d5f8a99-9b0a-4ac1-974d-8e789f4b0971","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------760668502405067541314667","content-length":"604","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057280, 0.0935071, '1', 0, ''),
(222, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"8317975f-dcb2-458b-b152-07fa17684d74","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=n15bnlham6lu4v7288732rjamuo13mlt","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------535471102129107205154732","content-length":"1051","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30","jam_akhir":"09:30"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530057781, 0.2329, '1', 0, ''),
(223, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"87bc0d14-fbda-4040-961f-b3d98dfd4c66","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=frspv9p8emp30iv3ledoqai69edb8phq","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------202462909860732467666859","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058042, 0.134308, '1', 0, ''),
(224, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"bccf193f-4220-4c6e-a2dc-198a56d16aaa","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=frspv9p8emp30iv3ledoqai69edb8phq","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------021364121469805578052323","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058094, 0.112545, '1', 0, ''),
(225, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"eacce77e-2516-4d65-bff9-b2866fd13ea9","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------294657132227804911984522","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058125, 0.0710831, '1', 0, ''),
(226, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------491668705356284255629528","cache-control":"no-cache","Postman-Token":"9080af56-08e6-4002-b644-ba95db1a7e8d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07.30.00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058162, 0.100079, '1', 0, ''),
(227, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------611826201185897354565637","cache-control":"no-cache","Postman-Token":"b254eac0-0e99-43de-af96-1c8928190723","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07-30-00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058174, 0.119127, '1', 0, ''),
(228, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------536557340030852490814100","cache-control":"no-cache","Postman-Token":"44496ba6-a609-4dde-9bfd-4b7a7384c4e0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1055","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"073000","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058180, 0.235594, '1', 0, ''),
(229, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","cache-control":"no-cache","Postman-Token":"680a4dfb-5145-4dea-b1e5-5ff58be03913","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"19","Connection":"keep-alive","jamjam":"07:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058251, 0.119506, '1', 0, ''),
(230, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------794105186392949531593093","cache-control":"no-cache","Postman-Token":"9efd37e4-2162-442a-9108-86bf199d58a0","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058301, 0.098839, '1', 0, ''),
(231, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------423420771277749640285972","cache-control":"no-cache","Postman-Token":"ef55fb5d-3233-40ea-a97c-d2f4c91cbb2f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1057","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058318, 0.0962679, '1', 0, ''),
(232, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------632452563971480600955717","cache-control":"no-cache","Postman-Token":"d75e1f06-e0e3-45e3-b88a-8321e0164775","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sd0gkumns4bur0lcao5n229p5mvptu2c","accept-encoding":"gzip, deflate","content-length":"1174","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530058586, 0.216116, '1', 0, ''),
(233, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------793213514120313202661539","cache-control":"no-cache","Postman-Token":"1bfdf970-e4b3-40d2-a26c-7af860a958ac","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=4rrkb503va4c93r0cin790qs2eqn2mst","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059410, 0.102817, '1', 200, '{"code":0,"message":"Antrian sudah penuh","result":[]}'),
(234, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------227987283196523154274794","cache-control":"no-cache","Postman-Token":"9b7c0fab-d190-4262-95f0-f36770382ae3","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sqeita1nnbv90tt3q0cb7jqc1lpngkdg","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059449, 0.154767, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"5","no_registrasi":"9990","no_rekam_medis":"1234","id_jenis_layanan":"1","id_pengguna":"1","id_poli":"0","id_dokter":"1","id_pasien":"1","id_hari":"7","id_kelas":"1","nomor_urut":"1","perkiraan_jam":"07:30:00","tanggal":"2018-07-01","date_add":"2018-06-27 07:30:49","status":"0","nama_poli":"-","lokasi":"Lantai 2A","nama_dokter":"Dokter 1"}]}'),
(235, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------251675530880932074737374","cache-control":"no-cache","Postman-Token":"21fa4452-c444-43c4-8282-f48bebffb66a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sqeita1nnbv90tt3q0cb7jqc1lpngkdg","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059529, 0.265983, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"6","no_registrasi":"3073","no_rekam_medis":"1234","id_jenis_layanan":"0","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","id_kelas":"1","nomor_urut":"1","perkiraan_jam":"07:30:00","tanggal":"2018-07-01","date_add":"2018-06-27 07:32:09","status":"0","nama_poli":"umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 1"}]}'),
(236, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------608493645096338377509360","cache-control":"no-cache","Postman-Token":"9ddd4d5b-9731-42f1-ac5e-f8d79fb76276","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sqeita1nnbv90tt3q0cb7jqc1lpngkdg","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059559, 0.453251, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"7","no_registrasi":"7501","no_rekam_medis":"1234","id_jenis_layanan":"0","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","id_kelas":"1","nomor_urut":"2","perkiraan_jam":"07:40:00","tanggal":"2018-07-01","date_add":"2018-06-27 07:32:39","status":"0","nama_poli":"Poli Umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 1"}]}'),
(237, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------297469014207667078368841","cache-control":"no-cache","Postman-Token":"1b95c1dd-be3a-4fbd-9da9-8b93d02069b5","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sqeita1nnbv90tt3q0cb7jqc1lpngkdg","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059569, 0.278959, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"8","no_registrasi":"4645","no_rekam_medis":"1234","id_jenis_layanan":"0","id_pengguna":"1","id_poli":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","id_kelas":"1","nomor_urut":"3","perkiraan_jam":"07:50:00","tanggal":"2018-07-01","date_add":"2018-06-27 07:32:49","status":"0","nama_poli":"Poli Umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 1"}]}'),
(238, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------030966145706249869741623","cache-control":"no-cache","Postman-Token":"f542a2fd-b3ae-4308-af4d-1cb377ef5424","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=sqeita1nnbv90tt3q0cb7jqc1lpngkdg","accept-encoding":"gzip, deflate","content-length":"1282","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"7","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530059858, 0.167433, '1', 200, '{"code":0,"message":"Pasien sudah terdaftar di antrian ini, pilih hari lain","result":[]}'),
(239, 'api/myhelp/form_rekam_medis', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"89ed6e06-3874-42ee-9119-91e4a8951a5c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=6dgtb8b47b20rv8eikjol395fspnir8t","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061153, 0.204452, '1', 0, ''),
(240, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"837376d0-e815-4da3-803b-498a4e231b4e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=2tef8ahsk55t1970c7kqe3qgnr4brb93","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061181, 0.0824921, '1', 0, ''),
(241, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a5e58f50-d6ea-4c98-9af4-56d04ac2ddf7","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=2tef8ahsk55t1970c7kqe3qgnr4brb93","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061217, 0.147647, '1', 0, ''),
(242, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"277eb9c4-ede9-4bee-9ba0-44ec386ba52d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=2tef8ahsk55t1970c7kqe3qgnr4brb93","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061235, 0.177212, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","no_rekam_medis":"123","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}]}'),
(243, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"f1d12f06-f6bd-41ed-9ea5-0f504fbc89cd","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=2tef8ahsk55t1970c7kqe3qgnr4brb93","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061803, 0.224712, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(244, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"87ab26df-144b-4481-9f21-67cebbb03dce","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=oojufthpfj007l4f9qico9o2hunjmgs2","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530061807, 0.147929, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","no_rekam_medis":"123","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}]}'),
(245, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"e34fe626-e7bb-4c45-917a-ef260d353d65","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=oojufthpfj007l4f9qico9o2hunjmgs2","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062419, 0.125518, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","no_rekam_medis":"123","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}],"cara_bayar":null}'),
(246, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"80a77aaa-c06a-4b70-b0e1-092375c6908a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=p2vlmjfpu9tg3nnboa59iluh11rmjfgb","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062438, 0.15325, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","no_rekam_medis":"123","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(247, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"01d4f3dc-40be-4030-8199-f5002cb625eb","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=p2vlmjfpu9tg3nnboa59iluh11rmjfgb","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062510, 0.154733, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"1","nama_lengkap":"Alip Sulistio","no_rekam_medis":"123","use_bpjs":"1","no_bpjs":"48343878374","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"1","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(248, 'api/rekam_medis/insert', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"bcb82044-1a01-456f-80d3-f3609e639607","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=p2vlmjfpu9tg3nnboa59iluh11rmjfgb","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------038292997391487688699060","content-length":"618","Connection":"keep-alive","id_pasien":"1","id_jenis_layanan":"1","no_rekam_medis":"123","id_cara_bayar":"1","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062589, 0.096482, '1', 0, ''),
(249, 'api/rekam_medis/insert', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"b0e2dbee-7cab-401a-94b5-578d4456845a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=p2vlmjfpu9tg3nnboa59iluh11rmjfgb","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------626079651359449663575730","content-length":"618","Connection":"keep-alive","id_pasien":"1","id_jenis_layanan":"1","no_rekam_medis":"123","id_cara_bayar":"1","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062890, NULL, '1', 0, ''),
(250, 'api/rekam_medis/insert', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"e5ee70e2-ea17-4ac2-90ed-6cdea63c71ed","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=l67vgj9a5olsuoktq63h96qlasmi1hve","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------054661442699748623940643","content-length":"618","Connection":"keep-alive","id_pasien":"1","id_jenis_layanan":"1","no_rekam_medis":"123","id_cara_bayar":"1","id_kelas":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530062950, 0.180048, '1', 201, '{"code":1,"message":"New comment added","result":[{"id_layanan":"1","id_pasien":"1","id_pengguna":"1","id_jenis_layanan":"1","id_kelas":"1","lokasi":"disana","id_cara_bayar":"1","no_registrasi":"6202","no_rekam_medis":"123","date_add":"2018-06-27 08:29:10","add_by":null,"deleted":"1","nama_kelas":"kelas 1","cara_bayar":"Cash","nama_lengkap":"Alip Sulistio"}]}'),
(251, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------874700020168938649429463","cache-control":"no-cache","Postman-Token":"2fb913c6-1a71-4bd0-85a9-a1affd72c6a6","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=l67vgj9a5olsuoktq63h96qlasmi1hve","accept-encoding":"gzip, deflate","content-length":"1273","Connection":"keep-alive","id_poli":"1","id_jenis_layanan":"1","id_dokter":"1","id_pasien":"1","id_hari":"6","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530063378, 0.53222, '1', 0, ''),
(252, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"multipart\\/form-data; boundary=--------------------------649938068804316147207658","cache-control":"no-cache","Postman-Token":"9c406edf-a97a-492a-bd73-dc8c76cf3b2c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=smtpvt6mg9h3p7ba0englnbg46ge5hho","accept-encoding":"gzip, deflate","content-length":"1157","Connection":"keep-alive","id_poli":"2","id_dokter":"1","id_pasien":"1","id_hari":"6","waktu_layanan":"10","kuota":"120","jam_mulai":"07:30:00","jam_akhir":"09:30:00","no_rekam_medis":"1234"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530063418, 0.199044, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"10","no_registrasi":"6785","no_rekam_medis":"1234","id_jenis_layanan":"0","id_pengguna":"1","id_poli":"2","id_dokter":"1","id_pasien":"1","id_hari":"6","nomor_urut":"1","perkiraan_jam":"07:30:00","tanggal":"2018-06-30","date_add":"2018-06-27 08:36:58","status":"0","nama_poli":"Poli THT","lokasi":"Lantai 1C","nama_dokter":"Dokter 1","nama_lengkap":"Alip Sulistio"}]}'),
(253, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"d4359569-5bb8-46a2-b6ad-11210f729cbd","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=smtpvt6mg9h3p7ba0englnbg46ge5hho","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530063713, 0.769966, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(254, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"74f053e6-70e1-4a29-9b76-a8e97387b4b7","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=r5mk35e7sll70kiphlfrrso1u02tlip7","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530063743, 0.142925, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(255, 'api/pasien/update', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"43b6e338-5af9-4099-85f8-08e8948a6ca2","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=r5mk35e7sll70kiphlfrrso1u02tlip7","accept-encoding":"gzip, deflate","content-length":"0","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530064958, 0.290953, '1', 0, ''),
(256, 'api/pasien/insert', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"28363dce-c616-4dbd-a735-7a7508fdc05f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=mf5p6cr2iqbj78ris9pouhmc1386gf8j","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------148074926623628907297706","content-length":"750","Connection":"keep-alive","nama_lengkap":"saya","tanggal_lahir":"1990-09-09","alamat":"disini saja","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530065205, 0.147815, '1', 0, ''),
(257, 'api/pasien/insert', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"b4347e0f-05af-4e95-9e5f-b57704c91672","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=mf5p6cr2iqbj78ris9pouhmc1386gf8j","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------000526378735654968023856","content-length":"750","Connection":"keep-alive","nama_lengkap":"saya","tanggal_lahir":"1990-09-09","alamat":"disini saja","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530065218, 0.194398, '1', 201, '{"code":1,"message":"Data tersimpan","result":[]}'),
(258, 'api/pasien/update', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"96eeaa5b-9721-4ea4-b3b4-1e1f84591f68","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=mf5p6cr2iqbj78ris9pouhmc1386gf8j","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------802258364636818687816928","content-length":"858","Connection":"keep-alive","nama_lengkap":"saya","tanggal_lahir":"1990-09-09","alamat":"disini aja","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"2","id_pasien":"4"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530065475, 0.253875, '1', 201, '{"code":1,"message":"Data tersimpan","result":[]}'),
(259, 'api/pasien/delete', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"299e20e4-a0a1-4750-b5ae-c0143d455184","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ql1o8i8n4iqu9blbis0u0hmqr05pf0mc","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------850393598275946681761517","content-length":"165","Connection":"keep-alive","id_pasien":"4"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530065548, 0.436897, '1', 201, '{"code":1,"message":"Data terhapus","result":[]}'),
(260, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065577, 0.225166, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(261, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065602, 0.179659, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(262, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065606, 0.160969, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(263, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065606, 0.0923998, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(264, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065746, 0.125733, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(265, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065750, 0.13563, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(266, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065750, 0.12319, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(267, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530065752, 0.145874, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(268, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530065777, 0.438739, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(269, 'api/myhelp/form_pasien', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=sdkhv8ojjaj38fcjh5qnhbf6avrrqhci","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530065864, 0.151426, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(270, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=sdkhv8ojjaj38fcjh5qnhbf6avrrqhci","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530066282, 0.153119, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(271, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066483, 0.294483, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(272, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066530, 0.140156, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(273, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066530, 0.159379, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(274, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066533, 0.0970039, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(275, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066594, 0.331454, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(276, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066599, 0.210407, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(277, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066599, 0.104201, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(278, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530066602, 0.139147, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(279, 'api/myhelp/form_pasien', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=jbaabav72o1mr83utn33o0e30430q2le","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530068585, 0.436225, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(280, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069567, 0.216889, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(281, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069573, 0.159914, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(282, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069574, 0.123995, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(283, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069578, 0.203812, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(284, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069591, 0.216763, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(285, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069603, 0.105314, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(286, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069706, 0.111958, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(287, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069708, 0.152091, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(288, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069709, 0.0966101, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(289, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069711, 0.285464, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(290, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069713, 0.129721, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(291, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069714, 0.191406, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(292, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069726, 0.211278, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(293, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069729, 0.201439, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(294, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069732, 0.153713, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(295, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069734, 0.130207, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(296, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069735, 0.212237, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(297, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069736, 0.220945, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(298, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069737, 0.160989, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(299, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069737, 0.098438, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(300, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069749, 0.201051, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(301, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069754, 0.297023, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(302, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069819, 0.21351, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(303, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069888, 0.218621, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(304, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530069894, 0.201326, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(305, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530070210, 0.214272, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(306, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530070212, 0.169396, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(307, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530070212, 0.097831, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(308, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530070217, 0.216311, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(309, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530070219, 0.086324, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(310, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530079873, 0.11514, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(311, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530079905, 0.127179, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(312, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530079992, 0.126449, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(313, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080025, 0.226742, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(314, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080029, 0.261194, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(315, 'api/pasien/insert', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"113","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","id_status_pernikahan":"1","nama_lengkap":"sukam","id_agama":"3","jenis_kelamin":"1","tanggal_lahir":"2018-06-30","alamat":"jl. alamat"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080060, 0.333113, '1', 201, '{"code":1,"message":"Data tersimpan","result":[]}'),
(316, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080175, 0.462359, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(317, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080183, 0.221293, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(318, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080236, 0.123571, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(319, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080643, 0.127528, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(320, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080672, 0.104629, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(321, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080672, 0.149978, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(322, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530080674, 0.207131, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"5","nama_lengkap":"sukam","tanggal_lahir":"2018-06-30","alamat":"jl. alamat","no_rekam_medis":"6743","use_bpjs":"0","no_bpjs":"0","jenis_kelamin":"1","id_agama":"3","id_status_pernikahan":"1","date_add":"2018-06-27 13:14:21","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(323, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530081443, 0.144369, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(324, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530081445, 0.11755, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(325, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530081445, 0.0953379, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(326, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530081446, 0.139364, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"5","nama_lengkap":"sukam","tanggal_lahir":"2018-06-30","alamat":"jl. alamat","no_rekam_medis":"6743","use_bpjs":"0","no_bpjs":"0","jenis_kelamin":"1","id_agama":"3","id_status_pernikahan":"1","date_add":"2018-06-27 13:14:21","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(327, 'api/pasien/delete', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","id_pasien":"5"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530081636, 0.218276, '1', 201, '{"code":1,"message":"Data terhapus","result":[]}'),
(328, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530082091, 0.200007, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(329, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530082103, 0.147787, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(330, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530082104, 0.19166, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(331, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530082107, 0.14199, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(332, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530082112, 0.143201, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(333, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=llv9r51g1j2skggtuhdt0idmfbuvtolv","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530083010, 0.132518, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(334, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083261, 0.15656, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(335, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083290, 0.150076, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(336, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083291, 0.148195, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(337, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083293, 0.105309, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(338, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083295, 0.150102, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(339, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083295, 0.1744, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(340, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083297, 0.13926, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(341, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083298, 0.107335, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(342, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083298, 0.26357, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(343, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083300, 0.148925, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(344, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083308, 0.13749, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(345, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083308, 0.248369, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(346, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083309, 0.153125, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(347, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083312, 0.152999, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(348, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083870, 0.155139, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(349, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083870, 0.12597, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(350, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083871, 0.16469, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(351, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083873, 0.105429, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(352, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083889, 0.170936, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(353, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083901, 0.164096, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(354, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083902, 0.203956, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(355, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083908, 0.148019, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(356, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530083910, 0.0962291, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(357, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084115, 0.119007, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(358, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084241, 0.170774, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(359, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084241, 0.119752, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(360, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084244, 0.156639, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(361, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084248, 0.258149, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(362, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084457, 0.16724, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(363, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084490, 0.228241, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(364, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084490, 0.0967231, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(365, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084491, 0.140231, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(366, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084494, 0.119327, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(367, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084540, 0.175425, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(368, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084542, 0.101186, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(369, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084542, 0.175381, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(370, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084544, 0.161192, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(371, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084800, 0.189293, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(372, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084800, 0.104583, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(373, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084802, 0.150449, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(374, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084804, 0.115295, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(375, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084870, 0.45356, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(376, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084885, 0.160924, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(377, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084885, 0.0975261, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(378, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084887, 0.163454, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(379, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084889, 0.14958, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(380, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530084980, 0.411515, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(381, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085110, 0.159558, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(382, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085111, 0.246842, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(383, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085113, 0.0845881, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(384, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085115, 0.161831, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(385, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085158, 0.214272, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(386, 'api/pasien/insert', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"132","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","id_status_pernikahan":"2","nama_lengkap":"Jim beglin","id_pasien":"3","id_agama":"3","jenis_kelamin":"1","tanggal_lahir":"2018-06-27","alamat":"jl. alamat"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085203, 0.188806, '1', 0, ''),
(387, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085398, 0.161379, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(388, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085456, 0.149671, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(389, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085457, 0.118757, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(390, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085458, 0.172752, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(391, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085459, 0.178557, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(392, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085466, 0.155221, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(393, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085466, 0.0938871, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(394, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085468, 0.143415, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(395, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085510, 0.149335, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(396, 'api/pasien/update', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"130","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","id_status_pernikahan":"2","nama_lengkap":"Jhon doe","id_pasien":"2","id_agama":"4","jenis_kelamin":"1","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085544, 0.196406, '1', 201, '{"code":1,"message":"Data tersimpan","result":[]}'),
(397, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085551, 0.152182, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(398, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085555, 0.159937, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(399, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530085940, 0.135869, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(400, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=54uh8erahe4aqa6mo4njuq7pql9acvbg","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530086193, 0.413404, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(401, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087040, 0.162696, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(402, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087044, 0.171196, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(403, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087044, 0.138123, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(404, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087045, 0.156974, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(405, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087058, 0.158153, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(406, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087064, 0.188375, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(407, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087066, 0.0931869, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(408, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087067, 0.096405, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(409, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087372, 0.157067, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(410, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087385, 0.176243, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(411, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087385, 0.192221, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(412, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087399, 0.409717, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(413, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087407, 0.155312, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(414, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087441, 0.162217, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(415, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087443, 0.097765, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(416, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087444, 0.206596, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(417, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087587, 0.160054, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(418, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087591, 0.0966702, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(419, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530087591, 0.110642, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(420, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530148771, 0.434212, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(421, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530148886, 0.104841, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(422, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530148887, 0.093709, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(423, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530148890, 0.15999, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(424, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149034, 0.153612, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(425, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149037, 0.142988, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(426, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149037, 0.151237, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(427, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149169, 0.32058, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(428, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149169, 0.109632, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(429, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149178, 0.145722, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(430, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149179, 0.155905, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(431, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149196, 0.406248, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(432, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530149197, 0.144616, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(433, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530149244, 0.152029, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(434, 'api/myhelp/form_rekam_medis', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=qh675m4mg4rjce2qbhuual5ohape9qms","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530149266, 0.146347, '1', 0, ''),
(435, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=qh675m4mg4rjce2qbhuual5ohape9qms","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530149350, 0.507987, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(436, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530150177, 0.407666, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(437, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530150178, 0.146722, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(438, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530150205, 0.423604, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(439, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530150208, 0.166227, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(440, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530150208, 0.097856, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(441, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=qh675m4mg4rjce2qbhuual5ohape9qms","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530150830, 0.158855, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(442, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152034, 0.176874, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(443, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152045, 0.1978, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(444, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152046, 0.0915821, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(445, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152253, 0.158621, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(446, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152269, 0.157405, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(447, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152269, 0.149247, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(448, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152342, 0.375074, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(449, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152342, 0.102624, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(450, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152547, 0.157154, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(451, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152549, 0.0857601, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(452, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152550, 0.105453, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(453, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152552, 0.128511, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(454, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152566, 0.408909, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(455, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152572, 0.158735, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(456, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152572, 0.0871511, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(457, 'api/rekam_medis/insert', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"77","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","no_rekam_medis":"4567","id_pasien":"2","id_kelas":"1","id_jenis_layanan":"1","id_cara_bayar":"1"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152584, 0.238346, '1', 201, '{"code":1,"message":"Data tersimpan","result":[{"id_layanan":"2","id_pasien":"2","id_pengguna":"13","id_jenis_layanan":"1","id_kelas":"1","lokasi":"disana","id_cara_bayar":"1","no_registrasi":"6882","no_rekam_medis":"4567","date_add":"2018-06-28 09:23:04","add_by":null,"deleted":"1","nama_kelas":"kelas 1","cara_bayar":"Cash","nama_lengkap":"Jhon doe"}]}'),
(458, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152591, 0.176564, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(459, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152591, 0.107964, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(460, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152592, 0.157467, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(461, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152655, 0.150808, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(462, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152792, 0.105759, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(463, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530152919, 0.129122, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(464, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=4kkth4kod3m2n57b4ukof3lnn4dhk0ns","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530152962, 0.139831, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(465, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=87raccrla70abnk4uombkca610a7oeej","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530153322, 0.499854, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(466, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530154869, 0.422507, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(467, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530154877, 0.142287, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(468, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530154888, 0.141521, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(469, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530154900, 0.211242, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(470, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530155152, 0.424139, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(471, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530155153, 0.124583, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(472, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=mi3klaqnfb2m83jr12h2nps3v3b7ionb","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530156250, 0.133258, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(473, 'api/master/poli/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=onvqie2f00q87skt00t16q13hii0unt5","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530156385, 0.139807, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(474, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=onvqie2f00q87skt00t16q13hii0unt5","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530156416, 0.304884, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(475, 'api/master/poli/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=onvqie2f00q87skt00t16q13hii0unt5","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530156722, 0.162015, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(476, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530156949, 0.166443, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(477, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530156961, 0.162382, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(478, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530156961, 0.098454, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(479, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=4v1kkc8vvd2g1edauacbef9k6chdcsbp","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530157211, 0.399588, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(480, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530157366, 0.410094, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(481, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530157369, 0.208515, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(482, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530157400, 0.171466, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(483, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530157400, 0.100523, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(484, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530157449, 0.154936, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(485, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=9ab236utmgv1e5f1j9s0jh6h2bmqag93","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530157978, 0.149567, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(486, 'api/master/poli/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=6ml5pm5il6e978513qtoe6ejd24r6l8e","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530157996, 0.153478, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(487, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=6ml5pm5il6e978513qtoe6ejd24r6l8e","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530158009, 0.148323, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(488, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=6ml5pm5il6e978513qtoe6ejd24r6l8e","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530158708, 0.411585, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(489, 'api/master/poli/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=2qbk4vn88facu2uoq2052ebakd14f6qn","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530160542, 0.448794, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(490, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=h0vag4sdeuciv6mgcag49pduju9pdpce","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530160565, 0.18428, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(491, 'api/pasien/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=h0vag4sdeuciv6mgcag49pduju9pdpce","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530160599, 0.144859, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(492, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161013, 0.152335, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(493, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161065, 0.409655, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(494, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161071, 0.152002, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(495, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161077, 0.148845, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(496, 'api/master/dokter/index', 'get', '{"id_poli":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161080, 0.110519, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(497, 'api/master/dokter/index', 'get', '{"id_poli":"1","Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=h0vag4sdeuciv6mgcag49pduju9pdpce","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530161125, 0.407245, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"20","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","waktu_pelayanan":"10","id_universitas":"0","tahun_lulus":"","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1"}]}'),
(498, 'api/master/dokter/index', 'get', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","cache-control":"no-cache","Postman-Token":"a9b04861-ce2e-47d8-a2c3-2ca69fcfe3d9","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session_pos=jjun8geugr169ucbhcaad2gea9lpa235; ci_session=ql1o8i8n4iqu9blbis0u0hmqr05pf0mc","accept-encoding":"gzip, deflate","Connection":"keep-alive"}', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '::1', 1530161840, 0.118184, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"20","id_universitas":"1","tahun_lulus":"2012","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"10","id_universitas":"1","tahun_lulus":"2008","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"}]}'),
(499, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161975, 0.172971, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(500, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161975, 0.141753, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(501, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161980, 0.17697, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(502, 'api/master/dokter/index', 'get', '{"id_poli":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530161987, 0.163309, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"20","id_universitas":"1","tahun_lulus":"2012","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"10","id_universitas":"1","tahun_lulus":"2008","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"}]}'),
(503, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"122","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","jam_akhir":"09.30","id_dokter":"1","jam_mulai":"07.30","id_poli":"1","waktu_layanan":"20","no_rekam_medis":"4567","id_pasien":"2","kuota":"120","id_hari":"4"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530162000, 0.292568, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"11","no_registrasi":"9202","no_rekam_medis":"4567","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"1","id_pasien":"2","id_hari":"4","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-06-28","date_add":"2018-06-28 12:00:00","status":"0","nama_poli":"Poli Umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 1","nama_lengkap":"Jhon doe"}]}'),
(504, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163317, 0.16445, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(505, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163329, 0.173328, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(506, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163332, 0.211718, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(507, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163336, 0.170866, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(508, 'api/master/dokter/index', 'get', '{"id_poli":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163338, 0.152253, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"20","id_universitas":"1","tahun_lulus":"2012","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"10","id_universitas":"1","tahun_lulus":"2008","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"}]}'),
(509, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"122","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","jam_akhir":"09.30","id_dokter":"2","waktu_layanan":"10","jam_mulai":"07.30","id_poli":"1","no_rekam_medis":"4563","id_pasien":"3","kuota":"120","id_hari":"2"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163345, 0.20705, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"12","no_registrasi":"1698","no_rekam_medis":"4563","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"2","id_pasien":"3","id_hari":"2","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-07-03","date_add":"2018-06-28 12:22:25","status":"0","nama_poli":"Poli Umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 2","nama_lengkap":"Jim beglin"}]}'),
(510, 'api/antrian/notifikasi_keterlambatan/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530163412, 0.154842, '1', 200, '{"code":1,"message":"List notifikasi","result":{"id":"1","tanggal":"2018-06-22 09:04:15","notifikasi":"Dokter A terlambat","date_add":"2018-06-24 18:47:58","add_by":"0","deleted":"1"}}'),
(511, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530164572, 0.383482, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(512, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530164574, 0.131509, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(513, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169765, 0.1152, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(514, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169795, 0.121862, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(515, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169803, 0.12293, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(516, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169810, 0.113294, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(517, 'api/master/dokter/index', 'get', '{"id_poli":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169812, 0.112498, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"20","id_universitas":"1","tahun_lulus":"2012","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"10","id_universitas":"1","tahun_lulus":"2008","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"}]}'),
(518, 'api/antrian/antri/index', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"122","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","jam_akhir":"09.30","id_dokter":"1","waktu_layanan":"20","jam_mulai":"07.30","id_poli":"1","no_rekam_medis":"4563","id_pasien":"3","kuota":"120","id_hari":"1"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169821, 0.193372, '1', 200, '{"code":1,"message":"Success, queuing","result":[{"id":"13","no_registrasi":"4584","no_rekam_medis":"4563","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"1","id_pasien":"3","id_hari":"1","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-07-02","date_add":"2018-06-28 14:10:21","status":"0","nama_poli":"Poli Umum","lokasi":"Lantai 3A","nama_dokter":"Dokter 1","nama_lengkap":"Jim beglin"}]}'),
(519, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530169850, 0.126055, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(520, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170159, 0.201827, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(521, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170173, 0.112062, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(522, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170179, 0.109527, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(523, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170184, 0.106593, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(524, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170184, 0.115437, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(525, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170186, 0.120867, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(526, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170202, 0.108236, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(527, 'api/antrian/pantau/list', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530170210, 0.16487, '1', 200, '{"code":1,"message":"List antrian","result":[{"id":"11","no_registrasi":"9202","no_rekam_medis":"4567","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"1","id_pasien":"2","id_hari":"4","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-06-28","date_add":"2018-06-28 12:00:00","status":"0"},{"id":"12","no_registrasi":"1698","no_rekam_medis":"4563","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"2","id_pasien":"3","id_hari":"2","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-07-03","date_add":"2018-06-28 12:22:25","status":"0"},{"id":"13","no_registrasi":"4584","no_rekam_medis":"4563","id_jenis_layanan":"0","id_pengguna":"13","id_poli":"1","id_dokter":"1","id_pasien":"3","id_hari":"1","nomor_urut":"1","perkiraan_jam":"00:00:07","tanggal":"2018-07-02","date_add":"2018-06-28 14:10:21","status":"0"}]}'),
(528, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171344, 0.113945, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(529, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171348, 0.110614, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(530, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171349, 0.180267, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(531, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171354, 0.121251, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(532, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171357, 0.109791, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(533, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171362, 0.0980401, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(534, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171365, 0.115469, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(535, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171366, 0.0897629, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(536, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171450, 0.100221, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(537, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171453, 0.107323, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"default.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"default.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(538, 'api/master/dokter/index', 'get', '{"id_poli":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171454, 0.220029, '1', 200, '{"code":1,"message":"List of doctors","result":[{"id":"1","nama":"Dokter 1","jam_kerja":"[ {\\"id_hari\\":\\"1\\",\\"label\\":\\"Senin\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"3\\",\\"label\\":\\"Rabo\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"4\\",\\"label\\":\\"Kamis\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"20","id_universitas":"1","tahun_lulus":"2012","id_poli":"1","date_add":"2018-06-20 23:26:51","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"},{"id":"2","nama":"Dokter 2","jam_kerja":"[ {\\"id_hari\\":\\"2\\",\\"label\\":\\"Selasa\\",\\"jam_mulai\\":\\"07.30\\",\\"jam_akhir\\":\\"09.30\\",\\"kuota\\":\\"120\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"5\\",\\"label\\":\\"Jumat\\",\\"jam_mulai\\":\\"09.30\\",\\"jam_akhir\\":\\"12.00\\",\\"kuota\\":\\"150\\",\\"keterangan\\":\\"kuota dalam menit\\"}, {\\"id_hari\\":\\"6\\",\\"label\\":\\"Sabtu\\",\\"jam_mulai\\":\\"10.00\\",\\"jam_akhir\\":\\"14.30\\",\\"kuota\\":\\"270\\",\\"keterangan\\":\\"kuota dalam menit\\"} ]","gambar":"default.png","waktu_pelayanan":"10","id_universitas":"1","tahun_lulus":"2008","id_poli":"1","date_add":"2018-06-20 23:26:57","add_by":"0","deleted":"1","nama_univ":"Univ. Indonesia"}]}'),
(539, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171579, 0.109664, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(540, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171588, 0.115034, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(541, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171588, 0.227924, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(542, 'api/rekam_medis/insert', 'post', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"77","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","no_rekam_medis":"4563","id_pasien":"3","id_kelas":"2","id_jenis_layanan":"1","id_cara_bayar":"2"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530171608, 0.140607, '1', 201, '{"code":1,"message":"Data tersimpan","result":[{"id_layanan":"3","id_pasien":"3","id_pengguna":"13","id_jenis_layanan":"1","id_kelas":"2","lokasi":"disana","id_cara_bayar":"2","no_registrasi":"4740","no_rekam_medis":"4563","date_add":"2018-06-28 14:40:08","add_by":null,"deleted":"1","nama_kelas":"kelas 2","cara_bayar":"Transfer","nama_lengkap":"Jim beglin"}]}'),
(543, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530172865, 0.115703, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(544, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530174957, 0.157907, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(545, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530174963, 0.248443, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(546, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176292, 0.113712, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(547, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176294, 0.18799, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(548, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176294, 0.139501, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(549, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176296, 0.11254, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(550, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176297, 0.105096, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(551, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176298, 0.162792, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(552, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530176302, 0.121993, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(553, 'api/master/jenis_layanan/index', 'get', '{"Host":"192.168.0.24","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko\\/20100101 Firefox\\/60.0","Accept":"*\\/*","Accept-Language":"en-GB,en;q=0.5","Accept-Encoding":"gzip, deflate","auth-key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","origin":"moz-extension:\\/\\/462852ae-9a60-4250-aa5c-2af8dc39ec8a","Cookie":"ci_session=mtco32rf78a3ci8l30dolas000fu17kd","Connection":"keep-alive"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.15', 1530178514, 0.14861, '1', 200, '{"code":1,"message":"List Data","result":[{"id":"0","nama":"-","deskripsi":"","date_add":"2018-06-26 11:10:57","add_by":"1","deleted":"1"},{"id":"1","nama":"IGD","deskripsi":"IGD","date_add":"2018-06-22 08:50:09","add_by":"0","deleted":"1"},{"id":"2","nama":"Rawat Inap","deskripsi":"","date_add":"2018-06-20 23:32:41","add_by":"0","deleted":"1"},{"id":"3","nama":"Rawat Jalan","deskripsi":"","date_add":"2018-06-20 23:32:48","add_by":"0","deleted":"1"},{"id":"4","nama":"Medical Checkup","deskripsi":"","date_add":"2018-06-20 23:33:03","add_by":"0","deleted":"1"}]}'),
(554, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530179920, 0.116147, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(555, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180155, 0.200992, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}'),
(556, 'api/rekam_medis/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180166, 0.202673, '1', 404, '{"code":0,"message":"Cannot get data","result":[]}');
INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(557, 'api/myhelp/form_rekam_medis', 'get', '{"id_jenis_layanan":"1","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180183, 0.162699, '1', 200, '{"code":1,"message":"List pasien","pasien":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Budha","nama_status_nikah":"Menikah"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13","nama_agama":"Islam","nama_status_nikah":"Belum Menikah"}],"kelas":[{"id":"1","nama":"kelas 1","rate_biaya":"1000000","date_add":"2018-06-20 23:37:18","add_by":"0","deleted":"1"},{"id":"2","nama":"kelas 2","rate_biaya":"650000","date_add":"2018-06-20 23:37:23","add_by":"0","deleted":"1"}],"cara_bayar":[{"id":"1","nama":"Cash","date_add":"2018-06-27 08:08:08","deleted":"1"},{"id":"2","nama":"Transfer","date_add":"2018-06-27 08:08:08","deleted":"1"}]}'),
(558, 'api/myhelp/form_pasien', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180184, 0.0992889, '1', 200, '{"code":1,"message":"List ","agama":[{"id":"1","nama":"Islam","date_add":"2018-06-20 23:27:16","deleted":"1"},{"id":"2","nama":"Kristen","date_add":"2018-06-20 23:27:21","deleted":"1"},{"id":"3","nama":"Khatolik","date_add":"2018-06-20 23:27:28","deleted":"1"},{"id":"4","nama":"Budha","date_add":"2018-06-20 23:27:47","deleted":"1"},{"id":"5","nama":"Hindu","date_add":"2018-06-20 23:27:50","deleted":"1"}],"status_pernikahan":[{"id":"1","nama":"Belum Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"},{"id":"2","nama":"Menikah","date_add":"2018-06-26 10:50:08","deleted":"1"}]}'),
(559, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180276, 0.11193, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(560, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180510, 0.119939, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(561, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.4', 1530180582, 0.128675, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(562, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530343570, 0.412065, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(563, 'api/auth/signin', 'post', '{"AUTH-KEY":"0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.7', 1530344788, 0.212784, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}'),
(564, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530344789, 0.119092, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(565, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345034, 0.137097, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(566, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345034, 0.100891, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(567, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345057, 0.1468, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(568, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345153, 0.105629, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(569, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345155, 0.090827, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(570, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345156, 0.100464, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(571, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530345160, 0.11425, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(572, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530346294, 0.10924, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(573, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348321, 0.122471, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(574, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348356, 0.10667, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(575, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348430, 0.122602, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(576, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348439, 0.16037, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(577, 'api/artikel', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348579, 0.104254, '1', 200, '{"code":1,"message":"List artikel","result":[{"id_artikel":"1","judul":"Atikel 1","isi":"Ini isi artikel","gambar":"default.png","date_add":"2018-06-22 08:42:22","add_by":"0","last_edit":"0000-00-00 00:00:00","deleted":"1"}]}'),
(578, 'api/konfigurasi/multiple', 'get', '{"id":"3,4,5","AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348580, 0.0989351, '1', 200, '{"code":1,"message":"Generating konfigurasi list","result":[{"nama_atribut":"nomor_rs","nilai_atribut":"08567463","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"wa_rs","nilai_atribut":"+6282144331230","komentar":"","penjelasan":"","nama_label":""},{"nama_atribut":"sms_rs","nilai_atribut":"082144331230","komentar":"","penjelasan":"","nama_label":""}]}'),
(579, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530348581, 0.242298, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(580, 'api/profile/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530349102, 0.125245, '1', 200, '{"code":1,"messsage":"Success, generating user information","result":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","password":"86f7e437faa5a7fce15d1ddcb9eaeaea377667b8","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","kode_aktivasi":"DONE","fb_id":null,"g_id":null,"last_view_notif":null,"token":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","token_fcm":"","device_id":""}}'),
(581, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530349104, 0.0922439, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}'),
(582, 'api/master/poli/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530349108, 0.099524, '1', 200, '{"code":1,"message":"List poli","result":[{"id":"1","nama_poli":"Poli Umum","estimasi_waktu":"0","lokasi":"Lantai 3A","gambar":"poli1.png","date_add":"2018-06-20 23:23:26","add_by":"0","deleted":"1"},{"id":"2","nama_poli":"Poli THT","estimasi_waktu":"0","lokasi":"Lantai 1C","gambar":"poli2.png","date_add":"2018-06-20 23:24:45","add_by":"0","deleted":"1"}]}'),
(583, 'api/pasien/index', 'get', '{"AUTH-KEY":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","Host":"192.168.0.24","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0"}', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '192.168.0.7', 1530349183, 0.107333, '1', 200, '{"code":1,"message":"List pasien","result":[{"id_pasien":"2","nama_lengkap":"Jhon doe","tanggal_lahir":"2018-06-27","alamat":"jl. hahaha","no_rekam_medis":"4567","use_bpjs":"1","no_bpjs":"483438783743","jenis_kelamin":"1","id_agama":"4","id_status_pernikahan":"2","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"},{"id_pasien":"3","nama_lengkap":"Jim beglin","tanggal_lahir":null,"alamat":"","no_rekam_medis":"4563","use_bpjs":"1","no_bpjs":"4834345","jenis_kelamin":"1","id_agama":"1","id_status_pernikahan":"1","date_add":"2018-06-20 23:40:04","add_by":"0","deleted":"1","id_pengguna":"13"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE IF NOT EXISTS `blog_category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `category_desc` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`category_id`, `category_name`, `category_desc`) VALUES
(1, 'Technology', '');

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cc_options`
--

CREATE TABLE IF NOT EXISTS `cc_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cc_options`
--

INSERT INTO `cc_options` (`id`, `option_name`, `option_value`) VALUES
(1, 'active_theme', 'cicool'),
(2, 'favicon', 'default.png'),
(3, 'site_name', 'Aptikma');

-- --------------------------------------------------------

--
-- Table structure for table `cc_session`
--

CREATE TABLE IF NOT EXISTS `cc_session` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE IF NOT EXISTS `crud` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `page_read` varchar(20) DEFAULT NULL,
  `page_create` varchar(20) DEFAULT NULL,
  `page_update` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `crud`
--

INSERT INTO `crud` (`id`, `title`, `subject`, `table_name`, `primary_key`, `page_read`, `page_create`, `page_update`) VALUES
(1, 'Kategori', 'Kategori', 'm_kategori', 'id_kategori', 'yes', 'yes', 'yes'),
(2, 'Barang', 'Barang', 'm_barang', 'id_barang', 'yes', 'yes', 'yes'),
(3, 'Agama', 'Agama', 'm_agama', 'id', 'yes', 'yes', 'yes'),
(4, 'Bed', 'Bed', 'm_bed', 'id_bed', 'yes', 'yes', 'yes'),
(5, 'Artikel', 'Artikel', 'm_artikel', 'id_artikel', 'yes', 'yes', 'yes'),
(6, 'Cara Bayar', 'Cara Bayar', 'm_cara_bayar', 'id', 'yes', 'yes', 'yes'),
(7, 'Dokter', 'Dokter', 'm_dokter', 'id', 'yes', 'yes', 'yes'),
(8, 'Jenis Layanan', 'Jenis Layanan', 'm_jenis_layanan', 'id', 'yes', 'yes', 'yes'),
(9, 'Kelas', 'Kelas', 'm_kelas', 'id', 'yes', 'yes', 'yes'),
(10, 'Ruangan', 'Ruangan', 'm_ruangan', 'id', 'yes', 'yes', 'yes'),
(11, 'Lokasi Kelas', 'Lokasi Kelas', 'lokasi_kelas', 'id_lokasi_kelas', 'yes', 'yes', 'yes'),
(12, 'Poli', 'Poli', 'm_poli', 'id', 'yes', 'yes', 'yes'),
(13, 'Universitas', 'Universitas', 'm_universitas', 'id', 'yes', 'yes', 'yes'),
(14, 'Status Pernikahan', 'Status Pernikahan', 'm_status_pernikahan', 'id', 'yes', 'yes', 'yes'),
(15, 'Pasien', 'Pasien', 'pasien', 'id_pasien', 'yes', 'yes', 'yes'),
(16, 'Pengguna', 'Pengguna', 'pengguna', 'id', 'yes', 'yes', 'yes'),
(17, 'Rekam Medis', 'Rekam Medis', 'rekam_medis', 'id_rekam_medis', 'yes', 'yes', 'yes'),
(18, 'Antrian', 'Antrian', 'antrian', 'id', 'yes', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `crud_custom_option`
--

CREATE TABLE IF NOT EXISTS `crud_custom_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `crud_custom_option`
--

INSERT INTO `crud_custom_option` (`id`, `crud_field_id`, `crud_id`, `option_value`, `option_label`) VALUES
(5, 89, 4, '0', 'Kosong'),
(6, 89, 4, '1', 'Ditempati'),
(9, 252, 17, '1', 'Antrian'),
(10, 252, 17, '2', 'Layanan');

-- --------------------------------------------------------

--
-- Table structure for table `crud_field`
--

CREATE TABLE IF NOT EXISTS `crud_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crud_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_form` varchar(10) DEFAULT NULL,
  `show_update_form` varchar(10) DEFAULT NULL,
  `show_detail_page` varchar(10) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=300 ;

--
-- Dumping data for table `crud_field`
--

INSERT INTO `crud_field` (`id`, `crud_id`, `field_name`, `field_label`, `input_type`, `show_column`, `show_add_form`, `show_update_form`, `show_detail_page`, `sort`, `relation_table`, `relation_value`, `relation_label`) VALUES
(31, 1, 'id_kategori', 'id_kategori', 'number', '', '', '', '', 1, '', '', ''),
(32, 1, 'nama_kategori', 'nama_kategori', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(33, 1, 'date_add', 'date_add', 'timestamp', '', '', '', '', 3, '', '', ''),
(34, 1, 'add_by', 'add_by', 'number', '', '', '', '', 4, '', '', ''),
(35, 1, 'deleted', 'deleted', 'number', '', '', '', '', 5, '', '', ''),
(60, 2, 'id_barang', 'barang', 'number', '', '', '', '', 1, '', '', ''),
(61, 2, 'nama_barang', 'nama_barang', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(62, 2, 'deskripsi', 'deskripsi', 'editor_wysiwyg', '', 'yes', 'yes', 'yes', 3, '', '', ''),
(63, 2, 'qty', 'qty', 'number', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(64, 2, 'id_kategori', 'kategori', 'select', 'yes', 'yes', 'yes', 'yes', 5, 'm_kategori', 'id_kategori', 'nama_kategori'),
(65, 2, 'date_add', 'date_add', 'timestamp', '', '', '', '', 6, '', '', ''),
(66, 2, 'add_by', 'add_by', 'number', '', '', '', '', 7, '', '', ''),
(67, 2, 'deleted', 'deleted', 'number', '', '', '', '', 8, '', '', ''),
(68, 3, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(69, 3, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(70, 3, 'date_add', 'date_add', 'timestamp', '', '', '', '', 3, '', '', ''),
(71, 3, 'deleted', 'deleted', 'number', '', '', '', '', 4, '', '', ''),
(86, 4, 'id_bed', 'id_bed', 'number', '', '', '', '', 1, '', '', ''),
(87, 4, 'id_ruangan', 'ruangan', 'select', 'yes', 'yes', 'yes', 'yes', 2, 'm_ruangan', 'id', 'nama_ruangan'),
(88, 4, 'nomor', 'nomor', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(89, 4, 'status', 'status', 'select', 'yes', '', 'yes', 'yes', 4, 'h_status_bed', 'id_status', 'nama_status'),
(90, 4, 'date_add', 'date_add', 'timestamp', '', '', '', '', 5, '', '', ''),
(91, 4, 'add_by', 'add_by', 'number', '', '', '', '', 6, '', '', ''),
(92, 4, 'deleted', 'deleted', 'number', '', '', '', '', 7, '', '', ''),
(101, 5, 'id_artikel', 'id_artikel', 'number', '', '', '', '', 1, '', '', ''),
(102, 5, 'judul', 'judul', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(103, 5, 'isi', 'isi', 'editor_wysiwyg', '', 'yes', 'yes', 'yes', 3, '', '', ''),
(104, 5, 'gambar', 'gambar', 'file', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(105, 5, 'date_add', 'date_add', 'timestamp', '', '', '', '', 5, '', '', ''),
(106, 5, 'add_by', 'add_by', 'number', '', '', '', '', 6, '', '', ''),
(107, 5, 'last_edit', 'last_edit', 'datetime', '', '', '', '', 7, '', '', ''),
(108, 5, 'deleted', 'deleted', 'number', '', '', '', '', 8, '', '', ''),
(109, 6, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(110, 6, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(111, 6, 'date_add', 'date_add', 'timestamp', '', '', '', '', 3, '', '', ''),
(112, 6, 'deleted', 'deleted', 'number', '', '', '', '', 4, '', '', ''),
(113, 7, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(114, 7, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(115, 7, 'jam_kerja', 'jam_kerja', 'editor_wysiwyg', '', 'yes', 'yes', 'yes', 3, '', '', ''),
(116, 7, 'gambar', 'gambar', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(117, 7, 'waktu_pelayanan', 'waktu_pelayanan', 'number', '', 'yes', 'yes', 'yes', 5, '', '', ''),
(118, 7, 'id_universitas', 'universitas', 'select', 'yes', 'yes', 'yes', 'yes', 6, 'm_universitas', 'id', 'nama'),
(119, 7, 'tahun_lulus', 'tahun_lulus', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(120, 7, 'id_poli', 'poli', 'select', 'yes', 'yes', 'yes', 'yes', 8, 'm_poli', 'id', 'nama_poli'),
(121, 7, 'date_add', 'date_add', 'timestamp', '', '', '', '', 9, '', '', ''),
(122, 7, 'add_by', 'add_by', 'number', '', '', '', '', 10, '', '', ''),
(123, 7, 'deleted', 'deleted', 'number', '', '', '', '', 11, '', '', ''),
(124, 8, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(125, 8, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(126, 8, 'deskripsi', 'deskripsi', 'textarea', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(127, 8, 'date_add', 'date_add', 'timestamp', '', '', '', '', 4, '', '', ''),
(128, 8, 'add_by', 'add_by', 'number', '', '', '', '', 5, '', '', ''),
(129, 8, 'deleted', 'deleted', 'number', '', '', '', '', 6, '', '', ''),
(130, 9, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(131, 9, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(132, 9, 'rate_biaya', 'rate_biaya', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(133, 9, 'date_add', 'date_add', 'timestamp', '', '', '', '', 4, '', '', ''),
(134, 9, 'add_by', 'add_by', 'number', '', '', '', '', 5, '', '', ''),
(135, 9, 'deleted', 'deleted', 'number', '', '', '', '', 6, '', '', ''),
(136, 10, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(137, 10, 'nama_ruangan', 'nama_ruangan', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(138, 10, 'id_kelas', 'kelas', 'select', 'yes', 'yes', 'yes', 'yes', 3, 'm_kelas', 'id', 'nama'),
(139, 10, 'jumlah_kasur', 'jumlah_kasur', 'number', '', '', '', '', 4, '', '', ''),
(140, 10, 'id_lokasi', 'lokasi', 'select', 'yes', 'yes', 'yes', 'yes', 5, 'm_lokasi', 'id', 'nama'),
(141, 10, 'date_add', 'date_add', 'timestamp', '', '', '', '', 6, '', '', ''),
(142, 10, 'add_by', 'add_by', 'number', '', '', '', '', 7, '', '', ''),
(143, 10, 'deleted', 'deleted', 'number', '', '', '', '', 8, '', '', ''),
(144, 11, 'id_lokasi_kelas', 'id_lokasi_kelas', 'number', '', '', '', '', 1, '', '', ''),
(145, 11, 'id_jenis_layanan', 'jenis_layanan', 'select', 'yes', 'yes', 'yes', 'yes', 2, 'm_jenis_layanan', 'id', 'nama'),
(146, 11, 'id_kelas', 'kelas', 'select', 'yes', 'yes', 'yes', 'yes', 3, 'm_kelas', 'id', 'nama'),
(147, 11, 'lokasi', 'lokasi', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(148, 11, 'biaya', 'biaya', 'number', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(149, 12, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(150, 12, 'nama_poli', 'nama_poli', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(151, 12, 'estimasi_waktu', 'estimasi_waktu', 'number', '', '', '', '', 3, '', '', ''),
(152, 12, 'lokasi', 'lokasi', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(153, 12, 'gambar_poli', 'gambar_poli', 'file', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(154, 12, 'date_add', 'date_add', 'timestamp', '', '', '', '', 6, '', '', ''),
(155, 12, 'add_by', 'add_by', 'number', '', '', '', '', 7, '', '', ''),
(156, 12, 'deleted', 'deleted', 'number', '', '', '', '', 8, '', '', ''),
(157, 13, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(158, 13, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(159, 13, 'deskripsi', 'deskripsi', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(160, 13, 'date_add', 'date_add', 'timestamp', '', '', '', '', 4, '', '', ''),
(161, 13, 'add_by', 'add_by', 'number', '', '', '', '', 5, '', '', ''),
(162, 13, 'deleted', 'deleted', 'number', '', '', '', '', 6, '', '', ''),
(163, 14, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(164, 14, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(165, 14, 'date_add', 'date_add', 'timestamp', '', '', '', '', 3, '', '', ''),
(166, 14, 'deleted', 'deleted', 'number', '', '', '', '', 4, '', '', ''),
(195, 15, 'id_pasien', 'id_pasien', 'number', '', '', '', '', 1, '', '', ''),
(196, 15, 'nama_lengkap', 'nama_lengkap', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(197, 15, 'tanggal_lahir', 'tanggal_lahir', 'date', '', 'yes', 'yes', 'yes', 3, '', '', ''),
(198, 15, 'alamat', 'alamat', 'input', '', 'yes', 'yes', 'yes', 4, '', '', ''),
(199, 15, 'no_rekam_medis', 'no_rekam_medis', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(200, 15, 'use_bpjs', 'use_bpjs', 'number', '', '', '', '', 6, '', '', ''),
(201, 15, 'no_bpjs', 'no_bpjs', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(202, 15, 'jenis_kelamin', 'jenis_kelamin', 'select', '', 'yes', 'yes', 'yes', 8, 'm_jenis_kelamin', 'id', 'nama_kelamin'),
(203, 15, 'id_agama', 'agama', 'select', '', '', '', '', 9, 'm_agama', 'id', 'nama'),
(204, 15, 'id_pengguna', 'pengguna', 'select', '', 'yes', 'yes', 'yes', 10, 'pengguna', 'id', 'email'),
(205, 15, 'id_status_pernikahan', 'status_pernikahan', 'select', '', 'yes', 'yes', 'yes', 11, 'm_status_pernikahan', 'id', 'nama'),
(206, 15, 'date_add', 'date_add', 'timestamp', '', '', '', '', 12, '', '', ''),
(207, 15, 'add_by', 'add_by', 'number', '', '', '', '', 13, '', '', ''),
(208, 15, 'deleted', 'deleted', 'number', '', '', '', '', 14, '', '', ''),
(209, 16, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(210, 16, 'nama', 'nama', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(211, 16, 'telpon', 'telpon', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(212, 16, 'use_bpjs', 'use_bpjs', 'number', '', '', '', '', 4, '', '', ''),
(213, 16, 'no_bpjs', 'no_bpjs', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(214, 16, 'email', 'email', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(215, 16, 'password', 'password', 'password', '', '', '', '', 7, '', '', ''),
(216, 16, 'level', 'level', 'number', '', '', '', '', 8, '', '', ''),
(217, 16, 'no_ktp', 'no_ktp', 'input', '', 'yes', 'yes', 'yes', 9, '', '', ''),
(218, 16, 'alamat', 'alamat', 'input', '', 'yes', 'yes', 'yes', 10, '', '', ''),
(219, 16, 'id_kelurahan', 'kelurahan', 'number', '', '', '', '', 11, '', '', ''),
(220, 16, 'id_kecamatan', 'kecamatan', 'number', '', '', '', '', 12, '', '', ''),
(221, 16, 'id_kota', 'kota', 'number', '', '', '', '', 13, '', '', ''),
(222, 16, 'id_provinsi', 'provinsi', 'number', '', '', '', '', 14, '', '', ''),
(223, 16, 'id_negara', 'negara', 'number', '', '', '', '', 15, '', '', ''),
(224, 16, 'image', 'image', 'file', '', 'yes', 'yes', 'yes', 16, '', '', ''),
(225, 16, 'date_add', 'date_add', 'timestamp', '', '', '', '', 17, '', '', ''),
(226, 16, 'status_login', 'status_login', 'number', '', '', '', '', 18, '', '', ''),
(227, 16, 'deleted', 'deleted', 'number', '', '', '', '', 19, '', '', ''),
(228, 16, 'kode_aktivasi', 'kode_aktivasi', 'input', '', '', '', '', 20, '', '', ''),
(229, 16, 'fb_id', 'fb_id', 'editor_wysiwyg', '', '', '', '', 21, '', '', ''),
(230, 16, 'g_id', 'g_id', 'editor_wysiwyg', '', '', '', '', 22, '', '', ''),
(231, 16, 'last_view_notif', 'last_view_notif', 'timestamp', '', '', '', '', 23, '', '', ''),
(251, 17, 'id_rekam_medis', 'id_rekam_medis', 'number', '', '', '', '', 1, '', '', ''),
(252, 17, 'tipe_rekam_medis', 'tipe_rekam_medis', 'custom_select', '', 'yes', 'yes', 'yes', 2, '', '', ''),
(253, 17, 'no_registrasi', 'no_registrasi', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(254, 17, 'no_rekam_medis', 'no_rekam_medis', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(255, 17, 'id_pengguna', 'pengguna', 'input', '', '', '', '', 5, '', '', ''),
(256, 17, 'referensi', 'referensi', 'number', '', '', '', '', 6, '', '', ''),
(257, 17, 'id_pasien', 'pasien', 'select', 'yes', 'yes', 'yes', 'yes', 7, 'pasien', 'id_pasien', 'nama_lengkap'),
(258, 17, 'id_poli', 'poli', 'select', '', 'yes', 'yes', 'yes', 8, 'm_poli', 'id', 'nama_poli'),
(259, 17, 'id_jenis_layanan', 'jenis_layanan', 'select', '', 'yes', 'yes', 'yes', 9, 'm_jenis_layanan', 'id', 'nama'),
(260, 17, 'id_dokter', 'dokter', 'select', '', 'yes', 'yes', 'yes', 10, 'm_dokter', 'id', 'nama'),
(261, 17, 'id_petugas', 'petugas', 'current_user_id', '', 'yes', 'yes', '', 11, '', '', ''),
(262, 17, 'keluhan', 'keluhan', 'textarea', '', 'yes', 'yes', 'yes', 12, '', '', ''),
(263, 17, 'diagnosa', 'diagnosa', 'textarea', '', 'yes', 'yes', 'yes', 13, '', '', ''),
(264, 17, 'terapi', 'terapi', 'textarea', '', 'yes', 'yes', 'yes', 14, '', '', ''),
(265, 17, 'solusi', 'solusi', 'textarea', '', 'yes', 'yes', 'yes', 15, '', '', ''),
(266, 17, 'resep', 'resep', 'textarea', '', 'yes', 'yes', 'yes', 16, '', '', ''),
(267, 17, 'date_add', 'date_add', 'timestamp', '', '', '', '', 17, '', '', ''),
(268, 17, 'add_by', 'add_by', 'number', '', '', '', '', 18, '', '', ''),
(269, 17, 'deleted', 'deleted', 'number', '', '', '', '', 19, '', '', ''),
(285, 18, 'id', 'id', 'number', '', '', '', '', 1, '', '', ''),
(286, 18, 'no_registrasi', 'no_registrasi', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(287, 18, 'no_rekam_medis', 'no_rekam_medis', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(288, 18, 'id_jenis_layanan', 'jenis_layanan', 'number', '', '', '', '', 4, '', '', ''),
(289, 18, 'id_pengguna', 'pengguna', 'number', '', '', '', '', 5, '', '', ''),
(290, 18, 'id_poli', 'poli', 'select', '', 'yes', 'yes', 'yes', 6, 'm_poli', 'id', 'nama_poli'),
(291, 18, 'id_dokter', 'dokter', 'select', 'yes', 'yes', 'yes', 'yes', 7, 'm_dokter', 'id', 'nama'),
(292, 18, 'id_pasien', 'pasien', 'select', 'yes', 'yes', 'yes', 'yes', 8, 'pasien', 'id_pasien', 'nama_lengkap'),
(293, 18, 'id_hari', 'hari', 'select', '', 'yes', 'yes', 'yes', 9, 'm_hari', 'id', 'nama_hari'),
(294, 18, 'nomor_urut', 'nomor_urut', 'number', 'yes', '', '', 'yes', 10, '', '', ''),
(295, 18, 'perkiraan_jam', 'perkiraan_jam', 'time', '', 'yes', 'yes', 'yes', 11, '', '', ''),
(296, 18, 'tanggal', 'tanggal', 'date', 'yes', 'yes', 'yes', 'yes', 12, '', '', ''),
(297, 18, 'date_add', 'date_add', 'timestamp', '', '', '', '', 13, '', '', ''),
(298, 18, 'status', 'status', 'number', '', '', '', '', 14, '', '', ''),
(299, 18, 'deleted', 'deleted', 'number', '', '', '', '', 15, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `crud_field_validation`
--

CREATE TABLE IF NOT EXISTS `crud_field_validation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=442 ;

--
-- Dumping data for table `crud_field_validation`
--

INSERT INTO `crud_field_validation` (`id`, `crud_field_id`, `crud_id`, `validation_name`, `validation_value`) VALUES
(38, 32, 1, 'required', ''),
(39, 32, 1, 'max_length', '11'),
(40, 34, 1, 'required', ''),
(41, 34, 1, 'max_length', '11'),
(42, 35, 1, 'required', ''),
(43, 35, 1, 'max_length', '11'),
(78, 61, 2, 'required', ''),
(79, 61, 2, 'max_length', '30'),
(80, 62, 2, 'required', ''),
(81, 63, 2, 'required', ''),
(82, 63, 2, 'max_length', '11'),
(83, 64, 2, 'required', ''),
(84, 64, 2, 'max_length', '11'),
(85, 66, 2, 'required', ''),
(86, 66, 2, 'max_length', '11'),
(87, 67, 2, 'required', ''),
(88, 67, 2, 'max_length', '11'),
(89, 69, 3, 'required', ''),
(90, 69, 3, 'max_length', '50'),
(91, 70, 3, 'required', ''),
(92, 71, 3, 'required', ''),
(93, 71, 3, 'max_length', '1'),
(114, 87, 4, 'required', ''),
(115, 87, 4, 'max_length', '11'),
(116, 88, 4, 'required', ''),
(117, 88, 4, 'max_length', '20'),
(118, 89, 4, 'required', ''),
(119, 91, 4, 'required', ''),
(120, 91, 4, 'max_length', '11'),
(121, 92, 4, 'required', ''),
(122, 92, 4, 'max_length', '11'),
(133, 102, 5, 'required', ''),
(134, 102, 5, 'max_length', '160'),
(135, 103, 5, 'required', ''),
(136, 104, 5, 'required', ''),
(137, 106, 5, 'required', ''),
(138, 106, 5, 'max_length', '11'),
(139, 107, 5, 'required', ''),
(140, 108, 5, 'required', ''),
(141, 108, 5, 'max_length', '1'),
(142, 110, 6, 'required', ''),
(143, 110, 6, 'max_length', '50'),
(144, 111, 6, 'required', ''),
(145, 112, 6, 'required', ''),
(146, 112, 6, 'max_length', '1'),
(147, 114, 7, 'required', ''),
(148, 114, 7, 'max_length', '160'),
(149, 115, 7, 'required', ''),
(150, 116, 7, 'required', ''),
(151, 116, 7, 'max_length', '30'),
(152, 117, 7, 'required', ''),
(153, 117, 7, 'max_length', '11'),
(154, 118, 7, 'required', ''),
(155, 118, 7, 'max_length', '11'),
(156, 119, 7, 'required', ''),
(157, 119, 7, 'max_length', '4'),
(158, 120, 7, 'required', ''),
(159, 120, 7, 'max_length', '11'),
(160, 121, 7, 'required', ''),
(161, 122, 7, 'required', ''),
(162, 122, 7, 'max_length', '11'),
(163, 123, 7, 'required', ''),
(164, 123, 7, 'max_length', '1'),
(165, 125, 8, 'required', ''),
(166, 125, 8, 'max_length', '60'),
(167, 126, 8, 'required', ''),
(168, 127, 8, 'required', ''),
(169, 128, 8, 'required', ''),
(170, 128, 8, 'max_length', '11'),
(171, 129, 8, 'required', ''),
(172, 129, 8, 'max_length', '1'),
(173, 131, 9, 'required', ''),
(174, 131, 9, 'max_length', '100'),
(175, 132, 9, 'required', ''),
(176, 133, 9, 'required', ''),
(177, 134, 9, 'required', ''),
(178, 134, 9, 'max_length', '11'),
(179, 135, 9, 'required', ''),
(180, 135, 9, 'max_length', '1'),
(181, 137, 10, 'required', ''),
(182, 137, 10, 'max_length', '100'),
(183, 138, 10, 'required', ''),
(184, 138, 10, 'max_length', '11'),
(185, 139, 10, 'required', ''),
(186, 139, 10, 'max_length', '11'),
(187, 140, 10, 'required', ''),
(188, 140, 10, 'max_length', '11'),
(189, 141, 10, 'required', ''),
(190, 142, 10, 'required', ''),
(191, 142, 10, 'max_length', '11'),
(192, 143, 10, 'required', ''),
(193, 143, 10, 'max_length', '1'),
(194, 145, 11, 'required', ''),
(195, 145, 11, 'max_length', '11'),
(196, 146, 11, 'required', ''),
(197, 146, 11, 'max_length', '11'),
(198, 147, 11, 'required', ''),
(199, 147, 11, 'max_length', '30'),
(200, 148, 11, 'required', ''),
(201, 148, 11, 'max_length', '11'),
(202, 150, 12, 'required', ''),
(203, 150, 12, 'max_length', '100'),
(204, 151, 12, 'required', ''),
(205, 151, 12, 'max_length', '11'),
(206, 152, 12, 'required', ''),
(207, 152, 12, 'max_length', '40'),
(208, 153, 12, 'required', ''),
(209, 154, 12, 'required', ''),
(210, 155, 12, 'required', ''),
(211, 155, 12, 'max_length', '11'),
(212, 156, 12, 'required', ''),
(213, 156, 12, 'max_length', '1'),
(214, 158, 13, 'required', ''),
(215, 158, 13, 'max_length', '60'),
(216, 159, 13, 'required', ''),
(217, 160, 13, 'required', ''),
(218, 161, 13, 'required', ''),
(219, 161, 13, 'max_length', '11'),
(220, 162, 13, 'required', ''),
(221, 162, 13, 'max_length', '1'),
(222, 164, 14, 'required', ''),
(223, 164, 14, 'max_length', '50'),
(224, 165, 14, 'required', ''),
(225, 166, 14, 'required', ''),
(226, 166, 14, 'max_length', '1'),
(274, 196, 15, 'required', ''),
(275, 196, 15, 'max_length', '120'),
(276, 197, 15, 'required', ''),
(277, 198, 15, 'required', ''),
(278, 198, 15, 'max_length', '100'),
(279, 199, 15, 'required', ''),
(280, 199, 15, 'max_length', '10'),
(281, 200, 15, 'required', ''),
(282, 200, 15, 'max_length', '1'),
(283, 201, 15, 'required', ''),
(284, 201, 15, 'max_length', '50'),
(285, 202, 15, 'required', ''),
(286, 202, 15, 'max_length', '1'),
(287, 203, 15, 'required', ''),
(288, 203, 15, 'max_length', '11'),
(289, 204, 15, 'required', ''),
(290, 204, 15, 'max_length', '11'),
(291, 205, 15, 'required', ''),
(292, 205, 15, 'max_length', '11'),
(293, 207, 15, 'required', ''),
(294, 207, 15, 'max_length', '11'),
(295, 208, 15, 'required', ''),
(296, 208, 15, 'max_length', '11'),
(297, 210, 16, 'required', ''),
(298, 210, 16, 'max_length', '40'),
(299, 211, 16, 'required', ''),
(300, 211, 16, 'max_length', '15'),
(301, 212, 16, 'required', ''),
(302, 212, 16, 'max_length', '1'),
(303, 213, 16, 'required', ''),
(304, 213, 16, 'max_length', '40'),
(305, 214, 16, 'required', ''),
(306, 214, 16, 'max_length', '30'),
(307, 215, 16, 'required', ''),
(308, 215, 16, 'max_length', '150'),
(309, 216, 16, 'required', ''),
(310, 216, 16, 'max_length', '11'),
(311, 217, 16, 'required', ''),
(312, 217, 16, 'max_length', '18'),
(313, 218, 16, 'required', ''),
(314, 218, 16, 'max_length', '100'),
(315, 219, 16, 'required', ''),
(316, 219, 16, 'max_length', '11'),
(317, 220, 16, 'required', ''),
(318, 220, 16, 'max_length', '11'),
(319, 221, 16, 'required', ''),
(320, 221, 16, 'max_length', '11'),
(321, 222, 16, 'required', ''),
(322, 222, 16, 'max_length', '11'),
(323, 223, 16, 'required', ''),
(324, 223, 16, 'max_length', '11'),
(325, 224, 16, 'required', ''),
(326, 224, 16, 'max_length', '30'),
(327, 225, 16, 'required', ''),
(328, 226, 16, 'required', ''),
(329, 226, 16, 'max_length', '1'),
(330, 227, 16, 'required', ''),
(331, 227, 16, 'max_length', '1'),
(332, 228, 16, 'required', ''),
(333, 228, 16, 'max_length', '25'),
(334, 229, 16, 'required', ''),
(335, 230, 16, 'required', ''),
(336, 231, 16, 'required', ''),
(367, 252, 17, 'required', ''),
(368, 253, 17, 'required', ''),
(369, 253, 17, 'max_length', '20'),
(370, 254, 17, 'required', ''),
(371, 254, 17, 'max_length', '20'),
(372, 255, 17, 'required', ''),
(373, 255, 17, 'max_length', '11'),
(374, 256, 17, 'required', ''),
(375, 256, 17, 'max_length', '11'),
(376, 257, 17, 'required', ''),
(377, 257, 17, 'max_length', '11'),
(378, 258, 17, 'required', ''),
(379, 258, 17, 'max_length', '11'),
(380, 259, 17, 'required', ''),
(381, 259, 17, 'max_length', '11'),
(382, 260, 17, 'required', ''),
(383, 260, 17, 'max_length', '11'),
(384, 262, 17, 'required', ''),
(385, 263, 17, 'required', ''),
(386, 264, 17, 'required', ''),
(387, 265, 17, 'required', ''),
(388, 266, 17, 'required', ''),
(389, 268, 17, 'required', ''),
(390, 268, 17, 'max_length', '11'),
(391, 269, 17, 'required', ''),
(392, 269, 17, 'max_length', '1'),
(418, 286, 18, 'required', ''),
(419, 286, 18, 'max_length', '10'),
(420, 287, 18, 'required', ''),
(421, 287, 18, 'max_length', '10'),
(422, 288, 18, 'required', ''),
(423, 288, 18, 'max_length', '11'),
(424, 289, 18, 'required', ''),
(425, 289, 18, 'max_length', '11'),
(426, 290, 18, 'required', ''),
(427, 290, 18, 'max_length', '11'),
(428, 291, 18, 'required', ''),
(429, 291, 18, 'max_length', '11'),
(430, 292, 18, 'required', ''),
(431, 292, 18, 'max_length', '11'),
(432, 293, 18, 'required', ''),
(433, 293, 18, 'max_length', '11'),
(434, 294, 18, 'required', ''),
(435, 294, 18, 'max_length', '11'),
(436, 295, 18, 'required', ''),
(437, 296, 18, 'required', ''),
(438, 298, 18, 'required', ''),
(439, 298, 18, 'max_length', '1'),
(440, 299, 18, 'required', ''),
(441, 299, 18, 'max_length', '1');

-- --------------------------------------------------------

--
-- Table structure for table `crud_input_type`
--

CREATE TABLE IF NOT EXISTS `crud_input_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `custom_value` int(11) NOT NULL,
  `validation_group` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `crud_input_type`
--

INSERT INTO `crud_input_type` (`id`, `type`, `relation`, `custom_value`, `validation_group`) VALUES
(1, 'input', '0', 0, 'input'),
(2, 'textarea', '0', 0, 'text'),
(3, 'select', '1', 0, 'select'),
(4, 'editor_wysiwyg', '0', 0, 'editor'),
(5, 'password', '0', 0, 'password'),
(6, 'email', '0', 0, 'email'),
(7, 'address_map', '0', 0, 'address_map'),
(8, 'file', '0', 0, 'file'),
(9, 'file_multiple', '0', 0, 'file_multiple'),
(10, 'datetime', '0', 0, 'datetime'),
(11, 'date', '0', 0, 'date'),
(12, 'timestamp', '0', 0, 'timestamp'),
(13, 'number', '0', 0, 'number'),
(14, 'yes_no', '0', 0, 'yes_no'),
(15, 'time', '0', 0, 'time'),
(16, 'year', '0', 0, 'year'),
(17, 'select_multiple', '1', 0, 'select_multiple'),
(18, 'checkboxes', '1', 0, 'checkboxes'),
(19, 'options', '1', 0, 'options'),
(20, 'true_false', '0', 0, 'true_false'),
(21, 'current_user_username', '0', 0, 'user_username'),
(22, 'current_user_id', '0', 0, 'current_user_id'),
(23, 'custom_option', '0', 1, 'custom_option'),
(24, 'custom_checkbox', '0', 1, 'custom_checkbox'),
(25, 'custom_select_multiple', '0', 1, 'custom_select_multiple'),
(26, 'custom_select', '0', 1, 'custom_select');

-- --------------------------------------------------------

--
-- Table structure for table `crud_input_validation`
--

CREATE TABLE IF NOT EXISTS `crud_input_validation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `validation` varchar(200) NOT NULL,
  `input_able` varchar(20) NOT NULL,
  `group_input` text NOT NULL,
  `input_placeholder` text NOT NULL,
  `call_back` varchar(10) NOT NULL,
  `input_validation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `crud_input_validation`
--

INSERT INTO `crud_input_validation` (`id`, `validation`, `input_able`, `group_input`, `input_placeholder`, `call_back`, `input_validation`) VALUES
(1, 'required', 'no', 'input, file, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes, true_false, address_map, custom_option, custom_checkbox, custom_select_multiple, custom_select, file_multiple', '', '', ''),
(2, 'max_length', 'yes', 'input, number, text, select, password, email, editor, yes_no, time, year, select_multiple, options, checkboxes, address_map', '', '', 'numeric'),
(3, 'min_length', 'yes', 'input, number, text, select, password, email, editor, time, year, select_multiple, address_map', '', '', 'numeric'),
(4, 'valid_email', 'no', 'input, email', '', '', ''),
(5, 'valid_emails', 'no', 'input, email', '', '', ''),
(6, 'regex', 'yes', 'input, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes', '', 'yes', 'callback_valid_regex'),
(7, 'decimal', 'no', 'input, number, text, select', '', '', ''),
(8, 'allowed_extension', 'yes', 'file, file_multiple', 'ex : jpg,png,..', '', 'callback_valid_extension_list'),
(9, 'max_width', 'yes', 'file, file_multiple', '', '', 'numeric'),
(10, 'max_height', 'yes', 'file, file_multiple', '', '', 'numeric'),
(11, 'max_size', 'yes', 'file, file_multiple', '... kb', '', 'numeric'),
(12, 'max_item', 'yes', 'file_multiple', '', '', 'numeric'),
(13, 'valid_url', 'no', 'input, text', '', '', ''),
(14, 'alpha', 'no', 'input, text, select, password, editor, yes_no', '', '', ''),
(15, 'alpha_numeric', 'no', 'input, number, text, select, password, editor', '', '', ''),
(16, 'alpha_numeric_spaces', 'no', 'input, number, text,select, password, editor', '', '', ''),
(17, 'valid_number', 'no', 'input, number, text, password, editor, true_false', '', 'yes', ''),
(18, 'valid_datetime', 'no', 'input, datetime, text', '', 'yes', ''),
(19, 'valid_date', 'no', 'input, datetime, date, text', '', 'yes', ''),
(20, 'valid_max_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
(21, 'valid_min_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
(22, 'valid_alpha_numeric_spaces_underscores', 'no', 'input, text,select, password, editor', '', 'yes', ''),
(23, 'matches', 'yes', 'input, number, text, password, email', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
(24, 'valid_json', 'no', 'input, text, editor', '', 'yes', ' '),
(25, 'valid_url', 'no', 'input, text, editor', '', 'no', ' '),
(26, 'exact_length', 'yes', 'input, text, number', '0 - 99999*', 'no', 'numeric'),
(27, 'alpha_dash', 'no', 'input, text', '', 'no', ''),
(28, 'integer', 'no', 'input, text, number', '', 'no', ''),
(29, 'differs', 'yes', 'input, text, number, email, password, editor, options, select', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
(30, 'is_natural', 'no', 'input, text, number', '', 'no', ''),
(31, 'is_natural_no_zero', 'no', 'input, text, number', '', 'no', ''),
(32, 'less_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
(33, 'less_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
(34, 'greater_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
(35, 'greater_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
(36, 'in_list', 'yes', 'input, text, number, select, options', '', 'no', 'callback_valid_multiple_value'),
(37, 'valid_ip', 'no', 'input, text', '', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_custom_attribute`
--

CREATE TABLE IF NOT EXISTS `form_custom_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `attribute_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_custom_option`
--

CREATE TABLE IF NOT EXISTS `form_custom_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_field`
--

CREATE TABLE IF NOT EXISTS `form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `input_type` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `placeholder` text,
  `auto_generate_help_block` varchar(10) DEFAULT NULL,
  `help_block` text,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_validation`
--

CREATE TABLE IF NOT EXISTS `form_field_validation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `h_status_bed`
--

CREATE TABLE IF NOT EXISTS `h_status_bed` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(10) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `h_status_bed`
--

INSERT INTO `h_status_bed` (`id_status`, `nama_status`) VALUES
(0, 'Kosong'),
(1, 'Ditempati');

-- --------------------------------------------------------

--
-- Table structure for table `igd`
--

CREATE TABLE IF NOT EXISTS `igd` (
  `id_igd` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_igd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `is_private_key` tinyint(1) NOT NULL,
  `ip_addresses` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, '80D98C5A76C17C4B233A9352D4CE9535', 0, 0, 0, NULL, '2018-07-05 11:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE IF NOT EXISTS `konfigurasi` (
  `id_atribut` int(11) NOT NULL AUTO_INCREMENT,
  `nama_atribut` varchar(50) NOT NULL,
  `nilai_atribut` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `penjelasan` text NOT NULL,
  `nama_label` varchar(100) NOT NULL,
  PRIMARY KEY (`id_atribut`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_atribut`, `nama_atribut`, `nilai_atribut`, `komentar`, `penjelasan`, `nama_label`) VALUES
(1, 'nomor_ambulance', '890489384', 'Nomor telpon darurat ambulan', '', ''),
(2, 'nomor_dokter', '495899493', 'nomor darutat dokter', '', ''),
(3, 'nomor_rs', '08567463', '', '', ''),
(4, 'wa_rs', '+6282144331230', '', '', ''),
(5, 'sms_rs', '082144331230', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE IF NOT EXISTS `layanan` (
  `id_layanan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(11) DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_jenis_layanan` int(11) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `id_cara_bayar` int(11) NOT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rekam_medis` varchar(20) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(1) DEFAULT NULL,
  `deleted` int(1) DEFAULT '1',
  PRIMARY KEY (`id_layanan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `id_pasien`, `id_pengguna`, `id_jenis_layanan`, `id_kelas`, `lokasi`, `id_cara_bayar`, `no_registrasi`, `no_rekam_medis`, `date_add`, `add_by`, `deleted`) VALUES
(1, 1, 1, 1, 1, 'disana', 1, '6202', '123', '2018-06-27 01:29:10', NULL, 1),
(2, 2, 13, 1, 1, 'disana', 1, '6882', '4567', '2018-06-28 02:23:04', NULL, 1),
(3, 3, 13, 1, 2, 'disana', 2, '4740', '4563', '2018-06-28 07:40:08', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kelas`
--

CREATE TABLE IF NOT EXISTS `lokasi_kelas` (
  `id_lokasi_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_layanan` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `biaya` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_lokasi_kelas`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `lokasi_kelas`
--

INSERT INTO `lokasi_kelas` (`id_lokasi_kelas`, `id_jenis_layanan`, `id_kelas`, `lokasi`, `biaya`, `deleted`) VALUES
(1, 1, 1, 'Lantai 3', 0, 1),
(2, 1, 2, 'Lantai 1', 0, 1),
(3, 2, 2, 'Lantai 3', 0, 1),
(4, 2, 3, 'Lantai 1', 0, 1),
(5, 3, 1, 'Lantai 3', 0, 1),
(6, 3, 2, 'Lantai 1', 0, 1),
(7, 3, 3, 'Lantai 3', 0, 1),
(8, 4, 3, 'Lantai 1', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `icon_color` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `menu_type_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `type`, `icon_color`, `link`, `sort`, `parent`, `icon`, `menu_type_id`, `active`) VALUES
(1, 'MAIN NAVIGATION', 'label', '', 'administrator/dashboard', 1, 0, '', 1, 1),
(2, 'Dashboard', 'menu', '', 'administrator/dashboard', 2, 0, 'fa-dashboard', 1, 1),
(3, 'CRUD Builder', 'menu', '', 'administrator/crud', 3, 0, 'fa-table', 1, 1),
(4, 'API Builder', 'menu', '', 'administrator/rest', 4, 0, 'fa-code', 1, 1),
(5, 'Page Builder', 'menu', '', 'administrator/page', 5, 0, 'fa-file-o', 1, 1),
(6, 'Form Builder', 'menu', '', 'administrator/form', 6, 0, 'fa-newspaper-o', 1, 1),
(7, 'Menu', 'menu', '', 'administrator/menu', 7, 0, 'fa-bars', 1, 1),
(8, 'Auth', 'menu', '', '', 8, 0, 'fa-shield', 1, 1),
(9, 'User', 'menu', '', 'administrator/user', 9, 8, '', 1, 1),
(10, 'Groups', 'menu', '', 'administrator/group', 10, 8, '', 1, 1),
(11, 'Access', 'menu', '', 'administrator/access', 11, 8, '', 1, 1),
(12, 'Permission', 'menu', '', 'administrator/permission', 12, 8, '', 1, 1),
(13, 'API Keys', 'menu', '', 'administrator/keys', 13, 8, '', 1, 1),
(14, 'Extension', 'menu', '', 'administrator/extension', 13, 0, 'fa-puzzle-piece', 1, 1),
(15, 'OTHER', 'label', '', '', 14, 0, '', 1, 1),
(16, 'Settings', 'menu', 'text-red', 'administrator/setting', 15, 0, 'fa-circle-o', 1, 1),
(17, 'Web Documentation', 'menu', 'text-blue', 'administrator/doc/web', 16, 0, 'fa-circle-o', 1, 1),
(18, 'API Documentation', 'menu', 'text-yellow', 'administrator/doc/api', 17, 0, 'fa-circle-o', 1, 1),
(19, 'Home', 'menu', '', '/', 1, 0, '', 2, 1),
(20, 'About', 'menu', '', 'page/about', 2, 0, '', 2, 1),
(21, 'Get Started', 'menu', '', 'page/get-started', 3, 0, '', 2, 1),
(22, 'Dashboard', 'menu', '', 'administrator/dashboard', 4, 0, '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE IF NOT EXISTS `menu_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
(1, 'side menu', NULL),
(2, 'top menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `m_agama`
--

CREATE TABLE IF NOT EXISTS `m_agama` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `m_agama`
--

INSERT INTO `m_agama` (`id`, `nama`, `date_add`, `deleted`) VALUES
(1, 'Islam', '2018-06-20 16:27:16', 1),
(2, 'Kristen', '2018-06-20 16:27:21', 1),
(3, 'Khatolik', '2018-06-20 16:27:28', 1),
(4, 'Budha', '2018-06-20 16:27:47', 1),
(5, 'Hindu', '2018-06-20 16:27:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_artikel`
--

CREATE TABLE IF NOT EXISTS `m_artikel` (
  `id_artikel` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(160) NOT NULL,
  `isi` text NOT NULL,
  `gambar` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `last_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_artikel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m_artikel`
--

INSERT INTO `m_artikel` (`id_artikel`, `judul`, `isi`, `gambar`, `date_add`, `add_by`, `last_edit`, `deleted`) VALUES
(1, 'Atikel 1', 'Ini isi artikel', 'default.png', '2018-06-22 01:42:22', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bantuan`
--

CREATE TABLE IF NOT EXISTS `m_bantuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(160) NOT NULL,
  `isi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m_bantuan`
--

INSERT INTO `m_bantuan` (`id`, `judul`, `isi`, `date_add`, `deleted`) VALUES
(1, 'Bantuan', 'Isi', '2018-06-22 01:56:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE IF NOT EXISTS `m_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL,
  `qty` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m_barang`
--

INSERT INTO `m_barang` (`id_barang`, `nama_barang`, `deskripsi`, `qty`, `id_kategori`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'Saya bisa', 'oke saja jcv<br />\r\n<br />\r\nncidbide<br />\r\n<br />\r\nfgf', 1, 2, '2018-07-05 12:40:18', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bed`
--

CREATE TABLE IF NOT EXISTS `m_bed` (
  `id_bed` int(11) NOT NULL AUTO_INCREMENT,
  `id_ruangan` int(11) NOT NULL,
  `nomor` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1 ditempati, 0 available',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id_bed`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m_bed`
--

INSERT INTO `m_bed` (`id_bed`, `id_ruangan`, `nomor`, `status`, `date_add`, `add_by`, `deleted`) VALUES
(1, 1, '1A', 0, '2018-06-24 11:42:42', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_cara_bayar`
--

CREATE TABLE IF NOT EXISTS `m_cara_bayar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_cara_bayar`
--

INSERT INTO `m_cara_bayar` (`id`, `nama`, `date_add`, `deleted`) VALUES
(1, 'Cash', '2018-06-27 01:08:08', 1),
(2, 'Transfer', '2018-06-27 01:08:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_diagnosa`
--

CREATE TABLE IF NOT EXISTS `m_diagnosa` (
  `id_diagnosa` int(11) NOT NULL AUTO_INCREMENT,
  `nama_diagnosa` varchar(100) NOT NULL,
  `deskripsi_diagnosa` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_diagnosa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m_dokter`
--

CREATE TABLE IF NOT EXISTS `m_dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(160) NOT NULL,
  `jam_kerja` text NOT NULL,
  `gambar` varchar(30) NOT NULL,
  `waktu_pelayanan` int(11) NOT NULL COMMENT 'dalam menit',
  `id_universitas` int(11) NOT NULL,
  `tahun_lulus` varchar(4) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_dokter`
--

INSERT INTO `m_dokter` (`id`, `nama`, `jam_kerja`, `gambar`, `waktu_pelayanan`, `id_universitas`, `tahun_lulus`, `id_poli`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'Dokter 1', '[ {"id_hari":"1","label":"Senin","jam_mulai":"07.30","jam_akhir":"09.30","kuota":"120","keterangan":"kuota dalam menit"}, {"id_hari":"3","label":"Rabo","jam_mulai":"09.30","jam_akhir":"12.00","kuota":"150","keterangan":"kuota dalam menit"}, {"id_hari":"4","label":"Kamis","jam_mulai":"10.00","jam_akhir":"14.30","kuota":"270","keterangan":"kuota dalam menit"} ]', 'default.png', 20, 1, '2012', 1, '2018-06-20 16:26:51', 0, 1),
(2, 'Dokter 2', '[ {"id_hari":"2","label":"Selasa","jam_mulai":"07.30","jam_akhir":"09.30","kuota":"120","keterangan":"kuota dalam menit"}, {"id_hari":"5","label":"Jumat","jam_mulai":"09.30","jam_akhir":"12.00","kuota":"150","keterangan":"kuota dalam menit"}, {"id_hari":"6","label":"Sabtu","jam_mulai":"10.00","jam_akhir":"14.30","kuota":"270","keterangan":"kuota dalam menit"} ]', 'default.png', 10, 1, '2008', 1, '2018-06-20 16:26:57', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_hari`
--

CREATE TABLE IF NOT EXISTS `m_hari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_hari` varchar(60) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `m_hari`
--

INSERT INTO `m_hari` (`id`, `nama_hari`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'Senin', '2018-07-06 00:56:39', 0, 1),
(2, 'Selasa', '2018-07-06 00:56:39', 0, 1),
(3, 'Rabo', '2018-07-06 00:57:01', 0, 1),
(4, 'Kamis', '2018-07-06 00:57:01', 0, 1),
(5, 'Jumat', '2018-07-06 00:57:01', 0, 1),
(6, 'Sabtu', '2018-07-06 00:57:01', 0, 1),
(7, 'Minggu', '2018-07-06 00:57:01', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_kelamin`
--

CREATE TABLE IF NOT EXISTS `m_jenis_kelamin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelamin` varchar(60) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_jenis_kelamin`
--

INSERT INTO `m_jenis_kelamin` (`id`, `nama_kelamin`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'Pria', '2018-07-06 00:35:47', 0, 1),
(2, 'Wanita', '2018-07-06 00:35:47', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_layanan`
--

CREATE TABLE IF NOT EXISTS `m_jenis_layanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `deskripsi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `m_jenis_layanan`
--

INSERT INTO `m_jenis_layanan` (`id`, `nama`, `deskripsi`, `date_add`, `add_by`, `deleted`) VALUES
(0, '-', '', '2018-06-26 04:10:57', 1, 1),
(1, 'IGD', 'IGD', '2018-06-22 01:50:09', 0, 1),
(2, 'Rawat Inap', '', '2018-06-20 16:32:41', 0, 1),
(3, 'Rawat Jalan', '', '2018-06-20 16:32:48', 0, 1),
(4, 'Medical Checkup', '', '2018-06-20 16:33:03', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE IF NOT EXISTS `m_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(10) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`id_kategori`, `nama_kategori`, `date_add`, `add_by`, `deleted`) VALUES
(1, '1', '2018-07-05 12:00:43', 0, 0),
(2, 'okesa', '2018-07-05 12:11:40', 0, 1),
(3, 'ff', '2018-07-05 12:21:04', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_kelas`
--

CREATE TABLE IF NOT EXISTS `m_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `rate_biaya` float NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `m_kelas`
--

INSERT INTO `m_kelas` (`id`, `nama`, `rate_biaya`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'kelas 1', 1000000, '2018-06-20 16:37:18', 0, 1),
(2, 'kelas 2', 650000, '2018-06-20 16:37:23', 0, 1),
(3, 'kelas 3', 240000, '2018-06-20 16:37:29', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_lokasi`
--

CREATE TABLE IF NOT EXISTS `m_lokasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_lokasi`
--

INSERT INTO `m_lokasi` (`id`, `nama`, `detail`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'lok_1', 'Pintu Masuk lurus', '2018-06-20 16:25:03', 0, 0),
(2, 'lok_2', 'lantai 1 resepsionis ke kiri notok', '2018-06-20 16:25:16', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_poli`
--

CREATE TABLE IF NOT EXISTS `m_poli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_poli` varchar(100) NOT NULL,
  `estimasi_waktu` int(11) NOT NULL COMMENT 'dalam menit',
  `lokasi` varchar(40) NOT NULL,
  `gambar_poli` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_poli`
--

INSERT INTO `m_poli` (`id`, `nama_poli`, `estimasi_waktu`, `lokasi`, `gambar_poli`, `date_add`, `add_by`, `deleted`) VALUES
(0, '-', 0, 'Lantai 2A', '', '2018-06-26 04:10:29', 1, 0),
(1, 'Poli Umum', 0, 'Lantai 3A', 'poli1.png', '2018-06-20 16:23:26', 0, 1),
(2, 'Poli THT', 0, 'Lantai 1C', 'poli2.png', '2018-06-20 16:24:45', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_ruangan`
--

CREATE TABLE IF NOT EXISTS `m_ruangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ruangan` varchar(100) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `jumlah_kasur` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `m_ruangan`
--

INSERT INTO `m_ruangan` (`id`, `nama_ruangan`, `id_kelas`, `jumlah_kasur`, `id_lokasi`, `date_add`, `add_by`, `deleted`) VALUES
(1, 'ruangan anak', 3, 10, 1, '2018-06-20 16:44:33', 0, 1),
(2, 'VVIP', 1, 1, 2, '2018-06-20 16:44:48', 0, 1),
(3, 'VIP', 2, 2, 1, '2018-06-20 16:44:57', 0, 1),
(4, 'test', 1, 0, 1, '2018-07-06 00:05:34', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_status_pernikahan`
--

CREATE TABLE IF NOT EXISTS `m_status_pernikahan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_status_pernikahan`
--

INSERT INTO `m_status_pernikahan` (`id`, `nama`, `date_add`, `deleted`) VALUES
(1, 'Belum Menikah', '2018-06-26 03:50:08', 1),
(2, 'Menikah', '2018-06-26 03:50:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_universitas`
--

CREATE TABLE IF NOT EXISTS `m_universitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `deskripsi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `m_universitas`
--

INSERT INTO `m_universitas` (`id`, `nama`, `deskripsi`, `date_add`, `add_by`, `deleted`) VALUES
(0, 'Belum terdata', '', '2018-06-26 04:10:57', 1, 1),
(1, 'Univ. Indonesia', '-', '2018-06-22 01:50:09', 0, 1),
(2, 'Univ. A', '', '2018-06-20 16:32:41', 0, 1),
(3, 'Univ. B', '', '2018-06-20 16:32:48', 0, 1),
(4, 'Univ. C', '', '2018-06-20 16:33:03', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_keterlambatan`
--

CREATE TABLE IF NOT EXISTS `notifikasi_keterlambatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notifikasi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `notifikasi_keterlambatan`
--

INSERT INTO `notifikasi_keterlambatan` (`id`, `tanggal`, `notifikasi`, `date_add`, `add_by`, `deleted`) VALUES
(1, '2018-06-22 02:04:15', 'Dokter A terlambat', '2018-06-24 11:47:58', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `fresh_content` text NOT NULL,
  `keyword` text,
  `description` text,
  `link` varchar(200) DEFAULT NULL,
  `template` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_block_element`
--

CREATE TABLE IF NOT EXISTS `page_block_element` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image_preview` varchar(200) NOT NULL,
  `block_name` varchar(200) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(120) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_rekam_medis` varchar(10) NOT NULL,
  `use_bpjs` int(1) NOT NULL DEFAULT '0',
  `no_bpjs` varchar(50) NOT NULL,
  `jenis_kelamin` int(1) NOT NULL COMMENT '1 laki-laki, 2 perempuan',
  `id_agama` int(11) NOT NULL,
  `id_status_pernikahan` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '1',
  `id_pengguna` int(11) NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_lengkap`, `tanggal_lahir`, `alamat`, `no_rekam_medis`, `use_bpjs`, `no_bpjs`, `jenis_kelamin`, `id_agama`, `id_status_pernikahan`, `date_add`, `add_by`, `deleted`, `id_pengguna`) VALUES
(1, 'Alip Sulistio', NULL, '', '123', 1, '48343878374', 1, 1, 1, '2018-06-20 16:40:04', 0, 1, 1),
(2, 'Jhon doe', '2018-06-27', 'jl. hahaha', '4567', 1, '483438783743', 1, 4, 2, '2018-06-20 16:40:04', 0, 1, 13),
(3, 'Jim beglin', NULL, '', '4563', 1, '4834345', 1, 1, 1, '2018-06-20 16:40:04', 0, 1, 13),
(4, 'saya', '1990-09-09', 'disini aja', '6320', 0, '0', 1, 1, 2, '2018-06-27 02:06:58', 0, 1, 1),
(5, 'sukam', '2018-06-30', 'jl. alamat', '6743', 0, '0', 1, 3, 1, '2018-06-27 06:14:21', 0, 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `use_bpjs` int(1) NOT NULL DEFAULT '0' COMMENT '1:ya, 0:tidak',
  `no_bpjs` varchar(40) NOT NULL DEFAULT '0' COMMENT '1:ya, 0:tidak',
  `email` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1:user, 2:admin, 3:staff',
  `no_ktp` varchar(18) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `id_provinsi` int(11) DEFAULT NULL,
  `id_negara` int(11) DEFAULT NULL,
  `image` varchar(30) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_login` int(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '3' COMMENT '1 : aktif, 2 : block,3=not actived, 0: deleted',
  `kode_aktivasi` varchar(25) NOT NULL,
  `fb_id` text COMMENT 'facebook_id',
  `g_id` text COMMENT 'google_id',
  `last_view_notif` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `telpon`, `use_bpjs`, `no_bpjs`, `email`, `password`, `level`, `no_ktp`, `alamat`, `id_kelurahan`, `id_kecamatan`, `id_kota`, `id_provinsi`, `id_negara`, `image`, `date_add`, `status_login`, `deleted`, `kode_aktivasi`, `fb_id`, `g_id`, `last_view_notif`) VALUES
(1, 'Alip', '082141019485', 1, '0498349729384732', 'alipxsulistio@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1, '', '', 1, 1, 1, 1, 1, 'default.png', '2018-06-20 16:41:10', 1, 1, '', NULL, NULL, NULL),
(2, 'Alip Sulistio', '', 0, '', 'alipxsulistio@mail.com', '3da541559918a808c2402bba5012f6c60b27661c', 1, '04387439423', 'jl Klayatan 2', 0, 0, 0, 0, 0, 'no_image.png', '2018-06-22 02:18:05', 0, 3, '750531', NULL, NULL, NULL),
(11, 'eko', '636252526', 0, '0', '', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no_image.png', '2018-06-22 07:27:27', 1, 1, 'DONE', NULL, NULL, NULL),
(12, 'edi', '123', 0, '0', '', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no_image.png', '2018-06-22 07:47:19', 1, 1, 'DONE', NULL, NULL, NULL),
(13, 'edi', '', 1, '0001', '', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no_image.png', '2018-06-22 08:32:02', 1, 1, 'DONE', NULL, NULL, NULL),
(14, 'eko', '', 0, '0', 'a@a.a', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no_image.png', '2018-06-22 09:06:34', 1, 1, 'DONE', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna_konfirmasi_telpon`
--

CREATE TABLE IF NOT EXISTS `pengguna_konfirmasi_telpon` (
  `id_pengguna` int(11) NOT NULL,
  `telpon` varchar(14) NOT NULL,
  `kode` varchar(12) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 belum verifikasi, 1 sudah verifikasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna_konfirmasi_telpon`
--

INSERT INTO `pengguna_konfirmasi_telpon` (`id_pengguna`, `telpon`, `kode`, `status`) VALUES
(4, '01991', '515119', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna_token`
--

CREATE TABLE IF NOT EXISTS `pengguna_token` (
  `id_pengguna` int(11) NOT NULL,
  `os` varchar(10) NOT NULL,
  `token` varchar(100) NOT NULL,
  `token_fcm` varchar(100) NOT NULL,
  `device_id` varchar(30) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `login_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna_token`
--

INSERT INTO `pengguna_token` (`id_pengguna`, `os`, `token`, `token_fcm`, `device_id`, `device_name`, `login_date`) VALUES
(1, 'android', 'kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0', '', '', '', '2018-06-22 01:28:51'),
(2, 'android', 'gko884g88ww04c84ckogooc44o0ow4wcgsscscko', '', '', '', '2018-06-22 02:18:05'),
(11, 'android', '8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0', '', '', '', '2018-06-22 07:27:27'),
(12, 'android', '0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4', '', '', '', '2018-06-22 07:47:19'),
(13, 'android', '404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8', '', '', '', '2018-06-22 08:32:02'),
(14, 'android', '4gco48ccoook8o4ow4k8k488c84ks0cc4go444co', '', '', '', '2018-06-22 09:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE IF NOT EXISTS `rawat_inap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(11) NOT NULL,
  `id_bed` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE IF NOT EXISTS `rekam_medis` (
  `id_rekam_medis` int(11) NOT NULL AUTO_INCREMENT,
  `tipe_rekam_medis` int(1) NOT NULL DEFAULT '1' COMMENT '1=antrian, 2 layanan',
  `no_registrasi` varchar(20) NOT NULL,
  `no_rekam_medis` varchar(20) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `referensi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `id_jenis_layanan` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` text NOT NULL,
  `terapi` text NOT NULL,
  `solusi` text NOT NULL,
  `resep` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_rekam_medis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rest`
--

CREATE TABLE IF NOT EXISTS `rest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `x_api_key` varchar(20) DEFAULT NULL,
  `x_token` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rest_field`
--

CREATE TABLE IF NOT EXISTS `rest_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rest_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_api` varchar(10) DEFAULT NULL,
  `show_update_api` varchar(10) DEFAULT NULL,
  `show_detail_api` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rest_field_validation`
--

CREATE TABLE IF NOT EXISTS `rest_field_validation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rest_field_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rest_input_type`
--

CREATE TABLE IF NOT EXISTS `rest_input_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `validation_group` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rest_input_type`
--

INSERT INTO `rest_input_type` (`id`, `type`, `relation`, `validation_group`) VALUES
(1, 'input', '0', 'input'),
(2, 'timestamp', '0', 'timestamp'),
(3, 'file', '0', 'file');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
