/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云
Source Server Version : 50540
Source Host           : 129.204.116.56:8080
Source Database       : oamanage

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-05-27 10:38:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(39) NOT NULL COMMENT '名称',
  `supnumber` int(10) DEFAULT NULL COMMENT '父级编码',
  `dicclass` varchar(39) NOT NULL COMMENT '类别',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `levels` int(10) DEFAULT NULL COMMENT '等级',
  `serial` int(10) DEFAULT NULL COMMENT '序号',
  `tagone` varchar(255) DEFAULT NULL COMMENT '备注1',
  `tagtwo` varchar(255) DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('180', '同意', null, '审批', '', null, null, '', '');
INSERT INTO `sys_dictionary` VALUES ('181', '拒绝', null, '审批', '', null, null, '', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PID` int(10) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `DISPLAY` int(1) DEFAULT NULL,
  `LEVEL` int(1) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SERIAL` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', null, '用户管理', null, null, 'user', '1');
INSERT INTO `sys_menu` VALUES ('2', null, '信息采集', null, null, 'category', '2');

-- ----------------------------
-- Table structure for sys_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_userinfo`;
CREATE TABLE `sys_userinfo` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGINID` varchar(39) CHARACTER SET utf8 NOT NULL,
  `PASSWORD` varchar(32) CHARACTER SET utf8 NOT NULL,
  `PHONE` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `SEX` int(1) DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `lrsj` datetime DEFAULT NULL,
  `picture` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isadmin` int(1) DEFAULT NULL,
  `tag` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGINID` (`LOGINID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------
INSERT INTO `sys_userinfo` VALUES ('18', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '1', '', '', '2018-12-17 16:59:39', '', '1', '1');
INSERT INTO `sys_userinfo` VALUES ('19', 'wsc', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', '0', '王宝宝', '11@11.com', '2018-12-17 16:59:39', 'photo\\sys_userinfo\\19.jpg', null, '1');
INSERT INTO `sys_userinfo` VALUES ('21', 'hzy', 'e10adc3949ba59abbe56e057f20f883e', '18506136679', '1', '胡子扬', 'xiaokeai@qq.com', '2019-01-10 15:00:25', 'photo\\sys_userinfo\\21.jpg', null, '1');
INSERT INTO `sys_userinfo` VALUES ('27', '大宝贝', 'e10adc3949ba59abbe56e057f20f883e', '15585452121', '1', '胡大宝', 'dabaobei@qq.com', '2019-03-22 10:01:24', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('28', 'faker', 'e10adc3949ba59abbe56e057f20f883e', '18506136679', '0', 'hzy', '1312783878@qq.com', '2019-03-26 20:35:44', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('29', '小可爱', '123456', '15250025880', '0', '王宝宝', '11@11.com', '2019-04-09 17:06:42', null, null, '1');
INSERT INTO `sys_userinfo` VALUES ('30', '111', 'e10adc3949ba59abbe56e057f20f883e', '15585452121', '1', '胡子扬', '11@11.com', '2019-04-10 09:46:21', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('31', 'qwqwqw', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', '0', 'abc2', '11@11.com', '2019-04-10 10:14:45', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('32', '小可爱wwwwww', 'e10adc3949ba59abbe56e057f20f883e', '15250025880', '1', 'abc2qq', '11@11.com', '2019-04-10 10:31:00', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('33', '1212121', '28f673f31cdd6af50d1f0b8e2b71b9e5', '15855555555', '1', '11212', '11@11.com', '2019-04-10 11:20:50', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('34', '12121211111111', '3e0c3e37e068deb2969de450d841fbbf', '15250025880', '1', '121212111', '1212@11.cm', '2019-04-10 11:21:45', null, null, '0');
INSERT INTO `sys_userinfo` VALUES ('35', '小可爱222', '00c66aaf5f2c3f49946f15c1ad2ea0d3', '15250025880', '1', 'abc2qq', '11@11.com', '2019-04-10 11:29:56', null, null, '0');

-- ----------------------------
-- Table structure for tb_forbid
-- ----------------------------
DROP TABLE IF EXISTS `tb_forbid`;
CREATE TABLE `tb_forbid` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGINID` varchar(39) NOT NULL,
  `LOGINTIMES` int(2) DEFAULT NULL,
  `ISDISABLE` int(1) DEFAULT NULL,
  `DISABLETIME` datetime DEFAULT NULL,
  `ENABLETIME` datetime DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_forbid
-- ----------------------------
INSERT INTO `tb_forbid` VALUES ('1', 'hzy', '3', '0', null, '2019-03-26 20:34:33', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES ('2', 'hzy', '1', '0', null, '2019-03-26 20:37:55', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES ('3', 'hzy', '1', '0', null, '2019-03-26 21:06:00', '120.211.224.36');
INSERT INTO `tb_forbid` VALUES ('4', 'wsc', '4', '0', null, '2019-04-10 16:13:34', '114.220.98.210');
INSERT INTO `tb_forbid` VALUES ('5', 'hzy', '2', '0', null, '2019-04-10 16:43:52', '114.220.98.210');
INSERT INTO `tb_forbid` VALUES ('6', 'wsc', '3', '0', null, '2019-04-25 13:30:29', '121.238.236.16');
INSERT INTO `tb_forbid` VALUES ('7', 'wsc', '1', '0', null, '2019-05-21 16:18:26', '221.225.125.19');

-- ----------------------------
-- Table structure for user_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `user_dictionary`;
CREATE TABLE `user_dictionary` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(39) NOT NULL COMMENT '名称',
  `supnumber` int(10) DEFAULT NULL COMMENT '父级编码',
  `dicclass` varchar(39) NOT NULL COMMENT '类别',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `levels` int(10) DEFAULT NULL COMMENT '等级',
  `serial` int(10) DEFAULT NULL COMMENT '序号',
  `tagone` varchar(255) DEFAULT NULL COMMENT '备注1',
  `tagtwo` varchar(255) DEFAULT NULL COMMENT '备注2',
  `userid` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `重复导入` (`name`,`dicclass`,`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_dictionary
-- ----------------------------
INSERT INTO `user_dictionary` VALUES ('1', '支付宝', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('2', '微信', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('3', '中信信用卡', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('4', '广发信用卡', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('5', '中国工商银行', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('6', '中国银行', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('7', '其它', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('8', '中国农业银行', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('9', '现金', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('10', '分期乐', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('18', '滴滴出行', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('32', '滴嗒顺风车', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('33', '地铁', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('34', '公交', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('35', '出租车', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('40', '早餐', null, '伙食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('41', '午餐', null, '伙食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('42', '晚餐', null, '伙食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('43', '牛奶', null, '零食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('44', '羽绒服', null, '服装', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('45', '夜宵', null, '伙食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('46', '项链', null, '饰品', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('51', '小吃', null, '伙食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('53', '话费', null, '充值', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('54', '游戏', null, '充值', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('55', '电影票', null, '娱乐', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('56', '优酷VIP', null, '娱乐', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('57', '汗蒸', null, '休闲', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('58', '巴士', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('59', '火车', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('60', '高德', null, '出行', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('61', '水果', null, '零食', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('62', '其他', null, '零食', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('63', '奶茶', null, '零食', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('64', '美容', null, '休闲', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('65', '电脑', null, '办公', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('66', '租房', null, '生活', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('67', '网吧', null, '娱乐', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('70', '额外支出', null, '生活', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('71', '矿泉水、饮料', null, '零食', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('73', '裤', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('75', '内衣', null, '服装', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('76', '晾衣架', null, '生活', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('78', '袜子', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('81', '招商信用卡', null, '支出方式', null, null, null, null, null, null);
INSERT INTO `user_dictionary` VALUES ('83', '丝袜', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('84', '发饰', null, '饰品', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('85', '鞋', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('86', 'T恤', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('87', '外套', null, '服装', null, null, null, null, null, '19');
INSERT INTO `user_dictionary` VALUES ('89', '帽', null, '服装', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('90', '医疗', null, '生活', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('91', '礼物', null, '生活', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('92', '自驾', null, '出行', null, null, null, null, null, '21');
INSERT INTO `user_dictionary` VALUES ('93', '旅行', null, '休闲', null, null, null, null, null, '21');

-- ----------------------------
-- Table structure for user_home
-- ----------------------------
DROP TABLE IF EXISTS `user_home`;
CREATE TABLE `user_home` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(39) NOT NULL,
  `PICTURE` varchar(50) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `LRSJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_home
-- ----------------------------
INSERT INTO `user_home` VALUES ('6', '(๑′ᴗ‵๑)Ｉ Lᵒᵛᵉᵧₒᵤ❤', 'photo\\user_home\\6.jpg', 'ヾ(◍°∇°◍)ﾉﾞ', '2019-02-18 14:10:31');

-- ----------------------------
-- Table structure for user_home_rel
-- ----------------------------
DROP TABLE IF EXISTS `user_home_rel`;
CREATE TABLE `user_home_rel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `HOMEID` int(10) NOT NULL,
  `USERID` int(10) NOT NULL,
  `LRSJ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERID` (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_home_rel
-- ----------------------------
INSERT INTO `user_home_rel` VALUES ('54', '6', '19', '2019-03-14 15:58:26');
INSERT INTO `user_home_rel` VALUES ('55', '6', '21', '2019-03-14 16:03:23');

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PID` int(10) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `DISPLAY` int(1) DEFAULT NULL,
  `LEVEL` int(1) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SERIAL` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES ('1', null, '支出', null, null, 'spend', '1');
INSERT INTO `user_menu` VALUES ('2', null, '信息采集', null, null, 'category', '2');
INSERT INTO `user_menu` VALUES ('3', null, '概览', null, null, 'overview', '3');
INSERT INTO `user_menu` VALUES ('4', null, '个人中心', null, null, 'personal', '4');

-- ----------------------------
-- Table structure for user_pay
-- ----------------------------
DROP TABLE IF EXISTS `user_pay`;
CREATE TABLE `user_pay` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `dicid` int(10) NOT NULL,
  `way` int(10) NOT NULL,
  `money` decimal(20,2) NOT NULL,
  `time` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_pay
-- ----------------------------
INSERT INTO `user_pay` VALUES ('1', '21', '46', '3', '998.00', '2019-01-31 17:00:42', '新年礼物项链');
INSERT INTO `user_pay` VALUES ('2', '19', '33', '9', '60.00', '2019-02-12 12:03:27', '二月份地铁卡充值');
INSERT INTO `user_pay` VALUES ('3', '21', '33', '9', '60.00', '2019-02-15 12:04:10', '二月份地铁卡充值');
INSERT INTO `user_pay` VALUES ('4', '21', '91', '9', '400.00', '2019-02-04 12:10:19', '萱萱、悦悦压岁钱');
INSERT INTO `user_pay` VALUES ('5', '21', '91', '9', '500.00', '2019-02-09 12:11:26', '王意林压岁钱');
INSERT INTO `user_pay` VALUES ('6', '21', '91', '10', '1499.00', '2019-02-14 12:15:31', '王士成老爸手机');
INSERT INTO `user_pay` VALUES ('7', '19', '34', '2', '50.00', '2019-02-12 13:20:42', '公交卡充值');
INSERT INTO `user_pay` VALUES ('8', '21', '41', '2', '100.00', '2019-02-17 13:21:57', '好人小吃充值100');
INSERT INTO `user_pay` VALUES ('9', '19', '34', '2', '2.00', '2019-02-13 13:23:14', '上班公交');
INSERT INTO `user_pay` VALUES ('10', '21', '51', '2', '42.50', '2019-02-16 13:27:19', '萱萱、悦悦肯德基');
INSERT INTO `user_pay` VALUES ('11', '21', '18', '2', '102.24', '2019-02-01 13:32:00', '2月19日之前微信滴滴打车总计');
INSERT INTO `user_pay` VALUES ('12', '21', '55', '1', '293.48', '2019-02-04 13:49:49', '看电影');
INSERT INTO `user_pay` VALUES ('13', '21', '91', '2', '144.48', '2019-02-01 13:34:37', '2月19日之前微信红包总计');
INSERT INTO `user_pay` VALUES ('14', '21', '54', '2', '6.00', '2019-02-13 13:36:04', '三国手游充值');
INSERT INTO `user_pay` VALUES ('15', '21', '34', '2', '3.00', '2019-02-01 13:37:23', '2月19日之前微信公交总计');
INSERT INTO `user_pay` VALUES ('16', '21', '56', '1', '6.00', '2019-02-02 13:46:37', '优酷VIP');
INSERT INTO `user_pay` VALUES ('18', '21', '55', '9', '200.00', '2019-02-06 13:50:42', '红旗电影院开卡');
INSERT INTO `user_pay` VALUES ('19', '21', '57', '1', '196.00', '2019-02-07 13:51:58', '汗蒸');
INSERT INTO `user_pay` VALUES ('20', '21', '18', '1', '155.50', '2019-02-10 14:01:23', '昆山到上海城');
INSERT INTO `user_pay` VALUES ('21', '21', '58', '1', '119.00', '2019-02-06 14:03:12', '射阳');
INSERT INTO `user_pay` VALUES ('22', '21', '59', '1', '32.50', '2019-02-12 14:03:48', '老爸去南京');
INSERT INTO `user_pay` VALUES ('23', '21', '60', '1', '25.51', '2019-02-15 14:05:01', '2月15高德累计叫车');
INSERT INTO `user_pay` VALUES ('24', '21', '53', '1', '33.57', '2019-02-19 14:06:45', '2月19日之前支付宝话费充值总计');
INSERT INTO `user_pay` VALUES ('25', '21', '61', '1', '15.00', '2019-02-19 19:33:48', '小番茄 、猕猴桃');
INSERT INTO `user_pay` VALUES ('26', '21', '51', '2', '13.50', '2019-02-20 11:53:05', '鸡排');
INSERT INTO `user_pay` VALUES ('27', '21', '91', '2', '88.00', '2019-02-20 17:31:27', '胡军生日微信红包');
INSERT INTO `user_pay` VALUES ('35', '21', '34', '2', '20.00', '2019-02-21 07:48:10', '市民卡充值');
INSERT INTO `user_pay` VALUES ('36', '21', '62', '1', '8.80', '2019-02-21 13:31:06', '午饭');
INSERT INTO `user_pay` VALUES ('37', '19', '41', '1', '19.52', '2019-02-21 13:32:04', '中午饭 （未带饭）');
INSERT INTO `user_pay` VALUES ('38', '21', '53', '1', '19.98', '2019-02-22 23:12:41', '话费');
INSERT INTO `user_pay` VALUES ('39', '19', '53', '1', '98.60', '2019-02-22 23:14:27', '老妈充值');
INSERT INTO `user_pay` VALUES ('40', '19', '63', '2', '15.00', '2019-02-22 23:15:37', '奶茶');
INSERT INTO `user_pay` VALUES ('41', '21', '61', '1', '6.40', '2019-02-22 23:52:29', '');
INSERT INTO `user_pay` VALUES ('42', '21', '51', '1', '52.95', '2019-02-23 18:58:19', '逛街小吃');
INSERT INTO `user_pay` VALUES ('43', '21', '64', '1', '29.00', '2019-02-23 18:59:01', '去黑头');
INSERT INTO `user_pay` VALUES ('44', '21', '61', '1', '30.00', '2019-02-24 18:23:53', '橘子');
INSERT INTO `user_pay` VALUES ('45', '21', '43', '1', '22.50', '2019-02-24 21:51:34', '');
INSERT INTO `user_pay` VALUES ('46', '21', '53', '1', '20.00', '2019-02-24 21:58:52', '王士成话费');
INSERT INTO `user_pay` VALUES ('47', '21', '40', '2', '3.00', '2019-02-25 09:01:26', '早餐');
INSERT INTO `user_pay` VALUES ('48', '21', '65', '1', '6288.00', '2019-01-30 09:10:44', '王士成惠普电脑');
INSERT INTO `user_pay` VALUES ('49', '21', '41', '2', '9.30', '2019-02-25 13:01:38', '华东院出差午饭');
INSERT INTO `user_pay` VALUES ('50', '21', '66', '1', '3340.00', '2018-08-09 13:31:43', '8月份交一压一、中介费、维修费（1200每月）');
INSERT INTO `user_pay` VALUES ('51', '21', '66', '1', '1514.01', '2018-09-07 13:33:23', '9月份租房水电');
INSERT INTO `user_pay` VALUES ('52', '21', '66', '1', '1350.85', '2018-10-07 13:34:53', '10月份租房水电');
INSERT INTO `user_pay` VALUES ('53', '21', '66', '1', '1440.95', '2018-11-08 13:36:30', '11月份租房水电');
INSERT INTO `user_pay` VALUES ('54', '21', '66', '1', '1482.95', '2018-12-09 13:37:28', '12月份租房水电');
INSERT INTO `user_pay` VALUES ('55', '21', '66', '1', '1467.20', '2019-01-07 13:38:39', '1月份租房水电');
INSERT INTO `user_pay` VALUES ('56', '21', '66', '1', '15000.00', '2018-08-09 13:41:27', '18年7月份之前累计交付房租、押金、水电费及中介费约15000（房东没有退还押金及房租，房租一直交到9月中旬，8月份搬走，1400每月）');
INSERT INTO `user_pay` VALUES ('57', '21', '42', '2', '10.00', '2019-02-25 18:02:04', '拉面');
INSERT INTO `user_pay` VALUES ('58', '21', '40', '2', '5.00', '2019-02-26 09:22:22', '华东院早餐5元');
INSERT INTO `user_pay` VALUES ('59', '21', '45', '1', '28.60', '2019-02-25 22:23:08', '舒旭饿了么外卖');
INSERT INTO `user_pay` VALUES ('60', '21', '41', '2', '10.30', '2019-02-26 15:50:22', '华东院午餐');
INSERT INTO `user_pay` VALUES ('61', '21', '42', '1', '17.00', '2019-02-26 22:31:51', '华东院');
INSERT INTO `user_pay` VALUES ('62', '21', '67', '9', '50.00', '2019-02-26 22:33:29', 'blue cat');
INSERT INTO `user_pay` VALUES ('63', '21', '40', '2', '4.00', '2019-02-27 08:56:40', '华东院早餐');
INSERT INTO `user_pay` VALUES ('64', '19', '62', '2', '44.00', '2019-02-27 09:18:23', '请李怡小朋友带的15根鸡爪');
INSERT INTO `user_pay` VALUES ('65', '21', '41', '2', '7.30', '2019-02-27 13:19:11', '华东院午饭');
INSERT INTO `user_pay` VALUES ('66', '21', '53', '1', '10.00', '2019-02-27 13:46:19', '');
INSERT INTO `user_pay` VALUES ('68', '19', '62', '1', '104.10', '2019-02-27 14:15:23', '零食  104.11111111');
INSERT INTO `user_pay` VALUES ('69', '21', '40', '2', '4.00', '2019-02-28 10:09:33', '华东院早餐');
INSERT INTO `user_pay` VALUES ('70', '21', '62', '2', '5.50', '2019-02-28 10:10:29', '两瓶矿泉水');
INSERT INTO `user_pay` VALUES ('71', '19', '91', '2', '143.10', '2019-02-28 10:19:45', '胡子扬妈妈生日礼物');
INSERT INTO `user_pay` VALUES ('72', '21', '41', '2', '10.30', '2019-02-28 13:05:29', '华东院午餐');
INSERT INTO `user_pay` VALUES ('73', '21', '42', '1', '10.00', '2019-02-28 20:46:45', '兰州拉面（华东院）');
INSERT INTO `user_pay` VALUES ('74', '21', '40', '2', '5.00', '2019-03-01 09:10:35', '华东院早餐');
INSERT INTO `user_pay` VALUES ('75', '21', '41', '2', '6.30', '2019-03-01 14:00:37', '华东院午餐');
INSERT INTO `user_pay` VALUES ('76', '21', '62', '1', '6.00', '2019-03-01 14:01:37', '饮料');
INSERT INTO `user_pay` VALUES ('77', '21', '53', '1', '20.00', '2019-03-01 17:09:10', '王士成话费 28号');
INSERT INTO `user_pay` VALUES ('78', '19', '33', '9', '50.00', '2019-03-01 17:35:34', '王士成3月份地铁卡充值');
INSERT INTO `user_pay` VALUES ('79', '19', '70', '1', '56.10', '2019-03-02 17:39:11', '萱萱美术本、语数外练习册');
INSERT INTO `user_pay` VALUES ('80', '19', '51', '1', '11.88', '2019-03-02 17:39:43', '');
INSERT INTO `user_pay` VALUES ('81', '19', '57', '1', '79.80', '2019-03-03 17:40:52', '水立方');
INSERT INTO `user_pay` VALUES ('82', '19', '70', '1', '70.00', '2019-03-03 17:41:29', '麻将');
INSERT INTO `user_pay` VALUES ('83', '21', '43', '1', '6.48', '2019-03-03 22:16:31', '');
INSERT INTO `user_pay` VALUES ('84', '21', '71', '2', '6.50', '2019-03-03 22:18:54', '');
INSERT INTO `user_pay` VALUES ('85', '21', '40', '2', '7.00', '2019-03-04 12:04:11', '华东院早饭');
INSERT INTO `user_pay` VALUES ('86', '19', '64', '1', '75.00', '2019-03-04 17:18:52', '希芸面膜泥');
INSERT INTO `user_pay` VALUES ('87', '21', '53', '1', '20.00', '2019-03-04 17:30:48', '话费');
INSERT INTO `user_pay` VALUES ('88', '21', '42', '2', '9.00', '2019-03-04 17:31:26', '华东院');
INSERT INTO `user_pay` VALUES ('89', '21', '71', '1', '8.00', '2019-03-04 08:37:18', '');
INSERT INTO `user_pay` VALUES ('90', '21', '40', '2', '4.00', '2019-03-05 08:37:46', '');
INSERT INTO `user_pay` VALUES ('91', '21', '41', '2', '9.30', '2019-03-05 16:48:00', '');
INSERT INTO `user_pay` VALUES ('92', '21', '42', '2', '7.30', '2019-03-05 18:18:17', '华东院晚餐');
INSERT INTO `user_pay` VALUES ('93', '21', '71', '2', '6.92', '2019-03-05 18:19:31', '');
INSERT INTO `user_pay` VALUES ('94', '21', '40', '2', '4.50', '2019-03-06 08:47:33', '华东院早餐');
INSERT INTO `user_pay` VALUES ('95', '21', '41', '2', '3.00', '2019-03-06 17:59:38', '华东院苹果');
INSERT INTO `user_pay` VALUES ('96', '21', '42', '2', '17.00', '2019-03-06 18:00:48', '华东院');
INSERT INTO `user_pay` VALUES ('98', '21', '40', '2', '6.50', '2019-03-07 08:39:56', '华东院');
INSERT INTO `user_pay` VALUES ('99', '19', '63', '1', '18.00', '2019-03-07 09:11:19', '三月六号下午的下午茶');
INSERT INTO `user_pay` VALUES ('100', '19', '61', '1', '23.70', '2019-03-07 09:12:18', '三月六号晚上水果店买的 山竹和 小番茄');
INSERT INTO `user_pay` VALUES ('101', '21', '41', '2', '4.00', '2019-03-07 15:13:17', '华东院');
INSERT INTO `user_pay` VALUES ('102', '21', '42', '1', '15.00', '2019-03-07 17:15:04', '兰州拉面');
INSERT INTO `user_pay` VALUES ('103', '21', '71', '2', '3.50', '2019-03-07 18:30:58', '');
INSERT INTO `user_pay` VALUES ('104', '21', '62', '1', '12.50', '2019-03-07 23:05:04', '');
INSERT INTO `user_pay` VALUES ('105', '21', '67', '9', '20.00', '2019-03-07 23:05:38', '');
INSERT INTO `user_pay` VALUES ('106', '21', '40', '2', '5.00', '2019-03-08 10:59:08', '华东院');
INSERT INTO `user_pay` VALUES ('107', '21', '71', '1', '6.00', '2019-03-08 14:01:20', '');
INSERT INTO `user_pay` VALUES ('108', '19', '41', '1', '21.00', '2019-03-08 15:41:41', '周五未带饭');
INSERT INTO `user_pay` VALUES ('109', '21', '33', '9', '5.00', '2019-03-10 12:26:53', '家到桐泾公园（体检）');
INSERT INTO `user_pay` VALUES ('110', '21', '18', '2', '13.91', '2019-03-10 12:28:05', '桐泾公园到美年大健康（昨天周六新区体检）');
INSERT INTO `user_pay` VALUES ('111', '21', '18', '2', '9.00', '2019-03-10 12:28:31', '步行街到家');
INSERT INTO `user_pay` VALUES ('112', '21', '32', '1', '60.00', '2019-03-10 12:29:24', '新区美年大健康体检 —— 昆山');
INSERT INTO `user_pay` VALUES ('113', '21', '40', '1', '7.50', '2019-03-10 12:29:44', '王士成早饭');
INSERT INTO `user_pay` VALUES ('114', '21', '32', '1', '65.50', '2019-03-10 12:30:09', '昆山到家');
INSERT INTO `user_pay` VALUES ('115', '21', '70', '1', '22.00', '2019-03-10 12:30:52', '验孕棒');
INSERT INTO `user_pay` VALUES ('116', '21', '62', '1', '9.00', '2019-03-10 12:31:21', '关东煮');
INSERT INTO `user_pay` VALUES ('117', '21', '73', '1', '355.00', '2019-03-10 12:32:51', '两条裤子');
INSERT INTO `user_pay` VALUES ('118', '21', '90', '1', '27.10', '2019-03-10 12:33:15', '王士成口腔溃疡 （药）');
INSERT INTO `user_pay` VALUES ('119', '21', '18', '1', '9.79', '2019-03-10 12:33:49', '步行街到家（王士成支付宝）');
INSERT INTO `user_pay` VALUES ('120', '21', '62', '1', '7.00', '2019-03-11 17:07:01', '冰淇淋');
INSERT INTO `user_pay` VALUES ('121', '21', '34', '2', '50.00', '2019-03-11 19:08:37', '王士成');
INSERT INTO `user_pay` VALUES ('122', '21', '42', '1', '15.00', '2019-03-11 19:40:22', '兰州拉面');
INSERT INTO `user_pay` VALUES ('124', '19', '90', '1', '31.00', '2019-03-12 09:44:41', '口腔溃疡含片两盒');
INSERT INTO `user_pay` VALUES ('125', '21', '71', '1', '1.98', '2019-03-12 09:44:58', '昨天矿泉水');
INSERT INTO `user_pay` VALUES ('126', '19', '75', '1', '72.52', '2019-03-12 09:46:03', '一套内衣');
INSERT INTO `user_pay` VALUES ('127', '21', '18', '2', '8.00', '2019-03-12 09:47:11', '都市118到爱鑫宾馆');
INSERT INTO `user_pay` VALUES ('128', '21', '70', '1', '19.60', '2019-03-12 20:25:45', '沐浴露、拖鞋等');
INSERT INTO `user_pay` VALUES ('129', '19', '76', '1', '13.63', '2019-03-13 09:40:15', '子扬出差晾衣服神器');
INSERT INTO `user_pay` VALUES ('130', '21', '61', '2', '10.00', '2019-03-13 12:52:24', '梨');
INSERT INTO `user_pay` VALUES ('131', '21', '53', '1', '10.00', '2019-03-14 09:14:51', '');
INSERT INTO `user_pay` VALUES ('132', '19', '40', '2', '4.50', '2019-03-14 13:17:02', '王宝宝吃了两顿早饭');
INSERT INTO `user_pay` VALUES ('133', '21', '78', '1', '5.98', '2019-03-14 20:18:55', '三双袜子');
INSERT INTO `user_pay` VALUES ('134', '21', '71', '2', '2.00', '2019-03-14 20:34:54', '');
INSERT INTO `user_pay` VALUES ('135', '21', '67', '9', '11.00', '2019-03-15 09:51:05', '');
INSERT INTO `user_pay` VALUES ('136', '21', '59', '2', '82.00', '2019-03-15 18:04:11', '白洋淀-保定18.5，保定-北京西63.5');
INSERT INTO `user_pay` VALUES ('137', '21', '67', '9', '30.00', '2019-03-15 22:39:10', '');
INSERT INTO `user_pay` VALUES ('138', '19', '70', '1', '68.97', '2019-03-16 12:30:08', '私密处 护理液');
INSERT INTO `user_pay` VALUES ('139', '21', '33', '1', '20.00', '2019-03-16 12:37:59', '北京一日游');
INSERT INTO `user_pay` VALUES ('140', '21', '51', '1', '61.98', '2019-03-16 12:39:32', '小吃、麦当劳、饮料、串串等');
INSERT INTO `user_pay` VALUES ('141', '19', '33', '9', '50.00', '2019-03-16 19:18:46', '地铁充值月卡20次');
INSERT INTO `user_pay` VALUES ('142', '19', '70', '1', '19.90', '2019-03-16 19:20:29', '香薰');
INSERT INTO `user_pay` VALUES ('143', '19', '63', '1', '12.00', '2019-03-16 19:21:59', '谷c玉米汁');
INSERT INTO `user_pay` VALUES ('144', '19', '73', '1', '157.00', '2019-03-16 21:48:34', '牛仔裤 + 化妆扑 + 凉皮');
INSERT INTO `user_pay` VALUES ('146', '21', '71', '1', '12.00', '2019-03-16 21:51:42', '');
INSERT INTO `user_pay` VALUES ('147', '21', '51', '1', '19.00', '2019-03-16 21:52:12', '');
INSERT INTO `user_pay` VALUES ('148', '21', '62', '1', '11.47', '2019-03-16 21:53:28', '今天订单金额多笔支付合计');
INSERT INTO `user_pay` VALUES ('149', '21', '91', '9', '162.00', '2019-03-16 21:56:21', '宝宝北京之行礼物 ****');
INSERT INTO `user_pay` VALUES ('150', '21', '61', '2', '19.00', '2019-03-17 15:07:38', '梨子');
INSERT INTO `user_pay` VALUES ('151', '21', '59', '1', '14.50', '2019-03-17 21:08:19', '老爸火车票');
INSERT INTO `user_pay` VALUES ('152', '19', '41', '1', '49.00', '2019-03-18 11:29:06', '串串 加 奶茶 加 锅盔');
INSERT INTO `user_pay` VALUES ('153', '21', '71', '2', '2.94', '2019-03-18 22:04:44', '');
INSERT INTO `user_pay` VALUES ('154', '19', '75', '1', '150.60', '2019-03-19 09:35:10', '两套内衣');
INSERT INTO `user_pay` VALUES ('155', '21', '53', '1', '10.00', '2019-03-19 14:15:24', '');
INSERT INTO `user_pay` VALUES ('156', '21', '62', '1', '7.98', '2019-03-21 09:20:48', '');
INSERT INTO `user_pay` VALUES ('157', '21', '67', '1', '30.00', '2019-03-23 09:40:26', '');
INSERT INTO `user_pay` VALUES ('158', '21', '62', '1', '2.00', '2019-03-23 09:40:52', '');
INSERT INTO `user_pay` VALUES ('159', '21', '62', '2', '6.00', '2019-03-23 09:41:08', '');
INSERT INTO `user_pay` VALUES ('160', '21', '67', '9', '20.00', '2019-03-24 11:53:05', '');
INSERT INTO `user_pay` VALUES ('161', '21', '61', '1', '11.70', '2019-03-24 13:36:35', '梨子');
INSERT INTO `user_pay` VALUES ('162', '21', '53', '1', '30.00', '2019-03-26 11:08:05', '王士成');
INSERT INTO `user_pay` VALUES ('163', '21', '61', '1', '8.00', '2019-03-26 11:08:22', '梨子');
INSERT INTO `user_pay` VALUES ('164', '21', '83', '1', '51.30', '2019-03-26 11:10:56', '');
INSERT INTO `user_pay` VALUES ('165', '19', '42', '1', '25.00', '2019-03-26 11:33:55', '虾仁');
INSERT INTO `user_pay` VALUES ('166', '19', '32', '1', '41.20', '2019-03-26 11:34:31', '昆山往苏州 星期一早上');
INSERT INTO `user_pay` VALUES ('167', '19', '70', '2', '18.00', '2019-03-27 09:53:34', '蓝牙耳机');
INSERT INTO `user_pay` VALUES ('168', '21', '67', '9', '10.00', '2019-03-28 09:54:58', '');
INSERT INTO `user_pay` VALUES ('169', '21', '42', '1', '143.00', '2019-03-28 18:00:59', '曹疯子火锅（小王欠71）');
INSERT INTO `user_pay` VALUES ('170', '21', '71', '1', '7.00', '2019-03-29 10:39:28', '矿泉水 和饮料');
INSERT INTO `user_pay` VALUES ('171', '21', '41', '1', '36.00', '2019-03-29 13:04:48', '汉堡 加 鸡翅 列车上的午饭');
INSERT INTO `user_pay` VALUES ('172', '21', '34', '1', '50.00', '2019-03-30 10:50:05', '');
INSERT INTO `user_pay` VALUES ('173', '21', '51', '1', '18.00', '2019-03-30 11:25:13', '凉面 擀面皮');
INSERT INTO `user_pay` VALUES ('174', '21', '51', '1', '23.00', '2019-03-30 11:42:18', '奶茶');
INSERT INTO `user_pay` VALUES ('175', '21', '84', '2', '22.50', '2019-03-30 12:28:30', '宝宝 发卡');
INSERT INTO `user_pay` VALUES ('176', '21', '71', '2', '10.30', '2019-03-30 14:32:21', '');
INSERT INTO `user_pay` VALUES ('177', '21', '51', '1', '83.00', '2019-03-31 11:48:07', '烤肉');
INSERT INTO `user_pay` VALUES ('178', '21', '90', '1', '58.00', '2019-03-31 11:48:36', '药');
INSERT INTO `user_pay` VALUES ('179', '21', '41', '1', '140.98', '2019-03-31 15:43:51', '烤鱼');
INSERT INTO `user_pay` VALUES ('180', '21', '70', '1', '8.90', '2019-03-31 15:45:35', '茶杯');
INSERT INTO `user_pay` VALUES ('181', '21', '85', '1', '99.00', '2019-03-31 15:47:47', '多走路鞋');
INSERT INTO `user_pay` VALUES ('182', '21', '86', '1', '78.00', '2019-03-31 15:52:33', '');
INSERT INTO `user_pay` VALUES ('183', '21', '85', '1', '378.00', '2019-03-31 15:55:38', '王宝宝 板鞋 高跟鞋');
INSERT INTO `user_pay` VALUES ('184', '19', '40', '2', '4.50', '2019-04-01 10:15:22', '早饭 手抓饼');
INSERT INTO `user_pay` VALUES ('185', '19', '33', '9', '50.00', '2019-04-01 10:16:02', '地铁月卡 20次');
INSERT INTO `user_pay` VALUES ('186', '19', '63', '2', '16.00', '2019-04-01 10:25:04', '上个周五 的奶茶钱');
INSERT INTO `user_pay` VALUES ('188', '19', '41', '1', '15.00', '2019-04-01 13:09:17', '子扬的兰州拉面 牛肉炒面');
INSERT INTO `user_pay` VALUES ('189', '19', '42', '1', '9.98', '2019-04-01 17:25:38', '鸡蛋拉面');
INSERT INTO `user_pay` VALUES ('190', '19', '41', '1', '11.98', '2019-04-02 13:04:12', '胡子扬 葱油拌面');
INSERT INTO `user_pay` VALUES ('191', '19', '40', '1', '5.00', '2019-04-02 13:04:28', '胡子扬 早饭');
INSERT INTO `user_pay` VALUES ('192', '21', '42', '2', '12.30', '2019-04-02 18:04:56', '');
INSERT INTO `user_pay` VALUES ('193', '19', '70', '1', '6.28', '2019-04-09 12:39:11', '数据线保护套');
INSERT INTO `user_pay` VALUES ('194', '21', '41', '2', '20.60', '2019-04-09 12:39:12', '2号至9号 微信付款伙食');
INSERT INTO `user_pay` VALUES ('195', '21', '41', '1', '13.00', '2019-04-09 12:49:32', '3号');
INSERT INTO `user_pay` VALUES ('196', '21', '71', '1', '4.00', '2019-04-09 12:49:59', '3号消费');
INSERT INTO `user_pay` VALUES ('197', '21', '53', '1', '10.00', '2019-04-09 12:51:05', '4号消费');
INSERT INTO `user_pay` VALUES ('198', '21', '62', '1', '11.48', '2019-04-09 12:51:49', '4号消费');
INSERT INTO `user_pay` VALUES ('199', '21', '51', '1', '105.50', '2019-04-09 12:53:59', '5号消费');
INSERT INTO `user_pay` VALUES ('200', '21', '70', '1', '484.92', '2019-04-09 12:55:20', '6号消费  烧烤');
INSERT INTO `user_pay` VALUES ('201', '21', '70', '1', '570.00', '2019-04-09 12:56:08', '7号消费  王宝宝眼镜');
INSERT INTO `user_pay` VALUES ('202', '21', '41', '1', '16.00', '2019-04-09 12:56:48', '8号消费 ');
INSERT INTO `user_pay` VALUES ('203', '21', '45', '1', '3.00', '2019-04-09 12:57:16', '8号消费  雪糕');
INSERT INTO `user_pay` VALUES ('204', '21', '41', '1', '10.00', '2019-04-09 12:58:19', '');
INSERT INTO `user_pay` VALUES ('205', '21', '71', '1', '3.50', '2019-04-09 12:58:38', '');
INSERT INTO `user_pay` VALUES ('206', '21', '71', '1', '6.98', '2019-04-09 12:59:31', '自助售货机还没有退款');
INSERT INTO `user_pay` VALUES ('207', '21', '33', '5', '10.04', '2019-04-09 13:01:06', '4，5号 地铁出行。苏易行');
INSERT INTO `user_pay` VALUES ('208', '19', '40', '2', '4.50', '2019-04-09 13:05:16', '手抓饼');
INSERT INTO `user_pay` VALUES ('209', '19', '86', '1', '45.90', '2019-04-09 13:06:07', '小猪刺绣短袖T恤');
INSERT INTO `user_pay` VALUES ('210', '19', '87', '1', '147.25', '2019-04-09 13:07:37', '针织外套');
INSERT INTO `user_pay` VALUES ('211', '19', '90', '1', '236.80', '2019-04-09 13:08:50', '过敏药加维生素');
INSERT INTO `user_pay` VALUES ('212', '19', '63', '2', '20.50', '2019-04-09 13:18:16', '奶茶加手抓饼');
INSERT INTO `user_pay` VALUES ('213', '21', '42', '2', '17.00', '2019-04-09 18:21:16', '华东院晚餐');
INSERT INTO `user_pay` VALUES ('214', '21', '53', '1', '19.66', '2019-04-10 08:18:24', '');
INSERT INTO `user_pay` VALUES ('216', '21', '40', '2', '5.00', '2019-04-10 08:25:45', '华东院');
INSERT INTO `user_pay` VALUES ('217', '21', '41', '1', '10.00', '2019-04-10 13:45:18', '');
INSERT INTO `user_pay` VALUES ('218', '19', '40', '2', '4.50', '2019-04-10 17:35:27', '手抓饼');
INSERT INTO `user_pay` VALUES ('219', '21', '42', '2', '7.00', '2019-04-10 17:55:12', '');
INSERT INTO `user_pay` VALUES ('220', '21', '42', '1', '13.98', '2019-04-11 16:02:20', '');
INSERT INTO `user_pay` VALUES ('221', '21', '42', '2', '8.00', '2019-04-12 09:35:58', '昨晚');
INSERT INTO `user_pay` VALUES ('222', '21', '40', '2', '5.00', '2019-04-12 09:36:06', '');
INSERT INTO `user_pay` VALUES ('223', '21', '41', '1', '15.00', '2019-04-12 14:29:28', '');
INSERT INTO `user_pay` VALUES ('224', '21', '71', '1', '7.00', '2019-04-12 14:30:40', '');
INSERT INTO `user_pay` VALUES ('225', '21', '33', '9', '50.00', '2019-04-15 10:17:26', '4月份地铁卡充值');
INSERT INTO `user_pay` VALUES ('226', '21', '34', '2', '2.00', '2019-04-15 10:18:36', '');
INSERT INTO `user_pay` VALUES ('227', '19', '70', '9', '100.00', '2019-04-15 11:24:34', '回家两天开销 和周一顺风车');
INSERT INTO `user_pay` VALUES ('228', '19', '41', '1', '17.00', '2019-04-15 11:41:16', '中午外卖 ');
INSERT INTO `user_pay` VALUES ('229', '21', '34', '2', '2.00', '2019-04-16 09:04:57', '昨晚公交');
INSERT INTO `user_pay` VALUES ('230', '19', '33', '9', '50.00', '2019-04-16 14:45:27', '地铁月卡');
INSERT INTO `user_pay` VALUES ('231', '19', '63', '1', '37.00', '2019-04-16 14:46:39', '周五晚上的奶茶');
INSERT INTO `user_pay` VALUES ('232', '19', '42', '2', '198.00', '2019-04-16 16:12:50', '双人自助餐 （君豪酒店）');
INSERT INTO `user_pay` VALUES ('233', '19', '61', '1', '109.50', '2019-04-16 16:13:47', '水果');
INSERT INTO `user_pay` VALUES ('234', '21', '62', '1', '6.00', '2019-04-17 15:26:31', '雪糕');
INSERT INTO `user_pay` VALUES ('235', '21', '53', '1', '19.98', '2019-04-18 09:26:02', '');
INSERT INTO `user_pay` VALUES ('236', '19', '63', '2', '21.00', '2019-04-18 16:06:09', '奶茶');
INSERT INTO `user_pay` VALUES ('237', '19', '34', '1', '3.00', '2019-04-18 16:06:33', '公交');
INSERT INTO `user_pay` VALUES ('238', '21', '62', '1', '8.70', '2019-04-18 16:32:29', '雪糕');
INSERT INTO `user_pay` VALUES ('239', '21', '70', '1', '22.00', '2019-04-18 19:55:44', '老爸 苏烟');
INSERT INTO `user_pay` VALUES ('240', '21', '89', '1', '18.31', '2019-04-18 19:57:36', '王士');
INSERT INTO `user_pay` VALUES ('241', '21', '53', '1', '20.00', '2019-04-18 20:45:53', '王士成');
INSERT INTO `user_pay` VALUES ('242', '21', '63', '2', '28.00', '2019-04-19 14:43:30', '');
INSERT INTO `user_pay` VALUES ('243', '21', '41', '1', '11.00', '2019-04-19 14:43:40', '');
INSERT INTO `user_pay` VALUES ('244', '19', '41', '1', '17.10', '2019-04-19 16:09:09', '');
INSERT INTO `user_pay` VALUES ('245', '19', '34', '1', '2.00', '2019-04-19 16:09:35', '早晚公交');
INSERT INTO `user_pay` VALUES ('246', '21', '90', '1', '11.40', '2019-04-20 10:37:03', '');
INSERT INTO `user_pay` VALUES ('247', '21', '90', '3', '8.53', '2019-04-20 10:37:45', '王士成');
INSERT INTO `user_pay` VALUES ('248', '21', '51', '1', '35.00', '2019-04-20 11:30:36', '');
INSERT INTO `user_pay` VALUES ('249', '21', '63', '1', '16.00', '2019-04-20 12:06:39', '');
INSERT INTO `user_pay` VALUES ('250', '21', '90', '1', '18.00', '2019-04-20 16:46:08', '王士成');
INSERT INTO `user_pay` VALUES ('251', '21', '51', '1', '49.00', '2019-04-20 16:47:18', '');
INSERT INTO `user_pay` VALUES ('252', '21', '51', '1', '28.00', '2019-04-21 16:18:08', '');
INSERT INTO `user_pay` VALUES ('253', '21', '63', '1', '19.00', '2019-04-21 16:18:31', '');
INSERT INTO `user_pay` VALUES ('254', '21', '42', '1', '72.34', '2019-04-21 16:19:05', '');
INSERT INTO `user_pay` VALUES ('255', '21', '43', '1', '37.50', '2019-04-21 21:51:06', '牛奶啤酒');
INSERT INTO `user_pay` VALUES ('256', '19', '73', '1', '57.63', '2019-04-22 17:21:24', '牛仔短裙');
INSERT INTO `user_pay` VALUES ('257', '19', '34', '1', '2.00', '2019-04-22 17:22:41', '上下班公交');
INSERT INTO `user_pay` VALUES ('258', '21', '53', '1', '20.00', '2019-04-23 22:22:09', '王士成');
INSERT INTO `user_pay` VALUES ('259', '19', '40', '2', '9.00', '2019-04-24 09:11:56', '今天和昨天的手抓饼钱');
INSERT INTO `user_pay` VALUES ('260', '19', '34', '1', '2.00', '2019-04-24 09:12:19', '上下班公交');
INSERT INTO `user_pay` VALUES ('261', '21', '33', '5', '6.00', '2019-04-25 09:16:05', '上班');
INSERT INTO `user_pay` VALUES ('262', '19', '40', '2', '4.50', '2019-04-25 09:27:31', '手抓饼');
INSERT INTO `user_pay` VALUES ('263', '19', '34', '1', '2.00', '2019-04-25 09:27:48', '上下班公交');
INSERT INTO `user_pay` VALUES ('264', '21', '53', '1', '9.98', '2019-04-25 10:39:38', '');
INSERT INTO `user_pay` VALUES ('265', '19', '41', '1', '26.89', '2019-04-25 13:10:45', '胡子扬和我的午饭');
INSERT INTO `user_pay` VALUES ('266', '21', '61', '1', '23.98', '2019-04-25 22:07:23', '苹果');
INSERT INTO `user_pay` VALUES ('268', '19', '34', '1', '50.00', '2019-04-26 11:20:43', '公交卡充值');
INSERT INTO `user_pay` VALUES ('269', '19', '86', '1', '40.71', '2019-04-26 11:21:58', '短袖T恤');
INSERT INTO `user_pay` VALUES ('270', '21', '41', '2', '14.00', '2019-04-26 11:24:12', '黄焖鸡');
INSERT INTO `user_pay` VALUES ('271', '19', '41', '1', '17.00', '2019-04-26 11:33:13', '鸡腿饭');
INSERT INTO `user_pay` VALUES ('272', '21', '18', '2', '27.62', '2019-04-26 13:08:36', '重置公积金密码');
INSERT INTO `user_pay` VALUES ('273', '21', '63', '2', '11.00', '2019-04-26 16:28:40', '一点点');
INSERT INTO `user_pay` VALUES ('274', '21', '53', '1', '20.00', '2019-04-26 22:09:15', '');
INSERT INTO `user_pay` VALUES ('275', '21', '62', '1', '28.00', '2019-04-26 23:32:15', '服务区  小零食');
INSERT INTO `user_pay` VALUES ('276', '21', '66', '1', '144.00', '2019-04-27 02:27:06', '格林豪泰');
INSERT INTO `user_pay` VALUES ('277', '19', '53', '1', '20.00', '2019-04-28 09:30:14', '');
INSERT INTO `user_pay` VALUES ('278', '19', '62', '1', '255.30', '2019-04-28 09:32:08', '三只松鼠零食');
INSERT INTO `user_pay` VALUES ('279', '19', '41', '1', '20.50', '2019-04-29 11:52:48', '面加肉夹馍');
INSERT INTO `user_pay` VALUES ('280', '21', '92', '1', '155.00', '2019-04-29 12:00:25', '过路费');
INSERT INTO `user_pay` VALUES ('281', '21', '43', '1', '56.40', '2019-04-29 12:01:12', '牛奶  避孕套');
INSERT INTO `user_pay` VALUES ('282', '21', '33', '5', '6.00', '2019-04-30 09:17:52', '');
INSERT INTO `user_pay` VALUES ('283', '21', '32', '1', '27.60', '2019-04-30 09:18:23', '');
INSERT INTO `user_pay` VALUES ('284', '19', '41', '1', '34.50', '2019-04-30 11:31:26', '两份鸡腿饭');
INSERT INTO `user_pay` VALUES ('285', '19', '53', '1', '49.76', '2019-05-01 07:10:12', '王士成老爸');
INSERT INTO `user_pay` VALUES ('286', '21', '66', '1', '180.00', '2019-05-01 20:49:36', '汉庭');
INSERT INTO `user_pay` VALUES ('287', '21', '51', '1', '39.98', '2019-05-01 20:52:15', '花甲');
INSERT INTO `user_pay` VALUES ('288', '21', '63', '1', '13.00', '2019-05-02 13:07:13', '');
INSERT INTO `user_pay` VALUES ('289', '21', '34', '9', '2.00', '2019-05-02 13:07:28', '');
INSERT INTO `user_pay` VALUES ('290', '21', '51', '1', '11.00', '2019-05-03 19:37:28', '串串');
INSERT INTO `user_pay` VALUES ('291', '21', '63', '1', '44.00', '2019-05-03 19:38:19', '一点点 水果茶');
INSERT INTO `user_pay` VALUES ('292', '21', '70', '1', '4.00', '2019-05-03 19:38:44', '纸');
INSERT INTO `user_pay` VALUES ('293', '21', '42', '1', '414.00', '2019-05-03 19:39:19', '黄山');
INSERT INTO `user_pay` VALUES ('294', '21', '66', '1', '16.00', '2019-05-03 19:39:56', ' 266-250 退250元');
INSERT INTO `user_pay` VALUES ('295', '21', '73', '1', '129.00', '2019-05-03 19:41:08', '');
INSERT INTO `user_pay` VALUES ('296', '21', '70', '1', '19.90', '2019-05-03 19:41:34', '印泥');
INSERT INTO `user_pay` VALUES ('297', '21', '71', '1', '116.00', '2019-05-03 19:42:45', '酒');
INSERT INTO `user_pay` VALUES ('298', '21', '70', '1', '30.00', '2019-05-03 19:47:31', '自拍杆');
INSERT INTO `user_pay` VALUES ('299', '21', '93', '1', '760.00', '2019-05-03 19:49:06', '黄山门票');
INSERT INTO `user_pay` VALUES ('300', '21', '93', '1', '95.00', '2019-05-03 19:49:30', '黄山门票 王艺霖');
INSERT INTO `user_pay` VALUES ('301', '21', '51', '1', '12.00', '2019-05-03 19:49:51', '正新鸡排');
INSERT INTO `user_pay` VALUES ('302', '21', '51', '9', '10.00', '2019-05-03 19:50:08', '烤串');
INSERT INTO `user_pay` VALUES ('303', '19', '71', '1', '14.00', '2019-05-05 09:27:04', '两瓶水溶C100');
INSERT INTO `user_pay` VALUES ('304', '21', '51', '1', '20.00', '2019-05-05 10:47:51', '服务区 关东煮');
INSERT INTO `user_pay` VALUES ('305', '21', '71', '1', '26.00', '2019-05-05 10:48:12', '');
INSERT INTO `user_pay` VALUES ('306', '19', '34', '1', '10.00', '2019-05-05 14:22:01', '公交卡充值');
INSERT INTO `user_pay` VALUES ('307', '19', '33', '9', '75.00', '2019-05-05 14:22:50', '地铁卡充值');
INSERT INTO `user_pay` VALUES ('309', '19', '33', '9', '75.00', '2019-05-05 14:27:55', '地铁卡充值');
INSERT INTO `user_pay` VALUES ('310', '21', '34', '1', '10.00', '2019-05-05 19:18:32', '');
INSERT INTO `user_pay` VALUES ('311', '21', '70', '1', '26.49', '2019-05-05 19:19:37', '手机壳');
INSERT INTO `user_pay` VALUES ('312', '21', '62', '2', '6.00', '2019-05-06 15:48:12', '烤肠');
INSERT INTO `user_pay` VALUES ('313', '21', '53', '1', '20.00', '2019-05-07 10:08:46', '');
INSERT INTO `user_pay` VALUES ('314', '21', '51', '1', '3.50', '2019-05-12 12:03:06', '');
INSERT INTO `user_pay` VALUES ('315', '21', '34', '1', '10.00', '2019-05-12 12:03:24', '');
INSERT INTO `user_pay` VALUES ('316', '21', '53', '1', '49.90', '2019-05-12 12:03:40', '');
INSERT INTO `user_pay` VALUES ('317', '21', '51', '1', '56.75', '2019-05-12 12:04:02', '');
INSERT INTO `user_pay` VALUES ('318', '21', '18', '2', '73.47', '2019-05-12 12:06:28', '');
INSERT INTO `user_pay` VALUES ('319', '19', '51', '2', '10.00', '2019-05-12 12:07:40', '8号');
INSERT INTO `user_pay` VALUES ('320', '19', '70', '1', '23.00', '2019-05-12 12:08:38', '8号 手机膜');
INSERT INTO `user_pay` VALUES ('322', '19', '34', '1', '20.00', '2019-05-12 12:09:36', '10号');
INSERT INTO `user_pay` VALUES ('323', '19', '41', '1', '18.50', '2019-05-12 12:09:55', '10号');
INSERT INTO `user_pay` VALUES ('324', '19', '42', '9', '160.00', '2019-05-13 11:18:52', '11号 王士成老爸');
INSERT INTO `user_pay` VALUES ('325', '21', '40', '2', '5.00', '2019-05-13 11:20:59', '');
INSERT INTO `user_pay` VALUES ('326', '21', '42', '1', '187.78', '2019-05-16 08:50:31', '13号至今 支付宝');
INSERT INTO `user_pay` VALUES ('328', '19', '70', '6', '260.00', '2019-05-16 09:18:38', '2克藏红花');
INSERT INTO `user_pay` VALUES ('329', '19', '34', '1', '10.00', '2019-05-16 09:19:27', '公交卡充值');
INSERT INTO `user_pay` VALUES ('330', '21', '40', '2', '43.30', '2019-05-16 17:48:14', '13号至今');
INSERT INTO `user_pay` VALUES ('331', '21', '41', '1', '11.98', '2019-05-16 17:49:44', '');
INSERT INTO `user_pay` VALUES ('332', '21', '53', '1', '27.64', '2019-05-17 08:39:28', '王士成');
INSERT INTO `user_pay` VALUES ('333', '21', '40', '2', '5.00', '2019-05-17 08:40:01', '');
INSERT INTO `user_pay` VALUES ('334', '21', '41', '1', '11.98', '2019-05-17 22:57:21', '');
INSERT INTO `user_pay` VALUES ('335', '21', '62', '1', '35.00', '2019-05-17 22:57:45', '雪糕');
INSERT INTO `user_pay` VALUES ('336', '21', '70', '9', '8.00', '2019-05-18 15:13:33', '体检');
INSERT INTO `user_pay` VALUES ('337', '21', '70', '1', '400.00', '2019-05-18 15:13:54', '眼镜');
INSERT INTO `user_pay` VALUES ('338', '21', '70', '2', '2000.00', '2019-05-18 15:14:07', '驾照');
INSERT INTO `user_pay` VALUES ('339', '21', '42', '2', '285.00', '2019-05-20 08:55:34', '辣三多');
INSERT INTO `user_pay` VALUES ('340', '21', '40', '2', '5.00', '2019-05-20 08:55:42', '');
INSERT INTO `user_pay` VALUES ('341', '21', '70', '1', '20.40', '2019-05-20 08:57:29', '牙刷');
INSERT INTO `user_pay` VALUES ('342', '21', '71', '1', '6.50', '2019-05-20 08:57:49', '');
INSERT INTO `user_pay` VALUES ('343', '21', '42', '1', '2.00', '2019-05-20 08:58:14', '辣三多');
INSERT INTO `user_pay` VALUES ('344', '21', '70', '9', '12.00', '2019-05-20 08:58:39', '停车费');
INSERT INTO `user_pay` VALUES ('345', '21', '41', '1', '10.00', '2019-05-20 13:37:47', '');
INSERT INTO `user_pay` VALUES ('346', '19', '32', '1', '65.60', '2019-05-20 19:30:25', '去昆山');
INSERT INTO `user_pay` VALUES ('347', '19', '32', '1', '65.60', '2019-05-20 19:31:15', '去昆山');
INSERT INTO `user_pay` VALUES ('349', '19', '70', '1', '18.80', '2019-05-20 19:32:21', '洗漱包');
INSERT INTO `user_pay` VALUES ('350', '19', '70', '1', '15.80', '2019-05-20 19:32:43', '洗漱包');
INSERT INTO `user_pay` VALUES ('351', '19', '34', '1', '10.00', '2019-05-20 19:33:53', '市民卡充值');
INSERT INTO `user_pay` VALUES ('352', '21', '42', '1', '12.30', '2019-05-20 19:35:52', '');
INSERT INTO `user_pay` VALUES ('353', '21', '40', '2', '5.00', '2019-05-21 08:40:17', '');
INSERT INTO `user_pay` VALUES ('354', '21', '41', '1', '10.00', '2019-05-21 16:13:02', '');
INSERT INTO `user_pay` VALUES ('355', '21', '71', '1', '5.98', '2019-05-21 16:13:13', '');
INSERT INTO `user_pay` VALUES ('356', '19', '78', '6', '59.00', '2019-05-21 16:19:05', '男女袜子');
INSERT INTO `user_pay` VALUES ('357', '19', '70', '6', '77.40', '2019-05-21 16:19:23', '压缩袋');
INSERT INTO `user_pay` VALUES ('358', '21', '42', '2', '10.30', '2019-05-22 10:14:16', '');
INSERT INTO `user_pay` VALUES ('359', '21', '40', '2', '5.00', '2019-05-22 10:14:22', '');
INSERT INTO `user_pay` VALUES ('360', '21', '71', '2', '3.00', '2019-05-22 10:14:57', '');
INSERT INTO `user_pay` VALUES ('361', '19', '34', '1', '10.00', '2019-05-22 10:16:48', '公交卡充值');
INSERT INTO `user_pay` VALUES ('362', '21', '42', '2', '12.80', '2019-05-23 15:12:18', '');
INSERT INTO `user_pay` VALUES ('363', '21', '40', '2', '5.00', '2019-05-23 15:12:25', '');
INSERT INTO `user_pay` VALUES ('364', '21', '62', '2', '3.00', '2019-05-23 15:12:33', '');
INSERT INTO `user_pay` VALUES ('365', '21', '41', '1', '10.00', '2019-05-23 15:14:16', '');
INSERT INTO `user_pay` VALUES ('366', '21', '62', '1', '16.00', '2019-05-23 15:14:35', '');
INSERT INTO `user_pay` VALUES ('367', '21', '62', '1', '3.00', '2019-05-23 15:14:53', '');
INSERT INTO `user_pay` VALUES ('368', '21', '41', '1', '12.00', '2019-05-23 15:15:02', '');
INSERT INTO `user_pay` VALUES ('369', '19', '34', '1', '20.00', '2019-05-27 09:48:28', '两人公交卡充值');
INSERT INTO `user_pay` VALUES ('370', '19', '62', '1', '270.10', '2019-05-27 09:51:35', '喜多多椰果王＋三只松鼠');
INSERT INTO `user_pay` VALUES ('372', '21', '62', '1', '8.50', '2019-05-27 10:24:43', '');
INSERT INTO `user_pay` VALUES ('373', '21', '41', '1', '15.00', '2019-05-27 10:25:04', '');
INSERT INTO `user_pay` VALUES ('374', '21', '71', '1', '4.00', '2019-05-27 10:25:15', '');
INSERT INTO `user_pay` VALUES ('375', '21', '71', '1', '5.00', '2019-05-27 10:26:34', '');
INSERT INTO `user_pay` VALUES ('376', '21', '53', '1', '19.98', '2019-05-27 10:26:48', '');
INSERT INTO `user_pay` VALUES ('377', '21', '43', '1', '34.60', '2019-05-27 10:27:45', '牛奶 方便面');
INSERT INTO `user_pay` VALUES ('378', '21', '32', '1', '46.20', '2019-05-27 10:28:16', '');
INSERT INTO `user_pay` VALUES ('379', '21', '71', '1', '29.80', '2019-05-27 10:28:41', '');
INSERT INTO `user_pay` VALUES ('380', '21', '32', '1', '46.50', '2019-05-27 10:28:55', '');
INSERT INTO `user_pay` VALUES ('381', '21', '71', '1', '15.00', '2019-05-27 10:29:11', '');
INSERT INTO `user_pay` VALUES ('382', '21', '71', '1', '8.38', '2019-05-27 10:29:35', '');
INSERT INTO `user_pay` VALUES ('383', '21', '63', '1', '15.00', '2019-05-27 10:29:45', '一点点');
INSERT INTO `user_pay` VALUES ('384', '21', '51', '1', '25.00', '2019-05-27 10:30:06', '');
INSERT INTO `user_pay` VALUES ('385', '21', '70', '1', '44.80', '2019-05-27 10:30:22', '蚊香液');
INSERT INTO `user_pay` VALUES ('386', '21', '42', '2', '20.00', '2019-05-27 10:33:10', '23号晚餐');
INSERT INTO `user_pay` VALUES ('387', '21', '40', '2', '5.00', '2019-05-27 10:34:26', '24号');
INSERT INTO `user_pay` VALUES ('388', '21', '42', '2', '270.00', '2019-05-27 10:34:48', '25号 聚餐');

-- ----------------------------
-- Table structure for user_spbz
-- ----------------------------
DROP TABLE IF EXISTS `user_spbz`;
CREATE TABLE `user_spbz` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USERID` int(10) DEFAULT NULL,
  `RELATEID` int(10) DEFAULT NULL,
  `CZLX` int(10) DEFAULT NULL,
  `CZTIME` datetime DEFAULT NULL,
  `XBBJ` int(1) DEFAULT NULL,
  `TASKNAME` varchar(50) DEFAULT NULL,
  `TASKDESC` varchar(255) DEFAULT NULL,
  `RELATETABLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_spbz
-- ----------------------------
INSERT INTO `user_spbz` VALUES ('1', '18', '6', '181', '2019-03-14 15:28:30', '0', '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('2', '18', '6', '180', '2019-03-14 15:32:08', '0', '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('3', '21', '6', '180', '2019-03-14 15:35:59', '0', '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('4', '21', '6', '180', '2019-03-14 15:39:24', '0', '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('5', '19', '6', '180', '2019-03-14 15:40:06', '0', '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('6', '18', '6', '180', '2019-03-14 15:40:37', '0', '家庭成员申请', '用户名：admin，全名：', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('7', '21', '6', '180', '2019-03-14 15:52:31', '0', '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('8', '19', '6', '180', '2019-03-14 15:58:26', '0', '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('9', '21', '6', '181', '2019-03-14 16:00:04', '0', '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('10', '21', '6', '181', '2019-03-14 16:01:47', '0', '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('11', '21', '6', '180', '2019-03-14 16:03:23', '0', '家庭成员申请', '用户名：wsc，全名：王士成', 'USER_HOME_REL');
INSERT INTO `user_spbz` VALUES ('12', '18', '6', '180', '2019-03-14 16:20:30', '0', '家庭成员申请', '用户名：hzy，全名：胡子扬', 'USER_HOME_REL');
