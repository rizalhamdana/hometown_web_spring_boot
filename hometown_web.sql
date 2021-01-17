-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hometown_web
-- ------------------------------------------------------
-- Server version	5.7.32-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'News'),(2,'Nature'),(3,'Shopping'),(4,'History'),(5,'Cultural');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` tinytext,
  `travel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_travel_idx` (`travel_id`),
  KEY `comment_user_idx` (`user_id`),
  CONSTRAINT `comment_travel` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`travel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Hello ',5,1),(2,'Hello juga rizal',5,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `contents` text,
  `thumbnail` varchar(45) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `category_news_idx` (`category`),
  KEY `category_user_idx` (`user`),
  CONSTRAINT `category_news` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Jibaku Prajurit Marinir Evakuasi Korban Banjir di Dekat Rawa Habitat Buaya','<p>TEST</p>\r\n','088929300_1609611247-MARINIR.jpg',1,1,'2021-01-17');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `contents` text,
  `thumbnail` varchar(45) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  PRIMARY KEY (`travel_id`),
  KEY `travel_user_idx` (`user`),
  KEY `_idx` (`category`),
  CONSTRAINT `` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `travel_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (5,'Kampong Teripang','<p>Kampong Teripang yang kini telah resmi dibuka di Kabupaten Bintan, Provinsi Kepulauan Riau, menjadi salah satu kawasan desa dengan konsep pengelolaan dan pengembangan potensi maritim yang ada diwilayah Kepri, salah satunya pengelolaan teripang serta pengolahan berbagai hasil laut lainnya.</p>\r\n\r\n<p>Peresmian tersebut langsung dihadiri oleh Gubernur Kepulauan Riau Nurdin Basirun bersama Kemenko Maritim, KKP dan Pemkab Bintan.</p>\r\n\r\n<p>Nurdin Basirun mengungkapkan pendirian Kampong Teripang adalah hal yang bagus dalam upaya pengembangan kemaritiman. Apalagi Kepri sendiri memiliki potensi laut yang begitu besar sebagai daerah perbatasan.</p>\r\n\r\n<p>&quot;Potensi alam kita sangat bagus. Ini menjadi tugas para akademisi yang ada di Kepri untuk mengembangkan. Selain itu masyarakat juga. Kita punya kekayaan laut yang melimpah, masih banyak yang belum dikembangkan,&quot; kata Nurdin Basirun, Gubernur Kepri, Sabtu, (27/4).</p>\r\n\r\n<p>Komisaris Kampong Teripang, Yogi Ari mengatakan kehadiran Kampong Teripang merupakan edu ekologi wisata bahari, dan menjadi ikon baru Kabupaten Bintan, yang terletak di Teluk Bakau.</p>\r\n\r\n<p>&quot;Ini akan jadi ikon baru untuk kita di Bintan, tepatnya di Teluk Bakau. Jadi bagi yang datang ke Bintan, belum lengkap rasanya jika tidak mampir kesini,&quot; jelasnya saat memberikan kata sambutan.</p>\r\n\r\n<p>Rangkaian acara peresmiannya diisi dengan Festival Kuliner berbahan teripang. Yang diikuti peserta dari berbagai daerah salah duanya adalah Tanjungpinang, Bintan dan Batam.</p>\r\n\r\n<p>Festival masakan itu sendiri diadakan bertujuan untuk mempopulerkan teripang sebagai makanan yang bernilai gizi tinggi.</p>\r\n\r\n<p>Selain dilombakan, panitia juga mengajak para tamu yang hadir untuk mencicipi kuliner yang di masak oleh chef Kampong Teripang.</p>\r\n\r\n<p>&ldquo;Di restoran kita ada atraksi langsung mengolah teripang menjadi masakan. Ada dua menu yaitu Lakse dan nasi goreng,&rdquo; tambahnya.</p>\r\n\r\n<p>Yogi juga menuturkann kedepannya akan ada sejumlah kegiatan untuk wisatawan. Aktivitas tersebut merupakan bagian dari edukasi mengenai teripang. Contohnya adalah mengajak para pengunjung yang datang ke kampung tersebut untuk berkarang, membudidayakan, dan melihat langsung proses ektraksi teripang menjadi produk setengah jadi.</p>\r\n\r\n<p>Penulis : Mily</p>\r\n','Logo-KT-1@4x.png',1,2,0,0);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `password` tinytext,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rizalhamdana','Rizal Hamdan','Arigusti','21mei1998','ari.gusti12@gmai.com','admin','tour.jpg'),(2,'fadliri','Fadli','Rahmat I.','1234','hydshsh88@gmail.com','member','default.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-17 22:07:38
