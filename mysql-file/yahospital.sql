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

 Date: 17/12/2019 21:34:18
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

SET FOREIGN_KEY_CHECKS = 1;
