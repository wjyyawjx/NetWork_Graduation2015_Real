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

 Date: 20/03/2019 17:42:09
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of laboratory
-- ----------------------------
INSERT INTO `laboratory` VALUES (1, '人工智能实验室', '1', 1);
INSERT INTO `laboratory` VALUES (2, '机器人制作间', '2', 2);
INSERT INTO `laboratory` VALUES (3, '机器人训练场地', '3', 3);
INSERT INTO `laboratory` VALUES (8, '123', '4', NULL);
INSERT INTO `laboratory` VALUES (9, '企鹅', '4', NULL);

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
INSERT INTO `permission` VALUES (1, 'listLab', '查看实验室信息', '/config/listLab');
INSERT INTO `permission` VALUES (2, 'addLab', '添加实验室信息', '/config/addLab');
INSERT INTO `permission` VALUES (3, 'updateLab', '修改实验室信息', '/config/editLab');
INSERT INTO `permission` VALUES (4, 'deleteLab', '删除实验室信息', '/config/deleteLab');
INSERT INTO `permission` VALUES (6, 'addStu', '添加学生信息', '/config/addStu');
INSERT INTO `permission` VALUES (7, 'updateStu', '修改学生信息', '/updateStu');
INSERT INTO `permission` VALUES (8, 'deleteStu', '删除学生信息', '/deleteStu');
INSERT INTO `permission` VALUES (9, 'listStu', '查看学生信息', '/listStu');
INSERT INTO `permission` VALUES (10, 'addTeach', '添加教师信息', '/config/addTeach');
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
INSERT INTO `permission` VALUES (22, 'updatePermission', '刷新权限信息', '/comfig/updatePermission');
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES (1, '1', '盛乐校区', '理工楼', '1208', '软件工程');
INSERT INTO `place` VALUES (2, '2', '盛乐校区', '理工楼', '1210', '软件工程');
INSERT INTO `place` VALUES (3, '3', '盛乐校区', '理工楼', '1214', '软件工程');
INSERT INTO `place` VALUES (5, '4', '赛罕校区', '信息技术楼', '306', '计算机科学与技术');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `role_permission` VALUES (41, 3, 15);
INSERT INTO `role_permission` VALUES (42, 1, 14);
INSERT INTO `role_permission` VALUES (43, 1, 15);
INSERT INTO `role_permission` VALUES (44, 3, 14);
INSERT INTO `role_permission` VALUES (45, 1, 16);
INSERT INTO `role_permission` VALUES (58, 8, 28);
INSERT INTO `role_permission` VALUES (193, 5, 28);
INSERT INTO `role_permission` VALUES (194, 5, 27);
INSERT INTO `role_permission` VALUES (195, 5, 26);
INSERT INTO `role_permission` VALUES (196, 5, 25);
INSERT INTO `role_permission` VALUES (197, 5, 24);
INSERT INTO `role_permission` VALUES (198, 5, 23);
INSERT INTO `role_permission` VALUES (199, 5, 22);
INSERT INTO `role_permission` VALUES (200, 5, 21);
INSERT INTO `role_permission` VALUES (201, 5, 20);
INSERT INTO `role_permission` VALUES (202, 5, 19);
INSERT INTO `role_permission` VALUES (203, 5, 18);
INSERT INTO `role_permission` VALUES (204, 5, 17);
INSERT INTO `role_permission` VALUES (205, 5, 16);
INSERT INTO `role_permission` VALUES (206, 5, 15);
INSERT INTO `role_permission` VALUES (207, 5, 14);
INSERT INTO `role_permission` VALUES (208, 5, 13);
INSERT INTO `role_permission` VALUES (209, 5, 12);
INSERT INTO `role_permission` VALUES (210, 5, 11);
INSERT INTO `role_permission` VALUES (211, 5, 10);
INSERT INTO `role_permission` VALUES (212, 5, 9);
INSERT INTO `role_permission` VALUES (213, 5, 8);
INSERT INTO `role_permission` VALUES (214, 5, 7);
INSERT INTO `role_permission` VALUES (215, 5, 6);
INSERT INTO `role_permission` VALUES (216, 5, 4);
INSERT INTO `role_permission` VALUES (217, 5, 3);
INSERT INTO `role_permission` VALUES (218, 5, 2);
INSERT INTO `role_permission` VALUES (219, 5, 1);
INSERT INTO `role_permission` VALUES (220, 6, 28);
INSERT INTO `role_permission` VALUES (221, 6, 27);
INSERT INTO `role_permission` VALUES (222, 6, 26);
INSERT INTO `role_permission` VALUES (223, 6, 25);
INSERT INTO `role_permission` VALUES (224, 6, 24);
INSERT INTO `role_permission` VALUES (225, 6, 23);
INSERT INTO `role_permission` VALUES (226, 6, 22);
INSERT INTO `role_permission` VALUES (227, 6, 21);
INSERT INTO `role_permission` VALUES (228, 6, 20);
INSERT INTO `role_permission` VALUES (229, 6, 19);
INSERT INTO `role_permission` VALUES (230, 6, 18);
INSERT INTO `role_permission` VALUES (231, 6, 17);
INSERT INTO `role_permission` VALUES (232, 6, 16);
INSERT INTO `role_permission` VALUES (233, 6, 15);
INSERT INTO `role_permission` VALUES (234, 6, 14);
INSERT INTO `role_permission` VALUES (235, 6, 13);
INSERT INTO `role_permission` VALUES (236, 6, 12);
INSERT INTO `role_permission` VALUES (237, 6, 11);
INSERT INTO `role_permission` VALUES (238, 6, 10);
INSERT INTO `role_permission` VALUES (239, 6, 9);
INSERT INTO `role_permission` VALUES (240, 6, 8);
INSERT INTO `role_permission` VALUES (241, 6, 7);
INSERT INTO `role_permission` VALUES (242, 6, 6);
INSERT INTO `role_permission` VALUES (243, 6, 4);
INSERT INTO `role_permission` VALUES (244, 6, 3);
INSERT INTO `role_permission` VALUES (245, 6, 2);
INSERT INTO `role_permission` VALUES (246, 6, 1);

