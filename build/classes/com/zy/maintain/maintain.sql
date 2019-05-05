/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : zhiyouhouse

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-02-22 22:09:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `maintain`
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `mid` int(5) NOT NULL AUTO_INCREMENT,
  `mpid` int(5) DEFAULT NULL COMMENT '负责人',
  `mexplain` varchar(30) DEFAULT NULL,
  `mresult` varchar(30) DEFAULT NULL,
  `mbz` varchar(30) DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mhouse` int(5) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('1', '1', '暖气坏了', '修好了', '刚开始没有弄好导致漏水', '2019-02-12 16:24:04', '2');
INSERT INTO `maintain` VALUES ('2', '2', '下水道堵了', '修好了', '头发掉的太多没有清理', '2019-02-15 07:24:15', '2');
INSERT INTO `maintain` VALUES ('3', '3', '墙发霉', '未处理好', '地暖出问题,且天气潮湿造成', '2019-02-21 17:28:39', '4');
INSERT INTO `maintain` VALUES ('4', '4', '房间不通电', '修好了', '总闸开关出现断丝', '2019-02-21 17:28:44', '6');
INSERT INTO `maintain` VALUES ('5', '5', '地暖不供暖', '修好了', '没交钱', '2019-02-21 17:28:41', '5');
INSERT INTO `maintain` VALUES ('25', '1', '2', '1', '1', '2015-01-01 00:00:00', '3');
