/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_docker
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 127.0.0.1:3306
 Source Schema         : atomscat-data-center

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 10/08/2019 15:00:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_account_channel_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_account_channel_mapping`;
CREATE TABLE `t_account_channel_mapping` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `t_delivery_platform_authorization_id` varchar(255) DEFAULT NULL COMMENT '授权表ID',
  `customer_short_name` varchar(255) DEFAULT NULL COMMENT '客户简称',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户全称',
  `delivery_platform` varchar(255) DEFAULT NULL COMMENT '数据平台标志',
  `account_id` varchar(255) DEFAULT NULL COMMENT '账户id',
  `account_name` varchar(255) DEFAULT NULL COMMENT '账户全称',
  `channel_customer` varchar(255) DEFAULT NULL COMMENT '客户号',
  `channel_delivery` varchar(255) DEFAULT NULL COMMENT '渠道号',
  `channel_number_description` varchar(255) DEFAULT NULL COMMENT '渠道号说明',
  `advertiser_id` varchar(255) DEFAULT NULL COMMENT '广告主ID',
  `pid` varchar(32) DEFAULT '0' COMMENT '父id',
  `kpi_ids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户渠道号映射\n';

-- ----------------------------
-- Records of t_account_channel_mapping
-- ----------------------------
BEGIN;
INSERT INTO `t_account_channel_mapping` VALUES ('8c86a96456264cd5b40efa43838b7a14', 'system', '2019-08-10 14:57:04', 0, 'system', '2019-08-10 14:58:39', NULL, '公司1', '公司1', '', NULL, NULL, NULL, NULL, NULL, NULL, '0', '089416833b8e4df08cc57ea74c1fe002,');
COMMIT;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
BEGIN;
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2019-03-14 18:50:44', '40322777781112832', 1.00, 0, '技术部', b'1');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL);
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', 0, '', '2018-08-11 00:02:53', '0', 2.00, 0, '成都分部', b'1');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', '40343262766043136', 2.00, 0, 'Vue', NULL);
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', '40343262766043136', 1.00, 0, 'JAVA', b'0');
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', '0', 3.00, 0, '人事部', b'1');
INSERT INTO `t_department` VALUES ('40652338142121984', NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', '40652270295060480', 1.00, 0, '游客', b'0');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', '40652270295060480', 2.00, 0, 'VIP', b'0');
COMMIT;

-- ----------------------------
-- Table structure for t_department_header
-- ----------------------------
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE `t_department_header` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department_header
-- ----------------------------
BEGIN;
INSERT INTO `t_department_header` VALUES ('118575966346809344', NULL, '2019-03-14 19:10:54', 0, NULL, '2019-03-14 19:10:54', '40322777781112832', 0, '682265633886209');
COMMIT;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_dict` VALUES ('166713001645182976', 'admin', '2019-07-25 15:10:18', 0, 'admin', '2019-08-10 14:46:28', '', '数据平台', 'delivery_platform', 0.00);
INSERT INTO `t_dict` VALUES ('168903976308183040', NULL, '2019-07-31 16:16:27', 0, NULL, '2019-07-31 16:16:27', '', '数据类型', 'type_of_data', 0.00);
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00);
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 3.00);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_data` VALUES ('168904055601500160', NULL, '2019-07-31 16:16:46', 0, NULL, '2019-07-31 16:16:46', '', '168903976308183040', 0.00, 0, '字符串', 'String');
INSERT INTO `t_dict_data` VALUES ('168904425929183232', '', '2019-07-31 16:18:14', 0, '', '2019-07-31 16:20:53', '', '168903976308183040', 0.00, 0, '数值', 'Double');
INSERT INTO `t_dict_data` VALUES ('168905231776616448', '', '2019-07-31 16:21:26', 0, '', '2019-07-31 16:21:26', '', '168903976308183040', 0.00, 0, '时间', 'Date');
INSERT INTO `t_dict_data` VALUES ('172505254892408832', 'system', '2019-08-10 14:46:39', 0, 'system', '2019-08-10 14:46:39', '', '166713001645182976', 0.00, 0, '支付宝', '1');
INSERT INTO `t_dict_data` VALUES ('172505302166409216', 'system', '2019-08-10 14:46:50', 0, 'system', '2019-08-10 14:46:50', '', '166713001645182976', 0.00, 0, '微信', '2');
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-28 22:15:11', '', '75135930788220928', 0.00, 0, '男', '男');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-28 22:15:17', '', '75135930788220928', 1.00, 0, '女', '女');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-28 22:15:22', '', '75135930788220928', 2.00, -1, '保密', '保密');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', '75388696739713024', 0.00, 0, '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', '75388696739713024', 1.00, 0, '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', '75388696739713024', 2.00, 0, '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', '75388696739713024', 3.00, 0, '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', '75388696739713024', 4.00, 0, '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', '75388696739713024', 5.00, 0, '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', '75388696739713024', 6.00, 0, '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', '75388696739713024', 7.00, 0, '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', '75388696739713024', 8.00, 0, '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', '75388696739713024', 9.00, 0, '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', '75388696739713024', 10.00, 0, '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', '75388696739713024', 11.00, 0, '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', '75388696739713024', 12.00, 0, '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', '75388696739713024', 13.00, 0, '其他操作(other)', 'other');
COMMIT;

