/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ylsn_db

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-06 19:04:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `a_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `a_title` varchar(50) NOT NULL,
  `flag` varchar(5) NOT NULL DEFAULT '公开',
  `date` datetime NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('11', 'admin', '我的大学生活', '公开', '2017-03-26 15:28:52');
INSERT INTO `album` VALUES ('12', 'admin', '我的闺蜜', '公开', '2017-03-26 15:32:44');
INSERT INTO `album` VALUES ('13', 'admin', '旅行的意义', '公开', '2017-03-26 15:32:53');
INSERT INTO `album` VALUES ('14', 'admin', '我的高中', '公开', '2017-03-26 15:32:59');
INSERT INTO `album` VALUES ('15', 'admin', 'My Love', '公开', '2017-03-26 15:33:03');
INSERT INTO `album` VALUES ('16', 'admin', '专属', '私密', '2017-03-26 15:33:25');
INSERT INTO `album` VALUES ('17', 'admin', '痕迹', '私密', '2017-03-26 16:58:51');
INSERT INTO `album` VALUES ('18', 'feilong', 'Miss', '私密', '2017-03-26 18:33:40');
INSERT INTO `album` VALUES ('19', 'feilong', '我的大学生活', '公开', '2017-03-26 19:07:57');
INSERT INTO `album` VALUES ('20', 'admin', '我的时光', '公开', '2017-03-27 08:20:08');
INSERT INTO `album` VALUES ('21', 'admin', '我的音乐', '公开', '2017-03-27 13:07:54');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `s_id` int(5) NOT NULL,
  `c_content` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `friend`
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `u_id` varchar(10) NOT NULL,
  `f_id` varchar(10) NOT NULL,
  `friend` int(1) DEFAULT NULL,
  `f_feeling` int(1) DEFAULT NULL,
  `f_collection` int(1) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`,`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------

-- ----------------------------
-- Table structure for `information`
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `name` varchar(10) DEFAULT NULL,
  `u_id` varchar(10) NOT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `motto` text,
  `start` int(5) DEFAULT NULL,
  `friend` text,
  `f_feeling` text,
  `f_collection` text,
  `location` varchar(20) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `house` varchar(20) DEFAULT NULL,
  `have_child_not` varchar(5) DEFAULT NULL,
  `graduate_school` varchar(50) DEFAULT NULL,
  `height` int(2) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('白萍', 'admin', null, '柔情似水的世界，看似简单，却如此复杂…', '0', null, null, null, null, '55', 'B型', '汉族', '和家人同住', '没有', '岭南', '175');
INSERT INTO `information` VALUES ('飞龙', 'feilong', null, '人没有梦想，就和飞龙一样...', '0', null, null, null, null, '60', 'AB型', '汉族', '和家人同住', '没有', '岭南', '175');
INSERT INTO `information` VALUES ('龙', 'xianyu', null, null, '0', null, null, null, null, '62', 'AB型', '汉族', '已购房', '没有', '北鸟', '184');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `s_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `s_title` varchar(50) DEFAULT NULL,
  `s_content` text NOT NULL,
  `s_p_url` varchar(20) DEFAULT NULL,
  `startNum` int(5) DEFAULT '0',
  `readNum` int(5) DEFAULT '0',
  `flag` varchar(6) NOT NULL DEFAULT '动态',
  `date` datetime NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('1', 'admin', null, '#白骨精心得#1012:某新朋问我为什么别人赞我的时候我没什么反应, 答:我已经过了那个阶段,领悟到了人必须有自知之明,人的优秀是相对的,从不同的角度看,用不同的参照物做对比，结果都截然不同,所以无论赞弹,不必太介意,重点是你懂得知道怎样经营自己的工作,生活及快乐,懂得欣赏别人及看到自己的差距。 ​​​​', 'null', '0', '0', '动态', '2017-03-27 09:38:21');
