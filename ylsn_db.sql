/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ylsn_db

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-21 20:30:17
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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
  `c_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `s_id` int(5) NOT NULL,
  `c_content` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('20', 'admin', '8', '心情不好', '2017-04-12 09:21:01');
INSERT INTO `comment` VALUES ('21', 'admin', '6', '哈哈', '2017-04-12 16:41:46');

-- ----------------------------
-- Table structure for `dgrounp`
-- ----------------------------
DROP TABLE IF EXISTS `dgrounp`;
CREATE TABLE `dgrounp` (
  `dg_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `dg_title` varchar(50) NOT NULL,
  `flag` varchar(5) NOT NULL DEFAULT '公开',
  `date` datetime NOT NULL,
  PRIMARY KEY (`dg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dgrounp
-- ----------------------------
INSERT INTO `dgrounp` VALUES ('1', 'admin', '我的心扉', '私密', '2017-04-20 17:46:01');
INSERT INTO `dgrounp` VALUES ('2', 'xueer', '唯美痕迹', '私密', '2017-04-21 19:47:49');

-- ----------------------------
-- Table structure for `diary`
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `s_id` int(5) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(10) NOT NULL,
  `s_title` varchar(50) DEFAULT NULL,
  `s_content` text NOT NULL,
  `s_p_url` varchar(20) DEFAULT NULL,
  `startNum` int(5) DEFAULT '0',
  `readNum` int(5) DEFAULT '0',
  `flag` varchar(6) DEFAULT '动态',
  `date` datetime NOT NULL,
  `dg_id` int(10) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES ('1', 'admin', '越长大越孤单', '是不是突然之间长大 是不是麻木了\r\n放学骑车走在回家的路上 风吹在脸上 温暖且干燥 原来已经夏天了\r\n面无表情的看着外面的世界 路人 路人 全部都是路人 然后一闪而过\r\n我看到那些不同年龄的人坐在卖菜的摊位上 \r\n他们眼神有温暖有寂寞有空洞有讨好\r\n最多的是疲倦 好像一瞬间就会崩塌\r\n他们是老了吗 他们是累了吗 他们经历了些什么 他们有什么故事\r\n看着看着突然觉得心疼 说不出那种悲壮刚烈的心疼\r\n我迷茫了我想这是一件多么恐怖的事 突然又庆幸自己还没有麻木\r\n突然想拿相机把这些画面拍下来 可是拍下来的东西都不真实\r\n无奈 无奈 无奈 一直都是无奈\r\n我也开始小心翼翼的对待任何一个人 因为我害怕遇见了又错过又失去\r\n我也开始不再那么依赖 我也开始学会理解 理解每个人有每个人的事\r\n我也不会再勉强任何人陪我 因为我知道一个人也一样\r\n静默静默 我想我学会了 \r\n在这样炎炎的夏日 我突然想写一篇日志 零零散散 只是突然想到就写下来\r\n我感觉自己现在成熟了许多 思想 不再那么幼稚\r\n我不知道自己是不是太过于喜欢回忆 我总觉得自己写字是因为回忆\r\n只是这样沉重的过去何日是头\r\n在那时候阳光与你们同在我身边的时候 我是快乐的很快乐的\r\n失去的再也回不去 这个道理我懂 所以我想珍惜现在拥有的好的或者不好的\r\n我是个贪婪的人一直都是 如果得到了不是最好的我宁愿不要\r\n就像如果我想你是我最好的朋友我把你当成最好的朋友而你没有 那么我宁愿当陌生人', null, '0', '0', null, '2017-04-20 18:34:34', '1');
INSERT INTO `diary` VALUES ('2', 'admin', '深情不及久伴', '你没有谈过几百天的恋爱你不知道爱慢慢变淡是什么滋味\r\n你不知道真的是深爱与责任在维护着两个人的关系\r\n最真实的对方遇到不舒服的就说出来 没有必要隐藏\r\n早已经没有了新鲜感想到的只有未来\r\n你没有尝试过所以你不知道几百天的感情想要断掉\r\n就真的像是从你身上活生生割一块肉下来 你知道那种感受吗\r\n当你们的感情出现问题 早已经没有了之前的的容忍\r\n只会觉得对方越来越厌恶越来越烦躁到最后容不下来\r\n就是分开 其实每对情侣都是这样的\r\n那有没有想过如果有一个人坚持一下 会不会就不会结束\r\n想想之前他对你的好 你会不会觉得也可以理解他包容他\r\n毕竟他也还是个孩子 男生嘛 偶尔放放手也终归是好的\r\n让他自己去思考谁是他的绝配\r\n让他自己思考过去熬过来的不容易和一点一滴时间是可以愈合所有的悔恨烦躁\r\n不爱都会随着时间一点点消失 所以回忆都是美好的\r\n每对情侣的感情都是独角戏 所以别人不要参与也不要评论\r\n只有两个人最清楚结局\r\n很喜欢的一句话 只有陪伴来证明我爱你。', null, '0', '0', null, '2017-04-20 18:36:34', '0');
INSERT INTO `diary` VALUES ('3', 'admin', '有时候不是不懂，而是不想懂', '有时候不是不懂，而是不想懂。\r\n有时候不是不知道，只是不想说出来。\r\n有时候不是不明白只是明白也无能为力\r\n于是就保持了沉默。\r\n有些话适合藏在心里。\r\n有些痛苦适合无声无息的忘记。\r\n有些回忆只适合偶尔拿出来回味。\r\n很多事情，当经历过，自己清楚就好。\r\n很多改变不需要说出来，自己明白就好。\r\n有些伤口，时间久了就会慢慢长好\r\n有些委屈，受过了想通了也就释然了\r\n有些伤痛，忍过了疼久了也成习惯了\r\n然而却在很多孤独的瞬间又重新涌上心头。\r\n其实，有些藏在心底的话\r\n并不是故意要去隐瞒只怕一说出来\r\n就是一个永远的错误要知道并不是所有的疼痛都可以呐喊。\r\n生命就象是陀螺不停的旋转我们终会从风华正茂走到衰老的那一天。\r\n等我们老的时候，回想起今天每一个酸甜苦辣的瞬间\r\n都会淡然的回首一笑\r\n多少的楼台烟雨，多少的辛酸无奈\r\n都会在这回首一笑中随风而逝。\r\n每一次生命的轮回都是一个花开花落的过程\r\n花开的时候尽情的绽放花谢的时候才会有一地的缤纷。\r\n最悲凉的三个字莫过于 回不去。', null, '0', '0', null, '2017-04-20 18:42:02', '1');
INSERT INTO `diary` VALUES ('4', 'admin', '还想什么 琴键都弹错了', '还想什么 琴键都弹错了\r\n还爱他吗\r\n不值得留恋了\r\n爱过之后的残缺\r\n变得不会再怀念\r\n说的不会错 以为不会错\r\n就这样吧 请别再幻想了\r\n他走过了 哪还会回头了\r\n你从前的自由呢\r\n总是爱笑的你呢\r\n别理他了 爱就爱了\r\n不就是伤心了\r\n一个人躲着 不就是难过了\r\n没有人诉说 不就是这次又伤得更透彻\r\n我不怕爱却爱的那么深刻\r\n不就是一个人守着黑夜过\r\n不就是厨房里少了你和我\r\n不就是再也没有睡前的歌\r\n我还是可以一个人活', null, '0', '0', null, '2017-04-20 18:42:19', '0');
INSERT INTO `diary` VALUES ('5', 'admin', '我也这样喜欢你', '如果一个人记得你的生日,\r\n记得你喜欢什么讨厌什么,\r\n把你不经意说过的话都放在心上,\r\n为你无数次影响情绪却从来不让你看到他脆弱的样子,\r\n为你做他不喜欢的事,愿意\r\n为你放下面子放下所谓的原则放下他的一切,\r\n为你变的面目全非，真的,你再也不会遇见一个人比他更爱你了。', null, '0', '0', null, '2017-04-20 18:42:36', '0');
INSERT INTO `diary` VALUES ('6', 'admin', '送给年少学生时期我最爱的男孩和最爱我的男孩.', '我爱的男孩,我想说,好久未见,你还好吗?\r\n \r\n那时,我突然就哭了,\r\n一边跑一边喊着他的名字,\r\n那么多人停下来看我,\r\n可是他们都不是我要的那个人.\r\n\r\n我终于还是忍不住,\r\n又一次哭出了声音.\r\n后来我把耳机塞进耳朵里,\r\n我一遍一遍听着那首歌,\r\n止不住眼泪纷纷涌涌地流出来,\r\n我那么用力地往前大步的走,\r\n眼泪都被我留在了身后,\r\n它们已经跟不上我快速奔跑的脚步了.\r\n可是还是有那么多的眼泪,\r\n争先恐后地往外直流', null, '0', '0', null, '2017-04-20 18:43:41', '0');
INSERT INTO `diary` VALUES ('7', 'xueer', '芳菲四月，你在，就好', '芳菲的四月，如诗如画，与温暖有约，与阳光相伴，与真情相依。漫步于春暖花开的时节，捻一缕暖风，静静地守着初放的绿，岁月如歌，安然静美，聆听似水流年的芳芳，用心灵的墨香描写出人间最美的童话，不为一世芳华，你在，就好。\r\n\r\n　　一年之计在于春，江南，每年的四月，百花齐放，春意盎然，让这座六朝古都到处洋溢着春的芬芳。四月，正是踏青赏花最好的时节，趁着天气温暖，万物苏醒之际，背上行囊，向远方出发。登高远眺，不仅可以锻炼身体，还能呼吸到最新鲜的空气，舒缓长期疲惫的心灵。踏青、赏春，看一看柳绿花红，不仅可以陶冶情操，修养身心，而且赏的还是一种文化和品位。\r\n\r\n　　记忆中的春光，还要追忆到学生时代，那个时候，还是一位羞涩腼腆的翩翩少年，学校组织春游每逢必去，也许，眼中的春色还没有那么的撩人美丽，只是为了逃避一天的学习。到了工作成家之后，单位组织的几次旅游，更是草草收场，无暇顾及春光的美丽，也许，繁忙的工作和家庭琐事，让那颗早已磨平的心不再驿动和憧憬。\r\n\r\n　　岁月馨香，时光如梭。时光的流逝，磨平了我们的棱角，江南春天依旧柔和芳菲，困守在生存奔波的人们，工作闲暇之余，给自己的心灵放一次假，不必舍近求远，约上几个好友，或一家人去郊外，享一份春光明媚的温暖，赏一段花开馨香的浪漫。俗话说 : “智者乐水，仁者乐山”，其实，山因水而俊美，水因山而柔媚。在这个春暖花开芳菲尽的四月，莫辜负了春光。\r\n\r\n　　每到春季，古城外的油菜花全面盛开，大片大片的油菜花将古村环绕其中，粉红的桃花、洁白的梨花，点缀在漫山遍野金灿灿的油菜花田中，形成独具一格的乡村田园花卷，春风吹过，金灿灿的油菜花衬印着白墙黑瓦，这一份美古朴而绚烂。\r\n\r\n\r\n　　江南的四月，春光一泻千里。据了解，牡丹最美是在上午，四月十日到二十五日是牡丹开花最美的时候，都说 “洛阳牡丹甲天下，石城路人皆若狂”，不出南京也能领略牡丹的雍容之美。四月的江南，水墨丹青，山水相抱，有着晶莹剔透宛如宝石的宽阔水域，湖面水平如镜，四季清幽，周围峰峦叠嶂倒映其中，衬着蓝天，俨然一副在画中游的美好景象。\r\n\r\n　　请把我留在春天里。草长莺飞四月天，人间最美的时节，四月里风是柔和的，四月里树上长出了新叶。春天是活力与朝气的象征，小巷青砖中悄悄探出的一抹绿，远望粉黛一片，近看猩红一点的樱花。绵绵雨后湛蓝的天空……盎然生机随处扑面而来。\r\n\r\n　　春光静好，时光安然。如诗的四月，放憧着我们岁月的步伐，如果有一天，当我老无所依，请把我留在，在这春天里………', null, '0', '0', null, '2017-04-21 19:47:29', '0');
INSERT INTO `diary` VALUES ('8', 'xueer', '第一次与你共打一把伞', '又到了两个人共打一把伞的季节，可惜我们的恋爱开始于冬季，却在次年冬季结束了短短两个月的美好恋情。那是我高中时代非常美好而又难忘的记忆。\r\n\r\n　　但不代表说我在冬季喜欢的你，分开后就不喜欢了。我还爱着你啊。\r\n\r\n　　自从分开后，就等了一年。那一年中的夏天很漫长，可是一直没等到和你一起共打一把伞的机会。那一年的夏天，只是下雨了就自己拿把伞走，听着雨水结伴而下地落在地上可惜我没有结伴而行却只一人。\r\n\r\n　　对于我来说每天都很平常，今天依旧按时起床按时上学暗示在学校旁买四元钱的馅饼。记得今早临走前下了雨，我还抱怨为什么要下雨，我怕把给朋友带的纸做的礼品袋淋湿。但现在我还要谢谢上天。\r\n\r\n　　今天的不寻常从我买完吃的开始。有一种超能力是一眼就能在人群中认出你爱的那个她，凡是心里有心仪的对象的人都会被爱情附上这种超能力。在我买完吃的后，我一眼就认出你的背影。就看到你一个人走，平时和你一起走的那个朋友今天没和你在一起走。你身边的人都带了伞唯独你，用手捂着刘海匆忙地跑着像一个可爱的小孩子一样!当时我觉得你特别的可爱，但又觉得你需要帮忙，于是就上去和你共打一把伞不让你挨浇了。不单纯处于这两个原因，还因为想和你共打一把伞。因为我心里还有你啊。\r\n\r\n　　于是我跑了过去，以至于想在旁边买杯粥都不想买了。到你身边就把伞往你那里移了下。我想你一定很惊讶吧，在你需要伞的时候我出现了。其实我也感到很突然。那时的我有些激动，实现了自己的一个小愿望。我们就这样直线走着，你边走边摸刘海，以至于你的身子碰到了我的身子。我想到了以前我们在一起时你总喜欢往我这个方向“挤着走”，就像一个淘气的小孩子一样。\r\n\r\n　　我转头看了看你，你的身高到我肩膀那，好想去用手搂住你，给你温暖，可是被“已分开”这三个字受拘束而无法迈出那么大的一步，我很想以后再有更多次这样去尽我所能照顾你，给你更多的安全感。虽然我们的对话中我的语气不是那么温柔，可是我用行动表达要擅长于用言语去表达。我想你会懂吧!与心爱的人共打一把伞，谁不高兴呢?\r\n\r\n　　我们就这样走了大约二十秒就到校门口了，你看到你的朋友们就跑去她们那了。但对于我来说，这短暂的二十秒却像一个录像带一样被我好好收藏在心里，这短短的二十秒凝结成的记忆是十分珍贵的。即使我们分开一年，但你在我心里仍处在不可动摇的位置。当回到班级后，内心深处的自己跟我说：“我很满足了。”是啊，满足了和心爱的人共打一把伞的小愿望，满足了我有一次可以照顾你的机会，满足了我可以接近你的一次机会，满足了我们可以在一起走的一次机会。没有什么比这更能令我满足的了!\r\n\r\n　　我认为如果自己爱一个人，哪怕没在一起过或者曾在一起过，有时间与机遇去接近她为她做些什么是很大的愉悦。我也越来越感受到了这种愉悦感变得更浓了。', null, '0', '0', null, '2017-04-21 19:48:16', '2');
INSERT INTO `diary` VALUES ('9', 'xueer', '真好，此生与你相遇', '时间如水，岁月如歌，人生如诗，你伴随着我又走到这飞雪的节季，在和煦的春风里，我与你邂逅相遇，从此宛如一片绿叶相依在你的树枝……\r\n\r\n　　阳春里你令我领悟耕耘艰辛的启迪，盛夏里你令我感受火热的情谊，深秋里我与你分享着收获的惬意，寒冬里我感怀震撼灵魂的你。\r\n\r\n　　我曾把自己比拟一条奔腾不息的小溪，历尽万壑险滩，去追寻我心仪的希冀，我还把自己化作一只纯洁无暇的彩蝶，在璀璨的花卉海洋里将你的芬芳寻觅。\r\n\r\n　　每当我感到寂寞，打开你的窗棂就会感到欣喜，每当我遇到挫折，工作中的压力，就会在你温馨的话语里得到情感的慰藉，红尘里的困惑，在你厚重的解读中得到豁然的哲思。\r\n\r\n　　你仿佛是一缕春风，荡拂我心灵的暖意，你恰如是一场春雨，润色作者硕果的旖旎，你是我心中的知己，每每抚慰着我的心事，你是我生命的舟楫，载我驶向理想的晨曦……\r\n\r\n　　在你碧空的天宇里，我荣幸振起腾飞的翅翼，在你希望的沃野里，我欣慰读者也扬起拓荒的步履，我骄傲生命的旅途，与你相遇是多么高雅多么靓丽。\r\n\r\n　　你是绚丽的文苑，绽放着唐风宋雨的传奇，你是动听的乐曲，奏响着唯美文字的旋律，你是我灵魂的摇篮，生命旅程的风景线，你是我心灵的港湾，人生漫步的芳草地。\r\n\r\n　　自从与你相遇，我的生活不在是平淡，不在是孤立，自从与你邂逅，我的人生充满着阳光，充满着诗意，在如水的岁月里，因为有了你我的心湖才荡漾着涟漪，在逝去的岁月间，因为有了你我的回忆才会更加美丽。\r\n\r\n　　多少个静谧的夜晚，是你伴随着我飞扬浪漫的思绪，多少个难忘的春秋，是你呼唤着我憧憬文字的魅力，我曾在你的妙曼诗篇里，纯真感怀文学的神韵我也在你的深邃意境中，真正读懂人生的意义。\r\n\r\n　　人生的百花，万紫千红，斗艳争奇，但我始终与你情有独钟，难舍难离，不求过高的奢望，也不管是怎样的曾经，唯有心灵的低语，真好，此生与你相遇……', null, '0', '0', null, '2017-04-21 19:48:44', '0');
INSERT INTO `diary` VALUES ('10', 'xueer', '藏一米阳光，丢一寸忧伤', '　有些日子不再回来，有些错误不能更改。\r\n\r\n　　因为时间流逝，爱入骨髓。\r\n\r\n　　她有千万条苦衷，只是，人们只用一条就能把她击得体无完肤。\r\n\r\n　　我理解她，可是却不能原谅她，这次，她错的彻彻底底。\r\n\r\n　　我爱她，她更爱我。我们是一体。我本属于她，我本是她。\r\n\r\n　　我更深埋无人可知的梦想，这是我最大的野心。\r\n\r\n　　我容许她幸福在她所认为的幸福之中，我容许所有人幸福，乃至需要牺牲掉我才有的幸福。\r\n\r\n　　渐渐地，我不想相信任何，却无奈接受任何、\r\n\r\n　　我不愿总是被动的，\r\n\r\n　　我丢掉一切使我内心会恐慌的东西，\r\n\r\n　　我试图让一切美好，走进心里。', null, '0', '0', null, '2017-04-21 19:57:06', '0');
INSERT INTO `diary` VALUES ('11', 'xueer', '真的只是朋友，想和你一生守候', '　最近很喜欢听小贱的歌，也不知道是从什么时候开始习惯了他声音。\r\n\r\n　　不想和你做朋友，只想静静的守在你的身后。一句还没来得及说爱你，就被你无形的挤了回去。\r\n\r\n　　你说过三月是赏樱花的时节，你会牵着我的手一起去寻樱花的浪漫。粉红色的樱花时节，粉红色的心。飘散的樱花树下已堆满了祈求幸福的人群。我深深地注视着你那渴望的模样，不禁我的心为你而悸动着。\r\n\r\n　　阳光午后你喜欢躺在草地上听音乐赏风景，帅气的模样，萌萌的脸蛋，让我心中再次泛起红晕。\r\n\r\n　　你说你最喜欢的事情是去登上高山看日出和日落。你说你最想去的旅行地方是西藏，因为那里离天近。我悄悄地记下了这些你想去做的事情，又渴望着希望有一天能陪你一起完成。\r\n\r\n　　我生日那天你送了一个布丁熊给我，你说他会在我孤独寂寞的时候会陪伴我，你还说我想你时候可以抱抱它。\r\n\r\n　　那天你消失了很久很久，我以为再也看不到你。我静静地等候，相信着在某个地点某个角落你会在那里等待着谁。\r\n\r\n　　你再次出现在我面前已不是年少的面容。我想哭着向你述说我的等候。一句爱你的话都没有说出口，你却把我紧紧的拥抱在你胸口。\r\n\r\n　　你的一句抱歉话语让我停留了很久，一句我们只能够做朋友，让我想了很久很久。你的一个转身头也不回没有了问候!\r\n\r\n　　那个十字路口，你在对面慢慢地等候。见了我没有问候就掉头跑掉。我以为我就只是朋友，我以为我真的变成了朋友。追上你问个理由。你怕见我再次会把泪流。\r\n\r\n　　这次是我把你拥抱在怀里，你也许有很多的难受。以后真的只是朋友，像朋友一样陪在你身后。见面的时候只是不再是亲切的问候。\r\n\r\n　　我们真的是朋友!只是朋友!想和你一生的守候还没来及说出口就这样被时光流候。', null, '0', '0', null, '2017-04-21 19:57:26', '0');

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
INSERT INTO `friend` VALUES ('12345621', 'zzy110', '0', '0', '1', '2017-04-12 21:15:58');
INSERT INTO `friend` VALUES ('2014354130', '2014354130', '0', '1', '0', '2017-04-10 00:27:11');
INSERT INTO `friend` VALUES ('admin', '1231', '1', '0', '0', '2017-04-10 18:24:16');
INSERT INTO `friend` VALUES ('admin', '12313', '1', '0', '0', '2017-04-10 19:09:19');
INSERT INTO `friend` VALUES ('admin', '2014354130', '1', '0', '0', '2017-04-10 09:54:15');
INSERT INTO `friend` VALUES ('admin', 'feilong', '1', '0', '0', '2017-04-09 21:21:49');
INSERT INTO `friend` VALUES ('admin', 'xianyu', '1', '0', '0', '2017-04-09 22:45:47');
INSERT INTO `friend` VALUES ('admin', 'zzy110', '1', '0', '0', '2017-04-12 17:06:31');
INSERT INTO `friend` VALUES ('feilong', 'admin', '1', '0', '1', '2017-04-06 22:48:16');
INSERT INTO `friend` VALUES ('minmin', 'xianyu', '1', '0', '0', '2017-04-09 23:21:52');
INSERT INTO `friend` VALUES ('xianyu', 'feilong', '1', '0', '1', '2017-04-06 23:16:50');

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
INSERT INTO `information` VALUES (null, '易烊千玺我爱你', null, null, '0', null, null, null, null, '0', null, null, null, null, null, '170');

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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

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
INSERT INTO `share` VALUES ('35', '2014354130', null, '今天是我的第一天注册哦！！', 'null', '1', '1', '动态', '2017-04-09 23:37:24');
INSERT INTO `share` VALUES ('38', '2014354124', null, '受尽苦难而不厌，此乃修罗之道。', 'null', '0', '0', '动态', '2017-04-10 00:14:01');
INSERT INTO `share` VALUES ('39', '2014354131', null, '有个网站交友真心不错，这个网站蛮推荐的。', 'null', '1', '1', '动态', '2017-04-10 00:20:37');
INSERT INTO `share` VALUES ('40', '2014354131', null, '悄悄告诉你，我是他舍友', '', '0', '0', '愿望', '2017-04-10 00:21:09');
INSERT INTO `share` VALUES ('41', '2014354130', null, '你猜一猜，牛大还是马大', '', '1', '4', '愿望', '2017-04-10 00:21:33');
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
INSERT INTO `share` VALUES ('54', 'zzy110', null, '我很帅，真的不骗你', 'null', '2', '3', '动态', '2017-04-10 10:52:43');
INSERT INTO `share` VALUES ('55', 'admin', null, 'Hello', 'null', '0', '6', '动态', '2017-04-12 12:43:17');

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
  `age` int(3) DEFAULT NULL,
  `tall` int(3) DEFAULT NULL,
  `salary` int(5) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('Miss', 'admin', '123123123', '女', 'Miss@qq.com', './upload/photoalbum1.jpg', '30', '175', '12000', '广东省', '茂名市', '化州市', '2017-04-14 01:23:38');
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
INSERT INTO `user` VALUES ('kitty', '1231', 'long1019', '女', '1@163.com', './upload/fl-2.png', '20', '0', '80000', '广东省', '湛江市', '赤坎区', '2017-04-10 10:09:35');
INSERT INTO `user` VALUES ('tom', '1232', 'long1019', '男', '2@163.com', './upload/fl1.png', '23', '0', '9000', '广东省', '湛江市', '遂溪县', '2017-04-10 10:12:13');
INSERT INTO `user` VALUES ('南国旧梦', '1233', 'long1019', '女', '3@163.com', './upload/fl-3.png', '27', '0', '10000', '广东省', '汕头市', '金平区', '2017-04-10 10:16:03');
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
INSERT INTO `user` VALUES ('易烊千玺我爱你', '易烊千玺我爱你', '1234567890', '女', '1586454371@qq.com', './upload/head.png', '22', '0', '0', '广东省', '汕头市', '金平区', '2017-04-13 19:32:37');