-- ----------------------------
-- Table structure for tem_hum
-- ----------------------------
DROP TABLE IF EXISTS `tem_hum`;
CREATE TABLE `tem_hum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_id` int(11) NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `temperature` float(6, 0) NULL DEFAULT NULL,
  `humidity` float(6, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 570 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tem_hum
-- ----------------------------
INSERT INTO `tem_hum` VALUES (1, 1, '2019-01-19 10:42:33', 30, 52);
INSERT INTO `tem_hum` VALUES (2, 1, '2019-03-02 11:48:56', 28, 54);
INSERT INTO `tem_hum` VALUES (3, 1, '2019-03-02 11:49:19', 27, 50);
INSERT INTO `tem_hum` VALUES (4, 1, '2019-03-02 11:49:35', 26, 57);
INSERT INTO `tem_hum` VALUES (5, 1, '2019-03-02 11:49:19', 25, 50);
INSERT INTO `tem_hum` VALUES (6, 1, '2019-03-02 11:49:19', 24, 47);
INSERT INTO `tem_hum` VALUES (7, 1, '2019-03-02 11:49:19', 23, 52);
INSERT INTO `tem_hum` VALUES (8, 1, '2019-03-02 11:49:19', 23, 50);
INSERT INTO `tem_hum` VALUES (9, 1, '2019-03-02 11:49:19', 25, 9);
INSERT INTO `tem_hum` VALUES (10, 1, '2019-03-02 11:49:19', 24, 51);
INSERT INTO `tem_hum` VALUES (11, 1, '2019-03-02 11:49:19', 22, 53);
INSERT INTO `tem_hum` VALUES (12, 1, '2019-03-02 11:49:19', 21, 52);
INSERT INTO `tem_hum` VALUES (13, 1, '2019-03-02 11:49:19', 27, 51);
INSERT INTO `tem_hum` VALUES (14, 1, '2019-03-02 11:49:19', 25, 53);
INSERT INTO `tem_hum` VALUES (15, 1, '2019-03-02 11:49:19', 25, 53);
INSERT INTO `tem_hum` VALUES (16, 1, '2019-03-02 11:49:19', 24, 51);
INSERT INTO `tem_hum` VALUES (17, 1, '2019-03-02 11:49:19', 22, 53);
INSERT INTO `tem_hum` VALUES (18, 1, '2019-03-02 11:49:19', 21, 52);
INSERT INTO `tem_hum` VALUES (19, 1, '2019-03-02 11:49:19', 27, 51);
INSERT INTO `tem_hum` VALUES (31, 1, '2019-03-20 17:07:27', 23, 5);
INSERT INTO `tem_hum` VALUES (32, 1, '2019-03-20 17:11:39', 23, 5);
INSERT INTO `tem_hum` VALUES (33, 2, '2019-03-20 17:12:39', 23, 5);
INSERT INTO `tem_hum` VALUES (34, 3, '2019-03-20 17:13:39', 23, 5);
INSERT INTO `tem_hum` VALUES (35, 1, '2019-03-20 17:14:39', 23, 5);
INSERT INTO `tem_hum` VALUES (36, 2, '2019-03-20 17:15:39', 23, 5);
INSERT INTO `tem_hum` VALUES (37, 1, '2019-03-20 17:17:32', 25, 29);
INSERT INTO `tem_hum` VALUES (38, 2, '2019-03-20 17:18:31', 24, 28);
INSERT INTO `tem_hum` VALUES (39, 1, '2019-03-20 17:20:36', 22, 17);
INSERT INTO `tem_hum` VALUES (40, 2, '2019-03-20 17:21:36', 22, 17);
INSERT INTO `tem_hum` VALUES (41, 3, '2019-03-20 17:22:36', 29, 85);
INSERT INTO `tem_hum` VALUES (42, 1, '2019-03-20 17:23:36', 33, 95);
INSERT INTO `tem_hum` VALUES (43, 2, '2019-03-20 17:24:36', 27, 95);
INSERT INTO `tem_hum` VALUES (44, 1, '2019-03-20 17:25:53', 23, 45);
INSERT INTO `tem_hum` VALUES (45, 2, '2019-03-20 17:25:54', 23, 45);
INSERT INTO `tem_hum` VALUES (46, 3, '2019-03-20 17:25:55', 23, 43);
INSERT INTO `tem_hum` VALUES (47, 1, '2019-03-20 17:25:56', 23, 43);
INSERT INTO `tem_hum` VALUES (48, 2, '2019-03-20 17:25:57', 23, 43);
INSERT INTO `tem_hum` VALUES (49, 3, '2019-03-20 17:25:58', 23, 43);
INSERT INTO `tem_hum` VALUES (50, 1, '2019-03-20 17:25:59', 23, 42);
INSERT INTO `tem_hum` VALUES (51, 2, '2019-03-20 17:26:00', 23, 42);
INSERT INTO `tem_hum` VALUES (52, 3, '2019-03-20 17:26:01', 22, 42);
INSERT INTO `tem_hum` VALUES (53, 1, '2019-03-20 17:26:02', 22, 42);
INSERT INTO `tem_hum` VALUES (54, 2, '2019-03-20 17:26:03', 22, 41);
INSERT INTO `tem_hum` VALUES (55, 3, '2019-03-20 17:26:04', 22, 41);
INSERT INTO `tem_hum` VALUES (56, 1, '2019-03-20 17:26:05', 22, 41);
INSERT INTO `tem_hum` VALUES (57, 2, '2019-03-20 17:26:06', 22, 41);
INSERT INTO `tem_hum` VALUES (58, 3, '2019-03-20 17:26:07', 22, 40);
INSERT INTO `tem_hum` VALUES (59, 1, '2019-03-20 17:26:08', 22, 40);
INSERT INTO `tem_hum` VALUES (60, 2, '2019-03-20 17:26:09', 22, 39);
INSERT INTO `tem_hum` VALUES (61, 3, '2019-03-20 17:26:10', 22, 39);
INSERT INTO `tem_hum` VALUES (62, 1, '2019-03-20 17:26:12', 22, 39);
INSERT INTO `tem_hum` VALUES (63, 2, '2019-03-20 17:26:13', 22, 39);
INSERT INTO `tem_hum` VALUES (64, 3, '2019-03-20 17:26:14', 22, 38);
INSERT INTO `tem_hum` VALUES (65, 1, '2019-03-20 17:26:15', 22, 38);
INSERT INTO `tem_hum` VALUES (66, 2, '2019-03-20 17:26:16', 22, 38);
INSERT INTO `tem_hum` VALUES (67, 3, '2019-03-20 17:26:17', 22, 38);
INSERT INTO `tem_hum` VALUES (68, 1, '2019-03-20 17:26:18', 22, 38);
INSERT INTO `tem_hum` VALUES (69, 2, '2019-03-20 17:26:19', 22, 38);
INSERT INTO `tem_hum` VALUES (70, 3, '2019-03-20 17:26:20', 22, 37);
INSERT INTO `tem_hum` VALUES (71, 1, '2019-03-20 17:26:21', 22, 37);
INSERT INTO `tem_hum` VALUES (72, 2, '2019-03-20 17:26:22', 22, 37);
INSERT INTO `tem_hum` VALUES (73, 3, '2019-03-20 17:26:23', 22, 37);
INSERT INTO `tem_hum` VALUES (74, 1, '2019-03-20 17:26:24', 22, 36);
INSERT INTO `tem_hum` VALUES (75, 2, '2019-03-20 17:26:25', 22, 36);
INSERT INTO `tem_hum` VALUES (76, 3, '2019-03-20 17:26:26', 22, 35);
INSERT INTO `tem_hum` VALUES (77, 1, '2019-03-20 17:26:27', 22, 35);
INSERT INTO `tem_hum` VALUES (78, 2, '2019-03-20 17:26:28', 22, 40);
INSERT INTO `tem_hum` VALUES (79, 3, '2019-03-20 17:26:29', 22, 40);
INSERT INTO `tem_hum` VALUES (80, 1, '2019-03-20 17:26:30', 27, 95);
INSERT INTO `tem_hum` VALUES (81, 2, '2019-03-20 17:26:31', 27, 95);
INSERT INTO `tem_hum` VALUES (82, 3, '2019-03-20 17:26:32', 29, 95);
INSERT INTO `tem_hum` VALUES (83, 1, '2019-03-20 17:26:33', 29, 95);
INSERT INTO `tem_hum` VALUES (84, 2, '2019-03-20 17:26:34', 29, 95);
INSERT INTO `tem_hum` VALUES (85, 3, '2019-03-20 17:26:35', 29, 95);
INSERT INTO `tem_hum` VALUES (86, 1, '2019-03-20 17:26:37', 29, 95);
INSERT INTO `tem_hum` VALUES (87, 2, '2019-03-20 17:26:38', 29, 95);
INSERT INTO `tem_hum` VALUES (88, 3, '2019-03-20 17:26:39', 28, 95);
INSERT INTO `tem_hum` VALUES (89, 1, '2019-03-20 17:26:40', 28, 95);
INSERT INTO `tem_hum` VALUES (90, 2, '2019-03-20 17:26:41', 28, 95);
INSERT INTO `tem_hum` VALUES (91, 3, '2019-03-20 17:26:42', 28, 95);
INSERT INTO `tem_hum` VALUES (92, 1, '2019-03-20 17:26:43', 27, 95);
INSERT INTO `tem_hum` VALUES (93, 2, '2019-03-20 17:26:44', 27, 95);
INSERT INTO `tem_hum` VALUES (94, 3, '2019-03-20 17:26:45', 27, 95);
INSERT INTO `tem_hum` VALUES (95, 1, '2019-03-20 17:26:46', 27, 95);
INSERT INTO `tem_hum` VALUES (96, 2, '2019-03-20 17:26:47', 27, 95);
INSERT INTO `tem_hum` VALUES (97, 3, '2019-03-20 17:26:48', 27, 95);
INSERT INTO `tem_hum` VALUES (98, 1, '2019-03-20 17:26:49', 26, 95);
INSERT INTO `tem_hum` VALUES (99, 2, '2019-03-20 17:26:50', 26, 95);
INSERT INTO `tem_hum` VALUES (100, 3, '2019-03-20 17:26:51', 26, 95);
INSERT INTO `tem_hum` VALUES (101, 1, '2019-03-20 17:26:52', 26, 95);
INSERT INTO `tem_hum` VALUES (102, 2, '2019-03-20 17:26:53', 26, 81);
INSERT INTO `tem_hum` VALUES (103, 3, '2019-03-20 17:26:54', 26, 81);
INSERT INTO `tem_hum` VALUES (104, 1, '2019-03-20 17:26:55', 25, 82);
INSERT INTO `tem_hum` VALUES (105, 2, '2019-03-20 17:26:56', 25, 82);
INSERT INTO `tem_hum` VALUES (106, 3, '2019-03-20 17:26:57', 25, 83);
INSERT INTO `tem_hum` VALUES (107, 1, '2019-03-20 17:26:58', 25, 83);
INSERT INTO `tem_hum` VALUES (108, 2, '2019-03-20 17:26:59', 25, 84);
INSERT INTO `tem_hum` VALUES (109, 3, '2019-03-20 17:27:01', 25, 84);
INSERT INTO `tem_hum` VALUES (110, 1, '2019-03-20 17:27:02', 25, 84);
INSERT INTO `tem_hum` VALUES (111, 2, '2019-03-20 17:27:03', 25, 84);
INSERT INTO `tem_hum` VALUES (112, 3, '2019-03-20 17:27:04', 24, 95);
INSERT INTO `tem_hum` VALUES (113, 1, '2019-03-20 17:27:05', 24, 95);
INSERT INTO `tem_hum` VALUES (114, 2, '2019-03-20 17:27:06', 24, 95);
INSERT INTO `tem_hum` VALUES (115, 3, '2019-03-20 17:27:07', 24, 95);
INSERT INTO `tem_hum` VALUES (116, 1, '2019-03-20 17:27:08', 24, 95);
INSERT INTO `tem_hum` VALUES (117, 2, '2019-03-20 17:27:09', 24, 95);
INSERT INTO `tem_hum` VALUES (118, 3, '2019-03-20 17:27:10', 24, 95);
INSERT INTO `tem_hum` VALUES (119, 1, '2019-03-20 17:27:11', 24, 95);
INSERT INTO `tem_hum` VALUES (120, 2, '2019-03-20 17:27:12', 24, 95);
INSERT INTO `tem_hum` VALUES (121, 3, '2019-03-20 17:27:13', 24, 95);
INSERT INTO `tem_hum` VALUES (122, 1, '2019-03-20 17:27:14', 24, 95);
INSERT INTO `tem_hum` VALUES (123, 2, '2019-03-20 17:27:15', 24, 95);
INSERT INTO `tem_hum` VALUES (124, 3, '2019-03-20 17:27:16', 24, 95);
INSERT INTO `tem_hum` VALUES (125, 1, '2019-03-20 17:27:17', 24, 95);
INSERT INTO `tem_hum` VALUES (126, 2, '2019-03-20 17:27:18', 23, 95);
INSERT INTO `tem_hum` VALUES (127, 3, '2019-03-20 17:27:19', 23, 95);
INSERT INTO `tem_hum` VALUES (128, 1, '2019-03-20 17:27:20', 23, 95);
INSERT INTO `tem_hum` VALUES (129, 2, '2019-03-20 17:27:21', 23, 95);
INSERT INTO `tem_hum` VALUES (130, 3, '2019-03-20 17:27:22', 23, 95);
INSERT INTO `tem_hum` VALUES (131, 1, '2019-03-20 17:27:23', 23, 95);
INSERT INTO `tem_hum` VALUES (132, 2, '2019-03-20 17:27:24', 23, 95);
INSERT INTO `tem_hum` VALUES (133, 3, '2019-03-20 17:27:26', 23, 95);
INSERT INTO `tem_hum` VALUES (134, 1, '2019-03-20 17:27:27', 23, 95);
INSERT INTO `tem_hum` VALUES (135, 2, '2019-03-20 17:27:28', 23, 95);
INSERT INTO `tem_hum` VALUES (136, 3, '2019-03-20 17:27:29', 23, 92);
INSERT INTO `tem_hum` VALUES (137, 1, '2019-03-20 17:27:30', 23, 92);
INSERT INTO `tem_hum` VALUES (138, 2, '2019-03-20 17:27:31', 23, 86);
INSERT INTO `tem_hum` VALUES (139, 3, '2019-03-20 17:27:32', 23, 86);
INSERT INTO `tem_hum` VALUES (140, 1, '2019-03-20 17:27:33', 23, 82);
INSERT INTO `tem_hum` VALUES (141, 2, '2019-03-20 17:27:34', 23, 82);
INSERT INTO `tem_hum` VALUES (142, 3, '2019-03-20 17:27:35', 23, 80);
INSERT INTO `tem_hum` VALUES (143, 1, '2019-03-20 17:27:36', 23, 80);
INSERT INTO `tem_hum` VALUES (144, 2, '2019-03-20 17:27:37', 23, 77);
INSERT INTO `tem_hum` VALUES (145, 3, '2019-03-20 17:27:38', 23, 77);
INSERT INTO `tem_hum` VALUES (146, 1, '2019-03-20 17:27:39', 23, 75);
INSERT INTO `tem_hum` VALUES (147, 2, '2019-03-20 17:27:40', 23, 75);
INSERT INTO `tem_hum` VALUES (148, 3, '2019-03-20 17:27:41', 23, 73);
INSERT INTO `tem_hum` VALUES (149, 1, '2019-03-20 17:27:42', 23, 73);
INSERT INTO `tem_hum` VALUES (150, 2, '2019-03-20 17:27:43', 23, 70);
INSERT INTO `tem_hum` VALUES (151, 3, '2019-03-20 17:27:44', 23, 70);
INSERT INTO `tem_hum` VALUES (152, 1, '2019-03-20 17:27:45', 23, 67);
INSERT INTO `tem_hum` VALUES (153, 2, '2019-03-20 17:27:46', 23, 67);
INSERT INTO `tem_hum` VALUES (154, 3, '2019-03-20 17:27:47', 23, 65);
INSERT INTO `tem_hum` VALUES (155, 1, '2019-03-20 17:27:48', 23, 65);
INSERT INTO `tem_hum` VALUES (156, 2, '2019-03-20 17:27:49', 23, 63);
INSERT INTO `tem_hum` VALUES (157, 3, '2019-03-20 17:27:51', 23, 63);
INSERT INTO `tem_hum` VALUES (158, 1, '2019-03-20 17:27:52', 23, 59);
INSERT INTO `tem_hum` VALUES (159, 2, '2019-03-20 17:27:53', 23, 59);
INSERT INTO `tem_hum` VALUES (160, 3, '2019-03-20 17:27:54', 23, 56);
INSERT INTO `tem_hum` VALUES (161, 1, '2019-03-20 17:27:55', 23, 56);
INSERT INTO `tem_hum` VALUES (162, 2, '2019-03-20 17:27:56', 23, 54);
INSERT INTO `tem_hum` VALUES (163, 3, '2019-03-20 17:27:57', 23, 54);
INSERT INTO `tem_hum` VALUES (164, 1, '2019-03-20 17:27:58', 23, 53);
INSERT INTO `tem_hum` VALUES (165, 2, '2019-03-20 17:27:59', 23, 53);
INSERT INTO `tem_hum` VALUES (166, 3, '2019-03-20 17:28:00', 23, 51);
INSERT INTO `tem_hum` VALUES (167, 1, '2019-03-20 17:28:01', 23, 51);
INSERT INTO `tem_hum` VALUES (168, 2, '2019-03-20 17:28:02', 23, 49);
INSERT INTO `tem_hum` VALUES (169, 3, '2019-03-20 17:28:03', 23, 49);
INSERT INTO `tem_hum` VALUES (170, 1, '2019-03-20 17:28:04', 23, 47);
INSERT INTO `tem_hum` VALUES (171, 2, '2019-03-20 17:28:05', 23, 47);
INSERT INTO `tem_hum` VALUES (172, 3, '2019-03-20 17:28:06', 23, 45);
INSERT INTO `tem_hum` VALUES (173, 1, '2019-03-20 17:28:07', 23, 45);
INSERT INTO `tem_hum` VALUES (174, 2, '2019-03-20 17:28:08', 23, 44);
INSERT INTO `tem_hum` VALUES (175, 3, '2019-03-20 17:28:09', 23, 44);
INSERT INTO `tem_hum` VALUES (176, 1, '2019-03-20 17:28:10', 23, 42);
INSERT INTO `tem_hum` VALUES (177, 2, '2019-03-20 17:28:11', 23, 42);
INSERT INTO `tem_hum` VALUES (178, 3, '2019-03-20 17:28:12', 23, 41);
INSERT INTO `tem_hum` VALUES (179, 1, '2019-03-20 17:28:13', 23, 41);
INSERT INTO `tem_hum` VALUES (180, 2, '2019-03-20 17:28:14', 23, 41);
INSERT INTO `tem_hum` VALUES (181, 3, '2019-03-20 17:28:16', 23, 41);
INSERT INTO `tem_hum` VALUES (182, 1, '2019-03-20 17:28:17', 22, 41);
INSERT INTO `tem_hum` VALUES (183, 2, '2019-03-20 17:28:18', 22, 41);
INSERT INTO `tem_hum` VALUES (184, 3, '2019-03-20 17:28:19', 22, 40);
INSERT INTO `tem_hum` VALUES (185, 1, '2019-03-20 17:28:20', 22, 40);
INSERT INTO `tem_hum` VALUES (186, 2, '2019-03-20 17:28:21', 22, 39);
INSERT INTO `tem_hum` VALUES (187, 3, '2019-03-20 17:28:22', 22, 39);
INSERT INTO `tem_hum` VALUES (188, 1, '2019-03-20 17:28:23', 22, 37);
INSERT INTO `tem_hum` VALUES (189, 2, '2019-03-20 17:28:24', 22, 37);
INSERT INTO `tem_hum` VALUES (190, 3, '2019-03-20 17:28:25', 22, 36);
INSERT INTO `tem_hum` VALUES (191, 1, '2019-03-20 17:28:26', 22, 36);
INSERT INTO `tem_hum` VALUES (192, 2, '2019-03-20 17:28:27', 22, 35);
INSERT INTO `tem_hum` VALUES (193, 3, '2019-03-20 17:28:28', 22, 35);
INSERT INTO `tem_hum` VALUES (194, 1, '2019-03-20 17:28:29', 22, 36);
INSERT INTO `tem_hum` VALUES (195, 2, '2019-03-20 17:28:30', 22, 36);
INSERT INTO `tem_hum` VALUES (196, 3, '2019-03-20 17:28:31', 22, 36);
INSERT INTO `tem_hum` VALUES (197, 1, '2019-03-20 17:28:32', 22, 36);
INSERT INTO `tem_hum` VALUES (198, 2, '2019-03-20 17:28:33', 22, 36);
INSERT INTO `tem_hum` VALUES (199, 3, '2019-03-20 17:28:34', 22, 36);
INSERT INTO `tem_hum` VALUES (200, 1, '2019-03-20 17:28:35', 22, 35);
INSERT INTO `tem_hum` VALUES (201, 2, '2019-03-20 17:28:36', 22, 35);
INSERT INTO `tem_hum` VALUES (202, 3, '2019-03-20 17:28:37', 22, 35);
INSERT INTO `tem_hum` VALUES (203, 1, '2019-03-20 17:28:38', 22, 35);
INSERT INTO `tem_hum` VALUES (204, 2, '2019-03-20 17:28:40', 22, 35);
INSERT INTO `tem_hum` VALUES (205, 3, '2019-03-20 17:28:41', 22, 35);
INSERT INTO `tem_hum` VALUES (206, 1, '2019-03-20 17:28:42', 22, 34);
INSERT INTO `tem_hum` VALUES (207, 2, '2019-03-20 17:28:43', 22, 34);
INSERT INTO `tem_hum` VALUES (208, 3, '2019-03-20 17:28:44', 22, 34);
INSERT INTO `tem_hum` VALUES (209, 1, '2019-03-20 17:28:45', 22, 34);
INSERT INTO `tem_hum` VALUES (210, 2, '2019-03-20 17:28:46', 22, 34);
INSERT INTO `tem_hum` VALUES (211, 3, '2019-03-20 17:28:47', 22, 34);
INSERT INTO `tem_hum` VALUES (212, 1, '2019-03-20 17:28:48', 22, 34);
INSERT INTO `tem_hum` VALUES (213, 2, '2019-03-20 17:28:49', 22, 34);
INSERT INTO `tem_hum` VALUES (214, 3, '2019-03-20 17:28:50', 22, 33);
INSERT INTO `tem_hum` VALUES (215, 1, '2019-03-20 17:28:51', 22, 33);
INSERT INTO `tem_hum` VALUES (216, 2, '2019-03-20 17:28:52', 22, 32);
INSERT INTO `tem_hum` VALUES (217, 3, '2019-03-20 17:28:53', 22, 32);
INSERT INTO `tem_hum` VALUES (218, 1, '2019-03-20 17:28:54', 22, 32);
INSERT INTO `tem_hum` VALUES (219, 2, '2019-03-20 17:28:55', 22, 32);
INSERT INTO `tem_hum` VALUES (220, 3, '2019-03-20 17:28:56', 22, 32);
INSERT INTO `tem_hum` VALUES (221, 1, '2019-03-20 17:28:57', 22, 32);
INSERT INTO `tem_hum` VALUES (222, 2, '2019-03-20 17:28:58', 22, 31);
INSERT INTO `tem_hum` VALUES (223, 3, '2019-03-20 17:28:59', 22, 31);
INSERT INTO `tem_hum` VALUES (224, 1, '2019-03-20 17:29:00', 22, 31);
INSERT INTO `tem_hum` VALUES (225, 2, '2019-03-20 17:29:01', 22, 31);
INSERT INTO `tem_hum` VALUES (226, 3, '2019-03-20 17:29:02', 22, 31);
INSERT INTO `tem_hum` VALUES (227, 1, '2019-03-20 17:29:03', 22, 31);
INSERT INTO `tem_hum` VALUES (228, 2, '2019-03-20 17:29:05', 22, 30);
INSERT INTO `tem_hum` VALUES (229, 3, '2019-03-20 17:29:06', 22, 30);
INSERT INTO `tem_hum` VALUES (230, 1, '2019-03-20 17:29:07', 22, 31);
INSERT INTO `tem_hum` VALUES (231, 2, '2019-03-20 17:29:08', 22, 31);
INSERT INTO `tem_hum` VALUES (232, 3, '2019-03-20 17:29:09', 22, 30);
INSERT INTO `tem_hum` VALUES (233, 1, '2019-03-20 17:29:10', 22, 30);
INSERT INTO `tem_hum` VALUES (234, 2, '2019-03-20 17:29:11', 22, 31);
INSERT INTO `tem_hum` VALUES (235, 3, '2019-03-20 17:29:12', 22, 31);
INSERT INTO `tem_hum` VALUES (236, 1, '2019-03-20 17:29:13', 22, 31);
INSERT INTO `tem_hum` VALUES (237, 2, '2019-03-20 17:29:14', 22, 31);
INSERT INTO `tem_hum` VALUES (238, 3, '2019-03-20 17:29:15', 22, 31);
INSERT INTO `tem_hum` VALUES (239, 1, '2019-03-20 17:29:16', 22, 31);
INSERT INTO `tem_hum` VALUES (240, 2, '2019-03-20 17:29:17', 22, 30);
INSERT INTO `tem_hum` VALUES (241, 3, '2019-03-20 17:29:18', 22, 30);
INSERT INTO `tem_hum` VALUES (242, 1, '2019-03-20 17:29:19', 22, 30);
INSERT INTO `tem_hum` VALUES (243, 2, '2019-03-20 17:29:20', 22, 30);
INSERT INTO `tem_hum` VALUES (244, 3, '2019-03-20 17:29:21', 22, 30);
INSERT INTO `tem_hum` VALUES (245, 1, '2019-03-20 17:29:22', 22, 30);
INSERT INTO `tem_hum` VALUES (246, 2, '2019-03-20 17:29:23', 22, 30);
INSERT INTO `tem_hum` VALUES (247, 3, '2019-03-20 17:29:24', 22, 30);
INSERT INTO `tem_hum` VALUES (248, 1, '2019-03-20 17:29:25', 22, 30);
INSERT INTO `tem_hum` VALUES (249, 2, '2019-03-20 17:29:26', 22, 30);
INSERT INTO `tem_hum` VALUES (250, 3, '2019-03-20 17:29:27', 22, 30);
INSERT INTO `tem_hum` VALUES (251, 1, '2019-03-20 17:29:29', 22, 30);
INSERT INTO `tem_hum` VALUES (252, 2, '2019-03-20 17:29:30', 22, 30);
INSERT INTO `tem_hum` VALUES (253, 3, '2019-03-20 17:29:31', 22, 30);
INSERT INTO `tem_hum` VALUES (254, 1, '2019-03-20 17:29:32', 22, 29);
INSERT INTO `tem_hum` VALUES (255, 2, '2019-03-20 17:29:33', 22, 29);
INSERT INTO `tem_hum` VALUES (256, 3, '2019-03-20 17:29:34', 22, 29);
INSERT INTO `tem_hum` VALUES (257, 1, '2019-03-20 17:29:35', 22, 29);
INSERT INTO `tem_hum` VALUES (258, 2, '2019-03-20 17:29:36', 22, 29);
INSERT INTO `tem_hum` VALUES (259, 3, '2019-03-20 17:29:37', 22, 29);
INSERT INTO `tem_hum` VALUES (260, 1, '2019-03-20 17:29:38', 22, 29);
INSERT INTO `tem_hum` VALUES (261, 2, '2019-03-20 17:29:39', 22, 29);
INSERT INTO `tem_hum` VALUES (262, 3, '2019-03-20 17:29:40', 22, 29);
INSERT INTO `tem_hum` VALUES (263, 1, '2019-03-20 17:29:41', 22, 29);
INSERT INTO `tem_hum` VALUES (264, 2, '2019-03-20 17:29:42', 22, 28);
INSERT INTO `tem_hum` VALUES (265, 3, '2019-03-20 17:29:43', 22, 28);
INSERT INTO `tem_hum` VALUES (266, 1, '2019-03-20 17:29:44', 22, 29);
INSERT INTO `tem_hum` VALUES (267, 2, '2019-03-20 17:29:45', 22, 29);
INSERT INTO `tem_hum` VALUES (268, 3, '2019-03-20 17:29:46', 22, 29);
INSERT INTO `tem_hum` VALUES (269, 1, '2019-03-20 17:29:47', 22, 29);
INSERT INTO `tem_hum` VALUES (270, 2, '2019-03-20 17:29:48', 22, 29);
INSERT INTO `tem_hum` VALUES (271, 3, '2019-03-20 17:29:49', 22, 29);
INSERT INTO `tem_hum` VALUES (272, 1, '2019-03-20 17:29:50', 22, 29);
INSERT INTO `tem_hum` VALUES (273, 2, '2019-03-20 17:29:51', 22, 29);
INSERT INTO `tem_hum` VALUES (274, 3, '2019-03-20 17:29:52', 22, 28);
INSERT INTO `tem_hum` VALUES (275, 1, '2019-03-20 17:29:54', 22, 28);
INSERT INTO `tem_hum` VALUES (276, 2, '2019-03-20 17:29:55', 22, 29);
INSERT INTO `tem_hum` VALUES (277, 3, '2019-03-20 17:29:56', 22, 29);
INSERT INTO `tem_hum` VALUES (278, 1, '2019-03-20 17:29:57', 22, 29);
INSERT INTO `tem_hum` VALUES (279, 2, '2019-03-20 17:29:58', 22, 29);
INSERT INTO `tem_hum` VALUES (280, 3, '2019-03-20 17:29:59', 22, 29);
INSERT INTO `tem_hum` VALUES (281, 1, '2019-03-20 17:30:00', 22, 29);
INSERT INTO `tem_hum` VALUES (282, 2, '2019-03-20 17:30:01', 22, 29);
INSERT INTO `tem_hum` VALUES (283, 3, '2019-03-20 17:30:02', 22, 29);
INSERT INTO `tem_hum` VALUES (284, 1, '2019-03-20 17:30:03', 22, 29);
INSERT INTO `tem_hum` VALUES (285, 2, '2019-03-20 17:30:04', 22, 29);
INSERT INTO `tem_hum` VALUES (286, 3, '2019-03-20 17:30:05', 22, 29);
INSERT INTO `tem_hum` VALUES (287, 1, '2019-03-20 17:30:06', 22, 29);
INSERT INTO `tem_hum` VALUES (288, 2, '2019-03-20 17:30:07', 22, 28);
INSERT INTO `tem_hum` VALUES (289, 3, '2019-03-20 17:30:08', 22, 28);
INSERT INTO `tem_hum` VALUES (290, 1, '2019-03-20 17:30:09', 22, 27);
INSERT INTO `tem_hum` VALUES (291, 2, '2019-03-20 17:30:10', 22, 27);
INSERT INTO `tem_hum` VALUES (292, 3, '2019-03-20 17:30:11', 22, 27);
INSERT INTO `tem_hum` VALUES (293, 1, '2019-03-20 17:30:12', 22, 27);
INSERT INTO `tem_hum` VALUES (294, 2, '2019-03-20 17:30:13', 22, 27);
INSERT INTO `tem_hum` VALUES (295, 3, '2019-03-20 17:30:14', 22, 27);
INSERT INTO `tem_hum` VALUES (296, 1, '2019-03-20 17:30:15', 22, 26);
INSERT INTO `tem_hum` VALUES (297, 2, '2019-03-20 17:30:16', 22, 26);
INSERT INTO `tem_hum` VALUES (298, 3, '2019-03-20 17:30:17', 22, 25);
INSERT INTO `tem_hum` VALUES (299, 1, '2019-03-20 17:30:19', 22, 25);
INSERT INTO `tem_hum` VALUES (300, 2, '2019-03-20 17:30:20', 22, 25);
INSERT INTO `tem_hum` VALUES (301, 3, '2019-03-20 17:30:21', 22, 25);
INSERT INTO `tem_hum` VALUES (302, 1, '2019-03-20 17:30:22', 22, 25);
INSERT INTO `tem_hum` VALUES (303, 2, '2019-03-20 17:30:23', 22, 25);
INSERT INTO `tem_hum` VALUES (304, 3, '2019-03-20 17:30:24', 22, 24);
INSERT INTO `tem_hum` VALUES (305, 1, '2019-03-20 17:30:25', 22, 24);
INSERT INTO `tem_hum` VALUES (306, 2, '2019-03-20 17:30:26', 22, 24);
INSERT INTO `tem_hum` VALUES (307, 3, '2019-03-20 17:30:27', 22, 24);
INSERT INTO `tem_hum` VALUES (308, 1, '2019-03-20 17:30:28', 22, 23);
INSERT INTO `tem_hum` VALUES (309, 2, '2019-03-20 17:30:29', 22, 23);
INSERT INTO `tem_hum` VALUES (310, 3, '2019-03-20 17:30:30', 22, 23);
INSERT INTO `tem_hum` VALUES (311, 1, '2019-03-20 17:30:31', 22, 23);
INSERT INTO `tem_hum` VALUES (312, 2, '2019-03-20 17:30:32', 22, 23);
INSERT INTO `tem_hum` VALUES (313, 3, '2019-03-20 17:30:33', 22, 23);
INSERT INTO `tem_hum` VALUES (314, 1, '2019-03-20 17:30:34', 22, 23);
INSERT INTO `tem_hum` VALUES (315, 2, '2019-03-20 17:30:35', 22, 23);
INSERT INTO `tem_hum` VALUES (316, 3, '2019-03-20 17:30:36', 22, 22);
INSERT INTO `tem_hum` VALUES (317, 1, '2019-03-20 17:30:37', 22, 22);
INSERT INTO `tem_hum` VALUES (318, 2, '2019-03-20 17:30:38', 22, 22);
INSERT INTO `tem_hum` VALUES (319, 3, '2019-03-20 17:30:39', 22, 22);
INSERT INTO `tem_hum` VALUES (320, 1, '2019-03-20 17:30:40', 22, 22);
INSERT INTO `tem_hum` VALUES (321, 2, '2019-03-20 17:30:41', 22, 22);
INSERT INTO `tem_hum` VALUES (322, 3, '2019-03-20 17:30:42', 22, 21);
INSERT INTO `tem_hum` VALUES (323, 1, '2019-03-20 17:30:44', 22, 21);
INSERT INTO `tem_hum` VALUES (324, 2, '2019-03-20 17:30:45', 22, 21);
INSERT INTO `tem_hum` VALUES (325, 3, '2019-03-20 17:30:46', 22, 21);
INSERT INTO `tem_hum` VALUES (326, 1, '2019-03-20 17:30:47', 22, 21);
INSERT INTO `tem_hum` VALUES (327, 2, '2019-03-20 17:30:48', 22, 21);
INSERT INTO `tem_hum` VALUES (328, 3, '2019-03-20 17:30:49', 22, 21);
INSERT INTO `tem_hum` VALUES (329, 1, '2019-03-20 17:30:50', 22, 21);
INSERT INTO `tem_hum` VALUES (330, 2, '2019-03-20 17:30:51', 22, 21);
INSERT INTO `tem_hum` VALUES (331, 3, '2019-03-20 17:30:52', 22, 21);
INSERT INTO `tem_hum` VALUES (332, 1, '2019-03-20 17:30:53', 22, 21);
INSERT INTO `tem_hum` VALUES (333, 2, '2019-03-20 17:30:54', 22, 21);
INSERT INTO `tem_hum` VALUES (334, 3, '2019-03-20 17:30:55', 22, 21);
INSERT INTO `tem_hum` VALUES (335, 1, '2019-03-20 17:30:56', 22, 21);
INSERT INTO `tem_hum` VALUES (336, 2, '2019-03-20 17:30:57', 22, 20);
INSERT INTO `tem_hum` VALUES (337, 3, '2019-03-20 17:30:58', 22, 20);
INSERT INTO `tem_hum` VALUES (338, 1, '2019-03-20 17:30:59', 22, 20);
INSERT INTO `tem_hum` VALUES (339, 2, '2019-03-20 17:31:00', 22, 20);
INSERT INTO `tem_hum` VALUES (340, 3, '2019-03-20 17:31:01', 22, 20);
INSERT INTO `tem_hum` VALUES (341, 1, '2019-03-20 17:31:02', 22, 20);
INSERT INTO `tem_hum` VALUES (342, 2, '2019-03-20 17:31:03', 22, 20);
INSERT INTO `tem_hum` VALUES (343, 3, '2019-03-20 17:31:04', 22, 20);
INSERT INTO `tem_hum` VALUES (344, 1, '2019-03-20 17:31:05', 22, 19);
INSERT INTO `tem_hum` VALUES (345, 2, '2019-03-20 17:31:06', 22, 19);
INSERT INTO `tem_hum` VALUES (346, 3, '2019-03-20 17:31:07', 22, 19);
INSERT INTO `tem_hum` VALUES (347, 1, '2019-03-20 17:31:09', 22, 19);
INSERT INTO `tem_hum` VALUES (348, 2, '2019-03-20 17:31:10', 22, 19);
INSERT INTO `tem_hum` VALUES (349, 3, '2019-03-20 17:31:11', 22, 19);
INSERT INTO `tem_hum` VALUES (350, 1, '2019-03-20 17:31:12', 22, 18);
INSERT INTO `tem_hum` VALUES (351, 2, '2019-03-20 17:31:13', 22, 18);
INSERT INTO `tem_hum` VALUES (352, 3, '2019-03-20 17:31:14', 22, 18);
INSERT INTO `tem_hum` VALUES (353, 1, '2019-03-20 17:31:15', 22, 18);
INSERT INTO `tem_hum` VALUES (354, 2, '2019-03-20 17:31:16', 22, 18);
INSERT INTO `tem_hum` VALUES (355, 3, '2019-03-20 17:31:17', 22, 18);
INSERT INTO `tem_hum` VALUES (356, 1, '2019-03-20 17:31:18', 22, 17);
INSERT INTO `tem_hum` VALUES (357, 2, '2019-03-20 17:31:19', 22, 17);
INSERT INTO `tem_hum` VALUES (358, 3, '2019-03-20 17:31:20', 22, 17);
INSERT INTO `tem_hum` VALUES (359, 1, '2019-03-20 17:31:21', 22, 17);
INSERT INTO `tem_hum` VALUES (360, 2, '2019-03-20 17:31:22', 22, 17);
INSERT INTO `tem_hum` VALUES (361, 3, '2019-03-20 17:31:23', 22, 17);
INSERT INTO `tem_hum` VALUES (362, 1, '2019-03-20 17:31:24', 22, 16);
INSERT INTO `tem_hum` VALUES (363, 2, '2019-03-20 17:31:25', 22, 16);
INSERT INTO `tem_hum` VALUES (364, 3, '2019-03-20 17:31:26', 22, 16);
INSERT INTO `tem_hum` VALUES (365, 1, '2019-03-20 17:31:27', 22, 16);
INSERT INTO `tem_hum` VALUES (366, 2, '2019-03-20 17:31:28', 22, 16);
INSERT INTO `tem_hum` VALUES (367, 3, '2019-03-20 17:31:29', 22, 16);
INSERT INTO `tem_hum` VALUES (368, 1, '2019-03-20 17:31:30', 22, 15);
INSERT INTO `tem_hum` VALUES (369, 2, '2019-03-20 17:31:31', 22, 15);
INSERT INTO `tem_hum` VALUES (370, 3, '2019-03-20 17:31:33', 22, 15);
INSERT INTO `tem_hum` VALUES (371, 1, '2019-03-20 17:31:34', 22, 15);
INSERT INTO `tem_hum` VALUES (372, 2, '2019-03-20 17:31:35', 22, 15);
INSERT INTO `tem_hum` VALUES (373, 3, '2019-03-20 17:31:36', 22, 15);
INSERT INTO `tem_hum` VALUES (374, 1, '2019-03-20 17:31:37', 22, 14);
INSERT INTO `tem_hum` VALUES (375, 2, '2019-03-20 17:31:38', 22, 14);
INSERT INTO `tem_hum` VALUES (376, 3, '2019-03-20 17:31:39', 22, 14);
INSERT INTO `tem_hum` VALUES (377, 1, '2019-03-20 17:31:40', 22, 14);
INSERT INTO `tem_hum` VALUES (378, 2, '2019-03-20 17:31:41', 22, 14);
INSERT INTO `tem_hum` VALUES (379, 3, '2019-03-20 17:31:42', 22, 14);
INSERT INTO `tem_hum` VALUES (380, 1, '2019-03-20 17:31:43', 22, 14);
INSERT INTO `tem_hum` VALUES (381, 2, '2019-03-20 17:31:44', 22, 14);
INSERT INTO `tem_hum` VALUES (382, 3, '2019-03-20 17:31:45', 22, 13);
INSERT INTO `tem_hum` VALUES (383, 1, '2019-03-20 17:31:46', 22, 13);
INSERT INTO `tem_hum` VALUES (384, 2, '2019-03-20 17:31:47', 22, 13);
INSERT INTO `tem_hum` VALUES (385, 3, '2019-03-20 17:31:48', 22, 13);
INSERT INTO `tem_hum` VALUES (386, 1, '2019-03-20 17:31:49', 22, 13);
INSERT INTO `tem_hum` VALUES (387, 2, '2019-03-20 17:31:50', 22, 13);
INSERT INTO `tem_hum` VALUES (388, 3, '2019-03-20 17:31:51', 22, 13);
INSERT INTO `tem_hum` VALUES (389, 1, '2019-03-20 17:31:52', 22, 13);
INSERT INTO `tem_hum` VALUES (390, 2, '2019-03-20 17:31:53', 22, 13);
INSERT INTO `tem_hum` VALUES (391, 3, '2019-03-20 17:31:54', 22, 13);
INSERT INTO `tem_hum` VALUES (392, 1, '2019-03-20 17:31:55', 22, 13);
INSERT INTO `tem_hum` VALUES (393, 2, '2019-03-20 17:31:56', 22, 13);
INSERT INTO `tem_hum` VALUES (394, 3, '2019-03-20 17:31:58', 22, 13);
INSERT INTO `tem_hum` VALUES (395, 1, '2019-03-20 17:31:59', 22, 13);
INSERT INTO `tem_hum` VALUES (396, 2, '2019-03-20 17:32:00', 22, 12);
INSERT INTO `tem_hum` VALUES (397, 3, '2019-03-20 17:32:01', 22, 12);
INSERT INTO `tem_hum` VALUES (398, 1, '2019-03-20 17:32:02', 22, 12);
INSERT INTO `tem_hum` VALUES (399, 2, '2019-03-20 17:32:03', 22, 12);
INSERT INTO `tem_hum` VALUES (400, 3, '2019-03-20 17:32:04', 22, 12);
INSERT INTO `tem_hum` VALUES (401, 1, '2019-03-20 17:32:05', 22, 12);
INSERT INTO `tem_hum` VALUES (402, 2, '2019-03-20 17:32:06', 22, 12);
INSERT INTO `tem_hum` VALUES (403, 3, '2019-03-20 17:32:07', 22, 12);
INSERT INTO `tem_hum` VALUES (404, 1, '2019-03-20 17:32:08', 22, 12);
INSERT INTO `tem_hum` VALUES (405, 2, '2019-03-20 17:32:09', 22, 12);
INSERT INTO `tem_hum` VALUES (406, 3, '2019-03-20 17:32:10', 22, 12);
INSERT INTO `tem_hum` VALUES (407, 1, '2019-03-20 17:32:11', 22, 12);
INSERT INTO `tem_hum` VALUES (408, 2, '2019-03-20 17:32:12', 22, 12);
INSERT INTO `tem_hum` VALUES (409, 3, '2019-03-20 17:32:13', 22, 12);
INSERT INTO `tem_hum` VALUES (410, 1, '2019-03-20 17:32:14', 22, 12);
INSERT INTO `tem_hum` VALUES (411, 2, '2019-03-20 17:32:15', 22, 12);
INSERT INTO `tem_hum` VALUES (412, 3, '2019-03-20 17:32:16', 22, 12);
INSERT INTO `tem_hum` VALUES (413, 1, '2019-03-20 17:32:17', 22, 12);
INSERT INTO `tem_hum` VALUES (414, 2, '2019-03-20 17:32:18', 22, 12);
INSERT INTO `tem_hum` VALUES (415, 3, '2019-03-20 17:32:19', 22, 12);
INSERT INTO `tem_hum` VALUES (416, 1, '2019-03-20 17:32:20', 22, 12);
INSERT INTO `tem_hum` VALUES (417, 2, '2019-03-20 17:32:21', 22, 12);
INSERT INTO `tem_hum` VALUES (418, 3, '2019-03-20 17:32:23', 22, 11);
INSERT INTO `tem_hum` VALUES (419, 1, '2019-03-20 17:32:24', 22, 11);
INSERT INTO `tem_hum` VALUES (420, 2, '2019-03-20 17:32:25', 22, 11);
INSERT INTO `tem_hum` VALUES (421, 3, '2019-03-20 17:32:26', 22, 11);
INSERT INTO `tem_hum` VALUES (422, 1, '2019-03-20 17:32:27', 22, 11);
INSERT INTO `tem_hum` VALUES (423, 2, '2019-03-20 17:32:28', 22, 11);
INSERT INTO `tem_hum` VALUES (424, 3, '2019-03-20 17:32:29', 22, 11);
INSERT INTO `tem_hum` VALUES (425, 1, '2019-03-20 17:32:30', 22, 11);
INSERT INTO `tem_hum` VALUES (426, 2, '2019-03-20 17:32:31', 22, 11);
INSERT INTO `tem_hum` VALUES (427, 3, '2019-03-20 17:32:32', 22, 11);
INSERT INTO `tem_hum` VALUES (428, 1, '2019-03-20 17:32:33', 22, 11);
INSERT INTO `tem_hum` VALUES (429, 2, '2019-03-20 17:32:34', 22, 11);
INSERT INTO `tem_hum` VALUES (430, 3, '2019-03-20 17:32:35', 22, 11);
INSERT INTO `tem_hum` VALUES (431, 1, '2019-03-20 17:32:36', 22, 11);
INSERT INTO `tem_hum` VALUES (432, 2, '2019-03-20 17:32:37', 22, 11);
INSERT INTO `tem_hum` VALUES (433, 3, '2019-03-20 17:32:38', 22, 11);
INSERT INTO `tem_hum` VALUES (434, 1, '2019-03-20 17:32:39', 22, 11);
INSERT INTO `tem_hum` VALUES (435, 2, '2019-03-20 17:32:40', 22, 11);
INSERT INTO `tem_hum` VALUES (436, 3, '2019-03-20 17:32:41', 22, 11);
INSERT INTO `tem_hum` VALUES (437, 1, '2019-03-20 17:32:42', 22, 11);
INSERT INTO `tem_hum` VALUES (438, 2, '2019-03-20 17:32:43', 22, 11);
INSERT INTO `tem_hum` VALUES (439, 3, '2019-03-20 17:32:44', 22, 11);
INSERT INTO `tem_hum` VALUES (440, 1, '2019-03-20 17:32:45', 22, 10);
INSERT INTO `tem_hum` VALUES (441, 2, '2019-03-20 17:32:47', 22, 10);
INSERT INTO `tem_hum` VALUES (442, 3, '2019-03-20 17:32:48', 22, 11);
INSERT INTO `tem_hum` VALUES (443, 1, '2019-03-20 17:32:49', 22, 11);
INSERT INTO `tem_hum` VALUES (444, 2, '2019-03-20 17:32:50', 22, 10);
INSERT INTO `tem_hum` VALUES (445, 3, '2019-03-20 17:32:51', 22, 10);
INSERT INTO `tem_hum` VALUES (446, 1, '2019-03-20 17:32:52', 22, 10);
INSERT INTO `tem_hum` VALUES (447, 2, '2019-03-20 17:32:53', 22, 10);
INSERT INTO `tem_hum` VALUES (448, 3, '2019-03-20 17:32:54', 22, 10);
INSERT INTO `tem_hum` VALUES (449, 1, '2019-03-20 17:32:55', 22, 10);
INSERT INTO `tem_hum` VALUES (450, 2, '2019-03-20 17:32:56', 22, 10);
INSERT INTO `tem_hum` VALUES (451, 3, '2019-03-20 17:32:57', 22, 10);
INSERT INTO `tem_hum` VALUES (452, 1, '2019-03-20 17:32:58', 22, 10);
INSERT INTO `tem_hum` VALUES (453, 2, '2019-03-20 17:32:59', 22, 10);
INSERT INTO `tem_hum` VALUES (454, 3, '2019-03-20 17:33:00', 22, 10);
INSERT INTO `tem_hum` VALUES (455, 1, '2019-03-20 17:33:01', 22, 10);
INSERT INTO `tem_hum` VALUES (456, 2, '2019-03-20 17:33:02', 22, 10);
INSERT INTO `tem_hum` VALUES (457, 3, '2019-03-20 17:33:03', 22, 10);
INSERT INTO `tem_hum` VALUES (458, 1, '2019-03-20 17:33:04', 22, 10);
INSERT INTO `tem_hum` VALUES (459, 2, '2019-03-20 17:33:05', 22, 10);
INSERT INTO `tem_hum` VALUES (460, 3, '2019-03-20 17:33:06', 22, 10);
INSERT INTO `tem_hum` VALUES (461, 1, '2019-03-20 17:33:07', 22, 10);
INSERT INTO `tem_hum` VALUES (462, 2, '2019-03-20 17:33:08', 22, 10);
INSERT INTO `tem_hum` VALUES (463, 3, '2019-03-20 17:33:09', 22, 10);
INSERT INTO `tem_hum` VALUES (464, 1, '2019-03-20 17:33:10', 22, 10);
INSERT INTO `tem_hum` VALUES (465, 2, '2019-03-20 17:33:12', 22, 10);
INSERT INTO `tem_hum` VALUES (466, 3, '2019-03-20 17:33:13', 22, 10);
INSERT INTO `tem_hum` VALUES (467, 1, '2019-03-20 17:33:14', 22, 10);
INSERT INTO `tem_hum` VALUES (468, 2, '2019-03-20 17:33:15', 22, 10);
INSERT INTO `tem_hum` VALUES (469, 3, '2019-03-20 17:33:16', 22, 10);
INSERT INTO `tem_hum` VALUES (470, 1, '2019-03-20 17:33:17', 22, 10);
INSERT INTO `tem_hum` VALUES (471, 2, '2019-03-20 17:33:18', 22, 10);
INSERT INTO `tem_hum` VALUES (472, 3, '2019-03-20 17:33:19', 22, 10);
INSERT INTO `tem_hum` VALUES (473, 1, '2019-03-20 17:33:20', 22, 10);
INSERT INTO `tem_hum` VALUES (474, 2, '2019-03-20 17:33:21', 22, 10);
INSERT INTO `tem_hum` VALUES (475, 3, '2019-03-20 17:33:22', 22, 10);
INSERT INTO `tem_hum` VALUES (476, 1, '2019-03-20 17:33:23', 22, 10);
INSERT INTO `tem_hum` VALUES (477, 2, '2019-03-20 17:33:24', 22, 10);
INSERT INTO `tem_hum` VALUES (478, 3, '2019-03-20 17:33:25', 22, 9);
INSERT INTO `tem_hum` VALUES (479, 1, '2019-03-20 17:33:26', 22, 9);
INSERT INTO `tem_hum` VALUES (480, 2, '2019-03-20 17:33:27', 22, 9);
INSERT INTO `tem_hum` VALUES (481, 3, '2019-03-20 17:33:28', 22, 9);
INSERT INTO `tem_hum` VALUES (482, 1, '2019-03-20 17:33:29', 22, 9);
INSERT INTO `tem_hum` VALUES (483, 2, '2019-03-20 17:33:30', 22, 9);
INSERT INTO `tem_hum` VALUES (484, 3, '2019-03-20 17:33:31', 22, 10);
INSERT INTO `tem_hum` VALUES (485, 1, '2019-03-20 17:33:32', 22, 10);
INSERT INTO `tem_hum` VALUES (486, 2, '2019-03-20 17:33:33', 22, 9);
INSERT INTO `tem_hum` VALUES (487, 3, '2019-03-20 17:33:34', 22, 9);
INSERT INTO `tem_hum` VALUES (488, 1, '2019-03-20 17:33:35', 22, 9);
INSERT INTO `tem_hum` VALUES (489, 2, '2019-03-20 17:33:37', 22, 9);
INSERT INTO `tem_hum` VALUES (490, 3, '2019-03-20 17:33:38', 22, 9);
INSERT INTO `tem_hum` VALUES (491, 1, '2019-03-20 17:33:39', 22, 9);
INSERT INTO `tem_hum` VALUES (492, 2, '2019-03-20 17:33:40', 22, 9);
INSERT INTO `tem_hum` VALUES (493, 3, '2019-03-20 17:33:41', 22, 9);
INSERT INTO `tem_hum` VALUES (494, 1, '2019-03-20 17:33:42', 22, 9);
INSERT INTO `tem_hum` VALUES (495, 2, '2019-03-20 17:33:43', 22, 9);
INSERT INTO `tem_hum` VALUES (496, 3, '2019-03-20 17:33:44', 22, 9);
INSERT INTO `tem_hum` VALUES (497, 1, '2019-03-20 17:33:45', 22, 9);
INSERT INTO `tem_hum` VALUES (498, 2, '2019-03-20 17:33:46', 22, 9);
INSERT INTO `tem_hum` VALUES (499, 3, '2019-03-20 17:33:47', 22, 9);
INSERT INTO `tem_hum` VALUES (500, 1, '2019-03-20 17:33:48', 22, 9);
INSERT INTO `tem_hum` VALUES (501, 2, '2019-03-20 17:33:49', 22, 9);
INSERT INTO `tem_hum` VALUES (502, 3, '2019-03-20 17:33:50', 22, 9);
INSERT INTO `tem_hum` VALUES (503, 1, '2019-03-20 17:33:51', 22, 9);
INSERT INTO `tem_hum` VALUES (504, 2, '2019-03-20 17:33:52', 22, 9);
INSERT INTO `tem_hum` VALUES (505, 3, '2019-03-20 17:33:53', 22, 9);
INSERT INTO `tem_hum` VALUES (506, 1, '2019-03-20 17:33:54', 22, 9);
INSERT INTO `tem_hum` VALUES (507, 2, '2019-03-20 17:33:55', 22, 9);
INSERT INTO `tem_hum` VALUES (508, 3, '2019-03-20 17:33:56', 22, 9);
INSERT INTO `tem_hum` VALUES (509, 1, '2019-03-20 17:33:57', 22, 9);
INSERT INTO `tem_hum` VALUES (510, 2, '2019-03-20 17:33:58', 22, 9);
INSERT INTO `tem_hum` VALUES (511, 3, '2019-03-20 17:33:59', 22, 9);
INSERT INTO `tem_hum` VALUES (512, 1, '2019-03-20 17:34:00', 22, 9);
INSERT INTO `tem_hum` VALUES (513, 2, '2019-03-20 17:34:02', 22, 9);
INSERT INTO `tem_hum` VALUES (514, 3, '2019-03-20 17:34:03', 22, 9);
INSERT INTO `tem_hum` VALUES (515, 1, '2019-03-20 17:34:04', 22, 9);
INSERT INTO `tem_hum` VALUES (516, 2, '2019-03-20 17:34:05', 22, 10);
INSERT INTO `tem_hum` VALUES (517, 3, '2019-03-20 17:34:06', 22, 10);
INSERT INTO `tem_hum` VALUES (518, 1, '2019-03-20 17:34:07', 22, 10);
INSERT INTO `tem_hum` VALUES (519, 2, '2019-03-20 17:34:08', 22, 10);
INSERT INTO `tem_hum` VALUES (520, 3, '2019-03-20 17:34:09', 22, 10);
INSERT INTO `tem_hum` VALUES (521, 1, '2019-03-20 17:34:10', 22, 10);
INSERT INTO `tem_hum` VALUES (522, 2, '2019-03-20 17:34:11', 22, 10);
INSERT INTO `tem_hum` VALUES (523, 3, '2019-03-20 17:34:12', 22, 10);
INSERT INTO `tem_hum` VALUES (524, 1, '2019-03-20 17:34:13', 22, 10);
INSERT INTO `tem_hum` VALUES (525, 2, '2019-03-20 17:34:14', 22, 10);
INSERT INTO `tem_hum` VALUES (526, 3, '2019-03-20 17:34:15', 22, 9);
INSERT INTO `tem_hum` VALUES (527, 1, '2019-03-20 17:40:56', 22, 6);
INSERT INTO `tem_hum` VALUES (528, 2, '2019-03-20 17:40:56', 22, 6);
INSERT INTO `tem_hum` VALUES (529, 3, '2019-03-20 17:40:57', 22, 6);
INSERT INTO `tem_hum` VALUES (530, 1, '2019-03-20 17:40:58', 22, 6);
INSERT INTO `tem_hum` VALUES (531, 2, '2019-03-20 17:41:00', 22, 6);
INSERT INTO `tem_hum` VALUES (532, 3, '2019-03-20 17:41:01', 22, 6);
INSERT INTO `tem_hum` VALUES (533, 1, '2019-03-20 17:41:02', 22, 5);
INSERT INTO `tem_hum` VALUES (534, 2, '2019-03-20 17:41:03', 22, 5);
INSERT INTO `tem_hum` VALUES (535, 3, '2019-03-20 17:41:04', 22, 5);
INSERT INTO `tem_hum` VALUES (536, 1, '2019-03-20 17:41:05', 22, 5);
INSERT INTO `tem_hum` VALUES (537, 2, '2019-03-20 17:41:06', 22, 5);
INSERT INTO `tem_hum` VALUES (538, 3, '2019-03-20 17:41:07', 22, 5);
INSERT INTO `tem_hum` VALUES (539, 1, '2019-03-20 17:41:08', 22, 5);
INSERT INTO `tem_hum` VALUES (540, 2, '2019-03-20 17:41:09', 22, 5);
INSERT INTO `tem_hum` VALUES (541, 3, '2019-03-20 17:41:10', 22, 5);
INSERT INTO `tem_hum` VALUES (542, 1, '2019-03-20 17:41:11', 22, 5);
INSERT INTO `tem_hum` VALUES (543, 2, '2019-03-20 17:41:12', 22, 5);
INSERT INTO `tem_hum` VALUES (544, 3, '2019-03-20 17:41:13', 22, 5);
INSERT INTO `tem_hum` VALUES (545, 1, '2019-03-20 17:41:14', 22, 5);
INSERT INTO `tem_hum` VALUES (546, 2, '2019-03-20 17:41:15', 22, 5);
INSERT INTO `tem_hum` VALUES (547, 3, '2019-03-20 17:41:16', 22, 5);
INSERT INTO `tem_hum` VALUES (548, 1, '2019-03-20 17:41:17', 22, 5);
INSERT INTO `tem_hum` VALUES (549, 2, '2019-03-20 17:41:18', 22, 5);
INSERT INTO `tem_hum` VALUES (550, 3, '2019-03-20 17:41:19', 22, 5);
INSERT INTO `tem_hum` VALUES (551, 1, '2019-03-20 17:41:20', 22, 5);
INSERT INTO `tem_hum` VALUES (552, 2, '2019-03-20 17:41:21', 22, 5);
INSERT INTO `tem_hum` VALUES (553, 3, '2019-03-20 17:41:22', 22, 5);
INSERT INTO `tem_hum` VALUES (554, 1, '2019-03-20 17:41:24', 22, 5);
INSERT INTO `tem_hum` VALUES (555, 2, '2019-03-20 17:41:25', 22, 5);
INSERT INTO `tem_hum` VALUES (556, 3, '2019-03-20 17:41:26', 22, 5);
INSERT INTO `tem_hum` VALUES (557, 1, '2019-03-20 17:41:27', 22, 5);
INSERT INTO `tem_hum` VALUES (558, 2, '2019-03-20 17:41:28', 22, 5);
INSERT INTO `tem_hum` VALUES (559, 3, '2019-03-20 17:41:29', 22, 5);
INSERT INTO `tem_hum` VALUES (560, 1, '2019-03-20 17:41:30', 22, 5);
INSERT INTO `tem_hum` VALUES (561, 2, '2019-03-20 17:41:31', 22, 5);
INSERT INTO `tem_hum` VALUES (562, 3, '2019-03-20 17:41:32', 22, 5);
INSERT INTO `tem_hum` VALUES (563, 1, '2019-03-20 17:41:33', 22, 5);
INSERT INTO `tem_hum` VALUES (564, 2, '2019-03-20 17:41:34', 22, 5);
INSERT INTO `tem_hum` VALUES (565, 3, '2019-03-20 17:41:35', 22, 5);
INSERT INTO `tem_hum` VALUES (566, 1, '2019-03-20 17:41:36', 22, 5);
INSERT INTO `tem_hum` VALUES (567, 2, '2019-03-20 17:41:37', 22, 5);
INSERT INTO `tem_hum` VALUES (568, 3, '2019-03-20 17:41:38', 22, 5);
INSERT INTO `tem_hum` VALUES (569, 1, '2019-03-20 17:41:39', 22, 5);

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
  `type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '教师（管理）', 'teach_test', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '男', 40, '112345', '1123@qq.com', '教师', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (2, '学生（管理）', 'student_test', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '女', 21, '122345', '1223@qq.com', '学生', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (3, '管理员', 'admin', 'c5012e9325c37d32cab7300ec84b6ec1', 'Bvf1BxvkoBvhq9LfO+LgPw==', '男', 41, '123345', '1233@qq.com', '管理员', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (4, '学生1', 'student_1111', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '女', 22, '12234511', '122311@qq.com', '学生', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (5, '学生2', 'student_2222', 'fd08f57e427e4598d36a90d49ba163a4', 'e3qR8oieCjk/zCHjARvS8A==', '男', 23, '12234522', '122322@qq.com', '学生', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (6, '教师1', 'teach_1', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '女', 45, '11234511', '112311@qq.com', '教师', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (7, '教师2', 'teach_2', '74f913d6c18675e07a26241105a6815e', 'x2eJY+fvsrVgTqv5fKaeBw==', '男', 44, '11234522', '112322@qq.com', '教师', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (8, '123', '123', 'dfefeddae4c1a1063ac3070bcdf5a8cc', 'Q8XMOF2q5826/+mytQZxwA==', '男', 23, '123', '123', '学生', '李宇辉image.jpg', 'skin-blur-night');
INSERT INTO `user` VALUES (9, '456', '20151104687', 'cdfcea1cd47119325f942b794c4595ab', 'bCigz2v5XtHyHHTkWg6N7w==', '男', 45, '456', '456', '学生', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (10, '789', '789', '7bc5db8233bea676bfcbd88530a29199', 'NZuLUAmSyZUNfguy9IDQsw==', '男', 19, '789', '789', '学生', '李宇辉image.jpg', 'skin-blur-blue');
INSERT INTO `user` VALUES (17, '李宇辉', 'ciec20151104687', 'f5de456e74a25bf0137c41bc8a4b7a89', 'aaWyfT4ICoe8eR7G9gdZAg==', '男', 22, '13015069326', '253054802@qq.com', '学生', '李宇辉image.jpg', 'skin-cloth');
INSERT INTO `user` VALUES (18, '李宇辉', 'imnu20151104687', '00cf5e3f9bd149c8a2df7dd56710e10c', 'CUy1/digANDqOpOLyx8CGA==', '男', 22, '13015069326', '253054802@qq.com', '学生', '李宇辉1552628905041head——old.jpg', 'skin-blur-night');
INSERT INTO `user` VALUES (19, '123', '111111111111', 'f069ee55ec9a0a32f4c62c98fea0bf21', 'XHxAqTnhy7nvv3dTVYXMXA==', '男', 33, '13015069326', '253054802@qq.com', '学生', '李宇辉image.jpg', 'skin-cloth');

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
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_lab
-- ----------------------------
INSERT INTO `user_lab` VALUES (10, 1, 2, '3');
INSERT INTO `user_lab` VALUES (11, 2, 2, '3');
INSERT INTO `user_lab` VALUES (12, 3, 2, '3');
INSERT INTO `user_lab` VALUES (13, 4, 2, '3');
INSERT INTO `user_lab` VALUES (14, 5, 2, '0');
INSERT INTO `user_lab` VALUES (15, 6, 2, '0');
INSERT INTO `user_lab` VALUES (16, 7, 2, '0');
INSERT INTO `user_lab` VALUES (17, 8, 2, '0');
INSERT INTO `user_lab` VALUES (18, 9, 2, '0');
INSERT INTO `user_lab` VALUES (217, 7, 1, NULL);
INSERT INTO `user_lab` VALUES (218, 6, 1, NULL);
INSERT INTO `user_lab` VALUES (219, 1, 1, NULL);
INSERT INTO `user_lab` VALUES (220, 18, 1, NULL);
INSERT INTO `user_lab` VALUES (221, 17, 1, NULL);
INSERT INTO `user_lab` VALUES (222, 9, 1, NULL);
INSERT INTO `user_lab` VALUES (223, 5, 1, NULL);
INSERT INTO `user_lab` VALUES (224, 4, 1, NULL);
INSERT INTO `user_lab` VALUES (225, 2, 1, NULL);
INSERT INTO `user_lab` VALUES (226, 5, 8, NULL);
INSERT INTO `user_lab` VALUES (227, 4, 9, NULL);
INSERT INTO `user_lab` VALUES (233, 7, 3, NULL);
INSERT INTO `user_lab` VALUES (234, 6, 3, NULL);
INSERT INTO `user_lab` VALUES (235, 1, 3, NULL);
INSERT INTO `user_lab` VALUES (236, 18, 3, NULL);
INSERT INTO `user_lab` VALUES (237, 17, 3, NULL);
INSERT INTO `user_lab` VALUES (238, 8, 3, NULL);
INSERT INTO `user_lab` VALUES (239, 2, 3, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL,
  `rid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 3);
INSERT INTO `user_role` VALUES (3, 3, 5);
INSERT INTO `user_role` VALUES (6, 6, 2);
INSERT INTO `user_role` VALUES (7, 7, 2);
INSERT INTO `user_role` VALUES (8, 9, 4);
INSERT INTO `user_role` VALUES (14, 8, 5);
INSERT INTO `user_role` VALUES (15, 8, 4);
INSERT INTO `user_role` VALUES (16, 11, 4);
INSERT INTO `user_role` VALUES (17, 10, 2);

SET FOREIGN_KEY_CHECKS = 1;
