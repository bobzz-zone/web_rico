-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 22, 2018 at 05:52 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 5.6.34-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antrian_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id` int(11) NOT NULL,
  `id_jenis_layanan` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_hari` int(11) NOT NULL,
  `nomor_urut` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 menunggu, 1 sudah dipanggil'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id`, `id_jenis_layanan`, `id_pengguna`, `id_poli`, `id_dokter`, `id_pasien`, `id_hari`, `nomor_urut`, `date_add`, `status`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '2018-06-20 16:29:15', 1),
(2, 1, 1, 1, 1, 1, 1, 2, '2018-06-20 16:29:15', 0),
(3, 1, 1, 1, 1, 1, 1, 3, '2018-06-20 16:29:15', 0),
(4, 1, 1, 1, 1, 1, 1, 3, '2018-06-22 02:08:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
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
  `response_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_logs`
--

INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `api_token`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`, `response_data`) VALUES
(1, 'api/key/generate', 'get', '{"Host":"localhost","User-Agent":"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko\\/20100101 Firefox\\/59.0","Accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","Accept-Language":"en-US,en;q=0.5","Accept-Encoding":"gzip, deflate","Cookie":"_ga=GA1.1.829020762.1522055350; __utma=111872281.829020762.1522055350.1527052518.1527151131.39; __utmz=111872281.1525235751.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); G_ENABLED_IDPS=google; __tawkuuid=e::localhost::q33ED3vvmkSNBVG573G9607ywMGB2qLklO3gbp7NtIi+Sb1IvisqTI+U1s8SCglW::2","Connection":"keep-alive","Upgrade-Insecure-Requests":"1","Cache-Control":"max-age=0"}', '', '', '127.0.0.1', 1529514788, 0.114742, '0', 403, '{"status":false,"error":"Invalid API key "}'),
(2, 'api/key', 'put', '{"cache-control":"no-cache","Postman-Token":"dd7cf5aa-aede-4303-821a-1c79c0ad3a6f","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","accept-encoding":"gzip, deflate","content-length":"0","Connection":"keep-alive"}', '', '', '::1', 1529514876, 0.192259, '0', 403, '{"status":false,"error":"Invalid API key "}'),
(3, 'api/key', 'put', '{"cache-control":"no-cache","Postman-Token":"38630c1f-706d-45fe-a526-a17edbe1aa4e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=3usf3hobmliekgc3hcba4ksj0nvmdo3r","accept-encoding":"gzip, deflate","content-length":"0","Connection":"keep-alive"}', '', '', '::1', 1529514922, 0.29886, '1', 201, '{"status":true,"key":"ocws8ss088g8cc0k08wscgwo0gswkoo0gswk44w8"}'),
(4, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"422979d7-3cbc-49e8-ad70-47af33064039","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=3usf3hobmliekgc3hcba4ksj0nvmdo3r","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------319896194350732907742577","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630551, 0.311332, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(5, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"07bc1968-7818-4292-b586-dc481cf3e82e","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------749916683844919167925117","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630591, 0.167573, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(6, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"1e796e3f-0303-47eb-9c26-22894acc511a","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------267751362729486461755746","content-length":"398","Connection":"keep-alive","username":"0498349729384732","password":"12345","is_bpjs":"1"}', '', '', '::1', 1529630600, 0.117641, '1', 200, '{"code":0,"id":0,"email":"0498349729384732","password":"12345","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
(7, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"ef9c84a8-39b5-49d0-88c1-30152517dd0b","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------414538596921176039656157","content-length":"397","Connection":"keep-alive","username":"0498349729384732","password":"1234","is_bpjs":"1"}', '', '', '::1', 1529630607, 0.178026, '1', 200, '{"code":0,"id":0,"username":"0498349729384732","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(8, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"7c59c2a4-cf8f-438b-ad49-0a4c48ed8ddd","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------001113926053938664651216","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630704, 0.103907, '1', 200, '{"code":0,"id":0,"username":"alipxsulistio@gmail.com","password":"1234","user_data":"[]","key":"","message":"Opps, you no longer have access to this account"}'),
(9, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"298456c6-3d1f-40ef-887f-bcbd7283a697","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------999080479908892867662054","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630739, 0.169095, '1', 0, ''),
(10, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"0448900c-03c5-43e3-8c8b-b583d7921e76","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------394933372596565239813488","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630764, NULL, '1', 0, ''),
(11, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"f8a8b931-7b73-4051-ace8-301fb7fb804d","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------543711891126716803733802","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630811, NULL, '1', 0, ''),
(12, 'api/auth/signin', 'post', '{"cache-control":"no-cache","Postman-Token":"d1af5709-2aac-475a-9573-2b6d2c7c005c","User-Agent":"PostmanRuntime\\/7.1.1","Accept":"*\\/*","Host":"localhost","cookie":"ci_session=nnkj1uifglatflghhg0rhvne7h3g7vbj","accept-encoding":"gzip, deflate","content-type":"multipart\\/form-data; boundary=--------------------------006249367873271608795115","content-length":"404","Connection":"keep-alive","username":"alipxsulistio@gmail.com","password":"1234","is_bpjs":"0"}', '', '', '::1', 1529630840, 0.221948, '1', 200, '{"code":0,"id":0,"email":"alipxsulistio@gmail.com","password":"1234","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
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
(59, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651249, 0.142465, '1', 200, '{"code":0,"id":0,"email":"eko","password":"a","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
(60, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"1663662","nama":"edi"}', '', '', '192.168.0.2', 1529651429, 0.357638, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"","nama":"edi","level":1,"image":"no_image.png","deleted":"3","key":"cw4ok44cwkgg8ssoog8gcc0ckcskg8gc0ow0c804","kode_aktivasi":"257868"}}'),
(61, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"257868"}', '', '', '192.168.0.2', 1529651444, 0.24794, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"10","nama":"edi","telpon":"","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:10:30","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"cw4ok44cwkgg8ssoog8gcc0ckcskg8gc0ow0c804"}'),
(62, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"edi","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529651465, 0.119295, '1', 200, '{"code":0,"id":0,"email":"edi","password":"a","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
(63, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"36","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"636252526","nama":"eko"}', '', '', '192.168.0.2', 1529652447, 0.362563, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"636252526","nama":"eko","level":1,"image":"no_image.png","deleted":"3","key":"8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0","kode_aktivasi":"636486"}}'),
(64, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"636486"}', '', '', '192.168.0.2', 1529652460, 0.298018, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"11","nama":"eko","telpon":"636252526","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:27:27","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"8g8c88sswgkc80gkcw84w8000kskw48sgwsco0g0"}'),
(65, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"eko","password":"a","is_bpjs":"0"}', '', '', '192.168.0.2', 1529652481, 0.0926878, '1', 200, '{"code":0,"id":0,"email":"eko","password":"a","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
(66, 'api/auth/signup', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"30","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","password":"a","telpon":"123","nama":"edi"}', '', '', '192.168.0.2', 1529653639, 0.879358, '1', 201, '{"code":1,"message":"Success, registered, please activate your account, activation code will be sent to your email address \\/ phone number","result":{"telpon":"123","nama":"edi","level":1,"image":"no_image.png","deleted":"3","key":"0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4","kode_aktivasi":"451639"}}'),
(67, 'api/auth/activation', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"11","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","code":"451639"}', '', '', '192.168.0.2', 1529653654, 0.162238, '1', 200, '{"code":1,"message":"Account activated, thank you","user_data":{"id":"12","nama":"edi","telpon":"123","use_bpjs":"0","no_bpjs":"0","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 14:47:19","status_login":"0","deleted":1,"fb_id":null,"g_id":null,"last_view_notif":null},"key":"0ksg408g48k8k8scs0g0wksk80w0g0www8w0c0o4"}'),
(68, 'api/auth/signin', 'post', '{"AUTH-KEY":"kggscsgs4gks8g00c8w80ggkow88cowwocwk8oc0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"33","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"123","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529653670, 0.672859, '1', 200, '{"code":0,"id":0,"email":"123","password":"a","user_data":"[]","message":"Oops, we couldn\'t find your account"}'),
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
(78, 'api/auth/signin', 'post', '{"AUTH-KEY":"0","Content-Type":"application\\/x-www-form-urlencoded","Content-Length":"34","Host":"192.168.0.12","Connection":"Keep-Alive","Accept-Encoding":"gzip","User-Agent":"okhttp\\/3.10.0","username":"0001","password":"a","is_bpjs":"1"}', '', '', '192.168.0.2', 1529660254, 0.235431, '1', 200, '{"code":1,"id":"13","username":"0001","password":"a","user_data":{"id":"13","nama":"edi","telpon":"","use_bpjs":"1","no_bpjs":"0001","email":"","level":"1","no_ktp":null,"alamat":null,"id_kelurahan":null,"id_kecamatan":null,"id_kota":null,"id_provinsi":null,"id_negara":null,"image":"no_image.png","date_add":"2018-06-22 15:32:02","status_login":"1","deleted":"1","fb_id":null,"g_id":null,"last_view_notif":null},"key":"404sokswsks4sc4k8kwkg48c0g8wggk8wcoccsc8","message":"Login Success"}');

-- --------------------------------------------------------

--
-- Table structure for table `igd`
--

CREATE TABLE `igd` (
  `id_igd` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_atribut` int(11) NOT NULL,
  `nama_atribut` varchar(50) NOT NULL,
  `nilai_atribut` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `penjelasan` text NOT NULL,
  `nama_label` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_atribut`, `nama_atribut`, `nilai_atribut`, `komentar`, `penjelasan`, `nama_label`) VALUES
(1, 'nomor_ambulance', '890489384', 'Nomor telpon darurat ambulan', '', ''),
(2, 'nomor_dokter', '495899493', 'nomor darutat dokter', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_agama`
--

CREATE TABLE `m_agama` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_agama`
--

INSERT INTO `m_agama` (`id`, `nama`, `date_add`, `deleted`) VALUES
(1, 'Islam', '2018-06-20 16:27:16', 0),
(2, 'Kristen', '2018-06-20 16:27:21', 0),
(3, 'Khatolik', '2018-06-20 16:27:28', 0),
(4, 'Budha', '2018-06-20 16:27:47', 0),
(5, 'Hindu', '2018-06-20 16:27:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_artikel`
--

CREATE TABLE `m_artikel` (
  `id_artikel` int(11) NOT NULL,
  `judul` varchar(160) NOT NULL,
  `isi` text NOT NULL,
  `gambar` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_by` int(11) NOT NULL,
  `last_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_artikel`
--

INSERT INTO `m_artikel` (`id_artikel`, `judul`, `isi`, `gambar`, `date_add`, `add_by`, `last_edit`, `deleted`) VALUES
(1, 'Atikel 1', 'Ini isi artikel', 'default.png', '2018-06-22 01:42:22', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bantuan`
--

CREATE TABLE `m_bantuan` (
  `id` int(11) NOT NULL,
  `judul` varchar(160) NOT NULL,
  `isi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_bantuan`
--

INSERT INTO `m_bantuan` (`id`, `judul`, `isi`, `date_add`, `deleted`) VALUES
(1, 'Bantuan', 'Isi', '2018-06-22 01:56:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_bed`
--

CREATE TABLE `m_bed` (
  `id_bed` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `nomor` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1 ditempati, 0 available'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_bed`
--

INSERT INTO `m_bed` (`id_bed`, `id_ruangan`, `nomor`, `status`) VALUES
(1, 1, '1A', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_diagnosa`
--

CREATE TABLE `m_diagnosa` (
  `id_diagnosa` int(11) NOT NULL,
  `nama_diagnosa` varchar(100) NOT NULL,
  `deskripsi_diagnosa` text NOT NULL,
  `ddeleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_dokter`
--

CREATE TABLE `m_dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(160) NOT NULL,
  `jam_kerja` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_dokter`
--

INSERT INTO `m_dokter` (`id`, `nama`, `jam_kerja`, `date_add`, `deleted`) VALUES
(1, 'Dokter 1', '', '2018-06-20 16:26:51', 1),
(2, 'Dokter 2', '', '2018-06-20 16:26:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_layanan`
--

CREATE TABLE `m_jenis_layanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `deskripsi` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_jenis_layanan`
--

INSERT INTO `m_jenis_layanan` (`id`, `nama`, `deskripsi`, `date_add`, `deleted`) VALUES
(1, 'IGD', 'IGD', '2018-06-22 01:50:09', 1),
(2, 'Rawat Inap', '', '2018-06-20 16:32:41', 1),
(3, 'Rawat Jalan', '', '2018-06-20 16:32:48', 1),
(4, 'Medical Checkup', '', '2018-06-20 16:33:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_kelas`
--

CREATE TABLE `m_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rate_biaya` float NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kelas`
--

INSERT INTO `m_kelas` (`id`, `nama`, `rate_biaya`, `date_add`, `deleted`) VALUES
(1, 'kelas 1', 1000000, '2018-06-20 16:37:18', 1),
(2, 'kelas 2', 650000, '2018-06-20 16:37:23', 1),
(3, 'kelas 3', 240000, '2018-06-20 16:37:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_lokasi`
--

CREATE TABLE `m_lokasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_lokasi`
--

INSERT INTO `m_lokasi` (`id`, `nama`, `detail`, `date_add`, `deleted`) VALUES
(1, 'lok_1', 'Pintu Masuk lurus', '2018-06-20 16:25:03', 0),
(2, 'lok_2', 'lantai 1 resepsionis ke kiri notok', '2018-06-20 16:25:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_poli`
--

CREATE TABLE `m_poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_poli`
--

INSERT INTO `m_poli` (`id`, `nama_poli`, `id_lokasi`, `gambar`, `date_add`, `deleted`) VALUES
(1, 'umum', 1, 'default.png', '2018-06-20 16:23:26', 1),
(2, 'lansia', 1, 'default.png', '2018-06-20 16:24:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_ruangan`
--

CREATE TABLE `m_ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `jumlah_kasur` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_ruangan`
--

INSERT INTO `m_ruangan` (`id`, `nama_ruangan`, `id_kelas`, `jumlah_kasur`, `id_lokasi`, `date_add`, `deleted`) VALUES
(1, 'ruangan anak', 3, 10, 1, '2018-06-20 16:44:33', 0),
(2, 'VVIP', 1, 1, 2, '2018-06-20 16:44:48', 0),
(3, 'VIP', 2, 2, 1, '2018-06-20 16:44:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_keterlambatan`
--

CREATE TABLE `notifikasi_keterlambatan` (
  `id` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notifikasi` text NOT NULL,
  `add_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi_keterlambatan`
--

INSERT INTO `notifikasi_keterlambatan` (`id`, `tanggal`, `notifikasi`, `add_by`) VALUES
(1, '2018-06-22 02:04:15', 'Dokter A terlambat', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_lengkap` varchar(120) NOT NULL,
  `use_bpjs` int(1) NOT NULL DEFAULT '0',
  `no_bpjs` varchar(50) NOT NULL,
  `jenis_kelamin` int(1) NOT NULL COMMENT '1 laki-laki, 2 perempuan',
  `id_agama` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_lengkap`, `use_bpjs`, `no_bpjs`, `jenis_kelamin`, `id_agama`, `date_add`, `id_pengguna`) VALUES
(1, 'Alip Sulistio', 1, '48343878374', 1, 1, '2018-06-20 16:40:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
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
  `last_view_notif` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `pengguna_konfirmasi_telpon` (
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

CREATE TABLE `pengguna_token` (
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

CREATE TABLE `rawat_inap` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_bed` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_pasien` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` text NOT NULL,
  `terapi` text NOT NULL,
  `solusi` text NOT NULL,
  `resep` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `igd`
--
ALTER TABLE `igd`
  ADD PRIMARY KEY (`id_igd`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_atribut`);

--
-- Indexes for table `m_agama`
--
ALTER TABLE `m_agama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_artikel`
--
ALTER TABLE `m_artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indexes for table `m_bantuan`
--
ALTER TABLE `m_bantuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_bed`
--
ALTER TABLE `m_bed`
  ADD PRIMARY KEY (`id_bed`);

--
-- Indexes for table `m_diagnosa`
--
ALTER TABLE `m_diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`);

--
-- Indexes for table `m_dokter`
--
ALTER TABLE `m_dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jenis_layanan`
--
ALTER TABLE `m_jenis_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kelas`
--
ALTER TABLE `m_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_poli`
--
ALTER TABLE `m_poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_ruangan`
--
ALTER TABLE `m_ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi_keterlambatan`
--
ALTER TABLE `notifikasi_keterlambatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `igd`
--
ALTER TABLE `igd`
  MODIFY `id_igd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_atribut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_agama`
--
ALTER TABLE `m_agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_artikel`
--
ALTER TABLE `m_artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_bantuan`
--
ALTER TABLE `m_bantuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_bed`
--
ALTER TABLE `m_bed`
  MODIFY `id_bed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_diagnosa`
--
ALTER TABLE `m_diagnosa`
  MODIFY `id_diagnosa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_dokter`
--
ALTER TABLE `m_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_jenis_layanan`
--
ALTER TABLE `m_jenis_layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_kelas`
--
ALTER TABLE `m_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_poli`
--
ALTER TABLE `m_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_ruangan`
--
ALTER TABLE `m_ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `notifikasi_keterlambatan`
--
ALTER TABLE `notifikasi_keterlambatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
