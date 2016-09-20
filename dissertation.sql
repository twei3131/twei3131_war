/*
Navicat MySQL Data Transfer

Source Server         : bysx
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : dissertation

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-09-20 08:32:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classId` varchar(15) NOT NULL,
  `departmentId` varchar(15) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `instructorId` varchar(15) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('20001', '10001', '3', 'ins0001', '应用1班');
INSERT INTO `classes` VALUES ('20002', '10001', '3', 'ins0001', '应用2班');
INSERT INTO `classes` VALUES ('20003', '10001', '3', 'ins0001', '应用3班');
INSERT INTO `classes` VALUES ('20004', '10001', '3', 'ins0002', '软件1班');
INSERT INTO `classes` VALUES ('20005', '10002', '3', 'ins0002', '软件2班');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` varchar(15) NOT NULL,
  `departmentName` varchar(255) NOT NULL,
  `departmentLeaderId` varchar(15) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '信息技术系', '0001');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gradeId` int(11) NOT NULL,
  `name` varchar(2) NOT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '大一');
INSERT INTO `grade` VALUES ('2', '大二');
INSERT INTO `grade` VALUES ('3', '大三');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `groupId` varchar(15) NOT NULL,
  `studentId` varchar(15) DEFAULT NULL,
  `classId` varchar(15) DEFAULT NULL,
  `teacherId` varchar(15) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('gp0001', null, '20003', 'tea0001', '1', null);
INSERT INTO `group` VALUES ('gp0002', '14302189', null, 'tea0002', '2', null);
INSERT INTO `group` VALUES ('gp0002', '14302191', null, 'tea0002', '3', null);
INSERT INTO `group` VALUES ('gp0006', '14302179', '', 'tea0006', '4', '简介');

-- ----------------------------
-- Table structure for grouptosubject
-- ----------------------------
DROP TABLE IF EXISTS `grouptosubject`;
CREATE TABLE `grouptosubject` (
  `groupId` varchar(15) NOT NULL,
  `subjectId` varchar(15) NOT NULL,
  PRIMARY KEY (`groupId`,`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grouptosubject
-- ----------------------------
INSERT INTO `grouptosubject` VALUES ('gp0001', 'sub0001');
INSERT INTO `grouptosubject` VALUES ('gp0002', 'sub0003');
INSERT INTO `grouptosubject` VALUES ('gp0006', 'sub0006');

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `instructorId` varchar(15) NOT NULL,
  `instructorName` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`instructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instructor
-- ----------------------------
INSERT INTO `instructor` VALUES ('ins0001', '张丽娜', '15715176943', '123456');
INSERT INTO `instructor` VALUES ('ins0002', '张强', '1234566.0', 'none');

-- ----------------------------
-- Table structure for signerror
-- ----------------------------
DROP TABLE IF EXISTS `signerror`;
CREATE TABLE `signerror` (
  `studentId` varchar(25) NOT NULL,
  `teacherId` varchar(25) NOT NULL,
  `subjectId` varchar(25) NOT NULL,
  `state` enum('未到','正常','迟到','早退','旷课','正常下课','迟到下课','请假','带假上课','迟到早退') NOT NULL DEFAULT '未到',
  `auditState` enum('未审核','已审核','撤销') NOT NULL DEFAULT '未审核',
  `times` int(11) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studentId`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signerror
-- ----------------------------
INSERT INTO `signerror` VALUES ('14302189', 'tea0002', 'sub0003', '迟到下课', '未审核', '1', 'Tue Sep 20 08:30:11 CST 2016');
INSERT INTO `signerror` VALUES ('14302191', 'tea0002', 'sub0003', '旷课', '未审核', '1', 'Tue Sep 20 08:30:11 CST 2016');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` varchar(15) NOT NULL,
  `studentName` varchar(255) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('14302179', '邢梦颖', '10001', '20003', 'none');
INSERT INTO `student` VALUES ('14302189', '陶伟', '10001', '20003', '170410');
INSERT INTO `student` VALUES ('14302191', '陈建生', '10001', '20001', '123456');
INSERT INTO `student` VALUES ('14302195', '张弘毅', '10001', '20003', 'none');
INSERT INTO `student` VALUES ('14302283', '蔡俊', '10001', '20003', 'none');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subjectId` varchar(10) NOT NULL,
  `subjectName` varchar(255) NOT NULL,
  `classNumber` int(11) NOT NULL,
  `type` enum('选修','必修') NOT NULL DEFAULT '必修',
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('sub0001', 'JAVA编程基础', '20', '必修');
INSERT INTO `subject` VALUES ('sub0002', 'C#编程基础', '25', '必修');
INSERT INTO `subject` VALUES ('sub0003', '数据结构', '18', '选修');
INSERT INTO `subject` VALUES ('sub0006', '网络原理', '3', '选修');

-- ----------------------------
-- Table structure for subjectinfo
-- ----------------------------
DROP TABLE IF EXISTS `subjectinfo`;
CREATE TABLE `subjectinfo` (
  `subjectInfoId` int(11) NOT NULL,
  `teacherId` varchar(25) NOT NULL,
  `subjectId` varchar(25) NOT NULL,
  `state` enum('未开始','即将开始','上课中','下课','放学') NOT NULL DEFAULT '未开始',
  PRIMARY KEY (`subjectInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjectinfo
-- ----------------------------
INSERT INTO `subjectinfo` VALUES ('1', 'tea0002', 'sub0003', '放学');

-- ----------------------------
-- Table structure for subjecttoteacher
-- ----------------------------
DROP TABLE IF EXISTS `subjecttoteacher`;
CREATE TABLE `subjecttoteacher` (
  `subjectId` varchar(15) NOT NULL,
  `teacherId` varchar(15) NOT NULL,
  PRIMARY KEY (`subjectId`,`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjecttoteacher
-- ----------------------------
INSERT INTO `subjecttoteacher` VALUES ('sub0001', 'tea0001');
INSERT INTO `subjecttoteacher` VALUES ('sub0002', 'tea0002');
INSERT INTO `subjecttoteacher` VALUES ('sub0003', 'tea0002');
INSERT INTO `subjecttoteacher` VALUES ('sub0006', 'tea0003');

-- ----------------------------
-- Table structure for subjecttotimes
-- ----------------------------
DROP TABLE IF EXISTS `subjecttotimes`;
CREATE TABLE `subjecttotimes` (
  `subjectId` varchar(15) NOT NULL,
  `timesId` varchar(15) NOT NULL,
  PRIMARY KEY (`subjectId`,`timesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjecttotimes
-- ----------------------------
INSERT INTO `subjecttotimes` VALUES ('sub0001', '4');
INSERT INTO `subjecttotimes` VALUES ('sub0002', '5');
INSERT INTO `subjecttotimes` VALUES ('sub0003', '4');
INSERT INTO `subjecttotimes` VALUES ('sub0006', '6');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` varchar(15) NOT NULL,
  `teacherName` varchar(255) NOT NULL,
  `departmentId` varchar(15) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'none',
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('tea0001', '夏孝云', '10001', '11');
INSERT INTO `teacher` VALUES ('tea0002', '茅雪梅', '10001', '13');
INSERT INTO `teacher` VALUES ('tea0003', '张月', '10001', 'none');

-- ----------------------------
-- Table structure for tempsign
-- ----------------------------
DROP TABLE IF EXISTS `tempsign`;
CREATE TABLE `tempsign` (
  `studentId` varchar(25) NOT NULL,
  `teacherId` varchar(25) NOT NULL,
  `subjectId` varchar(25) NOT NULL,
  `state` enum('未到','正常','迟到','早退','旷课','正常下课','迟到下课','请假','带假上课','迟到早退') NOT NULL DEFAULT '未到',
  `scanState` enum('true','false') NOT NULL DEFAULT 'false',
  `hostname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentId`,`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tempsign
-- ----------------------------

-- ----------------------------
-- Table structure for times
-- ----------------------------
DROP TABLE IF EXISTS `times`;
CREATE TABLE `times` (
  `days` int(11) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `timesId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`timesId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of times
-- ----------------------------
INSERT INTO `times` VALUES ('1', '08:00:00', '12:00:00', '1');
INSERT INTO `times` VALUES ('1', '13:30:00', '17:30:00', '2');
INSERT INTO `times` VALUES ('1', '19:00:00', '21:00:00', '3');
INSERT INTO `times` VALUES ('2', '08:00:00', '12:00:00', '4');
INSERT INTO `times` VALUES ('2', '13:30:00', '17:30:00', '5');
INSERT INTO `times` VALUES ('2', '19:00:00', '21:00:00', '6');
INSERT INTO `times` VALUES ('3', '08:00:00', '12:00:00', '7');
INSERT INTO `times` VALUES ('3', '13:30:00', '17:30:00', '8');
INSERT INTO `times` VALUES ('3', '19:00:00', '21:00:00', '9');
INSERT INTO `times` VALUES ('4', '08:00:00', '12:00:00', '10');
INSERT INTO `times` VALUES ('4', '13:30:00', '17:30:00', '11');
INSERT INTO `times` VALUES ('4', '19:00:00', '21:00:00', '12');
INSERT INTO `times` VALUES ('5', '08:00:00', '12:00:00', '13');
INSERT INTO `times` VALUES ('5', '13:30:00', '17:30:00', '14');
INSERT INTO `times` VALUES ('5', '19:00:00', '21:00:00', '15');
SET FOREIGN_KEY_CHECKS=1;
