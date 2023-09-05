/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - perusahaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perusahaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perusahaan`;

/*Table structure for table `bagian_departemen` */

DROP TABLE IF EXISTS `bagian_departemen`;

CREATE TABLE `bagian_departemen` (
  `id_bagian_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bagian_dept` varchar(30) NOT NULL,
  `id_dept` int(11) NOT NULL,
  PRIMARY KEY (`id_bagian_dept`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `bagian_departemen` */

insert  into `bagian_departemen`(`id_bagian_dept`,`nama_bagian_dept`,`id_dept`) values 
(5,'SOFTWARE',3),
(6,'LAB',4),
(7,'JARINGAN',3),
(8,'HARDWARE',3);

/*Table structure for table `departemen` */

DROP TABLE IF EXISTS `departemen`;

CREATE TABLE `departemen` (
  `id_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dept` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dept`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `departemen` */

insert  into `departemen`(`id_dept`,`nama_dept`) values 
(3,'IT'),
(4,'PPIC');

/*Table structure for table `history_feedback` */

DROP TABLE IF EXISTS `history_feedback`;

CREATE TABLE `history_feedback` (
  `id_feedback` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) NOT NULL,
  `feedback` int(11) NOT NULL,
  `reported` varchar(5) NOT NULL,
  PRIMARY KEY (`id_feedback`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `history_feedback` */

insert  into `history_feedback`(`id_feedback`,`id_ticket`,`feedback`,`reported`) values 
(5,'T201612020001',1,'K0001'),
(6,'T201612020002',1,'K0001'),
(7,'T201612040003',1,'K0001'),
(8,'T201612040004',0,'K0001'),
(9,'T201612180007',1,'K0002'),
(10,'T201612180006',0,'K0002'),
(11,'T201612190008',1,'K0001'),
(12,'T202307130013',1,'K0008');

/*Table structure for table `informasi` */

DROP TABLE IF EXISTS `informasi`;

CREATE TABLE `informasi` (
  `id_informasi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `subject` varchar(35) NOT NULL,
  `pesan` text NOT NULL,
  `status` decimal(2,0) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  PRIMARY KEY (`id_informasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `informasi` */

/*Table structure for table `jabatan` */

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(30) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `jabatan` */

insert  into `jabatan`(`id_jabatan`,`nama_jabatan`) values 
(1,'KEPALA BAGIAN'),
(2,'KEPALA DIVISI'),
(3,'PJ SHIFT'),
(4,'OPERATOR');

/*Table structure for table `karyawan` */

DROP TABLE IF EXISTS `karyawan`;

CREATE TABLE `karyawan` (
  `nik` varchar(5) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `jk` varchar(10) NOT NULL,
  `id_bagian_dept` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  PRIMARY KEY (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `karyawan` */

insert  into `karyawan`(`nik`,`nama`,`alamat`,`jk`,`id_bagian_dept`,`id_jabatan`) values 
('K0001','NUR SURATMAN','TANGERANG','LAKI-LAKI',5,2),
('K0002','DESI','JAKARTA','PEREMPUAN',5,3),
('K0003','MUHLISON','TANGERANG','LAKI-LAKI',5,4),
('K0005','RIO','TANGERANG','LAKI-LAKI',5,2),
('K0006','DENI','TANGERANG','LAKI-LAKI',6,4),
('K0007','DOSEN','TES','LAKI-LAKI',5,1),
('K0008','BAYU TUTOR','BANDUNG, JAWA BARAT','LAKI-LAKI',5,2),
('K0009','BAYU USER','BANDUNG','LAKI-LAKI',5,1),
('K0010','DEWI','BOGOR','PEREMPUAN',5,4),
('K0011','COMRO','BANDUNG','LAKI-LAKI',5,4),
('K0012','SAMSUL','JAKARTA','LAKI-LAKI',6,3),
('K0013','Y IVAN WAHYU WICAKSONO','KETAPANG','LAKI-LAKI',5,4),
('K0014','FRANCH SUMALIE','KETAPANG','LAKI-LAKI',6,2);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(35) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`) values 
(4,'HARDWARE'),
(5,'SOFTWARE'),
(6,'JARINGAN');

/*Table structure for table `kondisi` */

DROP TABLE IF EXISTS `kondisi`;

CREATE TABLE `kondisi` (
  `id_kondisi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kondisi` varchar(30) NOT NULL,
  `waktu_respon` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `kondisi` */

insert  into `kondisi`(`id_kondisi`,`nama_kondisi`,`waktu_respon`) values 
(1,'SEGERA',1),
(2,'BISA DIKOMPROMI',3);

/*Table structure for table `sub_kategori` */

DROP TABLE IF EXISTS `sub_kategori`;

CREATE TABLE `sub_kategori` (
  `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sub_kategori` varchar(35) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_sub_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `sub_kategori` */

insert  into `sub_kategori`(`id_sub_kategori`,`nama_sub_kategori`,`id_kategori`) values 
(2,'KERUSAKAN KOMPONEN MONITOR',4),
(3,'KERUSAKAN MOUSE',4),
(4,'KERUSAKAN KEYBOARD',4),
(5,'PERBAIKAN SOFTWARE',5),
(6,'PENAMBAHAN APLIKASI/ PERBAIKAN SIMR',5),
(7,'TAMBAH JARINGAN',6),
(8,'PERBAIKAN INTERNET',6);

/*Table structure for table `teknisi` */

DROP TABLE IF EXISTS `teknisi`;

CREATE TABLE `teknisi` (
  `id_teknisi` varchar(5) NOT NULL,
  `nik` varchar(5) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `point` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id_teknisi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `teknisi` */

insert  into `teknisi`(`id_teknisi`,`nik`,`id_kategori`,`status`,`point`) values 
('T0001','K0003',5,'',1),
('T0002','K0010',5,'',0),
('T0003','K0001',4,'',0),
('T0004','K0013',5,'',1),
('T0005','K0013',6,'',0);

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id_ticket` varchar(13) NOT NULL,
  `tanggal` datetime NOT NULL,
  `tanggal_proses` datetime NOT NULL,
  `tanggal_solved` datetime NOT NULL,
  `reported` varchar(5) NOT NULL,
  `id_sub_kategori` int(11) NOT NULL,
  `problem_summary` varchar(50) NOT NULL,
  `problem_detail` text NOT NULL,
  `id_teknisi` varchar(5) NOT NULL,
  `status` int(11) NOT NULL,
  `progress` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ticket` */

insert  into `ticket`(`id_ticket`,`tanggal`,`tanggal_proses`,`tanggal_solved`,`reported`,`id_sub_kategori`,`problem_summary`,`problem_detail`,`id_teknisi`,`status`,`progress`) values 
('T201612020001','2016-12-02 16:59:18','2016-12-02 17:00:39','0000-00-00 00:00:00','K0001',2,'SASAS','NBNB','T0002',6,90),
('T201612020002','2016-12-02 17:05:29','2016-12-02 17:09:06','0000-00-00 00:00:00','K0001',2,'CXZCX','CXZC','T0002',6,100),
('T201612040003','2016-12-04 07:06:47','2016-12-04 08:20:29','2016-12-04 08:22:11','K0001',4,'KLKL','ASA','T0002',6,100),
('T201612040004','2016-12-04 08:24:44','2016-12-04 08:25:57','2016-12-04 09:47:27','K0001',2,'KLKL','BBB','T0002',6,100),
('T201612040005','2016-12-04 09:43:02','2016-12-04 09:46:50','0000-00-00 00:00:00','K0001',2,'SASAS','NJKHKJK','T0002',4,0),
('T201612180006','2016-12-18 07:00:49','2016-12-18 07:25:21','2016-12-18 07:26:11','K0002',4,'TES','TES','T0001',6,100),
('T201612180007','2016-12-18 08:09:25','2016-12-18 08:17:45','2016-12-18 08:20:37','K0002',2,'RUSAK MONITOR','TOLONG CEPAT DI PROSES KARENA TIDAK ADA MONITOR BACKUP','T0001',6,0),
('T201612190008','2016-12-19 13:02:25','2016-12-19 13:03:37','2016-12-19 13:03:54','K0001',4,'NH','NH','T0001',6,100),
('T201612190009','2016-12-19 14:09:09','0000-00-00 00:00:00','0000-00-00 00:00:00','K0001',4,'GDGFGHH','ASDFGHJKL','',2,0),
('T201612190010','2016-12-19 14:35:33','2016-12-19 15:09:27','2016-12-19 15:09:59','K0001',2,'35535','53','T0001',6,100),
('T201612280011','2016-12-28 15:15:32','0000-00-00 00:00:00','0000-00-00 00:00:00','K0001',2,'6UYUGTY','NJHJHJHJHJHJHJ BHGHJG B JHJHJ JHJHJNN','T0001',3,0),
('T202307130012','2023-07-13 02:23:21','0000-00-00 00:00:00','0000-00-00 00:00:00','K0008',3,'MOUSE SUSAH UNTUK DIGERAKKAN','MOUSE SUDAH TERKELUPAS KABELNYA SEHINGGA SUDAH SANGAT LAYAK DIGANTI YANG BARU','',3,0),
('T202307130013','2023-07-13 03:22:46','2023-07-13 04:59:00','2023-07-13 04:59:16','K0008',6,'SIMRS TIDAK BS DIBUKA','SIMRS TIDAK BISA DIBUKA','T0004',6,100),
('T202307130014','2023-07-13 04:01:45','0000-00-00 00:00:00','0000-00-00 00:00:00','K0008',8,'INET MATI','BLABLABLA','',2,0);

/*Table structure for table `tracking` */

DROP TABLE IF EXISTS `tracking`;

CREATE TABLE `tracking` (
  `id_tracking` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) NOT NULL,
  `tanggal` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `id_user` varchar(5) NOT NULL,
  PRIMARY KEY (`id_tracking`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tracking` */

insert  into `tracking`(`id_tracking`,`id_ticket`,`tanggal`,`status`,`deskripsi`,`id_user`) values 
(1,'T201612020001','2016-12-02 16:59:18','Created Ticket','','K0001'),
(2,'T201612020001','2016-12-02 16:59:34','Ticket disetujui','','K0001'),
(3,'T201612020001','2016-12-02 16:59:55','Pemilihan Teknisi','Ticket Anda sudah di berikan kepada Teknisi','K0001'),
(4,'T201612020001','2016-12-02 17:00:39','Diproses oleh teknisi','','K0001'),
(5,'T201612020001','2016-12-02 17:01:32','Up Progress To 100 %','SELESAI SILAHKAN AMBIL','K0001'),
(6,'T201612020002','2016-12-02 17:05:29','Created Ticket','','K0001'),
(7,'T201612020002','2016-12-02 17:05:41','Ticket tidak disetujui','','K0001'),
(8,'T201612020002','2016-12-02 17:05:47','Ticket dikembalikan ke posisi belum di setujui','','K0001'),
(9,'T201612020002','2016-12-02 17:05:48','Ticket disetujui','','K0001'),
(10,'T201612020002','2016-12-02 17:06:08','Pemilihan Teknisi','Ticket Anda sudah di berikan kepada Teknisi','K0001'),
(11,'T201612020002','2016-12-02 17:06:35','Pending oleh teknisi','','K0001'),
(12,'T201612020002','2016-12-02 17:09:06','Diproses oleh teknisi','','K0001'),
(13,'T201612020002','2016-12-02 17:09:32','Up Progress To 90 %','','K0001'),
(14,'T201612020002','2016-12-04 06:32:39','Up Progress To 100 %','','K0001'),
(15,'T201612040003','2016-12-04 07:06:47','Created Ticket','','K0001'),
(16,'T201612040003','2016-12-04 08:19:03','Ticket disetujui','','K0001'),
(17,'T201612040003','2016-12-04 08:19:17','Pemilihan Teknisi','Ticket Anda sudah di berikan kepada Teknisi','K0001'),
(18,'T201612040003','2016-12-04 08:20:29','Diproses oleh teknisi','','K0001'),
(19,'T201612040003','2016-12-04 08:21:14','Up Progress To 10 %','','K0001'),
(20,'T201612040003','2016-12-04 08:22:11','Up Progress To 100 %','','K0001'),
(21,'T201612040004','2016-12-04 08:24:44','Created Ticket','','K0001'),
(22,'T201612040004','2016-12-04 08:25:04','Ticket disetujui','','K0001'),
(23,'T201612040004','2016-12-04 08:25:35','Pemilihan Teknisi','Ticket Anda sudah di berikan kepada Teknisi','K0001'),
(24,'T201612040004','2016-12-04 08:25:57','Diproses oleh teknisi','','K0001'),
(25,'T201612040004','2016-12-04 08:43:02','Up Progress To 10 %','MENUNGGU KOMPONEN MAINBOARD','K0001'),
(26,'T201612040005','2016-12-04 09:43:02','Created Ticket','','K0001'),
(27,'T201612040005','2016-12-04 09:44:22','Ticket tidak disetujui','','K0001'),
(28,'T201612040005','2016-12-04 09:44:23','Ticket tidak disetujui','','K0001'),
(29,'T201612040005','2016-12-04 09:44:35','Ticket dikembalikan ke posisi belum di setujui','','K0001'),
(30,'T201612040005','2016-12-04 09:44:37','Ticket disetujui','','K0001'),
(31,'T201612040005','2016-12-04 09:45:31','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(32,'T201612040005','2016-12-04 09:45:58','Pending oleh teknisi','','K0001'),
(33,'T201612040005','2016-12-04 09:46:50','Diproses oleh teknisi','','K0001'),
(34,'T201612040004','2016-12-04 09:47:27','Up Progress To 100 %','','K0001'),
(35,'T201612180006','2016-12-18 07:00:49','Created Ticket','','K0002'),
(36,'T201612180006','2016-12-18 07:01:49','Ticket disetujui','','K0001'),
(37,'T201612180006','2016-12-18 07:23:02','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(38,'T201612180006','2016-12-18 07:25:21','Diproses oleh teknisi','','K0003'),
(39,'T201612180006','2016-12-18 07:25:48','Up Progress To 10 %','','K0003'),
(40,'T201612180006','2016-12-18 07:25:58','Up Progress To 70 %','','K0003'),
(41,'T201612180006','2016-12-18 07:26:11','Up Progress To 100 %','SELESAI','K0003'),
(42,'T201612180007','2016-12-18 08:09:25','Created Ticket','','K0002'),
(43,'T201612180007','2016-12-18 08:11:12','Ticket disetujui','','K0005'),
(44,'T201612180007','2016-12-18 08:16:57','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(45,'T201612180007','2016-12-18 08:17:45','Diproses oleh teknisi','','K0003'),
(46,'T201612180007','2016-12-18 08:18:21','Up Progress To 70 %','TINGGAL TUNGGU KOMPONEN','K0003'),
(47,'T201612180007','2016-12-18 08:20:37','Up Progress To 100 %','SOLVED TINGGAL AMBIL','K0003'),
(48,'T201612190008','2016-12-19 13:02:25','Created Ticket','','K0001'),
(49,'T201612190008','2016-12-19 13:02:36','Ticket disetujui','','K0001'),
(50,'T201612190008','2016-12-19 13:02:53','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(51,'T201612190008','2016-12-19 13:03:37','Diproses oleh teknisi','','K0003'),
(52,'T201612190008','2016-12-19 13:03:54','Up Progress To 100 %','SELESAI','K0003'),
(53,'T201612190009','2016-12-19 14:09:09','Created Ticket','','K0001'),
(54,'T201612190009','2016-12-19 14:11:49','Ticket disetujui','','K0001'),
(55,'T201612190010','2016-12-19 14:35:33','Created Ticket','','K0001'),
(56,'T201612190010','2016-12-19 14:35:38','Ticket disetujui','','K0001'),
(57,'T201612190010','2016-12-19 14:47:17','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(58,'T201612190010','2016-12-19 15:09:27','Diproses oleh teknisi','','K0003'),
(59,'T201612190010','2016-12-19 15:09:44','Up Progress To 50 %','TGGU KOMP','K0003'),
(60,'T201612190010','2016-12-19 15:09:59','Up Progress To 100 %','OKJE','K0003'),
(61,'T201612280011','2016-12-28 15:15:32','Created Ticket','','K0001'),
(62,'T201612280011','2016-12-28 15:15:54','Ticket disetujui','','K0001'),
(63,'T201612280011','2016-12-28 15:16:46','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0001'),
(64,'T202307130012','2023-07-13 02:23:21','Created Ticket','','K0008'),
(65,'T202307130012','2023-07-13 02:23:52','Ticket disetujui','','K0008'),
(66,'T202307130012','2023-07-13 02:24:10','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0008'),
(67,'T202307130013','2023-07-13 03:22:46','Created Ticket','','K0008'),
(68,'T202307130013','2023-07-13 03:23:12','Ticket disetujui','','K0008'),
(69,'T202307130014','2023-07-13 04:01:45','Created Ticket','','K0008'),
(70,'T202307130013','2023-07-13 04:58:13','Pemilihan Teknisi','TICKET DIBERIKAN KEPADA TEKNISI','K0008'),
(71,'T202307130013','2023-07-13 04:59:00','Diproses oleh teknisi','','K0013'),
(72,'T202307130013','2023-07-13 04:59:16','Up Progress To 100 %','SUDAH DIKERJAKAN','K0013'),
(73,'T202307130014','2023-07-13 05:18:00','Ticket disetujui','','K0008');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(5) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`password`,`level`) values 
(2,'K0003','202cb962ac59075b964b07152d234b70','TEKNISI'),
(3,'K0002','202cb962ac59075b964b07152d234b70','USER'),
(4,'K0005','202cb962ac59075b964b07152d234b70','USER'),
(6,'K0002','21232f297a57a5a743894a0e4a801fc3','ADMIN'),
(7,'K0008','21232f297a57a5a743894a0e4a801fc3','ADMIN'),
(11,'K0009','e10adc3949ba59abbe56e057f20f883e','USER'),
(12,'K0010','2e40ad879e955201df4dedbf8d479a12','USER'),
(15,'K0012','e10adc3949ba59abbe56e057f20f883e','TEKNISI'),
(16,'K0013','843ea1a9d9986d775b5eb7138698c588','TEKNISI'),
(19,'K0014','2e40ad879e955201df4dedbf8d479a12','USER');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
