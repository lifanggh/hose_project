/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : zhiyouhouse

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-02-21 15:41:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `back`
-- ----------------------------
DROP TABLE IF EXISTS `back`;
CREATE TABLE `back` (
  `bid` int(5) NOT NULL AUTO_INCREMENT,
  `bname` varchar(5) DEFAULT NULL,
  `bidcard` varchar(20) DEFAULT NULL,
  `bphone` varchar(20) DEFAULT NULL,
  `bsex` varchar(3) DEFAULT NULL,
  `bjob` varchar(30) DEFAULT NULL,
  `bwage` double(7,0) DEFAULT NULL,
  `badress` varchar(30) DEFAULT NULL,
  `btime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of back
-- ----------------------------
INSERT INTO `back` VALUES ('1', '小明', '1111111111111111', '12345678912', '男', '扫厕所', '2000', '石', '2019-02-20 20:23:20');
INSERT INTO `back` VALUES ('2', '明名', '111111111111133', '12345678912', '女', '擦地', '2000', '石', '2019-02-20 20:23:26');
INSERT INTO `back` VALUES ('5', '阳峰', '111111111166111', '17775678912', '男', '扫厕所', '2000', '石家庄', '2019-02-20 20:23:30');
INSERT INTO `back` VALUES ('6', '杨幂', '1111117711111111', '1999678912', '女', '整理家具', '2000', '石', '2019-02-20 20:23:37');
INSERT INTO `back` VALUES ('7', '杨洋', '11111881111111', '12345678912', '男', '扫厕所', '2000', '石', '2019-02-20 20:23:55');
INSERT INTO `back` VALUES ('8', '小花', '11111111199111', '12345678912', '女', '处理垃圾', '2000', '石', '2019-02-20 20:23:51');
INSERT INTO `back` VALUES ('9', '韩红', '11111111001111', '12345678912', '女', '扫厕所', '2000', '苏州', '2019-02-20 20:23:40');
INSERT INTO `back` VALUES ('11', '天天', '111115611111111', '12345678912', '男', '扫厕所', '2000', '杭州', '2019-02-20 20:23:43');
