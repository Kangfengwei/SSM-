/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.29 : Database - company
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`company` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `company`;

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `announcementId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `announcementName` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `announcementTime` varchar(50) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`announcementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `announcement` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseId` int(10) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(10) NOT NULL COMMENT '课程名称',
  `integral` int(10) DEFAULT NULL COMMENT '课程积分',
  `courseType` varchar(10) DEFAULT NULL COMMENT '课程类型(PPT、视屏)',
  `studyType` varchar(10) DEFAULT NULL COMMENT '学习类型(选修、必修)',
  `studyStatus` varchar(10) DEFAULT NULL COMMENT '学习状态(1.已学习、2.学习中、3.未学习)',
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentId` int(10) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(10) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `employeesId` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `employeestype` int(10) DEFAULT NULL COMMENT '1.领导、2.员工、3.后台管理',
  `departmentId` int(10) DEFAULT NULL COMMENT '部门id',
  `integral` decimal(10,1) DEFAULT NULL COMMENT '积分id',
  `test` int(10) DEFAULT NULL COMMENT '试题id',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `registTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `introduce` varchar(220) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`employeesId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

insert  into `employees`(`employeesId`,`userName`,`password`,`name`,`sex`,`phone`,`employeestype`,`departmentId`,`integral`,`test`,`email`,`registTime`,`introduce`) values 
(1,'admin','123','苏闻君','男','113135154',3,1,10.0,1,'12343221@163.com','2019-09-28 14:28:41','这个管理员很懒'),
(2,'kfw','123','梁梦雅','女','13643452213',2,1,15.0,1,'123@qq.com','2019-10-09 14:28:43','苏闻君 '),
(5,'ww','q','唐雨欣','女','15035689083',2,NULL,0.0,NULL,'123489@qq.com','2019-10-14 15:13:45','程小贱太狗'),
(9,'11','12','12','男','1231312',2,1,3.0,1,'123489@qq.com','2019-12-16 20:58:45','1');

/*Table structure for table `integral` */

DROP TABLE IF EXISTS `integral`;

CREATE TABLE `integral` (
  `integralId` int(10) NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `totalIntegral` int(10) DEFAULT NULL COMMENT '总积分',
  `employessId` int(10) DEFAULT NULL COMMENT '员工id',
  PRIMARY KEY (`integralId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `integral` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `orderId` varchar(50) NOT NULL COMMENT '订单编号',
  `employeesId` int(10) DEFAULT NULL COMMENT '员工id',
  `productId` int(10) DEFAULT NULL COMMENT '商品id',
  `buyTime` varchar(50) DEFAULT NULL COMMENT '兑换时间',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `productIntegral` int(10) DEFAULT NULL COMMENT '商品积分',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `questionId` int(10) NOT NULL AUTO_INCREMENT COMMENT '反馈问题id',
  `questionName` varchar(255) DEFAULT NULL COMMENT '问题说明',
  `employeesId` int(10) DEFAULT NULL COMMENT '反馈员工id',
  `questionTime` timestamp NULL DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`questionId`,`questionName`,`employeesId`,`questionTime`) values 
(1,'五楼厕所需要维修',1,'2019-10-15 09:11:10'),
(2,'星期二下午开会',2,'2019-10-15 14:04:33'),
(3,'啦啦啦',3,'2019-10-08 14:04:46');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `testId` int(10) NOT NULL AUTO_INCREMENT COMMENT '试题id',
  `testName` varchar(10) DEFAULT NULL COMMENT '试题名称',
  `employessId` int(10) DEFAULT NULL COMMENT '员工id',
  `testTime` varchar(50) DEFAULT NULL COMMENT '考试时间',
  `testScore` double DEFAULT NULL COMMENT '考试成绩',
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