INSERT INTO `share` VALUES ('2', 'admin', null, '执子之手，与子偕老！', 'null', '0', '0', '动态', '2017-03-27 09:39:23');
INSERT INTO `share` VALUES ('3', 'admin', null, '分享生活，留在感动！', 'null', '0', '0', '动态', '2017-03-27 09:41:29');
INSERT INTO `share` VALUES ('4', 'admin', null, '赠人玫瑰，手留余香。', 'null', '0', '0', '动态', '2017-03-27 11:30:04');
INSERT INTO `share` VALUES ('6', 'admin', null, '快乐和痛苦从来不会同时降临到一个人身上，但是如果你追求它们中的某一个并且有所体验，你几乎总是不得不体验到另一个，它们就像受同一个大脑指挥的两个躯体一样。——柏拉图', 'null', '0', '0', '动态', '2017-03-27 13:19:35');
INSERT INTO `share` VALUES ('7', 'admin', null, '原本以为我能将美好的回忆妥善打包，到头来却发现我能携走的只有虚无。', 'null', '0', '0', '动态', '2017-03-27 13:26:45');
INSERT INTO `share` VALUES ('8', 'admin', null, '我知道，思念这庸俗的字眼，将如阳光下的黑影，我逃他追，我追他逃，一辈子。', 'null', '0', '0', '动态', '2017-03-27 13:30:53');
INSERT INTO `share` VALUES ('25', 'feilong', null, '我知道这是一个错，可漠然的表情总是悄然而过;我知道我该收起这份失落，可最在乎的牵挂已涌入心窝。', 'null', '0', '0', '动态', '2017-04-05 13:57:26');
INSERT INTO `share` VALUES ('26', 'feilong', null, '又是一年，清明雨上。', '', '0', '0', '愿望', '2017-04-05 13:58:10');

-- ----------------------------
-- Table structure for `unloadphotoalbum`
-- ----------------------------
DROP TABLE IF EXISTS `unloadphotoalbum`;
CREATE TABLE `unloadphotoalbum` (
  `u_p_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `a_id` int(5) NOT NULL,
  `a_p_url` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`u_p_id`),
  KEY `u_id` (`u_id`),
  KEY `a_id` (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unloadphotoalbum
-- ----------------------------
INSERT INTO `unloadphotoalbum` VALUES ('13', 'admin', '15', './upload/wishingTree.jpg', '2017-03-26 15:34:35');
INSERT INTO `unloadphotoalbum` VALUES ('14', 'admin', '13', './upload/1.jpg', '2017-03-26 15:35:00');
INSERT INTO `unloadphotoalbum` VALUES ('15', 'admin', '16', './upload/P50920-083001.jpg', '2017-03-26 15:35:40');
INSERT INTO `unloadphotoalbum` VALUES ('16', 'admin', '14', './upload/P50905-111506.jpg', '2017-03-26 15:35:53');
INSERT INTO `unloadphotoalbum` VALUES ('11', 'admin', '12', './upload/photoalbum4.jpg', '2017-03-26 15:33:41');
INSERT INTO `unloadphotoalbum` VALUES ('12', 'admin', '11', './upload/photoalbum5.jpg', '2017-03-26 15:34:10');
INSERT INTO `unloadphotoalbum` VALUES ('17', 'admin', '14', './upload/P50904-202234.jpg', '2017-03-26 16:49:54');
INSERT INTO `unloadphotoalbum` VALUES ('18', 'admin', '11', './upload/P50902-185640.jpg', '2017-03-26 18:28:27');
INSERT INTO `unloadphotoalbum` VALUES ('19', 'admin', '11', './upload/photoalbum1.jpg', '2017-03-26 18:31:17');
INSERT INTO `unloadphotoalbum` VALUES ('20', 'admin', '17', './upload/slide1.png', '2017-03-26 18:32:02');
INSERT INTO `unloadphotoalbum` VALUES ('21', 'feilong', '18', './upload/photoalbum4.jpg', '2017-03-26 18:33:53');
INSERT INTO `unloadphotoalbum` VALUES ('22', 'admin', '20', './upload/blackMatte.png', '2017-03-27 08:20:27');
INSERT INTO `unloadphotoalbum` VALUES ('25', 'admin', '21', './upload/1.png', '2017-03-27 13:11:33');
INSERT INTO `unloadphotoalbum` VALUES ('27', 'feilong', '19', './upload/psb .jpg', '2017-04-03 01:04:50');
INSERT INTO `unloadphotoalbum` VALUES ('28', 'feilong', '19', './upload/1.jpg', '2017-04-03 01:24:06');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(15) NOT NULL,
  `u_id` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `email` varchar(20) NOT NULL,
  `i_p_url` text,
  `age` int(3) DEFAULT NULL,
  `tall` int(3) DEFAULT NULL,
  `salary` int(5) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('Miss', 'admin', '123123123', '女', 'Miss@qq.com', './upload/photoalbum1.jpg', '30', '175', '12000', '广东省', '茂名市', '化州市', '2017-04-06 17:20:11');
INSERT INTO `user` VALUES ('飞龙', 'feilong', '123123123', '男', 'feilong@qq.com', './upload/test.jpg', '0', '0', '0', '广东省', '茂名市', '信宜市', '2017-04-05 13:56:19');
INSERT INTO `user` VALUES ('咸鱼', 'xianyu', '123123123', '男', 'xianyu@qq.com', './upload/guys.jpg', '0', '0', '0', null, null, null, '2017-04-05 09:31:19');
