/*
Navicat MySQL Data Transfer

Source Server         : mySql
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : ylsn_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-03-21 01:18:02
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
  `flag` varchar(5) NOT NULL default '鍏紑',
  `date` datetime NOT NULL,
  PRIMARY KEY  (`a_id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------

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
  `s_title` varchar(50) NOT NULL,
  `s_content` text NOT NULL,
  `s_p_url` varchar(20) NOT NULL,
  `startNum` int(5) default '0',
  `readNum` int(5) default '0',
  `flag` varchar(5) NOT NULL default '鍒嗕韩',
  `date` datetime NOT NULL,
  PRIMARY KEY  (`s_id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for `unloadphotoalbum`
-- ----------------------------
DROP TABLE IF EXISTS `unloadphotoalbum`;
CREATE TABLE `unloadphotoalbum` (
  `u_p_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `a_id` int(5) NOT NULL,
  `a_p_url` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`u_p_id`),
  KEY `u_id` (`u_id`),
  KEY `a_id` (`a_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unloadphotoalbum
-- ----------------------------

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
