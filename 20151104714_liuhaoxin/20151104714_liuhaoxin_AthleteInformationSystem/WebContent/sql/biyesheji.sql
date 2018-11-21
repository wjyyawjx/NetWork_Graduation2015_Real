/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : biyesheji

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-11-16 16:29:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sportsday
-- ----------------------------
DROP TABLE IF EXISTS `sportsday`;
CREATE TABLE `sportsday` (
  `sid` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sportsday
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of toapplyfor
-- ----------------------------
INSERT INTO `toapplyfor` VALUES ('3', '1231111111111111111111111111111111111111dsfasdfasdfas nbfihe8rh8wq79efqwjqwcjqwedqweyjc87qwcyjef8qcwyeyfqw7ycef8yqwce7ry32743241234', 'asd', '已审核，未通过，理由如下：差点');
INSERT INTO `toapplyfor` VALUES ('4', '我是10班的', 'q', '审核中');
INSERT INTO `toapplyfor` VALUES ('5', '快快快', 'q', '审核中');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '123@qq.com', '1341233', '2');
INSERT INTO `user` VALUES ('2', 'q', 'q', '12312@qq.com', '123', '0');
INSERT INTO `user` VALUES ('3', 'w', 'w', '345435@qq.com', '123123', '1');
INSERT INTO `user` VALUES ('4', 'qw', '1', '123@qq.com', '3243', '1');
INSERT INTO `user` VALUES ('5', '123123', '123', '123123@qq.com', '123', '0');
INSERT INTO `user` VALUES ('6', '123', '123', '31231@qq.com', '123', '0');
