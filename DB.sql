/*
SQLyog Community v12.02 (32 bit)
MySQL - 5.5.29 : Database - ip
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ip` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ip`;

/*Table structure for table `file_logs` */

DROP TABLE IF EXISTS `file_logs`;

CREATE TABLE `file_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file` varchar(400) DEFAULT NULL,
  `sender_ip` varchar(100) DEFAULT NULL,
  `port_number` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `file_logs` */

insert  into `file_logs`(`id`,`file`,`sender_ip`,`port_number`,`time`,`date`,`status`,`details`) values (1,'Attacker Project.txt','192.168.1.6','2001','00:15:37 AM','05-Nov-2018','Success',NULL),(2,'a Test File.txt','192.168.1.6','2004','13:13:47 PM','05-Nov-2018','Success',NULL),(3,'A.txt','192.168.1.5','2007','00:26:12 AM','22-Nov-2018','Success',NULL),(4,'B.txt','192.168.1.5','2007','15:32:30 PM','02-Dec-2018','Success',NULL),(5,'C.txt','192.168.1.5','2002','15:47:09 PM','02-Dec-2018','Success',NULL),(6,'D.txt','192.168.1.5','2003','16:00:37 PM','02-Dec-2018','Success',NULL),(7,'sample.txt','192.168.1.5','2003','16:04:14 PM','02-Dec-2018','Success',NULL),(8,'new.txt','192.168.1.5','2005','16:12:30 PM','02-Dec-2018','Success',NULL),(9,'val.txt','192.168.1.5','2004','16:59:20 PM','02-Dec-2018','Success',NULL),(10,'sd.txt','192.168.1.5','2002','17:00:33 PM','02-Dec-2018','Success',NULL);

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) DEFAULT NULL,
  `user_name` varchar(150) DEFAULT NULL,
  `file_key` varchar(20) DEFAULT NULL,
  `file_name` varchar(150) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `files` */

insert  into `files`(`id`,`user_id`,`user_name`,`file_key`,`file_name`,`time`,`date`) values (1,'3','david','25625','CNN.java',NULL,NULL),(2,'3','david','54369','Layer.java','18:06:05 PM','09-Feb-2019');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`id`,`user_name`,`password`,`mobile`,`email`,`address`) values (1,'davidmesiya@gmail.com','davidinesh','9788862743','bluearisetechnology@gmail.com','7/4, Bhujanga Rao St,Suriyammapet,'),(2,'davidmesiya@gmail.com','davidinesh','9788862743','bluearisetechnology@gmail.com','7/4, Bhujanga Rao St,Suriyammapet,'),(3,'david','david','9788862743','bluearisetechnology@gmail.com','7/4, Bhujanga Rao St,Suriyammapet,');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
