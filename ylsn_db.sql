/*
Navicat MySQL Data Transfer

Source Server         : mySql
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : ylsn_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-04-10 12:25:28
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
INSERT INTO `album` VALUES ('22', '841583918', '我的相册', '公开', '2017-04-09 23:01:48');
INSERT INTO `album` VALUES ('23', 'xueer', '我的大学生活', '公开', '2017-04-09 23:13:12');
INSERT INTO `album` VALUES ('24', '841583911', '阿智的一些事一些请', '公开', '2017-04-09 23:16:37');
INSERT INTO `album` VALUES ('25', 'daji123456', '妲己陪你玩', '公开', '2017-04-09 23:35:57');
INSERT INTO `album` VALUES ('26', '2014354124', '狄仁杰', '公开', '2017-04-10 00:10:02');

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
  `friend` int(1) default NULL,
  `f_feeling` int(1) default NULL,
  `f_collection` int(1) default NULL,
  `data` datetime default NULL,
  PRIMARY KEY  (`u_id`,`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('2014354130', '2014354130', '0', '1', '0', '2017-04-10 00:27:11');
INSERT INTO `friend` VALUES ('admin', '2014354130', '1', '0', '0', '2017-04-10 09:54:15');
INSERT INTO `friend` VALUES ('admin', 'feilong', '1', '0', '0', '2017-04-09 21:21:49');
INSERT INTO `friend` VALUES ('admin', 'xianyu', '1', '0', '0', '2017-04-09 22:45:47');
INSERT INTO `friend` VALUES ('feilong', 'admin', '1', '0', '1', '2017-04-06 22:48:16');
INSERT INTO `friend` VALUES ('minmin', 'xianyu', '1', '0', '0', '2017-04-09 23:21:52');
INSERT INTO `friend` VALUES ('xianyu', 'feilong', '1', '0', '1', '2017-04-06 23:16:50');

-- ----------------------------
-- Table structure for `information`
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `name` varchar(10) default NULL,
  `u_id` varchar(10) NOT NULL,
  `hobby` varchar(100) default NULL,
  `motto` text,
  `start` int(5) default NULL,
  `friend` text,
  `f_feeling` text,
  `f_collection` text,
  `location` varchar(20) default NULL,
  `weight` int(3) default NULL,
  `blood_type` varchar(10) default NULL,
  `nation` varchar(10) default NULL,
  `house` varchar(20) default NULL,
  `have_child_not` varchar(5) default NULL,
  `graduate_school` varchar(50) default NULL,
  `height` int(2) default NULL,
  PRIMARY KEY  (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (null, '1231', null, '你说过，你要和我一起去看日落。', '0', null, null, null, null, '0', null, null, null, null, null, '0');
INSERT INTO `information` VALUES ('', '12310', null, null, '0', null, null, null, null, '47', '', '', '', '', '', '160');
INSERT INTO `information` VALUES ('', '12312', null, null, '0', null, null, null, null, '58', '', '', '', '', '', '176');
INSERT INTO `information` VALUES ('', '12313', null, null, '0', null, null, null, null, '59', '', '', '', '', '', '180');
INSERT INTO `information` VALUES (null, '1232', null, '我不知道说什么，我只是突然在这一刻很想你。', '0', null, null, null, null, '0', null, null, null, null, null, '0');
INSERT INTO `information` VALUES (null, '1233', null, '永远那么理智就永远不会懂得爱情了。', '0', null, null, null, null, '0', null, null, null, null, null, '0');
INSERT INTO `information` VALUES (null, '1234', null, '梦惊醒，我寻找你的背影。', '0', null, null, null, null, '0', null, null, null, null, null, '0');
INSERT INTO `information` VALUES (null, '1235', null, '我只是不小心爱上你，可为何你迟迟不肯从我心中谢幕。', '0', null, null, null, null, '0', null, null, null, null, null, '0');
INSERT INTO `information` VALUES ('', '1236', null, null, '0', null, null, null, null, '44', '', '', '', '', '', '165');
INSERT INTO `information` VALUES ('', '1237', null, null, '0', null, null, null, null, '40', '', '', '', '', '', '156');
INSERT INTO `information` VALUES ('', '1238', null, null, '0', null, null, null, null, '41', '', '', '', '', '', '164');
INSERT INTO `information` VALUES ('', '1239', null, null, '0', null, null, null, null, '38', '', '', '', '', '', '156');
INSERT INTO `information` VALUES (null, '2014354124', null, '唱一半的歌、剩下的一半由你来唱。', '0', null, null, null, null, '65', null, null, null, null, null, '170');
INSERT INTO `information` VALUES (null, '2014354130', null, '想找个温柔，顾家的女孩...', '0', null, null, null, null, '62', null, null, null, null, null, '168');
INSERT INTO `information` VALUES (null, '2014354131', null, '想把我唱给你听...', null, null, null, null, null, '55', null, null, null, null, null, '172');
INSERT INTO `information` VALUES (null, '841583911', null, '茉莉花香...', null, null, null, null, null, '57', null, null, null, null, null, '165');
INSERT INTO `information` VALUES ('谢飞龙', '841583918', null, 'ideal  一些事一些情、樂觀自信愛', '0', null, null, null, null, '55', 'O型', '汉族', '和家人同住', '没有', '没毕业', '175');
INSERT INTO `information` VALUES ('白萍', 'admin', null, '柔情似水的世界，看似简单，却如此复杂…', '0', null, null, null, null, '55', 'B型', '汉族', '和家人同住', '没有', '岭南', '175');
INSERT INTO `information` VALUES (null, 'daji123456', null, '  ', '0', null, null, null, null, '50', null, null, null, null, null, '165');
INSERT INTO `information` VALUES ('飞龙', 'feilong', null, '其实莪一直都在，看着妳不变旳动态。', '0', null, null, null, null, '60', 'AB型', '汉族', '和家人同住', '没有', '岭南', '175');
INSERT INTO `information` VALUES ('赵敏', 'minmin', null, '学会做个彪悍的姑娘 不矫揉不造作不发嗲不懦弱 怎么骄傲怎么活.', '0', null, null, null, null, '45', 'AB型', '汉族', '已购房', '没有', '政大', '155');
INSERT INTO `information` VALUES ('龙', 'xianyu', null, '如果我只是个单纯的过客，为何要让我闯入你的生活？', '0', null, null, null, null, '62', 'AB型', '汉族', '已购房', '没有', '北鸟', '184');
INSERT INTO `information` VALUES ('林雪儿', 'xueer', null, '想找个稳重，成熟的男生...', '0', null, null, null, null, '55', 'A型', '汉族', '和家人同住', '没有', '青鸟', '168');
INSERT INTO `information` VALUES ('', 'zzy110', null, '我很帅，真的不骗你', '0', null, null, null, null, '60', '', '', '', '', '岭南师范学院', '182');

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
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

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
INSERT INTO `share` VALUES ('27', '841583918', null, '如何评价男生因为让妹子“用农夫矿泉水加喷壶”（成本不足10元）替代雅漾大喷，而遭许多妹子反驳的事？ ', 'null', '0', '0', '动态', '2017-04-09 23:03:04');
INSERT INTO `share` VALUES ('28', 'xianyu', null, '“当你不去旅行，不去冒险，不去拼一份奖学金，不过没试过的生活，整天挂着QQ，刷着微博，逛着淘宝，玩着网游，干着我80岁都能做的事，你要青春干嘛?”你是否也曾被这句网传的流行语唤醒了心底那一丝早已沉寂的上进心?锦瑟流年，花开花落，岁月蹉跎匆匆过，而恰如同学少年，在最能学习的时候你选择恋爱，在最能吃苦的时候你选择安逸，自是年少，却韶华倾负，再无少年之时。错过了人生最为难得的吃苦经历，对生活的理解和感悟就会浅薄。', 'null', '0', '0', '动态', '2017-04-09 23:04:03');
INSERT INTO `share` VALUES ('29', 'xianyu', null, '你的人生想要什么?你能付出什么作为回馈?成功的人只想自己要的。而非自己不要的。不要管过去做了什么，重要的是你将来要做什么?如果你不知道你自己的一生要的是什么，你还想得到什么?智者除了有所 为，还能有所不为。为自己想要的忙碌，如此即无暇担忧你不想要的。不要怕目标定得太高，你可能需要退而求其次。如果你不会知道自己要什么，别说你没有机会。', '', '0', '0', '愿望', '2017-04-09 23:04:38');
INSERT INTO `share` VALUES ('30', 'xianyu', null, '每次你多做一些，别人就欠你一些。让别人做得更好，同时提升自己的价值。善于钓鱼的人选用鱼喜欢的饵。你不能让所有的人喜欢你，却能减少别人讨厌你 的原因。与人协商而不产生摩擦，是有待学习的一大课题。多做一些，机会将随之而来。为别人服务最多的人最富有。服务的道路才能通往快乐的城市。', '', '0', '0', '愿望', '2017-04-09 23:04:47');
INSERT INTO `share` VALUES ('31', 'xueer', null, '梦初彷徨，三院琉璃不及你，不念曾经，谁把一世佳话浅笑谱写，后世传芳。 墨痕未央，书信千纸不如你，不念过往，谁把一里桃花相思种下，来生绵长。', 'null', '0', '0', '动态', '2017-04-09 23:11:17');
INSERT INTO `share` VALUES ('32', 'xueer', null, '大学校园色彩单调，却不乏味，虽然每天校园都重复着同一种节奏，但是故事却不尽相同，大学校园承载着莘莘学子心中的梦，也是心中的梦实现的地方。让我们以美妙的青春为圆心，以丰富的知识为半径，在大学校园中画出人生中最完美的一个圆。', 'null', '0', '0', '动态', '2017-04-09 23:12:51');
INSERT INTO `share` VALUES ('33', 'minmin', null, '你不会想起在身边的人 ,你想起的人都不在身边', 'null', '0', '0', '动态', '2017-04-09 23:22:21');
INSERT INTO `share` VALUES ('34', 'minmin', null, '你是天上人画中仙遥不可及难以靠近，留我在爱情迷局里寸步难行苟且至今', '', '0', '0', '愿望', '2017-04-09 23:22:49');
INSERT INTO `share` VALUES ('35', '2014354130', null, '今天是我的第一天注册哦！！', 'null', '0', '0', '动态', '2017-04-09 23:37:24');
INSERT INTO `share` VALUES ('38', '2014354124', null, '受尽苦难而不厌，此乃修罗之道。', 'null', '0', '0', '动态', '2017-04-10 00:14:01');
INSERT INTO `share` VALUES ('39', '2014354131', null, '有个网站交友真心不错，这个网站蛮推荐的。', 'null', '0', '0', '动态', '2017-04-10 00:20:37');
INSERT INTO `share` VALUES ('40', '2014354131', null, '悄悄告诉你，我是他舍友', '', '0', '0', '愿望', '2017-04-10 00:21:09');
INSERT INTO `share` VALUES ('41', '2014354130', null, '你猜一猜，牛大还是马大', '', '0', '0', '愿望', '2017-04-10 00:21:33');
INSERT INTO `share` VALUES ('42', '1231', null, '你说过，你要和我一起去看日落。', 'null', '0', '0', '动态', '2017-04-10 10:10:31');
INSERT INTO `share` VALUES ('43', '1232', null, '我不知道说什么，我只是突然在这一刻很想你。', 'null', '0', '0', '动态', '2017-04-10 10:12:26');
INSERT INTO `share` VALUES ('44', '1233', null, '永远那么理智就永远不会懂得爱情了。', 'null', '0', '0', '动态', '2017-04-10 10:14:56');
INSERT INTO `share` VALUES ('45', '1234', null, '梦惊醒，我寻找你的背影。', 'null', '0', '0', '动态', '2017-04-10 10:18:16');
INSERT INTO `share` VALUES ('46', '1235', null, '我只是不小心爱上你，可为何你迟迟不肯从我心中谢幕。', 'null', '0', '0', '动态', '2017-04-10 10:21:38');
INSERT INTO `share` VALUES ('47', '1236', null, '没有过不去的事情，只有过不去的心情。', 'null', '0', '0', '动态', '2017-04-10 10:24:31');
INSERT INTO `share` VALUES ('48', '1237', null, '我们不是输在起跑线上，我们是爬在起跑线上了。', 'null', '0', '0', '动态', '2017-04-10 10:28:10');
INSERT INTO `share` VALUES ('49', '1238', null, '等到空中的星星都跟着月亮殉情了。我来做你的灯。', 'null', '0', '0', '动态', '2017-04-10 10:32:54');
INSERT INTO `share` VALUES ('50', '1239', null, '你为了一个美丽的未来，放弃了我们温暖的现在。', 'null', '0', '0', '动态', '2017-04-10 10:34:18');
INSERT INTO `share` VALUES ('51', '12310', null, '爱不是彼此凝视，而是一起注视同一个方向。', 'null', '0', '0', '动态', '2017-04-10 10:36:06');
INSERT INTO `share` VALUES ('52', '12312', null, '人的一生，都有一些说不出的秘密，挽不回的遗憾，触不到的梦想，忘不了的爱', 'null', '0', '0', '动态', '2017-04-10 10:46:49');
INSERT INTO `share` VALUES ('53', '12313', null, '倘若你愿意陪我一起许愿。你是否会许下不分离的诺言。', 'null', '0', '0', '动态', '2017-04-10 10:48:19');
INSERT INTO `share` VALUES ('54', 'zzy110', null, '我很帅，真的不骗你', 'null', '0', '0', '动态', '2017-04-10 10:52:43');

-- ----------------------------
-- Table structure for `unloadphotoalbum`
-- ----------------------------
DROP TABLE IF EXISTS `unloadphotoalbum`;
CREATE TABLE `unloadphotoalbum` (
  `u_p_id` int(5) NOT NULL auto_increment,
  `u_id` varchar(10) NOT NULL,
  `a_id` int(5) NOT NULL,
  `a_p_url` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`u_p_id`),
  KEY `u_id` (`u_id`),
  KEY `a_id` (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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
INSERT INTO `unloadphotoalbum` VALUES ('30', '2014354124', '26', './upload/u=3323658530,4263072470&fm=23&gp=0[1].jpg', '2017-04-10 00:10:34');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(15) NOT NULL,
  `u_id` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `i_p_url` text,
  `age` int(3) default NULL,
  `tall` int(3) default NULL,
  `salary` int(5) default NULL,
  `province` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `country` varchar(20) default NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('Miss', 'admin', '123123123', '女', 'Miss@qq.com', './upload/photoalbum1.jpg', '30', '175', '12000', '广东省', '茂名市', '化州市', '2017-04-06 17:20:11');
INSERT INTO `user` VALUES ('飞龙', 'feilong', '123123123', '男', 'feilong@qq.com', './upload/photoalbum8.jpg', '22', '0', '5000', '广东省', '茂名市', '信宜市', '2017-04-09 23:00:41');
INSERT INTO `user` VALUES ('咸鱼', 'xianyu', '123123123', '男', 'xianyu@qq.com', './upload/photoalbum7.jpg', '19', '0', '8000', '广东省', '广州市', '越秀区', '2017-04-09 23:01:14');
INSERT INTO `user` VALUES ('鹹魚_一車事一車情 ', '841583918', 'long1019647822', '男', '841583918@qq.com', './upload/photoalbum3.jpg', '0', '0', '1000', '广东省', '茂名市', '信宜市', '2017-04-09 23:06:22');
INSERT INTO `user` VALUES ('雪儿', 'xueer', '123123123', '女', 'xueer@qq.com', './upload/photoalbum4.jpg', '24', '0', '10000', '广东省', '广州市', '越秀区', '2017-04-09 23:10:37');
INSERT INTO `user` VALUES ('阿智', '841583911', 'long1019', '女', '11@qq.com', './upload/g1.png', '22', '0', '10000', '广东省', '阳江市', '阳东县', '2017-04-10 00:07:05');
INSERT INTO `user` VALUES ('妲己', 'daji123456', '123456789', '女', '123456789@qq.com', './upload/g2.png', '24', '0', '0', '广东省', '阳江市', '阳东县', '2017-04-09 23:35:25');
INSERT INTO `user` VALUES ('敏敏', 'minmin', '123123123', '女', 'minmin@qq.com', './upload/photoalbum2.jpg', '23', '0', '10000', '广东省', '茂名市', '化州市', '2017-04-05 00:36:35');
INSERT INTO `user` VALUES ('夜夜笙歌', '2014354130', '978624366', '男', '978624366@qq.com', './upload/b2.png', '25', '0', '5000', '广东省', '茂名市', '信宜市', '2017-04-09 23:38:44');
INSERT INTO `user` VALUES ('鲁班', '2014354124', '2014354124', '男', '2014354124@qq.com', './upload/b1.png', '24', '0', '8000', '广东省', '茂名市', '信宜市', '2017-04-10 00:09:26');
INSERT INTO `user` VALUES ('一缕春风', '2014354131', '978624366', '女', '978624366@qq.com', './upload/g3.png', '27', '0', '12000', '广东省', '阳江市', '阳东县', '2017-04-10 00:25:48');
INSERT INTO `user` VALUES ('kitty', '1231', 'long1019', 'fl-female', '1@163.com', './upload/fl-2.png', '20', '0', '80000', '广东省', '湛江市', '赤坎区', '2017-04-10 10:09:35');
INSERT INTO `user` VALUES ('tom', '1232', 'long1019', 'male', '2@163.com', './upload/fl1.png', '23', '0', '9000', '广东省', '湛江市', '遂溪县', '2017-04-10 10:12:13');
INSERT INTO `user` VALUES ('南国旧梦', '1233', 'long1019', 'fl-female', '3@163.com', './upload/fl-3.png', '27', '0', '10000', '广东省', '汕头市', '金平区', '2017-04-10 10:16:03');
INSERT INTO `user` VALUES ('君心今何在°', '1234', 'long1019', '女', '4@163.com', './upload/fl-4.png', '26', '0', '5000', '湖南省', '长沙市', '长沙市', '2017-04-10 10:18:49');
INSERT INTO `user` VALUES ('绕遍你心', '1235', 'long1019', '男', '5@163.com', './upload/fl-6.png', '25', '0', '10000', '湖北省', '武汉市', '江汉区', '2017-04-10 10:23:02');
INSERT INTO `user` VALUES ('余悸心澈', '1236', 'long1019', '女', '6@163.com', './upload/fl-5.png', '23', '0', '6000', '湖北省', '武汉市', '江汉区', '2017-04-10 10:25:01');
INSERT INTO `user` VALUES ('轰轰烈烈不如平静', '1237', 'long1019', '女', '7@163.com', './upload/fl-7.png', '27', '0', '5600', '湖南省', '张家界市', '永定区', '2017-04-10 10:28:35');
INSERT INTO `user` VALUES ('小小琳° 大大笑°', '1238', 'long1019', '女', '8@163.com', './upload/fl-9.png', '19', '0', '6900', '湖北省', '荆门市', '沙洋县', '2017-04-10 10:33:13');
INSERT INTO `user` VALUES ('古道印残灯', '1239', 'long1019', '女', '9@163.com', './upload/fl-11.png', '24', '0', '3600', '湖南省', '常德市', '津市市', '2017-04-10 10:34:41');
INSERT INTO `user` VALUES ('暮年', '12310', 'long1019', '女', '10@163.com', './upload/fl-13.png', '26', '0', '4900', '广东省', '汕头市', '金平区', '2017-04-10 10:36:25');
INSERT INTO `user` VALUES ('汉纸°', '12312', 'long1019', '男', '12@qq.com', './upload/fl-8.png', '23', '0', '5000', '湖南省', '常德市', '津市市', '2017-04-10 10:47:09');
INSERT INTO `user` VALUES ('juny', '12313', 'long1019', '男', '13@163.com', './upload/fl-10.png', '29', '0', '12000', '广东省', '汕头市', '金平区', '2017-04-10 10:48:45');
INSERT INTO `user` VALUES ('郑仲寅', 'zzy110', 'zzy110.......', '男', 'zzy@qq.com', './upload/fl-12.png', '24', '0', '20000', '广东省', '汕头市', '金平区', '2017-04-10 10:53:16');
