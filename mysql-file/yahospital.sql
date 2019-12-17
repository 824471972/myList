/*
 Navicat Premium Data Transfer

 Source Server         : yunSQL
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 123.56.5.186:3306
 Source Schema         : yahospital

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 17/12/2019 22:19:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for idtext
-- ----------------------------
DROP TABLE IF EXISTS `idtext`;
CREATE TABLE `idtext`  (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pw` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persionKind` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of idtext
-- ----------------------------
INSERT INTO `idtext` VALUES ('1234567', '1234567', 'patient');
INSERT INTO `idtext` VALUES ('2222222', '2222222', 'patient');
INSERT INTO `idtext` VALUES ('5201314', '5201314', 'doctor');

-- ----------------------------
-- Table structure for patientorder
-- ----------------------------
DROP TABLE IF EXISTS `patientorder`;
CREATE TABLE `patientorder`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `serverKind` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patientorder
-- ----------------------------
INSERT INTO `patientorder` VALUES ('111', '1111', '女', '1111', '丁', '1111', '11111');
INSERT INTO `patientorder` VALUES ('11456', '123', '女', '25', '丙', '5456', '12342782');
INSERT INTO `patientorder` VALUES ('1234567891', '小黄', '女', '18', '', '1', '她要拔牙');
INSERT INTO `patientorder` VALUES ('241', '134', '男', '143', '甲', '413', '413');
INSERT INTO `patientorder` VALUES ('5213', '小明', '男', '13', '丙', '2019-12-04', '洗牙啊');
INSERT INTO `patientorder` VALUES ('564245', '测试3', '女', '456', '丙', '456', '452725');
INSERT INTO `patientorder` VALUES ('66666', '小黄', '女', '18', '', '1', '她要拔牙');
INSERT INTO `patientorder` VALUES ('77777', '小gay', '女', '18', '', '1', '她要洗牙');
INSERT INTO `patientorder` VALUES ('852', '测试2', '男', '5654', '丙', '456', '278225');
INSERT INTO `patientorder` VALUES ('999999', 'SQL云服务器', '女', '18', '刚刚', '1', 'SQL云服务');

SET FOREIGN_KEY_CHECKS = 1;
