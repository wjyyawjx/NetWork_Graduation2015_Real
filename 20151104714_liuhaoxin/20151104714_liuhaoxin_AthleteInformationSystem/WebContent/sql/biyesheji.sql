/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : biyesheji

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-12-17 18:43:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for athlet
-- ----------------------------
DROP TABLE IF EXISTS `athlet`;
CREATE TABLE `athlet` (
  `tid` int(11) NOT NULL auto_increment COMMENT '存储运动员信息',
  `athletusername` varchar(255) default NULL COMMENT '记录运动员名字',
  `tsid` int(11) default NULL COMMENT '运动会id，记录运动员是那一届运动会',
  `ranking` varchar(255) default NULL COMMENT '记录运动员排名信息',
  `results` varchar(255) default NULL COMMENT '记录运动员成绩信息',
  `events` varchar(255) default NULL COMMENT '记录运动员比赛项目',
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of athlet
-- ----------------------------
INSERT INTO `athlet` VALUES ('1', '内蒙古师范大学', null, '内蒙古师范大学', '内蒙古师范大学', '内蒙古师范大学');

-- ----------------------------
-- Table structure for contactmanagement
-- ----------------------------
DROP TABLE IF EXISTS `contactmanagement`;
CREATE TABLE `contactmanagement` (
  `cid` int(11) NOT NULL auto_increment,
  `reason` varchar(255) default NULL COMMENT '用来说明情况',
  `username` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contactmanagement
-- ----------------------------
INSERT INTO `contactmanagement` VALUES ('1', '士大夫大师傅士大夫', 'asd', '士大夫');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `eid` int(11) NOT NULL auto_increment COMMENT '记录运动会的比赛项目',
  `usernaem` varchar(255) default NULL COMMENT '教练员名字',
  `evens` varchar(255) default NULL COMMENT '比赛项目',
  PRIMARY KEY  (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `sid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL COMMENT '记录员用户名',
  `gamesname` varchar(255) default NULL COMMENT '运动会名称',
  `startTime` datetime default NULL,
  `stopTime` datetime default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', 'w', '内蒙古师范大学第一届运动会', '2018-12-07 00:00:00', '2018-12-08 00:00:00');
INSERT INTO `game` VALUES ('10', 'w', '内蒙古师范大学第一届', '2018-12-04 00:00:00', '2018-12-06 00:00:00');
INSERT INTO `game` VALUES ('11', 'w', '内蒙古师范大学第二届', '2018-12-07 00:00:00', '2018-12-08 00:00:00');
INSERT INTO `game` VALUES ('12', 'w', '内蒙古师范大学第三届', '2018-12-05 00:00:00', '2018-12-15 00:00:00');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL auto_increment,
  `message` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '123', 'q');
INSERT INTO `message` VALUES ('2', 'qweqwe', 'q');
INSERT INTO `message` VALUES ('4', 's', 'q');
INSERT INTO `message` VALUES ('5', '无钱无权', 'q');

-- ----------------------------
-- Table structure for toapplyfor
-- ----------------------------
DROP TABLE IF EXISTS `toapplyfor`;
CREATE TABLE `toapplyfor` (
  `aid` int(11) NOT NULL auto_increment,
  `reason` varchar(255) default NULL COMMENT '理由',
  `username` varchar(255) default NULL,
  `state` varchar(255) default '审核中' COMMENT ' 申请的状态',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of toapplyfor
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `pwd` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `permission` varchar(255) default '0' COMMENT '权限的设置，0代表普通用户，1代表记录员，2代表管理员',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'qqqq@qq.com', '1111', '2');
INSERT INTO `user` VALUES ('2', 'q', 'ww', '12312@qq.com', '234234', '0');
INSERT INTO `user` VALUES ('3', 'w', 'w', '345435@qq.com', '123123', '1');
INSERT INTO `user` VALUES ('4', 'qw', '1', '123@qq.com', '3243', '1');
INSERT INTO `user` VALUES ('5', '123123', '123', '123123@qq.com', '123', '1');
INSERT INTO `user` VALUES ('6', '123', '123', '31231@qq.com', '123', '-1');
INSERT INTO `user` VALUES ('7', 'dsfd', 'sd', '12321@qq.com', '456', '-1');
