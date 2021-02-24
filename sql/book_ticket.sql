/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : book_ticket

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 25/02/2021 01:43:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE,
  INDEX `FKi8lurtplfsktg01y6uevop5yp`(`create_user_id`) USING BTREE,
  INDEX `FKhxpr89ae0g4rd9xpfgcdjf0sa`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKhxpr89ae0g4rd9xpfgcdjf0sa` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi8lurtplfsktg01y6uevop5yp` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict
-- ----------------------------
INSERT INTO `e_dict` VALUES (1, '2021-02-06 20:45:05', NULL, 'order_status', '订单状态', NULL, 2, NULL);
INSERT INTO `e_dict` VALUES (2, '2021-02-06 20:51:43', NULL, 'order_seat_level', '坐席', NULL, 2, NULL);

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_dict_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKij9x8hwy16dra7d49h483lu2u`(`create_user_id`) USING BTREE,
  INDEX `FKmlg0pjfxwih4i6r0g0iilh1lu`(`update_user_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKij9x8hwy16dra7d49h483lu2u` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmlg0pjfxwih4i6r0g0iilh1lu` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------
INSERT INTO `e_dict_item` VALUES (0, '2021-02-06 20:45:56', NULL, '100', '创建', '订单创建', 0, 2, NULL, 1);
INSERT INTO `e_dict_item` VALUES (1, '2021-02-06 20:46:43', NULL, '101', '已发车', '车次已经超时', 1, 2, NULL, 1);
INSERT INTO `e_dict_item` VALUES (2, '2021-02-06 20:47:07', NULL, '102', '已退票', '用户已经退票', 2, 2, NULL, 1);
INSERT INTO `e_dict_item` VALUES (3, '2021-02-06 20:47:43', NULL, '103', '已改签', '用户已做改签操作', 3, 2, NULL, 1);
INSERT INTO `e_dict_item` VALUES (11, '2021-02-06 20:51:55', NULL, '200', '一等座', '坐席', 1, 2, NULL, 2);
INSERT INTO `e_dict_item` VALUES (22, '2021-02-06 20:52:08', NULL, '201', '二等座', '坐席', 2, 2, NULL, 2);

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbnmtsmoprxey1uh6hwa7kl15b`(`create_user_id`) USING BTREE,
  INDEX `FKl47n6nt0w2ulphuhmwht6jdlw`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKbnmtsmoprxey1uh6hwa7kl15b` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl47n6nt0w2ulphuhmwht6jdlw` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------
INSERT INTO `e_generator_class` VALUES (1, '2021-02-03 14:14:52', NULL, 'Station', '站点', '站点管理', 'station', 2, NULL);
INSERT INTO `e_generator_class` VALUES (2, '2021-02-03 14:28:00', NULL, 'Line', '线路', '线路管理', 'line', 2, NULL);
INSERT INTO `e_generator_class` VALUES (3, '2021-02-03 14:41:37', NULL, 'Trips', '车次', '车次管理', 'trips', 2, NULL);
INSERT INTO `e_generator_class` VALUES (4, '2021-02-03 15:05:06', '2021-02-03 22:02:55', 'Orders', '订单', '订单管理', 'orders', 2, 2);

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` bit(1) NULL DEFAULT NULL,
  `link_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query` bit(1) NULL DEFAULT NULL,
  `show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `sortable` bit(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id`) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------
