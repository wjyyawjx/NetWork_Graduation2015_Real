/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : biyesheji

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2019-02-26 19:32:03
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
  `theclass` varchar(255) default NULL COMMENT '班级',
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of athlet
-- ----------------------------
INSERT INTO `athlet` VALUES ('1', '李彦龙', '10', '1', '46', '200米跑', '一班');
INSERT INTO `athlet` VALUES ('2', '李浩鹏', '10', '2', '47', '200米跑', '二班');
INSERT INTO `athlet` VALUES ('3', '李天一', '10', '3', '34', '200米跑', '三班');
INSERT INTO `athlet` VALUES ('4', '李铁刚', '10', '4', '45', '200米跑', '四班');
INSERT INTO `athlet` VALUES ('5', '李君昊', '10', '5', '45', '200米跑', '五班');
INSERT INTO `athlet` VALUES ('6', '李国艳', '10', '6', '45', '200米跑', '六班');
INSERT INTO `athlet` VALUES ('7', '李恩德', '10', '7', '45', '200米跑', '七班');
INSERT INTO `athlet` VALUES ('8', '王满', '10', '1', '14', '100米跑', '八班');
INSERT INTO `athlet` VALUES ('9', '王琳', '10', '2', '16', '100米跑', '九班');
INSERT INTO `athlet` VALUES ('10', '王锐', '10', '3', '17', '100米跑', '一班');
INSERT INTO `athlet` VALUES ('11', '王艺博', '10', '4', '57', '100米跑', '二班');
INSERT INTO `athlet` VALUES ('12', '王满', '10', '5', '56', '100米跑', '三班');
INSERT INTO `athlet` VALUES ('13', '王琳', '10', '6', '56', '100米跑', '四班');
INSERT INTO `athlet` VALUES ('14', '王锐', '10', '1', '3', '跳高', '五班');
INSERT INTO `athlet` VALUES ('15', '王艺博', '10', '2', '4', '跳高', '六班');
INSERT INTO `athlet` VALUES ('16', '刘佳乐', '10', '3', '2', '跳高', '七班');
INSERT INTO `athlet` VALUES ('17', '刘慧娴', '10', '4', '4', '跳高', '八班');
INSERT INTO `athlet` VALUES ('18', '刘嘉源', '10', '5', '5', '跳高', '九班');
INSERT INTO `athlet` VALUES ('19', '刘盈锐', '10', '4', '7', '跳高', '一班');
INSERT INTO `athlet` VALUES ('20', '刘德华', '10', '6', '6', '跳高', '二班');
INSERT INTO `athlet` VALUES ('21', '刘娜', '10', '7', '4', '跳高', '三班');
INSERT INTO `athlet` VALUES ('22', '刘欣玥', '10', '1', '7', '跳远', '四班');
INSERT INTO `athlet` VALUES ('23', '刘晗玥', '10', '2', '5', '跳远', '五班');
INSERT INTO `athlet` VALUES ('24', '刘益嘉', '10', '3', '9', '跳远', '六班');
INSERT INTO `athlet` VALUES ('25', '刘如玥', '10', '4', '8', '跳远', '一班');
INSERT INTO `athlet` VALUES ('26', '刘兆祥', '10', '5', '6', '跳远', '二班');
INSERT INTO `athlet` VALUES ('27', '刘永昌', '10', '1', '7', '跳远', '三班');
INSERT INTO `athlet` VALUES ('28', '刘泽林', '10', '2', '8', '跳远', '四班');
INSERT INTO `athlet` VALUES ('29', '刘国佩', '10', '3', '9', '跳远', '五班');
INSERT INTO `athlet` VALUES ('30', '谢佳航', '10', '4', '3', '跳远', '六班');
INSERT INTO `athlet` VALUES ('31', '谢村忠', '10', '5', '4', '跳远', '七班');
INSERT INTO `athlet` VALUES ('32', '谢金默', '10', '1', '5', '铅球', '八班');
INSERT INTO `athlet` VALUES ('45', '谢遗韧', '10', '2', '6', '铅球', '九班');
INSERT INTO `athlet` VALUES ('46', '谢兰花', '10', '3', '8', '铅球', '一班');
INSERT INTO `athlet` VALUES ('47', '谢艾锡', '10', '4', '7', '铅球', '二班');
INSERT INTO `athlet` VALUES ('48', '谢八都', '10', '5', '8', '铅球', '三班');

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
  `usernaem` varchar(255) default NULL COMMENT '记录员名字',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('10', 'w', '内蒙古师范大学第一届', '2018-12-04 00:00:00', '2018-12-06 00:00:00');