-- ----------------------------
-- Table structure for t_kpi
-- ----------------------------
DROP TABLE IF EXISTS `t_kpi`;
CREATE TABLE `t_kpi` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title` varchar(255) DEFAULT NULL COMMENT 'kpi名称',
  `type` varchar(255) DEFAULT NULL COMMENT 'kpi数据类型',
  `sort_order` decimal(10,2) DEFAULT NULL COMMENT 'kpi排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_kpi
-- ----------------------------
BEGIN;
INSERT INTO `t_kpi` VALUES ('089416833b8e4df08cc57ea74c1fe002', 'system', '2019-08-10 14:58:36', 0, 'system', '2019-08-10 14:58:36', '', '字符串1', 'String', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_kpi_account
-- ----------------------------
DROP TABLE IF EXISTS `t_kpi_account`;
CREATE TABLE `t_kpi_account` (
  `kpi_id` varchar(255) NOT NULL COMMENT 'kpi表id',
  `account_id` varchar(255) NOT NULL COMMENT '客户表ID',
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'kpi的名称',
  PRIMARY KEY (`kpi_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_kpi_account
-- ----------------------------
BEGIN;
INSERT INTO `t_kpi_account` VALUES ('089416833b8e4df08cc57ea74c1fe002', '8c86a96456264cd5b40efa43838b7a14', 'e78dedc590574e25bb2543a7b549703e', 'system', '2019-08-10 14:58:39', 0, 'system', '2019-08-10 14:58:39', '字符串1');
COMMIT;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
BEGIN;
INSERT INTO `t_log` VALUES ('164925259412148224', NULL, '2019-07-20 16:46:27', 0, NULL, '2019-07-20 16:46:27', 366, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"muai\",\"saveLogin\":\"true\",\"captchaId\":\"a81d84677f45477ca34822a1b95ae338\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164930372855926784', NULL, '2019-07-20 17:06:46', 0, NULL, '2019-07-20 17:06:46', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"ejz7\",\"saveLogin\":\"true\",\"captchaId\":\"5036f848e0204a91bd6829d7dd68bb68\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165979568090386432', NULL, '2019-07-23 14:35:54', 0, NULL, '2019-07-23 14:35:54', 329, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"umxl\",\"saveLogin\":\"true\",\"captchaId\":\"ca4f10da3f4c483888af302b8c5dc47d\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165981219916353536', NULL, '2019-07-23 14:42:28', 0, NULL, '2019-07-23 14:42:28', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"s3ws\",\"saveLogin\":\"true\",\"captchaId\":\"38cb7054d6d84d5198b7e064df87db87\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166361384567705600', NULL, '2019-07-24 15:53:06', 0, NULL, '2019-07-24 15:53:06', 230, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"mew5\",\"saveLogin\":\"true\",\"captchaId\":\"1d516d03e61c420fbc0570750ab2c05f\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168445003964616704', NULL, '2019-07-30 09:52:41', 0, NULL, '2019-07-30 09:52:41', 1605, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"cofu\",\"saveLogin\":\"true\",\"captchaId\":\"bf4259d50f1a4935af1647e6845775ee\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168512184496689152', NULL, '2019-07-30 14:19:37', 0, NULL, '2019-07-30 14:19:37', 240, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"h6z7\",\"saveLogin\":\"true\",\"captchaId\":\"ab99423d47c2401baef8ae6bb84c761c\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168518006287110144', NULL, '2019-07-30 14:42:45', 0, NULL, '2019-07-30 14:42:45', 235, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"sgku\",\"saveLogin\":\"true\",\"captchaId\":\"4bd3e322741e4eae8fc9ab721eb3b3a2\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168565486718554112', NULL, '2019-07-30 17:51:25', 0, NULL, '2019-07-30 17:51:25', 261, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"dztw\",\"saveLogin\":\"true\",\"captchaId\":\"5730a79b02cb472f86bd14027432a31f\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168572215246196736', NULL, '2019-07-30 18:18:09', 0, NULL, '2019-07-30 18:18:09', 157, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"dash\",\"saveLogin\":\"true\",\"captchaId\":\"3fa548aaf1c844f49e94ccd1c13f1cd1\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168606127720763392', NULL, '2019-07-30 20:32:55', 0, NULL, '2019-07-30 20:32:55', 455, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"utpj\",\"saveLogin\":\"true\",\"captchaId\":\"d5934d7ec1a04ad3852ba500b3526d62\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168949693169012736', NULL, '2019-07-31 19:18:07', 0, NULL, '2019-07-31 19:18:07', 229, '192.168.1.12', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"ocrv\",\"saveLogin\":\"true\",\"captchaId\":\"445c3d2686cd46e7bfe020b8fa50fb62\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168952215627632640', 'system', '2019-07-31 19:28:09', 0, 'system', '2019-07-31 19:28:09', 515, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"g6wq\",\"saveLogin\":\"true\",\"captchaId\":\"45d35c9687614422b269077065808e4c\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168978733493915648', 'system', '2019-07-31 21:13:31', 0, 'system', '2019-07-31 21:13:31', 281, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"fdlj\",\"saveLogin\":\"true\",\"captchaId\":\"b05f0e591c204f8e8bceade489784bdb\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168979654969921536', 'system', '2019-07-31 21:17:10', 0, 'system', '2019-07-31 21:17:10', 167, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"vkox\",\"saveLogin\":\"true\",\"captchaId\":\"fd5d7214cce74d0ebf03d534f788c166\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168979903859920896', 'system', '2019-07-31 21:18:10', 0, 'system', '2019-07-31 21:18:10', 266, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"b7ch\",\"saveLogin\":\"true\",\"captchaId\":\"2eb4cfaf5a474f5ea2e9e7161f28300d\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168981478061903872', 'system', '2019-07-31 21:24:26', 0, 'system', '2019-07-31 21:24:26', 674, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"kdnu\",\"saveLogin\":\"true\",\"captchaId\":\"1f139fdb62584a7d9bc9ec9a5ca583f6\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168981704889864192', 'system', '2019-07-31 21:25:19', 0, 'system', '2019-07-31 21:25:19', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"djjh\",\"saveLogin\":\"true\",\"captchaId\":\"0786692c38a84f64b1ba22e153284687\",\"username\":\"Howell\"}', 'POST', '/api/login', 'Howell', 1);
INSERT INTO `t_log` VALUES ('169192033674596352', 'system', '2019-08-01 11:21:05', 0, 'system', '2019-08-01 11:21:05', 187, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"kaw6\",\"saveLogin\":\"true\",\"captchaId\":\"af49433df6b64227a88ce7b196a4a66c\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169243118133055488', 'system', '2019-08-01 14:44:05', 0, 'system', '2019-08-01 14:44:05', 267, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"RQOR\",\"saveLogin\":\"true\",\"captchaId\":\"cfe9a0659b85437b8237f8e814d8e459\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169243222130823168', 'system', '2019-08-01 14:44:30', 0, 'system', '2019-08-01 14:44:30', 154, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"x7ky\",\"saveLogin\":\"true\",\"captchaId\":\"ac28d50def1b4fac83643019c951beb3\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169246223599931392', 'system', '2019-08-01 14:56:25', 0, 'system', '2019-08-01 14:56:25', 170, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"dg9q\",\"saveLogin\":\"true\",\"captchaId\":\"d7e92bb37c8a4f5eb74faff09631b7a1\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169247921349332992', 'system', '2019-08-01 15:03:10', 0, 'system', '2019-08-01 15:03:10', 170, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"8z5q\",\"saveLogin\":\"true\",\"captchaId\":\"f9d14a61f52e4fe4870c7df038b8d93a\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169257611445669888', 'system', '2019-08-01 15:41:40', 0, 'system', '2019-08-01 15:41:40', 237, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"mzgk\",\"saveLogin\":\"true\",\"captchaId\":\"f913653897134b8fb19f662d8a697be6\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169265637095378944', 'system', '2019-08-01 16:13:34', 0, 'system', '2019-08-01 16:13:34', 225, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"msvt\",\"saveLogin\":\"true\",\"captchaId\":\"dfe7cd21967f4047a3ee468668c6e5c1\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169265857715769344', 'system', '2019-08-01 16:14:27', 0, 'system', '2019-08-01 16:14:27', 416, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"pbed\",\"saveLogin\":\"true\",\"captchaId\":\"7d623a4a8f3748e691a946f0605e3e5d\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169268598886371328', 'system', '2019-08-01 16:25:20', 0, 'system', '2019-08-01 16:25:20', 170, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"iy3k\",\"saveLogin\":\"true\",\"captchaId\":\"1288484290264b1493db643fde4c085c\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169269555435147264', 'system', '2019-08-01 16:29:08', 0, 'system', '2019-08-01 16:29:08', 240, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"rrpg\",\"saveLogin\":\"true\",\"captchaId\":\"b616134ff07f4a15a636d050323eefb4\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169286311948062720', 'system', '2019-08-01 17:35:43', 0, 'system', '2019-08-01 17:35:43', 369, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"hlzc\",\"saveLogin\":\"true\",\"captchaId\":\"f38ebc14ff3847d3a2d2ddb729623b88\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169290109609316352', 'system', '2019-08-01 17:50:49', 0, 'system', '2019-08-01 17:50:49', 261, '10.42.1.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"1d9r\",\"saveLogin\":\"true\",\"captchaId\":\"6abd19e48cd54db596ec92c3e2156f03\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169292593283207168', 'system', '2019-08-01 18:00:41', 0, 'system', '2019-08-01 18:00:41', 302, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"qiku\",\"saveLogin\":\"true\",\"captchaId\":\"c5eb70115fa44f0ea6318d0b60189d93\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169295357124022272', 'system', '2019-08-01 18:11:40', 0, 'system', '2019-08-01 18:11:40', 238, '192.168.1.13', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"ie1f\",\"saveLogin\":\"true\",\"captchaId\":\"36687ebf7a5e4f8594fadf5a16688865\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169296443100631040', 'system', '2019-08-01 18:15:59', 0, 'system', '2019-08-01 18:15:59', 346, '192.168.1.12', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"t3ck\",\"saveLogin\":\"true\",\"captchaId\":\"782c551c1487411bb9ee2348645bc461\",\"username\":\"Howell\"}', 'POST', '/api/login', 'Howell', 1);
INSERT INTO `t_log` VALUES ('169300090127650816', 'system', '2019-08-01 18:30:28', 0, 'system', '2019-08-01 18:30:28', 244, '192.168.1.12', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"zuh9\",\"saveLogin\":\"true\",\"captchaId\":\"9d8648c11c904dccb1488cc6c89e1903\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169311249262186496', 'system', '2019-08-01 19:14:49', 0, 'system', '2019-08-01 19:14:49', 969, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"pbj9\",\"saveLogin\":\"true\",\"captchaId\":\"ea4bec9e2a6048a68fd8c3b1f8f6c8d6\",\"username\":\"Howell\"}', 'POST', '/api/login', 'Howell', 1);
INSERT INTO `t_log` VALUES ('169334506593980416', 'system', '2019-08-01 20:47:14', 0, 'system', '2019-08-01 20:47:14', 192, '192.168.1.12', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"gaby\",\"saveLogin\":\"true\",\"captchaId\":\"d1b4ff3274ef4d57bd7405a42bc9b1e1\",\"username\":\"Howell\"}', 'POST', '/api/login', 'Howell', 1);
INSERT INTO `t_log` VALUES ('169343037149810688', 'system', '2019-08-01 21:21:08', 0, 'system', '2019-08-01 21:21:08', 285, '10.42.0.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"xa8o\",\"saveLogin\":\"true\",\"captchaId\":\"d3a4a3a73f9946d9997c019d6d3bd2e1\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169545481196670976', 'system', '2019-08-02 10:45:34', 0, 'system', '2019-08-02 10:45:34', 239, '10.42.0.0', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"ug95\",\"saveLogin\":\"true\",\"captchaId\":\"cbf6d7dbc7dc44a38f061c95de708ac9\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169615631644102656', 'system', '2019-08-02 15:24:19', 0, 'system', '2019-08-02 15:24:19', 144, '192.168.1.12', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"code\":\"zwaq\",\"saveLogin\":\"true\",\"captchaId\":\"736e71e3c8b3471184feedd4364cb492\",\"username\":\"admin\"}', 'POST', '/api/login', 'admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `show_always` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_permission` VALUES ('121426317022334976', 'admin', '2019-03-22 15:57:11', 0, 'admin', '2019-03-22 15:57:11', NULL, 'redis', '39915540965232640', 0, 2.21, 'sys/redis/redis', 'redis', 'Redis缓存管理', 'md-barcode', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('125909152017944576', 'admin', '2019-04-04 00:50:22', 0, 'admin', '2019-07-20 17:10:32', '', 'atomscat', '', -1, 0.00, '', '', '系统', 'md-home', 0, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('149452775095275520', 'admin', '2019-06-08 00:04:19', 0, 'admin', '2019-06-08 00:04:19', NULL, 'admin', '39915540965232640', 0, 2.29, 'sys/monitor/monitor', '/admin', 'Admin监控', 'md-speedometer', 2, '', 0, 'http://127.0.0.1:8888/api/admin', b'1');
INSERT INTO `t_permission` VALUES ('156365156580855808', 'admin', '2019-06-27 01:51:39', 0, 'admin', '2019-06-27 01:51:39', NULL, '', '5129710648430593', 1, 1.18, '', '/api/user/resetPass', '重置密码', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', '5129710648430593', 1, 1.11, '', '/api/user/admin/add*', '添加用户', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', '5129710648430593', 1, 1.13, '', '/api/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', '5129710648430593', 1, 1.14, '', '/api/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('166708984101736448', '', '2019-07-25 14:54:20', 0, '', '2019-07-25 14:56:29', '', 'dataManagement', '125909152017944576', 0, 0.00, 'Main', '/delivery', '数据管理', 'md-pie', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('166711400545128448', '', '2019-07-25 15:03:56', 0, '', '2019-08-10 14:45:34', '', 'adDataReport', '166708984101736448', 0, 0.00, 'delivery/ad-data-report/adDataReport', 'adDataReport', 'ad数据表格', 'md-analytics', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', '5129710648430593', 1, 1.12, '', '/api/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', '5129710648430593', 1, 1.15, '', '/api/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', '5129710648430594', 1, 1.21, '', '/api/role/save*', '添加角色', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', '5129710648430594', 1, 1.22, '', '/api/role/edit*', '编辑角色', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', '5129710648430594', 1, 1.23, '', '/api/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/api/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', '5129710648430594', 1, 1.25, '', '/api/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', '5129710648430595', 1, 1.31, '', '/api/permission/add*', '添加菜单', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', '5129710648430595', 1, 1.32, '', '/api/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', '5129710648430595', 1, 1.33, '', '/api/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('168607893103316992', '', '2019-07-30 20:39:55', 0, '', '2019-08-10 14:44:30', '', 'accountChannel', '166708984101736448', 0, 0.00, 'delivery/account-channel/accountChannel', 'accountChannel', '客户数据管理', 'ios-contacts', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', '5129710648430593', 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('39915540965232640', NULL, '2018-08-09 17:42:28', 0, NULL, '2018-08-09 17:42:28', NULL, 'monitor', '125909152017944576', 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, NULL, 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://127.0.0.1:8888/druid/login.html', b'1');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://127.0.0.1:8888/swagger-ui.html', b'1');
INSERT INTO `t_permission` VALUES ('40238597734928384', NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', '5129710648430592', 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', 0, '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', '41363147411427328', 1, 2.11, '', '/api/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', '41363147411427328', 1, 2.12, '', '/api/log/delAll*', '清空日志', '', 3, 'undefined', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41370251991977984', NULL, '2018-08-13 18:02:57', 0, NULL, '2018-08-13 18:02:57', NULL, 'quartz-job', '39915540965232640', 0, 2.10, 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('41371711400054784', '', '2018-08-13 18:08:45', 0, '', '2019-07-20 17:16:13', '', 'actuator', '39915540965232640', 0, 2.30, 'sys/actuator/actuator', 'actuator', 'Actuator监控', 'logo-angular', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41469219249852416', NULL, '2018-08-14 00:36:13', 0, NULL, '2018-08-14 00:36:13', NULL, '', '41371711400054784', 1, 2.31, '', '无', '查看数据', '', 3, 'view', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', '40238597734928384', 1, 1.21, '', '/api/department/add*', '添加部门', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', '40238597734928384', 1, 1.22, '', '/api/department/edit*', '编辑部门', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235939278065664', NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', '40238597734928384', 1, 1.23, '', '/api/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', '41370251991977984', 1, 2.11, '', '/api/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', '41370251991977984', 1, 2.12, '', '/api/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', '41370251991977984', 1, 2.13, '', '/api/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', '41370251991977984', 1, 2.14, '', '/api/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45266070000373760', NULL, '2018-08-24 12:03:33', 0, NULL, '2018-08-24 12:03:33', NULL, '', '41370251991977984', 1, 2.15, '', '/api/quartzJob/delByIds/*', '删除定时任务', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2018-09-29 23:11:56', '', 'sys', '125909152017944576', 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', 0, '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('56309618086776832', '', '2018-09-23 23:26:40', 0, 'admin', '2019-07-20 17:17:16', '', 'oss-manage', '5129710648430592', 0, 1.40, 'sys/oss-manage/ossManage', 'oss-manage', '文件对象存储', 'ios-folder', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', '5129710648430593', 1, 1.17, '', '/api/user/importData*', '导入用户', '', 3, 'input', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', '56309618086776832', 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('58480609315524608', '', '2018-09-29 23:13:24', 0, 'admin', '2019-07-20 17:17:00', '', 'setting', '5129710648430592', 0, 1.90, 'sys/setting-manage/settingManage', 'setting', '系统配置', 'ios-settings-outline', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('61394706252173312', NULL, '2018-10-08 00:12:59', 0, NULL, '2018-10-08 00:12:59', NULL, '', '58480609315524608', 1, 1.81, '', '/api/setting/seeSecret/**', '查看私密配置', '', 3, 'view', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', 0, '', '2018-10-08 01:50:03', '', '', '58480609315524608', 1, 1.82, '', '/api/setting/*/set*', '编辑配置', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('61560041605435392', NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', '56309618086776832', 1, 1.42, '', '/api/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61560275261722624', NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', '56309618086776832', 1, 1.43, '', '/api/file/copy*', '复制文件', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61560480518377472', NULL, '2018-10-08 11:11:43', 0, NULL, '2018-10-08 11:11:43', NULL, '', '56309618086776832', 1, 1.44, '', '/api/file/delete/*', '删除文件', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', 0, 'admin', '2018-11-20 20:06:22', '', 'dict', '5129710648430592', 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', 1, 1.81, '', '/api/dict/add*', '添加字典', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', '75002207560273920', 1, 1.82, '', '/api/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', 0, 'admin', '2018-11-17 21:48:34', NULL, '', '75002207560273920', 1, 1.83, '', '/api/dict/delByIds/**', '删除字典', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', '75002207560273920', 1, 1.84, '', '/api/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', '75002207560273920', 1, 1.85, '', '/api/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', '75002207560273920', 1, 1.86, '', '/api/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL, b'1');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', 0, NULL, '测试权限按钮显示', 1);
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
BEGIN;
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432');
COMMIT;

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_role_permission` VALUES ('172504409970839552', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '125909152017944576', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410033754112', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '166708984101736448', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410067308544', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '166711400545128448', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410088280064', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '168607893103316992', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410121834496', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410147000320', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410176360448', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410214109184', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410268635136', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410289606656', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410310578176', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410339938304', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410356715520', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410373492736', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '156365156580855808', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410407047168', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410423824384', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410444795904', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410486738944', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410503516160', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '56309618086776832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410524487680', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '57212882168844288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410553847808', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '61560041605435392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410570625024', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '61560275261722624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410583207936', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '61560480518377472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410604179456', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410625150976', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410633539584', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410650316800', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410671288320', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410683871232', 'system', '2019-08-10 14:43:17', 0, 'system', '2019-08-10 14:43:17', '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410700648448', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410717425664', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410738397184', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410763563008', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410780340224', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '75002207560273920', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410801311744', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410818088960', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410830671872', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410843254784', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410860032000', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410876809216', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410893586432', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '58480609315524608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410914557952', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '61394706252173312', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410935529472', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '61417744146370560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410952306688', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '39915540965232640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410973278208', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504410990055424', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411015221248', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411027804161', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411044581376', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411073941504', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411090718720', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41363147411427328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411111690240', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41363537456533504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411124273152', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41364927394353152', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411136856064', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '121426317022334976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411149438976', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '149452775095275520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411166216192', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41371711400054784', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411178799104', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '41469219249852416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411191382016', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '39916171171991552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('172504411212353536', 'system', '2019-08-10 14:43:18', 0, 'system', '2019-08-10 14:43:18', '39918482854252544', '496138616573952');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('16739222421508096', '', '2018-06-06 18:48:02', '', '2018-10-08 00:04:32', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test2', 0, '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('4363087427670016', '', '2018-05-03 15:09:42', '', '2018-10-08 00:04:46', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test', 0, '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', 'admin', '2019-01-19 14:11:43', '[\"510000\",\"510100\",\"510104\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', 'test', '2549575805@qq.com', '18782059038', 'Howell', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, '40322777781112832', '天府1街', '弱');
INSERT INTO `t_user` VALUES ('682265633886209', '', '2018-04-30 23:28:42', 'admin', '2019-07-31 21:24:49', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '15817161961', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'Howell', 0, '40322777781112832', '', '弱');
COMMIT;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role` VALUES ('168981580948180992', 'system', '2019-07-31 21:24:49', 0, 'system', '2019-07-31 21:24:49', '496138616573952', '682265633886209');
INSERT INTO `t_user_role` VALUES ('61392579396112384', NULL, '2018-10-08 00:04:32', 0, NULL, '2018-10-08 00:04:32', '16457350655250432', '16739222421508096');
INSERT INTO `t_user_role` VALUES ('61392637076180992', NULL, '2018-10-08 00:04:46', 0, NULL, '2018-10-08 00:04:46', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('98931727094779904', NULL, '2019-01-19 14:11:43', 0, NULL, '2019-01-19 14:11:43', '496138616573952', '682265633886208');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
