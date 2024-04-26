/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : phms

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 10/04/2022 15:46:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `app_time` datetime(0) DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (39, 32, 42, 43, '2022-04-25 20:33:08', '腹泻', '2022-04-25 20:33:11', 4, '12233332222', '辽宁');
INSERT INTO `appointment` VALUES (40, 34, 46, 43, '2022-04-25 00:00:00', '一直呕吐', '2022-04-25 20:20:25', 4, '18623567856', '辽宁省青泥洼');
INSERT INTO `appointment` VALUES (41, 35, 46, 43, '2022-04-25 21:23:56', '食欲不振，饭量减少', '2022-04-25 21:23:59', 4, '17788885555', '辽宁省青泥洼');

-- ----------------------------
-- Table structure for diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `diagnosis`;
CREATE TABLE `diagnosis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diagnosis
-- ----------------------------
INSERT INTO `diagnosis` VALUES (21, 32, 42, 43, '需要到医院就医，查看具体情况。', 1, 1, '2022-04-24 11:27:19');
INSERT INTO `diagnosis` VALUES (22, 34, 46, 43, '可能是体内有虫，需至医院进一步观察。', 3, 1, '2022-04-25 13:37:02');
INSERT INTO `diagnosis` VALUES (23, 35, 46, 43, '再观察一段时间，若无好转到医院观察', 1, 1, '2022-04-25 17:07:43');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `view_count` bigint(20) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (2, '<p>狗狗大些才能打狂犬疫苗，每年打一次。而且必须在狗狗熟悉了新环境，身体健康的情况下才能打，疫苗期间不能洗澡。狗狗还要定期驱虫，吃驱虫药就行。驱虫和疫苗不要同时进行，间隔一两个礼拜比较好。驱虫幼犬隔3个月一次，成年犬隔半年一次。</p>\n\n<p>如果确定要给狗狗打疫苗，那每年注射是必要的，而且一般来说次年的疫苗应该比上一年的注射时间提早半个月到一个月，避免在疫苗快要失效的时候发生意外。</p>', 3, '2020-04-25 22:10:52', '宠物预防针多久打一次');
INSERT INTO `notice` VALUES (3, '<p>请填写文字内容</p>\n\n<p>如果你的小狗已经出现了一定情况的问题，那么请先从自己／现有环境的身上找原因&mdash;&mdash;毕竟养狗行为课程，其实最重要的不是小狗，而是小狗的主人。</p>\n\n<p>我们对待小狗的方式，就是我们对待小孩，或者说是童年的自己的方式。是选择恐吓训斥，让他们永远失去好奇心，对周围充满恐惧？还是选择给小孩以积极尊重，探索周边，予以互动？培养小狗的自信心和成就感，也是重要的课程内容。</p>\n\n<p>&nbsp;</p>', 5, '2020-04-26 11:35:09', '养犬最重要的是什么？');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int(11) DEFAULT NULL COMMENT '父页面id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面地址',
  `level_type` int(11) DEFAULT NULL COMMENT '页面层级',
  `level_index` int(11) DEFAULT NULL COMMENT '页面索引',
  `delete_flag` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否删除',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 0, '系统设置', NULL, 0, 10, 0, 'manager');
INSERT INTO `page` VALUES (2, 1, '用户管理', '/admin/userPage', 1, 22, 0, 'manager');
INSERT INTO `page` VALUES (3, 1, '页面管理', '/admin/page', 1, 23, 0, 'manager');
INSERT INTO `page` VALUES (4, 1, '角色管理', '/admin/role', 1, 24, 0, 'manager');
INSERT INTO `page` VALUES (6, 0, '宠物管理', '', 0, 1, 0, 'left_menu_shop');
INSERT INTO `page` VALUES (7, 6, '宠物列表', '/user/pet/petList', 1, 1, 0, '');
INSERT INTO `page` VALUES (8, 6, '宠物健康史', '/user/diagnosis/diagnosisList', 1, 2, 0, '');
INSERT INTO `page` VALUES (9, 0, '预约管理', '', 0, 2, 0, 'left_menu_data');
INSERT INTO `page` VALUES (10, 9, '预约列表', '/user/apply/applyList', 1, 1, 0, '');
INSERT INTO `page` VALUES (12, 0, '日常健康', '', 0, 3, 0, 'user');
INSERT INTO `page` VALUES (13, 12, '健康指南', '/user/notice/list', 1, 1, 0, '');
INSERT INTO `page` VALUES (14, 12, '健康监测', '/health/assess', 1, 2, 0, '');
INSERT INTO `page` VALUES (19, 0, '宠物档案', '', 0, 4, 0, 'left_menu_house');
INSERT INTO `page` VALUES (20, 19, '预约统计', '/health/tjApply', 1, 1, 0, '');
INSERT INTO `page` VALUES (21, 0, '医院管理', '', 0, 5, 0, 'page');
INSERT INTO `page` VALUES (23, 21, '预约统计', '/health/tjApplyDoctor', 1, 2, 0, '');
INSERT INTO `page` VALUES (24, 21, '发布指南', '/user/notice/publish', 1, 3, 0, '');
INSERT INTO `page` VALUES (27, 19, '宠物日志', '/user/petDaily/petDailyList', 1, 2, 0, '');
INSERT INTO `page` VALUES (28, 19, '预约统计', '/health/tjApply', 1, 3, 0, NULL);
INSERT INTO `page` VALUES (30, 6, '宠物健康史', '/user/diagnosis/diagnosisListDoctor', 1, 3, 0, '');
INSERT INTO `page` VALUES (31, 9, '预约列表-', '/user/apply/applyListDoctor', 1, 3, 0, NULL);
INSERT INTO `page` VALUES (32, 21, '标准制定', '/user/standard/standardListDoctor', 1, 4, 0, NULL);
INSERT INTO `page` VALUES (33, 12, '健康标准', '/user/standard/standardList', 1, 3, 0, NULL);
INSERT INTO `page` VALUES (34, 19, '宠物日志-', '/user/petDaily/petDailyListDoctor', 1, 4, 0, NULL);
INSERT INTO `page` VALUES (35, 19, '日志图表', '/health/tjDaily', 1, 5, 0, NULL);
INSERT INTO `page` VALUES (36, 21, '宠物日志', '/health/tjDailyDoctor', 1, 5, 0, NULL);
INSERT INTO `page` VALUES (37, 9, '医生时间', '/health/freeTime', 1, 4, 0, NULL);
INSERT INTO `page` VALUES (38, 21, '指南列表', '/user/notice/listDoctor', 1, 6, 0, '');

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `weight` double(10, 2) DEFAULT NULL,
  `height` double(10, 2) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` datetime(0) DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (32, 42, '坚果仁', 5.00, 25.00, '1', '2021-12-17 00:00:00', NULL, '2022-04-24 22:51:21');
