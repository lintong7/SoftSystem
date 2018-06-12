/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : soft

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/05/2018 20:15:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志信息',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（登录、注册、修改、删除等）',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '管理员ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-11 18:51:05');
INSERT INTO `log` VALUES (2, '登录失败', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-11 20:54:04');
INSERT INTO `log` VALUES (29, '登录失败', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-11 23:57:44');
INSERT INTO `log` VALUES (28, '登录失败', '登录', '0:0:0:0:0:0:0:1', 4, '2018-05-11 23:57:15');
INSERT INTO `log` VALUES (27, '登录失败', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-11 23:57:09');
INSERT INTO `log` VALUES (20, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-11 22:38:36');
INSERT INTO `log` VALUES (19, '登录成功', '登录', '0:0:0:0:0:0:0:1', 4, '2018-05-11 22:29:04');
INSERT INTO `log` VALUES (26, '登录失败', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-11 23:57:06');
INSERT INTO `log` VALUES (25, '登录失败', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-11 23:56:48');
INSERT INTO `log` VALUES (24, '登录失败', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-11 23:56:37');
INSERT INTO `log` VALUES (32, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 13:38:55');
INSERT INTO `log` VALUES (33, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 14:36:23');
INSERT INTO `log` VALUES (34, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 16:17:11');
INSERT INTO `log` VALUES (35, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:11:04');
INSERT INTO `log` VALUES (36, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:12:45');
INSERT INTO `log` VALUES (37, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:17:30');
INSERT INTO `log` VALUES (38, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:34:44');
INSERT INTO `log` VALUES (39, '登录失败', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:38:46');
INSERT INTO `log` VALUES (40, '登录成功', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-13 17:43:57');
INSERT INTO `log` VALUES (41, '登录失败', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-13 17:44:14');
INSERT INTO `log` VALUES (42, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 17:50:43');
INSERT INTO `log` VALUES (43, '登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 18:51:19');
INSERT INTO `log` VALUES (63, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-15 12:50:27');
INSERT INTO `log` VALUES (45, '账号已被冻结', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 22:54:58');
INSERT INTO `log` VALUES (46, '账号已被冻结', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 22:55:03');
INSERT INTO `log` VALUES (47, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-13 22:55:36');
INSERT INTO `log` VALUES (48, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-14 14:54:07');
INSERT INTO `log` VALUES (49, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-14 17:07:37');
INSERT INTO `log` VALUES (50, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-14 17:09:37');
INSERT INTO `log` VALUES (51, '账号已被冻结', '登录', '0:0:0:0:0:0:0:1', 2, '2018-05-14 17:50:13');
INSERT INTO `log` VALUES (52, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-14 19:23:30');
INSERT INTO `log` VALUES (62, 'mazouri的【状态】被修改为：【激活】', '修改', '0:0:0:0:0:0:0:1', 1, '2018-05-14 20:57:30');
INSERT INTO `log` VALUES (61, 'mazouri的【状态】被修改为：【冻结】', '修改', '0:0:0:0:0:0:0:1', 1, '2018-05-14 20:57:20');
INSERT INTO `log` VALUES (60, 'mazouri的【状态】被修改为：【激活】', '修改', '0:0:0:0:0:0:0:1', 1, '2018-05-14 20:56:39');
INSERT INTO `log` VALUES (59, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-14 20:56:28');
INSERT INTO `log` VALUES (64, 'admin登录成功', '登录', '0:0:0:0:0:0:0:1', 1, '2018-05-15 15:22:04');

-- ----------------------------
-- Table structure for soft
-- ----------------------------
DROP TABLE IF EXISTS `soft`;
CREATE TABLE `soft`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件名称',
  `cid` smallint(3) NOT NULL COMMENT '软件分类',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件类型（1国产软件、2国外软件、3汉化补丁）',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件语言（1简体中文、2英文、3繁体中文、4多国语言）',
  `impower` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件授权（1共享版、2免费版、3试用版、4演示版）',
  `size` float(8, 2) NOT NULL COMMENT '软件大小',
  `system` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用平台（Win All、Android、IOS）',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发商邮箱',
  `homepage` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件官网',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '软件图标',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正文介绍',
  `downurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下载地址',
  `top` int(11) NULL DEFAULT NULL COMMENT '置顶',
  `down_count` int(11) NOT NULL COMMENT '下载次数',
  `like` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `create_time` datetime(0) NOT NULL COMMENT '软件发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soft
-- ----------------------------
INSERT INTO `soft` VALUES (1, '微信', 1, '6.5.22 官方版', '国产软件', '简体中文', '免费版', 54.35, 'Android', '10000@qq.com', 'www.qq.com', '62e788c0b54c4ca7b3a8a67b48494106', '<p>手机微信基于Android平台的腾讯微信服务，手机微信带给您全新的移动即时通信体验。您可以使用手机微信快速免费的发送消息，即时拍照分享，随时随地联系身边的朋友。微信官方版支持基于Android平台的手机终端设备。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;新时代，手机微信带给您全新的移动即时通信体验!为了保护您的隐私，手机微信不会自动扫描和上传您的手机通讯录。微信官方版并且保证不透露信息是否已读，降低收信压力。</p>', '\\Android\\weixin.apk', 1, 18, 0, '2018-05-14 23:33:23');
INSERT INTO `soft` VALUES (3, '360手机卫士', 2, '7.7.3 官方版', '国产软件', '简体中文', '免费版', 13.22, 'Android', '360@360.com', 'www.360.com', 'f5ad33d7f04c4d02ba226333f66011ff', '<p>360手机卫士是一款功能强大，永久免费的手机安全软件，360手机卫士安卓版将人与安全紧密连接，为10亿用户提供全方位手机安全管理服务，360手机卫安卓版是手机日常使用必不可少的手机软件。</p>', '\\Android\\360safe.apk', NULL, 25, 0, '2018-05-14 23:33:27');
INSERT INTO `soft` VALUES (2, '腾讯QQ', 1, '9.0.2.23475 最新正式版', '国产软件', '简体中文', '免费版', 67.70, 'Windows', '10000@qq.com', 'www.qq.com', '46293c16262b4f408de7c392f62df20f', '<p>QQ是腾讯QQ的简称，是腾讯公司开发的一款基于Internet的即时通信（IM）软件。腾讯QQ支持在线聊天、视频聊天以及语音聊天、点对点断点续传文件、共享文件、网络硬盘、自定义面板、远程控制、QQ邮箱、传送离线文件等多种功能，并可与多种通讯方式相连。QQ2017经过不断更新，腾讯QQ已经变成一款非常成熟的通讯软件，QQ下载安装2017版最新版全新的界面，带给用户全新的体验，让聊天界面更丰富！华军软件园支持QQ下载安装2017版最新版下载！</p>', '\\Windows\\QQ9.0.2.23475.exe', NULL, 34, 0, '2018-05-14 23:33:25');

-- ----------------------------
-- Table structure for soft_catalog
-- ----------------------------
DROP TABLE IF EXISTS `soft_catalog`;
CREATE TABLE `soft_catalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级分类名',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soft_catalog
-- ----------------------------
INSERT INTO `soft_catalog` VALUES (1, '网络软件', NULL);
INSERT INTO `soft_catalog` VALUES (2, '系统软件', NULL);
INSERT INTO `soft_catalog` VALUES (3, '媒体工具', NULL);
INSERT INTO `soft_catalog` VALUES (4, '图形图像', NULL);
INSERT INTO `soft_catalog` VALUES (5, '管理软件', NULL);
INSERT INTO `soft_catalog` VALUES (6, '教育教学', NULL);
INSERT INTO `soft_catalog` VALUES (7, '其它类别', NULL);

-- ----------------------------
-- Table structure for soft_class
-- ----------------------------
DROP TABLE IF EXISTS `soft_class`;
CREATE TABLE `soft_class`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `catalog_id` int(11) NOT NULL COMMENT '一级分类',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类名',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soft_class
-- ----------------------------
INSERT INTO `soft_class` VALUES (1, 1, '网页浏览', NULL);
INSERT INTO `soft_class` VALUES (2, 1, '下载工具', NULL);
INSERT INTO `soft_class` VALUES (3, 1, '聊天工具', NULL);
INSERT INTO `soft_class` VALUES (4, 1, '网络电话', NULL);
INSERT INTO `soft_class` VALUES (5, 2, '压缩解压', NULL);
INSERT INTO `soft_class` VALUES (6, 2, '拼音输入', NULL);
INSERT INTO `soft_class` VALUES (7, 2, '文本编辑', NULL);
INSERT INTO `soft_class` VALUES (8, 2, '数据恢复', NULL);
INSERT INTO `soft_class` VALUES (9, 2, '系统优化', NULL);
INSERT INTO `soft_class` VALUES (10, 3, '网络电视', NULL);
INSERT INTO `soft_class` VALUES (11, 3, '视频播放', NULL);
INSERT INTO `soft_class` VALUES (12, 3, '音频播放', NULL);
INSERT INTO `soft_class` VALUES (13, 3, '电子相册', NULL);
INSERT INTO `soft_class` VALUES (14, 4, '图像处理', NULL);
INSERT INTO `soft_class` VALUES (15, 4, '看图软件', NULL);
INSERT INTO `soft_class` VALUES (16, 4, '截图软件', NULL);
INSERT INTO `soft_class` VALUES (17, 4, '图片压缩', NULL);
INSERT INTO `soft_class` VALUES (18, 5, '办公软件', NULL);
INSERT INTO `soft_class` VALUES (19, 5, '财务管理', NULL);
INSERT INTO `soft_class` VALUES (20, 5, '记事管理', NULL);
INSERT INTO `soft_class` VALUES (21, 5, '系统安全', NULL);
INSERT INTO `soft_class` VALUES (22, 6, '文科工具', NULL);
INSERT INTO `soft_class` VALUES (23, 6, '理科工具', NULL);
INSERT INTO `soft_class` VALUES (24, 6, '外语学习', NULL);
INSERT INTO `soft_class` VALUES (25, 6, '考试系统', NULL);
INSERT INTO `soft_class` VALUES (26, 7, '文件管理', NULL);
INSERT INTO `soft_class` VALUES (27, 7, '数码工具', NULL);
INSERT INTO `soft_class` VALUES (28, 7, '安卓刷机', NULL);
INSERT INTO `soft_class` VALUES (29, 7, '出行查询', NULL);
INSERT INTO `soft_class` VALUES (30, 7, '算命软件', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `authority` tinyint(3) NOT NULL DEFAULT 0 COMMENT '管理员权限',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '激活状态（0冻结，1激活）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '超级管理员', '732722725@qq.com', 1, 1, '2018-05-07 19:36:29');
INSERT INTO `user` VALUES (2, 'lintong', 'lintong', '林桐', '123456@qq.com', 0, 1, '2018-05-07 19:36:32');
INSERT INTO `user` VALUES (3, 'zhangsan', 'zhangsan', '张三', 'zhangsan@163.com', 0, 1, '2018-05-11 15:18:24');
INSERT INTO `user` VALUES (4, 'maliu', '123456', '马六', 'maliu@qq.com', 0, 1, '2018-05-13 22:07:40');
INSERT INTO `user` VALUES (5, 'mazouri', '123456', '马走日', 'mazouri@qq.com', 0, 1, '2018-05-13 22:51:15');

SET FOREIGN_KEY_CHECKS = 1;
