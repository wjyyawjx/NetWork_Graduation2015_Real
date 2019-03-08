/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.28 : Database - toy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`toy` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toy`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `user_id` varchar(100) DEFAULT NULL,
  `address_id` varchar(100) NOT NULL,
  `address_name` varchar(100) DEFAULT NULL,
  `address_details` varchar(100) DEFAULT NULL,
  `address_photo` varchar(100) DEFAULT NULL,
  `address_people` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `address` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `car_id` varchar(100) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `toy_id` varchar(100) DEFAULT NULL,
  `car_total` decimal(10,2) DEFAULT NULL,
  `car_num` int(100) DEFAULT NULL,
  `car_endtime` date DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`car_id`,`user_id`,`toy_id`,`car_total`,`car_num`,`car_endtime`) values ('2432517626ac48c39f2ba38104b385de','2','c347e13d24c444a1b37e6eafa45fea7e',NULL,1,'2019-01-03'),('4b6d7c557df24fcfb9626d119255e52c','7ae6eabddc874f41a401f0106c5918de','c347e13d24c444a1b37e6eafa45fea7e',NULL,1,'2018-12-05'),('fc1ec98f19d545039c228945bf47a5fb','2','c347e13d24c444a1b37e6eafa45fea7e',NULL,1,'2018-12-11');

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `toy_id` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `collect_id` varchar(100) NOT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

insert  into `collect`(`toy_id`,`user_id`,`collect_id`) values ('0fcde118850d4e1895b3312c7e012fb2','','57e9af0cb11847a3a6a3c4a685e6f089');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` varchar(100) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `toy_id` varchar(100) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_time` date DEFAULT NULL,
  `comment_photo` varchar(100) DEFAULT NULL,
  `comment_evaluate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `overdue` */

DROP TABLE IF EXISTS `overdue`;

CREATE TABLE `overdue` (
  `overdue_id` varchar(100) NOT NULL,
  `overdue_time` varchar(100) DEFAULT NULL,
  `overdue_money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`overdue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `overdue` */

insert  into `overdue`(`overdue_id`,`overdue_time`,`overdue_money`) values ('1','1-3','20.00'),('2','4-7','50.00'),('3','8-99999999','100.00');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` varchar(100) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `payment_time` date DEFAULT NULL,
  `payment_money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`user_id`,`payment_time`,`payment_money`) values ('18','1','2018-11-13','239.97'),('19','1','2018-11-13','79.99'),('20','1','2018-11-13','149.98'),('21','3','2018-11-13','120.00'),('3','1','2018-11-06','159.98'),('4','1','2018-11-06','399.95'),('6efb7f9f95a4446dad3d3b6e827a762b','1','2018-11-16','79.99');

/*Table structure for table `photo` */

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
  `photo_id` varchar(100) NOT NULL,
  `photo_path` varchar(500) DEFAULT NULL,
  `photo_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photo` */

insert  into `photo`(`photo_id`,`photo_path`,`photo_remark`) values ('cb846f286e4c4c9f803411041d17dac3','upload/xc0comtmgo35seviri4c.jpg',NULL);

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `record_id` varchar(100) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `toy_id` varchar(100) DEFAULT NULL,
  `overdue_id` varchar(100) DEFAULT NULL,
  `record_time` date DEFAULT NULL,
  `record_endTime` date DEFAULT NULL,
  `record_state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

/*Table structure for table `toy` */

DROP TABLE IF EXISTS `toy`;

CREATE TABLE `toy` (
  `toy_id` varchar(100) NOT NULL,
  `type_id` varchar(100) DEFAULT NULL,
  `photo_id` varchar(100) DEFAULT NULL,
  `toy_name` varchar(100) DEFAULT NULL,
  `toy_introduce` varchar(100) DEFAULT NULL,
  `toy_age` int(100) DEFAULT NULL,
  `toy_money` decimal(10,2) DEFAULT NULL,
  `toy_deposit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`toy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `toy` */

insert  into `toy`(`toy_id`,`type_id`,`photo_id`,`toy_name`,`toy_introduce`,`toy_age`,`toy_money`,`toy_deposit`) values ('c347e13d24c444a1b37e6eafa45fea7e','1','cb846f286e4c4c9f803411041d17dac3','A','dsad',1,'1.00','1.00');

/*Table structure for table `toytype` */

DROP TABLE IF EXISTS `toytype`;

CREATE TABLE `toytype` (
  `type_id` varchar(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `toytype` */

insert  into `toytype`(`type_id`,`type_name`) values ('1','男童玩具'),('2','女童玩具'),('3','积木类'),('4','机器人'),('5','汽车电机'),('6','飞行机器');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_psw` varchar(100) DEFAULT NULL,
  `user_credit` decimal(10,0) DEFAULT NULL,
  `user_type` int(10) DEFAULT NULL,
  `user_Phone` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `real_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_psw`,`user_credit`,`user_type`,`user_Phone`,`user_email`,`real_name`) values ('1','a764181403','19990708','100',3,'13755146206','764181403@qq.com','伍捷'),('109539c5c2bb49639fc563cc7d7566a8','admin11111','123456',NULL,3,NULL,'123@qq.com','伍捷'),('2','admin','123456',NULL,3,NULL,NULL,NULL),('25aef709219743fd85bdcd9004b6882d','a1234561','19990708',NULL,3,NULL,'123@qq.com',NULL),('3','admin1','123456',NULL,1,'13755146206','123@qq.com',NULL),('39a1a1e846314303987155cf2bd51292','admin111','123456',NULL,3,NULL,'123@qq.com',NULL),('7ae6eabddc874f41a401f0106c5918de','123','123123',NULL,1,'13333333333','123@123.com',NULL),('a45451085ff242ff94c42f7becfd5f8c','a123456','123456',NULL,3,NULL,'123@qq.com',NULL),('a76028ec4ca348bd85b1afaf13b5b4e9','1111','111111111',NULL,1,'13333333333','12@112.cn',NULL),('b96ea9323b7248c990cd282047541a20','admin123','123456',NULL,3,NULL,'123@qq.com',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