INSERT INTO `e_generator_field` VALUES (1, 'station_name', b'1', NULL, b'1', b'1', '站点名称', 1, b'1', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (2, 'station_adress', b'1', NULL, b'0', b'1', '站点所在地', 2, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (3, 'line_start_station_name', b'1', NULL, b'1', b'1', '起始站点', 1, b'0', 'INPUT', 2);
INSERT INTO `e_generator_field` VALUES (4, 'line_start_end_name', b'1', NULL, b'1', b'1', '到达站点', 2, b'0', 'INPUT', 2);
INSERT INTO `e_generator_field` VALUES (5, 'trips_train_name', b'1', NULL, b'1', b'1', '列车名称', 1, b'1', 'INPUT', 3);
INSERT INTO `e_generator_field` VALUES (6, 'trips_start_time', b'1', NULL, b'1', b'1', '出发时间', 2, b'1', 'DATE_TIME', 3);
INSERT INTO `e_generator_field` VALUES (7, 'trips_end_time', b'1', NULL, b'1', b'1', '到达时间', 3, b'1', 'DATE_TIME', 3);
INSERT INTO `e_generator_field` VALUES (8, 'trips_first_seat_num', b'1', NULL, b'1', b'1', '一等座剩余座位数量', 4, b'1', 'NUMBER', 3);
INSERT INTO `e_generator_field` VALUES (9, 'trips_second_seat_num', b'1', NULL, b'1', b'1', '二等座剩余座位数量', 5, b'1', 'NUMBER', 3);
INSERT INTO `e_generator_field` VALUES (10, 'trips_first_seat_price', b'1', NULL, b'1', b'1', '一等座票价', 6, b'1', 'NUMBER', 3);
INSERT INTO `e_generator_field` VALUES (11, 'trips_second_seat_price', b'1', NULL, b'1', b'1', '二等座票价', 7, b'1', 'NUMBER', 3);
INSERT INTO `e_generator_field` VALUES (12, 'order_create_time', b'1', NULL, b'1', b'0', '创建时间', 1, b'1', 'DATE_TIME', 4);
INSERT INTO `e_generator_field` VALUES (13, 'order_update_time', b'1', NULL, b'0', b'0', '修改时间', 2, b'1', 'DATE_TIME', 4);
INSERT INTO `e_generator_field` VALUES (14, 'order_status', b'1', NULL, b'1', b'1', '状态', 3, b'1', 'NUMBER', 4);
INSERT INTO `e_generator_field` VALUES (15, 'order_passenger_name', b'1', NULL, b'1', b'1', '乘车人姓名', 4, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (16, 'order_passenger_identity_num', b'1', NULL, b'1', b'1', '乘车人身份证号码', 5, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (17, 'order_linkman_name', b'1', NULL, b'0', b'1', '联系人姓名', 6, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (18, 'order_linkman_phone', b'1', NULL, b'0', b'1', '联系人手机号', 7, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (19, 'order_seat_level', b'1', NULL, b'1', b'0', '坐席', 8, b'0', 'NUMBER', 4);
INSERT INTO `e_generator_field` VALUES (20, 'order_price', b'1', NULL, b'1', b'1', '订单金额', 9, b'1', 'NUMBER', 4);
INSERT INTO `e_generator_field` VALUES (21, 'order_user_id', b'1', NULL, b'1', b'1', '用户编号', -1, b'1', 'NUMBER', 4);
INSERT INTO `e_generator_field` VALUES (22, 'order_trips_id', b'1', NULL, b'1', b'1', '车次编号', 0, b'1', 'NUMBER', 4);

-- ----------------------------
-- Table structure for e_job
-- ----------------------------
DROP TABLE IF EXISTS `e_job`;
CREATE TABLE `e_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notify_emails` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK1fu1amroa8n5mma3q9tey7bu9`(`code`) USING BTREE,
  INDEX `FKnxi59dgiyw7h3u65x8ywb8muh`(`create_user_id`) USING BTREE,
  INDEX `FKex9ag5th9lcfd5npbykqvsy4h`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKex9ag5th9lcfd5npbykqvsy4h` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnxi59dgiyw7h3u65x8ywb8muh` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_log
-- ----------------------------
DROP TABLE IF EXISTS `e_job_log`;
CREATE TABLE `e_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `handler_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcpe22rpge2e4mmuva8l9dtmx0`(`job_id`) USING BTREE,
  CONSTRAINT `FKcpe22rpge2e4mmuva8l9dtmx0` FOREIGN KEY (`job_id`) REFERENCES `e_job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_mail
-- ----------------------------
DROP TABLE IF EXISTS `e_job_mail`;
CREATE TABLE `e_job_mail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `cc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recipient` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4s3qcpi4yo5jfvkoqbcu9r9s4`(`create_user_id`) USING BTREE,
  INDEX `FKir84uifi8bw52ucl5i1uxm1v6`(`update_user_id`) USING BTREE,
  CONSTRAINT `FK4s3qcpi4yo5jfvkoqbcu9r9s4` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKir84uifi8bw52ucl5i1uxm1v6` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job_mail
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  `eruptUser_id` bigint(20) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjqnr9oel32kajm6bpvqwomv6m`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FKjqnr9oel32kajm6bpvqwomv6m` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (108, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:10:45', '0|0|0|内网IP|内网IP', 'Windows 10', 2, NULL, 'QRR2Tq3BxwlL9zAb');
INSERT INTO `e_upms_login_log` VALUES (109, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:12:28', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'dMFEpUtcTa1R9zT2');
INSERT INTO `e_upms_login_log` VALUES (110, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:20:57', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'cyWh10tpLAY1xHHT');
INSERT INTO `e_upms_login_log` VALUES (111, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:26:11', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'IeVkiGYByzHfGJLh');
INSERT INTO `e_upms_login_log` VALUES (112, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:39:02', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'mW23LMwC5M3PfhCz');
INSERT INTO `e_upms_login_log` VALUES (113, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:44:39', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'qKGSItU8YAFFvtcU');
INSERT INTO `e_upms_login_log` VALUES (114, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:56:27', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'YJKIlCuo2vL0kpO1');
INSERT INTO `e_upms_login_log` VALUES (115, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 22:59:44', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, '9nfFHQg8K19LogLd');
INSERT INTO `e_upms_login_log` VALUES (116, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 23:10:48', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'EhmTyh8ioZWRpB0d');
INSERT INTO `e_upms_login_log` VALUES (117, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 23:37:22', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'nFpi1tLMv5iY7SDf');
INSERT INTO `e_upms_login_log` VALUES (118, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 23:40:27', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'NeaQYxMLgI47Rlvs');
INSERT INTO `e_upms_login_log` VALUES (119, 'Chrome 8 87', 'Computer', '192.168.2.246', '2021-02-24 23:45:55', '0|0|0|内网IP|内网IP', 'Windows 10', 10, NULL, 'ZxuicD7PJy4H2uYf');

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `parent_menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK4p5siq6l1rf9y47bosayghcsv`(`create_user_id`) USING BTREE,
  INDEX `FKtm66wffkyyluinneyva8kd2bc`(`update_user_id`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK4p5siq6l1rf9y47bosayghcsv` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtm66wffkyyluinneyva8kd2bc` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, NULL, NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, NULL, NULL, 'EruptMenu', 'fa fa-list-ul', '菜单维护', NULL, 10, 1, 'tree', 'EruptMenu', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (3, NULL, NULL, 'EruptRole', NULL, '角色维护', NULL, 20, 1, 'table', 'EruptRole', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (4, NULL, NULL, 'EruptOrg', 'fa fa-users', '组织维护', NULL, 30, 1, 'tree', 'EruptOrg', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (5, NULL, NULL, 'EruptUser', 'fa fa-user', '用户维护', NULL, 40, 1, 'table', 'EruptUser', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (6, NULL, NULL, 'EruptDict', NULL, '字典维护', NULL, 50, 1, 'table', 'EruptDict', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (7, NULL, NULL, 'EruptDictItem', NULL, '字典项', NULL, 10, 2, 'table', 'EruptDictItem', NULL, NULL, 6);
INSERT INTO `e_upms_menu` VALUES (8, NULL, NULL, 'EruptLoginLog', NULL, '登录日志', NULL, 60, 1, 'table', 'EruptLoginLog', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (9, NULL, NULL, 'EruptOperateLog', NULL, '操作日志', NULL, 70, 1, 'table', 'EruptOperateLog', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (10, NULL, NULL, '$job', 'fa fa-cubes', '任务管理', NULL, 30, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (11, NULL, NULL, 'EruptJob', 'fa fa-tasks', '任务维护', NULL, 0, 1, 'table', 'EruptJob', NULL, NULL, 10);
INSERT INTO `e_upms_menu` VALUES (12, NULL, NULL, 'EruptJobLog', 'fa fa-file-text', '任务日志', NULL, 10, 1, 'table', 'EruptJobLog', NULL, NULL, 10);
INSERT INTO `e_upms_menu` VALUES (13, NULL, NULL, 'EruptMail', 'fa fa-envelope-o', '发送邮件', NULL, 20, 1, 'table', 'EruptMail', NULL, NULL, 10);
INSERT INTO `e_upms_menu` VALUES (14, NULL, '2021-02-03 14:29:59', '$generator', 'fa fa-code', '代码生成', NULL, 200, 1, NULL, NULL, NULL, 2, NULL);
INSERT INTO `e_upms_menu` VALUES (15, NULL, NULL, 'GeneratorClass', NULL, '生成Erupt代码', NULL, 0, 1, 'table', 'GeneratorClass', NULL, NULL, 14);
INSERT INTO `e_upms_menu` VALUES (16, '2021-02-03 00:21:52', NULL, 'Book', 'fa fa-cogs', '订票管理', NULL, 80, 1, NULL, 'Book', 2, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (17, '2021-02-03 00:22:17', NULL, 'User', NULL, '用户管理', NULL, 90, 1, 'table', 'User', 2, NULL, 16);
INSERT INTO `e_upms_menu` VALUES (18, '2021-02-03 00:23:38', '2021-02-03 00:25:18', 'Train', NULL, '列车管理', NULL, 100, 1, 'table', 'Train', 2, 2, 16);
INSERT INTO `e_upms_menu` VALUES (19, '2021-02-03 14:30:33', NULL, 'Station', NULL, '站点管理', NULL, 210, 1, 'table', 'Station', 2, NULL, 16);
INSERT INTO `e_upms_menu` VALUES (20, '2021-02-03 14:30:56', NULL, 'Line', NULL, '线路管理', NULL, 220, 1, 'table', 'Line', 2, NULL, 16);
INSERT INTO `e_upms_menu` VALUES (22, '2021-02-03 14:36:22', NULL, 'Orders', NULL, '订单管理', NULL, 240, 1, 'table', 'Orders', 2, NULL, 16);
INSERT INTO `e_upms_menu` VALUES (24, '2021-02-03 20:26:32', NULL, 'Trips', NULL, '车次管理', NULL, 230, 1, 'table', 'Trips', 2, NULL, 16);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_addr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint(20) NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27xepkxthq9snq3yk6k7iad33`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FK27xepkxthq9snq3yk6k7iad33` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (255, '新增 | 用户', '2021-02-24 22:11:25', NULL, '192.168.2.246', '0|0|0|内网IP|内网IP', 'http://localhost:8088/erupt-api/data/modify/EruptUser', 'POST', '{\"account\":\"admin\",\"name\":\"admin\",\"status\":true,\"eruptMenu\":{\"id\":\"1\",\"name\":\"系统管理\"},\"eruptOrg\":{\"id\":\"1\",\"name\":\"公司管理层\"},\"password\":\"admin\",\"password2\":\"admin\",\"isMd5\":true,\"roles\":[{\"id\":\"2\"}]}', b'1', 12, 2);
INSERT INTO `e_upms_operate_log` VALUES (256, '修改 | 用户角色', '2021-02-24 22:11:47', NULL, '192.168.2.246', '0|0|0|内网IP|内网IP', 'http://localhost:8088/erupt-api/data/modify/EruptRole', 'PUT', '{\"code\":\"superAdmin\",\"name\":\"超级管理员\",\"status\":true,\"menus\":[{\"id\":\"1\"},{\"id\":\"2\"},{\"id\":\"3\"},{\"id\":\"4\"},{\"id\":\"5\"},{\"id\":\"6\"},{\"id\":\"7\"},{\"id\":\"8\"},{\"id\":\"9\"},{\"id\":\"10\"},{\"id\":\"11\"},{\"id\":\"12\"},{\"id\":\"13\"},{\"id\":\"14\"},{\"id\":\"15\"},{\"id\":\"16\"},{\"id\":\"17\"},{\"id\":\"18\"},{\"id\":\"19\"},{\"id\":\"20\"},{\"id\":\"22\"},{\"id\":\"24\"}],\"users\":[{\"id\":\"10\"}],\"id\":\"3\"}', b'1', 62, 2);
INSERT INTO `e_upms_operate_log` VALUES (257, '修改 | 用户', '2021-02-24 22:20:45', NULL, '192.168.2.246', '0|0|0|内网IP|内网IP', 'http://localhost:8088/erupt-api/data/modify/EruptUser', 'PUT', '{\"account\":\"admin\",\"name\":\"管理员\",\"status\":true,\"eruptMenu\":{\"id\":\"1\",\"name\":\"系统管理\"},\"eruptOrg\":{\"id\":\"1\",\"name\":\"公司管理层\"},\"isMd5\":true,\"roles\":[{\"id\":\"3\"}],\"id\":\"10\"}', b'1', 22, 10);
INSERT INTO `e_upms_operate_log` VALUES (258, '修改 | 车次', '2021-02-24 23:00:43', NULL, '192.168.2.246', '0|0|0|内网IP|内网IP', 'http://localhost:8088/erupt-api/data/modify/Trips', 'PUT', '{\"trips_id\":3,\"line\":{\"line_id\":4},\"trips_train_name\":\"G789\",\"trips_start_time\":\"2021-02-24 23:00:00\",\"trips_end_time\":\"2021-02-24 00:00:00\",\"trips_first_seat_num\":0,\"trips_second_seat_num\":3,\"trips_first_seat_price\":400,\"trips_second_seat_price\":300.5}', b'1', 170, 10);
INSERT INTO `e_upms_operate_log` VALUES (259, '修改 | 车次', '2021-02-24 23:01:07', NULL, '192.168.2.246', '0|0|0|内网IP|内网IP', 'http://localhost:8088/erupt-api/data/modify/Trips', 'PUT', '{\"trips_id\":3,\"line\":{\"line_id\":4},\"trips_train_name\":\"G789\",\"trips_start_time\":\"2021-02-24 23:00:00\",\"trips_end_time\":\"2021-02-24 00:00:00\",\"trips_first_seat_num\":0,\"trips_second_seat_num\":3,\"trips_first_seat_price\":400,\"trips_second_seat_price\":300.5}', b'1', 15, 10);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `parent_org_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------
INSERT INTO `e_upms_org` VALUES (1, 'admin', '公司管理层', NULL, NULL);
INSERT INTO `e_upms_org` VALUES (2, 'technology', '技术部', NULL, 1);
INSERT INTO `e_upms_org` VALUES (3, 'personnel', '人事部', NULL, 1);

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------
INSERT INTO `e_upms_role` VALUES (2, 'normalAdmin', '普通管理员', b'1');
INSERT INTO `e_upms_role` VALUES (3, 'superAdmin', '超级管理员', b'1');

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------
INSERT INTO `e_upms_role_menu` VALUES (3, 1);
INSERT INTO `e_upms_role_menu` VALUES (3, 2);
INSERT INTO `e_upms_role_menu` VALUES (3, 3);
INSERT INTO `e_upms_role_menu` VALUES (3, 4);
INSERT INTO `e_upms_role_menu` VALUES (3, 5);
INSERT INTO `e_upms_role_menu` VALUES (3, 6);
INSERT INTO `e_upms_role_menu` VALUES (3, 7);
INSERT INTO `e_upms_role_menu` VALUES (3, 8);
INSERT INTO `e_upms_role_menu` VALUES (3, 9);
INSERT INTO `e_upms_role_menu` VALUES (2, 10);
INSERT INTO `e_upms_role_menu` VALUES (3, 10);
INSERT INTO `e_upms_role_menu` VALUES (2, 11);
INSERT INTO `e_upms_role_menu` VALUES (3, 11);
INSERT INTO `e_upms_role_menu` VALUES (2, 12);
INSERT INTO `e_upms_role_menu` VALUES (3, 12);
INSERT INTO `e_upms_role_menu` VALUES (2, 13);
INSERT INTO `e_upms_role_menu` VALUES (3, 13);
INSERT INTO `e_upms_role_menu` VALUES (3, 14);
INSERT INTO `e_upms_role_menu` VALUES (3, 15);
INSERT INTO `e_upms_role_menu` VALUES (2, 16);
INSERT INTO `e_upms_role_menu` VALUES (3, 16);
INSERT INTO `e_upms_role_menu` VALUES (2, 17);
INSERT INTO `e_upms_role_menu` VALUES (3, 17);
INSERT INTO `e_upms_role_menu` VALUES (2, 18);
INSERT INTO `e_upms_role_menu` VALUES (3, 18);
INSERT INTO `e_upms_role_menu` VALUES (2, 19);
INSERT INTO `e_upms_role_menu` VALUES (3, 19);
INSERT INTO `e_upms_role_menu` VALUES (2, 20);
INSERT INTO `e_upms_role_menu` VALUES (3, 20);
INSERT INTO `e_upms_role_menu` VALUES (2, 22);
INSERT INTO `e_upms_role_menu` VALUES (3, 22);
INSERT INTO `e_upms_role_menu` VALUES (2, 24);
INSERT INTO `e_upms_role_menu` VALUES (3, 24);

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_menu_id` bigint(20) NULL DEFAULT NULL,
  `erupt_org_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_post_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account`) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id`) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id`) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id`) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id`) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id`) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (2, '2021-02-03 00:48:15', '2021-02-07 22:27:56', 'GDPU', b'0', b'1', '马先生', 'e5b73c71149d22e60f4e2446a9903937', NULL, b'1', NULL, 2, 2, 16, 2, NULL, NULL, NULL);
INSERT INTO `e_upms_user` VALUES (10, '2021-02-24 22:11:25', '2021-02-24 22:20:45', 'admin', b'0', b'1', '管理员', '21232f297a57a5a743894a0e4a801fc3', NULL, b'1', NULL, 2, 10, 1, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------
INSERT INTO `e_upms_user_role` VALUES (2, 2);
INSERT INTO `e_upms_user_role` VALUES (10, 3);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (33);

-- ----------------------------
-- Table structure for line
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line`  (
  `line_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `line_start_station_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '起始站点',
  `line_end_station_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到达站点',
  PRIMARY KEY (`line_id`) USING BTREE,
  UNIQUE INDEX `unique`(`line_start_station_name`, `line_end_station_name`) USING BTREE,
  INDEX `end_station`(`line_start_station_name`) USING BTREE,
  INDEX `start_station`(`line_end_station_name`) USING BTREE,
  CONSTRAINT `end_station` FOREIGN KEY (`line_start_station_name`) REFERENCES `station` (`station_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `start_station` FOREIGN KEY (`line_end_station_name`) REFERENCES `station` (`station_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES (26, '三亚市', '广州市');
INSERT INTO `line` VALUES (7, '哈尔滨市', '广州市');
INSERT INTO `line` VALUES (4, '广州市', '上海市');
INSERT INTO `line` VALUES (24, '广州市', '中山市');
INSERT INTO `line` VALUES (9, '广州市', '哈尔滨市');
INSERT INTO `line` VALUES (25, '广州市', '汕头市');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_user_id` int(10) NOT NULL COMMENT '用户编号',
  `order_trips_id` int(10) NOT NULL COMMENT '车次编号',
  `order_create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `order_update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `order_status` int(4) NOT NULL COMMENT '订单状态（0：创建，1：已发车，2：退票，3：改签）',
  `order_passenger_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '乘车人姓名',
  `order_linkman_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `order_linkman_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `order_passenger_identity_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '乘车人身份证号码',
  `order_seat_level` int(2) NOT NULL COMMENT '订购的坐席（一等座/二等座，分别为1，2）',
  `order_price` float(7, 2) NOT NULL COMMENT '订单金额',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user`(`order_user_id`) USING BTREE,
  INDEX `trips`(`order_trips_id`) USING BTREE,
  CONSTRAINT `trips` FOREIGN KEY (`order_trips_id`) REFERENCES `trips` (`trips_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1753, 25, 3, '2021-02-23 22:55:41', '2021-02-23 23:27:52', 2, '冲', '马先生', '15914967057', '440582199806065917', 2, 300.50);
INSERT INTO `orders` VALUES (1755, 25, 3, '2021-02-23 22:55:41', '2021-02-23 23:27:56', 3, '冲', '马先生', '15914967057', '440582199806065917', 2, 300.50);
INSERT INTO `orders` VALUES (1773, 25, 3, '2021-02-23 22:55:41', '2021-02-23 23:28:00', 2, '冲', '马先生', '15914967057', '440582199806065917', 2, 300.50);
INSERT INTO `orders` VALUES (2253, 25, 29, '2021-02-23 23:27:56', '2021-02-23 23:27:59', 2, '冲', '马先生', '15914967057', '440582199806065917', 2, 600.80);
INSERT INTO `orders` VALUES (2254, 25, 28, '2021-02-24 01:14:38', '2021-02-24 01:14:41', 2, '马先生', '马先生', '15914967057', '440582199806065921', 1, 600.50);
INSERT INTO `orders` VALUES (2255, 25, 29, '2021-02-24 01:14:53', '2021-02-24 01:15:00', 3, '冲', '马先生', '15914967057', '440582199806065917', 1, 888.80);
INSERT INTO `orders` VALUES (2256, 25, 3, '2021-02-24 01:15:00', '2021-02-24 01:15:03', 2, '冲', '马先生', '15914967057', '440582199806065917', 1, 400.00);
INSERT INTO `orders` VALUES (2257, 25, 3, '2021-02-24 22:25:23', NULL, 0, '马先生', '马先生', '15914967057', '440582199806065921', 1, 400.00);

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `station_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `station_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站名',
  `station_adress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`station_id`) USING BTREE,
  UNIQUE INDEX `station_name`(`station_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES (1, '广州市', '广东省广州市天河区');
INSERT INTO `station` VALUES (2, '上海市', '上海市');
INSERT INTO `station` VALUES (4, '哈尔滨市', '黑龙江省哈尔滨市');
INSERT INTO `station` VALUES (15, '北京市', '北京市');
INSERT INTO `station` VALUES (16, '汕头市', '广东省汕头市潮阳区');
INSERT INTO `station` VALUES (17, '深圳市', '广东省深圳市');
INSERT INTO `station` VALUES (18, '中山市', '广东省中山市');
INSERT INTO `station` VALUES (19, '天津市', '天津市');
INSERT INTO `station` VALUES (20, '重庆市', '重庆市');
INSERT INTO `station` VALUES (21, '三亚市', '海南省三亚市');
INSERT INTO `station` VALUES (22, '长沙市', '湖南省长沙市');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `train_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `train_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列车名称，类似G6340',
  `train_speed` float(4, 1) NULL DEFAULT NULL COMMENT '列车的最大速度',
  `train_seat_num` int(4) NOT NULL COMMENT '列车的座位数量',
  PRIMARY KEY (`train_id`) USING BTREE,
  UNIQUE INDEX `train_name`(`train_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (2, 'G789', 306.7, 759);
INSERT INTO `train` VALUES (6, 'T300', 300.5, 1000);
INSERT INTO `train` VALUES (13, 'T456', 300.6, 1000);
INSERT INTO `train` VALUES (14, 'T784', 255.6, 800);

-- ----------------------------
-- Table structure for trips
-- ----------------------------
DROP TABLE IF EXISTS `trips`;
CREATE TABLE `trips`  (
  `trips_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `trips_line_id` int(10) NOT NULL COMMENT '线路编号',
  `trips_train_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列车名称',
  `trips_start_time` datetime(0) NOT NULL COMMENT '出发时间',
  `trips_end_time` datetime(0) NOT NULL COMMENT '到达时间',
  `trips_first_seat_num` int(4) NOT NULL COMMENT '一等座剩余座位数量',
  `trips_second_seat_num` int(4) NOT NULL COMMENT '二等座剩余座位数量',
  `trips_first_seat_price` float(6, 2) NOT NULL COMMENT '一等座票价',
  `trips_second_seat_price` float(6, 2) NOT NULL COMMENT '二等座票价',
  `trips_delete_flag` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除（0 未删除、1 删除）',
  PRIMARY KEY (`trips_id`) USING BTREE,
  INDEX `line`(`trips_line_id`) USING BTREE,
  INDEX `train`(`trips_train_name`) USING BTREE,
  CONSTRAINT `line` FOREIGN KEY (`trips_line_id`) REFERENCES `line` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train` FOREIGN KEY (`trips_train_name`) REFERENCES `train` (`train_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trips
-- ----------------------------
INSERT INTO `trips` VALUES (3, 4, 'G789', '2021-02-24 23:00:00', '2021-02-24 00:00:00', 0, 3, 400.00, 300.50, 1);
INSERT INTO `trips` VALUES (28, 4, 'G789', '2021-03-01 15:44:35', '2021-03-01 20:44:55', 1000, 10000, 600.50, 500.00, 0);
INSERT INTO `trips` VALUES (29, 4, 'T456', '2021-03-01 10:46:53', '2021-03-01 14:46:46', 1000, 88887, 888.80, 600.80, 0);
INSERT INTO `trips` VALUES (30, 4, 'T300', '2021-03-01 14:48:10', '2021-03-01 18:48:14', 200, 101, 600.00, 500.00, 0);
INSERT INTO `trips` VALUES (31, 4, 'T456', '2021-03-01 14:57:56', '2021-03-01 14:58:00', 500, 100, 600.00, 500.00, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_login_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码（md5存储+盐）',
  `user_salt` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `user_sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `user_birth` date NULL DEFAULT NULL COMMENT '生日',
  `user_identity_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_login_name`(`user_login_name`) USING BTREE COMMENT '提高查找用户的速度'
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (24, 'ma', 'b0247e11c3c4676fe7382bab7df76f99', 'f42ecd7a95c6d82aac6dda8657048312', '男', '15913967085', '1908739556@qq.com', '2021-02-19', '440582199002013475');
INSERT INTO `user` VALUES (25, 'GDPU', 'f396d2e1652f041a770531f8de2b9e6d', '0bc25ed9ff7ad7b8eeca8a6b25bbfa07', '男', '15913068084', '1908739556@qq.com', '2021-02-28', '440582199708085830');

SET FOREIGN_KEY_CHECKS = 1;
