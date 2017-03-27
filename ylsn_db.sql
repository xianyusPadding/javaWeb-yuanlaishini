/*
Navicat MySQL Data Transfer

Source Server         : mySql
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : ylsn_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-03-27 13:37:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `a_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `a_title` varchar(50) NOT NULL,
  `flag` varchar(5) NOT NULL default '公开',
  `date` datetime NOT NULL,
  PRIMARY KEY  (`a_id`),
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
INSERT INTO `album` VALUES ('18', 'feilong', 'Miss', '公开', '2017-03-26 18:33:40');
INSERT INTO `album` VALUES ('19', 'feilong', '我的大学生活', '公开', '2017-03-26 19:07:57');
INSERT INTO `album` VALUES ('20', 'admin', '我的时光', '公开', '2017-03-27 08:20:08');
INSERT INTO `album` VALUES ('21', 'admin', '我的音乐', '公开', '2017-03-27 13:07:54');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `s_id` int(5) NOT NULL,
  `c_content` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`c_id`),
  KEY `u_id` (`u_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `s_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `s_title` varchar(50) default NULL,
  `s_content` text NOT NULL,
  `s_p_url` varchar(20) default NULL,
  `startNum` int(5) default '0',
  `readNum` int(5) default '0',
  `flag` varchar(6) NOT NULL default '动态',
  `date` datetime NOT NULL,
  PRIMARY KEY  (`s_id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `unloadphotoalbum`
-- ----------------------------
DROP TABLE IF EXISTS `unloadphotoalbum`;
CREATE TABLE `unloadphotoalbum` (
  `u_p_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `a_id` int(5) NOT NULL,
  `a_p_url` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`u_p_id`),
  KEY `u_id` (`u_id`),
  KEY `a_id` (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
  `i_p_url` varchar(20) default NULL,
  `age` int(3) default NULL,
  `tall` int(3) default NULL,
  `salary` int(5) default NULL,
  `province` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `country` varchar(20) default NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('Miss', 'admin', '123123123', '女', 'xianyu@qq.com', null, '0', '0', '0', null, null, null, '2017-03-22 12:43:11');
INSERT INTO `user` VALUES ('飞龙', 'feilong', '123123123', '男', 'feilong@qq.com', null, '0', '0', '0', null, null, null, '2017-03-22 15:29:45');
