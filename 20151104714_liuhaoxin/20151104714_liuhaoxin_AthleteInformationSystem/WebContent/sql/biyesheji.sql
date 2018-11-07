/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : biyesheji

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-10-22 09:36:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `pwd` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a', 'a');
