/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : pjwz

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 18/05/2019 22:29:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classs
-- ----------------------------
DROP TABLE IF EXISTS `classs`;
CREATE TABLE `classs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classs
-- ----------------------------
INSERT INTO `classs` VALUES (1, '777', 0);
INSERT INTO `classs` VALUES (2, '333', 1);
INSERT INTO `classs` VALUES (3, '222', 2);
INSERT INTO `classs` VALUES (4, '111', 2);
INSERT INTO `classs` VALUES (5, '测试中文', 0);

-- ----------------------------
-- Table structure for kcb
-- ----------------------------
DROP TABLE IF EXISTS `kcb`;
CREATE TABLE `kcb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kcb
-- ----------------------------
INSERT INTO `kcb` VALUES (1, 'ccccc', 0);
INSERT INTO `kcb` VALUES (2, 'ccccc', 0);
INSERT INTO `kcb` VALUES (3, '33333444', 1);
INSERT INTO `kcb` VALUES (4, 'eeeeeeeeeeeeeeeeeee', 1);
INSERT INTO `kcb` VALUES (5, 'undefined', 0);
INSERT INTO `kcb` VALUES (6, '222', 1);
INSERT INTO `kcb` VALUES (7, NULL, 1);
INSERT INTO `kcb` VALUES (8, '测试中文', 1);

-- ----------------------------
-- Table structure for pjjgb
-- ----------------------------
DROP TABLE IF EXISTS `pjjgb`;
CREATE TABLE `pjjgb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjnrqrb_id` int(11) NULL DEFAULT NULL,
  `fen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `pjxxb_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pjjgb
-- ----------------------------
INSERT INTO `pjjgb` VALUES (1, 5, 'A', 3, 4);
INSERT INTO `pjjgb` VALUES (2, 6, 'D', 3, 4);
INSERT INTO `pjjgb` VALUES (3, 7, 'C', 3, 4);
INSERT INTO `pjjgb` VALUES (4, 8, 'C', 3, 4);

-- ----------------------------
-- Table structure for pjnrb
-- ----------------------------
DROP TABLE IF EXISTS `pjnrb`;
CREATE TABLE `pjnrb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pjnrb
-- ----------------------------
INSERT INTO `pjnrb` VALUES (1, '8888888888888');
INSERT INTO `pjnrb` VALUES (6, '测试中文');
INSERT INTO `pjnrb` VALUES (3, '666666666666666666');
INSERT INTO `pjnrb` VALUES (4, '55555555555555');
INSERT INTO `pjnrb` VALUES (5, '44444444444444');

-- ----------------------------
-- Table structure for pjnrqrb
-- ----------------------------
DROP TABLE IF EXISTS `pjnrqrb`;
CREATE TABLE `pjnrqrb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjxxb_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pjnrqrb
-- ----------------------------
INSERT INTO `pjnrqrb` VALUES (1, 3, '8888888888888');
INSERT INTO `pjnrqrb` VALUES (2, 3, '666666666666666666');
INSERT INTO `pjnrqrb` VALUES (3, 3, '55555555555555');
INSERT INTO `pjnrqrb` VALUES (4, 3, '44444444444444');
INSERT INTO `pjnrqrb` VALUES (5, 4, '8888888888888');
INSERT INTO `pjnrqrb` VALUES (6, 4, '666666666666666666');
INSERT INTO `pjnrqrb` VALUES (7, 4, '55555555555555');
INSERT INTO `pjnrqrb` VALUES (8, 4, '44444444444444');
INSERT INTO `pjnrqrb` VALUES (9, 5, '8888888888888');
INSERT INTO `pjnrqrb` VALUES (10, 5, '666666666666666666');
INSERT INTO `pjnrqrb` VALUES (11, 5, '55555555555555');
INSERT INTO `pjnrqrb` VALUES (12, 5, '44444444444444');
INSERT INTO `pjnrqrb` VALUES (13, 6, '8888888888888');
INSERT INTO `pjnrqrb` VALUES (14, 6, '666666666666666666');
INSERT INTO `pjnrqrb` VALUES (15, 6, '55555555555555');
INSERT INTO `pjnrqrb` VALUES (16, 6, '44444444444444');
INSERT INTO `pjnrqrb` VALUES (17, 7, '8888888888888');
INSERT INTO `pjnrqrb` VALUES (18, 7, '666666666666666666');
INSERT INTO `pjnrqrb` VALUES (19, 7, '55555555555555');
INSERT INTO `pjnrqrb` VALUES (20, 7, '44444444444444');

-- ----------------------------
-- Table structure for pjxxb
-- ----------------------------
DROP TABLE IF EXISTS `pjxxb`;
CREATE TABLE `pjxxb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) NULL DEFAULT NULL,
  `kcb_id` int(11) NULL DEFAULT NULL,
  `classs_id` int(11) NULL DEFAULT NULL,
  `flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pjxxb
-- ----------------------------
INSERT INTO `pjxxb` VALUES (1, 2, 3, 2, 4);
INSERT INTO `pjxxb` VALUES (2, 2, 3, 3, 4);
INSERT INTO `pjxxb` VALUES (3, 2, 4, 2, 4);
INSERT INTO `pjxxb` VALUES (4, 2, 3, 2, 1);
INSERT INTO `pjxxb` VALUES (5, 2, 6, 2, 2);
INSERT INTO `pjxxb` VALUES (6, 2, 4, 2, 3);
INSERT INTO `pjxxb` VALUES (7, 2, 3, 3, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bj_id` int(11) NULL DEFAULT NULL,
  `flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'adddd', '13000000000', NULL, 2);
INSERT INTO `user` VALUES (2, 'tea', 'tea', 't', '13000000001', NULL, 1);
INSERT INTO `user` VALUES (3, 'stu', 'stu', 'stu0', '13000000002', 2, 0);
INSERT INTO `user` VALUES (4, 'stu1', 'stu', NULL, '13000000003', 2, 0);
INSERT INTO `user` VALUES (5, 'stu2', 'stu', 'stu2', '13000000006', 2, 5);

SET FOREIGN_KEY_CHECKS = 1;
