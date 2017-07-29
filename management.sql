/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : 127.0.0.1:3306
Source Database       : management

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2017-02-22 09:28:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for emptable
-- ----------------------------
DROP TABLE IF EXISTS `emptable`;
CREATE TABLE `emptable` (
  `iId` int(10) NOT NULL AUTO_INCREMENT,
  `sName` varchar(255) NOT NULL,
  `iAge` smallint(10) DEFAULT NULL,
  `sPosition` varchar(255) NOT NULL,
  `sPassword` varchar(255) NOT NULL,
  `sSex` varchar(255) DEFAULT NULL,
  `sPhone` varchar(255) DEFAULT NULL,
  `dtUpdate` datetime DEFAULT NULL,
  `dtInsert` datetime DEFAULT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emptable
-- ----------------------------
INSERT INTO `emptable` VALUES ('1', 'admin', '22', '管理员', '123456', '男', '123456789', '2017-02-22 09:21:04', '2017-02-15 14:12:45');
INSERT INTO `emptable` VALUES ('8', '李磊', '22', '测试员工', '123', '男', '24553', '2017-02-18 23:06:41', '2017-02-18 23:06:41');
INSERT INTO `emptable` VALUES ('9', '小张', '36', '测试员工', '789', '保密', '963258741', '2017-02-20 09:34:35', '2017-02-20 09:34:35');
INSERT INTO `emptable` VALUES ('10', '丁俊辉', '30', '开发员工', '123', '男', '56984258', '2017-02-20 10:32:00', '2017-02-20 10:32:00');
INSERT INTO `emptable` VALUES ('11', '傅家俊', '38', '测试员工', '123456', '男', '56955488', '2017-02-22 09:21:27', '2017-02-20 10:32:04');
INSERT INTO `emptable` VALUES ('12', '周跃龙', '25', '测试员工', '123456', '男', '5488', '2017-02-21 18:15:00', '2017-02-20 10:32:08');
INSERT INTO `emptable` VALUES ('13', '潘晓婷', '37', '测试员工', '123456', '女', '548689898', '2017-02-21 14:52:18', '2017-02-20 10:32:11');
INSERT INTO `emptable` VALUES ('15', '宾汉姆', '40', '开发员工', '123', '保密', '5558868', '2017-02-20 10:32:18', '2017-02-20 10:32:18');
INSERT INTO `emptable` VALUES ('16', '小冯', '20', '开发员工', '123', '男', '18180571939', '2017-02-20 10:36:25', '2017-02-20 10:36:25');
INSERT INTO `emptable` VALUES ('19', 'fx', '45', '项目经理', '123', '男', '535432563', '2017-02-21 17:37:28', '2017-02-20 15:32:54');
INSERT INTO `emptable` VALUES ('21', 'fentgxin', '22', '项目经理', '123456', '保密', '4563453', '2017-02-21 14:53:10', '2017-02-21 14:53:10');
INSERT INTO `emptable` VALUES ('22', '赵飞', '21', '开发员工', '123456', '男', '45635', '2017-02-21 17:36:35', '2017-02-21 17:36:35');
INSERT INTO `emptable` VALUES ('23', 'zhaojiang', '23', '开发员工', '123', '男', '58453', '2017-02-22 09:22:04', '2017-02-22 09:22:04');

-- ----------------------------
-- Table structure for positiontable
-- ----------------------------
DROP TABLE IF EXISTS `positiontable`;
CREATE TABLE `positiontable` (
  `iId` int(10) NOT NULL AUTO_INCREMENT,
  `iPositionid` smallint(10) NOT NULL,
  `sPosition` varchar(255) NOT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positiontable
-- ----------------------------
INSERT INTO `positiontable` VALUES ('1', '1', '管理员');
INSERT INTO `positiontable` VALUES ('2', '2', '项目经理');
INSERT INTO `positiontable` VALUES ('3', '3', '开发员');
INSERT INTO `positiontable` VALUES ('4', '4', '测试员');

-- ----------------------------
-- Table structure for projecttable
-- ----------------------------
DROP TABLE IF EXISTS `projecttable`;
CREATE TABLE `projecttable` (
  `iId` int(10) NOT NULL AUTO_INCREMENT,
  `sPname` varchar(255) NOT NULL,
  `sCustomer` varchar(255) NOT NULL,
  `sEstimatedtime` varchar(255) DEFAULT NULL,
  `sSpeed` varchar(255) DEFAULT NULL,
  `sType` varchar(255) NOT NULL,
  `iPerson1` smallint(10) DEFAULT NULL,
  `iPerson2` smallint(10) DEFAULT NULL,
  `iPerson3` smallint(10) DEFAULT NULL,
  `iPerson4` smallint(10) DEFAULT NULL,
  `iPerson5` smallint(10) DEFAULT NULL,
  `sAssess` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projecttable
-- ----------------------------
INSERT INTO `projecttable` VALUES ('3', '商城管理系统', '张先生', '2个月', '已完成', '开发', '10', '11', '20', '15', '22', '30');
INSERT INTO `projecttable` VALUES ('5', 'ssm人力资源系统', '赵先生', '1个月', '完成30%', '测试', '8', '9', null, null, null, '很好');
INSERT INTO `projecttable` VALUES ('8', '后台管理系统', '赵先生', '1个月', '已完成', '开发', '10', '15', '16', null, null, '100');
INSERT INTO `projecttable` VALUES ('9', 'we购物网站', '李先生', '2周', '刚开始', '测试', null, null, null, null, null, '60');

-- ----------------------------
-- Table structure for sextable
-- ----------------------------
DROP TABLE IF EXISTS `sextable`;
CREATE TABLE `sextable` (
  `iId` smallint(10) NOT NULL AUTO_INCREMENT,
  `iEmpid` smallint(10) NOT NULL,
  `sSex` varchar(255) NOT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sextable
-- ----------------------------
INSERT INTO `sextable` VALUES ('1', '1', '男');
INSERT INTO `sextable` VALUES ('2', '2', '女');
INSERT INTO `sextable` VALUES ('3', '3', '保密');

-- ----------------------------
-- Table structure for speedtable
-- ----------------------------
DROP TABLE IF EXISTS `speedtable`;
CREATE TABLE `speedtable` (
  `iId` int(10) NOT NULL AUTO_INCREMENT,
  `iProjectid` smallint(10) NOT NULL,
  `sSpeed` varchar(255) NOT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of speedtable
-- ----------------------------
INSERT INTO `speedtable` VALUES ('1', '1', '刚开始');
INSERT INTO `speedtable` VALUES ('2', '2', '完成10%');
INSERT INTO `speedtable` VALUES ('3', '3', '完成20%');
INSERT INTO `speedtable` VALUES ('4', '4', '完成30%');
INSERT INTO `speedtable` VALUES ('5', '5', '完成40%');
INSERT INTO `speedtable` VALUES ('6', '6', '完成50%');
INSERT INTO `speedtable` VALUES ('7', '7', '完成60%');
INSERT INTO `speedtable` VALUES ('8', '8', '完成70%');
INSERT INTO `speedtable` VALUES ('9', '9', '完成80%');
INSERT INTO `speedtable` VALUES ('10', '10', '完成90%');
INSERT INTO `speedtable` VALUES ('16', '11', '完成');
