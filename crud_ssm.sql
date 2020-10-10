/*
Navicat MySQL Data Transfer

Source Server         : mysql-8.0.16
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : crud_ssm

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-10-06 10:29:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dept_name` varchar(255) NOT NULL COMMENT '部门名',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '开发部');
INSERT INTO `tbl_dept` VALUES ('2', '测试部');
INSERT INTO `tbl_dept` VALUES ('3', '宣传部');

-- ----------------------------
-- Table structure for `tbl_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `emp_name` varchar(255) NOT NULL COMMENT '员工姓名',
  `gender` char(1) DEFAULT NULL COMMENT '员工性别',
  `email` varchar(255) DEFAULT NULL COMMENT '员工邮箱',
  `d_id` int(11) DEFAULT NULL COMMENT '部门外键',
  PRIMARY KEY (`emp_id`),
  KEY `tbl_emp_dept_fk` (`d_id`),
  CONSTRAINT `tbl_emp_dept_fk` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1', '韩天乐', 'M', '1056077429@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('2', '韩天喜', 'M', '16161315@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('3', '韩天琪', 'M', '161461656@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('4', '张三', 'W', 'zhangsan@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('5', '李四', 'W', 'lisi@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('6', '王五', 'M', 'wangwu@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('7', '赵六', 'W', 'zhaoliu@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('8', '04a304', 'F', '1546455@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('9', '33ade5', 'M', '33ade5@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('10', 'a78586', 'M', 'a78586@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('11', '47dbb7', 'M', '47dbb7@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('12', '222ad8', 'M', '222ad8@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('13', '02a5b9', 'M', '1546455@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('14', '3597c10', 'M', '3597c10@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('15', '13a3211', 'M', '13a3211@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('16', '4490412', 'M', '4490412@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('17', 'c032c13', 'M', 'c032c13@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('18', 'a3a0614', 'M', 'a3a0614@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('19', '6924515', 'M', '6924515@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('20', '2dc3016', 'M', '2dc3016@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('21', 'ca7dc17', 'M', 'ca7dc17@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('22', '5941518', 'M', '5941518@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('23', '228b819', 'M', '228b819@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('24', 'd78f920', 'M', 'd78f920@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('25', '2d15721', 'M', '2d15721@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('26', '9118822', 'M', '9118822@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('27', 'b947423', 'M', 'b947423@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('28', '5975824', 'M', '5975824@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('29', '4074325', 'M', '4074325@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('30', 'd09aa26', 'M', 'd09aa26@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('31', '759b627', 'M', '759b627@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('32', 'd58ff28', 'M', 'd58ff28@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('33', 'd27b429', 'M', 'd27b429@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('34', '6989c30', 'M', '6989c30@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('35', '75ad631', 'M', '75ad631@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('36', 'cf62e32', 'M', 'cf62e32@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('37', '55f8633', 'M', '55f8633@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('38', 'a231d34', 'M', 'a231d34@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('39', '11c6f35', 'M', '11c6f35@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('40', '4a52a36', 'M', '4a52a36@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('41', '1fb2637', 'M', '1fb2637@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('42', 'afe0c38', 'M', 'afe0c38@CCTV.com', '3');
INSERT INTO `tbl_emp` VALUES ('43', 'f0cd139', 'M', 'f0cd139@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('44', '3262c40', 'M', '3262c40@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('45', 'dc2c341', 'M', 'dc2c341@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('46', '5362542', 'M', '5362542@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('47', '8a3fc43', 'M', '8a3fc43@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('49', '5262145', 'M', '5262145@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('51', '503be47', 'M', '503be47@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('52', '4513848', 'M', '4513848@CCTV.com', '2');
INSERT INTO `tbl_emp` VALUES ('53', '68b4749', 'M', '68b4749@CCTV.com', '1');
INSERT INTO `tbl_emp` VALUES ('55', '皇太后黄金', 'M', '1056077429@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('56', '皇太后黄啊', 'M', '1056077429@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('57', '皇太后黄刚', 'M', '1056077429@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('58', '皇太后黄得', 'M', '1056077429@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('59', '皇太后黄他', 'M', '1056077429@qq.com', '3');