INSERT INTO `game` VALUES ('11', 'w', '内蒙古师范大学第二届', '2018-12-07 00:00:00', '2018-12-08 00:00:00');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL auto_increment,
  `message` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '123', 'q');
INSERT INTO `message` VALUES ('2', 'qweqwe', 'q');
INSERT INTO `message` VALUES ('4', 's', 'q');
INSERT INTO `message` VALUES ('5', 'gsdfg', 'q');
INSERT INTO `message` VALUES ('6', '123123', 'q');

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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'qqqq@qq.com', '1111', '2');
INSERT INTO `user` VALUES ('2', 'q', 'q', '12312@qq.com', '234234', '0');
INSERT INTO `user` VALUES ('3', 'w', 'w', '345435@qq.com', '1', '1');
INSERT INTO `user` VALUES ('4', '20150000001', '000001', '123@qq.com', '11111111111', '0');
INSERT INTO `user` VALUES ('5', '20150000002', '000002', '124@qq.com', '11111111112', '0');
INSERT INTO `user` VALUES ('6', '20150000003', '000003', '125@qq.com', '11111111113', '0');
INSERT INTO `user` VALUES ('7', '20150000004', '000004', '126@qq.com', '11111111114', '0');
INSERT INTO `user` VALUES ('8', '20150000005', '000005', '127@qq.com', '11111111115', '0');
INSERT INTO `user` VALUES ('9', '20150000006', '000006', '128@qq.com', '11111111116', '0');
INSERT INTO `user` VALUES ('10', '20150000007', '000007', '129@qq.com', '11111111117', '0');
INSERT INTO `user` VALUES ('11', '20150000008', '000008', '130@qq.com', '11111111118', '0');
INSERT INTO `user` VALUES ('12', '20150000009', '000009', '131@qq.com', '11111111119', '0');
INSERT INTO `user` VALUES ('13', '20150000010', '000010', '132@qq.com', '11111111120', '0');
INSERT INTO `user` VALUES ('14', '20150000011', '000011', '133@qq.com', '11111111121', '0');
INSERT INTO `user` VALUES ('15', '20150000012', '000012', '134@qq.com', '11111111122', '0');
INSERT INTO `user` VALUES ('16', '20150000013', '000013', '135@qq.com', '11111111123', '0');
INSERT INTO `user` VALUES ('17', '20150000014', '000014', '136@qq.com', '11111111124', '0');
INSERT INTO `user` VALUES ('18', '20150000015', '000015', '137@qq.com', '11111111125', '0');
INSERT INTO `user` VALUES ('19', '20150000016', '000016', '138@qq.com', '11111111126', '0');
INSERT INTO `user` VALUES ('20', '20150000017', '000017', '139@qq.com', '11111111127', '0');
INSERT INTO `user` VALUES ('21', '20150000018', '000018', '140@qq.com', '11111111128', '0');
INSERT INTO `user` VALUES ('22', '20150000019', '000019', '141@qq.com', '11111111129', '0');
INSERT INTO `user` VALUES ('23', '20150000020', '000020', '142@qq.com', '11111111130', '0');
INSERT INTO `user` VALUES ('24', '20150000021', '000021', '143@qq.com', '11111111131', '0');
INSERT INTO `user` VALUES ('25', '20150000022', '000022', '144@qq.com', '11111111132', '0');
INSERT INTO `user` VALUES ('26', '20150000023', '000023', '145@qq.com', '11111111133', '0');
INSERT INTO `user` VALUES ('27', '20150000024', '000024', '146@qq.com', '11111111134', '0');
INSERT INTO `user` VALUES ('28', '20150000025', '000025', '147@qq.com', '11111111135', '0');
INSERT INTO `user` VALUES ('29', '20150000026', '000026', '148@qq.com', '11111111136', '0');
INSERT INTO `user` VALUES ('30', '20150000027', '000027', '149@qq.com', '11111111137', '0');
INSERT INTO `user` VALUES ('31', '20150000028', '000028', '150@qq.com', '11111111138', '0');
INSERT INTO `user` VALUES ('32', '20150000029', '000029', '151@qq.com', '11111111139', '0');
INSERT INTO `user` VALUES ('33', '20150000030', '000030', '152@qq.com', '11111111140', '0');
INSERT INTO `user` VALUES ('34', '20150000031', '000031', '153@qq.com', '11111111141', '0');
INSERT INTO `user` VALUES ('35', '20150000032', '000032', '154@qq.com', '11111111142', '0');
INSERT INTO `user` VALUES ('36', '20150000033', '000033', '155@qq.com', '11111111143', '0');
INSERT INTO `user` VALUES ('37', '20150000034', '000034', '156@qq.com', '11111111144', '0');
INSERT INTO `user` VALUES ('38', '20150000035', '000035', '157@qq.com', '11111111145', '0');
INSERT INTO `user` VALUES ('39', '20150000036', '000036', '158@qq.com', '11111111146', '0');
INSERT INTO `user` VALUES ('40', '20150000037', '000037', '159@qq.com', '11111111147', '0');
INSERT INTO `user` VALUES ('41', '20150000038', '000038', '160@qq.com', '11111111148', '0');
INSERT INTO `user` VALUES ('42', '20150000039', '000039', '161@qq.com', '11111111149', '0');
INSERT INTO `user` VALUES ('43', '20150000040', '000040', '162@qq.com', '11111111150', '0');
INSERT INTO `user` VALUES ('44', '20150000041', '000041', '163@qq.com', '11111111151', '0');
INSERT INTO `user` VALUES ('45', '20150000042', '000042', '164@qq.com', '11111111152', '0');
INSERT INTO `user` VALUES ('46', '20150000043', '000043', '165@qq.com', '11111111153', '0');
INSERT INTO `user` VALUES ('47', '20150000044', '000044', '166@qq.com', '11111111154', '0');
INSERT INTO `user` VALUES ('48', '20150000045', '000045', '167@qq.com', '11111111155', '0');
INSERT INTO `user` VALUES ('49', '20150000046', '000046', '168@qq.com', '11111111156', '0');
INSERT INTO `user` VALUES ('50', '20150000047', '000047', '169@qq.com', '11111111157', '0');
INSERT INTO `user` VALUES ('51', '20150000048', '000048', '170@qq.com', '11111111158', '0');
INSERT INTO `user` VALUES ('52', '20150000049', '000049', '171@qq.com', '11111111159', '0');
INSERT INTO `user` VALUES ('53', '20150000050', '000050', '172@qq.com', '11111111160', '0');
INSERT INTO `user` VALUES ('54', '20150000051', '000051', '173@qq.com', '11111111161', '0');
INSERT INTO `user` VALUES ('55', '20150000052', '000052', '174@qq.com', '11111111162', '0');
INSERT INTO `user` VALUES ('56', '20150000053', '000053', '175@qq.com', '11111111163', '0');
INSERT INTO `user` VALUES ('57', '20150000054', '000054', '176@qq.com', '11111111164', '0');
INSERT INTO `user` VALUES ('58', '20150000055', '000055', '177@qq.com', '11111111165', '0');
INSERT INTO `user` VALUES ('59', '20150000056', '000056', '178@qq.com', '11111111166', '0');
INSERT INTO `user` VALUES ('60', '20150000057', '000057', '179@qq.com', '11111111167', '0');
INSERT INTO `user` VALUES ('61', '20150000058', '000058', '180@qq.com', '11111111168', '0');
INSERT INTO `user` VALUES ('62', '20150000059', '000059', '181@qq.com', '11111111169', '0');
INSERT INTO `user` VALUES ('63', '20150000060', '000060', '182@qq.com', '11111111170', '0');
INSERT INTO `user` VALUES ('64', '20150000061', '000061', '183@qq.com', '11111111171', '0');
INSERT INTO `user` VALUES ('65', '20150000062', '000062', '184@qq.com', '11111111172', '0');
INSERT INTO `user` VALUES ('66', '20150000063', '000063', '185@qq.com', '11111111173', '0');
INSERT INTO `user` VALUES ('67', '20150000064', '000064', '186@qq.com', '11111111174', '0');
INSERT INTO `user` VALUES ('68', '20150000065', '000065', '187@qq.com', '11111111175', '0');
INSERT INTO `user` VALUES ('69', '20150000066', '000066', '188@qq.com', '11111111176', '0');
INSERT INTO `user` VALUES ('70', '20150000067', '000067', '189@qq.com', '11111111177', '0');
INSERT INTO `user` VALUES ('71', '20150000068', '000068', '190@qq.com', '11111111178', '0');
INSERT INTO `user` VALUES ('72', '20150000069', '000069', '191@qq.com', '11111111179', '0');
INSERT INTO `user` VALUES ('73', '20150000070', '000070', '192@qq.com', '11111111180', '0');
INSERT INTO `user` VALUES ('74', '20150000071', '000071', '193@qq.com', '11111111181', '0');
INSERT INTO `user` VALUES ('75', '20150000072', '000072', '194@qq.com', '11111111182', '0');
INSERT INTO `user` VALUES ('76', '20150000073', '000073', '195@qq.com', '11111111183', '0');
INSERT INTO `user` VALUES ('77', '20150000074', '000074', '196@qq.com', '11111111184', '0');
INSERT INTO `user` VALUES ('78', '20150000075', '000075', '197@qq.com', '11111111185', '0');
INSERT INTO `user` VALUES ('79', '20150000076', '000076', '198@qq.com', '11111111186', '0');
INSERT INTO `user` VALUES ('80', '20150000077', '000077', '199@qq.com', '11111111187', '0');
INSERT INTO `user` VALUES ('81', '20150000078', '000078', '200@qq.com', '11111111188', '0');
INSERT INTO `user` VALUES ('82', '20150000079', '000079', '201@qq.com', '11111111189', '0');
INSERT INTO `user` VALUES ('83', '20150000080', '000080', '202@qq.com', '11111111190', '0');
INSERT INTO `user` VALUES ('84', '20150000081', '000081', '203@qq.com', '11111111191', '0');
INSERT INTO `user` VALUES ('85', '20150000082', '000082', '204@qq.com', '11111111192', '0');
INSERT INTO `user` VALUES ('86', '20150000083', '000083', '205@qq.com', '11111111193', '0');
INSERT INTO `user` VALUES ('87', '20150000084', '000084', '206@qq.com', '11111111194', '0');
INSERT INTO `user` VALUES ('88', '20150000085', '000085', '207@qq.com', '11111111195', '0');
INSERT INTO `user` VALUES ('89', '20150000086', '000086', '208@qq.com', '11111111196', '0');
INSERT INTO `user` VALUES ('90', '20150000087', '000087', '209@qq.com', '11111111197', '0');
INSERT INTO `user` VALUES ('91', '20150000088', '000088', '210@qq.com', '11111111198', '0');
INSERT INTO `user` VALUES ('92', '20150000089', '000089', '211@qq.com', '11111111199', '0');
INSERT INTO `user` VALUES ('93', '20150000090', '000090', '212@qq.com', '11111111200', '0');
INSERT INTO `user` VALUES ('94', '20150000091', '000091', '213@qq.com', '11111111201', '0');
INSERT INTO `user` VALUES ('95', '20150000092', '000092', '214@qq.com', '11111111202', '0');
INSERT INTO `user` VALUES ('96', '20150000093', '000093', '215@qq.com', '11111111203', '0');
INSERT INTO `user` VALUES ('97', '20150000094', '000094', '216@qq.com', '11111111204', '0');
