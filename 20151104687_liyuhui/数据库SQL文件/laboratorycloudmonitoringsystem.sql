/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : localhost:3306
 Source Schema         : laboratorycloudmonitoringsystem

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 06/03/2019 14:51:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for laboratory
-- ----------------------------
DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory`  (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tem_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`l_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of laboratory
-- ----------------------------
INSERT INTO `laboratory` VALUES (1, '人工智能实验室', '1', 1);
INSERT INTO `laboratory` VALUES (2, '机器人制作间', '2', 2);
INSERT INTO `laboratory` VALUES (3, '机器人训练场地', '3', 3);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'listLab', '查看实验室信息', '/listLab');
INSERT INTO `permission` VALUES (2, 'addLab', '添加实验室信息', '/addLab');
INSERT INTO `permission` VALUES (3, 'updateLab', '修改实验室信息', '/updateLab');
INSERT INTO `permission` VALUES (4, 'deleteLab', '删除实验室信息', '/deleteLab');
INSERT INTO `permission` VALUES (6, 'addStu', '添加学生信息', '/addStu');
INSERT INTO `permission` VALUES (7, 'updateStu', '修改学生信息', '/updateStu');
INSERT INTO `permission` VALUES (8, 'deleteStu', '删除学生信息', '/deleteStu');
INSERT INTO `permission` VALUES (9, 'listStu', '查看学生信息', '/listStu');
INSERT INTO `permission` VALUES (10, 'addTeach', '添加教师信息', '/addTeach');
INSERT INTO `permission` VALUES (11, 'updateTeach', '修改教师信息', '/updateTeach');
INSERT INTO `permission` VALUES (12, 'deleteTeach', '删除教师信息', '/deleteTeach');
INSERT INTO `permission` VALUES (13, 'listTeach', '查看教师信息', '/listTeach');
INSERT INTO `permission` VALUES (14, 'listRole', '查看角色信息', '/config/listRole');
INSERT INTO `permission` VALUES (15, 'listUser', '查看用户信息', '/config/listUser');
INSERT INTO `permission` VALUES (16, 'listPermission', '查看权限信息', '/config/listPermission');
INSERT INTO `permission` VALUES (17, 'editRole', '修改角色信息', '/config/editRole');
INSERT INTO `permission` VALUES (18, 'updateRole', '刷新角色信息', '/config/updateRole');
INSERT INTO `permission` VALUES (19, 'addRole', '添加角色信息', '/config/addRole');
INSERT INTO `permission` VALUES (20, 'deleteRole', '删除角色信息', '/config/deleteRole');
INSERT INTO `permission` VALUES (21, 'editPermission', '修改权限信息', '/config/editPermission');
INSERT INTO `permission` VALUES (22, 'updatePermission', '刷新权限信息', '/config/updatePermission');
INSERT INTO `permission` VALUES (23, 'addPermission', '添加权限信息', '/config/addPermission');
INSERT INTO `permission` VALUES (24, 'deletePermission', '删除权限信息', '/config/deletePermission');
INSERT INTO `permission` VALUES (25, 'editUser', '修改角色信息', '/config/editUser');
INSERT INTO `permission` VALUES (26, 'deleteUser', '删除角色信息', '/config/deleteUser');
INSERT INTO `permission` VALUES (27, 'updateUser', '刷新角色信息', '/config/updateUser');
INSERT INTO `permission` VALUES (28, 'addUser', '添加角色信息', '/config/addUser');

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `campus` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `building` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `house_id` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES (1, '1', '盛乐校区', '理工楼', '1208', '软件工程');
INSERT INTO `place` VALUES (2, '2', '盛乐校区', '理工楼', '1210', '软件工程');
INSERT INTO `place` VALUES (3, '3', '盛乐校区', '理工楼', '1212', '软件工程');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'teacher_pro', '实验室管理老师');
INSERT INTO `role` VALUES (2, 'teacher', '普通老师');
INSERT INTO `role` VALUES (3, 'student_pro', '实验室负责学生');
INSERT INTO `role` VALUES (4, 'student', '普通学生');
INSERT INTO `role` VALUES (5, 'administrators', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NULL DEFAULT NULL,
  `pid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1, 1);
INSERT INTO `role_permission` VALUES (2, 1, 2);
INSERT INTO `role_permission` VALUES (3, 1, 3);
INSERT INTO `role_permission` VALUES (4, 1, 4);
INSERT INTO `role_permission` VALUES (6, 1, 6);
INSERT INTO `role_permission` VALUES (7, 1, 7);
INSERT INTO `role_permission` VALUES (8, 1, 8);
INSERT INTO `role_permission` VALUES (9, 1, 9);
INSERT INTO `role_permission` VALUES (10, 1, 10);
INSERT INTO `role_permission` VALUES (11, 1, 11);
INSERT INTO `role_permission` VALUES (12, 1, 12);
INSERT INTO `role_permission` VALUES (13, 1, 13);
INSERT INTO `role_permission` VALUES (14, 2, 1);
INSERT INTO `role_permission` VALUES (15, 2, 6);
INSERT INTO `role_permission` VALUES (16, 2, 7);
INSERT INTO `role_permission` VALUES (17, 2, 8);
INSERT INTO `role_permission` VALUES (18, 2, 9);
INSERT INTO `role_permission` VALUES (19, 3, 1);
INSERT INTO `role_permission` VALUES (20, 3, 3);
INSERT INTO `role_permission` VALUES (21, 3, 6);
INSERT INTO `role_permission` VALUES (22, 3, 7);
INSERT INTO `role_permission` VALUES (23, 3, 8);
INSERT INTO `role_permission` VALUES (24, 3, 9);
INSERT INTO `role_permission` VALUES (25, 4, 1);
INSERT INTO `role_permission` VALUES (26, 5, 13);
INSERT INTO `role_permission` VALUES (27, 5, 12);
INSERT INTO `role_permission` VALUES (28, 5, 11);
INSERT INTO `role_permission` VALUES (29, 5, 10);
INSERT INTO `role_permission` VALUES (30, 5, 9);
INSERT INTO `role_permission` VALUES (31, 5, 8);
INSERT INTO `role_permission` VALUES (32, 5, 7);
INSERT INTO `role_permission` VALUES (33, 5, 6);
INSERT INTO `role_permission` VALUES (34, 5, 4);
INSERT INTO `role_permission` VALUES (35, 5, 3);
INSERT INTO `role_permission` VALUES (36, 5, 2);
INSERT INTO `role_permission` VALUES (37, 5, 1);
INSERT INTO `role_permission` VALUES (38, 5, 14);
INSERT INTO `role_permission` VALUES (39, 5, 15);
INSERT INTO `role_permission` VALUES (40, 5, 16);
INSERT INTO `role_permission` VALUES (41, 3, 15);
INSERT INTO `role_permission` VALUES (42, 1, 14);
INSERT INTO `role_permission` VALUES (43, 1, 15);
INSERT INTO `role_permission` VALUES (44, 3, 14);
INSERT INTO `role_permission` VALUES (45, 1, 16);
INSERT INTO `role_permission` VALUES (46, 5, 17);
INSERT INTO `role_permission` VALUES (47, 5, 18);
INSERT INTO `role_permission` VALUES (48, 5, 19);
INSERT INTO `role_permission` VALUES (49, 5, 20);
INSERT INTO `role_permission` VALUES (50, 5, 21);
INSERT INTO `role_permission` VALUES (51, 5, 22);
INSERT INTO `role_permission` VALUES (52, 5, 23);
INSERT INTO `role_permission` VALUES (53, 5, 24);
INSERT INTO `role_permission` VALUES (54, 5, 25);
INSERT INTO `role_permission` VALUES (55, 5, 26);
INSERT INTO `role_permission` VALUES (56, 5, 27);
INSERT INTO `role_permission` VALUES (57, 5, 28);

-- ----------------------------
-- Table structure for tem_hum
-- ----------------------------
DROP TABLE IF EXISTS `tem_hum`;
CREATE TABLE `tem_hum`  (
  `id` int(11) NOT NULL,
  `tem_id` int(11) NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `temperature` float(6, 0) NULL DEFAULT NULL,
  `humidity` float(6, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tem_hum
-- ----------------------------
INSERT INTO `tem_hum` VALUES (1, 1, '2019-01-19 10:42:33', 30, 52);
INSERT INTO `tem_hum` VALUES (2, 1, '2019-03-02 11:48:56', 28, 54);
INSERT INTO `tem_hum` VALUES (3, 2, '2019-03-02 11:49:19', 27, 50);
INSERT INTO `tem_hum` VALUES (4, 3, '2019-03-02 11:49:35', 26, 57);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '教师（管理）', 'teacher_test', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '男', 40, '112345', '1123@qq.com');
INSERT INTO `user` VALUES (2, '学生（管理）', 'student_test', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '女', 21, '122345', '1223@qq.com');
INSERT INTO `user` VALUES (3, '管理员', 'admin', 'c5012e9325c37d32cab7300ec84b6ec1', 'Bvf1BxvkoBvhq9LfO+LgPw==', '男', 41, '123345', '1233@qq.com');
INSERT INTO `user` VALUES (4, '学生1', 'student_1', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '女', 22, '12234511', '122311@qq.com');
INSERT INTO `user` VALUES (5, '学生2', 'student_2', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '男', 23, '12234522', '122322@qq.com');
INSERT INTO `user` VALUES (6, '教师1', 'teacher_1', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '女', 45, '11234511', '112311@qq.com');
INSERT INTO `user` VALUES (7, '教师2', 'teacher_2', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '男', 44, '11234522', '112322@qq.com');
INSERT INTO `user` VALUES (8, '123', '123', 'f2bca7d57037f2bff88b25b46d95036d', 'UWh/ouF4VvEz+KaQVUPXYw==', '男', 123, '123', '123');
INSERT INTO `user` VALUES (9, '456', '456', 'cdfcea1cd47119325f942b794c4595ab', 'bCigz2v5XtHyHHTkWg6N7w==', '男', 45, '456', '456');

-- ----------------------------
-- Table structure for user_lab
-- ----------------------------
DROP TABLE IF EXISTS `user_lab`;
CREATE TABLE `user_lab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NULL DEFAULT NULL,
  `l_id` int(11) NULL DEFAULT NULL,
  `u_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_lab
-- ----------------------------
INSERT INTO `user_lab` VALUES (1, 1, 1, '0');
INSERT INTO `user_lab` VALUES (2, 2, 1, '1');
INSERT INTO `user_lab` VALUES (3, 3, 1, '1');
INSERT INTO `user_lab` VALUES (4, 4, 1, '1');
INSERT INTO `user_lab` VALUES (5, 5, 1, '2');
INSERT INTO `user_lab` VALUES (6, 6, 1, '2');
INSERT INTO `user_lab` VALUES (7, 7, 1, '2');
INSERT INTO `user_lab` VALUES (8, 8, 1, '2');
INSERT INTO `user_lab` VALUES (9, 9, 1, '3');
INSERT INTO `user_lab` VALUES (10, 1, 2, '3');
INSERT INTO `user_lab` VALUES (11, 2, 2, '3');
INSERT INTO `user_lab` VALUES (12, 3, 2, '3');
INSERT INTO `user_lab` VALUES (13, 4, 2, '3');
INSERT INTO `user_lab` VALUES (14, 5, 2, '0');
INSERT INTO `user_lab` VALUES (15, 6, 2, '0');
INSERT INTO `user_lab` VALUES (16, 7, 2, '0');
INSERT INTO `user_lab` VALUES (17, 8, 2, '0');
INSERT INTO `user_lab` VALUES (18, 9, 2, '0');
INSERT INTO `user_lab` VALUES (19, 1, 3, '0');
INSERT INTO `user_lab` VALUES (20, 2, 3, '0');
INSERT INTO `user_lab` VALUES (21, 3, 3, '0');
INSERT INTO `user_lab` VALUES (22, 8, 3, '0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL,
  `rid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 3);
INSERT INTO `user_role` VALUES (3, 3, 5);
INSERT INTO `user_role` VALUES (4, 4, 4);
INSERT INTO `user_role` VALUES (5, 5, 4);
INSERT INTO `user_role` VALUES (6, 6, 2);
INSERT INTO `user_role` VALUES (7, 7, 2);
INSERT INTO `user_role` VALUES (8, 9, 4);
INSERT INTO `user_role` VALUES (14, 8, 5);
INSERT INTO `user_role` VALUES (15, 8, 4);

SET FOREIGN_KEY_CHECKS = 1;
