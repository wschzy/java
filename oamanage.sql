/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : 129.204.116.56:8080
 Source Schema         : oamanage

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 18/12/2019 16:03:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `supnumber` int(10) NULL DEFAULT NULL COMMENT '父级编码',
  `dicclass` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `levels` int(10) NULL DEFAULT NULL COMMENT '等级',
  `serial` int(10) NULL DEFAULT NULL COMMENT '序号',
  `tagone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注1',
  `tagtwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (180, '同意', NULL, '审批', '', NULL, NULL, '', '');
INSERT INTO `sys_dictionary` VALUES (181, '拒绝', NULL, '审批', '', NULL, NULL, '', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PID` int(10) NULL DEFAULT NULL,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DISPLAY` int(1) NULL DEFAULT NULL,
  `LEVEL` int(1) NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SERIAL` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '用户管理', NULL, NULL, 'user', 1);
INSERT INTO `sys_menu` VALUES (2, NULL, '信息采集', NULL, NULL, 'category', 2);

-- ----------------------------
-- Table structure for sys_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_userinfo`;
CREATE TABLE `sys_userinfo`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGINID` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PHONE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` int(1) NULL DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lrsj` datetime NULL DEFAULT NULL,
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isadmin` int(1) NULL DEFAULT NULL,
  `tag` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `LOGINID`(`LOGINID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------
INSERT INTO `sys_userinfo` VALUES (18, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', 1, '', '', '2018-12-17 16:59:39', '', 1, 1);
INSERT INTO `sys_userinfo` VALUES (19, 'wsc', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', 0, '王宝宝', '11@11.com', '2018-12-17 16:59:39', 'photo\\sys_userinfo\\19.jpg', NULL, 1);
INSERT INTO `sys_userinfo` VALUES (21, 'hzy', 'e10adc3949ba59abbe56e057f20f883e', '18506136679', 1, '胡子扬', 'xiaokeai@qq.com', '2019-01-10 15:00:25', 'photo\\sys_userinfo\\21.jpg', NULL, 1);
INSERT INTO `sys_userinfo` VALUES (27, '大宝贝', 'e10adc3949ba59abbe56e057f20f883e', '15585452121', 1, '胡大宝', 'dabaobei@qq.com', '2019-03-22 10:01:24', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (28, 'faker', 'e10adc3949ba59abbe56e057f20f883e', '18506136679', 0, 'hzy', '1312783878@qq.com', '2019-03-26 20:35:44', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (29, '小可爱', '123456', '15250025880', 0, '王宝宝', '11@11.com', '2019-04-09 17:06:42', NULL, NULL, 1);
INSERT INTO `sys_userinfo` VALUES (30, '111', 'e10adc3949ba59abbe56e057f20f883e', '15585452121', 1, '胡子扬', '11@11.com', '2019-04-10 09:46:21', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (31, 'qwqwqw', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', 0, 'abc2', '11@11.com', '2019-04-10 10:14:45', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (32, '小可爱wwwwww', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', 1, 'abc2qq', '11@11.com', '2019-04-10 10:31:00', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (33, '1212121', '28f673f31cdd6af50d1f0b8e2b71b9e5', '15855555555', 1, '11212', '11@11.com', '2019-04-10 11:20:50', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (34, '12121211111111', '3e0c3e37e068deb2969de450d841fbbf', '15250025880', 1, '121212111', '1212@11.cm', '2019-04-10 11:21:45', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (35, '小可爱222', '00c66aaf5f2c3f49946f15c1ad2ea0d3', '15250025880', 1, 'abc2qq', '11@11.com', '2019-04-10 11:29:56', NULL, NULL, 0);
INSERT INTO `sys_userinfo` VALUES (36, 'caojun', 'e10adc3949ba59abbe56e057f20f883e', '18506136678', 0, '曹骏', '', '2019-10-25 15:27:16', NULL, NULL, 1);

-- ----------------------------
-- Table structure for tb_forbid
-- ----------------------------
DROP TABLE IF EXISTS `tb_forbid`;
CREATE TABLE `tb_forbid`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGINID` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOGINTIMES` int(2) NULL DEFAULT NULL,
  `ISDISABLE` int(1) NULL DEFAULT NULL,
  `DISABLETIME` datetime NULL DEFAULT NULL,
  `ENABLETIME` datetime NULL DEFAULT NULL,
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_forbid
-- ----------------------------
INSERT INTO `tb_forbid` VALUES (1, 'hzy', 3, 0, NULL, '2019-03-26 20:34:33', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES (2, 'hzy', 1, 0, NULL, '2019-03-26 20:37:55', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES (3, 'hzy', 1, 0, NULL, '2019-03-26 21:06:00', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES (4, 'wsc', 4, 0, NULL, '2019-04-10 16:13:34', '114.220.98.210');
INSERT INTO `tb_forbid` VALUES (5, 'hzy', 2, 0, NULL, '2019-04-10 16:43:52', '114.220.98.210');
INSERT INTO `tb_forbid` VALUES (6, 'wsc', 3, 0, NULL, '2019-04-25 13:30:29', '121.238.236.16');
INSERT INTO `tb_forbid` VALUES (7, 'wsc', 1, 0, NULL, '2019-05-21 16:18:26', '221.225.125.19');
INSERT INTO `tb_forbid` VALUES (8, 'wsc', 3, 0, NULL, '2019-07-29 10:52:09', '127.0.0.1');
INSERT INTO `tb_forbid` VALUES (9, 'admin', 1, 0, NULL, '2019-10-25 15:26:37', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for user_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `user_dictionary`;
CREATE TABLE `user_dictionary`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `supnumber` int(10) NULL DEFAULT NULL COMMENT '父级编码',
  `dicclass` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `levels` int(10) NULL DEFAULT NULL COMMENT '等级',
  `serial` int(10) NULL DEFAULT NULL COMMENT '序号',
  `tagone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注1',
  `tagtwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注2',
  `userid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `重复导入`(`name`, `dicclass`, `userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_dictionary
-- ----------------------------
INSERT INTO `user_dictionary` VALUES (1, '支付宝', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (2, '微信', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (3, '中信信用卡', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (4, '广发信用卡', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (5, '中国工商银行', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (6, '中国银行', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (7, '其它', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (8, '中国农业银行', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (9, '现金', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (10, '分期乐', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (18, '滴滴出行', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (32, '滴嗒顺风车', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (33, '地铁', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (34, '公交', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (35, '出租车', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (40, '早餐', NULL, '伙食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (41, '午餐', NULL, '伙食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (42, '晚餐', NULL, '伙食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (43, '牛奶', NULL, '零食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (44, '羽绒服', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (45, '夜宵', NULL, '伙食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (46, '项链', NULL, '饰品', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (51, '小吃', NULL, '伙食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (53, '话费', NULL, '充值', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (54, '游戏', NULL, '充值', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (55, '电影票', NULL, '娱乐', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (56, '优酷VIP', NULL, '娱乐', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (57, '汗蒸', NULL, '休闲', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (58, '巴士', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (59, '火车', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (60, '高德', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (61, '水果', NULL, '零食', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (62, '其他', NULL, '零食', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (63, '奶茶', NULL, '零食', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (64, '美容', NULL, '休闲', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (65, '电脑', NULL, '办公', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (66, '租房', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (67, '网吧', NULL, '娱乐', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (70, '额外支出', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (71, '矿泉水、饮料', NULL, '零食', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (73, '裤', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (75, '内衣', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (76, '晾衣架', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (78, '袜子', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (81, '招商信用卡', NULL, '支出方式', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_dictionary` VALUES (83, '丝袜', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (84, '发饰', NULL, '饰品', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (85, '鞋', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (86, 'T恤', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (87, '外套', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (89, '帽', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (90, '医疗', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (91, '礼物', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (92, '自驾', NULL, '出行', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (93, '旅行', NULL, '休闲', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (95, '理发', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (96, '基础护肤', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (97, '衬衫', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (98, '家居', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (99, '手饰', NULL, '饰品', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (100, '裙', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (101, '日用', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (102, '包包', NULL, '饰品', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (103, '毛衣（打底衫）', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (104, '停车费', NULL, '车', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (105, '油费', NULL, '车', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (106, '过路费', NULL, '车', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (107, '洗车费', NULL, '车', NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `user_dictionary` VALUES (108, '快递', NULL, '通讯物流', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (109, '1111', NULL, '12', NULL, NULL, NULL, NULL, NULL, 36);
INSERT INTO `user_dictionary` VALUES (110, '睡衣', NULL, '服装', NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `user_dictionary` VALUES (111, '电子设备', NULL, '生活', NULL, NULL, NULL, NULL, NULL, 19);

-- ----------------------------
-- Table structure for user_home
-- ----------------------------
DROP TABLE IF EXISTS `user_home`;
CREATE TABLE `user_home`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PICTURE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NOTE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LRSJ` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_home
-- ----------------------------
INSERT INTO `user_home` VALUES (6, '(๑′ᴗ‵๑)Ｉ Lᵒᵛᵉᵧₒᵤ❤', 'photo\\user_home\\6.jpg', 'ヾ(◍°∇°◍)ﾉﾞ', '2019-02-18 14:10:31');

-- ----------------------------
-- Table structure for user_home_rel
-- ----------------------------
DROP TABLE IF EXISTS `user_home_rel`;
CREATE TABLE `user_home_rel`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `HOMEID` int(10) NOT NULL,
  `USERID` int(10) NOT NULL,
  `LRSJ` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `USERID`(`USERID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_home_rel
-- ----------------------------
INSERT INTO `user_home_rel` VALUES (54, 6, 19, '2019-03-14 15:58:26');
INSERT INTO `user_home_rel` VALUES (55, 6, 21, '2019-03-14 16:03:23');

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PID` int(10) NULL DEFAULT NULL,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DISPLAY` int(1) NULL DEFAULT NULL,
  `LEVEL` int(1) NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SERIAL` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES (1, NULL, '支出', NULL, NULL, 'spend', 1);
INSERT INTO `user_menu` VALUES (2, NULL, '信息采集', NULL, NULL, 'category', 2);
INSERT INTO `user_menu` VALUES (3, NULL, '概览', NULL, NULL, 'overview', 3);
INSERT INTO `user_menu` VALUES (4, NULL, '个人中心', NULL, NULL, 'personal', 4);

-- ----------------------------
-- Table structure for user_pay
-- ----------------------------
DROP TABLE IF EXISTS `user_pay`;
CREATE TABLE `user_pay`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `dicid` int(10) NOT NULL,
  `way` int(10) NOT NULL,
  `money` decimal(20, 2) NOT NULL,
  `time` datetime NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1058 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_pay
-- ----------------------------
INSERT INTO `user_pay` VALUES (1, 21, 46, 3, 998.00, '2019-01-31 17:00:42', '新年礼物项链');
INSERT INTO `user_pay` VALUES (2, 19, 33, 9, 60.00, '2019-02-12 12:03:27', '二月份地铁卡充值');
INSERT INTO `user_pay` VALUES (3, 21, 33, 9, 60.00, '2019-02-15 12:04:10', '二月份地铁卡充值');
INSERT INTO `user_pay` VALUES (4, 21, 91, 9, 400.00, '2019-02-04 12:10:19', '萱萱、悦悦压岁钱');
INSERT INTO `user_pay` VALUES (5, 21, 91, 9, 500.00, '2019-02-09 12:11:26', '王意林压岁钱');
INSERT INTO `user_pay` VALUES (6, 21, 91, 10, 1499.00, '2019-02-14 12:15:31', '王士成老爸手机');
INSERT INTO `user_pay` VALUES (7, 19, 34, 2, 50.00, '2019-02-12 13:20:42', '公交卡充值');
INSERT INTO `user_pay` VALUES (8, 21, 41, 2, 100.00, '2019-02-17 13:21:57', '好人小吃充值100');
INSERT INTO `user_pay` VALUES (9, 19, 34, 2, 2.00, '2019-02-13 13:23:14', '上班公交');
INSERT INTO `user_pay` VALUES (10, 21, 51, 2, 42.50, '2019-02-16 13:27:19', '萱萱、悦悦肯德基');
INSERT INTO `user_pay` VALUES (11, 21, 18, 2, 102.24, '2019-02-01 13:32:00', '2月19日之前微信滴滴打车总计');
INSERT INTO `user_pay` VALUES (12, 21, 55, 1, 293.48, '2019-02-04 13:49:49', '看电影');
INSERT INTO `user_pay` VALUES (13, 21, 91, 2, 144.48, '2019-02-01 13:34:37', '2月19日之前微信红包总计');
INSERT INTO `user_pay` VALUES (14, 21, 54, 2, 6.00, '2019-02-13 13:36:04', '三国手游充值');
INSERT INTO `user_pay` VALUES (15, 21, 34, 2, 3.00, '2019-02-01 13:37:23', '2月19日之前微信公交总计');
INSERT INTO `user_pay` VALUES (16, 21, 56, 1, 6.00, '2019-02-02 13:46:37', '优酷VIP');
INSERT INTO `user_pay` VALUES (18, 21, 55, 9, 200.00, '2019-02-06 13:50:42', '红旗电影院开卡');
INSERT INTO `user_pay` VALUES (19, 21, 57, 1, 196.00, '2019-02-07 13:51:58', '汗蒸');
INSERT INTO `user_pay` VALUES (20, 21, 18, 1, 155.50, '2019-02-10 14:01:23', '昆山到上海城');
INSERT INTO `user_pay` VALUES (21, 21, 58, 1, 119.00, '2019-02-06 14:03:12', '射阳');
INSERT INTO `user_pay` VALUES (22, 21, 59, 1, 32.50, '2019-02-12 14:03:48', '老爸去南京');
INSERT INTO `user_pay` VALUES (23, 21, 60, 1, 25.51, '2019-02-15 14:05:01', '2月15高德累计叫车');
INSERT INTO `user_pay` VALUES (24, 21, 53, 1, 33.57, '2019-02-19 14:06:45', '2月19日之前支付宝话费充值总计');
INSERT INTO `user_pay` VALUES (25, 21, 61, 1, 15.00, '2019-02-19 19:33:48', '小番茄 、猕猴桃');
INSERT INTO `user_pay` VALUES (26, 21, 51, 2, 13.50, '2019-02-20 11:53:05', '鸡排');
INSERT INTO `user_pay` VALUES (27, 21, 91, 2, 88.00, '2019-02-20 17:31:27', '胡军生日微信红包');
INSERT INTO `user_pay` VALUES (35, 21, 34, 2, 20.00, '2019-02-21 07:48:10', '市民卡充值');
INSERT INTO `user_pay` VALUES (36, 21, 62, 1, 8.80, '2019-02-21 13:31:06', '午饭');
INSERT INTO `user_pay` VALUES (37, 19, 41, 1, 19.52, '2019-02-21 13:32:04', '中午饭 （未带饭）');
INSERT INTO `user_pay` VALUES (38, 21, 53, 1, 19.98, '2019-02-22 23:12:41', '话费');
INSERT INTO `user_pay` VALUES (39, 19, 53, 1, 98.60, '2019-02-22 23:14:27', '老妈充值');
INSERT INTO `user_pay` VALUES (40, 19, 63, 2, 15.00, '2019-02-22 23:15:37', '奶茶');
INSERT INTO `user_pay` VALUES (41, 21, 61, 1, 6.40, '2019-02-22 23:52:29', '');
INSERT INTO `user_pay` VALUES (42, 21, 51, 1, 52.95, '2019-02-23 18:58:19', '逛街小吃');
INSERT INTO `user_pay` VALUES (43, 21, 64, 1, 29.00, '2019-02-23 18:59:01', '去黑头');
INSERT INTO `user_pay` VALUES (44, 21, 61, 1, 30.00, '2019-02-24 18:23:53', '橘子');
INSERT INTO `user_pay` VALUES (45, 21, 43, 1, 22.50, '2019-02-24 21:51:34', '');
INSERT INTO `user_pay` VALUES (46, 21, 53, 1, 20.00, '2019-02-24 21:58:52', '王士成话费');
INSERT INTO `user_pay` VALUES (47, 21, 40, 2, 3.00, '2019-02-25 09:01:26', '早餐');
INSERT INTO `user_pay` VALUES (48, 21, 65, 1, 6288.00, '2019-01-30 09:10:44', '王士成惠普电脑');
INSERT INTO `user_pay` VALUES (49, 21, 41, 2, 9.30, '2019-02-25 13:01:38', '华东院出差午饭');
INSERT INTO `user_pay` VALUES (50, 21, 66, 1, 3340.00, '2018-08-09 13:31:43', '8月份交一压一、中介费、维修费（1200每月）');
INSERT INTO `user_pay` VALUES (51, 21, 66, 1, 1514.01, '2018-09-07 13:33:23', '9月份租房水电');
INSERT INTO `user_pay` VALUES (52, 21, 66, 1, 1350.85, '2018-10-07 13:34:53', '10月份租房水电');
INSERT INTO `user_pay` VALUES (53, 21, 66, 1, 1440.95, '2018-11-08 13:36:30', '11月份租房水电');
INSERT INTO `user_pay` VALUES (54, 21, 66, 1, 1482.95, '2018-12-09 13:37:28', '12月份租房水电');
INSERT INTO `user_pay` VALUES (55, 21, 66, 1, 1467.20, '2019-01-07 13:38:39', '1月份租房水电');
INSERT INTO `user_pay` VALUES (56, 21, 66, 1, 15000.00, '2018-08-09 13:41:27', '18年7月份之前累计交付房租、押金、水电费及中介费约15000（房东没有退还押金及房租，房租一直交到9月中旬，8月份搬走，1400每月）');
INSERT INTO `user_pay` VALUES (57, 21, 42, 2, 10.00, '2019-02-25 18:02:04', '拉面');
INSERT INTO `user_pay` VALUES (58, 21, 40, 2, 5.00, '2019-02-26 09:22:22', '华东院早餐5元');
INSERT INTO `user_pay` VALUES (59, 21, 45, 1, 28.60, '2019-02-25 22:23:08', '舒旭饿了么外卖');
INSERT INTO `user_pay` VALUES (60, 21, 41, 2, 10.30, '2019-02-26 15:50:22', '华东院午餐');
INSERT INTO `user_pay` VALUES (61, 21, 42, 1, 17.00, '2019-02-26 22:31:51', '华东院');
INSERT INTO `user_pay` VALUES (62, 21, 67, 9, 50.00, '2019-02-26 22:33:29', 'blue cat');
INSERT INTO `user_pay` VALUES (63, 21, 40, 2, 4.00, '2019-02-27 08:56:40', '华东院早餐');
INSERT INTO `user_pay` VALUES (64, 19, 62, 2, 44.00, '2019-02-27 09:18:23', '请李怡小朋友带的15根鸡爪');
INSERT INTO `user_pay` VALUES (65, 21, 41, 2, 7.30, '2019-02-27 13:19:11', '华东院午饭');
INSERT INTO `user_pay` VALUES (66, 21, 53, 1, 10.00, '2019-02-27 13:46:19', '');
INSERT INTO `user_pay` VALUES (68, 19, 62, 1, 104.10, '2019-02-27 14:15:23', '零食  104.11111111');
INSERT INTO `user_pay` VALUES (69, 21, 40, 2, 4.00, '2019-02-28 10:09:33', '华东院早餐');
INSERT INTO `user_pay` VALUES (70, 21, 62, 2, 5.50, '2019-02-28 10:10:29', '两瓶矿泉水');
INSERT INTO `user_pay` VALUES (71, 19, 91, 2, 143.10, '2019-02-28 10:19:45', '胡子扬妈妈生日礼物');
INSERT INTO `user_pay` VALUES (72, 21, 41, 2, 10.30, '2019-02-28 13:05:29', '华东院午餐');
INSERT INTO `user_pay` VALUES (73, 21, 42, 1, 10.00, '2019-02-28 20:46:45', '兰州拉面（华东院）');
INSERT INTO `user_pay` VALUES (74, 21, 40, 2, 5.00, '2019-03-01 09:10:35', '华东院早餐');
INSERT INTO `user_pay` VALUES (75, 21, 41, 2, 6.30, '2019-03-01 14:00:37', '华东院午餐');
INSERT INTO `user_pay` VALUES (76, 21, 62, 1, 6.00, '2019-03-01 14:01:37', '饮料');
INSERT INTO `user_pay` VALUES (77, 21, 53, 1, 20.00, '2019-03-01 17:09:10', '王士成话费 28号');
INSERT INTO `user_pay` VALUES (78, 19, 33, 9, 50.00, '2019-03-01 17:35:34', '王士成3月份地铁卡充值');
INSERT INTO `user_pay` VALUES (79, 19, 70, 1, 56.10, '2019-03-02 17:39:11', '萱萱美术本、语数外练习册');
INSERT INTO `user_pay` VALUES (80, 19, 51, 1, 11.88, '2019-03-02 17:39:43', '');
INSERT INTO `user_pay` VALUES (81, 19, 57, 1, 79.80, '2019-03-03 17:40:52', '水立方');
INSERT INTO `user_pay` VALUES (82, 19, 70, 1, 70.00, '2019-03-03 17:41:29', '麻将');
INSERT INTO `user_pay` VALUES (83, 21, 43, 1, 6.48, '2019-03-03 22:16:31', '');
INSERT INTO `user_pay` VALUES (84, 21, 71, 2, 6.50, '2019-03-03 22:18:54', '');
INSERT INTO `user_pay` VALUES (85, 21, 40, 2, 7.00, '2019-03-04 12:04:11', '华东院早饭');
INSERT INTO `user_pay` VALUES (86, 19, 64, 1, 75.00, '2019-03-04 17:18:52', '希芸面膜泥');
INSERT INTO `user_pay` VALUES (87, 21, 53, 1, 20.00, '2019-03-04 17:30:48', '话费');
INSERT INTO `user_pay` VALUES (88, 21, 42, 2, 9.00, '2019-03-04 17:31:26', '华东院');
INSERT INTO `user_pay` VALUES (89, 21, 71, 1, 8.00, '2019-03-04 08:37:18', '');
INSERT INTO `user_pay` VALUES (90, 21, 40, 2, 4.00, '2019-03-05 08:37:46', '');
INSERT INTO `user_pay` VALUES (91, 21, 41, 2, 9.30, '2019-03-05 16:48:00', '');
INSERT INTO `user_pay` VALUES (92, 21, 42, 2, 7.30, '2019-03-05 18:18:17', '华东院晚餐');
INSERT INTO `user_pay` VALUES (93, 21, 71, 2, 6.92, '2019-03-05 18:19:31', '');
INSERT INTO `user_pay` VALUES (94, 21, 40, 2, 4.50, '2019-03-06 08:47:33', '华东院早餐');
INSERT INTO `user_pay` VALUES (95, 21, 41, 2, 3.00, '2019-03-06 17:59:38', '华东院苹果');
INSERT INTO `user_pay` VALUES (96, 21, 42, 2, 17.00, '2019-03-06 18:00:48', '华东院');
INSERT INTO `user_pay` VALUES (98, 21, 40, 2, 6.50, '2019-03-07 08:39:56', '华东院');
INSERT INTO `user_pay` VALUES (99, 19, 63, 1, 18.00, '2019-03-07 09:11:19', '三月六号下午的下午茶');
INSERT INTO `user_pay` VALUES (100, 19, 61, 1, 23.70, '2019-03-07 09:12:18', '三月六号晚上水果店买的 山竹和 小番茄');
INSERT INTO `user_pay` VALUES (101, 21, 41, 2, 4.00, '2019-03-07 15:13:17', '华东院');
INSERT INTO `user_pay` VALUES (102, 21, 42, 1, 15.00, '2019-03-07 17:15:04', '兰州拉面');
INSERT INTO `user_pay` VALUES (103, 21, 71, 2, 3.50, '2019-03-07 18:30:58', '');
INSERT INTO `user_pay` VALUES (104, 21, 62, 1, 12.50, '2019-03-07 23:05:04', '');
INSERT INTO `user_pay` VALUES (105, 21, 67, 9, 20.00, '2019-03-07 23:05:38', '');
INSERT INTO `user_pay` VALUES (106, 21, 40, 2, 5.00, '2019-03-08 10:59:08', '华东院');
INSERT INTO `user_pay` VALUES (107, 21, 71, 1, 6.00, '2019-03-08 14:01:20', '');
INSERT INTO `user_pay` VALUES (108, 19, 41, 1, 21.00, '2019-03-08 15:41:41', '周五未带饭');
INSERT INTO `user_pay` VALUES (109, 21, 33, 9, 5.00, '2019-03-10 12:26:53', '家到桐泾公园（体检）');
INSERT INTO `user_pay` VALUES (110, 21, 18, 2, 13.91, '2019-03-10 12:28:05', '桐泾公园到美年大健康（昨天周六新区体检）');
INSERT INTO `user_pay` VALUES (111, 21, 18, 2, 9.00, '2019-03-10 12:28:31', '步行街到家');
INSERT INTO `user_pay` VALUES (112, 21, 32, 1, 60.00, '2019-03-10 12:29:24', '新区美年大健康体检 —— 昆山');
INSERT INTO `user_pay` VALUES (113, 21, 40, 1, 7.50, '2019-03-10 12:29:44', '王士成早饭');
INSERT INTO `user_pay` VALUES (114, 21, 32, 1, 65.50, '2019-03-10 12:30:09', '昆山到家');
INSERT INTO `user_pay` VALUES (115, 21, 70, 1, 22.00, '2019-03-10 12:30:52', '验孕棒');
INSERT INTO `user_pay` VALUES (116, 21, 62, 1, 9.00, '2019-03-10 12:31:21', '关东煮');
INSERT INTO `user_pay` VALUES (117, 21, 73, 1, 355.00, '2019-03-10 12:32:51', '两条裤子');
INSERT INTO `user_pay` VALUES (118, 21, 90, 1, 27.10, '2019-03-10 12:33:15', '王士成口腔溃疡 （药）');
INSERT INTO `user_pay` VALUES (119, 21, 18, 1, 9.79, '2019-03-10 12:33:49', '步行街到家（王士成支付宝）');
INSERT INTO `user_pay` VALUES (120, 21, 62, 1, 7.00, '2019-03-11 17:07:01', '冰淇淋');
INSERT INTO `user_pay` VALUES (121, 21, 34, 2, 50.00, '2019-03-11 19:08:37', '王士成');
INSERT INTO `user_pay` VALUES (122, 21, 42, 1, 15.00, '2019-03-11 19:40:22', '兰州拉面');
INSERT INTO `user_pay` VALUES (124, 19, 90, 1, 31.00, '2019-03-12 09:44:41', '口腔溃疡含片两盒');
INSERT INTO `user_pay` VALUES (125, 21, 71, 1, 1.98, '2019-03-12 09:44:58', '昨天矿泉水');
INSERT INTO `user_pay` VALUES (126, 19, 75, 1, 72.52, '2019-03-12 09:46:03', '一套内衣');
INSERT INTO `user_pay` VALUES (127, 21, 18, 2, 8.00, '2019-03-12 09:47:11', '都市118到爱鑫宾馆');
INSERT INTO `user_pay` VALUES (128, 21, 70, 1, 19.60, '2019-03-12 20:25:45', '沐浴露、拖鞋等');
INSERT INTO `user_pay` VALUES (129, 19, 76, 1, 13.63, '2019-03-13 09:40:15', '子扬出差晾衣服神器');
INSERT INTO `user_pay` VALUES (130, 21, 61, 2, 10.00, '2019-03-13 12:52:24', '梨');
INSERT INTO `user_pay` VALUES (131, 21, 53, 1, 10.00, '2019-03-14 09:14:51', '');
INSERT INTO `user_pay` VALUES (132, 19, 40, 2, 4.50, '2019-03-14 13:17:02', '王宝宝吃了两顿早饭');
INSERT INTO `user_pay` VALUES (133, 21, 78, 1, 5.98, '2019-03-14 20:18:55', '三双袜子');
INSERT INTO `user_pay` VALUES (134, 21, 71, 2, 2.00, '2019-03-14 20:34:54', '');
INSERT INTO `user_pay` VALUES (135, 21, 67, 9, 11.00, '2019-03-15 09:51:05', '');
INSERT INTO `user_pay` VALUES (136, 21, 59, 2, 82.00, '2019-03-15 18:04:11', '白洋淀-保定18.5，保定-北京西63.5');
INSERT INTO `user_pay` VALUES (137, 21, 67, 9, 30.00, '2019-03-15 22:39:10', '');
INSERT INTO `user_pay` VALUES (138, 19, 70, 1, 68.97, '2019-03-16 12:30:08', '私密处 护理液');
INSERT INTO `user_pay` VALUES (139, 21, 33, 1, 20.00, '2019-03-16 12:37:59', '北京一日游');
INSERT INTO `user_pay` VALUES (140, 21, 51, 1, 61.98, '2019-03-16 12:39:32', '小吃、麦当劳、饮料、串串等');
INSERT INTO `user_pay` VALUES (141, 19, 33, 9, 50.00, '2019-03-16 19:18:46', '地铁充值月卡20次');
INSERT INTO `user_pay` VALUES (142, 19, 70, 1, 19.90, '2019-03-16 19:20:29', '香薰');
INSERT INTO `user_pay` VALUES (143, 19, 63, 1, 12.00, '2019-03-16 19:21:59', '谷c玉米汁');
INSERT INTO `user_pay` VALUES (144, 19, 73, 1, 157.00, '2019-03-16 21:48:34', '牛仔裤 + 化妆扑 + 凉皮');
INSERT INTO `user_pay` VALUES (146, 21, 71, 1, 12.00, '2019-03-16 21:51:42', '');
INSERT INTO `user_pay` VALUES (147, 21, 51, 1, 19.00, '2019-03-16 21:52:12', '');
INSERT INTO `user_pay` VALUES (148, 21, 62, 1, 11.47, '2019-03-16 21:53:28', '今天订单金额多笔支付合计');
INSERT INTO `user_pay` VALUES (149, 21, 91, 9, 162.00, '2019-03-16 21:56:21', '宝宝北京之行礼物 ****');
INSERT INTO `user_pay` VALUES (150, 21, 61, 2, 19.00, '2019-03-17 15:07:38', '梨子');
INSERT INTO `user_pay` VALUES (151, 21, 59, 1, 14.50, '2019-03-17 21:08:19', '老爸火车票');
INSERT INTO `user_pay` VALUES (152, 19, 41, 1, 49.00, '2019-03-18 11:29:06', '串串 加 奶茶 加 锅盔');
INSERT INTO `user_pay` VALUES (153, 21, 71, 2, 2.94, '2019-03-18 22:04:44', '');
INSERT INTO `user_pay` VALUES (154, 19, 75, 1, 150.60, '2019-03-19 09:35:10', '两套内衣');
INSERT INTO `user_pay` VALUES (155, 21, 53, 1, 10.00, '2019-03-19 14:15:24', '');
INSERT INTO `user_pay` VALUES (156, 21, 62, 1, 7.98, '2019-03-21 09:20:48', '');
INSERT INTO `user_pay` VALUES (157, 21, 67, 1, 30.00, '2019-03-23 09:40:26', '');
INSERT INTO `user_pay` VALUES (158, 21, 62, 1, 2.00, '2019-03-23 09:40:52', '');
INSERT INTO `user_pay` VALUES (159, 21, 62, 2, 6.00, '2019-03-23 09:41:08', '');
INSERT INTO `user_pay` VALUES (160, 21, 67, 9, 20.00, '2019-03-24 11:53:05', '');
INSERT INTO `user_pay` VALUES (161, 21, 61, 1, 11.70, '2019-03-24 13:36:35', '梨子');
INSERT INTO `user_pay` VALUES (162, 21, 53, 1, 30.00, '2019-03-26 11:08:05', '王士成');
INSERT INTO `user_pay` VALUES (163, 21, 61, 1, 8.00, '2019-03-26 11:08:22', '梨子');
INSERT INTO `user_pay` VALUES (164, 21, 83, 1, 51.30, '2019-03-26 11:10:56', '');
INSERT INTO `user_pay` VALUES (165, 19, 42, 1, 25.00, '2019-03-26 11:33:55', '虾仁');
INSERT INTO `user_pay` VALUES (166, 19, 32, 1, 41.20, '2019-03-26 11:34:31', '昆山往苏州 星期一早上');
INSERT INTO `user_pay` VALUES (167, 19, 70, 2, 18.00, '2019-03-27 09:53:34', '蓝牙耳机');
INSERT INTO `user_pay` VALUES (168, 21, 67, 9, 10.00, '2019-03-28 09:54:58', '');
INSERT INTO `user_pay` VALUES (169, 21, 42, 1, 143.00, '2019-03-28 18:00:59', '曹疯子火锅（小王欠71）');
INSERT INTO `user_pay` VALUES (170, 21, 71, 1, 7.00, '2019-03-29 10:39:28', '矿泉水 和饮料');
INSERT INTO `user_pay` VALUES (171, 21, 41, 1, 36.00, '2019-03-29 13:04:48', '汉堡 加 鸡翅 列车上的午饭');
INSERT INTO `user_pay` VALUES (172, 21, 34, 1, 50.00, '2019-03-30 10:50:05', '');
INSERT INTO `user_pay` VALUES (173, 21, 51, 1, 18.00, '2019-03-30 11:25:13', '凉面 擀面皮');
INSERT INTO `user_pay` VALUES (174, 21, 51, 1, 23.00, '2019-03-30 11:42:18', '奶茶');
INSERT INTO `user_pay` VALUES (175, 21, 84, 2, 22.50, '2019-03-30 12:28:30', '宝宝 发卡');
INSERT INTO `user_pay` VALUES (176, 21, 71, 2, 10.30, '2019-03-30 14:32:21', '');
INSERT INTO `user_pay` VALUES (177, 21, 51, 1, 83.00, '2019-03-31 11:48:07', '烤肉');
INSERT INTO `user_pay` VALUES (178, 21, 90, 1, 58.00, '2019-03-31 11:48:36', '药');
INSERT INTO `user_pay` VALUES (179, 21, 41, 1, 140.98, '2019-03-31 15:43:51', '烤鱼');
INSERT INTO `user_pay` VALUES (180, 21, 70, 1, 8.90, '2019-03-31 15:45:35', '茶杯');
INSERT INTO `user_pay` VALUES (181, 21, 85, 1, 99.00, '2019-03-31 15:47:47', '多走路鞋');
INSERT INTO `user_pay` VALUES (182, 21, 86, 1, 78.00, '2019-03-31 15:52:33', '');
INSERT INTO `user_pay` VALUES (183, 21, 85, 1, 378.00, '2019-03-31 15:55:38', '王宝宝 板鞋 高跟鞋');
INSERT INTO `user_pay` VALUES (184, 19, 40, 2, 4.50, '2019-04-01 10:15:22', '早饭 手抓饼');
INSERT INTO `user_pay` VALUES (185, 19, 33, 9, 50.00, '2019-04-01 10:16:02', '地铁月卡 20次');
INSERT INTO `user_pay` VALUES (186, 19, 63, 2, 16.00, '2019-04-01 10:25:04', '上个周五 的奶茶钱');
INSERT INTO `user_pay` VALUES (188, 19, 41, 1, 15.00, '2019-04-01 13:09:17', '子扬的兰州拉面 牛肉炒面');
INSERT INTO `user_pay` VALUES (189, 19, 42, 1, 9.98, '2019-04-01 17:25:38', '鸡蛋拉面');
INSERT INTO `user_pay` VALUES (190, 19, 41, 1, 11.98, '2019-04-02 13:04:12', '胡子扬 葱油拌面');
INSERT INTO `user_pay` VALUES (191, 19, 40, 1, 5.00, '2019-04-02 13:04:28', '胡子扬 早饭');
INSERT INTO `user_pay` VALUES (192, 21, 42, 2, 12.30, '2019-04-02 18:04:56', '');
INSERT INTO `user_pay` VALUES (193, 19, 70, 1, 6.28, '2019-04-09 12:39:11', '数据线保护套');
INSERT INTO `user_pay` VALUES (194, 21, 41, 2, 20.60, '2019-04-09 12:39:12', '2号至9号 微信付款伙食');
INSERT INTO `user_pay` VALUES (195, 21, 41, 1, 13.00, '2019-04-09 12:49:32', '3号');
INSERT INTO `user_pay` VALUES (196, 21, 71, 1, 4.00, '2019-04-09 12:49:59', '3号消费');
INSERT INTO `user_pay` VALUES (197, 21, 53, 1, 10.00, '2019-04-09 12:51:05', '4号消费');
INSERT INTO `user_pay` VALUES (198, 21, 62, 1, 11.48, '2019-04-09 12:51:49', '4号消费');
INSERT INTO `user_pay` VALUES (199, 21, 51, 1, 105.50, '2019-04-09 12:53:59', '5号消费');
INSERT INTO `user_pay` VALUES (200, 21, 70, 1, 484.92, '2019-04-09 12:55:20', '6号消费  烧烤');
INSERT INTO `user_pay` VALUES (201, 21, 70, 1, 570.00, '2019-04-09 12:56:08', '7号消费  王宝宝眼镜');
INSERT INTO `user_pay` VALUES (202, 21, 41, 1, 16.00, '2019-04-09 12:56:48', '8号消费 ');
INSERT INTO `user_pay` VALUES (203, 21, 45, 1, 3.00, '2019-04-09 12:57:16', '8号消费  雪糕');
INSERT INTO `user_pay` VALUES (204, 21, 41, 1, 10.00, '2019-04-09 12:58:19', '');
INSERT INTO `user_pay` VALUES (205, 21, 71, 1, 3.50, '2019-04-09 12:58:38', '');
INSERT INTO `user_pay` VALUES (206, 21, 71, 1, 6.98, '2019-04-09 12:59:31', '自助售货机还没有退款');
INSERT INTO `user_pay` VALUES (207, 21, 33, 5, 10.04, '2019-04-09 13:01:06', '4，5号 地铁出行。苏易行');
INSERT INTO `user_pay` VALUES (208, 19, 40, 2, 4.50, '2019-04-09 13:05:16', '手抓饼');
INSERT INTO `user_pay` VALUES (209, 19, 86, 1, 45.90, '2019-04-09 13:06:07', '小猪刺绣短袖T恤');
INSERT INTO `user_pay` VALUES (210, 19, 87, 1, 147.25, '2019-04-09 13:07:37', '针织外套');
INSERT INTO `user_pay` VALUES (211, 19, 90, 1, 236.80, '2019-04-09 13:08:50', '过敏药加维生素');
INSERT INTO `user_pay` VALUES (212, 19, 63, 2, 20.50, '2019-04-09 13:18:16', '奶茶加手抓饼');
INSERT INTO `user_pay` VALUES (213, 21, 42, 2, 17.00, '2019-04-09 18:21:16', '华东院晚餐');
INSERT INTO `user_pay` VALUES (214, 21, 53, 1, 19.66, '2019-04-10 08:18:24', '');
INSERT INTO `user_pay` VALUES (216, 21, 40, 2, 5.00, '2019-04-10 08:25:45', '华东院');
INSERT INTO `user_pay` VALUES (217, 21, 41, 1, 10.00, '2019-04-10 13:45:18', '');
INSERT INTO `user_pay` VALUES (218, 19, 40, 2, 4.50, '2019-04-10 17:35:27', '手抓饼');
INSERT INTO `user_pay` VALUES (219, 21, 42, 2, 7.00, '2019-04-10 17:55:12', '');
INSERT INTO `user_pay` VALUES (220, 21, 42, 1, 13.98, '2019-04-11 16:02:20', '');
INSERT INTO `user_pay` VALUES (221, 21, 42, 2, 8.00, '2019-04-12 09:35:58', '昨晚');
INSERT INTO `user_pay` VALUES (222, 21, 40, 2, 5.00, '2019-04-12 09:36:06', '');
INSERT INTO `user_pay` VALUES (223, 21, 41, 1, 15.00, '2019-04-12 14:29:28', '');
INSERT INTO `user_pay` VALUES (224, 21, 71, 1, 7.00, '2019-04-12 14:30:40', '');
INSERT INTO `user_pay` VALUES (225, 21, 33, 9, 50.00, '2019-04-15 10:17:26', '4月份地铁卡充值');
INSERT INTO `user_pay` VALUES (226, 21, 34, 2, 2.00, '2019-04-15 10:18:36', '');
INSERT INTO `user_pay` VALUES (227, 19, 70, 9, 100.00, '2019-04-15 11:24:34', '回家两天开销 和周一顺风车');
INSERT INTO `user_pay` VALUES (228, 19, 41, 1, 17.00, '2019-04-15 11:41:16', '中午外卖 ');
INSERT INTO `user_pay` VALUES (229, 21, 34, 2, 2.00, '2019-04-16 09:04:57', '昨晚公交');
INSERT INTO `user_pay` VALUES (230, 19, 33, 9, 50.00, '2019-04-16 14:45:27', '地铁月卡');
INSERT INTO `user_pay` VALUES (231, 19, 63, 1, 37.00, '2019-04-16 14:46:39', '周五晚上的奶茶');
INSERT INTO `user_pay` VALUES (232, 19, 42, 2, 198.00, '2019-04-16 16:12:50', '双人自助餐 （君豪酒店）');
INSERT INTO `user_pay` VALUES (233, 19, 61, 1, 109.50, '2019-04-16 16:13:47', '水果');
INSERT INTO `user_pay` VALUES (234, 21, 62, 1, 6.00, '2019-04-17 15:26:31', '雪糕');
INSERT INTO `user_pay` VALUES (235, 21, 53, 1, 19.98, '2019-04-18 09:26:02', '');
INSERT INTO `user_pay` VALUES (236, 19, 63, 2, 21.00, '2019-04-18 16:06:09', '奶茶');
INSERT INTO `user_pay` VALUES (237, 19, 34, 1, 3.00, '2019-04-18 16:06:33', '公交');
INSERT INTO `user_pay` VALUES (238, 21, 62, 1, 8.70, '2019-04-18 16:32:29', '雪糕');
INSERT INTO `user_pay` VALUES (239, 21, 70, 1, 22.00, '2019-04-18 19:55:44', '老爸 苏烟');
INSERT INTO `user_pay` VALUES (240, 21, 89, 1, 18.31, '2019-04-18 19:57:36', '王士');
INSERT INTO `user_pay` VALUES (241, 21, 53, 1, 20.00, '2019-04-18 20:45:53', '王士成');
INSERT INTO `user_pay` VALUES (242, 21, 63, 2, 28.00, '2019-04-19 14:43:30', '');
INSERT INTO `user_pay` VALUES (243, 21, 41, 1, 11.00, '2019-04-19 14:43:40', '');
INSERT INTO `user_pay` VALUES (244, 19, 41, 1, 17.10, '2019-04-19 16:09:09', '');
INSERT INTO `user_pay` VALUES (245, 19, 34, 1, 2.00, '2019-04-19 16:09:35', '早晚公交');
INSERT INTO `user_pay` VALUES (246, 21, 90, 1, 11.40, '2019-04-20 10:37:03', '');
INSERT INTO `user_pay` VALUES (247, 21, 90, 3, 8.53, '2019-04-20 10:37:45', '王士成');
INSERT INTO `user_pay` VALUES (248, 21, 51, 1, 35.00, '2019-04-20 11:30:36', '');
INSERT INTO `user_pay` VALUES (249, 21, 63, 1, 16.00, '2019-04-20 12:06:39', '');
INSERT INTO `user_pay` VALUES (250, 21, 90, 1, 18.00, '2019-04-20 16:46:08', '王士成');
INSERT INTO `user_pay` VALUES (251, 21, 51, 1, 49.00, '2019-04-20 16:47:18', '');
INSERT INTO `user_pay` VALUES (252, 21, 51, 1, 28.00, '2019-04-21 16:18:08', '');
INSERT INTO `user_pay` VALUES (253, 21, 63, 1, 19.00, '2019-04-21 16:18:31', '');
INSERT INTO `user_pay` VALUES (254, 21, 42, 1, 72.34, '2019-04-21 16:19:05', '');
INSERT INTO `user_pay` VALUES (255, 21, 43, 1, 37.50, '2019-04-21 21:51:06', '牛奶啤酒');
INSERT INTO `user_pay` VALUES (256, 19, 73, 1, 57.63, '2019-04-22 17:21:24', '牛仔短裙');
INSERT INTO `user_pay` VALUES (257, 19, 34, 1, 2.00, '2019-04-22 17:22:41', '上下班公交');
INSERT INTO `user_pay` VALUES (258, 21, 53, 1, 20.00, '2019-04-23 22:22:09', '王士成');
INSERT INTO `user_pay` VALUES (259, 19, 40, 2, 9.00, '2019-04-24 09:11:56', '今天和昨天的手抓饼钱');
INSERT INTO `user_pay` VALUES (260, 19, 34, 1, 2.00, '2019-04-24 09:12:19', '上下班公交');
INSERT INTO `user_pay` VALUES (261, 21, 33, 5, 6.00, '2019-04-25 09:16:05', '上班');
INSERT INTO `user_pay` VALUES (262, 19, 40, 2, 4.50, '2019-04-25 09:27:31', '手抓饼');
INSERT INTO `user_pay` VALUES (263, 19, 34, 1, 2.00, '2019-04-25 09:27:48', '上下班公交');
INSERT INTO `user_pay` VALUES (264, 21, 53, 1, 9.98, '2019-04-25 10:39:38', '');
INSERT INTO `user_pay` VALUES (265, 19, 41, 1, 26.89, '2019-04-25 13:10:45', '胡子扬和我的午饭');
INSERT INTO `user_pay` VALUES (266, 21, 61, 1, 23.98, '2019-04-25 22:07:23', '苹果');
INSERT INTO `user_pay` VALUES (268, 19, 34, 1, 50.00, '2019-04-26 11:20:43', '公交卡充值');
INSERT INTO `user_pay` VALUES (269, 19, 86, 1, 40.71, '2019-04-26 11:21:58', '短袖T恤');
INSERT INTO `user_pay` VALUES (270, 21, 41, 2, 14.00, '2019-04-26 11:24:12', '黄焖鸡');
INSERT INTO `user_pay` VALUES (271, 19, 41, 1, 17.00, '2019-04-26 11:33:13', '鸡腿饭');
INSERT INTO `user_pay` VALUES (272, 21, 18, 2, 27.62, '2019-04-26 13:08:36', '重置公积金密码');
INSERT INTO `user_pay` VALUES (273, 21, 63, 2, 11.00, '2019-04-26 16:28:40', '一点点');
INSERT INTO `user_pay` VALUES (274, 21, 53, 1, 20.00, '2019-04-26 22:09:15', '');
INSERT INTO `user_pay` VALUES (275, 21, 62, 1, 28.00, '2019-04-26 23:32:15', '服务区  小零食');
INSERT INTO `user_pay` VALUES (276, 21, 66, 1, 144.00, '2019-04-27 02:27:06', '格林豪泰');
INSERT INTO `user_pay` VALUES (277, 19, 53, 1, 20.00, '2019-04-28 09:30:14', '');
INSERT INTO `user_pay` VALUES (278, 19, 62, 1, 255.30, '2019-04-28 09:32:08', '三只松鼠零食');
INSERT INTO `user_pay` VALUES (279, 19, 41, 1, 20.50, '2019-04-29 11:52:48', '面加肉夹馍');
INSERT INTO `user_pay` VALUES (280, 21, 92, 1, 155.00, '2019-04-29 12:00:25', '过路费');
INSERT INTO `user_pay` VALUES (281, 21, 43, 1, 56.40, '2019-04-29 12:01:12', '牛奶  避孕套');
INSERT INTO `user_pay` VALUES (282, 21, 33, 5, 6.00, '2019-04-30 09:17:52', '');
INSERT INTO `user_pay` VALUES (283, 21, 32, 1, 27.60, '2019-04-30 09:18:23', '');
INSERT INTO `user_pay` VALUES (284, 19, 41, 1, 34.50, '2019-04-30 11:31:26', '两份鸡腿饭');
INSERT INTO `user_pay` VALUES (285, 19, 53, 1, 49.76, '2019-05-01 07:10:12', '王士成老爸');
INSERT INTO `user_pay` VALUES (286, 21, 66, 1, 180.00, '2019-05-01 20:49:36', '汉庭');
INSERT INTO `user_pay` VALUES (287, 21, 51, 1, 39.98, '2019-05-01 20:52:15', '花甲');
INSERT INTO `user_pay` VALUES (288, 21, 63, 1, 13.00, '2019-05-02 13:07:13', '');
INSERT INTO `user_pay` VALUES (289, 21, 34, 9, 2.00, '2019-05-02 13:07:28', '');
INSERT INTO `user_pay` VALUES (290, 21, 51, 1, 11.00, '2019-05-03 19:37:28', '串串');
INSERT INTO `user_pay` VALUES (291, 21, 63, 1, 44.00, '2019-05-03 19:38:19', '一点点 水果茶');
INSERT INTO `user_pay` VALUES (292, 21, 70, 1, 4.00, '2019-05-03 19:38:44', '纸');
INSERT INTO `user_pay` VALUES (293, 21, 42, 1, 414.00, '2019-05-03 19:39:19', '黄山');
INSERT INTO `user_pay` VALUES (294, 21, 66, 1, 16.00, '2019-05-03 19:39:56', ' 266-250 退250元');
INSERT INTO `user_pay` VALUES (295, 21, 73, 1, 129.00, '2019-05-03 19:41:08', '');
INSERT INTO `user_pay` VALUES (296, 21, 70, 1, 19.90, '2019-05-03 19:41:34', '印泥');
INSERT INTO `user_pay` VALUES (297, 21, 71, 1, 116.00, '2019-05-03 19:42:45', '酒');
INSERT INTO `user_pay` VALUES (298, 21, 70, 1, 30.00, '2019-05-03 19:47:31', '自拍杆');
INSERT INTO `user_pay` VALUES (299, 21, 93, 1, 760.00, '2019-05-03 19:49:06', '黄山门票');
INSERT INTO `user_pay` VALUES (300, 21, 93, 1, 95.00, '2019-05-03 19:49:30', '黄山门票 王艺霖');
INSERT INTO `user_pay` VALUES (301, 21, 51, 1, 12.00, '2019-05-03 19:49:51', '正新鸡排');
INSERT INTO `user_pay` VALUES (302, 21, 51, 9, 10.00, '2019-05-03 19:50:08', '烤串');
INSERT INTO `user_pay` VALUES (303, 19, 71, 1, 14.00, '2019-05-05 09:27:04', '两瓶水溶C100');
INSERT INTO `user_pay` VALUES (304, 21, 51, 1, 20.00, '2019-05-05 10:47:51', '服务区 关东煮');
INSERT INTO `user_pay` VALUES (305, 21, 71, 1, 26.00, '2019-05-05 10:48:12', '');
INSERT INTO `user_pay` VALUES (306, 19, 34, 1, 10.00, '2019-05-05 14:22:01', '公交卡充值');
INSERT INTO `user_pay` VALUES (307, 19, 33, 9, 75.00, '2019-05-05 14:22:50', '地铁卡充值');
INSERT INTO `user_pay` VALUES (309, 19, 33, 9, 75.00, '2019-05-05 14:27:55', '地铁卡充值');
INSERT INTO `user_pay` VALUES (310, 21, 34, 1, 10.00, '2019-05-05 19:18:32', '');
INSERT INTO `user_pay` VALUES (311, 21, 70, 1, 26.49, '2019-05-05 19:19:37', '手机壳');
INSERT INTO `user_pay` VALUES (312, 21, 62, 2, 6.00, '2019-05-06 15:48:12', '烤肠');
INSERT INTO `user_pay` VALUES (313, 21, 53, 1, 20.00, '2019-05-07 10:08:46', '');
INSERT INTO `user_pay` VALUES (314, 21, 51, 1, 3.50, '2019-05-12 12:03:06', '');
INSERT INTO `user_pay` VALUES (315, 21, 34, 1, 10.00, '2019-05-12 12:03:24', '');
INSERT INTO `user_pay` VALUES (316, 21, 53, 1, 49.90, '2019-05-12 12:03:40', '');
INSERT INTO `user_pay` VALUES (317, 21, 51, 1, 56.75, '2019-05-12 12:04:02', '');
INSERT INTO `user_pay` VALUES (318, 21, 18, 2, 73.47, '2019-05-12 12:06:28', '');
INSERT INTO `user_pay` VALUES (319, 19, 51, 2, 10.00, '2019-05-12 12:07:40', '8号');
INSERT INTO `user_pay` VALUES (320, 19, 70, 1, 23.00, '2019-05-12 12:08:38', '8号 手机膜');
INSERT INTO `user_pay` VALUES (322, 19, 34, 1, 20.00, '2019-05-12 12:09:36', '10号');
INSERT INTO `user_pay` VALUES (323, 19, 41, 1, 18.50, '2019-05-12 12:09:55', '10号');
INSERT INTO `user_pay` VALUES (324, 19, 42, 9, 160.00, '2019-05-13 11:18:52', '11号 王士成老爸');
INSERT INTO `user_pay` VALUES (325, 21, 40, 2, 5.00, '2019-05-13 11:20:59', '');
INSERT INTO `user_pay` VALUES (326, 21, 42, 1, 187.78, '2019-05-16 08:50:31', '13号至今 支付宝');
INSERT INTO `user_pay` VALUES (328, 19, 70, 6, 260.00, '2019-05-16 09:18:38', '2克藏红花');
INSERT INTO `user_pay` VALUES (329, 19, 34, 1, 10.00, '2019-05-16 09:19:27', '公交卡充值');
INSERT INTO `user_pay` VALUES (330, 21, 40, 2, 43.30, '2019-05-16 17:48:14', '13号至今');
INSERT INTO `user_pay` VALUES (331, 21, 41, 1, 11.98, '2019-05-16 17:49:44', '');
INSERT INTO `user_pay` VALUES (332, 21, 53, 1, 27.64, '2019-05-17 08:39:28', '王士成');
INSERT INTO `user_pay` VALUES (333, 21, 40, 2, 5.00, '2019-05-17 08:40:01', '');
INSERT INTO `user_pay` VALUES (334, 21, 41, 1, 11.98, '2019-05-17 22:57:21', '');
INSERT INTO `user_pay` VALUES (335, 21, 62, 1, 35.00, '2019-05-17 22:57:45', '雪糕');
INSERT INTO `user_pay` VALUES (336, 21, 70, 9, 8.00, '2019-05-18 15:13:33', '体检');
INSERT INTO `user_pay` VALUES (337, 21, 70, 1, 400.00, '2019-05-18 15:13:54', '眼镜');
INSERT INTO `user_pay` VALUES (338, 21, 70, 2, 2000.00, '2019-05-18 15:14:07', '驾照');
INSERT INTO `user_pay` VALUES (339, 21, 42, 2, 285.00, '2019-05-20 08:55:34', '辣三多');
INSERT INTO `user_pay` VALUES (340, 21, 40, 2, 5.00, '2019-05-20 08:55:42', '');
INSERT INTO `user_pay` VALUES (341, 21, 70, 1, 20.40, '2019-05-20 08:57:29', '牙刷');
INSERT INTO `user_pay` VALUES (342, 21, 71, 1, 6.50, '2019-05-20 08:57:49', '');
INSERT INTO `user_pay` VALUES (343, 21, 42, 1, 2.00, '2019-05-20 08:58:14', '辣三多');
INSERT INTO `user_pay` VALUES (344, 21, 70, 9, 12.00, '2019-05-20 08:58:39', '停车费');
INSERT INTO `user_pay` VALUES (345, 21, 41, 1, 10.00, '2019-05-20 13:37:47', '');
INSERT INTO `user_pay` VALUES (346, 19, 32, 1, 65.60, '2019-05-20 19:30:25', '去昆山');
INSERT INTO `user_pay` VALUES (347, 19, 32, 1, 65.60, '2019-05-20 19:31:15', '去昆山');
INSERT INTO `user_pay` VALUES (349, 19, 70, 1, 18.80, '2019-05-20 19:32:21', '洗漱包');
INSERT INTO `user_pay` VALUES (350, 19, 70, 1, 15.80, '2019-05-20 19:32:43', '洗漱包');
INSERT INTO `user_pay` VALUES (351, 19, 34, 1, 10.00, '2019-05-20 19:33:53', '市民卡充值');
INSERT INTO `user_pay` VALUES (352, 21, 42, 1, 12.30, '2019-05-20 19:35:52', '');
INSERT INTO `user_pay` VALUES (353, 21, 40, 2, 5.00, '2019-05-21 08:40:17', '');
INSERT INTO `user_pay` VALUES (354, 21, 41, 1, 10.00, '2019-05-21 16:13:02', '');
INSERT INTO `user_pay` VALUES (355, 21, 71, 1, 5.98, '2019-05-21 16:13:13', '');
INSERT INTO `user_pay` VALUES (356, 19, 78, 6, 59.00, '2019-05-21 16:19:05', '男女袜子');
INSERT INTO `user_pay` VALUES (357, 19, 70, 6, 77.40, '2019-05-21 16:19:23', '压缩袋');
INSERT INTO `user_pay` VALUES (358, 21, 42, 2, 10.30, '2019-05-22 10:14:16', '');
INSERT INTO `user_pay` VALUES (359, 21, 40, 2, 5.00, '2019-05-22 10:14:22', '');
INSERT INTO `user_pay` VALUES (360, 21, 71, 2, 3.00, '2019-05-22 10:14:57', '');
INSERT INTO `user_pay` VALUES (361, 19, 34, 1, 10.00, '2019-05-22 10:16:48', '公交卡充值');
INSERT INTO `user_pay` VALUES (362, 21, 42, 2, 12.80, '2019-05-23 15:12:18', '');
INSERT INTO `user_pay` VALUES (363, 21, 40, 2, 5.00, '2019-05-23 15:12:25', '');
INSERT INTO `user_pay` VALUES (364, 21, 62, 2, 3.00, '2019-05-23 15:12:33', '');
INSERT INTO `user_pay` VALUES (365, 21, 41, 1, 10.00, '2019-05-23 15:14:16', '');
INSERT INTO `user_pay` VALUES (366, 21, 62, 1, 16.00, '2019-05-23 15:14:35', '');
INSERT INTO `user_pay` VALUES (367, 21, 62, 1, 3.00, '2019-05-23 15:14:53', '');
INSERT INTO `user_pay` VALUES (368, 21, 41, 1, 12.00, '2019-05-23 15:15:02', '');
INSERT INTO `user_pay` VALUES (369, 19, 34, 1, 20.00, '2019-05-27 09:48:28', '两人公交卡充值');
INSERT INTO `user_pay` VALUES (370, 19, 62, 1, 270.10, '2019-05-27 09:51:35', '喜多多椰果王＋三只松鼠');
INSERT INTO `user_pay` VALUES (372, 21, 62, 1, 8.50, '2019-05-27 10:24:43', '');
INSERT INTO `user_pay` VALUES (373, 21, 41, 1, 15.00, '2019-05-27 10:25:04', '');
INSERT INTO `user_pay` VALUES (374, 21, 71, 1, 4.00, '2019-05-27 10:25:15', '');
INSERT INTO `user_pay` VALUES (375, 21, 71, 1, 5.00, '2019-05-27 10:26:34', '');
INSERT INTO `user_pay` VALUES (376, 21, 53, 1, 19.98, '2019-05-27 10:26:48', '');
INSERT INTO `user_pay` VALUES (377, 21, 43, 1, 34.60, '2019-05-27 10:27:45', '牛奶 方便面');
INSERT INTO `user_pay` VALUES (378, 21, 32, 1, 46.20, '2019-05-27 10:28:16', '');
INSERT INTO `user_pay` VALUES (379, 21, 71, 1, 29.80, '2019-05-27 10:28:41', '');
INSERT INTO `user_pay` VALUES (380, 21, 32, 1, 46.50, '2019-05-27 10:28:55', '');
INSERT INTO `user_pay` VALUES (381, 21, 71, 1, 15.00, '2019-05-27 10:29:11', '');
INSERT INTO `user_pay` VALUES (382, 21, 71, 1, 8.38, '2019-05-27 10:29:35', '');
INSERT INTO `user_pay` VALUES (383, 21, 63, 1, 15.00, '2019-05-27 10:29:45', '一点点');
INSERT INTO `user_pay` VALUES (384, 21, 51, 1, 25.00, '2019-05-27 10:30:06', '');
INSERT INTO `user_pay` VALUES (385, 21, 70, 1, 44.80, '2019-05-27 10:30:22', '蚊香液');
INSERT INTO `user_pay` VALUES (386, 21, 42, 2, 20.00, '2019-05-27 10:33:10', '23号晚餐');
INSERT INTO `user_pay` VALUES (387, 21, 40, 2, 5.00, '2019-05-27 10:34:26', '24号');
INSERT INTO `user_pay` VALUES (388, 21, 42, 2, 270.00, '2019-05-27 10:34:48', '25号 聚餐');
INSERT INTO `user_pay` VALUES (389, 19, 53, 1, 10.00, '2019-05-27 10:44:18', '');
INSERT INTO `user_pay` VALUES (390, 19, 41, 1, 22.22, '2019-05-27 11:15:06', '');
INSERT INTO `user_pay` VALUES (391, 19, 90, 1, 55.40, '2019-05-27 14:04:13', '避孕药');
INSERT INTO `user_pay` VALUES (392, 19, 91, 1, 149.94, '2019-05-27 15:58:33', '王镱淋的生日裙子');
INSERT INTO `user_pay` VALUES (393, 19, 34, 6, 50.00, '2019-05-28 09:39:39', '公交卡充值');
INSERT INTO `user_pay` VALUES (394, 19, 91, 1, 38.40, '2019-05-28 09:40:40', '王镱淋生日图书（米小圈脑筋急转弯）');
INSERT INTO `user_pay` VALUES (395, 19, 63, 2, 13.00, '2019-05-30 09:12:07', '');
INSERT INTO `user_pay` VALUES (396, 19, 40, 2, 4.50, '2019-05-30 09:12:20', '');
INSERT INTO `user_pay` VALUES (397, 21, 53, 1, 30.00, '2019-05-30 09:27:51', '28号 王二狗话费');
INSERT INTO `user_pay` VALUES (398, 19, 41, 1, 24.79, '2019-05-30 11:53:04', '午饭');
INSERT INTO `user_pay` VALUES (399, 21, 63, 2, 17.00, '2019-05-30 14:52:19', '');
INSERT INTO `user_pay` VALUES (400, 19, 34, 6, 20.00, '2019-05-31 09:47:01', '两个人的公交卡各十块');
INSERT INTO `user_pay` VALUES (401, 21, 40, 1, 8.00, '2019-05-31 11:22:08', '');
INSERT INTO `user_pay` VALUES (402, 19, 40, 2, 4.50, '2019-06-03 09:49:37', '上周五的早饭');
INSERT INTO `user_pay` VALUES (403, 19, 33, 6, 120.00, '2019-06-03 09:50:03', '地铁月卡50次');
INSERT INTO `user_pay` VALUES (404, 19, 34, 6, 10.00, '2019-06-03 09:50:20', '公交卡充值');
INSERT INTO `user_pay` VALUES (405, 19, 78, 2, 10.00, '2019-06-03 09:51:11', '爸爸的三双袜子');
INSERT INTO `user_pay` VALUES (406, 19, 91, 5, 840.00, '2019-06-03 09:53:13', '雪花秀套装');
INSERT INTO `user_pay` VALUES (407, 19, 32, 1, 58.50, '2019-06-03 09:54:30', '爸爸从苏州到昆山');
INSERT INTO `user_pay` VALUES (408, 19, 32, 5, 65.50, '2019-06-03 09:57:36', '上海城从苏州到昆山');
INSERT INTO `user_pay` VALUES (409, 19, 91, 5, 41.80, '2019-06-03 09:58:19', '王镱淋的生日礼物');
INSERT INTO `user_pay` VALUES (411, 19, 71, 5, 33.00, '2019-06-03 10:00:32', '良品铺子饮料');
INSERT INTO `user_pay` VALUES (412, 19, 61, 5, 127.00, '2019-06-03 10:01:00', '榴莲加香蕉');
INSERT INTO `user_pay` VALUES (413, 19, 63, 5, 15.00, '2019-06-03 10:01:22', '一点点奶茶');
INSERT INTO `user_pay` VALUES (414, 19, 95, 5, 35.00, '2019-06-03 10:05:07', '理发');
INSERT INTO `user_pay` VALUES (415, 19, 32, 5, 3.70, '2019-06-03 10:08:58', '');
INSERT INTO `user_pay` VALUES (416, 19, 18, 5, 9.00, '2019-06-03 10:09:30', '光大银行到玉龙东村');
INSERT INTO `user_pay` VALUES (417, 21, 41, 1, 12.00, '2019-06-03 15:47:22', '');
INSERT INTO `user_pay` VALUES (418, 21, 42, 2, 9.80, '2019-06-04 14:46:40', '');
INSERT INTO `user_pay` VALUES (419, 21, 71, 1, 3.50, '2019-06-04 14:47:19', '');
INSERT INTO `user_pay` VALUES (420, 21, 41, 1, 11.98, '2019-06-04 14:47:36', '');
INSERT INTO `user_pay` VALUES (422, 21, 42, 2, 9.80, '2019-06-04 19:29:34', '');
INSERT INTO `user_pay` VALUES (423, 19, 34, 1, 10.00, '2019-06-06 10:02:42', '');
INSERT INTO `user_pay` VALUES (424, 21, 53, 1, 10.00, '2019-06-06 14:20:42', '');
INSERT INTO `user_pay` VALUES (425, 21, 41, 1, 10.00, '2019-06-06 14:20:49', '');
INSERT INTO `user_pay` VALUES (426, 21, 43, 1, 8.00, '2019-06-06 14:21:15', '');
INSERT INTO `user_pay` VALUES (427, 21, 42, 1, 15.00, '2019-06-06 14:21:31', '');
INSERT INTO `user_pay` VALUES (428, 21, 71, 1, 3.00, '2019-06-06 14:21:43', '');
INSERT INTO `user_pay` VALUES (429, 21, 41, 1, 10.00, '2019-06-06 14:21:58', '');
INSERT INTO `user_pay` VALUES (430, 21, 71, 1, 3.50, '2019-06-06 14:22:43', '');
INSERT INTO `user_pay` VALUES (431, 21, 51, 1, 4.98, '2019-06-10 11:38:09', '正新 火腿');
INSERT INTO `user_pay` VALUES (432, 21, 71, 1, 2.00, '2019-06-10 11:38:25', '');
INSERT INTO `user_pay` VALUES (433, 21, 45, 1, 35.00, '2019-06-10 11:38:44', '肯德基');
INSERT INTO `user_pay` VALUES (434, 21, 86, 1, 78.00, '2019-06-10 11:39:16', '');
INSERT INTO `user_pay` VALUES (436, 21, 71, 1, 3.98, '2019-06-10 11:40:25', '啤酒');
INSERT INTO `user_pay` VALUES (437, 21, 91, 1, 500.00, '2019-06-10 11:42:50', '梁炀 乔迁');
INSERT INTO `user_pay` VALUES (438, 21, 70, 2, 36.30, '2019-06-10 11:45:25', '沐浴露');
INSERT INTO `user_pay` VALUES (439, 21, 56, 2, 0.99, '2019-06-10 11:46:11', '爱奇艺');
INSERT INTO `user_pay` VALUES (440, 21, 71, 2, 6.00, '2019-06-10 11:46:30', '');
INSERT INTO `user_pay` VALUES (441, 21, 70, 1, 46.73, '2019-06-10 11:47:12', '菜+枸杞');
INSERT INTO `user_pay` VALUES (442, 21, 91, 9, 700.00, '2019-06-10 11:48:02', '三哥');
INSERT INTO `user_pay` VALUES (443, 21, 41, 1, 14.00, '2019-06-10 13:48:47', '兰州拉面');
INSERT INTO `user_pay` VALUES (444, 19, 34, 1, 10.00, '2019-06-11 09:23:59', '');
INSERT INTO `user_pay` VALUES (445, 19, 62, 1, 15.46, '2019-06-11 09:25:16', '蜜桃乌龙茶');
INSERT INTO `user_pay` VALUES (446, 21, 42, 2, 9.80, '2019-06-11 11:40:17', '');
INSERT INTO `user_pay` VALUES (447, 21, 41, 2, 10.30, '2019-06-12 09:08:08', '');
INSERT INTO `user_pay` VALUES (448, 21, 42, 2, 12.30, '2019-06-12 09:08:22', '');
INSERT INTO `user_pay` VALUES (450, 21, 71, 2, 3.50, '2019-06-12 09:08:55', '');
INSERT INTO `user_pay` VALUES (451, 21, 40, 2, 5.00, '2019-06-12 09:09:11', '');
INSERT INTO `user_pay` VALUES (452, 21, 41, 2, 13.30, '2019-06-12 13:55:16', '');
INSERT INTO `user_pay` VALUES (454, 21, 62, 2, 4.00, '2019-06-12 13:55:47', '雪糕');
INSERT INTO `user_pay` VALUES (455, 21, 42, 2, 10.30, '2019-06-13 19:23:49', '');
INSERT INTO `user_pay` VALUES (456, 21, 40, 2, 5.00, '2019-06-13 19:23:59', '');
INSERT INTO `user_pay` VALUES (457, 21, 41, 2, 10.30, '2019-06-13 19:24:06', '');
INSERT INTO `user_pay` VALUES (458, 21, 42, 2, 13.30, '2019-06-13 19:24:15', '');
INSERT INTO `user_pay` VALUES (459, 21, 62, 1, 6.00, '2019-06-13 19:25:49', '12-6冰淇淋');
INSERT INTO `user_pay` VALUES (460, 19, 53, 1, 49.90, '2019-06-13 19:27:39', '王士成他妈');
INSERT INTO `user_pay` VALUES (461, 19, 34, 1, 2.00, '2019-06-17 09:33:11', '');
INSERT INTO `user_pay` VALUES (462, 19, 18, 1, 5.37, '2019-06-17 09:33:57', '上海城到永旺');
INSERT INTO `user_pay` VALUES (463, 19, 91, 2, 5.20, '2019-06-17 09:36:11', '爸爸 父亲节红包');
INSERT INTO `user_pay` VALUES (464, 19, 62, 2, 19.80, '2019-06-17 09:36:33', '椰青');
INSERT INTO `user_pay` VALUES (465, 19, 41, 2, 47.00, '2019-06-17 09:37:02', '蜜桃餐厅');
INSERT INTO `user_pay` VALUES (466, 19, 96, 1, 99.00, '2019-06-17 09:39:58', '屈臣氏的卸妆水和化妆棉');
INSERT INTO `user_pay` VALUES (467, 21, 40, 2, 5.80, '2019-06-17 10:26:29', '14号');
INSERT INTO `user_pay` VALUES (468, 21, 41, 2, 13.30, '2019-06-17 10:26:44', '14号');
INSERT INTO `user_pay` VALUES (469, 21, 71, 2, 4.00, '2019-06-17 10:27:08', '15号');
INSERT INTO `user_pay` VALUES (470, 21, 43, 2, 14.60, '2019-06-17 10:27:29', '椰青');
INSERT INTO `user_pay` VALUES (471, 21, 91, 2, 5.20, '2019-06-17 10:27:56', '父亲节红包');
INSERT INTO `user_pay` VALUES (472, 21, 97, 2, 399.00, '2019-06-17 10:29:22', '');
INSERT INTO `user_pay` VALUES (473, 21, 18, 2, 12.11, '2019-06-17 10:29:37', '永旺到家');
INSERT INTO `user_pay` VALUES (474, 21, 63, 1, 14.00, '2019-06-17 10:31:59', '');
INSERT INTO `user_pay` VALUES (475, 21, 70, 1, 10.00, '2019-06-17 10:32:25', '栀子花');
INSERT INTO `user_pay` VALUES (476, 21, 33, 5, 6.00, '2019-06-17 17:33:39', '');
INSERT INTO `user_pay` VALUES (477, 21, 62, 2, 5.50, '2019-06-17 17:33:53', '');
INSERT INTO `user_pay` VALUES (478, 21, 63, 2, 13.00, '2019-06-17 17:34:01', '');
INSERT INTO `user_pay` VALUES (479, 19, 34, 1, 10.00, '2019-06-19 09:47:37', '公交卡充值');
INSERT INTO `user_pay` VALUES (480, 19, 40, 2, 4.50, '2019-06-20 09:46:55', '手抓饼');
INSERT INTO `user_pay` VALUES (481, 19, 53, 1, 10.00, '2019-06-20 09:47:14', '');
INSERT INTO `user_pay` VALUES (482, 19, 87, 1, 217.97, '2019-06-20 09:49:24', '外套吊带');
INSERT INTO `user_pay` VALUES (483, 21, 34, 2, 4.00, '2019-06-20 12:56:48', '');
INSERT INTO `user_pay` VALUES (484, 21, 42, 2, 13.30, '2019-06-20 12:57:06', '');
INSERT INTO `user_pay` VALUES (485, 21, 40, 2, 5.30, '2019-06-20 12:57:13', '');
INSERT INTO `user_pay` VALUES (486, 21, 41, 2, 12.00, '2019-06-20 12:57:21', '');
INSERT INTO `user_pay` VALUES (487, 21, 53, 2, 60.00, '2019-06-20 20:34:37', '');
INSERT INTO `user_pay` VALUES (488, 21, 42, 2, 10.00, '2019-06-20 20:35:01', '');
INSERT INTO `user_pay` VALUES (489, 19, 34, 1, 2.00, '2019-06-21 10:08:35', '');
INSERT INTO `user_pay` VALUES (490, 19, 41, 2, 16.50, '2019-06-21 11:47:52', '早饭加午饭');
INSERT INTO `user_pay` VALUES (491, 19, 42, 2, 55.00, '2019-06-24 09:36:47', '香天下火锅');
INSERT INTO `user_pay` VALUES (492, 19, 90, 2, 11.00, '2019-06-24 09:37:14', '挂号检查费');
INSERT INTO `user_pay` VALUES (493, 19, 85, 2, 58.70, '2019-06-24 09:38:14', '胡子杨的帆布鞋');
INSERT INTO `user_pay` VALUES (494, 19, 70, 2, 19.90, '2019-06-24 09:38:40', '脱毛');
INSERT INTO `user_pay` VALUES (495, 19, 18, 2, 41.70, '2019-06-24 09:43:03', '周五顺风车');
INSERT INTO `user_pay` VALUES (496, 21, 40, 2, 5.30, '2019-06-24 18:46:34', '');
INSERT INTO `user_pay` VALUES (497, 21, 70, 2, 1500.00, '2019-06-24 18:49:06', '本科学历');
INSERT INTO `user_pay` VALUES (498, 21, 70, 2, 2700.00, '2019-06-24 18:49:16', '驾照');
INSERT INTO `user_pay` VALUES (499, 21, 51, 2, 16.00, '2019-06-24 18:49:40', '炒酸奶');
INSERT INTO `user_pay` VALUES (500, 21, 41, 2, 15.00, '2019-06-24 18:49:57', '');
INSERT INTO `user_pay` VALUES (501, 21, 18, 1, 10.91, '2019-06-24 18:52:09', '');
INSERT INTO `user_pay` VALUES (502, 21, 18, 1, 13.85, '2019-06-24 18:52:18', '');
INSERT INTO `user_pay` VALUES (503, 21, 51, 1, 11.10, '2019-06-24 18:52:36', '');
INSERT INTO `user_pay` VALUES (504, 21, 51, 1, 26.98, '2019-06-24 18:52:48', '');
INSERT INTO `user_pay` VALUES (505, 21, 95, 1, 34.98, '2019-06-24 18:53:11', '');
INSERT INTO `user_pay` VALUES (506, 21, 53, 1, 19.96, '2019-06-24 18:53:38', '王士成');
INSERT INTO `user_pay` VALUES (507, 21, 41, 1, 15.00, '2019-06-24 18:53:50', '');
INSERT INTO `user_pay` VALUES (508, 21, 71, 1, 4.00, '2019-06-26 21:05:39', '');
INSERT INTO `user_pay` VALUES (511, 21, 40, 2, 5.60, '2019-06-26 21:15:02', '');
INSERT INTO `user_pay` VALUES (512, 21, 42, 2, 9.00, '2019-06-26 21:15:16', '');
INSERT INTO `user_pay` VALUES (513, 21, 41, 2, 2.74, '2019-06-26 21:16:07', '微信31.68  分期乐支付2.74');
INSERT INTO `user_pay` VALUES (514, 21, 34, 1, 10.00, '2019-06-26 21:22:27', '');
INSERT INTO `user_pay` VALUES (515, 19, 40, 2, 4.50, '2019-06-27 09:13:15', '');
INSERT INTO `user_pay` VALUES (516, 19, 70, 1, 138.26, '2019-06-28 09:47:48', '灵芝');
INSERT INTO `user_pay` VALUES (517, 19, 96, 1, 99.00, '2019-06-28 09:48:09', '护手霜');
INSERT INTO `user_pay` VALUES (518, 19, 40, 2, 4.50, '2019-07-01 09:43:40', '');
INSERT INTO `user_pay` VALUES (519, 19, 33, 2, 75.00, '2019-07-01 09:45:04', '');
INSERT INTO `user_pay` VALUES (520, 21, 40, 1, 6.00, '2019-07-01 09:59:51', '');
INSERT INTO `user_pay` VALUES (521, 21, 53, 1, 30.00, '2019-07-01 10:00:22', '王士成');
INSERT INTO `user_pay` VALUES (522, 21, 62, 1, 3.98, '2019-07-01 10:00:49', '');
INSERT INTO `user_pay` VALUES (523, 21, 98, 1, 19.90, '2019-07-01 10:02:22', '汤勺');
INSERT INTO `user_pay` VALUES (524, 21, 98, 1, 378.00, '2019-07-01 10:02:45', '小米牙刷');
INSERT INTO `user_pay` VALUES (525, 21, 42, 1, 9.00, '2019-07-01 10:03:07', '');
INSERT INTO `user_pay` VALUES (526, 21, 99, 1, 2202.00, '2019-07-01 10:04:46', '王士成手链');
INSERT INTO `user_pay` VALUES (527, 21, 51, 1, 28.00, '2019-07-01 10:05:09', '冰淇淋');
INSERT INTO `user_pay` VALUES (528, 21, 34, 1, 10.00, '2019-07-01 10:05:36', '');
INSERT INTO `user_pay` VALUES (529, 21, 40, 1, 4.00, '2019-07-01 10:05:53', '');
INSERT INTO `user_pay` VALUES (532, 21, 40, 2, 4.60, '2019-07-01 10:08:42', '');
INSERT INTO `user_pay` VALUES (533, 21, 42, 2, 9.00, '2019-07-01 10:09:02', '26');
INSERT INTO `user_pay` VALUES (534, 21, 41, 2, 29.00, '2019-07-01 10:09:53', '27 午+晚');
INSERT INTO `user_pay` VALUES (535, 21, 41, 2, 12.30, '2019-07-01 10:10:46', '28');
INSERT INTO `user_pay` VALUES (536, 21, 71, 2, 43.50, '2019-07-01 10:11:19', '29');
INSERT INTO `user_pay` VALUES (537, 19, 40, 2, 4.50, '2019-07-02 10:19:10', '');
INSERT INTO `user_pay` VALUES (538, 19, 34, 1, 10.00, '2019-07-03 11:29:28', '');
INSERT INTO `user_pay` VALUES (539, 19, 34, 1, 10.00, '2019-07-03 11:29:32', '');
INSERT INTO `user_pay` VALUES (540, 19, 41, 1, 10.79, '2019-07-03 11:29:45', '');
INSERT INTO `user_pay` VALUES (541, 19, 63, 1, 15.00, '2019-07-05 13:07:23', '');
INSERT INTO `user_pay` VALUES (542, 19, 40, 2, 4.50, '2019-07-05 13:07:53', '');
INSERT INTO `user_pay` VALUES (543, 19, 34, 1, 10.00, '2019-07-05 13:08:10', '');
INSERT INTO `user_pay` VALUES (544, 19, 41, 1, 12.90, '2019-07-05 13:08:53', '7.03');
INSERT INTO `user_pay` VALUES (545, 19, 60, 1, 40.00, '2019-07-05 13:09:21', '');
INSERT INTO `user_pay` VALUES (546, 19, 60, 1, 36.49, '2019-07-05 13:09:33', '');
INSERT INTO `user_pay` VALUES (547, 19, 41, 1, 10.79, '2019-07-05 13:09:58', '');
INSERT INTO `user_pay` VALUES (548, 19, 41, 1, 17.50, '2019-07-05 13:10:12', '');
INSERT INTO `user_pay` VALUES (549, 19, 41, 1, 19.00, '2019-07-05 13:10:38', '');
INSERT INTO `user_pay` VALUES (550, 21, 40, 2, 21.00, '2019-07-08 10:08:43', '上周 4天早餐');
INSERT INTO `user_pay` VALUES (551, 21, 63, 2, 11.00, '2019-07-08 10:09:20', '上周');
INSERT INTO `user_pay` VALUES (552, 21, 71, 2, 7.00, '2019-07-08 10:09:43', '昨天雪碧');
INSERT INTO `user_pay` VALUES (553, 21, 41, 1, 19.00, '2019-07-08 10:11:10', '7月1号');
INSERT INTO `user_pay` VALUES (554, 21, 34, 1, 20.00, '2019-07-08 10:12:01', '7月1号');
INSERT INTO `user_pay` VALUES (555, 21, 41, 1, 17.50, '2019-07-08 10:12:28', '7月2号');
INSERT INTO `user_pay` VALUES (556, 21, 34, 1, 20.00, '2019-07-08 10:13:09', '7月2号 3号 两笔');
INSERT INTO `user_pay` VALUES (557, 21, 41, 1, 10.79, '2019-07-08 10:13:34', '7月3号 ');
INSERT INTO `user_pay` VALUES (558, 21, 18, 1, 76.49, '2019-07-08 10:14:16', '7月3号 面试');
INSERT INTO `user_pay` VALUES (559, 21, 51, 1, 12.90, '2019-07-08 10:14:44', '小吃 炸鸡');
INSERT INTO `user_pay` VALUES (560, 21, 34, 1, 10.00, '2019-07-08 10:17:26', '');
INSERT INTO `user_pay` VALUES (561, 21, 63, 1, 15.00, '2019-07-08 10:17:56', '');
INSERT INTO `user_pay` VALUES (562, 21, 42, 1, 119.00, '2019-07-08 10:18:09', '');
INSERT INTO `user_pay` VALUES (563, 21, 71, 1, 2.88, '2019-07-08 10:18:34', '');
INSERT INTO `user_pay` VALUES (564, 21, 42, 1, 23.98, '2019-07-08 10:18:54', '和府捞面');
INSERT INTO `user_pay` VALUES (565, 21, 62, 1, 5.00, '2019-07-08 10:19:22', '');
INSERT INTO `user_pay` VALUES (566, 21, 41, 1, 43.00, '2019-07-08 10:19:49', '鲜芋仙');
INSERT INTO `user_pay` VALUES (567, 21, 41, 1, 33.00, '2019-07-08 10:20:03', '肉肉');
INSERT INTO `user_pay` VALUES (568, 21, 41, 1, 27.00, '2019-07-08 10:20:13', '锅盔');
INSERT INTO `user_pay` VALUES (569, 21, 41, 1, 9.00, '2019-07-08 10:20:25', '锅盔');
INSERT INTO `user_pay` VALUES (570, 21, 51, 1, 9.00, '2019-07-08 10:20:42', '');
INSERT INTO `user_pay` VALUES (571, 21, 42, 1, 344.00, '2019-07-08 10:21:06', '海底捞');
INSERT INTO `user_pay` VALUES (572, 21, 18, 1, 11.00, '2019-07-08 10:21:18', '');
INSERT INTO `user_pay` VALUES (573, 19, 40, 2, 4.50, '2019-07-10 10:11:42', '');
INSERT INTO `user_pay` VALUES (574, 19, 34, 1, 10.00, '2019-07-10 10:12:12', '');
INSERT INTO `user_pay` VALUES (575, 19, 34, 1, 10.00, '2019-07-11 09:49:15', '');
INSERT INTO `user_pay` VALUES (576, 19, 41, 1, 31.00, '2019-07-11 15:35:15', '胡子扬和我的午饭');
INSERT INTO `user_pay` VALUES (577, 19, 41, 2, 43.00, '2019-07-12 14:06:47', '肯德基');
INSERT INTO `user_pay` VALUES (578, 19, 41, 2, 19.80, '2019-07-12 14:07:13', '香天下活锅两张代金券');
INSERT INTO `user_pay` VALUES (579, 19, 34, 1, 10.00, '2019-07-12 14:07:47', '');
INSERT INTO `user_pay` VALUES (580, 19, 41, 1, 28.00, '2019-07-15 09:26:55', '和府捞面 和 鸡蛋灌饼');
INSERT INTO `user_pay` VALUES (581, 19, 61, 1, 36.69, '2019-07-15 09:28:40', '水果');
INSERT INTO `user_pay` VALUES (582, 19, 34, 1, 10.00, '2019-07-15 09:28:54', '');
INSERT INTO `user_pay` VALUES (583, 19, 42, 1, 258.00, '2019-07-15 09:29:33', '香天下');
INSERT INTO `user_pay` VALUES (584, 19, 40, 1, 20.70, '2019-07-15 09:30:01', '手抓饼');
INSERT INTO `user_pay` VALUES (585, 19, 98, 1, 25.40, '2019-07-15 09:30:38', '姨妈巾');
INSERT INTO `user_pay` VALUES (586, 19, 51, 1, 12.40, '2019-07-15 09:31:11', '');
INSERT INTO `user_pay` VALUES (587, 19, 51, 1, 40.00, '2019-07-15 09:31:40', '');
INSERT INTO `user_pay` VALUES (588, 19, 51, 1, 29.90, '2019-07-15 09:33:21', '乌云冰淇淋');
INSERT INTO `user_pay` VALUES (589, 19, 40, 2, 4.50, '2019-07-16 09:56:41', '');
INSERT INTO `user_pay` VALUES (590, 19, 34, 1, 10.00, '2019-07-17 09:24:02', '');
INSERT INTO `user_pay` VALUES (591, 21, 41, 2, 6.00, '2019-07-17 09:31:48', '');
INSERT INTO `user_pay` VALUES (592, 21, 41, 2, 8.50, '2019-07-17 09:31:59', '12号');
INSERT INTO `user_pay` VALUES (593, 21, 40, 2, 5.00, '2019-07-17 09:32:16', '15号');
INSERT INTO `user_pay` VALUES (594, 21, 41, 2, 13.00, '2019-07-17 09:34:43', '15号');
INSERT INTO `user_pay` VALUES (595, 21, 70, 2, 11.40, '2019-07-17 09:36:16', '玉米和面条');
INSERT INTO `user_pay` VALUES (596, 21, 41, 2, 14.00, '2019-07-17 09:36:57', '陕西面');
INSERT INTO `user_pay` VALUES (597, 21, 71, 2, 7.00, '2019-07-17 09:37:10', '');
INSERT INTO `user_pay` VALUES (598, 21, 70, 2, 13.00, '2019-07-17 09:37:39', '馄饨');
INSERT INTO `user_pay` VALUES (599, 21, 62, 2, 5.00, '2019-07-17 09:38:08', '冰淇淋');
INSERT INTO `user_pay` VALUES (601, 21, 33, 5, 100.00, '2019-07-17 09:48:58', '月卡');
INSERT INTO `user_pay` VALUES (603, 19, 33, 2, 50.00, '2019-07-22 17:27:26', '');
INSERT INTO `user_pay` VALUES (604, 19, 86, 2, 235.00, '2019-07-22 17:28:00', '两套衣服');
INSERT INTO `user_pay` VALUES (605, 19, 91, 2, 150.00, '2019-07-22 17:28:31', '大超生日礼物');
INSERT INTO `user_pay` VALUES (606, 19, 40, 2, 4.50, '2019-07-22 17:28:53', '早饭');
INSERT INTO `user_pay` VALUES (607, 19, 34, 1, 20.00, '2019-07-22 17:30:13', '');
INSERT INTO `user_pay` VALUES (608, 19, 53, 1, 29.94, '2019-07-22 17:30:35', '');
INSERT INTO `user_pay` VALUES (609, 19, 53, 1, 49.90, '2019-07-22 17:30:51', '');
INSERT INTO `user_pay` VALUES (610, 19, 61, 1, 44.50, '2019-07-22 17:31:08', '');
INSERT INTO `user_pay` VALUES (611, 19, 41, 1, 8.99, '2019-07-22 17:34:36', '');
INSERT INTO `user_pay` VALUES (612, 19, 34, 1, 20.00, '2019-07-22 17:35:28', '');
INSERT INTO `user_pay` VALUES (613, 21, 71, 2, 4.00, '2019-07-22 17:37:59', '');
INSERT INTO `user_pay` VALUES (614, 21, 42, 2, 6.50, '2019-07-22 17:38:14', '');
INSERT INTO `user_pay` VALUES (615, 21, 18, 2, 15.00, '2019-07-22 17:38:46', '');
INSERT INTO `user_pay` VALUES (616, 21, 41, 2, 9.50, '2019-07-22 17:39:20', '');
INSERT INTO `user_pay` VALUES (617, 21, 71, 2, 3.00, '2019-07-22 17:39:34', '');
INSERT INTO `user_pay` VALUES (618, 21, 42, 2, 18.20, '2019-07-22 17:41:11', '');
INSERT INTO `user_pay` VALUES (619, 21, 62, 2, 5.00, '2019-07-22 17:41:36', '');
INSERT INTO `user_pay` VALUES (620, 21, 41, 2, 14.10, '2019-07-22 17:41:58', '');
INSERT INTO `user_pay` VALUES (621, 21, 41, 2, 16.00, '2019-07-22 17:42:05', '');
INSERT INTO `user_pay` VALUES (622, 21, 63, 2, 13.50, '2019-07-22 17:42:34', '');
INSERT INTO `user_pay` VALUES (623, 19, 41, 1, 18.90, '2019-07-24 09:31:51', '');
INSERT INTO `user_pay` VALUES (624, 19, 34, 1, 10.00, '2019-07-24 09:32:07', '');
INSERT INTO `user_pay` VALUES (625, 19, 34, 1, 10.00, '2019-07-24 09:32:10', '');
INSERT INTO `user_pay` VALUES (626, 19, 63, 1, 19.00, '2019-07-26 13:15:43', '');
INSERT INTO `user_pay` VALUES (627, 19, 41, 1, 12.50, '2019-07-26 13:15:59', '');
INSERT INTO `user_pay` VALUES (628, 19, 32, 1, 61.90, '2019-07-29 09:45:37', '吴江上海城 到 昆山');
INSERT INTO `user_pay` VALUES (629, 19, 34, 1, 6.00, '2019-07-29 09:46:09', '7.26上下班和7.29上班');
INSERT INTO `user_pay` VALUES (630, 19, 98, 1, 32.60, '2019-07-29 10:52:54', '空调挡风板');
INSERT INTO `user_pay` VALUES (631, 19, 34, 1, 6.00, '2019-07-30 09:39:09', '昨天下班和今天的上下班');
INSERT INTO `user_pay` VALUES (632, 19, 41, 1, 19.50, '2019-07-30 17:28:35', '');
INSERT INTO `user_pay` VALUES (633, 19, 96, 1, 100.00, '2019-07-30 17:29:24', '防晒霜');
INSERT INTO `user_pay` VALUES (634, 19, 58, 1, 100.00, '2019-07-30 17:29:36', '车票');
INSERT INTO `user_pay` VALUES (636, 19, 70, 1, 24.50, '2019-07-30 17:32:00', '卡套');
INSERT INTO `user_pay` VALUES (637, 19, 70, 1, 30.00, '2019-07-30 17:34:30', 'Ps');
INSERT INTO `user_pay` VALUES (638, 21, 40, 2, 4.50, '2019-07-30 17:50:20', '');
INSERT INTO `user_pay` VALUES (639, 21, 71, 2, 2.00, '2019-07-30 17:50:42', '');
INSERT INTO `user_pay` VALUES (640, 21, 42, 2, 20.00, '2019-07-30 17:51:17', '');
INSERT INTO `user_pay` VALUES (641, 21, 89, 2, 49.50, '2019-07-30 17:51:43', '');
INSERT INTO `user_pay` VALUES (642, 21, 40, 2, 13.80, '2019-07-30 17:52:17', '');
INSERT INTO `user_pay` VALUES (643, 21, 41, 2, 15.40, '2019-07-30 17:52:25', '');
INSERT INTO `user_pay` VALUES (644, 21, 71, 2, 4.00, '2019-07-30 17:52:39', '');
INSERT INTO `user_pay` VALUES (645, 21, 61, 2, 24.00, '2019-07-30 17:52:54', '');
INSERT INTO `user_pay` VALUES (646, 21, 32, 2, 67.80, '2019-07-30 17:53:11', '');
INSERT INTO `user_pay` VALUES (647, 21, 70, 2, 12.00, '2019-07-30 17:53:31', '');
INSERT INTO `user_pay` VALUES (648, 21, 70, 2, 17.00, '2019-07-30 17:53:58', '');
INSERT INTO `user_pay` VALUES (649, 21, 71, 2, 12.00, '2019-07-30 17:54:20', '');
INSERT INTO `user_pay` VALUES (650, 19, 32, 1, 42.10, '2019-08-01 13:47:31', '公司到昆山');
INSERT INTO `user_pay` VALUES (651, 19, 41, 1, 13.99, '2019-08-01 13:48:37', '');
INSERT INTO `user_pay` VALUES (652, 19, 62, 1, 41.50, '2019-08-06 09:28:02', '大巴上零食');
INSERT INTO `user_pay` VALUES (656, 19, 92, 1, 40.00, '2019-08-06 09:29:09', '昆山、苏州来回的高速费');
INSERT INTO `user_pay` VALUES (657, 19, 42, 1, 40.00, '2019-08-06 09:29:34', '有点烫');
INSERT INTO `user_pay` VALUES (658, 19, 85, 1, 149.20, '2019-08-06 09:30:09', '两双鞋');
INSERT INTO `user_pay` VALUES (659, 19, 33, 1, 50.00, '2019-08-06 09:30:31', '地铁20次月卡');
INSERT INTO `user_pay` VALUES (660, 19, 61, 2, 47.00, '2019-08-06 09:31:37', '叮咚买菜');
INSERT INTO `user_pay` VALUES (661, 19, 60, 1, 14.50, '2019-08-06 09:36:39', '8.01打车');
INSERT INTO `user_pay` VALUES (662, 19, 40, 2, 4.50, '2019-08-07 13:42:43', '');
INSERT INTO `user_pay` VALUES (663, 19, 41, 1, 31.50, '2019-08-07 13:43:37', '怡家乐');
INSERT INTO `user_pay` VALUES (664, 19, 41, 1, 16.50, '2019-08-07 13:43:49', '');
INSERT INTO `user_pay` VALUES (665, 19, 70, 1, 18.80, '2019-08-07 13:44:30', '手机壳');
INSERT INTO `user_pay` VALUES (666, 19, 98, 2, 259.04, '2019-08-08 10:47:59', '姨妈巾');
INSERT INTO `user_pay` VALUES (667, 21, 70, 2, 2.00, '2019-08-11 13:54:07', '打印文件');
INSERT INTO `user_pay` VALUES (668, 21, 42, 2, 40.00, '2019-08-11 13:54:46', '');
INSERT INTO `user_pay` VALUES (669, 21, 87, 2, 11.70, '2019-08-11 13:55:20', '护袖');
INSERT INTO `user_pay` VALUES (672, 21, 71, 2, 6.00, '2019-08-11 13:56:38', '');
INSERT INTO `user_pay` VALUES (673, 21, 18, 2, 20.26, '2019-08-11 13:57:02', '');
INSERT INTO `user_pay` VALUES (674, 21, 41, 2, 68.70, '2019-08-11 13:57:22', '');
INSERT INTO `user_pay` VALUES (675, 21, 71, 2, 26.50, '2019-08-11 13:58:06', '');
INSERT INTO `user_pay` VALUES (676, 21, 56, 2, 2.50, '2019-08-11 13:58:56', '');
INSERT INTO `user_pay` VALUES (677, 21, 42, 2, 29.80, '2019-08-11 13:59:29', '');
INSERT INTO `user_pay` VALUES (678, 21, 71, 2, 3.00, '2019-08-11 14:00:28', '');
INSERT INTO `user_pay` VALUES (679, 21, 41, 2, 24.00, '2019-08-11 14:00:43', '');
INSERT INTO `user_pay` VALUES (680, 21, 40, 2, 41.50, '2019-08-11 14:02:37', '');
INSERT INTO `user_pay` VALUES (681, 21, 41, 2, 36.60, '2019-08-11 14:02:58', '');
INSERT INTO `user_pay` VALUES (682, 21, 41, 2, 15.80, '2019-08-11 14:03:11', '');
INSERT INTO `user_pay` VALUES (683, 21, 33, 5, 120.00, '2019-08-11 14:06:57', '');
INSERT INTO `user_pay` VALUES (684, 19, 41, 1, 24.50, '2019-08-12 09:21:16', '正新鸡排');
INSERT INTO `user_pay` VALUES (685, 19, 98, 1, 17.90, '2019-08-12 09:22:09', '牙膏');
INSERT INTO `user_pay` VALUES (686, 19, 61, 1, 14.92, '2019-08-12 09:22:35', '苹果');
INSERT INTO `user_pay` VALUES (687, 19, 63, 1, 19.00, '2019-08-12 09:22:49', '奶茶');
INSERT INTO `user_pay` VALUES (688, 19, 41, 1, 36.00, '2019-08-12 09:23:06', '');
INSERT INTO `user_pay` VALUES (689, 19, 41, 1, 13.00, '2019-08-12 09:24:12', '陕西食代');
INSERT INTO `user_pay` VALUES (690, 19, 41, 1, 19.00, '2019-08-12 09:24:58', '收款-瘦瘦U');
INSERT INTO `user_pay` VALUES (691, 19, 51, 1, 100.00, '2019-08-12 09:26:12', '全家会员卡');
INSERT INTO `user_pay` VALUES (692, 19, 98, 1, 110.70, '2019-08-12 09:26:47', '除臭剂 和 沐浴露');
INSERT INTO `user_pay` VALUES (693, 19, 51, 2, 34.65, '2019-08-12 09:27:42', '方便面和水果');
INSERT INTO `user_pay` VALUES (694, 19, 41, 1, 31.00, '2019-08-13 17:48:22', '午饭加 奶茶');
INSERT INTO `user_pay` VALUES (695, 19, 41, 1, 14.50, '2019-08-14 16:32:45', '');
INSERT INTO `user_pay` VALUES (696, 19, 98, 2, 8.90, '2019-08-19 17:34:35', '绘本 和 球');
INSERT INTO `user_pay` VALUES (697, 19, 71, 2, 3.00, '2019-08-19 17:34:57', '');
INSERT INTO `user_pay` VALUES (698, 19, 32, 2, 42.10, '2019-08-19 17:35:26', '公司到 昆山');
INSERT INTO `user_pay` VALUES (699, 19, 51, 1, 12.00, '2019-08-19 17:37:35', '王飞（胡子扬）');
INSERT INTO `user_pay` VALUES (700, 19, 41, 1, 28.00, '2019-08-19 17:38:06', '三千粉（胡子扬）');
INSERT INTO `user_pay` VALUES (701, 19, 41, 1, 9.00, '2019-08-19 17:38:43', '又卷烧饼（胡子扬）');
INSERT INTO `user_pay` VALUES (702, 19, 63, 1, 28.00, '2019-08-19 17:39:29', '茉沏（胡子扬）');
INSERT INTO `user_pay` VALUES (703, 19, 71, 1, 20.00, '2019-08-19 17:39:50', '水（胡子扬）');
INSERT INTO `user_pay` VALUES (704, 19, 41, 1, 182.00, '2019-08-19 17:40:34', '官前一品（胡子扬）');
INSERT INTO `user_pay` VALUES (705, 19, 98, 1, 129.70, '2019-08-19 17:40:58', '娃娃 镜子（胡子扬）');
INSERT INTO `user_pay` VALUES (706, 19, 33, 2, 50.00, '2019-08-20 09:14:47', '20次月卡');
INSERT INTO `user_pay` VALUES (707, 21, 18, 2, 21.63, '2019-08-20 17:30:26', '12.63 + 9');
INSERT INTO `user_pay` VALUES (708, 21, 41, 2, 25.60, '2019-08-20 17:30:58', '全家');
INSERT INTO `user_pay` VALUES (710, 21, 41, 2, 31.60, '2019-08-20 17:32:02', '全家  8 月 15号');
INSERT INTO `user_pay` VALUES (711, 19, 41, 1, 31.60, '2019-08-21 11:24:02', '全家（胡子扬）');
INSERT INTO `user_pay` VALUES (712, 19, 98, 1, 10.00, '2019-08-21 11:24:26', 'xxx');
INSERT INTO `user_pay` VALUES (713, 19, 63, 1, 19.00, '2019-08-22 14:39:24', '');
INSERT INTO `user_pay` VALUES (714, 19, 41, 1, 24.60, '2019-08-22 14:40:06', '');
INSERT INTO `user_pay` VALUES (715, 19, 41, 1, 14.40, '2019-08-23 11:08:13', '黄焖鸡');
INSERT INTO `user_pay` VALUES (716, 19, 34, 1, 2.00, '2019-08-27 09:56:30', '');
INSERT INTO `user_pay` VALUES (717, 19, 42, 2, 58.50, '2019-08-28 10:56:38', '肯德基');
INSERT INTO `user_pay` VALUES (718, 19, 53, 1, 30.00, '2019-08-28 10:57:52', '');
INSERT INTO `user_pay` VALUES (719, 19, 41, 1, 11.70, '2019-08-28 10:58:21', '');
INSERT INTO `user_pay` VALUES (720, 19, 60, 1, 12.00, '2019-08-28 10:58:50', '');
INSERT INTO `user_pay` VALUES (721, 19, 34, 1, 2.00, '2019-08-28 10:59:10', '');
INSERT INTO `user_pay` VALUES (722, 19, 41, 1, 35.00, '2019-08-28 10:59:26', '');
INSERT INTO `user_pay` VALUES (723, 19, 62, 1, 21.40, '2019-08-28 10:59:47', '');
INSERT INTO `user_pay` VALUES (724, 19, 34, 1, 10.00, '2019-08-28 11:00:04', '');
INSERT INTO `user_pay` VALUES (725, 19, 34, 1, 2.00, '2019-08-28 11:00:09', '');
INSERT INTO `user_pay` VALUES (726, 21, 41, 2, 14.00, '2019-08-28 11:30:57', '26号');
INSERT INTO `user_pay` VALUES (727, 19, 41, 1, 24.60, '2019-08-28 13:15:19', '');
INSERT INTO `user_pay` VALUES (728, 19, 42, 1, 16.00, '2019-08-30 09:37:52', '');
INSERT INTO `user_pay` VALUES (729, 19, 42, 1, 12.00, '2019-08-30 09:38:14', '');
INSERT INTO `user_pay` VALUES (730, 19, 62, 1, 29.80, '2019-08-30 09:38:30', '');
INSERT INTO `user_pay` VALUES (731, 19, 63, 1, 20.00, '2019-08-30 14:23:58', '');
INSERT INTO `user_pay` VALUES (732, 19, 70, 1, 2.00, '2019-08-30 14:24:21', '饿了么会员');
INSERT INTO `user_pay` VALUES (734, 19, 41, 2, 137.40, '2019-09-02 10:05:09', '');
INSERT INTO `user_pay` VALUES (735, 19, 42, 2, 13.50, '2019-09-02 10:05:30', '');
INSERT INTO `user_pay` VALUES (736, 19, 42, 2, 21.81, '2019-09-02 10:05:43', '');
INSERT INTO `user_pay` VALUES (737, 19, 33, 2, 50.00, '2019-09-02 10:06:02', '');
INSERT INTO `user_pay` VALUES (738, 19, 87, 1, 149.00, '2019-09-02 10:10:44', '');
INSERT INTO `user_pay` VALUES (739, 19, 73, 1, 129.00, '2019-09-02 10:16:51', '');
INSERT INTO `user_pay` VALUES (740, 19, 53, 1, 10.00, '2019-09-02 10:17:02', '');
INSERT INTO `user_pay` VALUES (741, 19, 84, 1, 55.96, '2019-09-02 10:17:19', '');
INSERT INTO `user_pay` VALUES (742, 19, 62, 1, 134.50, '2019-09-02 10:18:04', '');
INSERT INTO `user_pay` VALUES (743, 19, 96, 1, 33.80, '2019-09-02 10:18:42', '卸妆棉');
INSERT INTO `user_pay` VALUES (744, 19, 63, 1, 22.00, '2019-09-02 10:19:00', '');
INSERT INTO `user_pay` VALUES (745, 19, 62, 1, 18.00, '2019-09-02 10:19:15', '');
INSERT INTO `user_pay` VALUES (746, 21, 41, 2, 26.60, '2019-09-02 11:02:01', '30号');
INSERT INTO `user_pay` VALUES (747, 21, 62, 2, 4.50, '2019-09-02 11:03:11', '31号');
INSERT INTO `user_pay` VALUES (748, 21, 53, 2, 30.00, '2019-09-02 11:03:24', '');
INSERT INTO `user_pay` VALUES (749, 21, 33, 2, 120.00, '2019-09-02 11:03:52', '');
INSERT INTO `user_pay` VALUES (750, 19, 34, 1, 10.00, '2019-09-03 09:51:39', '');
INSERT INTO `user_pay` VALUES (751, 19, 87, 1, 454.80, '2019-09-03 09:52:54', '');
INSERT INTO `user_pay` VALUES (752, 19, 101, 1, 30.19, '2019-09-03 09:54:16', '口罩');
INSERT INTO `user_pay` VALUES (753, 21, 42, 2, 14.90, '2019-09-05 18:29:43', '2号两笔消费 - 支付宝两笔（同事转）');
INSERT INTO `user_pay` VALUES (754, 21, 53, 2, 29.94, '2019-09-05 18:30:03', '');
INSERT INTO `user_pay` VALUES (755, 21, 41, 2, 24.40, '2019-09-05 18:31:03', '5号 午餐  微信-支付宝');
INSERT INTO `user_pay` VALUES (756, 19, 32, 2, 67.90, '2019-09-09 09:45:11', '');
INSERT INTO `user_pay` VALUES (757, 19, 32, 2, 67.80, '2019-09-09 09:45:43', '');
INSERT INTO `user_pay` VALUES (758, 19, 60, 2, 16.00, '2019-09-09 09:46:10', '');
INSERT INTO `user_pay` VALUES (759, 19, 42, 2, 16.50, '2019-09-09 09:46:37', '');
INSERT INTO `user_pay` VALUES (760, 19, 43, 2, 80.50, '2019-09-09 09:46:54', '');
INSERT INTO `user_pay` VALUES (761, 19, 34, 1, 10.00, '2019-09-09 09:47:42', '');
INSERT INTO `user_pay` VALUES (762, 19, 42, 1, 15.80, '2019-09-09 09:48:33', '');
INSERT INTO `user_pay` VALUES (764, 19, 63, 1, 13.00, '2019-09-09 14:55:17', '');
INSERT INTO `user_pay` VALUES (765, 19, 41, 1, 7.88, '2019-09-09 14:55:35', '');
INSERT INTO `user_pay` VALUES (766, 19, 73, 1, 150.00, '2019-09-11 09:37:33', '');
INSERT INTO `user_pay` VALUES (767, 19, 87, 1, 151.20, '2019-09-11 09:37:56', '');
INSERT INTO `user_pay` VALUES (768, 19, 42, 2, 15.00, '2019-09-16 09:25:42', '');
INSERT INTO `user_pay` VALUES (769, 19, 32, 2, 62.80, '2019-09-16 09:25:58', '');
INSERT INTO `user_pay` VALUES (770, 19, 42, 2, 16.00, '2019-09-16 09:26:16', '小笼包');
INSERT INTO `user_pay` VALUES (772, 19, 32, 1, 49.20, '2019-09-16 09:28:51', '');
INSERT INTO `user_pay` VALUES (773, 19, 34, 1, 10.00, '2019-09-16 09:29:04', '');
INSERT INTO `user_pay` VALUES (774, 19, 53, 1, 50.00, '2019-09-16 09:29:37', '');
INSERT INTO `user_pay` VALUES (775, 19, 60, 1, 20.55, '2019-09-16 09:30:08', '');
INSERT INTO `user_pay` VALUES (776, 19, 40, 1, 4.50, '2019-09-16 09:32:20', '');
INSERT INTO `user_pay` VALUES (778, 19, 40, 2, 4.50, '2019-09-16 09:33:34', '');
INSERT INTO `user_pay` VALUES (779, 19, 41, 1, 15.00, '2019-09-16 11:03:05', '');
INSERT INTO `user_pay` VALUES (780, 19, 41, 1, 22.50, '2019-09-16 11:08:34', '午餐加奶茶');
INSERT INTO `user_pay` VALUES (781, 19, 41, 1, 11.80, '2019-09-18 10:49:05', '');
INSERT INTO `user_pay` VALUES (782, 19, 63, 1, 15.00, '2019-09-18 10:49:20', '');
INSERT INTO `user_pay` VALUES (783, 19, 102, 1, 139.00, '2019-09-20 10:57:40', '');
INSERT INTO `user_pay` VALUES (784, 19, 40, 2, 4.50, '2019-09-23 10:37:49', '');
INSERT INTO `user_pay` VALUES (785, 19, 41, 2, 49.00, '2019-09-23 10:38:01', '');
INSERT INTO `user_pay` VALUES (786, 19, 63, 1, 15.00, '2019-09-23 10:39:07', '');
INSERT INTO `user_pay` VALUES (787, 19, 101, 1, 8.90, '2019-09-23 10:39:54', '洗脸巾');
INSERT INTO `user_pay` VALUES (788, 19, 96, 1, 80.70, '2019-09-23 10:40:25', '卸妆水 发卡');
INSERT INTO `user_pay` VALUES (789, 19, 40, 2, 25.00, '2019-09-23 13:24:42', '小食拼盘');
INSERT INTO `user_pay` VALUES (790, 19, 33, 2, 75.00, '2019-09-23 13:37:16', '');
INSERT INTO `user_pay` VALUES (791, 21, 41, 2, 10.80, '2019-09-25 18:05:31', '6号');
INSERT INTO `user_pay` VALUES (792, 21, 18, 2, 48.69, '2019-09-25 18:05:52', '7号');
INSERT INTO `user_pay` VALUES (793, 21, 41, 2, 30.00, '2019-09-25 18:07:15', '11 和 12号约 30');
INSERT INTO `user_pay` VALUES (794, 21, 41, 2, 39.00, '2019-09-25 18:07:53', '35+4 学车午餐');
INSERT INTO `user_pay` VALUES (795, 21, 70, 2, 200.00, '2019-09-25 18:08:33', '教练红包');
INSERT INTO `user_pay` VALUES (796, 21, 41, 2, 57.00, '2019-09-25 18:09:04', '学车午饭 26+31');
INSERT INTO `user_pay` VALUES (797, 21, 62, 2, 40.00, '2019-09-25 18:10:15', '18号之前消费');
INSERT INTO `user_pay` VALUES (798, 21, 18, 2, 21.62, '2019-09-25 18:10:34', '18号');
INSERT INTO `user_pay` VALUES (799, 21, 62, 2, 16.50, '2019-09-25 18:11:10', '18号');
INSERT INTO `user_pay` VALUES (800, 21, 41, 2, 30.00, '2019-09-25 18:12:08', '19 20号');
INSERT INTO `user_pay` VALUES (801, 21, 53, 2, 50.00, '2019-09-25 18:12:32', '');
INSERT INTO `user_pay` VALUES (802, 21, 62, 2, 10.00, '2019-09-25 18:13:00', '');
INSERT INTO `user_pay` VALUES (803, 21, 62, 2, 31.00, '2019-09-25 18:13:43', '22号晚 19+5+7');
INSERT INTO `user_pay` VALUES (804, 21, 70, 2, 10.00, '2019-09-25 18:14:20', '观览车');
INSERT INTO `user_pay` VALUES (805, 21, 41, 2, 22.60, '2019-09-25 18:14:44', '');
INSERT INTO `user_pay` VALUES (806, 21, 41, 2, 7.00, '2019-09-25 18:14:49', '');
INSERT INTO `user_pay` VALUES (807, 21, 41, 2, 19.60, '2019-09-25 18:14:55', '');
INSERT INTO `user_pay` VALUES (808, 19, 53, 1, 2.58, '2019-09-29 09:28:45', '');
INSERT INTO `user_pay` VALUES (809, 19, 34, 1, 10.00, '2019-09-29 09:28:57', '');
INSERT INTO `user_pay` VALUES (810, 19, 34, 1, 2.00, '2019-09-29 09:29:10', '');
INSERT INTO `user_pay` VALUES (811, 19, 63, 1, 14.00, '2019-09-29 09:29:35', '');
INSERT INTO `user_pay` VALUES (812, 19, 41, 9, 55.00, '2019-10-10 09:58:57', '水饺，炒饭');
INSERT INTO `user_pay` VALUES (813, 19, 33, 2, 50.00, '2019-10-10 09:59:46', '');
INSERT INTO `user_pay` VALUES (814, 19, 66, 2, 186.00, '2019-10-10 10:00:43', '盱眙宾馆');
INSERT INTO `user_pay` VALUES (815, 19, 51, 2, 22.00, '2019-10-10 10:01:29', '正新鸡排');
INSERT INTO `user_pay` VALUES (816, 19, 42, 9, 16.00, '2019-10-10 10:02:10', '鸭血粉丝 小笼包');
INSERT INTO `user_pay` VALUES (817, 19, 32, 2, 322.00, '2019-10-10 10:05:42', '');
INSERT INTO `user_pay` VALUES (818, 19, 53, 1, 26.02, '2019-10-10 10:07:05', '');
INSERT INTO `user_pay` VALUES (819, 19, 63, 1, 16.00, '2019-10-10 10:08:00', '');
INSERT INTO `user_pay` VALUES (820, 19, 66, 1, 227.00, '2019-10-10 10:09:33', '盱眙宾馆');
INSERT INTO `user_pay` VALUES (821, 19, 91, 1, 244.00, '2019-10-10 10:10:16', '爸爸的酒');
INSERT INTO `user_pay` VALUES (822, 19, 53, 1, 30.00, '2019-10-10 10:10:31', '');
INSERT INTO `user_pay` VALUES (823, 19, 32, 1, 67.09, '2019-10-10 10:10:51', '');
INSERT INTO `user_pay` VALUES (824, 19, 91, 9, 500.00, '2019-10-10 10:12:06', '红包');
INSERT INTO `user_pay` VALUES (825, 19, 91, 9, 500.00, '2019-10-10 10:12:10', '红包');
INSERT INTO `user_pay` VALUES (826, 21, 18, 2, 32.26, '2019-10-10 10:21:43', '');
INSERT INTO `user_pay` VALUES (827, 21, 18, 2, 15.97, '2019-10-10 10:46:39', '');
INSERT INTO `user_pay` VALUES (828, 21, 67, 2, 10.00, '2019-10-10 10:47:18', '');
INSERT INTO `user_pay` VALUES (829, 21, 71, 2, 6.00, '2019-10-10 10:47:38', '');
INSERT INTO `user_pay` VALUES (830, 21, 95, 2, 35.00, '2019-10-10 10:47:53', '');
INSERT INTO `user_pay` VALUES (831, 21, 71, 2, 3.00, '2019-10-10 10:48:32', '');
INSERT INTO `user_pay` VALUES (832, 21, 62, 2, 69.60, '2019-10-10 10:48:48', '');
INSERT INTO `user_pay` VALUES (833, 21, 40, 2, 4.20, '2019-10-10 10:49:18', '');
INSERT INTO `user_pay` VALUES (834, 21, 41, 2, 10.00, '2019-10-10 10:49:49', '');
INSERT INTO `user_pay` VALUES (835, 21, 75, 2, 134.00, '2019-10-10 10:50:05', '');
INSERT INTO `user_pay` VALUES (836, 21, 73, 2, 189.00, '2019-10-10 10:50:22', '');
INSERT INTO `user_pay` VALUES (837, 21, 62, 2, 6.00, '2019-10-10 10:50:43', '泡芙');
INSERT INTO `user_pay` VALUES (838, 21, 41, 2, 27.00, '2019-10-10 10:50:59', '');
INSERT INTO `user_pay` VALUES (839, 21, 71, 2, 6.00, '2019-10-10 10:51:13', '');
INSERT INTO `user_pay` VALUES (840, 21, 40, 2, 5.00, '2019-10-10 10:51:34', '');
INSERT INTO `user_pay` VALUES (841, 21, 41, 2, 10.80, '2019-10-10 10:51:40', '');
INSERT INTO `user_pay` VALUES (842, 21, 90, 2, 37.50, '2019-10-10 10:52:04', '');
INSERT INTO `user_pay` VALUES (843, 21, 90, 2, 60.30, '2019-10-10 10:52:21', '');
INSERT INTO `user_pay` VALUES (844, 21, 90, 2, 79.10, '2019-10-10 10:52:32', '');
INSERT INTO `user_pay` VALUES (845, 21, 71, 2, 1.50, '2019-10-10 10:53:02', '');
INSERT INTO `user_pay` VALUES (846, 21, 70, 2, 2.00, '2019-10-10 10:53:34', '餐巾纸');
INSERT INTO `user_pay` VALUES (847, 21, 32, 2, 10.00, '2019-10-10 10:53:49', '感谢费');
INSERT INTO `user_pay` VALUES (848, 21, 35, 2, 21.00, '2019-10-10 10:54:04', '');
INSERT INTO `user_pay` VALUES (849, 21, 53, 2, 99.90, '2019-10-10 10:54:29', '');
INSERT INTO `user_pay` VALUES (850, 21, 91, 2, 90.00, '2019-10-10 10:55:16', '两箱牛奶');
INSERT INTO `user_pay` VALUES (851, 21, 18, 2, 56.48, '2019-10-10 10:55:39', '');
INSERT INTO `user_pay` VALUES (852, 21, 18, 2, 50.00, '2019-10-10 10:55:54', '');
INSERT INTO `user_pay` VALUES (853, 21, 71, 2, 2.00, '2019-10-10 10:56:19', '');
INSERT INTO `user_pay` VALUES (854, 21, 62, 2, 45.00, '2019-10-10 10:56:36', '泡面');
INSERT INTO `user_pay` VALUES (855, 21, 41, 2, 15.60, '2019-10-10 10:56:55', '');
INSERT INTO `user_pay` VALUES (856, 21, 41, 2, 15.60, '2019-10-10 10:57:16', '9号');
INSERT INTO `user_pay` VALUES (857, 19, 63, 1, 16.00, '2019-10-14 17:25:14', '');
INSERT INTO `user_pay` VALUES (858, 19, 63, 1, 16.00, '2019-10-14 17:25:29', '');
INSERT INTO `user_pay` VALUES (859, 19, 41, 1, 21.00, '2019-10-14 17:25:55', '');
INSERT INTO `user_pay` VALUES (860, 19, 41, 1, 15.00, '2019-10-14 17:26:04', '');
INSERT INTO `user_pay` VALUES (861, 19, 92, 2, 5.00, '2019-10-16 14:48:30', '');
INSERT INTO `user_pay` VALUES (862, 19, 103, 1, 34.26, '2019-10-16 14:50:34', '');
INSERT INTO `user_pay` VALUES (863, 19, 103, 1, 53.90, '2019-10-16 14:50:43', '');
INSERT INTO `user_pay` VALUES (864, 19, 98, 1, 199.50, '2019-10-17 10:26:57', '床上四件套');
INSERT INTO `user_pay` VALUES (865, 21, 41, 2, 13.60, '2019-10-17 16:08:46', '');
INSERT INTO `user_pay` VALUES (866, 21, 41, 2, 14.00, '2019-10-17 16:08:57', '');
INSERT INTO `user_pay` VALUES (867, 21, 71, 2, 13.00, '2019-10-17 16:09:18', '');
INSERT INTO `user_pay` VALUES (868, 21, 51, 2, 10.00, '2019-10-17 16:09:40', '');
INSERT INTO `user_pay` VALUES (869, 21, 41, 2, 26.00, '2019-10-17 16:10:16', '');
INSERT INTO `user_pay` VALUES (870, 21, 104, 2, 6.00, '2019-10-17 16:10:41', '');
INSERT INTO `user_pay` VALUES (872, 21, 91, 2, 46.70, '2019-10-17 16:11:56', '水果');
INSERT INTO `user_pay` VALUES (873, 21, 41, 2, 11.60, '2019-10-17 16:12:17', '');
INSERT INTO `user_pay` VALUES (874, 21, 41, 2, 26.00, '2019-10-17 16:12:30', '');
INSERT INTO `user_pay` VALUES (875, 21, 105, 2, 166.00, '2019-10-17 16:12:43', '');
INSERT INTO `user_pay` VALUES (876, 21, 104, 2, 5.00, '2019-10-17 16:12:55', '');
INSERT INTO `user_pay` VALUES (877, 21, 41, 2, 15.60, '2019-10-17 16:13:38', '');
INSERT INTO `user_pay` VALUES (878, 21, 62, 2, 5.00, '2019-10-17 16:13:57', '');
INSERT INTO `user_pay` VALUES (879, 21, 40, 2, 13.90, '2019-10-17 16:14:21', '包子');
INSERT INTO `user_pay` VALUES (880, 21, 41, 2, 14.00, '2019-10-17 16:14:32', '');
INSERT INTO `user_pay` VALUES (881, 19, 61, 2, 29.90, '2019-10-18 15:43:02', '');
INSERT INTO `user_pay` VALUES (882, 19, 51, 1, 39.00, '2019-10-18 15:43:35', '肯德基鸡翅');
INSERT INTO `user_pay` VALUES (883, 19, 34, 1, 10.00, '2019-10-18 15:47:21', '');
INSERT INTO `user_pay` VALUES (884, 19, 33, 2, 50.00, '2019-10-21 09:58:48', '地铁月卡');
INSERT INTO `user_pay` VALUES (885, 19, 33, 2, 50.00, '2019-10-21 09:58:57', '地铁月卡');
INSERT INTO `user_pay` VALUES (886, 19, 108, 1, 12.00, '2019-10-21 10:00:16', '退四件套快递费');
INSERT INTO `user_pay` VALUES (887, 21, 41, 2, 16.00, '2019-10-21 10:04:51', '');
INSERT INTO `user_pay` VALUES (888, 21, 63, 2, 15.00, '2019-10-21 10:05:28', '');
INSERT INTO `user_pay` VALUES (889, 21, 62, 2, 39.90, '2019-10-21 10:05:55', '泡芙');
INSERT INTO `user_pay` VALUES (890, 21, 51, 2, 48.00, '2019-10-21 10:06:40', '猪蹄 鸭头 小吃等');
INSERT INTO `user_pay` VALUES (891, 21, 18, 2, 100.00, '2019-10-21 10:07:23', '大哥 打车费');
INSERT INTO `user_pay` VALUES (892, 21, 45, 2, 193.00, '2019-10-21 10:07:39', '');
INSERT INTO `user_pay` VALUES (893, 21, 71, 2, 5.60, '2019-10-21 10:07:55', '');
INSERT INTO `user_pay` VALUES (894, 21, 63, 2, 19.00, '2019-10-21 10:08:06', '');
INSERT INTO `user_pay` VALUES (895, 21, 41, 2, 15.00, '2019-10-21 10:08:19', '');
INSERT INTO `user_pay` VALUES (896, 19, 91, 1, 338.70, '2019-10-22 11:15:14', '纪梵希');
INSERT INTO `user_pay` VALUES (897, 19, 101, 1, 10.00, '2019-10-22 11:16:00', '双十一预定护眼仪 定金');
INSERT INTO `user_pay` VALUES (898, 19, 41, 2, 108.00, '2019-10-22 11:17:18', '辣三多 美食券');
INSERT INTO `user_pay` VALUES (899, 19, 41, 1, 23.88, '2019-10-22 11:31:44', '螺狮粉 加 超级会员红包');
INSERT INTO `user_pay` VALUES (900, 19, 42, 2, 19.90, '2019-10-23 13:26:22', '大渝火锅4.8折券');
INSERT INTO `user_pay` VALUES (901, 19, 91, 1, 50.00, '2019-10-23 13:26:41', '纪梵希定金');
INSERT INTO `user_pay` VALUES (902, 19, 42, 2, 19.00, '2019-10-24 09:53:16', '擀面皮');
INSERT INTO `user_pay` VALUES (903, 19, 33, 1, 10.00, '2019-10-24 09:53:32', '');
INSERT INTO `user_pay` VALUES (904, 19, 41, 1, 14.00, '2019-10-28 11:10:30', '');
INSERT INTO `user_pay` VALUES (905, 19, 63, 1, 38.00, '2019-10-28 11:10:47', '');
INSERT INTO `user_pay` VALUES (906, 19, 53, 1, 10.00, '2019-10-28 11:11:07', '');
INSERT INTO `user_pay` VALUES (907, 19, 32, 2, 67.80, '2019-10-28 11:13:15', '');
INSERT INTO `user_pay` VALUES (908, 21, 41, 2, 10.30, '2019-10-28 15:22:16', '');
INSERT INTO `user_pay` VALUES (909, 21, 41, 2, 15.60, '2019-10-28 15:24:17', '');
INSERT INTO `user_pay` VALUES (910, 21, 40, 2, 5.50, '2019-10-28 15:26:08', '');
INSERT INTO `user_pay` VALUES (911, 21, 41, 2, 15.40, '2019-10-28 15:26:59', '');
INSERT INTO `user_pay` VALUES (912, 21, 40, 2, 5.00, '2019-10-28 15:27:36', '');
INSERT INTO `user_pay` VALUES (913, 21, 41, 2, 14.00, '2019-10-28 15:27:58', '');
INSERT INTO `user_pay` VALUES (914, 21, 41, 2, 12.80, '2019-10-28 15:28:46', '');
INSERT INTO `user_pay` VALUES (915, 21, 40, 2, 3.50, '2019-10-28 15:29:06', '');
INSERT INTO `user_pay` VALUES (916, 21, 105, 2, 276.00, '2019-10-28 15:29:21', '');
INSERT INTO `user_pay` VALUES (917, 21, 40, 2, 4.90, '2019-10-28 15:29:45', '');
INSERT INTO `user_pay` VALUES (918, 21, 40, 2, 4.20, '2019-10-28 15:29:55', '');
INSERT INTO `user_pay` VALUES (919, 19, 34, 1, 10.00, '2019-10-29 14:05:09', '');
INSERT INTO `user_pay` VALUES (920, 21, 41, 2, 10.10, '2019-11-01 09:28:01', '');
INSERT INTO `user_pay` VALUES (921, 21, 40, 2, 5.30, '2019-11-01 09:28:23', '');
INSERT INTO `user_pay` VALUES (922, 21, 41, 2, 24.60, '2019-11-01 09:28:39', '');
INSERT INTO `user_pay` VALUES (923, 21, 40, 2, 10.00, '2019-11-01 09:29:55', '');
INSERT INTO `user_pay` VALUES (924, 21, 41, 2, 11.80, '2019-11-01 09:30:46', '');
INSERT INTO `user_pay` VALUES (925, 21, 40, 2, 7.50, '2019-11-01 09:31:19', '');
INSERT INTO `user_pay` VALUES (926, 21, 33, 5, 14.00, '2019-11-01 09:32:52', '4 次');
INSERT INTO `user_pay` VALUES (927, 21, 33, 5, 75.00, '2019-11-01 09:33:08', '月卡');
INSERT INTO `user_pay` VALUES (928, 19, 33, 2, 75.00, '2019-11-01 09:41:42', '');
INSERT INTO `user_pay` VALUES (929, 19, 40, 1, 5.00, '2019-11-04 11:22:22', '');
INSERT INTO `user_pay` VALUES (930, 19, 41, 1, 9.38, '2019-11-04 11:22:38', '');
INSERT INTO `user_pay` VALUES (931, 19, 41, 1, 15.38, '2019-11-04 11:22:56', '');
INSERT INTO `user_pay` VALUES (932, 19, 51, 1, 34.00, '2019-11-04 11:23:06', '');
INSERT INTO `user_pay` VALUES (933, 19, 51, 1, 14.50, '2019-11-04 11:23:13', '');
INSERT INTO `user_pay` VALUES (934, 19, 63, 1, 15.00, '2019-11-04 11:23:28', '');
INSERT INTO `user_pay` VALUES (935, 19, 96, 2, 751.23, '2019-11-04 11:25:37', '');
INSERT INTO `user_pay` VALUES (936, 19, 62, 2, 121.10, '2019-11-04 11:26:30', '红粉粉');
INSERT INTO `user_pay` VALUES (937, 19, 53, 1, 29.94, '2019-11-05 09:29:01', 'hu');
INSERT INTO `user_pay` VALUES (938, 19, 63, 1, 14.18, '2019-11-05 09:29:32', '');
INSERT INTO `user_pay` VALUES (939, 19, 95, 1, 35.00, '2019-11-05 09:30:15', '');
INSERT INTO `user_pay` VALUES (940, 19, 51, 2, 57.11, '2019-11-06 11:07:22', '叮咚买菜早点');
INSERT INTO `user_pay` VALUES (941, 19, 41, 1, 16.93, '2019-11-06 11:08:16', '');
INSERT INTO `user_pay` VALUES (942, 19, 101, 1, 22.50, '2019-11-06 11:12:12', '');
INSERT INTO `user_pay` VALUES (943, 19, 63, 1, 17.00, '2019-11-07 10:01:39', '');
INSERT INTO `user_pay` VALUES (944, 19, 78, 1, 52.81, '2019-11-11 11:43:26', '');
INSERT INTO `user_pay` VALUES (945, 19, 34, 1, 11.00, '2019-11-11 11:43:40', '');
INSERT INTO `user_pay` VALUES (947, 19, 91, 1, 122.50, '2019-11-11 11:47:45', '');
INSERT INTO `user_pay` VALUES (948, 19, 100, 1, 77.42, '2019-11-11 11:48:05', '');
INSERT INTO `user_pay` VALUES (949, 19, 110, 1, 115.64, '2019-11-11 11:48:49', '');
INSERT INTO `user_pay` VALUES (950, 19, 110, 1, 125.00, '2019-11-11 11:48:57', '');
INSERT INTO `user_pay` VALUES (951, 19, 90, 1, 385.00, '2019-11-11 11:49:29', '');
INSERT INTO `user_pay` VALUES (952, 19, 85, 2, 66.00, '2019-11-11 11:51:59', '两双棉鞋');
INSERT INTO `user_pay` VALUES (953, 19, 70, 2, 10.00, '2019-11-11 11:52:50', '姐姐红包');
INSERT INTO `user_pay` VALUES (954, 21, 42, 2, 234.00, '2019-11-20 13:49:06', '独墅湖邻里中心 312-78');
INSERT INTO `user_pay` VALUES (955, 21, 71, 2, 4.00, '2019-11-20 13:49:53', '');
INSERT INTO `user_pay` VALUES (956, 21, 41, 2, 232.00, '2019-11-20 13:50:48', '无锡 灵山大佛');
INSERT INTO `user_pay` VALUES (957, 21, 70, 2, 1.00, '2019-11-20 13:51:43', '');
INSERT INTO `user_pay` VALUES (958, 21, 41, 2, 39.30, '2019-11-20 13:53:33', '午餐+两顿晚餐');
INSERT INTO `user_pay` VALUES (959, 21, 104, 2, 5.00, '2019-11-20 13:54:01', '');
INSERT INTO `user_pay` VALUES (960, 21, 41, 2, 102.50, '2019-11-20 13:54:22', '谷田稻香');
INSERT INTO `user_pay` VALUES (961, 21, 42, 2, 11.00, '2019-11-20 13:55:04', '拉面');
INSERT INTO `user_pay` VALUES (962, 21, 42, 2, 14.00, '2019-11-20 13:55:29', '拉面');
INSERT INTO `user_pay` VALUES (963, 21, 104, 2, 8.00, '2019-11-20 13:55:48', '');
INSERT INTO `user_pay` VALUES (964, 21, 63, 2, 15.00, '2019-11-20 13:58:32', '');
INSERT INTO `user_pay` VALUES (965, 21, 71, 2, 3.00, '2019-11-20 13:58:42', '');
INSERT INTO `user_pay` VALUES (966, 21, 35, 2, 15.00, '2019-11-20 13:59:24', '三轮车');
INSERT INTO `user_pay` VALUES (967, 21, 93, 2, 60.00, '2019-11-20 14:00:04', '天平山');
INSERT INTO `user_pay` VALUES (968, 21, 43, 2, 13.00, '2019-11-20 14:01:47', '养乐多');
INSERT INTO `user_pay` VALUES (969, 21, 42, 2, 10.00, '2019-11-20 14:02:07', '拉面');
INSERT INTO `user_pay` VALUES (970, 21, 42, 2, 9.70, '2019-11-20 14:03:09', '泡面+鸡蛋');
INSERT INTO `user_pay` VALUES (971, 21, 41, 2, 13.80, '2019-11-20 14:03:40', '全家');
INSERT INTO `user_pay` VALUES (972, 19, 61, 2, 30.00, '2019-11-20 14:13:03', '石榴');
INSERT INTO `user_pay` VALUES (973, 19, 41, 2, 54.50, '2019-11-20 14:13:24', '肯德基');
INSERT INTO `user_pay` VALUES (974, 19, 34, 2, 1.50, '2019-11-20 14:13:57', '自行车');
INSERT INTO `user_pay` VALUES (975, 19, 43, 1, 29.70, '2019-11-20 14:14:34', '植物酸奶');
INSERT INTO `user_pay` VALUES (976, 19, 41, 1, 17.40, '2019-11-20 14:15:10', '');
INSERT INTO `user_pay` VALUES (977, 19, 41, 1, 17.40, '2019-11-20 14:15:10', '');
INSERT INTO `user_pay` VALUES (978, 19, 111, 1, 23.40, '2019-11-20 14:18:29', '手机数据线保护套和贴纸');
INSERT INTO `user_pay` VALUES (979, 19, 110, 1, 120.63, '2019-11-20 14:19:27', '胡子扬妈妈睡衣');
INSERT INTO `user_pay` VALUES (980, 19, 111, 1, 19.80, '2019-11-20 14:20:36', '手机贴纸');
INSERT INTO `user_pay` VALUES (981, 19, 111, 1, 2.00, '2019-11-20 14:20:49', '充电宝');
INSERT INTO `user_pay` VALUES (982, 19, 43, 1, 7.50, '2019-11-20 14:22:07', '');
INSERT INTO `user_pay` VALUES (983, 19, 104, 1, 5.00, '2019-11-20 14:23:51', '');
INSERT INTO `user_pay` VALUES (984, 19, 33, 1, 12.00, '2019-11-20 14:24:05', '');
INSERT INTO `user_pay` VALUES (985, 19, 101, 1, 99.00, '2019-11-20 14:24:32', '扫地机器人');
INSERT INTO `user_pay` VALUES (986, 19, 111, 1, 199.00, '2019-11-20 14:24:54', '耳机');
INSERT INTO `user_pay` VALUES (987, 19, 41, 1, 15.40, '2019-11-20 14:25:57', '');
INSERT INTO `user_pay` VALUES (988, 19, 41, 2, 37.00, '2019-11-22 09:28:03', '和府捞面');
INSERT INTO `user_pay` VALUES (989, 19, 55, 2, 30.00, '2019-11-22 09:28:17', '');
INSERT INTO `user_pay` VALUES (990, 19, 101, 2, 69.00, '2019-11-22 09:32:00', '牙刷头');
INSERT INTO `user_pay` VALUES (991, 19, 33, 2, 50.00, '2019-11-25 10:15:39', '地铁月卡');
INSERT INTO `user_pay` VALUES (992, 19, 45, 1, 43.00, '2019-11-25 10:16:24', '烧烤');
INSERT INTO `user_pay` VALUES (993, 19, 41, 1, 12.99, '2019-11-25 10:17:02', '');
INSERT INTO `user_pay` VALUES (994, 19, 43, 1, 12.60, '2019-11-25 10:18:37', '');
INSERT INTO `user_pay` VALUES (995, 19, 111, 1, 18.80, '2019-11-25 10:18:53', '');
INSERT INTO `user_pay` VALUES (996, 19, 104, 9, 5.00, '2019-11-25 10:20:47', '');
INSERT INTO `user_pay` VALUES (997, 19, 105, 9, 200.00, '2019-11-25 10:20:58', '');
INSERT INTO `user_pay` VALUES (998, 21, 42, 2, 262.00, '2019-11-25 11:22:53', '大渝火锅');
INSERT INTO `user_pay` VALUES (999, 21, 63, 2, 54.00, '2019-11-25 11:23:55', '昆山 茉沏');
INSERT INTO `user_pay` VALUES (1000, 21, 103, 2, 278.00, '2019-11-25 11:26:51', '');
INSERT INTO `user_pay` VALUES (1001, 21, 42, 2, 185.00, '2019-11-25 11:27:53', '昆山烤鱼');
INSERT INTO `user_pay` VALUES (1002, 21, 111, 2, 3010.00, '2019-11-25 11:29:48', 'iPhonex');
INSERT INTO `user_pay` VALUES (1003, 19, 41, 1, 15.42, '2019-11-26 10:04:24', '');
INSERT INTO `user_pay` VALUES (1004, 19, 41, 1, 24.00, '2019-11-26 10:04:41', '');
INSERT INTO `user_pay` VALUES (1005, 19, 101, 1, 99.00, '2019-11-26 10:05:09', '十字绣');
INSERT INTO `user_pay` VALUES (1006, 19, 62, 1, 29.00, '2019-11-28 10:15:16', '蛋糕');
INSERT INTO `user_pay` VALUES (1007, 19, 62, 1, 34.90, '2019-11-28 10:15:35', '阿宽红油面皮');
INSERT INTO `user_pay` VALUES (1008, 19, 62, 1, 60.10, '2019-11-28 10:16:45', '梅故事');
INSERT INTO `user_pay` VALUES (1009, 19, 43, 1, 12.70, '2019-11-28 10:18:21', '');
INSERT INTO `user_pay` VALUES (1010, 19, 63, 1, 12.00, '2019-11-29 10:27:30', '');
INSERT INTO `user_pay` VALUES (1011, 19, 41, 1, 18.00, '2019-12-02 16:30:38', '');
INSERT INTO `user_pay` VALUES (1012, 19, 41, 1, 11.96, '2019-12-02 16:30:46', '');
INSERT INTO `user_pay` VALUES (1013, 19, 34, 1, 10.00, '2019-12-02 16:31:03', '');
INSERT INTO `user_pay` VALUES (1014, 19, 41, 1, 23.96, '2019-12-02 16:34:11', '竹笋');
INSERT INTO `user_pay` VALUES (1015, 19, 33, 2, 120.00, '2019-12-02 16:35:00', '地铁月卡');
INSERT INTO `user_pay` VALUES (1016, 19, 61, 2, 60.00, '2019-12-02 16:35:55', '两箱石榴');
INSERT INTO `user_pay` VALUES (1017, 19, 95, 2, 19.90, '2019-12-02 16:36:30', '');
INSERT INTO `user_pay` VALUES (1018, 19, 101, 2, 138.00, '2019-12-05 09:44:41', '唇膏');
INSERT INTO `user_pay` VALUES (1019, 19, 62, 1, 3.65, '2019-12-05 09:48:39', '泡芙');
INSERT INTO `user_pay` VALUES (1020, 19, 101, 1, 33.80, '2019-12-05 16:27:53', '卸妆棉');
INSERT INTO `user_pay` VALUES (1021, 19, 41, 1, 43.26, '2019-12-05 16:28:25', '买菜');
INSERT INTO `user_pay` VALUES (1022, 19, 62, 1, 24.31, '2019-12-05 16:30:33', '锅巴');
INSERT INTO `user_pay` VALUES (1023, 19, 41, 1, 15.00, '2019-12-06 10:53:01', '胡子扬午餐');
INSERT INTO `user_pay` VALUES (1024, 19, 34, 1, 10.00, '2019-12-09 09:29:56', '');
INSERT INTO `user_pay` VALUES (1025, 19, 41, 1, 15.88, '2019-12-09 11:18:33', '螺狮粉');
INSERT INTO `user_pay` VALUES (1026, 19, 41, 1, 11.98, '2019-12-09 11:45:41', '胡子扬午饭');
INSERT INTO `user_pay` VALUES (1027, 19, 62, 1, 40.60, '2019-12-12 09:45:00', '脆枣');
INSERT INTO `user_pay` VALUES (1028, 19, 62, 1, 49.70, '2019-12-12 09:45:15', '藕粉');
INSERT INTO `user_pay` VALUES (1029, 19, 91, 1, 144.00, '2019-12-12 09:46:07', '傲园生日礼物');
INSERT INTO `user_pay` VALUES (1030, 19, 41, 2, 15.00, '2019-12-16 10:00:45', '牛肉粉丝');
INSERT INTO `user_pay` VALUES (1031, 19, 96, 2, 105.00, '2019-12-16 10:01:13', '隔离霜加运费');
INSERT INTO `user_pay` VALUES (1032, 19, 34, 1, 10.00, '2019-12-16 10:01:57', '公交卡');
INSERT INTO `user_pay` VALUES (1033, 19, 51, 1, 15.00, '2019-12-16 10:03:22', '花甲');
INSERT INTO `user_pay` VALUES (1034, 19, 51, 1, 19.00, '2019-12-16 10:03:43', '奶茶');
INSERT INTO `user_pay` VALUES (1035, 19, 18, 1, 18.95, '2019-12-16 10:04:05', '');
INSERT INTO `user_pay` VALUES (1036, 19, 53, 1, 29.72, '2019-12-16 10:04:27', '');
INSERT INTO `user_pay` VALUES (1037, 19, 51, 1, 14.90, '2019-12-16 10:04:47', '一点点奶茶');
INSERT INTO `user_pay` VALUES (1038, 19, 99, 1, 500.00, '2019-12-16 10:05:20', '换黄金');
INSERT INTO `user_pay` VALUES (1039, 19, 53, 1, 9.98, '2019-12-16 10:06:14', '12-12（胡）');
INSERT INTO `user_pay` VALUES (1040, 19, 95, 1, 35.00, '2019-12-16 10:08:29', '12-11（胡）');
INSERT INTO `user_pay` VALUES (1041, 21, 33, 2, 10.00, '2019-12-18 15:46:12', '11月 25、26 两次');
INSERT INTO `user_pay` VALUES (1042, 21, 33, 5, 27.00, '2019-12-18 15:48:46', '');
INSERT INTO `user_pay` VALUES (1043, 21, 41, 2, 15.00, '2019-12-18 15:52:06', '全家');
INSERT INTO `user_pay` VALUES (1044, 21, 62, 2, 4.50, '2019-12-18 15:52:57', '');
INSERT INTO `user_pay` VALUES (1045, 21, 34, 2, 2.00, '2019-12-18 15:53:13', '');
INSERT INTO `user_pay` VALUES (1046, 21, 42, 2, 139.00, '2019-12-18 15:53:45', '辣三多');
INSERT INTO `user_pay` VALUES (1047, 21, 111, 2, 100.00, '2019-12-18 15:54:25', '安装手表系统');
INSERT INTO `user_pay` VALUES (1048, 21, 104, 2, 5.00, '2019-12-18 15:54:49', '');
INSERT INTO `user_pay` VALUES (1049, 21, 53, 2, 29.97, '2019-12-18 15:55:03', '');
INSERT INTO `user_pay` VALUES (1050, 21, 33, 2, 50.00, '2019-12-18 15:55:22', '月卡');
INSERT INTO `user_pay` VALUES (1051, 21, 42, 2, 10.00, '2019-12-18 15:56:21', '');
INSERT INTO `user_pay` VALUES (1052, 21, 41, 2, 15.00, '2019-12-18 15:57:14', '全家');
INSERT INTO `user_pay` VALUES (1053, 21, 42, 2, 10.00, '2019-12-18 15:58:11', '12月5号');
INSERT INTO `user_pay` VALUES (1054, 21, 42, 2, 67.20, '2019-12-18 15:58:30', '莽子火锅');
INSERT INTO `user_pay` VALUES (1055, 21, 45, 2, 48.50, '2019-12-18 15:59:20', '肯德基');
INSERT INTO `user_pay` VALUES (1056, 21, 33, 2, 50.00, '2019-12-18 15:59:39', '月卡');
INSERT INTO `user_pay` VALUES (1057, 21, 62, 2, 4.50, '2019-12-18 16:00:17', '12月17号');

-- ----------------------------
-- Table structure for user_spbz
-- ----------------------------
DROP TABLE IF EXISTS `user_spbz`;
CREATE TABLE `user_spbz`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USERID` int(10) NULL DEFAULT NULL,
  `RELATEID` int(10) NULL DEFAULT NULL,
  `CZLX` int(10) NULL DEFAULT NULL,
  `CZTIME` datetime NULL DEFAULT NULL,
  `XBBJ` int(1) NULL DEFAULT NULL,
  `TASKNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TASKDESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RELATETABLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_spbz
-- ----------------------------
INSERT INTO `user_spbz` VALUES (1, 18, 6, 181, '2019-03-14 15:28:30', 0, '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (2, 18, 6, 180, '2019-03-14 15:32:08', 0, '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (3, 21, 6, 180, '2019-03-14 15:35:59', 0, '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (4, 21, 6, 180, '2019-03-14 15:39:24', 0, '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (5, 19, 6, 180, '2019-03-14 15:40:06', 0, '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (6, 18, 6, 180, '2019-03-14 15:40:37', 0, '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (7, 21, 6, 180, '2019-03-14 15:52:31', 0, '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (8, 19, 6, 180, '2019-03-14 15:58:26', 0, '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (9, 21, 6, 181, '2019-03-14 16:00:04', 0, '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (10, 21, 6, 181, '2019-03-14 16:01:47', 0, '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (11, 21, 6, 180, '2019-03-14 16:03:23', 0, '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES (12, 18, 6, 180, '2019-03-14 16:20:30', 0, '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');

SET FOREIGN_KEY_CHECKS = 1;