INSERT INTO `pet` VALUES (33, 1, '雪球', 18.00, 60.00, '2', '2021-05-05 00:00:00', NULL, '2022-04-25 23:05:12');
INSERT INTO `pet` VALUES (34, 46, '小毛球', 8.00, 15.00, '1', '2021-12-25 00:00:00', NULL, '2022-04-25 06:58:26');

-- ----------------------------
-- Table structure for pet_daily
-- ----------------------------
DROP TABLE IF EXISTS `pet_daily`;
CREATE TABLE `pet_daily`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `temperature` double(10, 2) DEFAULT NULL,
  `weight` double(10, 2) DEFAULT NULL,
  `height` double(10, 2) DEFAULT NULL,
  `appetite` double(10, 2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet_daily
-- ----------------------------
INSERT INTO `pet_daily` VALUES (28, 50, 1, 38.00, 7.00, 16.00, 8.00, 1, '2022-04-28 07:03:16');
INSERT INTO `pet_daily` VALUES (29, 42, 1, 38.00, 5.00, 12.00, 6.00, 1, '2022-04-28 07:10:35');
INSERT INTO `pet_daily` VALUES (30, 48, 1, 39.00, 18.00, 35.00, 20.00, 1, '2022-04-28 07:17:13');
INSERT INTO `pet_daily` VALUES (31, 33, 1, 38.50, 18.00, 60.00, 22.00, 1, '2022-04-28 07:36:22');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员');
INSERT INTO `role` VALUES (2, '普通用户', '普通用户');
INSERT INTO `role` VALUES (3, '医生', '医生');

-- ----------------------------
-- Table structure for role_page
-- ----------------------------
DROP TABLE IF EXISTS `role_page`;
CREATE TABLE `role_page`  (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `page_id` int(11) DEFAULT NULL COMMENT '页面id',
  PRIMARY KEY (`rp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 889 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_page
-- ----------------------------
INSERT INTO `role_page` VALUES (1, 1, 1);
INSERT INTO `role_page` VALUES (2, 1, 2);
INSERT INTO `role_page` VALUES (3, 1, 3);
INSERT INTO `role_page` VALUES (4, 1, 4);
INSERT INTO `role_page` VALUES (803, 2, 6);
INSERT INTO `role_page` VALUES (804, 2, 7);
INSERT INTO `role_page` VALUES (805, 2, 8);
INSERT INTO `role_page` VALUES (806, 2, 9);
INSERT INTO `role_page` VALUES (807, 2, 10);
INSERT INTO `role_page` VALUES (808, 2, 37);
INSERT INTO `role_page` VALUES (809, 2, 12);
INSERT INTO `role_page` VALUES (810, 2, 13);
INSERT INTO `role_page` VALUES (811, 2, 14);
INSERT INTO `role_page` VALUES (812, 2, 33);
INSERT INTO `role_page` VALUES (813, 2, 19);
INSERT INTO `role_page` VALUES (814, 2, 27);
INSERT INTO `role_page` VALUES (815, 2, 28);
INSERT INTO `role_page` VALUES (816, 2, 35);
INSERT INTO `role_page` VALUES (852, 3, 6);
INSERT INTO `role_page` VALUES (853, 3, 30);
INSERT INTO `role_page` VALUES (854, 3, 9);
INSERT INTO `role_page` VALUES (855, 3, 31);
INSERT INTO `role_page` VALUES (856, 3, 37);
INSERT INTO `role_page` VALUES (857, 3, 19);
INSERT INTO `role_page` VALUES (858, 3, 34);
INSERT INTO `role_page` VALUES (859, 3, 21);
INSERT INTO `role_page` VALUES (860, 3, 23);
INSERT INTO `role_page` VALUES (861, 3, 24);
INSERT INTO `role_page` VALUES (862, 3, 32);
INSERT INTO `role_page` VALUES (863, 3, 36);
INSERT INTO `role_page` VALUES (864, 3, 38);
INSERT INTO `role_page` VALUES (865, 1, 6);
INSERT INTO `role_page` VALUES (866, 1, 7);
INSERT INTO `role_page` VALUES (867, 1, 8);
INSERT INTO `role_page` VALUES (868, 1, 30);
INSERT INTO `role_page` VALUES (869, 1, 9);
INSERT INTO `role_page` VALUES (870, 1, 10);
INSERT INTO `role_page` VALUES (871, 1, 31);
INSERT INTO `role_page` VALUES (872, 1, 37);
INSERT INTO `role_page` VALUES (873, 1, 12);
INSERT INTO `role_page` VALUES (874, 1, 13);
INSERT INTO `role_page` VALUES (875, 1, 14);
INSERT INTO `role_page` VALUES (876, 1, 33);
INSERT INTO `role_page` VALUES (877, 1, 19);
INSERT INTO `role_page` VALUES (878, 1, 20);
INSERT INTO `role_page` VALUES (879, 1, 27);
INSERT INTO `role_page` VALUES (880, 1, 28);
INSERT INTO `role_page` VALUES (881, 1, 34);
INSERT INTO `role_page` VALUES (882, 1, 35);
INSERT INTO `role_page` VALUES (883, 1, 21);
INSERT INTO `role_page` VALUES (884, 1, 23);
INSERT INTO `role_page` VALUES (885, 1, 24);
INSERT INTO `role_page` VALUES (886, 1, 32);
INSERT INTO `role_page` VALUES (887, 1, 36);
INSERT INTO `role_page` VALUES (888, 1, 38);

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `age_min` int(10) DEFAULT NULL,
  `age_max` int(10) DEFAULT NULL,
  `temp_min` double(10, 2) DEFAULT NULL,
  `temp_max` double(10, 2) DEFAULT NULL,
  `weight_min` double(10, 2) DEFAULT NULL,
  `weight_max` double(10, 2) DEFAULT NULL,
  `height_min` double(10, 2) DEFAULT NULL,
  `height_max` double(10, 2) DEFAULT NULL,
  `appetite_min` double(10, 2) DEFAULT NULL,
  `appetite_max` double(10, 2) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES (5, 1, 20, 37.00, 40.00, 5.00, 15.00, 10.00, 25.00, 10.00, 20.00, '2', 1);
INSERT INTO `standard` VALUES (6, 1, 20, 37.00, 40.00, 15.00, 35.00, 20.00, 100.00, 30.00, 50.00, '2', 1);
INSERT INTO `standard` VALUES (7, 1, 15, 37.00, 39.00, 5.00, 20.00, 10.00, 40.00, 5.00, 15.00, '1', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qualification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hospital_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hospital_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '555@qq.com', '222222222222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18888889998', '222', NULL);
INSERT INTO `user` VALUES (42, NULL, '刘佳雪', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18860881111', '辽宁', '2022-03-12 11:13:18');
INSERT INTO `user` VALUES (43, NULL, '刘医生', 'e10adc3949ba59abbe56e057f20f883e', '2463775427@qq.com', '120512197902198723', NULL, NULL, '甘井子区医院', '辽宁省大连市甘井子区', '外科手术医生', NULL, NULL, '18860882222', NULL, '2022-04-24 11:21:43');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', 1);
INSERT INTO `user_role` VALUES (170, '25', 2);
INSERT INTO `user_role` VALUES (171, '26', 3);
INSERT INTO `user_role` VALUES (172, '30', 3);
INSERT INTO `user_role` VALUES (173, '31', 3);
INSERT INTO `user_role` VALUES (179, '37', 2);
INSERT INTO `user_role` VALUES (180, '38', 2);
INSERT INTO `user_role` VALUES (181, '39', 2);

SET FOREIGN_KEY_CHECKS = 1;
