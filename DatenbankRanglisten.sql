/*
Navicat MySQL Data Transfer

Source Server         : vm
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : Standard

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2015-03-22 20:12:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `persons`
-- ----------------------------
DROP TABLE IF EXISTS `persons`;
CREATE TABLE `persons` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nachname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of persons
-- ----------------------------
INSERT INTO `persons` VALUES ('1', 'Hans', 'Bergmann', '1');
INSERT INTO `persons` VALUES ('2', 'Klaus', 'Müller', '1');
INSERT INTO `persons` VALUES ('3', 'Johannes', 'Herrmann', '1');
INSERT INTO `persons` VALUES ('4', 'Jasmin', 'Freitag', '2');
INSERT INTO `persons` VALUES ('5', 'Martin', 'Hausler', '2');
INSERT INTO `persons` VALUES ('6', 'Stefanie', 'Neuhaus', '2');
INSERT INTO `persons` VALUES ('7', 'Birgit', 'Bauer', '3');
INSERT INTO `persons` VALUES ('8', 'Amy', 'Dam', '3');
INSERT INTO `persons` VALUES ('9', 'Tia', 'Klose', '3');
INSERT INTO `persons` VALUES ('10', 'Sebastian', 'Rusko', '4');
INSERT INTO `persons` VALUES ('11', 'Alexander', 'Breit', '4');
INSERT INTO `persons` VALUES ('12', 'Harald', 'Konig', '4');
INSERT INTO `persons` VALUES ('13', 'Sandro', 'Kant', '5');
INSERT INTO `persons` VALUES ('14', 'Christoph', 'Lauter', '5');
INSERT INTO `persons` VALUES ('15', 'Heinz', 'Ketch', '5');

-- ----------------------------
-- Table structure for `result_simple`
-- ----------------------------
DROP TABLE IF EXISTS `result_simple`;
CREATE TABLE `result_simple` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of result_simple
-- ----------------------------
INSERT INTO `result_simple` VALUES ('1', '1', '49');
INSERT INTO `result_simple` VALUES ('2', '2', '71');
INSERT INTO `result_simple` VALUES ('3', '3', '44');
INSERT INTO `result_simple` VALUES ('4', '4', '40');
INSERT INTO `result_simple` VALUES ('5', '5', '52');
INSERT INTO `result_simple` VALUES ('6', '6', '48');
INSERT INTO `result_simple` VALUES ('7', '7', '49');
INSERT INTO `result_simple` VALUES ('8', '8', '42');
INSERT INTO `result_simple` VALUES ('9', '9', '54');
INSERT INTO `result_simple` VALUES ('10', '10', '50');
INSERT INTO `result_simple` VALUES ('11', '11', '64');
INSERT INTO `result_simple` VALUES ('12', '12', '51');
INSERT INTO `result_simple` VALUES ('13', '13', '67');
INSERT INTO `result_simple` VALUES ('14', '14', '60');
INSERT INTO `result_simple` VALUES ('15', '15', '38');

-- ----------------------------
-- Table structure for `results`
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `round` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES ('1', '1', '1', '8');
INSERT INTO `results` VALUES ('2', '1', '2', '9');
INSERT INTO `results` VALUES ('3', '1', '3', '3');
INSERT INTO `results` VALUES ('4', '1', '4', '5');
INSERT INTO `results` VALUES ('5', '1', '5', '6');
INSERT INTO `results` VALUES ('6', '1', '6', '5');
INSERT INTO `results` VALUES ('7', '1', '7', '7');
INSERT INTO `results` VALUES ('8', '1', '8', '3');
INSERT INTO `results` VALUES ('9', '1', '9', '1');
INSERT INTO `results` VALUES ('10', '1', '10', '4');
INSERT INTO `results` VALUES ('11', '1', '11', '6');
INSERT INTO `results` VALUES ('12', '1', '12', '2');
INSERT INTO `results` VALUES ('13', '1', '13', '8');
INSERT INTO `results` VALUES ('14', '1', '14', '5');
INSERT INTO `results` VALUES ('15', '1', '15', '1');
INSERT INTO `results` VALUES ('16', '2', '1', '8');
INSERT INTO `results` VALUES ('17', '2', '2', '4');
INSERT INTO `results` VALUES ('18', '2', '3', '2');
INSERT INTO `results` VALUES ('19', '2', '4', '1');
INSERT INTO `results` VALUES ('20', '2', '5', '4');
INSERT INTO `results` VALUES ('21', '2', '6', '1');
INSERT INTO `results` VALUES ('22', '2', '7', '2');
INSERT INTO `results` VALUES ('23', '2', '8', '4');
INSERT INTO `results` VALUES ('24', '2', '9', '6');
INSERT INTO `results` VALUES ('25', '2', '10', '7');
INSERT INTO `results` VALUES ('26', '2', '11', '7');
INSERT INTO `results` VALUES ('27', '2', '12', '5');
INSERT INTO `results` VALUES ('28', '2', '13', '3');
INSERT INTO `results` VALUES ('29', '2', '14', '8');
INSERT INTO `results` VALUES ('30', '2', '15', '2');
INSERT INTO `results` VALUES ('31', '3', '1', '7');
INSERT INTO `results` VALUES ('32', '3', '2', '7');
INSERT INTO `results` VALUES ('33', '3', '3', '7');
INSERT INTO `results` VALUES ('34', '3', '4', '2');
INSERT INTO `results` VALUES ('35', '3', '5', '7');
INSERT INTO `results` VALUES ('36', '3', '6', '3');
INSERT INTO `results` VALUES ('37', '3', '7', '2');
INSERT INTO `results` VALUES ('38', '3', '8', '1');
INSERT INTO `results` VALUES ('39', '3', '9', '7');
INSERT INTO `results` VALUES ('40', '3', '10', '5');
INSERT INTO `results` VALUES ('41', '3', '11', '3');
INSERT INTO `results` VALUES ('42', '3', '12', '8');
INSERT INTO `results` VALUES ('43', '3', '13', '5');
INSERT INTO `results` VALUES ('44', '3', '14', '9');
INSERT INTO `results` VALUES ('45', '3', '15', '1');
INSERT INTO `results` VALUES ('46', '4', '1', '6');
INSERT INTO `results` VALUES ('47', '4', '2', '7');
INSERT INTO `results` VALUES ('48', '4', '3', '1');
INSERT INTO `results` VALUES ('49', '4', '4', '9');
INSERT INTO `results` VALUES ('50', '4', '5', '6');
INSERT INTO `results` VALUES ('51', '4', '6', '9');
INSERT INTO `results` VALUES ('52', '4', '7', '3');
INSERT INTO `results` VALUES ('53', '4', '8', '3');
INSERT INTO `results` VALUES ('54', '4', '9', '5');
INSERT INTO `results` VALUES ('55', '4', '10', '7');
INSERT INTO `results` VALUES ('56', '4', '11', '9');
INSERT INTO `results` VALUES ('57', '4', '12', '7');
INSERT INTO `results` VALUES ('58', '4', '13', '8');
INSERT INTO `results` VALUES ('59', '4', '14', '9');
INSERT INTO `results` VALUES ('60', '4', '15', '4');
INSERT INTO `results` VALUES ('61', '5', '1', '7');
INSERT INTO `results` VALUES ('62', '5', '2', '8');
INSERT INTO `results` VALUES ('63', '5', '3', '8');
INSERT INTO `results` VALUES ('64', '5', '4', '6');
INSERT INTO `results` VALUES ('65', '5', '5', '4');
INSERT INTO `results` VALUES ('66', '5', '6', '3');
INSERT INTO `results` VALUES ('67', '5', '7', '2');
INSERT INTO `results` VALUES ('68', '5', '8', '9');
INSERT INTO `results` VALUES ('69', '5', '9', '3');
INSERT INTO `results` VALUES ('70', '5', '10', '3');
INSERT INTO `results` VALUES ('71', '5', '11', '9');
INSERT INTO `results` VALUES ('72', '5', '12', '7');
INSERT INTO `results` VALUES ('73', '5', '13', '9');
INSERT INTO `results` VALUES ('74', '5', '14', '3');
INSERT INTO `results` VALUES ('75', '5', '15', '8');
INSERT INTO `results` VALUES ('76', '6', '1', '1');
INSERT INTO `results` VALUES ('77', '6', '2', '9');
INSERT INTO `results` VALUES ('78', '6', '3', '7');
INSERT INTO `results` VALUES ('79', '6', '4', '5');
INSERT INTO `results` VALUES ('80', '6', '5', '5');
INSERT INTO `results` VALUES ('81', '6', '6', '8');
INSERT INTO `results` VALUES ('82', '6', '7', '8');
INSERT INTO `results` VALUES ('83', '6', '8', '4');
INSERT INTO `results` VALUES ('84', '6', '9', '8');
INSERT INTO `results` VALUES ('85', '6', '10', '7');
INSERT INTO `results` VALUES ('86', '6', '11', '9');
INSERT INTO `results` VALUES ('87', '6', '12', '9');
INSERT INTO `results` VALUES ('88', '6', '13', '6');
INSERT INTO `results` VALUES ('89', '6', '14', '3');
INSERT INTO `results` VALUES ('90', '6', '15', '7');
INSERT INTO `results` VALUES ('91', '7', '1', '7');
INSERT INTO `results` VALUES ('92', '7', '2', '3');
INSERT INTO `results` VALUES ('93', '7', '3', '5');
INSERT INTO `results` VALUES ('94', '7', '4', '4');
INSERT INTO `results` VALUES ('95', '7', '5', '7');
INSERT INTO `results` VALUES ('96', '7', '6', '4');
INSERT INTO `results` VALUES ('97', '7', '7', '9');
INSERT INTO `results` VALUES ('98', '7', '8', '2');
INSERT INTO `results` VALUES ('99', '7', '9', '2');
INSERT INTO `results` VALUES ('100', '7', '10', '4');
INSERT INTO `results` VALUES ('101', '7', '11', '5');
INSERT INTO `results` VALUES ('102', '7', '12', '1');
INSERT INTO `results` VALUES ('103', '7', '13', '9');
INSERT INTO `results` VALUES ('104', '7', '14', '6');
INSERT INTO `results` VALUES ('105', '7', '15', '2');
INSERT INTO `results` VALUES ('106', '8', '1', '1');
INSERT INTO `results` VALUES ('107', '8', '2', '9');
INSERT INTO `results` VALUES ('108', '8', '3', '4');
INSERT INTO `results` VALUES ('109', '8', '4', '1');
INSERT INTO `results` VALUES ('110', '8', '5', '1');
INSERT INTO `results` VALUES ('111', '8', '6', '2');
INSERT INTO `results` VALUES ('112', '8', '7', '7');
INSERT INTO `results` VALUES ('113', '8', '8', '2');
INSERT INTO `results` VALUES ('114', '8', '9', '7');
INSERT INTO `results` VALUES ('115', '8', '10', '9');
INSERT INTO `results` VALUES ('116', '8', '11', '6');
INSERT INTO `results` VALUES ('117', '8', '12', '3');
INSERT INTO `results` VALUES ('118', '8', '13', '4');
INSERT INTO `results` VALUES ('119', '8', '14', '3');
INSERT INTO `results` VALUES ('120', '8', '15', '9');
INSERT INTO `results` VALUES ('121', '9', '1', '2');
INSERT INTO `results` VALUES ('122', '9', '2', '9');
INSERT INTO `results` VALUES ('123', '9', '3', '1');
INSERT INTO `results` VALUES ('124', '9', '4', '4');
INSERT INTO `results` VALUES ('125', '9', '5', '7');
INSERT INTO `results` VALUES ('126', '9', '6', '7');
INSERT INTO `results` VALUES ('127', '9', '7', '2');
INSERT INTO `results` VALUES ('128', '9', '8', '6');
INSERT INTO `results` VALUES ('129', '9', '9', '6');
INSERT INTO `results` VALUES ('130', '9', '10', '3');
INSERT INTO `results` VALUES ('131', '9', '11', '4');
INSERT INTO `results` VALUES ('132', '9', '12', '2');
INSERT INTO `results` VALUES ('133', '9', '13', '6');
INSERT INTO `results` VALUES ('134', '9', '14', '8');
INSERT INTO `results` VALUES ('135', '9', '15', '2');
INSERT INTO `results` VALUES ('136', '10', '1', '2');
INSERT INTO `results` VALUES ('137', '10', '2', '6');
INSERT INTO `results` VALUES ('138', '10', '3', '6');
INSERT INTO `results` VALUES ('139', '10', '4', '3');
INSERT INTO `results` VALUES ('140', '10', '5', '5');
INSERT INTO `results` VALUES ('141', '10', '6', '6');
INSERT INTO `results` VALUES ('142', '10', '7', '7');
INSERT INTO `results` VALUES ('143', '10', '8', '8');
INSERT INTO `results` VALUES ('144', '10', '9', '9');
INSERT INTO `results` VALUES ('145', '10', '10', '1');
INSERT INTO `results` VALUES ('146', '10', '11', '6');
INSERT INTO `results` VALUES ('147', '10', '12', '7');
INSERT INTO `results` VALUES ('148', '10', '13', '9');
INSERT INTO `results` VALUES ('149', '10', '14', '6');
INSERT INTO `results` VALUES ('150', '10', '15', '2');

-- ----------------------------
-- Table structure for `teams`
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('1', 'Lumpis');
INSERT INTO `teams` VALUES ('2', 'Luxe');
INSERT INTO `teams` VALUES ('3', 'Zoidinators');
INSERT INTO `teams` VALUES ('4', 'Sloths');
INSERT INTO `teams` VALUES ('5', 'Winnersquad');
