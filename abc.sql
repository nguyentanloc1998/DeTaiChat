-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: thongtinkhachhang
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banbe`
--

DROP TABLE IF EXISTS `banbe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banbe` (
  `id_friend` int NOT NULL AUTO_INCREMENT,
  `id_tk` int NOT NULL,
  `id_banbe` int NOT NULL,
  PRIMARY KEY (`id_friend`),
  KEY `id_tk` (`id_tk`),
  CONSTRAINT `banbe_ibfk_1` FOREIGN KEY (`id_tk`) REFERENCES `taikhoan` (`ma_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banbe`
--

LOCK TABLES `banbe` WRITE;
/*!40000 ALTER TABLE `banbe` DISABLE KEYS */;
INSERT INTO `banbe` VALUES (1,16,13),(2,13,16),(33,13,17),(34,17,13),(35,13,18),(39,16,18),(40,18,16);
/*!40000 ALTER TABLE `banbe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhom`
--

DROP TABLE IF EXISTS `nhom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhom` (
  `id_nhom` int NOT NULL AUTO_INCREMENT,
  `tennhom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `urlnhom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_chuphong` int DEFAULT NULL,
  PRIMARY KEY (`id_nhom`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhom`
--

LOCK TABLES `nhom` WRITE;
/*!40000 ALTER TABLE `nhom` DISABLE KEYS */;
INSERT INTO `nhom` VALUES (56,'demo','https://detaizalo.s3.ap-southeast-1.amazonaws.com/e53ea89e-eb46-4145-92a2-6237df8e03491637923701806.jpeg',13);
/*!40000 ALTER TABLE `nhom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('8-WG5TxVzFeCwx7_sN9EPl4t799AXRuW',1638008949,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuthenticated\":true,\"AuthUser\":{\"ma_tk\":13,\"ten_tk\":\"loc\",\"sdt\":\"12345\",\"email\":\"loc@gmail.com\",\"quyen\":\"cá nhân\",\"url\":\"https://detaizalo.s3.ap-southeast-1.amazonaws.com/30ece017-2314-4742-afb7-38e71fe2b6b01637772818829.jpeg\"}}'),('DLBG4o19C9YAgoNvVg5A_4GvDictWthZ',1638010210,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuthenticated\":true,\"AuthUser\":{\"ma_tk\":16,\"ten_tk\":\"loclavip123\",\"sdt\":\"0123\",\"email\":\"loc123@gmail.com\",\"quyen\":\"cá nhân\",\"url\":\"https://detaizalo.s3.ap-southeast-1.amazonaws.com/9fdd5374-3e8b-4d13-b9f0-b9385071b1931637664604907.jpeg\"}}'),('SHe6Kxg18Pecl0EncsDOGV7r0jneK1uF',1638035486,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuthenticated\":true,\"AuthUser\":{\"ma_tk\":13,\"ten_tk\":\"loc\",\"sdt\":\"12345\",\"email\":\"loc@gmail.com\",\"quyen\":\"cá nhân\",\"url\":\"https://detaizalo.s3.ap-southeast-1.amazonaws.com/30ece017-2314-4742-afb7-38e71fe2b6b01637772818829.jpeg\"}}'),('raqAZt_nwDKHSVVYO7krP8JrNeF1gabw',1638087350,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuthenticated\":true,\"AuthUser\":{\"ma_tk\":13,\"ten_tk\":\"loc\",\"sdt\":\"12345\",\"email\":\"loc@gmail.com\",\"quyen\":\"cá nhân\",\"url\":\"https://detaizalo.s3.ap-southeast-1.amazonaws.com/30ece017-2314-4742-afb7-38e71fe2b6b01637772818829.jpeg\"}}'),('uaROjDNz5a6NzxtyE05NaqDfVuCPOr-a',1638033016,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuthenticated\":true,\"AuthUser\":{\"ma_tk\":16,\"ten_tk\":\"loclavip123\",\"sdt\":\"0123\",\"email\":\"loc123@gmail.com\",\"quyen\":\"cá nhân\",\"url\":\"https://detaizalo.s3.ap-southeast-1.amazonaws.com/9fdd5374-3e8b-4d13-b9f0-b9385071b1931637664604907.jpeg\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `ma_tk` int NOT NULL AUTO_INCREMENT,
  `ten_tk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sdt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quyen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ma_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (13,'loc','12345','loc@gmail.com','$2a$04$hdX0PrKRKlkEHUV3sVkcrOg/0os0pd0lzgmTo3BCdRPu.o995NWxK','cá nhân','https://detaizalo.s3.ap-southeast-1.amazonaws.com/30ece017-2314-4742-afb7-38e71fe2b6b01637772818829.jpeg'),(16,'loclavip123','0123','loc123@gmail.com','$2a$04$jhad8r/OtSxlwEgvodacCepK4jr4sIUWneKR9n5LVo7fYiFQdtiE6','cá nhân','https://detaizalo.s3.ap-southeast-1.amazonaws.com/9fdd5374-3e8b-4d13-b9f0-b9385071b1931637664604907.jpeg'),(17,'tony','123456','tony1998@gmail.com','$2a$04$qTFI/xveZ8fV1l5K8cDSjuqWmtWaGzSKvzNtgs9etl9HNQK6Fze8m','cá nhân','https://detaizalo.s3.ap-southeast-1.amazonaws.com/40ff9abe-aea8-4c02-9d3a-7c0fa696c06b1637663202898.jpeg'),(18,'hoa','6789','loc@gmail','$2a$04$Zcj83XdNBpE3mkzJqsVty.6DT0ZrBxg7fbsxGShCJqFiXDumOa9lO','cá nhân','https://detaizalo.s3.ap-southeast-1.amazonaws.com/0d710c5e-055a-4dfa-b75e-91ebe0a42e531637817419356.png');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan_nhom`
--

DROP TABLE IF EXISTS `taikhoan_nhom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan_nhom` (
  `id_tk` int NOT NULL,
  `id_nhom` int NOT NULL,
  `noidung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoigian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loaitinnhan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  KEY `id_tk` (`id_tk`),
  KEY `taikhoan_nhom_ibfk_2` (`id_nhom`),
  CONSTRAINT `taikhoan_nhom_ibfk_1` FOREIGN KEY (`id_tk`) REFERENCES `taikhoan` (`ma_tk`),
  CONSTRAINT `taikhoan_nhom_ibfk_2` FOREIGN KEY (`id_nhom`) REFERENCES `nhom` (`id_nhom`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan_nhom`
--

LOCK TABLES `taikhoan_nhom` WRITE;
/*!40000 ALTER TABLE `taikhoan_nhom` DISABLE KEYS */;
INSERT INTO `taikhoan_nhom` VALUES (13,56,'Hi','26/11/2021 15:09:51','vanban','thu hồi'),(16,56,'Hi','26/11/2021 16:29:00','vanban','hoạt động'),(16,56,'hello','26/11/2021 16:33:34','vanban','thu hồi'),(13,56,'hello','26/11/2021 21:58:25','vanban','hoạt động'),(13,56,'a','26/11/2021 21:58:25','vanban','hoạt động'),(13,56,'a','26/11/2021 21:58:25','vanban','hoạt động'),(13,56,'a','26/11/2021 21:59:41','vanban','thu hồi'),(13,56,'có ai không','26/11/2021 21:59:41','vanban','thu hồi'),(13,56,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/e80e43a1-d07a-47ce-a720-94915ffefa841637938814779.jpeg','26/11/2021 21:59:41','hinhanh','thu hồi'),(13,56,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;De_01.doc;047cc8a9-0025-42d5-bdaf-d552d23f05a81637938820813.doc','26/11/2021 21:59:41','file','thu hồi'),(13,56,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/02b65814-2814-4d19-b15c-84045613bb411637938827659.mp4;video/mp4','26/11/2021 21:59:41','video','thu hồi'),(13,56,'hi','26/11/2021 21:59:41','vanban','thu hồi');
/*!40000 ALTER TABLE `taikhoan_nhom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thongbaoketban`
--

DROP TABLE IF EXISTS `thongbaoketban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongbaoketban` (
  `id_thongbao` int NOT NULL AUTO_INCREMENT,
  `id_tk` int NOT NULL,
  `noidung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_nguoigui` int NOT NULL,
  PRIMARY KEY (`id_thongbao`),
  KEY `id_tk` (`id_tk`),
  CONSTRAINT `thongbaoketban_ibfk_1` FOREIGN KEY (`id_tk`) REFERENCES `taikhoan` (`ma_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongbaoketban`
--

LOCK TABLES `thongbaoketban` WRITE;
/*!40000 ALTER TABLE `thongbaoketban` DISABLE KEYS */;
/*!40000 ALTER TABLE `thongbaoketban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinnhan`
--

DROP TABLE IF EXISTS `tinnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinnhan` (
  `id_tinnhan` int NOT NULL AUTO_INCREMENT,
  `id_tk` int NOT NULL,
  `id_nguoinhan` int NOT NULL,
  `noidung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoigian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loaitinnhan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tinnhan`),
  KEY `id_tk` (`id_tk`),
  CONSTRAINT `tinnhan_ibfk_1` FOREIGN KEY (`id_tk`) REFERENCES `taikhoan` (`ma_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinnhan`
--

LOCK TABLES `tinnhan` WRITE;
/*!40000 ALTER TABLE `tinnhan` DISABLE KEYS */;
INSERT INTO `tinnhan` VALUES (80,16,13,'ab','14/11/2021 12:54:32','vanban','hoạt động'),(81,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/be270fd0-3120-4ccb-9033-27804dbee69b1636882422418.jpeg','14/11/2021 16:33:36','hinhanh','hoạt động'),(82,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/08bd9e5e-17e1-4bb4-9677-ff4d7a28e4fc1636883389255.jpeg','14/11/2021 16:49:43','hinhanh','hoạt động'),(83,16,13,'hello','15/11/2021 00:00:03','vanban','hoạt động'),(84,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/ec0122c6-9671-4630-b935-de1ffc5f22f41636909280331.jpeg','15/11/2021 00:00:32','hinhanh','hoạt động'),(85,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/f0c76e45-00bc-409d-ac35-a8f3c78f646c1636954259045.jpeg','15/11/2021 12:30:49','hinhanh','hoạt động'),(86,13,16,'hello','15/11/2021 23:00:13','vanban','hoạt động'),(87,13,16,'mong','15/11/2021 23:00:45','vanban','hoạt động'),(88,13,16,'abcd','15/11/2021 23:01:53','vanban','hoạt động'),(90,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;Detai2021.pdf;d4f7edbb-5267-4286-8bf1-8f2ab4b1e6d01637040442347.pdf','16/11/2021 12:26:36','file','hoạt động'),(91,16,13,'alo','16/11/2021 12:36:09','vanban','hoạt động'),(92,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;ontapCMN.pdf;a59e2b71-38d4-4b82-9361-ed5edc1289e11637041034339.pdf','16/11/2021 12:36:09','file','hoạt động'),(96,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/d8ce4887-85ea-4e79-92ba-fc4116452b941637080276780.mp4;video/mp4','16/11/2021 23:31:11','video','hoạt động'),(97,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/93b3b6cf-24e3-4ca1-b653-a70331bde8e51637080882361.mp4;video/mp4','16/11/2021 23:41:11','video','hoạt động'),(98,16,13,'hello','16/11/2021 23:50:30','vanban','hoạt động'),(99,13,16,'hi','16/11/2021 23:50:58','vanban','hoạt động'),(100,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/67366fe8-8123-48ad-b8b8-393264c140191637081873538.jpeg','16/11/2021 23:57:35','hinhanh','thu hồi'),(101,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (1).docx;9a3d4588-47ef-4058-9434-f96568d88dd91637081934890.docx','16/11/2021 23:57:35','file','thu hồi'),(102,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/b694b14b-5e8e-49d3-b3de-77b2629ee8771637081955525.mp4;video/mp4','16/11/2021 23:57:35','video','thu hồi'),(103,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (1).docx;cbab0d7f-e61e-4d02-9aa0-ca19bf4da63d1637082132065.docx','17/11/2021 00:02:06','file','hoạt động'),(104,13,17,'hello','17/11/2021 00:02:52','vanban','hoạt động'),(105,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (1).docx;10500829-e56a-4a03-bf65-360c417ddc181637082276240.docx','17/11/2021 00:04:28','file','hoạt động'),(106,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (1).docx;58186116-f5de-4da4-ba84-9d58120f4fb71637082343137.docx','17/11/2021 00:05:39','file','hoạt động'),(107,13,17,' ngộ quá','17/11/2021 00:10:22','vanban','hoạt động'),(108,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;TỔNG HỢP 12 THÌ TOEIC.pdf;0ee4d46c-d3c9-4cdc-ba70-c9578e772ae41637082725037.pdf','17/11/2021 00:11:55','file','hoạt động'),(109,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/2117530a-fe6b-496d-b424-c3c843c83f531637082728640.mp4;video/mp4','17/11/2021 00:11:55','video','hoạt động'),(110,17,13,'1','17/11/2021 00:15:32','vanban','hoạt động'),(111,17,13,'2','17/11/2021 00:17:44','vanban','hoạt động'),(112,17,13,'3','17/11/2021 00:19:54','vanban','hoạt động'),(113,17,13,' a','17/11/2021 00:21:02','vanban','hoạt động'),(114,13,17,'hello','17/11/2021 11:48:11','vanban','hoạt động'),(115,13,17,'hi','17/11/2021 11:50:16','vanban','hoạt động'),(116,13,17,'a','17/11/2021 11:51:43','vanban','hoạt động'),(117,13,17,'a','17/11/2021 11:53:43','vanban','hoạt động'),(118,13,17,'mưa','17/11/2021 12:03:38','vanban','thu hồi'),(122,17,13,'hello','21/11/2021 17:37:17','vanban','hoạt động'),(123,17,13,'a','21/11/2021 17:37:17','vanban','hoạt động'),(124,17,13,'abc','21/11/2021 17:47:48','vanban','thu hồi'),(125,17,13,'helo','21/11/2021 17:52:09','vanban','thu hồi'),(126,17,13,'b','21/11/2021 17:52:09','vanban','thu hồi'),(127,17,13,'có ai không','21/11/2021 17:53:56','vanban','thu hồi'),(128,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/0f649f5d-9211-4929-963b-a84e31977a6f1637492056313.jpeg','21/11/2021 17:53:56','hinhanh','hoạt động'),(129,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/088d7990-d3ce-4232-904b-0fe2467d4f971637492075990.mp4;video/mp4','21/11/2021 17:53:56','video','hoạt động'),(130,17,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (5).docx;a510c541-3181-46b6-b9fb-e0d0fbc751461637492143332.docx','21/11/2021 17:55:34','file','hoạt động'),(131,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/ecff9dfa-1205-4bdc-824e-8b03d2f176e91637510657922.jpeg','21/11/2021 23:01:25','hinhanh','thu hồi'),(132,13,16,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/4a06a617-83d2-4c6f-b0f5-ac1a5ba4cd421637557296697.jpeg','22/11/2021 11:57:16','hinhanh','thu hồi'),(133,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/388db38b-71e6-4c9c-883b-63c6be2279881637557338560.jpeg','22/11/2021 12:01:57','hinhanh','thu hồi'),(134,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/b0ce0f33-7923-4d2d-b7dc-e8fa496d1afb1637558762720.mp4;video/mp4','22/11/2021 12:25:39','video','thu hồi'),(135,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;CNM_BTLON (2).docx;2d740b36-4de2-4b01-8ebf-d6e39b12e49b1637564388147.docx','22/11/2021 13:59:27','file','thu hồi'),(136,16,13,'hi','23/11/2021 14:02:49','vanban','thu hồi'),(137,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/1477e89c-b2b2-40ee-849a-2d7809b0b51a1637650988626.png','23/11/2021 14:02:49','hinhanh','thu hồi'),(138,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/;KêhoachKD.docx;f6052050-5b02-429d-9974-1c611ab8b0931637651002434.docx','23/11/2021 14:02:49','file','thu hồi'),(139,16,13,'https://detaizalo.s3.ap-southeast-1.amazonaws.com/deb1d379-a46d-4797-a205-f1e3cd8972561637651010385.mp4;video/mp4','23/11/2021 14:02:49','video','thu hồi'),(140,13,18,'hello','24/11/2021 23:43:02','vanban','hoạt động'),(141,16,18,'hi','25/11/2021 23:21:49','vanban','hoạt động');
/*!40000 ALTER TABLE `tinnhan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-27 15:41:33
