﻿# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: beauty
# ------------------------------------------------------
# Server version 5.5.17

#
# Source for table brand
#

DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL COMMENT '品牌名称',
  `brand_alias` varchar(32) NOT NULL COMMENT '品牌别名',
  `brand_other_names` varchar(64) NOT NULL COMMENT '品牌其他的名字，该字段用于录入时的比对，不会呈现给用户看',
  `brand_description` text NOT NULL COMMENT '品牌描述',
  `brand_rank` int(11) NOT NULL COMMENT '品牌的排序值，越大的i优先级越高',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Dumping data for table brand
#

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (2,'雅诗兰黛 ','雅诗兰黛 ','','',0);
INSERT INTO `brand` VALUES (3,'maybelline','美宝莲','othername test','测试描述',1);
INSERT INTO `brand` VALUES (4,'资生堂 ','','','',1);
INSERT INTO `brand` VALUES (5,'OLAY','玉兰油\r','','',0);
INSERT INTO `brand` VALUES (6,'Mentholatum','曼秀雷敦','','',0);
INSERT INTO `brand` VALUES (7,'dior','迪奥','','',0);
INSERT INTO `brand` VALUES (8,'maxfactor','蜜丝佛陀','','',0);
INSERT INTO `brand` VALUES (9,'chanel','香奈儿\r','','',0);
INSERT INTO `brand` VALUES (10,'kose','高丝','','',0);
INSERT INTO `brand` VALUES (11,'dove','多芬','','',0);
INSERT INTO `brand` VALUES (12,'娥佩兰','娥佩兰','','',0);
INSERT INTO `brand` VALUES (13,'火烈鸟','火烈鸟','','',0);
INSERT INTO `brand` VALUES (14,'芭茉儿','芭茉儿','','',0);
INSERT INTO `brand` VALUES (15,'碧欧泉','碧欧泉','','',0);
INSERT INTO `brand` VALUES (16,'百雀羚','','','',0);
INSERT INTO `brand` VALUES (17,'佰草集','','','',0);
INSERT INTO `brand` VALUES (18,'婵真','婵真','','',0);
INSERT INTO `brand` VALUES (19,'御泥坊','御泥坊','','',0);
INSERT INTO `brand` VALUES (20,'美即','美即','','',0);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table category
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `category_name` varchar(32) NOT NULL COMMENT '类别名称',
  `category_description` text NOT NULL COMMENT '类别描述',
  `category_rank` int(11) NOT NULL COMMENT '类别的排序值，越大的优先级越高',
  `parent_catid` int(11) NOT NULL COMMENT '父类别的id',
  `cat_layer` tinyint(3) NOT NULL COMMENT '类别所在层数，如1、2、3等',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

#
# Dumping data for table category
#

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'护肤','',1,0,0);
INSERT INTO `category` VALUES (2,'妆扮','',2,0,0);
INSERT INTO `category` VALUES (3,'美发','',3,0,0);
INSERT INTO `category` VALUES (4,'美体','',4,0,0);
INSERT INTO `category` VALUES (5,'日护理','',5,1,1);
INSERT INTO `category` VALUES (6,'周护理','',6,1,1);
INSERT INTO `category` VALUES (8,'卸妆','',0,5,2);
INSERT INTO `category` VALUES (9,'洁面','',0,5,2);
INSERT INTO `category` VALUES (10,'化妆水','',0,5,2);
INSERT INTO `category` VALUES (11,'乳液/面霜','',0,5,2);
INSERT INTO `category` VALUES (13,'精华','',0,5,2);
INSERT INTO `category` VALUES (14,'眼霜/精华','',0,5,2);
INSERT INTO `category` VALUES (15,'润唇膏','',0,5,2);
INSERT INTO `category` VALUES (16,'喷雾\r\n喷雾\r\n喷雾','',0,5,2);
INSERT INTO `category` VALUES (17,'防晒','',0,5,2);
INSERT INTO `category` VALUES (18,'精油','',0,5,2);
INSERT INTO `category` VALUES (19,'面膜','',0,6,2);
INSERT INTO `category` VALUES (20,'按摩霜','',0,6,2);
INSERT INTO `category` VALUES (21,'去角质','',0,6,2);
INSERT INTO `category` VALUES (22,'妆底','',0,2,1);
INSERT INTO `category` VALUES (23,'眼部妆容','',0,2,1);
INSERT INTO `category` VALUES (24,'唇部妆容','',0,2,1);
INSERT INTO `category` VALUES (26,'面颊妆容','',0,2,1);
INSERT INTO `category` VALUES (27,'沐浴清洁','',0,4,1);
INSERT INTO `category` VALUES (28,'身体乳/霜','',0,4,1);
INSERT INTO `category` VALUES (29,'手部护理','',0,4,1);
INSERT INTO `category` VALUES (30,'足部护理','',0,4,1);
INSERT INTO `category` VALUES (32,'洗发','',0,3,1);
INSERT INTO `category` VALUES (33,'护法','',0,3,1);
INSERT INTO `category` VALUES (34,'染发','',0,3,1);
INSERT INTO `category` VALUES (35,'造型','',0,3,1);
INSERT INTO `category` VALUES (36,'妆底隔离','',0,22,2);
INSERT INTO `category` VALUES (37,'遮瑕膏','',0,22,2);
INSERT INTO `category` VALUES (38,'粉底液','',0,22,2);
INSERT INTO `category` VALUES (39,'粉底霜','',0,22,2);
INSERT INTO `category` VALUES (40,'粉饼','',0,22,2);
INSERT INTO `category` VALUES (41,'粉蜜（散粉）','',0,22,2);
INSERT INTO `category` VALUES (42,'眼部底霜','',0,23,2);
INSERT INTO `category` VALUES (43,'眼影','',0,23,2);
INSERT INTO `category` VALUES (44,'眼线','',0,23,2);
INSERT INTO `category` VALUES (45,'假睫毛','',0,23,2);
INSERT INTO `category` VALUES (46,'睫毛膏','',0,23,2);
INSERT INTO `category` VALUES (47,'眉笔','',0,23,2);
INSERT INTO `category` VALUES (48,'唇彩','',0,24,2);
INSERT INTO `category` VALUES (49,'唇线笔','',0,24,2);
INSERT INTO `category` VALUES (50,'唇膏','',0,24,2);
INSERT INTO `category` VALUES (51,'腮红（胭脂）','',0,26,2);
INSERT INTO `category` VALUES (52,'卸妆油','',0,8,3);
INSERT INTO `category` VALUES (53,'卸妆水','',0,8,3);
INSERT INTO `category` VALUES (54,'卸妆乳','',0,8,3);
INSERT INTO `category` VALUES (55,'全脸','',0,8,3);
INSERT INTO `category` VALUES (56,'眼唇','',0,8,3);
INSERT INTO `category` VALUES (57,'洁面乳','',0,9,3);
INSERT INTO `category` VALUES (58,'洁面啫喱','',0,9,3);
INSERT INTO `category` VALUES (59,'洁面摩丝','',0,9,3);
INSERT INTO `category` VALUES (60,'洁面粉','',0,9,3);
INSERT INTO `category` VALUES (61,'洁面皂','',0,9,3);
INSERT INTO `category` VALUES (62,'深层清洁','',0,9,3);
INSERT INTO `category` VALUES (63,'补水保湿','',0,9,3);
INSERT INTO `category` VALUES (64,'美白/淡斑','',0,9,3);
INSERT INTO `category` VALUES (65,'控油','',0,9,3);
INSERT INTO `category` VALUES (66,'日','',0,11,3);
INSERT INTO `category` VALUES (67,'夜','',0,11,3);
INSERT INTO `category` VALUES (68,'轻盈防晒','',0,17,3);
INSERT INTO `category` VALUES (69,'高度防晒','',0,17,3);
INSERT INTO `category` VALUES (70,'面膜帖','',0,19,3);
INSERT INTO `category` VALUES (71,'水洗式','',0,19,3);
INSERT INTO `category` VALUES (72,'睡眠免洗','',0,19,3);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table coin_record
#

DROP TABLE IF EXISTS `coin_record`;
CREATE TABLE `coin_record` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '美币增减记录ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `record_type` tinyint(3) unsigned NOT NULL COMMENT '没比增加记录类型，如0表示因写测评而增加等',
  `related_id` int(10) unsigned NOT NULL COMMENT '与美币增加相关的ID，如测评ID等',
  `variation` int(11) NOT NULL COMMENT '美币的变化量',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table coin_record
#

LOCK TABLES `coin_record` WRITE;
/*!40000 ALTER TABLE `coin_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `coin_record` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table diary
#

DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日记ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `diary_privacy` tinyint(3) unsigned NOT NULL COMMENT '日记的隐私等级，0表示仅自己可见，6表示所有人可见',
  `diary_tags` text NOT NULL COMMENT '日记标签',
  `diary_images` text NOT NULL COMMENT '日记的图片',
  `diary_title` varchar(64) NOT NULL COMMENT '日记的标题',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '日记内容的类型，如0表示文字，1表示录音等',
  `diary_content` text NOT NULL COMMENT '日记的内容',
  `diary_rank` int(11) NOT NULL COMMENT '日记的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`diary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table diary
#

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table diary_comment
#

DROP TABLE IF EXISTS `diary_comment`;
CREATE TABLE `diary_comment` (
  `diary_id` int(10) unsigned NOT NULL COMMENT '日记ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日记的评论';

#
# Dumping data for table diary_comment
#

LOCK TABLES `diary_comment` WRITE;
/*!40000 ALTER TABLE `diary_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table efficacy
#

DROP TABLE IF EXISTS `efficacy`;
CREATE TABLE `efficacy` (
  `efficacy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '功效ID',
  `efficacy_name` varchar(32) NOT NULL COMMENT '功效名称',
  `efficacy_rank` int(11) NOT NULL COMMENT '功效的排序值，越大的优先级越高',
  PRIMARY KEY (`efficacy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Dumping data for table efficacy
#

LOCK TABLES `efficacy` WRITE;
/*!40000 ALTER TABLE `efficacy` DISABLE KEYS */;
INSERT INTO `efficacy` VALUES (1,'深层清洁',0);
INSERT INTO `efficacy` VALUES (2,'去角质',0);
INSERT INTO `efficacy` VALUES (3,'补水保湿',0);
INSERT INTO `efficacy` VALUES (4,'活肤滋润',0);
INSERT INTO `efficacy` VALUES (5,'美白/淡斑',0);
INSERT INTO `efficacy` VALUES (6,'提亮肤色',0);
INSERT INTO `efficacy` VALUES (7,'抗氧化',0);
INSERT INTO `efficacy` VALUES (8,'淡化细纹',0);
INSERT INTO `efficacy` VALUES (9,'抗皱紧肤',0);
INSERT INTO `efficacy` VALUES (10,'控油',0);
INSERT INTO `efficacy` VALUES (11,'细致毛孔',0);
INSERT INTO `efficacy` VALUES (12,'祛黑头',0);
INSERT INTO `efficacy` VALUES (13,'祛痘',0);
INSERT INTO `efficacy` VALUES (14,'祛痘印',0);
INSERT INTO `efficacy` VALUES (15,'舒缓抗敏',0);
INSERT INTO `efficacy` VALUES (16,'晒后修护',0);
INSERT INTO `efficacy` VALUES (17,'祛眼袋',0);
INSERT INTO `efficacy` VALUES (18,'祛黑眼圈',0);
INSERT INTO `efficacy` VALUES (19,'消除眼部浮肿',0);
INSERT INTO `efficacy` VALUES (20,'淡化眼部细纹',0);
/*!40000 ALTER TABLE `efficacy` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table feedback
#

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedback_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content` varchar(255) NOT NULL COMMENT '反馈的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员是否读过',
  PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table feedback
#

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_thumb` text NOT NULL COMMENT '商品缩略图',
  `goods_images` text NOT NULL COMMENT '商品细节图',
  `goods_score` float NOT NULL COMMENT '商品评分',
  `goods_forskin` set('干性','油性','混合性','中性','敏感性') NOT NULL DEFAULT '' COMMENT '商品适用的肤质',
  `goods_notforskin` set('干性','油性','混合性','中性','敏感性') DEFAULT '' COMMENT '商品不适合的肤质',
  `goods_noticeforskin` set('干性','油性','混合性','中性','敏感性') DEFAULT '' COMMENT '商品对应肤质用法需要注意的',
  `goods_age` set('20岁以下','20-25岁','26-30岁','30-35岁','36-40岁','40岁以上') NOT NULL COMMENT '商品适用的年龄范围',
  `goods_description` text NOT NULL COMMENT '商品的特点及成分',
  `goods_specification` text NOT NULL COMMENT '商品的用法',
  `goods_buy_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品销量',
  `goods_view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品浏览量',
  `goods_add_time` datetime NOT NULL COMMENT '商品的添加时间',
  `goods_last_update` datetime NOT NULL COMMENT '商品最后更新的时间',
  `goods_status` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '商品的状态，0表示不可用，3表示新添加待审核，6表示已审核',
  `goods_rank` int(10) NOT NULL COMMENT '商品的排序值，越大的优先级越高',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table goods
#

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,2,1,'test1','test','test',100,'敏感性','干性','干性','40岁以上','test','test',0,0,'2012-02-02','2012-02-02',3,1);
INSERT INTO `goods` VALUES (2,1,1,'test2','test','test',100,'敏感性','敏感性','敏感性','40岁以上','test','test',0,0,'2012-02-01','2012-02-01',3,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods_comment
#

DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品评论',
  `commentator` varchar(32) NOT NULL COMMENT '评论者名称',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `comment_level` tinyint(3) unsigned NOT NULL COMMENT '评论的星级，1,2,3,4,5',
  `comment_rank` int(11) NOT NULL COMMENT '评论的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=988 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table goods_comment
#

LOCK TABLES `goods_comment` WRITE;
/*!40000 ALTER TABLE `goods_comment` DISABLE KEYS */;
INSERT INTO `goods_comment` VALUES (1,1,'糯米呼呼','使用心得：不错，卸淡妆是不错的选择，要是太浓了恐怕不行哦，要是太浓就用另一款油的！',4,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (2,1,'qqfanli_475522326939','使用心得：只能卸日常的，化浓妆卸不干净',3,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (3,1,'jacylxf','使用心得：卸的不是很干净，有点刺激，不推荐。',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (4,1,'宝宝0329','优点：不错 使用心得：喜欢用，很好用，哈哈',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (5,1,'天街月色凉如水','优点：用着不错,干净 使用心得：用起来很舒服 我就又买了一瓶大的 价格也便宜 其实雅芳的卸妆油也不错 但是我还是喜欢卸妆乳',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (6,1,'牧眠','优点：优 使用心得：味道很好啦，用起来还可以，最重要是的确很便宜',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (7,1,'{霜儿}','优点：很温和 使用心得：跟另一款雅芳油质卸妆比起来 这款卸睫毛不是很干净 但是很温和',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (8,1,'十月良品','使用心得：挺好使得。而且挺便宜的，不错',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (9,1,'北京漂泊','使用心得：第一次用，之前听说挺好的，用了一下感觉很好，挺不错的',5,0,'2012-03-01 12:20:16');
INSERT INTO `goods_comment` VALUES (10,2,'小阳华西','使用心得：性质很温和，稍敏感的肌肤用起来很舒服。但用来卸防水的眼线睫毛膏还须辅助专用卸妆液。',5,0,'2012-03-01 13:39:46');
INSERT INTO `goods_comment` VALUES (11,2,'racheldchen','使用心得：用过以后再也没换过其他的卸妆产品，一物多能，油性和敏感皮肤大爱！',5,0,'2012-03-01 13:39:46');
INSERT INTO `goods_comment` VALUES (12,2,'dreamy7','使用心得：买来之后没有怎么用  应该还不错',5,0,'2012-03-01 13:39:46');
INSERT INTO `goods_comment` VALUES (13,3,'wzyuzhongmanbu','使用心得：只有这款!超级全效型！喷出来的水水质感很细密，带一点点沫沫，有时候懒得洗脸的时候，拿这款爽肤水擦擦脸脸就当清洁了，第二天起来一定不会冒痘痘。',5,0,'2012-03-01 13:51:19');
INSERT INTO `goods_comment` VALUES (14,3,'无情射手多情箭','使用心得：味道很好闻，至少没有刺鼻的酒精味，可以当爽肤水用，也可以做卸妆水，',5,0,'2012-03-01 13:51:19');
INSERT INTO `goods_comment` VALUES (15,4,'单影舞烟坟','使用心得：卸的还蛮干净的,特别难卸的只要敷一下就能轻松抹掉了.味道很香,而且不会刺激眼部,还特别清爽.',5,0,'2012-03-01 13:54:25');
INSERT INTO `goods_comment` VALUES (16,4,'monicawang04**@hotmail.com','使用心得：还成吧，就是有些迷眼',5,0,'2012-03-01 13:54:25');
INSERT INTO `goods_comment` VALUES (17,4,'beshuang','使用心得：玫瑰香味，非常温和，完全不刺激眼睛，卸妆干净',5,0,'2012-03-01 13:54:25');
INSERT INTO `goods_comment` VALUES (18,6,'褚征','使用心得：用过三款植村秀的洁颜，美白、樱花、此款，更喜欢樱花的味道，美白的功效，可惜美白的总缺货',5,0,'2012-03-01 14:57:22');
INSERT INTO `goods_comment` VALUES (19,7,'没落两块五','使用心得：很容易乳化也不油，卸的也干净。最主要性价比很高，味道也很好闻',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (20,7,'枕冷衾寒','使用心得：用后皮肤不干燥，很好用，雅芳卸妆油值得一试！干干净净',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (21,7,'单纯邂逅518','使用心得：这个卸妆油性价比很好，卸的也比较干净，不过有一次刺激，清洁力较好的洗面奶就十分清爽，清洁很彻底',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (22,7,'怡心小亭','使用心得：虽然很油 但是碰了水 但是碰了水就就马上乳化了 水多冲两遍就好了 卸的很干净 防水睫毛膏也没问题',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (23,7,'三文鱼V','使用心得：用了，很容易乳化也不油，卸的也干净，最主要性价比很高，味道也很好闻',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (24,7,'arldq','使用心得：还行吧，还是没DHC的好用',4,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (25,7,'carsto','使用心得：勉强可以吧，乳化效果不理想',3,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (26,7,'酷爽柠檬茶','使用心得：包装很精细，总之非常满意！',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (27,7,'小腰1','使用心得：不错，卸的很干净，赞一个。',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (28,7,'瞳小Q','使用心得：刚收到货，应该会很好用~',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (29,7,'5242407**','使用心得：用了一次，不错很滋润，乳化的也很不错。',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (30,7,'tengqingshu','使用心得：很好卸的一款油，真的很大瓶',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (31,7,'fangying0219','使用心得：好大一瓶，价格实惠，还没用',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (32,7,'mitaoqing','使用心得：很实惠的一款哦，很好用，卸的很干净，也很好清洗。还有淡淡的香味。喜欢',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (33,7,'cxllynn','使用心得：多量平价，卸妆效果很好，淡淡的香味。下次还买。',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (34,7,'谢君','使用心得：正品特价很实惠，也很好用！',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (35,7,'启迪橱柜','使用心得：一直没用过这个卸妆油，晚上用了一下感觉卸妆效果还可以，挺划算的。',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (36,7,'流星删除不良信息','使用心得：卸得很干净，而且很值',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (37,7,'*雪满楼*','优点：可以用很久 使用心得：效果还不错,性价比较高哦!',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (38,7,'shashuo','使用心得：性价比很高，效果也不错。量很大，估计要用很长时间了。',5,0,'2012-03-01 15:22:13');
INSERT INTO `goods_comment` VALUES (39,11,'athenaRH','使用心得：忐忑的买了，幸运的是很满意，哇哈哈',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (40,11,'chouchao','使用心得：有点油,但效果还是不错的,我就是卸隔离,卸的挺干净的，性价比挺高的',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (41,11,'天空之蔚蓝','使用心得：涂抹在脸上，妆一下就浮出来了！非常好，还是天然配方，对皮肤伤害不大，温和',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (42,11,'hedeqing','使用心得：终于买到了，不过很讨厌它的味道，但是乳化效果还算好。不过不知道是不是洗面奶清洁度不够，脸上会有小小的痘痘。',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (43,11,'viki82110','使用心得：卸妆效果挺好的，比较油腻，不是很清爽。  还不错了。。',4,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (44,11,'金灼子','使用心得：没问题，正品的，我一直在用，所以知道哦。',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (45,11,'arlern008','使用心得：没用过，期待效果',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (46,11,'yumikaa','使用心得：小小罐挺方便携带，喜欢~',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (47,11,'HXZ523','使用心得：一直用这款卸妆，好用，这次买小包装，出门带着好方便，喜欢',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (48,11,'abbyljh0108','使用心得：很好用啊，不愧为明星产品',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (49,11,'tian315878','使用心得：不错，挺好的！',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (50,11,'summeryu','使用心得：真的卸得好干净！',5,0,'2012-03-01 15:23:22');
INSERT INTO `goods_comment` VALUES (51,12,'果品燕来','使用心得：主要喜欢这个二合一的功效，卸妆清洁一次完成，不那么麻烦。所以很喜欢。',5,0,'2012-03-01 15:23:33');
INSERT INTO `goods_comment` VALUES (52,12,'出名不趁早','使用心得：卸妆效果真是很不错，卸一次就非常的干净了，又不会干燥，挺温和。',5,0,'2012-03-01 15:23:33');
INSERT INTO `goods_comment` VALUES (53,12,'杨洋7709','使用心得：非常不怎么样。前天用了一次，脸就过敏了。现在还肿着呢。本来想支持国货来着。最可气的是也没有看见提示敏感肌肤慎用的字眼。',5,0,'2012-03-01 15:23:33');
INSERT INTO `goods_comment` VALUES (54,14,'cat626','使用心得：洗的也很洁净 很清新 但是又不会干 很好的产品',5,0,'2012-03-01 15:23:36');
INSERT INTO `goods_comment` VALUES (55,14,'寻找发言权','使用心得：非常温和 不刺激 卸妆干净 我有些敏感用了都完全没问题 甚至比有些大牌卸妆还好用哦 赞~~',5,0,'2012-03-01 15:23:36');
INSERT INTO `goods_comment` VALUES (56,14,'竹君作文','使用心得：卸妆能力还不错，但不能对付防水彩妆，泡沫很细腻很丰富',5,0,'2012-03-01 15:23:36');
INSERT INTO `goods_comment` VALUES (57,15,'zw4688','使用心得：这一款是性价比最好的一款，乳化效果很好，轻柔无刺激，轻轻松松的就把一天的残留带走，用完后不会有太油或太干的感觉，以后会一直用的！！',5,0,'2012-03-01 15:23:37');
INSERT INTO `goods_comment` VALUES (58,15,'兜里有糖82','使用心得：在专门店已经买过无数瓶了，我用的比较废，容量应该再多一点就好了。清洁彩妆一流，比植村秀什么的，都好用。虽然是油，但不会有一点油腻的感觉。经常上妆MM推荐一下',5,0,'2012-03-01 15:23:37');
INSERT INTO `goods_comment` VALUES (59,15,'玫瑰灰1103','使用心得：好用，乳化彻底。不会担心有残留长痘痘，不会担心洗不干净，而且还很耐用。',5,0,'2012-03-01 15:23:37');
INSERT INTO `goods_comment` VALUES (60,15,'willow0811','使用心得：这个卸妆油还好吧没有特别大的特色卸的比较干净，很温和 用量少',5,0,'2012-03-01 15:23:37');
INSERT INTO `goods_comment` VALUES (61,16,'手绘小美女','使用心得：淡淡的香味，喷到眼睛上也不会难受！用后觉得脸润润的很舒服啊！',5,0,'2012-03-01 15:23:38');
INSERT INTO `goods_comment` VALUES (62,16,'四季香山1','使用心得：太喜g了，特e是@淡淡的味道。',5,0,'2012-03-01 15:23:38');
INSERT INTO `goods_comment` VALUES (63,17,'笨兮兮','使用心得：我不化妆，就用来卸卸隔离和睫毛膏，可以卸的干净，这个有保湿的效果，像曾保护膜似的。。',5,0,'2012-03-01 15:23:39');
INSERT INTO `goods_comment` VALUES (64,17,'第彡茨痛M','使用心得：用这个卸妆，然后用清水洗一下脸，卸妆挺干净的，没有什么味道，也温和，推荐敏感皮用！',5,0,'2012-03-01 15:23:39');
INSERT INTO `goods_comment` VALUES (65,18,'xml_jxgz','使用心得：这款卸妆乳虽然温和，但卸的特别干净，倒在化妆棉上干擦脸就OK拉',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (66,18,'智者乐仁者寿','使用心得：味道清新不刺激，有淡淡香味。温和不刺激。',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (67,18,'紫陌尘事','使用心得：质地清爽幼滑，淡淡的香味。我是干用的，在脸上按摩一会儿用水冲洗。用完脸滑滑的。淡妆没问题的。挺干净，也不长痘痘。',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (68,18,'新鲜旧情人','使用心得：没想到效果出乎意料得好。 味道清新不刺激。',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (69,18,'御用文人','使用心得：这款卸妆乳虽然温和，但卸的特别干净，倒在化妆棉上干擦脸就OK拉',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (70,18,'含泪冰凌花','使用心得：不用卸妆了，卸妆洁面，直接一步就搞定，太爽了。关键是可以湿用啊 ！简单，快捷，卸的干净',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (71,19,'sabrina末末','使用心得：没想到效果很不错 温和不刺激 即使不小心到眼睛里也没有像卸妆油一样痛苦……',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (72,19,'闲不住的闲人','使用心得：每次可以用很少的量，但是依旧可以卸得很干净。。。虽然价格有一点点小贵，不过还是很划算的，至少质量还是很不错的',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (73,19,'小帖子','使用心得：这款卸妆产品是我个人很喜欢的 因为我的皮肤比较干 以前用的别的卸妆产品不是卸不干净就是用完脸紧绷绷的，这款却不一样，用完很舒服，而且卸得也干净，不错！',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (74,19,'含泪冰凌花','使用心得：防水的睫毛膏都可以很轻松的卸干净哦，很且温和不刺激。',5,0,'2012-03-01 15:23:40');
INSERT INTO `goods_comment` VALUES (75,20,'bt_xixi','使用心得：好用！值得买',5,0,'2012-03-01 15:23:41');
INSERT INTO `goods_comment` VALUES (76,20,'自然美11','使用心得：卸妆能力不错！尤其是对于很难卸的顽固型睫毛膏能快速除去，弄到眼睛里面不会有任何不适的感觉，皮肤也不会起什么闭合性粉刺！',5,0,'2012-03-01 15:23:41');
INSERT INTO `goods_comment` VALUES (77,20,'舔舔棒棒糖','使用心得：眼唇卸的非常舒服，就算有溢进眼睛里一点也不会觉得辣辣的，好难得啊，非常合我的意！卸的好干净又不会觉得干涩！',5,0,'2012-03-01 15:23:41');
INSERT INTO `goods_comment` VALUES (78,21,'全球心跳','使用心得：使用感很好，洗完了有很明显的涩涩的感觉，觉得洗得很干净，但是一点都不干，再用液体皂，就滑滑的了',5,0,'2012-03-01 15:23:42');
INSERT INTO `goods_comment` VALUES (79,21,'shdcxdg','使用心得：卸的干净、泡沫也很容易洗干净，洗完脸后感觉，柔柔润润又很干净，皮肤好像吸了好多水啊。',5,0,'2012-03-01 15:23:42');
INSERT INTO `goods_comment` VALUES (80,21,'chenxi_girl','使用心得：不好，辣眼睛……',2,0,'2012-03-01 15:23:42');
INSERT INTO `goods_comment` VALUES (81,21,'tjfengling','使用心得：还可以 效果不错',4,0,'2012-03-01 15:23:42');
INSERT INTO `goods_comment` VALUES (82,21,'舔舔棒棒糖','使用心得：泡沫很多啊，用起来很舒服。清洁力强。很小巧，携带方便，很不错！',5,0,'2012-03-01 15:23:42');
INSERT INTO `goods_comment` VALUES (83,27,'飘渺SKY','使用心得：用它来卸眼部,超干净的!很经用，而且很温和，大爱。',5,0,'2012-03-01 15:23:47');
INSERT INTO `goods_comment` VALUES (84,27,'sabrina末末','使用心得：用在眼睛上挺温和的，不觉得刺激眼睛,卸妆快也干净.',5,0,'2012-03-01 15:23:47');
INSERT INTO `goods_comment` VALUES (85,28,'紫陌尘事','使用心得：这个果然是保湿型的，用完也不油不干，最重要的是卸妆很干净',5,0,'2012-03-01 15:23:48');
INSERT INTO `goods_comment` VALUES (86,28,'jwlavatar','使用心得：满足痘肌的一切需求昂，卸得干净！！卸后清爽！！',5,0,'2012-03-01 15:23:48');
INSERT INTO `goods_comment` VALUES (87,28,'咪咪s巫','使用心得：真是清洁的非常彻底，很好用，非常值得推荐',5,0,'2012-03-01 15:23:48');
INSERT INTO `goods_comment` VALUES (88,44,'请你爆料','使用心得：虽然我没用过别的牌子的卸妆油，但就我感觉，这款还是很不错',5,0,'2012-03-01 15:34:02');
INSERT INTO `goods_comment` VALUES (89,44,'二手市场','使用心得：明星产品就是明星产品，刚开始使用有点不习惯，后来就发现它的好了，妆真的卸的很干净，用了两瓶了已经。',5,0,'2012-03-01 15:34:02');
INSERT INTO `goods_comment` VALUES (90,44,'makiyo000','使用心得：乳化的效果真的没的说，洗完后手一点儿都不油，而且也卸的很干净。',5,0,'2012-03-01 15:34:02');
INSERT INTO `goods_comment` VALUES (91,44,'青天碧雨','使用心得：虽然说是油哦~~但是感觉算是比较清爽的咯~~而且乳化能力真的很强哦~~轻轻按摩就可以看见所有残妆都被清理干净了哦~~而且就算防水睫毛膏也可以去除得超级干净呢！',5,0,'2012-03-01 15:34:02');
INSERT INTO `goods_comment` VALUES (92,45,'幕笛','使用心得：一直在用这个。卸起来很干净，不会象卸妆油一样满脸都是油，之后用个洁面乳一洗很是干净。',5,0,'2012-03-01 15:34:03');
INSERT INTO `goods_comment` VALUES (93,45,'单影舞烟坟','使用心得：感觉很不错哇，很不刺激，卸的很干净。不会过敏，用起来很放心。',5,0,'2012-03-01 15:34:03');
INSERT INTO `goods_comment` VALUES (94,48,'南宫星落','使用心得：效果也不错,很温和。舒适，不紧绷。是我用过的最好用的卸妆产品，真的很不错，值提推荐！还会继续光顾！',5,0,'2012-03-01 15:34:06');
INSERT INTO `goods_comment` VALUES (95,49,'宋小小2011','使用心得：只是偶尔化妆，屯了这瓶备用，呵呵',5,0,'2012-03-01 15:34:07');
INSERT INTO `goods_comment` VALUES (96,49,'谁能忘记梦里人','使用心得：是正品，很难得在网上也可以买到实惠的正品，很好用，就是发货慢。还会再来。',5,0,'2012-03-01 15:34:07');
INSERT INTO `goods_comment` VALUES (97,49,'哆啦A梦是姿迷','使用心得：这个卸得真的很干净，好用',5,0,'2012-03-01 15:34:07');
INSERT INTO `goods_comment` VALUES (98,51,'liufangzhe','使用心得：做得很像的仿品，味道和质地很像真的，但从盖上的ciq标志做的很假，模糊不清，揭下来的数字继续保留在标签上，而没有粘在盒子上。',1,0,'2012-03-01 15:34:09');
INSERT INTO `goods_comment` VALUES (99,51,'安亦城','使用心得：效果也不错,很温和。舒适，不紧绷',5,0,'2012-03-01 15:34:09');
INSERT INTO `goods_comment` VALUES (100,51,'小沫26','使用心得：超好用！按照手法打圈之后用化妆棉擦，才发现原来脸这么脏。。PS：我还没用粉底隔离什么的呢',5,0,'2012-03-01 15:34:09');
INSERT INTO `goods_comment` VALUES (101,51,'缘Y66_@','使用心得：好用，已经是第二瓶了。',5,0,'2012-03-01 15:34:09');
INSERT INTO `goods_comment` VALUES (102,52,'谭灿','使用心得：不错  卸妆效果很好 很干净',5,0,'2012-03-01 15:58:42');
INSERT INTO `goods_comment` VALUES (103,52,'jessica_祯','使用心得：还没用过，应该还是不错的，价格也合适',5,0,'2012-03-01 15:58:42');
INSERT INTO `goods_comment` VALUES (104,52,'stop倒数','使用心得：不错&#183;&#183;&#183;&#183;&#183;',5,0,'2012-03-01 15:58:42');
INSERT INTO `goods_comment` VALUES (105,52,'mimilaifu','使用心得：因为没有用彩妆，所以不知道怎么样，不过朋友推荐使用的，应该是不错的',4,0,'2012-03-01 15:58:42');
INSERT INTO `goods_comment` VALUES (106,53,'雨薇001','使用心得：卸妆卸比较干净，只要认真卸，基本不会有残留，效果很明显',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (107,54,'huanglijuan356','使用心得：很浓，有点跟猪油一样摇了都不会动粘在瓶壁上，还是冬天会这样啊?是正品吧',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (108,54,'囡囝淘淘','使用心得：很不错，卸的很干净。。。',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (109,54,'深水幽蓝027','使用心得：昨天刚收到货，打开包装一惊，和我在专柜买的包装大有不同，睫毛膏也对比了一下，外包装也有点不一样！所以担心不是正品，不敢用！',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (110,54,'过客匆匆','使用心得：刚收到这款，还没用，就是味道太香有点刺鼻',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (111,54,'夏末安宁','使用心得：很满意  还用了专门的袋子包装',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (112,54,'mitaoqing','使用心得：这款卸妆乳有淡淡的香味，很喜欢。卸的比较干净，有些油，用洗面奶清洗就ok了。适合干性皮肤使用。',4,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (113,54,'icetoto','使用心得：很舒服哈，喜欢',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (114,54,'qqfanli_42699070537','使用心得：不错的一款卸妆乳&#183;&#183;&#183;&#183;O(∩_∩)O~&#183;&#183;',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (115,54,'吴西','使用心得：不错哦~ 不刺激，好用~',5,0,'2012-03-01 15:58:43');
INSERT INTO `goods_comment` VALUES (116,55,'coney2012','使用心得：还不错，但是还是觉得没有露得请洗的干净。。。。',5,0,'2012-03-01 15:58:44');
INSERT INTO `goods_comment` VALUES (117,55,'lillian1215','使用心得：快递太慢，保湿效果感觉一般，清洁力度比较强',4,0,'2012-03-01 15:58:44');
INSERT INTO `goods_comment` VALUES (118,59,'mrxxie','使用心得：不会敏感起痘，一般的淡妆可以卸的挺干净',5,0,'2012-03-01 15:58:48');
INSERT INTO `goods_comment` VALUES (119,59,'lily9194','使用心得：最喜欢这款卸妆乳，味道清新，也不油腻，卸的很干净，而且成分天然，不会引起敏感，起痘现象，而且价格便宜，每次就可以大量用也不心疼，妆容可以卸的很彻底，赞！',5,0,'2012-03-01 15:58:48');
INSERT INTO `goods_comment` VALUES (120,60,'angelli','使用心得：好好用，所有再买！是我用过的洗面奶之中最无刺激性的一款了！客服果然没有介绍错！',5,0,'2012-03-01 15:58:49');
INSERT INTO `goods_comment` VALUES (121,60,'amyding','使用心得：春天用很好，夏天用也很好，清爽还不紧绷 洗的也很干净，还很经用，非常爱啊',5,0,'2012-03-01 15:58:49');
INSERT INTO `goods_comment` VALUES (122,60,'{霜儿}','使用心得：很温和，没泡的，洗后不会紧绷，洗眼睛周围也很放心，绝对不会刺激',5,0,'2012-03-01 15:58:49');
INSERT INTO `goods_comment` VALUES (123,60,'怡心小亭','使用心得：非常好用 好大一瓶的 用完非常舒服 比较温和',5,0,'2012-03-01 15:58:49');
INSERT INTO `goods_comment` VALUES (124,61,'大火星','使用心得：强太多了,连唇蜜一起卸的,好像挺干净,起码没白包包,希望可以保持啊',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (125,61,'冰月冷锋','使用心得：确实能揉出一些颗粒的东东，眼妆也可以彻底迅速地消灭掉，清洁力无敌啊',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (126,61,'胡同大妈','使用心得：卸妆卸的很干净，平时用来洗脸也不刺激',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (127,62,'枕冷衾寒','使用心得：清洁力度强，卸完妆后不油不紧绷，让我这个干皮能安心过冬了。',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (128,62,'昭D','使用心得：卸得干净外还保湿，无油腻感的洁妆油还真的很难找。',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (129,62,'ilyanmin','使用心得：恩，卸完不觉得干，很温和，不过我是痘痘肌，用了冒痘痘。但是我姐姐用了还是觉得挺好的，不长痘的人可以建议使用',5,0,'2012-03-01 15:58:52');
INSERT INTO `goods_comment` VALUES (130,63,'瓷碗清茶','使用心得：挺好的一款，不油腻，卸妆也是立竿见影，味道还好闻，各方面都优。洗完脸上也清爽舒服',5,0,'2012-03-01 15:58:53');
INSERT INTO `goods_comment` VALUES (131,63,'xxweng','使用心得：清洁力不错，浓妆眼妆都搞的定。加水乳化效果也不错，不油腻，很合格的一款卸妆油。',5,0,'2012-03-01 15:58:53');
INSERT INTO `goods_comment` VALUES (132,64,'bag321','使用心得：味道很好闻，款确实比较滋润 洗完脸后也比较舒服',5,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (133,64,'~无知~','使用心得：虽然乳化过程有点慢。但是卸妆能力超强。',5,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (134,64,'ranzizhang','使用心得：一直在用的品牌商品',5,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (135,65,'樊美美','使用心得：是款不错的清洁爽，卸妆卸的很干净。',5,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (136,65,'chen0728','使用心得：佰草集的东西都很不错，这款也超好用，纯天然，无刺激，适合我这样的敏感肌肤',5,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (137,65,'曦曦bao','使用心得：不喜欢，不好用。',3,0,'2012-03-01 15:58:54');
INSERT INTO `goods_comment` VALUES (138,66,'applebul**@yahoo.cn','使用心得：不错~香香的~',5,0,'2012-03-01 15:58:55');
INSERT INTO `goods_comment` VALUES (139,70,'lady馨','使用心得：很香，不错！',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (140,70,'大嘴巴猴子','使用心得：很温和 味道也很好 卸妆很干净 挺舒服的 推荐',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (141,70,'icetoto','使用心得：第二瓶了，很喜欢这款的眼唇卸妆',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (142,70,'miayue','使用心得：很温和，卸的也很干净，大米系列的都很好',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (143,70,'汤汤小布丁','使用心得：味道挺好闻，试用了一下，还行，不过涂上有点油',4,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (144,70,'lixiao006','优点：洁面比较干净 使用心得：东东很不错哦，洗的挺干净',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (145,70,'琴瘦97','优点：感觉很清透 使用心得：非常好，洗完脸感觉很清透',5,0,'2012-03-01 15:58:57');
INSERT INTO `goods_comment` VALUES (146,71,'皮皮妙妙猫','使用心得：不错哦~味道很好 挺滋润的，卸的很干净。',5,0,'2012-03-01 15:58:58');
INSERT INTO `goods_comment` VALUES (147,71,'细蚂蚱','使用心得：卸妆效果不错哦，物有所值！第2次购买了，嘻嘻。。。',5,0,'2012-03-01 15:58:58');
INSERT INTO `goods_comment` VALUES (148,71,'臭美妮','使用心得：味道好好闻，神奇的卸妆油，连kiss me巨防水那种睫毛膏都能卸！',5,0,'2012-03-01 15:58:58');
INSERT INTO `goods_comment` VALUES (149,71,'icetoto','使用心得：好油，要洗2遍感觉才干净。比起另款乳状的，那款好用多了，个人是不太喜欢这种油油的',5,0,'2012-03-01 15:58:58');
INSERT INTO `goods_comment` VALUES (150,73,'错过不在','使用心得：很温和，卸两遍就差不多干净了，价格也很实惠',5,0,'2012-03-01 15:58:59');
INSERT INTO `goods_comment` VALUES (151,74,'all1102008','使用心得：很多泡泡，一点点就够洗',5,0,'2012-03-01 15:59:02');
INSERT INTO `goods_comment` VALUES (152,74,'mengmeng1112','使用心得：相当不错的,以前在日本买的还要便宜些',5,0,'2012-03-01 15:59:02');
INSERT INTO `goods_comment` VALUES (153,75,'mfs886','使用心得：蛮好用的，卸的很干净，而且脸部也不会油油的，效果不错。',5,0,'2012-03-01 15:59:03');
INSERT INTO `goods_comment` VALUES (154,76,'嗖嗖跳出来','使用心得：整体来说很不错，特别是皮肤比较干的，用完脸上润润的',5,0,'2012-03-01 15:59:03');
INSERT INTO `goods_comment` VALUES (155,76,'飞华剑岚','使用心得：适合中干性皮肤,很温和，卸妆比较干净，效果很自然清新',5,0,'2012-03-01 15:59:03');
INSERT INTO `goods_comment` VALUES (156,76,'戒情指环','使用心得：质量很不错，卸的很干净的，也不干，挺好的',5,0,'2012-03-01 15:59:03');
INSERT INTO `goods_comment` VALUES (157,76,'枫初','使用心得：稀薄的卸妆油，效果挺好的，香味淡淡的很喜欢，卸的很干净，用了挺舒服的。',5,0,'2012-03-01 15:59:03');
INSERT INTO `goods_comment` VALUES (158,77,'magic牛哥','使用心得：这个卸得很干净，不粘不腻不刺激，很温和，能舒缓皮肤。',5,0,'2012-03-01 15:59:05');
INSERT INTO `goods_comment` VALUES (159,77,'mayuwei','使用心得：卸的蛮干净的 而且味道淡淡的香香的 一点也不油',5,0,'2012-03-01 15:59:05');
INSERT INTO `goods_comment` VALUES (160,78,'14454262**@qq.com','使用心得：说实在的我还真不太明白这个怎么用就买了，今天没有化眼妆所以还看不出效果，不过真的很大盒，味道不刺鼻很淡淡的感觉，用在脸上很舒服，感觉脏东西一下就下来了，就是有一点油油的，不过不碍事，抹在手上也很润',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (161,78,'寻找发言权','使用心得：这款挺滋润的，香香的水果味到很喜欢，卸淡妆效果不错，用完感觉皮肤很滋润，连眼周都不会紧绷',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (162,78,'zwjforward','使用心得：淡淡的香味，很好闻，膏体很细腻，涂在脸上后就变成油了，好神奇，然后就按摸脸部，我还不小心弄到眼睛里了，但是不刺激眼睛，很好',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (163,78,'紧扣啦','使用心得：用起来不会起反应。效果真的很不错，味道很好闻，整个卸妆过程很享受，我不存在眼睛卸不掉的这个问题，因为不管我用哪款卸妆都只会用眼唇卸妆液先卸掉眼妆再用别的卸掉底妆，以后会一直用下去',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (164,78,'北京漂泊','使用心得：买了之后一直是卸妆用的 虽然很油 但是卸妆效果很好 味道超级好闻啊',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (165,78,'水BUBU','使用心得：很油，感觉有点软化的效果，卸妆效果一般',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (166,78,'浩浩混泥巴','使用心得：本来买了很久都没有怎么用.今天心血来潮拿来按摩.没有想到给了个我想不到的效果.按摩的时候能把我的好多黑头都按摩出来了.真的好舒服.',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (167,78,'酷爽柠檬茶','使用心得：味道香香的，用起来也很舒服，而且送货很快',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (168,78,'5242407**','使用心得：很不错奥。。 防水的睫毛膏啊啥的 搓一会 也能卸掉。。。',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (169,78,'saisaiwekiya','使用心得：很细腻 用完再用洗面奶清洗更彻底',5,0,'2012-03-01 15:59:06');
INSERT INTO `goods_comment` VALUES (170,80,'ranzizhang','使用心得：一直在用的品牌商品',5,0,'2012-03-01 15:59:07');
INSERT INTO `goods_comment` VALUES (171,80,'zhyf','使用心得：还行，好用！！！',5,0,'2012-03-01 15:59:07');
INSERT INTO `goods_comment` VALUES (172,82,'echinus','使用心得：没有FANCL的卸妆油效果好，睫毛膏卸不干净。会有残留。',1,0,'2012-03-01 15:59:08');
INSERT INTO `goods_comment` VALUES (173,82,'nobady-xd','使用心得：好，不错的，下回买绿茶的',5,0,'2012-03-01 15:59:08');
INSERT INTO `goods_comment` VALUES (174,82,'lj--870525','使用心得：很好用，睫毛膏也能一起卸干净，不错哦',5,0,'2012-03-01 15:59:08');
INSERT INTO `goods_comment` VALUES (175,82,'yuan2739','使用心得：看着还不错，还没开始用',5,0,'2012-03-01 15:59:08');
INSERT INTO `goods_comment` VALUES (176,82,'4549116**@qq.com','使用心得：很好用的    喜欢 不会很油  很舒服',5,0,'2012-03-01 15:59:08');
INSERT INTO `goods_comment` VALUES (177,83,'lspmhyyyy','使用心得：我怎么洗不出所谓的泡沫啊，还油油的？',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (178,83,'ranzizhang','使用心得：一直用植村秀的洁颜油',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (179,83,'NBANB','使用心得：不错很好用。洗的很干净。清洁效果很好。',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (180,83,'沅','使用心得：很喜欢这款洁颜油，清洁功效没的说，用后滋润不干燥.超好用~~~',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (181,83,'永明福彩','使用心得：卸妆后不会油油的，也不会干干的，卸妆很干净，蛮好用 。',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (182,83,'瑞雪斋主','使用心得：卸妆效果不错，有种透透的亮亮的感觉，说实话很改善我的皮肤，因为我是那种黄色皮肤，很有用！',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (183,83,'水平座小涵','使用心得：打开来闻了一下 幽幽的绿茶味 呵呵 。用了一点都不敏感，感觉还不错哦',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (184,83,'viki82110','使用心得：虽然是明星推荐的，没感觉有多么的好用。还可以吧，感觉贵了点...应该不会再选购了。',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (185,83,'summeryu','使用心得：卸得很干净，名不虚传，就是有点费！',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (186,83,'木木草利','使用心得：好用！！！',5,0,'2012-03-01 15:59:09');
INSERT INTO `goods_comment` VALUES (187,84,'apple11119','使用心得：有点沙，卸妆很干净',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (188,84,'wanyanh**@open.com.cn','使用心得：特价时买的,能卸的很干净,不愧是大牌',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (189,84,'czysi**@163.com','使用心得：第一次用，我是经常化妆的人，所以感觉还不够干净。不过那个卸妆乳好用。。',4,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (190,84,'feiyan0930','使用心得：卸得还算干净，不过有点刺激',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (191,84,'raekong','使用心得：水性的用起来不会油油的,有一点点小泡沫',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (192,84,'yeye894','使用心得：性价比很高，我很少用的',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (193,84,'nuonuo33','使用心得：100ml不多 应该买几瓶屯着',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (194,84,'10696558**@qq.com','使用心得：卸妆还算彻底，只是千万别弄到眼睛里，很刺激，受不了。',4,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (195,84,'LOVE荔枝','使用心得：很不e 是正品 服 售後 各方面都M意 ^m支持！',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (196,84,'情花毒','使用心得：已经是第二瓶了，效果就不多说了。干净。、',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (197,84,'lxoolx6087','使用心得：卸的蛮干净的，就是有时弄到眼睛里边，觉得有点刺激。',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (198,84,'小腰1','使用心得：卸防水的睫毛膏有点费劲。',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (199,84,'jessica118','使用心得：真的超好用，特价时买的，希望能再特价一次，多买几瓶存着',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (200,84,'ellexiamin','使用心得：很不错的一款卸妆液，温和无刺激，就算进到眼睛里也不会担心，很好用~~~',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (201,84,'飘飘是小鬼','使用心得：很好用，特价是买的，很划算~！很温和，卸的很干净~！！！',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (202,84,'尚艳华','使用心得：很温和,但不能卸睫毛膏',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (203,84,'ppzaitian','使用心得：昨晚开始用，不错，卸妆很干净而且也不扎眼睛。',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (204,84,'EE124','使用心得：用了一段时间才来评价的。超好用的一款卸妆液，不会有油油的感觉。卸得很干净，比较难卸妆的睫毛膏也能完全卸掉。没有任何刺激，大力推荐~~',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (205,84,'jiaojiao623','使用心得：网购买东西最关心的就是是不是正品，这个绝对是正品，跟我在英国的买的一模一样，超爱~~~',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (206,84,'345731**@QQ.COM','使用心得：东西不错，卸的挺干净',4,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (207,85,'眼里揉不进沙','使用心得：卸妆乳很好用，很温和，不刺激皮肤，而且卸得很干净',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (208,85,'miss.pudding','使用心得：很温和，很清香，非常适合干性皮肤和秋冬季节使用！',4,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (209,85,'bluediana','使用心得：终于收到货了，晚上赶紧试用了一把，感觉还不错，很温和，有淡淡的清香，干性肌肤用了挺好的，之前用了很多款，但洗脸之后还是觉得紧绷，这款用了之后皮肤是比较滑爽的，现在搭配整套的水份缘系列，保湿滋润效果还不错。不过，如果是经常化彩妆的，建议还是先用卸妆油，这样会卸得更干净。',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (210,85,'范雪花123','优点：卸装 使用心得：呵呵，准备开始使用，期待好的效果',5,0,'2012-03-01 15:59:10');
INSERT INTO `goods_comment` VALUES (211,86,'laura1106','使用心得：买过好几瓶了,洗后没有紧绷感,很滋润,很喜欢的一款洗面奶!',5,0,'2012-03-01 15:59:11');
INSERT INTO `goods_comment` VALUES (212,86,'qqfanli_890448105497','使用心得：用了  感觉好像卸不太干净哦 塑封 没盒子 应该是正品吧',5,0,'2012-03-01 15:59:11');
INSERT INTO `goods_comment` VALUES (213,87,'tangyijie','使用心得：专门用来对付防水眼妆，至今为止未找到比它更强大的，所以会一直使用。',5,0,'2012-03-01 15:59:12');
INSERT INTO `goods_comment` VALUES (214,87,'蝶飞夜萤','使用心得：感觉很不错，清洁能力挺强的，不刺激，而且也不会很油腻，擦上去一会后用化妆棉稍微擦一下就能擦掉了，一点油光都没有，挺好的，个人挺满意',5,0,'2012-03-01 15:59:12');
INSERT INTO `goods_comment` VALUES (215,88,'蝶飞夜萤','使用心得：一点都不刺激眼睛，一下子就能卸干净。',5,0,'2012-03-01 15:59:12');
INSERT INTO `goods_comment` VALUES (216,89,'redfreefly','使用心得：很好用，清洁睫毛膏非常轻松，干净彻底。。。下次还买这款',5,0,'2012-03-01 15:59:13');
INSERT INTO `goods_comment` VALUES (217,89,'bingying125','优点：卸妆容易 使用心得：很不错，轻轻敷一下，轻轻一擦就卸掉了，很干净很清爽，而且又不刺激',5,0,'2012-03-01 15:59:13');
INSERT INTO `goods_comment` VALUES (218,89,'老冰~','优点：卸妆彻底，不油腻也不紧绷 使用心得：迄今为止用过的最好用最温和卸妆最快速最彻底的卸妆液！以前一直都比较信赖卸妆油，觉得卸的比较干净彻底。每次浓妆过后卸妆都很麻烦。虽然这是眼唇卸妆液，但是在浓妆的时候我会用这个卸全脸。别看是水状质地，一点不输给卸妆油。倒在化妆棉上，在眼睛上稍微敷一下，再轻轻一擦，立刻干干净净，简直神奇！既不油腻也不紧绷。盖子的设计很有意思，即使出差携带也不用担心会漏出来。超赞~~',5,0,'2012-03-01 15:59:13');
INSERT INTO `goods_comment` VALUES (219,90,'男人何必在乎','使用心得：一直当脸部卸妆用，原来是眼部舒缓卸妆乳，很好用，一点也不刺激，很干净的',5,0,'2012-03-01 15:59:14');
INSERT INTO `goods_comment` VALUES (220,90,'小傻猫儿','使用心得：这款卸妆乳是比较浓稠的润霜状的，没有什么味道，也不起泡。对于眼妆，比如眼影和睫毛膏也很容易卸',5,0,'2012-03-01 15:59:14');
INSERT INTO `goods_comment` VALUES (221,91,'sanfengongsi123','优点：洗后不干涩 使用心得：感觉很好，我是干性皮肤，用后皮肤很干净但不干燥。推荐',5,0,'2012-03-01 15:59:14');
INSERT INTO `goods_comment` VALUES (222,91,'摩道','优点：很好用，温和洁颜 使用心得：也是看了大S的介绍才买的，第一次就买了最大包装的，很好用，温和洁颜，很易洗净，用后不干不油。',5,0,'2012-03-01 15:59:14');
INSERT INTO `goods_comment` VALUES (223,92,'忧忧自欢','使用心得：淡妆能卸，用后皮肤不紧绷。皮肤很软，很舒服，很温和。',4,0,'2012-03-01 15:59:15');
INSERT INTO `goods_comment` VALUES (224,93,'maoweifei','使用心得：很好，卸的挺干净。',5,0,'2012-03-01 15:59:15');
INSERT INTO `goods_comment` VALUES (225,93,'殷雯','使用心得：太油了 用过之后要用洗面奶洗两次才能洗干净',5,0,'2012-03-01 15:59:15');
INSERT INTO `goods_comment` VALUES (226,93,'njhdv','优点：干净 使用心得：卸妆很方便，也没有刺激性！',5,0,'2012-03-01 15:59:15');
INSERT INTO `goods_comment` VALUES (227,94,'{霜儿}','使用心得：冰冰凉凉的很舒服 而且很干净 配合薇姿的洁肤水效果更好 。',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (228,94,'舍舍包子','使用心得：不仅温和，而且很保湿很滋润，真是值得推荐，价钱又公道。',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (229,94,'心尖上的烟头','使用心得：我是敏感肌肤都用的很舒服，卸完妆脸都嫩嫩的 也没有什么过敏长粉刺之类的 迷上它了',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (230,94,'卢豆豆之家','使用心得：用着还可以，但我不习惯不水洗。搽完后我还是用水洗了的。',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (231,94,'yiyan311','使用心得：虽然不习惯不用水洗，但用了，皮肤是挺润的，',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (232,94,'南京蜀雅黎水电','优点：很保湿，很舒服，不刺激 使用心得：无意中买到的，却发现很好，价格也合理，倒在化妆棉上轻轻擦拭就会发现化妆棉黄黄的，重复两次，基本可以卸干净，重要的是很保湿，很舒服，不刺激，也不会像卸妆油那么油，弄得满脸不舒服，很方便，不错不错，支持！！！',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (233,94,'华利','优点：卸的很干净。不刺激 使用心得：多元卸妆配方，卸的很干净。不刺激，带给肌肤清爽的透气感。卸妆同时洗脸，简单方便有效率。很好用！！！还会继续用！',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (234,94,'小思姑娘','使用心得：以前用的是DHC的 老是起痘 对我来说太油了 可用了这个直接就爱上了 不油 乳化很好 卸的很干净 以后很一直用下去 虽然说性价比差了点 但是是他的特点， 用了很放心 值了',5,0,'2012-03-01 15:59:16');
INSERT INTO `goods_comment` VALUES (235,95,'redchild','使用心得：还没用，但十分迷信其优越性能：）',5,0,'2012-03-01 15:59:18');
INSERT INTO `goods_comment` VALUES (236,95,'ellexiamin','使用心得：这款绿茶洁颜油是植村秀的洁颜油里我最最喜欢的，很清爽的质地啊，化很浓的妆，也可以卸得很干净，而且乳化的速度很快，洗干净之后一点也不油腻，我是混合合性皮肤对于卸妆油之类的东东很挑的，这款用后感觉很清爽，不会紧绷哈哈，很喜欢针对是一款性价比很高的产品。',5,0,'2012-03-01 15:59:18');
INSERT INTO `goods_comment` VALUES (237,95,'bluediana','使用心得：这款卸妆油不错，质感很轻柔，容易乳化，即使浓妆也能卸干净，淡淡的绿茶味道很喜欢，推荐！',5,0,'2012-03-01 15:59:18');
INSERT INTO `goods_comment` VALUES (238,95,'法网棋布','优点：量大 使用心得：很大一瓶，就是味道没觉得是绿茶的感觉，不干，挺好的',5,0,'2012-03-01 15:59:18');
INSERT INTO `goods_comment` VALUES (239,95,'zeixique','优点：太惊喜了,痘痘都会少 使用心得：绿茶的香味很喜欢，虽然我不化妆，但是我的油性皮肤特别让我烦扰，每天晚上都是用了这个在用洗面奶，觉得特别清爽，青春痘也少多了。',5,0,'2012-03-01 15:59:18');
INSERT INTO `goods_comment` VALUES (240,96,'get-backer','使用心得：第一次用都震惊了，简直像水一样，用惯了fancl、dhc之类都觉得这是卸妆油么。还担心洗不干净。不过这几天用下来习惯了，觉得挺好的。味道只用在脸上时能闻到淡淡地酸梅味儿，很大瓶而且是满减时买的超划算。准备过几天出去玩还买瓶小的试试',5,0,'2012-03-01 15:59:19');
INSERT INTO `goods_comment` VALUES (241,96,'雪肌精迷','使用心得：比DHC不是好用一点点啊 ，DHC用了长封闭性粉刺。而且很油使用感很差，这个轻薄，也不长封闭性粉刺，',5,0,'2012-03-01 15:59:19');
INSERT INTO `goods_comment` VALUES (242,96,'zrfeduask','优点：卸的干净还保湿 使用心得：先一直用的DHC，用了这款后感觉比DHC的好，油质很轻薄，乳化后感觉有点像洗面奶，卸除很彻底，洗后有保湿的效果，非常不错，很大一瓶哦，价格很实惠。',5,0,'2012-03-01 15:59:19');
INSERT INTO `goods_comment` VALUES (243,96,'沅','优点：这款真的超好用 使用心得：好大的一瓶啊，量大足够用一年了，按照说明使用，完全乳化之后用清水冲干净后，肌肤有透明如凝脂的感觉，配上它本身淡淡花香，洗脸真是一种享受啊！',5,0,'2012-03-01 15:59:19');
INSERT INTO `goods_comment` VALUES (244,96,'SD齐武','优点：适合混合性皮肤 使用心得：一直在用植家的洁颜油，已经三年多了。因为平时只是打一层隔离，上点散粉。所以每次按两下就可以卸得很干净。之前用的是美白的，第一次用樱花。味道很不错，我是混合性皮肤，用完了一点也不油。这个产品我会一直用下去。',5,0,'2012-03-01 15:59:19');
INSERT INTO `goods_comment` VALUES (245,97,'猪猪淘吧','使用心得：味道淡淡的很香，卸妆很温和，还能温和去角质，性价比很高',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (246,98,'alinacen','使用心得：不错，清洁的很干净',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (247,98,'ssrb031','使用心得：不起泡沫的洗面奶，属于滋润型，洗完了会感觉比较滑爽',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (248,98,'皮皮妙妙猫','使用心得：挺稀薄，但卸妆挺干净的，而且还很清爽，',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (249,98,'天空的火','使用心得：满脸黄瓜味，很好闻。无泡、温和。用完不干不紧绷。',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (250,98,'大嘴巴猴子','使用心得：以前没用过 一直用娇韵诗的能搓出很多东西 这个在脸上黏黏的搓出得东西不是很多 味道很好 涂在脸上很温和不刺激',4,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (251,98,'judieshao','使用心得：我一直用，因为价格适中，清洁不错，但是有点油腻的，卸过妆之后要记得用洁面乳再轻柔洗一遍。',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (252,98,'lizzie7633','使用心得：还行吧，清香型，有点担心卸妆是否卸的干净……',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (253,98,'yilixia','使用心得：洗得很干净，用完脸上滑滑的，很舒服的清香，但由于本人一向不化妆，所以卸妆效果有待考证。',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (254,98,'beshuang','使用心得：洗得很干净。  很舒服的黄瓜的清香味  适合油性至中性肌肤',5,0,'2012-03-01 15:59:20');
INSERT INTO `goods_comment` VALUES (255,99,'1174337**@qq.com','使用心得：朋友买的，还可以',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (256,99,'王锡敏','使用心得：看起来不错！  瓶子和国内的不一样，，这个更可爱！',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (257,99,'ccstella','使用心得：性价比很高',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (258,99,'qqfanli_630278378652','使用心得：一直用它，卸得很干净！',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (259,99,'ntxiaojingjing','使用心得：卸妆真的很好很强大',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (260,99,'feifei1220','使用心得：以前就用过这个 特价买的值了',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (261,99,'aimani000','使用心得：卸妆很干净。无刺激，无负担。推荐。',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (262,99,'viki82110','使用心得：水油式，用之前要晃，感觉油腻，不喜欢。。。',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (263,100,'SaLaNeiO','使用心得：觉得真的是很好用，每次只要一点，就能打出丰富的泡沫，而且洗了之后也不紧绷',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (264,100,'含泪冰凌花','使用心得：颜色很喜欢,有点白中带紫的,洗脸非常干净,适合油性皮肤',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (265,100,'nt9411','使用心得：我喜欢它的原因只有一个，就是卸妆非常的简单。一步到位，又卸的干净，必卸妆油好用。',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (266,100,'小傻猫儿','使用心得：很容易起泡而且洗完不会太干，清洁能力很强，无味很舒服。',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (267,100,'袢硕加幸煎悲','使用心得：平常淡妆都用这个卸,很方便.泡沫d密@,清洁力强，不会紧绷.',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (268,100,'婉转的笔','使用心得：清洁效非常好，而且用完不会干..还是水嫩水嫩的！！！',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (269,100,'qqfanli_371564357596','使用心得：这款洗面奶真的是我用过最温和最干净的，之前在美国梅西百货、中国专柜都买过，这次买的时候没有好好看产地，收到货发现产地是比利时，给客服打电话态度很好，也上网查了资料说产地确实有比利时，不过心里还是怪怪的，呵呵。。。不过希望使用效果一样吧。',5,0,'2012-03-01 15:59:23');
INSERT INTO `goods_comment` VALUES (270,101,'huangbq311','使用心得：很不错的 ，用起来很舒服，卸妆效果很好!',5,0,'2012-03-01 15:59:24');
INSERT INTO `goods_comment` VALUES (271,102,'猪@猪','使用心得：用了 豆子味特别浓 抹在脸上挺油的 不过卸装效果真的不错 不愧这么受欢迎哈',5,0,'2012-03-01 15:59:25');
INSERT INTO `goods_comment` VALUES (272,103,'十八子娟娟','使用心得：没有油腻腻的感觉，用着很舒服，但感觉卸妆效果不是很好啊，睫毛膏都卸不干净的。。',4,0,'2012-03-01 15:59:25');
INSERT INTO `goods_comment` VALUES (273,103,'lixiao006','使用心得：我个人认为有太多的人使用方法不对,其实它一点都不油腻,卸除彩超干净,使用时双手保持干爽卸妆油推匀至全脸稍加按摩,直接水洗掉就可以了，真的很好用的。而且还不贵哦，在网上买很便宜的。',5,0,'2012-03-01 15:59:25');
INSERT INTO `goods_comment` VALUES (274,103,'何虹','使用心得：我现在用的全部都是一朵的，很好',5,0,'2012-03-01 15:59:25');
INSERT INTO `goods_comment` VALUES (275,104,'gracie莉','使用心得：用过了，再来评论哦，卸妆很干净，而且皮肤滑溜溜的呢~~好用~~',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (276,104,'wyqxsc','使用心得：卸彩妆效果好的没话说',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (277,104,'lshan_shan','使用心得：不错，用了一些日子了，正品，效果一如既往的好！',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (278,104,'ctlycyl','使用心得：用过很多瓶了，女儿很喜欢，说卸妆效果很强大',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (279,104,'liva_ok','使用心得：好用，以后就用这个了。',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (280,104,'huoran588','使用心得：东西是正品，卸的好干净，送货速度快，下次还会光顾！',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (281,104,'qqfanli_630278378652','使用心得：一直用它，卸得很干净！',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (282,104,'liyaccvc','使用心得：颜色跟以前在专柜买的不太一样，比较深，说可能是包装或橄榄油批次不同等原因造成，供大家参考。',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (283,104,'茶水依柠檬','使用心得：东西很正~卸的很干净，乳化效果也很好，用洗面奶洗完后感觉毛孔都通畅很多，哈哈',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (284,104,'qqfanli_976361325282','使用心得：包装不错，应该是正品。刚用没几天 ，还不错。就是到货太慢了！！',3,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (285,104,'safiya.shao','使用心得：东西是正品，还不错。卸妆蛮干净的。买了一瓶送朋友。',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (286,104,'fankaixu','使用心得：感觉干性皮肤用这个好一些。我是混合偏油的。用了以后T区爱出痘痘。但是卸妆能力很强大。东西是正品。速度也快。不错不错',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (287,104,'molatona','使用心得：是正品，就是快递慢了点，别的都OK!',5,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (288,104,'izumibobo','使用心得：比它好用的卸妆油多的是~ 不过这款也算还可以了 没有传说中的好~',4,0,'2012-03-01 15:59:26');
INSERT INTO `goods_comment` VALUES (289,105,'韩光','使用心得：用后觉得皮肤很细腻，感觉的确不是一般比较粗糙的洗面奶。',5,0,'2012-03-01 15:59:27');
INSERT INTO `goods_comment` VALUES (290,106,'kinkin8708**@yahoo.cn','使用心得：味道很清新,乳液很稀,本以为卸妆效果不会好,但是事实证明,用她卸makeup forever的水粉霜都没问题,还有防水唇膏,轻轻揉一揉,乳液就融了唇膏,变成粉红色了,温水清洗后,皮肤滑滑的,如果不喜欢这样,再用洁面产品洗一下就可以;但是,好像没有再洗的必要了,有时偷懒,都不再涂面霜了,一个晚上都没有觉得干燥呢!!',5,0,'2012-03-01 15:59:29');
INSERT INTO `goods_comment` VALUES (291,106,'chenyany**@sunyoumed.com','使用心得：用后感觉很好，香味很喜欢，赞！',5,0,'2012-03-01 15:59:29');
INSERT INTO `goods_comment` VALUES (292,107,'nikilj','使用心得：很实惠，好大一瓶，用着很舒服。',5,0,'2012-03-01 15:59:30');
INSERT INTO `goods_comment` VALUES (293,107,'apple11119','使用心得：用了半瓶了，可以接受的一款，不会刺激皮肤，按摩一下擦掉后再用洁面产品清洗，洗得很干净。',5,0,'2012-03-01 15:59:30');
INSERT INTO `goods_comment` VALUES (294,108,'润s1314','使用心得：女朋友说挺好用的 支持个 第二次买了',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (295,108,'keke148255103','使用心得：很不错，卸眼部的时候有点困难。',4,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (296,108,'梁艳菲','使用心得：对敏感肌肤尤其适用哦，很好的一款卸妆液，很温和，还能卸得很干净！',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (297,108,'大冬瓜','使用心得：不刺激，洗完后觉得脸不油腻，蛮好的',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (298,108,'wangkechong1010','使用心得：好用，真的很不错',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (299,108,'韩崴','使用心得：应该是正品，只是快递慢点。',4,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (300,108,'高岩7753','使用心得：很好使，一直在用',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (301,108,'cbl75','使用心得：用了团购的优惠券，只有119元，真的很合算，而且东西是正品。',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (302,108,'牛牛220','使用心得：是我用过最好的卸妆油，就算DHC与它相比也显得逊色了很多~~',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (303,108,'monicawang04**@hotmail.com','使用心得：就是棒，真品，便宜',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (304,108,'bingying125','使用心得：很好用。卸妆很干净，也不会堵塞毛孔，大爱。',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (305,108,'dongpauline','使用心得：这次买的化不开，我已经在这个网站上买了好几瓶这样的了，这次是第一次感到有点冻住了，莫非是天冷的关系？？？还是质量问题',3,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (306,108,'★370天的爱情','使用心得：无添加的东东用着一直都很舒服，是一种纯净的感受，我是敏感肌肤，很多化妆品都不敢尝试，所以今后会一直坚持用它，真的很好用。',5,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (307,108,'乐乐紫','优点：质地很轻薄 使用心得：可能我是干性敏感肌肤，对于油性的卸妆油感觉不是很好。不过，fancl的质地还是很轻薄的，清洗比较方便',4,0,'2012-03-01 15:59:31');
INSERT INTO `goods_comment` VALUES (308,110,'走在盲流前面','使用心得：质地很轻薄，用在脸上温和、不刺激，卸妆效果也挺好的，能深层清洁皮肤，容易清洗干净。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (309,110,'紧扣啦','使用心得：用在脸上很柔、很温和，就连眼部也不会感到一丝刺激，很容易就在脸上推开了，味道也是淡淡的，不会觉得难闻，真的很舒服。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (310,110,'mancaigou','使用心得：这种颜色让人看上去挺喜欢的，清澈的绿色，质地比较稀薄。对皮肤的负担比较轻。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (311,110,'戒烟的狐狸','使用心得：洗后很清爽，很干净，但是必须进行乳化哦，我已经用过两瓶了',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (312,110,'请你爆料','使用心得：卸的很干净，而且乳化效果也没有别的好',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (313,110,'蓝色妖姬520hj','使用心得：不易清洗。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (314,110,'情花毒','使用心得：比DHC的好用多了，和表妹最喜欢的一种卸妆油。我用了三瓶了。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (315,110,'大冬瓜','使用心得：绿茶的清爽一些，洗完觉得不油腻，不错赞一下',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (316,110,'叶_','使用心得：绿茶洁颜油的抗氧化功能，个人认为非常适合在夏季使用。虽然有双重功效，即卸妆和洁颜一次完成，但是我还是禁不住要用洗面奶再洗一次，因为卸妆后觉得脸还是有一点儿油。',5,0,'2012-03-01 15:59:32');
INSERT INTO `goods_comment` VALUES (317,111,'宝贝亮','使用心得：卸的很干净。',5,0,'2012-03-01 15:59:33');
INSERT INTO `goods_comment` VALUES (318,111,'飞喜儿','使用心得：用完后就不想再用别的卸装品了，细腻、滋润，洁净力强~',5,0,'2012-03-01 15:59:33');
INSERT INTO `goods_comment` VALUES (319,111,'夜寒冰51*52','使用心得：很好用的，淡淡地香味，无刺激性，用后，皮肤不紧，感觉有滋润的成分。还好不是很油的感觉。清洁得很干净哦',5,0,'2012-03-01 15:59:33');
INSERT INTO `goods_comment` VALUES (320,112,'迷你号豆豆','使用心得：昨天刚刚拿到，卸睫毛膏很干净！',5,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (321,112,'tfmbt','使用心得：很好，这已经是第二瓶了，我想还会购买第三瓶，卸bb霜刚刚好，一点也不紧绷，不过浓妆恐怕不行',5,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (322,112,'guaf1','使用心得：很好用的卸妆产品，很温和，没有刺激。而且玻尿酸还能美容，喜欢。',5,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (323,112,'长耳朵的雨','使用心得：感觉用起来没有想象中的那么好，效果一般般啦',3,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (324,112,'wyjiao8844','使用心得：根本卸不掉睫毛膏',3,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (325,112,'王甄真','使用心得：象果冻一样，很好用，适合上点隔离但不化妆的MM',5,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (326,112,'xieqin0622','使用心得：超好用，卸妆很轻松，也不油腻，使用完用清水清洗就OK的',5,0,'2012-03-01 15:59:34');
INSERT INTO `goods_comment` VALUES (327,114,'智者乐仁者寿','使用心得：味道比较舒服，卸妆比较温和，性价比比较高好大一瓶能用很久。',5,0,'2012-03-01 15:59:38');
INSERT INTO `goods_comment` VALUES (328,114,'wwl710422','使用心得：这款卸妆水非常适合敏感皮肤用，而且是免洗的，出差带着非常方便，一直在专柜买，看到NO.5有这款卸妆水，价格很优惠，因为之前在NO.5买过雅诗兰黛的修护精华是正品，所以毫不犹豫地就购买了，买来后跟我之前用的对比一下，是正品，很开心。会继续关注你家',5,0,'2012-03-01 15:59:38');
INSERT INTO `goods_comment` VALUES (329,115,'5242407**','使用心得：卸妆油好多中我用了几乎都差不多，反正用了每种卸妆油都要再用洁面皂洗脸的！',4,0,'2012-03-01 15:59:39');
INSERT INTO `goods_comment` VALUES (330,115,'情花毒','使用心得：  好大一瓶。帮朋友买的，她说还行吧。卸妆油我还是喜欢植村秀的绿茶，我一美女同事35了看上去像20出头，一点也不夸张。她最喜欢的是DHC。她说的没错，要想皮肤好首先要做好清洁工作，其次就是保湿，这两项工作做到位了用最低档但是安全的化妆品皮肤照样水润。（人家一天光卸妆就分三步，一天做三次面膜）',4,0,'2012-03-01 15:59:39');
INSERT INTO `goods_comment` VALUES (331,115,'第五方世界','使用心得：效果不错，虽然没有那么浓稠，但卸的比较干净~',5,0,'2012-03-01 15:59:39');
INSERT INTO `goods_comment` VALUES (332,115,'错过不在','使用心得：卸的干净，价格实惠',5,0,'2012-03-01 15:59:39');
INSERT INTO `goods_comment` VALUES (333,116,'水平座小涵','使用心得：卸的很干净，防水睫毛膏两三下就卸掉了，清爽不油腻。',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (334,116,'小魔890611','使用心得：过敏了=。=',3,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (335,117,'nuonuo33','使用心得：还没用，一直很喜欢他家的东西',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (336,117,'135576608**','使用心得：蛮好的，水润不紧绷。',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (337,117,'guaf1','使用心得：包装太漂亮啦。清洁效果也不错，至少不会感觉到油油的，比较清爽',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (338,117,'liumuyao86','使用心得：因为我是明显 外油内干型的 以前总是以为的控油去油 可一直没有很大的效果 后来改用补水型的 反而觉得好多了 脸变得嫩嫩的',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (339,117,'二手市场','使用心得： 包装很漂亮。用了之后感觉洗完不干，很滋润。',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (340,117,'张小莫','使用心得：感觉一般吧，干用一次，',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (341,117,'静待莲开','使用心得：用了两次 洗的比较干净 不油腻 不刺激 。。清洁效果也不错，至少不会感觉到油油的，比较清爽，适合长期使用。',5,0,'2012-03-01 15:59:40');
INSERT INTO `goods_comment` VALUES (342,118,'阿尼玛斯','优点：油MM的救星 使用心得：脸是大油田，说洗过之后很清爽，而且痘痘也不像之前长的那么疯狂了。泡沫很细腻，而且很丰富，用的还特省，洗脸洗的特干净，而且还不觉得干，气味有点药味，但是不浓，还可以接受~最关键的是控油效果，洗脸完了不会再有一会儿就变成大油脸的担心~',5,0,'2012-03-01 15:59:41');
INSERT INTO `goods_comment` VALUES (343,119,'青山淡云','使用心得：性质柔和，比较舒缓',5,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (344,119,'recoverygenius','使用心得：东西是不错，可惜不适合我，做完面膜脸部的水分都被吸走了，只能做普通洗面用。',4,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (345,119,'vivili90','使用心得：清洁能力还不错 也比较滋润 不紧绷',5,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (346,120,'wbxql8682','使用心得：不错  是正品   保湿效果确实挺好     就是物流太慢了',5,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (347,120,'136262723**','使用心得：本来想买那款温和型的液体洁面皂的，后来因为口误定错货了，用起来没有泡沫，比较适合干性肤质！',5,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (348,120,'宝宝0329','使用心得：很温和，不过敏。滋润，不紧绷',5,0,'2012-03-01 15:59:42');
INSERT INTO `goods_comment` VALUES (349,121,'saisaiwekiya','使用心得：非常好用  泡沫很均匀 很好很好',5,0,'2012-03-01 15:59:43');
INSERT INTO `goods_comment` VALUES (350,121,'miaomiaomi171','使用心得：刚用，洗净的效果还不错',5,0,'2012-03-01 15:59:43');
INSERT INTO `goods_comment` VALUES (351,121,'moregao','优点：还不错 坚持使用中 使用心得：洗着还不错，去黑头可能要坚持用才知道效果',5,0,'2012-03-01 15:59:43');
INSERT INTO `goods_comment` VALUES (352,121,'刘虾','优点：初用阶段   使用心得：专门买来看看去黑头效果如何的~ 现在还只是初用阶段~',5,0,'2012-03-01 15:59:43');
INSERT INTO `goods_comment` VALUES (353,122,'liqi90s','使用心得：还不错呢，good',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (354,122,'追逐阳光的女孩','使用心得：感觉是很舒服干净的，控油效果不错。我的皮肤是比较油，还是很适合我的！',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (355,122,'新鲜旧情人','使用心得：超级耐用阿！泡沫虽然不丰富，但是有茶树精油的味道，比较柔和，洗完脸后不会紧绷',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (356,122,'*雪满楼*','使用心得：这个洗完皮肤真的一点也不干 还滑滑的 但是你又能感觉到它洗得非常干净',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (357,122,'大丰人来到了','使用心得：比较温和的一款 清洁效果很好，去油效果很好！',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (358,122,'sanjingjie','使用心得：刚开始我当它是没泡的洗面奶，于是每次都直接涂。结果有一次加了点热水洗着洗着洗出泡来了。然后我就挤了一点在掌心，然后加热水揉搓，结果出了一大堆丰富细腻的泡泡！给我悔大发了！！要知道我之前浪费了多少洗面奶啊！！！',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (359,122,'润宇记','使用心得：用完有种辣辣的感觉，痘痘小了好多，而且隐形痘痘也不见了，效果很好！',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (360,122,'飞鱼之吻','使用心得：味道很清新，用的时候很清凉 洗完脸后感觉毛孔都在呼吸新鲜空气 不知道是不是因为是茶树清凉的作用哈…… 再拍上爽肤水 效果更好',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (361,122,'走在盲流前面','使用心得：非常的清爽，清洁也很彻底，用完后也不觉得紧绷，脸上滑滑的,',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (362,122,'王中燕','使用心得：刚用时那个味道不太习惯，期待后面使用时能适应。',4,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (363,122,'fashionnnoble','使用心得：洗的很干净，配合急救棒及精油使用，效果很好。没有出现过敏现象。',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (364,122,'yotonhkcn','使用心得：东西刚到我就试了下效果，对我这种油性皮肤很好，虽说控油的，但是脸不是那么的干燥而且光滑，很喜欢',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (365,122,'sabrina末末','使用心得：茶树的味道还是蛮浓的，洗过之后脸也不紧绷，挺舒服的',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (366,122,'d_lilian','使用心得：用了两天感觉不错',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (367,122,'seagirlqing','使用心得：用完后是那种滑滑的感觉，不太喜欢这样的，不过补完水后还是感觉蛮清爽的',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (368,122,'wujt1','使用心得：洗的很干净，控油效果不错！',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (369,122,'我的小太阳','使用心得：不太管用啊',4,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (370,122,'anna8','使用心得：不错  脸不是很油哦',5,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (371,122,'我叫红领巾','使用心得：只是感觉清凉,具体效果有待检验.',4,0,'2012-03-01 15:59:44');
INSERT INTO `goods_comment` VALUES (372,123,'jna311','使用心得：已经用了很多瓶了，真不愧是号称世界上最温和的洗面奶',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (373,123,'shuling03','使用心得：真的很温和',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (374,123,'koveronica','使用心得：用的感觉还是不错，虽然没有泡泡，但是多了一些细滑的触感，洗完也不会紧紧的。。。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (375,123,'枫叶琳子','使用心得：没有泡沫，没有很重的味道，涂在脸上感觉软软的，很不错，继续支持',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (376,123,'一盆土豆','使用心得：用完皮肤比较光滑，但是清洁力好像不行，感觉适合中性和干性皮肤的，没有味道，所以没有添加香精之类的，成分满安全可靠的。',4,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (377,123,'qqfanli_64876371001','使用心得：清洁能力不是特别强 但是不过敏 我皮肤敏感 用着一点也不过敏',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (378,123,'良言','使用心得：已经用了好几瓶了，什么都不用说了。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (379,123,'fangfangmuyuw**@yahoo.com.cn','使用心得：这已经是第二瓶了，很不错，我的脸已经从油性皮肤成功变成中性的了，早晨一觉醒来一点儿也不油腻',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (380,123,'redfreefly','使用心得：感觉很好，用了很舒服，洗的也够干净。喜欢这样温和的洗面奶。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (381,123,'hahaha85','使用心得：我觉得还蛮好用的啊，洗完了无敌滑啊~不是说泡沫的那种对敏感性皮肤不好嘛，越洗脸皮越薄，然后就更敏感，这个还不错啦~~',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (382,123,'yiyan311','使用心得：感觉没有介绍的好，',2,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (383,123,'Alee_Shen','使用心得：超好用，质地很温和，适合敏感肌肤。洗的很干净，不会有紧绷感，赞一个。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (384,123,'ljmeng_81','使用心得：和市场上或者别家的同款产品不一样，是ㄠ状的，不知道问什么，用了没有好或不好的感觉。用了半瓶，没用了，老公拣去用了，新买了大宝美容洗面奶。',3,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (385,123,'wudingmaomi','使用心得：妈妈说很好用',4,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (386,123,'蔷薇泡沫','使用心得：看了推荐买的，瓶子有些粗糙，无泡沫，洗后没有任何好或不好的感觉。',3,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (387,123,'wenbieahui','使用心得：温和清新，很清爽的使用感，大爱',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (388,124,'keke148255103','使用心得：没什么特别的感觉。。温和没错，但是就是太温和了，没一点感觉。',4,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (389,124,'jingzi_91','使用心得：保湿效果很好~而且超温和，连续用会觉得痘痘好很多而且不过敏~喜欢~',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (390,124,'小裙子叔叔','使用心得：感觉不错~',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (391,124,'帝翼','使用心得：很不错，买的那一阵子正好角质受损，用了之后不红不痒，很干净，角质现在也恢复了。很棒！',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (392,124,'liyangbailing','使用心得：真的很温和的，敏感肌肤很适合的，清洁效果还不错的，很保湿的。估计油性肌肤不太适合，会感觉洗不干净的。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (393,124,'gkm123456','使用心得：到货巨慢！！！！！！！',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (394,124,'懒懒99','使用心得：还没用，很淡很淡的味道，应该还不错吧',4,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (395,124,'卷眉毛','使用心得：怎么说呢，一拿到货心就凉了，没有包装不说盖子就是松的，打开后感觉是自己灌进去那样，使用后确实不绷紧无刺激，但清洁效果一般~~~~~~',3,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (396,124,'dxllovelgw','使用心得：哈哈。不错不错，很好用。敏感肌肤用着也好。洗完之后一点也不紧绷，赞一个。',5,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (397,124,'sgar924','使用心得：我对它是否真的能清洁表示深度的怀疑~~~',2,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (398,124,'黍离22','使用心得：还不错的，没有传说中那么神奇，很朴实。但是包装确实有点太简了，盖子打开较硬。',3,0,'2012-03-01 15:59:45');
INSERT INTO `goods_comment` VALUES (399,125,'xuwenjuan1014N5','使用心得：用量少，泡沫丰富，用后皮肤很滑',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (400,125,'嘉宝东初','使用心得：非常棒的一款洁面用品，只需一点点，加上水能打出丰富细腻的泡沫，用后感觉清洁而不紧绷。香味清淡雅香很好闻。。',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (401,125,'aiwojenny','使用心得：这个还好 没用呢 给婆婆买的',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (402,125,'枫初','使用心得：无泡，香香的，洗完脸是滑的，一点也不绷，真的做到够滋润',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (403,125,'Saynii','使用心得：为什么我收到的这款洁面霜和图片显示的包装不一样？！感觉这个霜很僵硬，要费很大力气才能挤出来，用了一次，感觉里面有细小的颗粒，不过加水一揉搓颗粒就消失了，用完感觉还行，不过下次不买这款了，还是觉得兰蔻清滢柔肤洁面乳好用',4,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (404,126,'冰点2645','优点：产品好，服务好 使用心得：是正品 第二次光顾啦',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (405,126,'小思姑娘','优点：但使用后，有明显的改变 使用心得：我觉得一朵的产品真的很好，以前不知道，但使用后，有明显的改变。',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (406,126,'star_rain123','优点：去痘没有感觉出来 使用心得：出来全是沫沫,好像有酒精的味道,用过后有些干,不太像它说的那样好,去痘没有感觉出来',3,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (407,126,'风，吹散流年','优点：可以试一下的产品 使用心得：这个产品很不错,以前还没有用这个的时候,皮肤有些油,而且又敏感,对于以前洗的那个产品,洗完后都会感觉到皮肤有些很紧绷的感觉,而用了一朵的这个产品后,皮肤明显有些改善,很不错,真的,你们都可以试一下这个产品',5,0,'2012-03-01 15:59:46');
INSERT INTO `goods_comment` VALUES (408,127,'晚小安安','使用心得：这款倒是随便洗不怕敏感...我用这款的时候超爱得瑟对着镜子臭美也不怕会掉眼睛里...掉眼睛都不太有感觉，冲这点还是挺有好感的。',5,0,'2012-03-01 15:59:47');
INSERT INTO `goods_comment` VALUES (409,127,'秋叶女士','使用心得：非常温和。洗的干净又不会太干。用这个洗脸却一点都不疼。。很舒服，，会一直用下去的。',5,0,'2012-03-01 15:59:47');
INSERT INTO `goods_comment` VALUES (410,127,'闲不住的闲人','使用心得：我晚上冲澡的时候用,反复揉,觉得洗得很干净,清洁力也不错。',5,0,'2012-03-01 15:59:47');
INSERT INTO `goods_comment` VALUES (411,127,'竹君作文','使用心得：很温和的一款适合外油内干的肌肤用的洁面，泡沫丰富，很经用，产品为弱酸性，不会使皮肤变得干，不会刺激痘痘，我最喜欢的一款。',5,0,'2012-03-01 15:59:47');
INSERT INTO `goods_comment` VALUES (412,128,'lacrimosa0419','使用心得：很好，洗后很舒服',5,0,'2012-03-01 15:59:48');
INSERT INTO `goods_comment` VALUES (413,128,'beita420','使用心得：泡沫很多，比较适合夏天用。',5,0,'2012-03-01 15:59:48');
INSERT INTO `goods_comment` VALUES (414,128,'咪咪s巫','优点：不喜欢泡沫多的 使用心得：泡沫比较多，个人不是很喜欢。',3,0,'2012-03-01 15:59:48');
INSERT INTO `goods_comment` VALUES (415,131,'dudubaobei-77','使用心得：上次买过一次，这次到货的和上次的有点区别，100克变成了85克喽，今天我再买了，商品标注是100克，希望到货的时候一样一样的哦！这个产品确实很好，洗得很干净，还滋润，不干燥！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (416,131,'alipay_685979511897','使用心得：今天刚刚到的，还没有用过，但是那个味道超好闻，谈淡的一股米香味，搞的我都有点舍不得用了',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (417,131,'第1投资','使用心得：我超喜欢，我用来洗澡洗脸全身滑滑的，还白哦。洗脸效果很好，收缩毛孔，又白，大爱啊！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (418,131,'刘星86','使用心得：很好，洗完不紧绷，感觉很干净',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (419,131,'5242407**','使用心得：我用了很不错奥，挺适合我的，而且价格比那些洗面奶啊 洗面ㄠ实惠多了！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (420,131,'huazi1239','使用心得：很清淡的香，泡沫很丰富也很香，喜欢。',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (421,131,'达芙妮给','使用心得： 果然滑滑的~特别好用 洗完很细腻。挺好！挺值！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (422,131,'余香小宝','使用心得：洗过很干，敏感肌用过会疼的，男人用或许OK！天天用这个洗脸的话，简直是自残！没有介绍的那么好',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (423,131,'honeyNO5','使用心得：前几天买了一块，泡沫细细的，洗完后感觉的皮肤很细腻，味道也很好。。。挺小一块只是觉得有点小贵。',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (424,131,'alipay_111642475197','使用心得：泡沫丰富、细腻柔滑、淡雅清香好好，赞！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (425,131,'2439783**@qq.com','使用心得：泡沫丰富，清香，不刺激皮肤，清洁效果非常好，买好多次了',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (426,131,'zhouyun920','使用心得：清香  很好',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (427,131,'谢绝观看','使用心得：用过感觉不错，不会干干的，香味也很好闻淡淡的，感觉蛮细腻的，不刺激',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (428,131,'田欣!','使用心得：我觉得非常好用的一款香皂，洗脸洗澡都可以。特别喜欢这个味道，淡淡的自然香，泡沫也很细腻，真的很喜欢呢！',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (429,131,'青色的风','使用心得：洗脸很舒服，不紧绷，味道也蛮好的.泡沫很丰富',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (430,131,'小嬷嬷','使用心得：温和不刺激，而且洗得很干净。这个味道真的是太喜欢了，都舍不得用了',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (431,131,'丹香桂','使用心得：这个用起来还蛮舒服，香味很足，很喜欢，洗得很干净。',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (432,131,'水平座小涵','使用心得：东西不错，有清淡的香味。很温和，挺滋的，洗的挺干净的~用完很舒服~~',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (433,131,'amy_gu','使用心得：味道蛮好的，不过洗完有点干。',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (434,131,'谁比烟花寂寞5678','使用心得：味道不错',5,0,'2012-03-01 15:59:50');
INSERT INTO `goods_comment` VALUES (435,132,'cici1986110300','使用心得：用了两次感觉还不错',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (436,132,'rain_zym','使用心得：真的很好用，用少量就洗得很干净，味道也很好，东西质量很好，是正品。就是送货时间有点长。',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (437,132,'zwjforward','优点：感觉不错 在坚持使用中 使用心得：感觉不错.',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (438,132,'一颗糖','优点：产品很好用 使用心得：产品很好用',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (439,132,'hemengjie1','优点：磨砂颗粒小，效果不错 使用心得：洗面奶不错，磨砂的颗粒很小，应该不会伤害皮肤吧',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (440,133,'lynndia','使用心得：味道有点怪怪的，还可以吧',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (441,133,'菌类生物','使用心得：有点干但挺干净',4,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (442,133,'shine_2099','使用心得：大爱的一款~喜欢她的味道，清新，舒服~洗完不紧绷，也比较干净~个人觉得没怎么去角质，这样挺好的，不伤皮肤的前提下清洁力好',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (443,133,'yuyingemail','使用心得：很好用，大管很值，每次挤出一点就够用，非常实惠，也好用。第一次用这个牌子，留下个好印象，下次还买这个牌子的洗面奶。',5,0,'2012-03-01 15:59:51');
INSERT INTO `goods_comment` VALUES (444,134,'新鲜旧情人','使用心得：慢慢摩擦洗着，觉得挺干净的！适合夏天美白。味道很淡，不刺激，挺喜欢的。用着很舒服。',5,0,'2012-03-01 15:59:52');
INSERT INTO `goods_comment` VALUES (445,134,'11873116**@qq.com','使用心得：严重过敏啊！！超级不好用，应该是正品，但成分上很有问题！又没有中文的成分简介，所以不知道是哪样东西致敏了~~总之，教训是惨痛的！',1,0,'2012-03-01 15:59:52');
INSERT INTO `goods_comment` VALUES (446,134,'renyali1986','使用心得：彩妆也可以去掉，洗得很干净',5,0,'2012-03-01 15:59:52');
INSERT INTO `goods_comment` VALUES (447,134,'daikejia','使用心得：很喜欢，妹先买，觉得不错推荐给我的。我的皮肤油性，用后感觉不紧绷，里面含有细小颗粒可以去角质哦。香味清淡很舒服，物美价廉。正品。',5,0,'2012-03-01 15:59:52');
INSERT INTO `goods_comment` VALUES (448,137,'dongqiwoo','使用心得：泡沫很细腻，洗得面好舒服，不过对大油皮来说可能不够干净，一般混合肌的都好用！',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (449,137,'zeixique','使用心得：挤出来的泡泡很好玩，洗的也不错',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (450,137,'shashuo','使用心得：泡沫很细腻，我比较想要淡斑的效果，期待',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (451,137,'伤痛I','使用心得：不错 泡沫很细腻 洗的比较干净~而且洗过后脸很滑很嫩，超满意',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (452,137,'紫天陌炎','使用心得：不错哦。洗得很舒服。不紧绷',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (453,137,'幸福的筹码M','使用心得：泡泡和那款超绵密的其实一样的多的，觉得这款更适合夏天用，洗完很清爽~~东西不错哦',5,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (454,137,'summeryu','使用心得：洗完脸后，皮肤略有刺痛感，不知道怎么回事？！',4,0,'2012-03-01 15:59:54');
INSERT INTO `goods_comment` VALUES (455,141,'忽冷忽热','使用心得：挺好的洗过；脸不会很干 但是洗得很干净',4,0,'2012-03-01 15:59:57');
INSERT INTO `goods_comment` VALUES (456,142,'3043102**','使用心得：很好，是真货，一下买了2个！哈哈哈',5,0,'2012-03-01 15:59:58');
INSERT INTO `goods_comment` VALUES (457,145,'糊糊miao','使用心得：效果还可以',5,0,'2012-03-01 16:00:00');
INSERT INTO `goods_comment` VALUES (458,145,'wuliang25','使用心得：包装有点仓促哦，，，',4,0,'2012-03-01 16:00:00');
INSERT INTO `goods_comment` VALUES (459,146,'point_guo','使用心得：觉得还不错吧，暂实没什么不适应的感觉',5,0,'2012-03-01 16:00:00');
INSERT INTO `goods_comment` VALUES (460,148,'XLT-LUCK','使用心得：这个没有泡沫，质地想乳霜，用过后皮肤不会干，也不过敏。很好。',5,0,'2012-03-01 16:00:03');
INSERT INTO `goods_comment` VALUES (461,148,'寻找发言权','使用心得：清洁力还行，比较滋润，还是舒服的。',5,0,'2012-03-01 16:00:03');
INSERT INTO `goods_comment` VALUES (462,151,'heyangyibaobao','使用心得：便宜好用，值得推荐',5,0,'2012-03-01 16:00:07');
INSERT INTO `goods_comment` VALUES (463,151,'lily1717lily1717','使用心得：泡沫挺多的，觉得比较适合夏天用，我是混合性皮肤。',5,0,'2012-03-01 16:00:07');
INSERT INTO `goods_comment` VALUES (464,151,'王烨章','使用心得：泡沫丰富也很绵腻，清洁效果很好，非常好的一款产品，值得购买',5,0,'2012-03-01 16:00:07');
INSERT INTO `goods_comment` VALUES (465,151,'诺言@','使用心得：收到货~~~外包装有点旧~~~~~~~~用了一次。。。觉得泡沫很丰富，味道也还可以。  总的来说还不错。。。洗完脸不会紧绷，感觉挺干净的~~~O(∩_∩)O~',4,0,'2012-03-01 16:00:07');
INSERT INTO `goods_comment` VALUES (466,152,'金豆1974','使用心得：用在脸上感到粘乎乎的，有种洗不干净的感觉，还好用后不紧绷。无外包装，感觉不象大牌，有点小遗憾。',5,0,'2012-03-01 16:01:01');
INSERT INTO `goods_comment` VALUES (467,153,'ylq12123','使用心得：好用，洗完后感觉脸好干净，也不紧绷，大爱！',5,0,'2012-03-01 16:01:02');
INSERT INTO `goods_comment` VALUES (468,153,'海燕1989','使用心得：用完凉凉的，挺好的，很喜欢',5,0,'2012-03-01 16:01:02');
INSERT INTO `goods_comment` VALUES (469,156,'谁比烟花寂寞5678','使用心得：还没用  味道很淡 看起来不错  就是有点小贵 呵呵',5,0,'2012-03-01 16:01:10');
INSERT INTO `goods_comment` VALUES (470,157,'谷雨芷悠','使用心得：还行挺好用的就是味道有点浓啊！',5,0,'2012-03-01 16:01:10');
INSERT INTO `goods_comment` VALUES (471,157,'tfmbt','使用心得：刚买的时候，气味非常的芬芳，好喜欢，但是洗脸有些干，后来拿去洗澡也还是有些干。',5,0,'2012-03-01 16:01:10');
INSERT INTO `goods_comment` VALUES (472,157,'韩小白','使用心得：香香的，很好闻，用好以后挺舒服的，不过敏，赞，支持N&#176;5',5,0,'2012-03-01 16:01:10');
INSERT INTO `goods_comment` VALUES (473,158,'lattehrb','使用心得：泡沫真的好细腻，洗的很干净，不过洗过脸之后皮肤有些干，一大块，好实惠！',5,0,'2012-03-01 16:01:11');
INSERT INTO `goods_comment` VALUES (474,158,'fjy.19**@163.com','使用心得：打出来的泡沫很细腻，很温和，就洗完之后稍微有点干~~保湿效果一般！抗敏效果暂时也没看出来，不过很耐用这一块至少可以用个大半年~~~呵呵呵~',5,0,'2012-03-01 16:01:11');
INSERT INTO `goods_comment` VALUES (475,166,'汗玛','使用心得：包装感觉很精致噢，脸洗了也很舒服，效果很好，很喜欢，',5,0,'2012-03-01 16:01:17');
INSERT INTO `goods_comment` VALUES (476,166,'发面小面包','使用心得：洗的很干净，喜欢稍微有紧绷感，觉得这样才洗的干净',5,0,'2012-03-01 16:01:17');
INSERT INTO `goods_comment` VALUES (477,177,'5951608**','使用心得：刚刚收到。。看起来不错哦！',3,0,'2012-03-01 16:01:24');
INSERT INTO `goods_comment` VALUES (478,179,'风无可替代','使用心得：很好哟 正品',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (479,179,'llxu56','使用心得：很好，适合混合偏油性皮肤，洗过后干净不感觉紧绷！',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (480,179,'含泪冰凌花','使用心得：用着很舒适，但是泡沫偏少，我比较偏爱泡沫丰富点的洗面奶，非常好用，不刺激，清洁力到位，泡沫也足够，很喜欢',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (481,179,'穿棉裤捞鱼','使用心得：挤出来在手心可以快速揉出泡沫，泡沫很细腻，味道也很好。我每次都会在脸上稍微按摩会，然后洗掉后，皮肤不紧绷，但是感觉清洁很干净.总而言之，感觉很好！',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (482,179,'一江秋水.','使用心得：比较适合油性肌肤，很容易冲洗，洗完感觉很干净，也很控油，与绿水绝配',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (483,179,'微凉a','使用心得：非常好用，极易推开，很适合本人的油性混合性肤质。使用感受非常温和好用，还有一股很清新的味道，非常好用。',5,0,'2012-03-01 16:01:25');
INSERT INTO `goods_comment` VALUES (484,180,'静静no5','使用心得：清洁效果还不错，就是味道有点不好闻',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (485,180,'3731943**@qq.com','使用心得：同事说是正品~~也很好用哦~~',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (486,180,'智者乐仁者寿','使用心得：这款洗面奶最大的特点就是泡沫非常细腻，而且感觉洗得很干净，又不会觉得脸上很紧绷，会一直用下去',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (487,180,'yumikaa','使用心得：用过旅行装觉得温和才买的，挺大一只的呢~',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (488,180,'丁子','使用心得：有很多泡泡，但洗干净之后皮肤仍然不会觉得干，而是依然感觉很润。不仅令洗后肌肤水润柔嫩，还可以产生更丰富更具有韧性的柔密泡沫，能够深入毛孔及皮肤纹理深处清除细微污垢，且柔和不伤肌肤。不像有些洁面，如果泡泡不小心弄到鼻子或者 眼睛里会觉得刺痛，这个完全没有。',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (489,180,'人生姿态','使用心得：性价比感觉超高滴，一点点可以起好多泡沫，而且很细腻的感觉，总觉得泡泡多应该洗得蛮干净滴，用后也不紧绷，一支可以用好久',5,0,'2012-03-01 16:01:28');
INSERT INTO `goods_comment` VALUES (490,187,'zhangcan11','使用心得：还不错，洗得很干净，不紧绷。',5,0,'2012-03-01 16:01:34');
INSERT INTO `goods_comment` VALUES (491,193,'gaocan0808','使用心得：包装的还不错，味道还可以，不过还没用开始用，五十多还比较值。',4,0,'2012-03-01 16:01:41');
INSERT INTO `goods_comment` VALUES (492,195,'keaisemmy','使用心得：味道很棒，摇一摇呈摩丝状，用完清爽不干燥，很喜欢的一款！推荐！',5,0,'2012-03-01 16:01:43');
INSERT INTO `goods_comment` VALUES (493,202,'amyding','使用心得：这个到是很适合夏天用，虽然感觉没有什么去黑头的功效，但是洗的很干净，控油效果还可以。而且这个更适合出去旅游携带。',5,0,'2012-03-01 16:01:50');
INSERT INTO `goods_comment` VALUES (494,202,'咪梓萱','使用心得：样子怪怪的，但好用。粉遇水就化成细腻的泡沫了，洗的脸很干净',5,0,'2012-03-01 16:01:50');
INSERT INTO `goods_comment` VALUES (495,202,'青天碧雨','使用心得：感觉很不错 一开始担心祛痘控油会干 事实证明完全不必担心的 清洁够不干 很好&#183;~',5,0,'2012-03-01 16:01:50');
INSERT INTO `goods_comment` VALUES (496,203,'xiaodong_131','使用心得：成分很天然，效果很明显，感觉好呢',5,0,'2012-03-01 16:01:53');
INSERT INTO `goods_comment` VALUES (497,203,'猪猪淘吧','使用心得：晚上回来用了一个，泡沫很多，洗过后不紧绷，很干净的感觉，喜欢。',5,0,'2012-03-01 16:01:53');
INSERT INTO `goods_comment` VALUES (498,203,'紫天陌炎','使用心得：洗的蛮干净，皮肤会很滑，起泡的洁面粉用的很舒服，也很放心的品牌',5,0,'2012-03-01 16:01:53');
INSERT INTO `goods_comment` VALUES (499,203,'第八元素','使用心得：一周用一次，当做去角质，用完会感觉脸变光滑',5,0,'2012-03-01 16:01:53');
INSERT INTO `goods_comment` VALUES (500,204,'唐伯牛','使用心得：外表看上去很干净 洗完脸感觉不紧绷 很顺滑 ~',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (501,204,'sarah_lisa68','使用心得：用了很舒服。没有干燥的感觉。味道和清洁力都可以，最重要洗完真干净啊，这是最重要的',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (502,204,'zy2333140','使用心得：是正品，值得信认',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (503,204,'dxllovelgw','使用心得：保湿很棒,洗的干净不紧绷,奶油的味道也可以接受.一点点就有温绵细腻的泡沫,大爱!!',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (504,204,'我是二当家','使用心得：这款洗面奶是那种奶味，可以打起丰富的泡沫，很温和，洗完之后很干净，而且一点不紧绷。。会回购！',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (505,204,'樱花筱瀹','使用心得：freeplus的明星产品，性价比高，味道也是我喜欢的，像牛奶，很温和，洁净度也满意',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (506,204,'louisez','使用心得：把我同一天定的两张订单的东西装到一个盒子里了。。。虽然很环保，但是少让送货人转一份钱了。。。不过这次买的东西都很好，包装正常，之前的简直像垃圾里捡的，，，反正这次终于满意一次了，不容易啊！啊1这个好用极了！推荐！',5,0,'2012-03-01 16:01:57');
INSERT INTO `goods_comment` VALUES (507,205,'韩玉博','使用心得：洗的干净，对去黑头有点效果。当去角质 深层清洁用了。',5,0,'2012-03-01 16:01:58');
INSERT INTO `goods_comment` VALUES (508,205,'kuaileyouni2008','使用心得：真的能去黑头哦，不能每天用的，所以要和洁面霜一起替换着使用。',5,0,'2012-03-01 16:01:58');
INSERT INTO `goods_comment` VALUES (509,205,'孤单雨滴','使用心得：洗后非常舒服，也很经用，但是不干天天用。因为有去角质的功能能所以怕把皮肤洗坏。我都是一周2-3次。',5,0,'2012-03-01 16:01:58');
INSERT INTO `goods_comment` VALUES (510,206,'★370天的爱情','使用心得：包装比别的要精致一个档次。这个橙花味道超好',5,0,'2012-03-01 16:02:00');
INSERT INTO `goods_comment` VALUES (511,206,'启迪橱柜','使用心得：包装精致，味道好闻，也很滋润。喜欢…',5,0,'2012-03-01 16:02:00');
INSERT INTO `goods_comment` VALUES (512,206,'老冰~','使用心得：这个好香哦，直接打开盒子都是这个的清香，样子也很漂亮。',5,0,'2012-03-01 16:02:00');
INSERT INTO `goods_comment` VALUES (513,207,'wokewang1','使用心得：很好用，很滋润的！味道也很好闻。质感非常好的洗面奶！',5,0,'2012-03-01 16:02:01');
INSERT INTO `goods_comment` VALUES (514,208,'非洲角马','使用心得：这款没味，泡泡不多是细密行，洗完滑滑的，保湿感觉很好，也没有再敏感过。',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (515,208,'Alee_Shen','使用心得：很温和，洗完后摸上去是那种干净的滑嫩感，很轻松～配合吸收超棒的同系列爽肤水和乳霜，皮肤有喝饱水的感觉，润润的很有弹性',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (516,208,'刘虾','使用心得：挺舒服 洗完以后脸也滑滑的，也不紧绷，基本没有味道 性价比挺高。',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (517,208,'没落两块五','使用心得：温和不紧绷，洗得也干净，而且好大一只。。。。每次一点点就可以了',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (518,208,'TTstudio冯鑫','使用心得：晶晶亮，透心凉！不光痘痘抑制住了 连痘印都一天天变淡了 简直是拯救我于水深火热之中呀 果断赞',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (519,208,'伊夏沫','使用心得：洗完后很滋润完全不会紧绷和干燥，皮肤也会滑滑的！还有我发现它把毛孔都洗得干干净净的！超级大爱！！',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (520,208,'手绘小美女','使用心得：蛮干净，而且不紧绷，适合冬天，非常好，不干燥。大爱',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (521,209,'职场充电','使用心得：洗完很嫩不假滑，不紧绷，总体来说很喜欢！',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (522,209,'wanghuilovefriends','使用心得：冬天用这个洗脸，很温和，泡沫很少，打出来是乳状的，洗完一点都不干。早晚用，用量还很省。总得来说，我很满意',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (523,209,'财经联盟','使用心得：气味很美好，清洁力很强。比较柔滑，还挺舒服的。',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (524,209,'婉转的笔','使用心得：很大块 清洁能力很强，用完还算舒服 。感觉很乳的一款洁面皂！',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (525,209,'快乐小花儿','使用心得：使用感比较柔滑，味道很香，泡沫丰富。偶尔使用感觉很好',5,0,'2012-03-01 16:02:02');
INSERT INTO `goods_comment` VALUES (526,210,'solin_y','使用心得：洗的干净但不紧绷，香味令人愉悦，我喜欢蜡菊的香味，清新！',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (527,210,'济南皇家','使用心得：超好用，洗得很干净，脸也不会紧绷，很舒服。',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (528,210,'乌龙虾','使用心得：很温和。。洗完不紧绷，洗的蛮干净 泡沫蛮细致，很舒服。',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (529,210,'小帖子','使用心得：这款洗面奶很温和，味道是淡淡的香，我是油性皮肤，用着觉得很好。',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (530,210,'新鲜旧情人','使用心得：我是油性皮肤，洗完了以后皮肤滑滑的，感觉很好。',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (531,210,'婉转的笔','使用心得：正品，洗脸舒服，不紧绷。很清爽的洁面乳',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (532,210,'第彡茨痛M','使用心得：喜欢这款的香味~不错的,直接出泡沫,这点很喜欢.',5,0,'2012-03-01 16:02:03');
INSERT INTO `goods_comment` VALUES (533,211,'殳文','使用心得：东东很好，用了一点泡沫很丰富，洗的也很干净',4,0,'2012-03-01 16:02:04');
INSERT INTO `goods_comment` VALUES (534,211,'咪咪睡个觉','使用心得：特别喜欢这个香味，而且洗得比较干净。尤其是卸妆油啥的。',5,0,'2012-03-01 16:02:04');
INSERT INTO `goods_comment` VALUES (535,211,'人生姿态','使用心得：很不错，挤个一点加点水就能搓揉出细腻的泡沫，上脸按摩的时候，有点香的味道，皮肤滑滑的！',5,0,'2012-03-01 16:02:04');
INSERT INTO `goods_comment` VALUES (536,211,'一颗糖','使用心得：洁面效果好好噢（我比较懒了不爱卸妆嘿嘿），洗过不干，爽爽嫩嫩的，以后就用它啦！',5,0,'2012-03-01 16:02:04');
INSERT INTO `goods_comment` VALUES (537,212,'猪猪淘吧','使用心得：洗的时候很滑，洗好后还是很滑嫩的，很舒服~~',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (538,212,'xxweng','使用心得：香，但是不熏人，按摩颗粒说明是说珍珠包裹的精华，很吸引人',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (539,212,'OurDramaticStory','使用心得：非常好，我是过敏性皮肤，特别高兴，居然没过敏。用了两天后，脸特细滑。强烈推荐。',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (540,212,'肉肉毛毛是宝贝','使用心得：这款洁面个人非常喜欢 感觉很不错。洗后感觉很白皙，都买了好多次了',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (541,212,'水-悠-悠','使用心得：洗得很干净，真不愧是极光绽白，洗完脸后可白可白了！',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (542,213,'云淡风清de云','使用心得：很温和，去污力强，最主要的是经用，一块能用大半年！',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (543,213,'闲不住的闲人','使用心得：我是偏油性的皮肤，用这个洗脸后确实温和，不紧绷，去新疆那种很干燥的地方出差用也很滋润。',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (544,213,'小傻猫儿','使用心得：卸妆后使用，感觉温和滋润不干燥。早上洁面用也感觉不错。而且实在很经用呀！我大概用了8个月才用完哦！用时千万不要泡水，尽量保持干燥就很很耐用哦！',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (545,213,'智者乐仁者寿','使用心得：我是敏感性肤质，但是这个用了一点都不用担心过敏，用过后没有紧绷的感觉，很舒服，性价比高',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (546,213,'自然美11','使用心得：她的味道很耐人寻味，我是鼻头油油的混合型皮肤，使用的时候觉得很适合我。也很方便携带。',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (547,213,'可法莩','使用心得：很温柔的感觉，不刺激，易清洗，很耐用！怎么都用不完，呵呵',5,0,'2012-03-01 16:02:05');
INSERT INTO `goods_comment` VALUES (548,215,'梅子闫','使用心得：送货挺及时的。拿到手，意料之中的写的是非卖品。其实，要真是专柜的赠品也挺好的，至少是正品啊！呵呵！天气冷，收到的时候，感觉里面的内容都冻上了！还没用。期待真是正品！贴牌上显示到2013年1月1号就到期了。',4,0,'2012-03-01 16:02:07');
INSERT INTO `goods_comment` VALUES (549,216,'阳光之吻','使用心得：比在**网买的要厚',5,0,'2012-03-01 16:02:08');
INSERT INTO `goods_comment` VALUES (550,217,'北漂情','使用心得：样子小巧可爱，用后滑滑的，泡沫很细腻，洗的干净，不干。',5,0,'2012-03-01 16:02:08');
INSERT INTO `goods_comment` VALUES (551,217,'司徒爰笑','使用心得：味道很香，很滋润，用来洗澡也很不错，用起来舒服。',5,0,'2012-03-01 16:02:08');
INSERT INTO `goods_comment` VALUES (552,217,'水怪257','使用心得：洗完脸滑滑的，清洁度也够给力，用了几次感觉白了好多，赞！',5,0,'2012-03-01 16:02:08');
INSERT INTO `goods_comment` VALUES (553,217,'luckyjw1**@163.com','使用心得：虽说是打折购买，这个价位还可以，但是用完后，脸会干，有些涩，洗脸不适合',3,0,'2012-03-01 16:02:08');
INSERT INTO `goods_comment` VALUES (554,219,'赖汉','使用心得：这个水水不是很浓稠的那种，比较稀，很香，感觉好像金盏花的部分味道。非常好 用着很舒服',5,0,'2012-03-01 16:02:09');
INSERT INTO `goods_comment` VALUES (555,220,'快乐小花儿','使用心得：每年冬天皮肤都比其它季节敏感，鼻子周围也会有干皮和红血丝。买的时候就是冲着它的温和买的。很适合我，敏感肌肤用。一点都不刺激。',5,0,'2012-03-01 16:02:10');
INSERT INTO `goods_comment` VALUES (556,220,'济南皇家','使用心得：味道很喜欢，这款拯救了我，爱上了洗完脸后一点都不紧绷润润滑滑的肌肤，因为平时也不怎么化妆，最多涂隔离霜，涂隔离霜我也会用卸妆乳卸两次才罢休，所以这款恰恰适合我。',5,0,'2012-03-01 16:02:10');
INSERT INTO `goods_comment` VALUES (557,220,'笨兮兮','使用心得：ㄠ质地的.. 味道还是很天然的..洗的很干净 而且也不紧绷.. 算下来觉得还算合格..安全',5,0,'2012-03-01 16:02:10');
INSERT INTO `goods_comment` VALUES (558,223,'fengye4**@163.com','使用心得：东西收到，挺满意！',5,0,'2012-03-01 16:02:15');
INSERT INTO `goods_comment` VALUES (559,225,'lingyun04**@126.com','使用心得：没什么大的效果，这次从no.5买了好多护肤品，但是效果不像以前那么好',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (560,225,'Alee_Shen','使用心得：洗完脸之后是挺干净的，毛孔明显缩小，皮肤也嫩白了，而油脂调护主要在于控油洁净方面，很清淡',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (561,225,'猫耳眼胡同','使用心得：感觉不错,挺好用的.缓解面部干燥，使肌肤水分充盈，充满弹性。&#183;加倍柔润配方，洁面后在肌肤表面形成水润皮脂膜，持久润滑娇嫩',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (562,225,'小帖子','使用心得：感觉用过之后脸部没有绷绷，有一种很透气的感觉，非常的清爽舒服啦~~清洁是一个很关键的步骤，，所以对待自己好一点，一点都不为过',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (563,225,'伊夏沫','使用心得：很容易就能打出稠密的泡沫，很喜欢。特e是对于我这样常年带妆的人来说，彻底的清洁肌肤真的很重要，这款很不错，性价比还行哦！',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (564,225,'min1267','使用心得：一直用这洗面奶，很好用，洗得很干净。而且洗完之后一点都不紧绷。很容易洗干净，不会有残留 ，很适合我',5,0,'2012-03-01 16:02:16');
INSERT INTO `goods_comment` VALUES (565,226,'我爱北京86','使用心得：很少的量就能揉出很丰富的泡沫，感觉比较细腻，用后不紧绷，很容易清洗掉，很适合我。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (566,226,'忧忧自欢','使用心得：味道很适宜，厚厚的膏体，白色的很有光泽，很讨喜的香味，用温水打出的泡泡很细腻，洗完之后很舒服，也不会干，皮肤很有光泽，很干净。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (567,226,'taibinbin','使用心得：个人觉得还可以 - - 洗后滑滑的，味道淡淡的，很喜欢。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (568,226,'Alics','使用心得：宝贝收到了，刚刚拿到手，不知道是不是真品，应该还不错吧，谢谢送的包包',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (569,227,'默默珩','使用心得：泡沫很绵很密，所以用量也不需要太多，接触皮肤按摩一会就会消失，洗干净的皮肤滑得来又不会给人洗不干净的感觉。味道也好。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (570,227,'树在荒原','使用心得：细腻的泡沫，按摩在脸上很舒服，纯植物的味道，洗完后很滋润，丝毫没有干燥的感觉，而且洗还很干净，不错，很喜欢。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (571,227,'fchd','使用心得：感觉很好，很喜欢！挤出来的泡沫真的很爱，洗起来也很舒服。',5,0,'2012-03-01 16:02:17');
INSERT INTO `goods_comment` VALUES (572,229,'sanjingjie','使用心得：很好闻的香味，ㄠ状，先涂在脸上按摩2分钟，就会变成油状，再沾水按摩就变成乳液状，很神奇哦，卸妆效果还不错，不刺激，用完脸不干，接着用洗面奶再次清洁哦。',5,0,'2012-03-01 16:02:19');
INSERT INTO `goods_comment` VALUES (573,229,'情感的异数','使用心得：蛮便宜, 味道不错, 洗的干净, 舒缓,不紧绷,适合干性皮肤',5,0,'2012-03-01 16:02:19');
INSERT INTO `goods_comment` VALUES (574,229,'mancaigou','使用心得： 虽然油油的可是喜欢之后还是蛮清爽的，而且又有点小滋润效果，用完之后也就不用其他洗面了~',5,0,'2012-03-01 16:02:19');
INSERT INTO `goods_comment` VALUES (575,229,'眼里揉不进沙','使用心得：喜欢用卸妆油的姑娘可以尝试，后期乳化的也比较好。。',5,0,'2012-03-01 16:02:19');
INSERT INTO `goods_comment` VALUES (576,230,'shirley000','使用心得：这个洁面清洁力还可以，质地蛮细腻的，而且泡沫液很舒服~是一块不错的洁面产品，洗完后，脸也不会有紧绷的感觉…很实惠..',5,0,'2012-03-01 16:02:22');
INSERT INTO `goods_comment` VALUES (577,230,'飞喜儿','使用心得：还不错，洗完也不干，洗后面颊很滑很干净，也不紧绷,而且还很耐用..',5,0,'2012-03-01 16:02:22');
INSERT INTO `goods_comment` VALUES (578,230,'走路的逮逮','使用心得：泡沫小而密,很细腻,用后脸不会干,洗的很干净,用后感觉脸很白的呢 哈哈',5,0,'2012-03-01 16:02:22');
INSERT INTO `goods_comment` VALUES (579,231,'魏什麽','使用心得：不错，冬天当水使正好，有种柔肤的感觉。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (580,231,'聆听世界','使用心得：用后感觉很不错！淡淡的果香，涂擦很容易，有清凉感，第二天皮肤触感柔软，再用其他后续保养品感觉吸收变好。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (581,232,'gsjczxy19**@hotmail.com','使用心得：这个是朋友推荐买的，感觉不出朋友推荐的那么好，可能是还没有找到用它的秘诀。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (582,232,'annett','使用心得：蛮好 就是不大好用',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (583,232,'love购物','使用心得：这个清洁乳，确实很好用。回来用了下，脸上的脏东西都出来的，搞的我自己觉得很恶心。但是，这个清洁乳很重要的一点就是手法。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (584,232,'jossi9801','使用心得：非常适合需要对抗黑头的皮肤，赞！洗完之后有清凉感而不紧绷！',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (585,232,'夜寒冰51*52','使用心得：效果还是有的，而且质地非常温和。性价比也很高，适合长期持有。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (586,232,'琴瘦97','使用心得：真的能吸出脏东西来的哦，慢慢按摩，会感觉有些小颗粒跑出来，当做去角质来玩也是不错的！很好的一款。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (587,232,'北漂的安妮','使用心得：把手心搓热，然后挤出适量摸在脸上，按说明书手法用手心轻拍“吸”大概五分钟后，脏东西出现啦，我一般拍十分钟左右。然后用水洗掉，再用一次洗面奶。用后脸超级滑，不错，不过麻烦，不适合天天用哦',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (588,232,'十万年龙','使用心得：我是偏油肤质,T位油脂分泌超旺盛,导致角质厚毛孔粗!这个面奶就可以很好的帮助我,深层清洁毛孔,把毛孔内的油脂污垢全部扫光光!很喜欢。。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (589,232,'SaLaNeiO','使用心得：这是我用过所有洗面奶中清洁力最强，用着皮肤最舒服的一款！它是植物配方，所以气味十分清新。。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (590,232,'j.y**@163.com','使用心得：费了好大劲，没看到有多大效果。可能还是不得法吧。',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (591,232,'闲不住的闲人','使用心得：这是一款很温和的清洁乳，能彻底清除彩妆，污垢其次，适当的按摩是必要的',5,0,'2012-03-01 16:02:23');
INSERT INTO `goods_comment` VALUES (592,233,'bjmulanlan','使用心得：限时抢购时买的，用起来挺温和的，赞一个',5,0,'2012-03-01 16:02:24');
INSERT INTO `goods_comment` VALUES (593,233,'花蕊751089','使用心得：用完之后皮肤挺滑的，和之前在专柜买的用的不太一样，搞不清楚为什么。。。',5,0,'2012-03-01 16:02:24');
INSERT INTO `goods_comment` VALUES (594,233,'飞喜儿','使用心得：用完后最好再用泡沫洗面奶再洗一次，那个白啊，那个嫩啊。',5,0,'2012-03-01 16:02:24');
INSERT INTO `goods_comment` VALUES (595,233,'kuaileyouni2008','使用心得：拍打2分钟就洗掉，脸上又干净又不紧绷，对于化淡妆的mm来说，值得一买。',5,0,'2012-03-01 16:02:24');
INSERT INTO `goods_comment` VALUES (596,233,'灰灰夜雨','使用心得：这个的确够温和，不愧为“温和”清洁乳。',5,0,'2012-03-01 16:02:24');
INSERT INTO `goods_comment` VALUES (597,234,'liumuyao86','使用心得：从它上市一直都用这款产品，洁面效果很好，虽然是香皂但是一点也不干，也没有那么大的香皂味道。',5,0,'2012-03-01 16:02:25');
INSERT INTO `goods_comment` VALUES (598,234,'牧眠','使用心得：挺好用的。用着不会刺激皮肤，洁肤效果也挺不错的。可以放心的使用',5,0,'2012-03-01 16:02:25');
INSERT INTO `goods_comment` VALUES (599,237,'雪絮幽清','使用心得：好用！以后还会用下去的',5,0,'2012-03-01 16:02:28');
INSERT INTO `goods_comment` VALUES (600,245,'miss车','使用心得：洗完后皮肤会白一点，感觉也不紧绷。。。三袋可以用半个月吧~不经用~',5,0,'2012-03-01 16:02:36');
INSERT INTO `goods_comment` VALUES (601,250,'尘毅成','使用心得：这款洁面奶很好用，很温和，不刺激，细腻的泡沫，能彻底洗净毛孔的油脂，污垢与残余彩妆，清洁后的肌肤柔软光滑，还能帮助去除角质，并且有效的收紧毛孔，让肌肤变得柔滑细腻，下次还购买。',5,0,'2012-03-01 16:02:45');
INSERT INTO `goods_comment` VALUES (602,250,'我们是好样的','使用心得：很喜欢的一款洗面奶.由于平时懒得去角质,所以买这种里面会带颗粒的洗面奶.因为颗粒不是很多,所以不用担心每天用会伤害皮肤.泡沫很丰富,味道也很好闻.~~',5,0,'2012-03-01 16:02:45');
INSERT INTO `goods_comment` VALUES (603,250,'七彩毒蘑菇','使用心得：好用也比较扛用。里面有小颗粒，但是不会太干。洗完以后觉得脸滑滑的。',5,0,'2012-03-01 16:02:45');
INSERT INTO `goods_comment` VALUES (604,252,'禾库人','使用心得：用了两天，很喜欢，洗的干净，不油不紧绷~很舒爽',5,0,'2012-03-01 16:03:25');
INSERT INTO `goods_comment` VALUES (605,252,'婉转的笔','使用心得：泡沫不多，但脸洗得觉得挺舒服的，有种植物的味道。',5,0,'2012-03-01 16:03:25');
INSERT INTO `goods_comment` VALUES (606,252,'我素懒洋洋','使用心得：洗完脸上觉得很干净~ 也不干~',5,0,'2012-03-01 16:03:25');
INSERT INTO `goods_comment` VALUES (607,252,'阿尼玛斯','使用心得：我喜欢泡少的洁面，因为皮肤比较敏感，而且这个味道也很天然，经常使用脸很柔软，而且面部会明亮，洗完很干净却不干燥',5,0,'2012-03-01 16:03:25');
INSERT INTO `goods_comment` VALUES (608,254,'枕冷衾寒','使用心得：泡沫很丰富，也很细腻，洗脸不紧绷味道也舒服而且量特别省，只有一点点儿就可以打出很多泡沫，清洁度比较好。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (609,254,'凌小寒','使用心得：味道很好闻，感觉能洗的干净，洗完很清爽。喜欢。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (610,254,'yixingzyx','使用心得：泡沫细腻，味道不错，洗完也不绷也不绷....很省的。一点点就够。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (611,254,'遗世情缘','使用心得：一直在用，挺好的',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (612,254,'猫儿朵_010','使用心得：很不错的一款洗面奶，泡沫非常的丰富，而且质地很轻，抹到脸上去，非常的温和，也极易冲洗，洗完以后，完全不全有紧绷感，很清爽，而且这款洗面奶还有美白的成份，挺不错的。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (613,255,'天空之蔚蓝','使用心得：白色乳液状的无泡洗面奶，里面有红色的磨砂颗粒，味道有点香，金纯面霜也是这个味儿。这个清洁力度稍稍有点不够，但祛除老废角质，用起来还算温和，洗后不紧绷。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (614,255,'陪谁去流浪','使用心得：里面有小颗粒，我觉得不能常用，本人角质层比较薄，夏天基本上每天晚上用，或者隔天用一次。连着用了半个多月了吧，偶然发现鼻子上的黑头少了，不明显了~~顿时好感倍增，特来评价！',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (615,255,'石东明','使用心得：洗面奶我很喜欢，没有什么泡沫，我觉得洗的很干净，而且喜欢里面的磨砂颗粒，很圆润应该不至于伤到皮肤的。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (616,255,'大火星','使用心得：改版后的带按摩颗粒,用后很舒服，比对了是正品。',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (617,255,'huangbq311','使用心得：这次的洁面乳跟上次买的怎么不一样，上次没有小颗粒，这次有，我在专柜买的也没有小颗粒，难道是假的。',1,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (618,255,'wenbieahui','使用心得：里面有小颗粒，可以去角质，清洁效果还可以',4,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (619,255,'陈鱼络雁','使用心得：我感觉这个东西适合皮肤干的人用，很滋润',5,0,'2012-03-01 16:03:27');
INSERT INTO `goods_comment` VALUES (620,256,'H玲玲','使用心得：还不错，痘痘好像好转了。坚持会有效果的。不好的反应现在还木有至于下面说的脱皮没有出现',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (621,256,'微凉a','使用心得：第一次用感觉效果还不错 但不能连续用几天 只能一个礼拜用个1-2次 ,经常用会脱皮 皮肤会变干的。特别油时用一次效果还是可以的',4,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (622,257,'戏雪','使用心得：不错，比超市便宜。',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (623,257,'liusu0812','使用心得：这款洗面奶真的很不错，洗的干净，一点也不干，我的皮肤很干燥，洗了之后一点也没有紧绷的感觉，太喜欢了，相宜本草真的价廉物美。',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (624,257,'fjy4411','使用心得：前天开始用，泡沫细细腻腻的，洗过脸清爽，又不会干，赞一个',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (625,257,'mbellas','使用心得：一直很喜欢这个牌子，价廉物美的典范 这次是帮室友买的，她很满意~',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (626,257,'景姐爱庚','使用心得：细小泡沫，正是我想要的，滑滑的，感觉很舒服',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (627,257,'ruixue','使用心得：洗面奶还不错~',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (628,257,'qxwangchao','使用心得：国货的包装看起来一般一点，品质还是不错的',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (629,257,'单纯邂逅518','使用心得：支持，国货很舒服，蚕丝系列都挺好',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (630,257,'文化市场','使用心得：洗的很干净，适合我的皮肤',5,0,'2012-03-01 16:03:30');
INSERT INTO `goods_comment` VALUES (631,258,'傅露露','使用心得：朋友说用起来有点干，但是因为我本来是油性皮肤，我不觉得，觉得用了以后很舒服，洗得很干净的感觉，喜欢。',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (632,258,'瓶子里的芥茉','使用心得：很好用，洗得很干净，很滑。',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (633,258,'SZ牛彤彤','使用心得：好多年来一直用这个洗面液,比一两百元一支的感觉差不多,去污且保湿不紧绷,超值',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (634,258,'欣欣1983','使用心得：上星期刚拿到,以前一直作用露得清.不错.不过以前用的一直使用的是台湾生产的露得清...第一次在网上购买化妆品不知道效果如何,期待中.......',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (635,258,'YIYI2000','使用心得：用起来和我以前买的&#183;&#183;不一样&#183;&#183;洗得不够干净',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (636,258,'amyding','优点：清洁度很好 使用心得：洗完脸后脸紧绷绷的~清洁度很好。 油皮很适合',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (637,258,'chinaw','优点：清洁力不错 使用心得：清洁力不错，可是我觉得有些太干了，洗完脸之后要赶紧擦水和乳液。',4,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (638,258,'冰月冷锋','优点：清洁很彻底 使用心得：一直听说这款洗面奶好用，果然不错，清洁很彻底',5,0,'2012-03-01 16:03:32');
INSERT INTO `goods_comment` VALUES (639,259,'jtgwkl','使用心得：老婆的化妆品都是在n5买的，送的很及时。。。',5,0,'2012-03-01 16:03:35');
INSERT INTO `goods_comment` VALUES (640,259,'蓝馨儿','使用心得：挺好的，用用皮肤挺细腻的，还有淡淡的幽香！',5,0,'2012-03-01 16:03:35');
INSERT INTO `goods_comment` VALUES (641,259,'全球心跳','使用心得：很好用',5,0,'2012-03-01 16:03:35');
INSERT INTO `goods_comment` VALUES (642,259,'wokewang1','使用心得：东西很好，一直在用',5,0,'2012-03-01 16:03:35');
INSERT INTO `goods_comment` VALUES (643,260,'二手市场','使用心得：洗的挺干净，不紧绷，还不错，美白效果继续观察',5,0,'2012-03-01 16:03:37');
INSERT INTO `goods_comment` VALUES (644,261,'小腰1','使用心得：还没用呢，不过我使用AUPRES系列已经好几年了，感觉一直不错，建议皮肤中干性的JM试下。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (645,261,'lizzy_d','使用心得：泡沫细腻丰富，易清洗，洗后不会马上感觉到紧绷，我混合肌肤，感觉挺好的，唯一不足的大概就是进到眼睛里会有点刺激，不过小心就是了',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (646,261,'smileytian','使用心得：真的很好用，  洗的很干净，  每次只需要用一点点就OK了~~  很不错~推荐！发货也挺快的！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (647,261,'yzhen','使用心得：真的是比我想象中的好的多。第一次用AUPRES的东西。真的是印象深刻，特别是在NO5买还很便宜，又正品。太划得来了。  这款洁面膏非常稠厚，买次只需要一点点，沾湿后会变好多，真的很省。而且洗的很干净，就连之前卸妆残余的一点睫毛膏和眼线膏的剩余物，也能很轻松的洗掉。真是干净、不紧绷。好用，赞一个！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (648,261,'myz**@qq.com','使用心得：与我们商场比价廉物美，用完后还来买！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (649,261,'lovewangqiqi','使用心得：特价时抢购的，对得起这个价格。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (650,261,'yz19680203','使用心得：同事说用了不紧绷，光滑，很耐用的，又买了。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (651,261,'qqfanli_749411323459','使用心得：是正品，商家很负责，包装很好，很喜欢',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (652,261,'ggsxlll','使用心得：强力推进的性价比超高的产品！！对皮肤刺激小，泡沫丰富且细腻，洗后也不会觉得脸紧绷绷的感觉。所以，也很适合干性肌肤的MM使用。此款洁面乳的味道也清心淡雅，很好闻呢。大爱哦~',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (653,261,'ppzaitian','使用心得：包装好量也足，赞一个。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (654,261,'maryh','使用心得：是正品，发货快！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (655,261,'succyiyi','使用心得：N5的价格非常实惠，欧珀莱所有产品中最好用的就是洁面膏了，除了均衡的，时光锁也不错。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (656,261,'qqfanli_890448105497','使用心得：没塑封 有盒子 不知道是天气原因还是怎么 里面都凝固了  很难挤出来 不过用起来感觉不错  希望是正品',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (657,261,'tt999tt','使用心得：很好用，而且价格便宜。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (658,261,'evasue','使用心得：看起来很不错，还没用呢，到2015年啊',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (659,261,'蜗牛meimei','使用心得：这款比较温和，泡沫丰富，洗后很舒服，性价比很好，已经是第二管了',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (660,261,'笨兮兮','使用心得：很好啊，用后不干，不皱，很滋润！！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (661,261,'可法莩','使用心得：洗的很干净，好用，不错！',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (662,261,'俏媳妇','使用心得：一直在用的牌子，之前用过莹白的，现在是均衡的配套在用．觉得应该用一整套的可能效果更好一些吧．',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (663,261,'tkpbbeijing','使用心得：原来的皮肤很干燥，有时还会起皮。现在一直用均衡保湿系列的，皮肤一点都不干了。我周围的很多人也都用了这款。',5,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (664,262,'tian3520','优点：油性肤质适合 使用心得：洗的很干净可能是我的皮肤问题，洗完以后刺刺的疼，要喷洋甘菊的调理水才能缓解，送人了，据朋友说还不错，效果因人而异可能男生用会好一点吧',4,0,'2012-03-01 16:03:39');
INSERT INTO `goods_comment` VALUES (665,263,'mttdkk','使用心得：还行 搭配乳液用了一周 感觉好像肤色有些亮了 一直使用欧珀莱的均衡保湿 这款刚用 也不错 支持',5,0,'2012-03-01 16:03:40');
INSERT INTO `goods_comment` VALUES (666,263,'牛魔王','使用心得：有颗粒，不过好像没什么太大的作用哦，和他家其他的洁面乳差不多，不过包装要好看些了，赫赫。。',5,0,'2012-03-01 16:03:40');
INSERT INTO `goods_comment` VALUES (667,264,'11030861**','使用心得：一直在用，泡沫很丰富，洗的干净。',5,0,'2012-03-01 16:03:41');
INSERT INTO `goods_comment` VALUES (668,269,'feiyan0930','使用心得：混合性皮肤，洗完之后不干燥，很舒服',5,0,'2012-03-01 16:03:47');
INSERT INTO `goods_comment` VALUES (669,271,'寻找发言权','使用心得：洗的超干净无残留，省水，很少量一点泡沫就很多，洗的时候也很润滑。',5,0,'2012-03-01 16:03:49');
INSERT INTO `goods_comment` VALUES (670,272,'tang没有蛀牙','使用心得：洗面奶洗的很干净且不干，量多又划算，不错的一款',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (671,272,'14454262**@qq.com','使用心得：很大瓶 喜欢',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (672,272,'lijunis532','使用心得：挺温和的 洗完也不会紧绷 洗的干净 泡沫多',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (673,272,'微凉a','使用心得：这款洗面奶好用，洗后不紧绷舒服而且还很清爽。控油效果不错的。很舒服，性价比很高',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (674,272,'不提也是树','使用心得：挺不错的一款洗面奶，美白看的见，从学生时期就在用它了。价格实惠又好用。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (675,272,'qqfanli_476181456851','使用心得：快递太纠结了',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (676,272,'单影舞烟坟','使用心得：东西很好，泡沫丰富。味道香香的，洗完皮肤滑滑的，不会有紧绷的感觉。很好用',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (677,272,'默默珩','使用心得：适合油性皮肤，控油效果好，味道很好闻，柠檬味的，洗脸洗的也很干净。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (678,272,'达芙妮给','使用心得：东西蛮香的，洗过之后皮肤嫩嫩滑滑的，洗了也很干净！不错不错。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (679,272,'南京蜀雅黎水电','使用心得：试用了一下很滋润，气味清香，还有柠檬洗面奶超大一瓶啊！水和乳液量也很大，很实惠！！',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (680,272,'arldq','使用心得：好用，好多泡泡，油性皮肤洗后有点干。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (681,272,'lb2820','使用心得：这款很好，用上很舒服，感觉很细腻。满分！！！还要再买！',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (682,272,'盈希983210','使用心得：淡淡的柠檬香气，膏状，洗起来很细腻，也很干净，并且皮肤不紧绷，很不错！',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (683,272,'joyceca','使用心得：柠檬味道充足 量很大 用一夏天没问题的 用后不会紧绷 很舒服  不知道美白效果如何 待观察',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (684,272,'飘飘是小鬼','使用心得：泡沫很细密，还不错~！划算！',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (685,272,'wangyanxiang','使用心得：这个真的不错，很舒服，很好柔开洗的挺舒服，我是油性 ，刚用 ，还不错，',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (686,272,'fuxiao0715','使用心得：很不错，味道香香的，柠檬味的。话说真的是好大一瓶啊，收到的时候有点被吓到了，超实惠的。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (687,272,'彬歌','使用心得：气味不好闻。不喜欢柠檬的不要买。我有点后悔了',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (688,272,'蜀悦山水','使用心得：超喜欢，用的效果很好。',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (689,272,'菲虎','使用心得：洗得很干净~~呵呵很好用的洗面奶',5,0,'2012-03-01 16:03:53');
INSERT INTO `goods_comment` VALUES (690,273,'而安zr','使用心得：试了一下很好用。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (691,273,'班xing123.-_@','使用心得：很好很好，喜欢',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (692,273,'谭灿','使用心得：不错  洗完之后不会显得脸干燥  谈谈的香味',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (693,273,'云R宝','使用心得：刚收到，好大一支呢，还没用，闻闻味道蛮好的',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (694,273,'letitia119','使用心得：挺好用的',4,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (695,273,'会跳舞的蓝胖纸','使用心得：有很多的泡泡，',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (696,273,'天使的兔兔','使用心得：好大一支呢，还没用，感觉就不错',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (697,273,'碧伊','使用心得：这不知是第几只了，很喜欢',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (698,273,'大脸猫511','使用心得：不过敏，用过不干。还不错吧。比较温和，香味很淡。因为是金贤重代言的，买回来用还真不错。宿舍有两个都在用呢',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (699,273,'cherry_zs_2006','使用心得：不错，洗完脸不紧绷，很大一瓶哦。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (700,273,'qqfanli_670571244719','使用心得：很好，量足，气味清香',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (701,273,'淡笑呐悲伤','使用心得：今天收到拿来用了，有好丰富的泡沫，气味香香的，去油能力不错，赞一个',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (702,273,'esor','使用心得：给嫂子买的，嫂子说跟以前的那瓶一样，气味啊，颜色啊，都一样的~~~~很开心哦~~~~嘿嘿，一直那么好用~~',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (703,273,'薄荷zwz','使用心得：一直用这个牌子的洗面奶，还可以，洗完脸不紧绷，洗的很干净',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (704,273,'老婆最大条','使用心得：很大一只淡绿色的膏体。泡沫丰富。很有爱。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (705,273,'tengqingshu','使用心得：洗的时候有点刺激眼睛，洗完后不会有紧绷的感觉，总体还行，很实惠',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (706,273,'xsp891025','使用心得：一直用，洗得干净。过去在淘宝买比这便宜多了，不放心淘宝就在这儿买了。回去对比了下，好象没啥区别。总之感觉你家东东大多比别家贵哦。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (707,273,'hedeqing','使用心得：  还行。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (708,273,'xyzkiller','使用心得：价钱比别家贵一些，不过应该是正品的啦，比较放心。春季用完感觉还行，偏干。味道特别清新特别好呵呵',4,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (709,274,'gardeniant','使用心得：泡沫非常细腻，清洁很彻底，非常温和，很大一支，再好的东东用久了也会审美疲劳，可以买两支不同的换着用。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (710,274,'黛黛黛442768751','使用心得：很多，很划算，好闻，好用',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (711,274,'qqfanli_476181456851','使用心得：快递比较纠结 终于等到了',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (712,274,'谢绝观看','使用心得：泡沫丰富，不错。很好用，毛孔好像都变小了，而且很超值',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (713,274,'云淡风清de云','使用心得：很干净而且还不干，不紧绷。很温和，味道还很好闻。非常好用',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (714,274,'法网棋布','使用心得：洗完脸上很滋润，适合我的皮肤味道也好闻。泡沫丰富 每次只用一点就可以，洗的很干净',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (715,274,'叶浅绿','使用心得：好大的一瓶，味道很好闻，洗得也很干净，真是经济又实惠，物美价廉。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (716,274,'丹香桂','使用心得：洗完脸没有紧绷的感觉，洗的很干净，味道很清新。不刺激皮肤，柔和性好。非常喜欢！',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (717,274,'水平座小涵','使用心得：很舒服，对于我这种角质层薄的肌肤很适合，不伤皮肤，而且脸上不干，真的好用，实惠',4,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (718,274,'xihongshi071','使用心得：大的吓人！',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (719,274,'7699180**','使用心得：好大一只，闻着挺舒服的',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (720,274,'guojiahui5**@sina.com','使用心得：很好用，推荐给MM们，卸妆很干净！超值装。很合适！',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (721,274,'AK-PS','使用心得：那个..香味太重了..',4,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (722,274,'独一','使用心得：用过这个牌子芦荟的，感觉洗的很干净，味道淡香，很好洗但是洗后比较干。樱桃的前天刚订了，准备囤货，很大只，值得推荐。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (723,274,'ruru0416','使用心得：好大一只，还没用，趁着特价，囤货！',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (724,274,'诗意莫然','使用心得：很大一只，不错，我是敏感皮肤，还好，反应不明显，味道赞一个',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (725,274,'esor','使用心得：给妈妈的，妈妈说好用！~~~~(*^__^*) 嘻嘻…… 很开心的这次~~~~以后的化妆品都交给No.5啦~~~~',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (726,274,'joanna5','使用心得：还可以，香香的，收缩毛孔嘛不觉得，可能产品也是因人而异吧，但是还是能洗干净脸的，洗面奶嘛，主要就是洗干净就行',4,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (727,274,'6238208**','使用心得：份量好大哦  感觉很好哦  洗的很干净效果不错哦',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (728,274,'icek_b','使用心得：不知道为什么我这管泡沫并不丰富，味道很香，量足，温和。可能皮肤敏感，洗后略显紧绷。总的来说不是如之前评价的那么神奇，收缩毛孔有待验证，收敛毛孔功效应该是有的。',5,0,'2012-03-01 16:03:57');
INSERT INTO `goods_comment` VALUES (729,275,'qqfanli_157153428078','使用心得：朋友说用着还真挺不错！至于生产日期她没有过于纠结，我也看不见，就这么凑合吧！',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (730,275,'letitia119','使用心得：很好用 很舒服',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (731,275,'songsong410','使用心得：很不错~洗的很干净~妆也能洗掉',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (732,275,'会跳舞的蓝胖纸','使用心得：给妈妈买的，不知道怎么样',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (733,275,'刘静子','使用心得：特别推荐，一款很不错的洗面奶，洗的很干净，又不伤皮肤，还可以天然排毒~呵，我很喜欢',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (734,275,'我的第五','使用心得：以前用过，不错，很温和',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (735,275,'zhangnailao','使用心得：很大一管，洗后没有油腻的感觉。还不错',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (736,275,'jojo0615','使用心得：还不错，期待效果',4,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (737,275,'westy521','使用心得：一如既往的好用，b是瓶子部裂_了，不影使用，效果不e',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (738,275,'wenbieahui','使用心得：分量足，可以用三个月的时间，成分安心，清洁效果也好。喜欢这个系列的洗面奶，无论是价格还是效果都值得称赞，好东西。会推荐周围的人使用。同系列的樱桃洗面奶也好用，味道清新，有种食物的感觉。这个洗面奶也好用',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (739,275,'瑞雪斋主','使用心得：沫沫丰富。还会继续支持',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (740,275,'小萨摩喵喵','使用心得：很大的一瓶，喜欢泡沫型的，洗的干净，希望能收到说明写的能抑制黑色素，收敛毛孔的效果，期待中。',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (741,275,'wyr_myjob','使用心得：看别人都说好就买了一瓶 ，还不错',5,0,'2012-03-01 16:03:58');
INSERT INTO `goods_comment` VALUES (742,276,'该懂事了','使用心得：洗的很干净，不紧绷！',5,0,'2012-03-01 16:03:59');
INSERT INTO `goods_comment` VALUES (743,276,'谢绝观看','使用心得：凉爽，清透，容易清洗，不紧绷。',5,0,'2012-03-01 16:03:59');
INSERT INTO `goods_comment` VALUES (744,276,'tina010','使用心得：总体感觉不错，比较适合我这种T区油性的混合肌。',5,0,'2012-03-01 16:03:59');
INSERT INTO `goods_comment` VALUES (745,276,'咪咪s巫','使用心得：洗的挺干净的，价格便宜，洗完不觉得干干的，味道挺好。',5,0,'2012-03-01 16:03:59');
INSERT INTO `goods_comment` VALUES (746,276,'bingying125','使用心得：我是干性皮肤，所以只在晚上用，洗的挺干净，还买了一个海藻保湿的，早上用，两个搭配用正好。',5,0,'2012-03-01 16:03:59');
INSERT INTO `goods_comment` VALUES (747,277,'jsjjlixiaojian','使用心得：真的很慢~~速度~~',5,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (748,277,'我在这的着你','使用心得：味道挺好的，效果还可以，很期待',5,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (749,277,'taoer','使用心得：给长青春痘的孩子用，可痘痘依旧哦，唉 …………',4,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (750,277,'dongqiwoo','使用心得：好东东，味道很好闻，洗得很干净',5,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (751,277,'偶然~','使用心得：性价比高，适合较油的肌肤',5,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (752,277,'wzyuzhongmanbu','使用心得：洗的比较干净，味道也蛮好闻的',5,0,'2012-03-01 16:04:00');
INSERT INTO `goods_comment` VALUES (753,278,'流星删除不良信息','使用心得：比较温和，洗完很舒服，感觉很滋润，滑滑的。',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (754,278,'happyelva','使用心得：真的很好，洗完了脸感觉水水嫩嫩的，很舒服，味道也不错，赞一个',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (755,278,'dayinyuwang','使用心得：最爱的洁面，泡沫很细腻，可以睁开眼睛洗脸了，完全无刺激，洗完皮肤很滑嫩',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (756,278,'笨兮兮','使用心得：一直用这款，干净不紧绷，淡淡的清香。',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (757,278,'sabrina末末','使用心得：超级喜欢这款洗面奶，洗了很舒服，很干净，成份安全，成份更温和。',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (758,279,'letitia119','使用心得：用后很舒服 很干净 也不干',4,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (759,279,'5522cy','使用心得：香味很甜美，洗的也很干净而且不会有紧绷的感觉',5,0,'2012-03-01 16:04:01');
INSERT INTO `goods_comment` VALUES (760,280,'吴淑蓉','使用心得：泡沫丰富  洗的干干净净不紧绷  美白效果还不知道',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (761,280,'胡瑶瑶','使用心得：我顶的产品，就这一款我最满意，洗玩之后瞬间美白，不错，以后只用这一款',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (762,280,'秦桑桑','使用心得：洗了后很舒服，很棒',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (763,280,'88999**','使用心得：宝贝非常好用，是正品，一直都在该网站购化妆品，值得信任，继续支持。希望该网越办越好。',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (764,280,'shiqi520','使用心得：不错 很好用的一款！',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (765,280,'cendyyang','使用心得：蛮不错的~~',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (766,280,'qulijuan1**@163.com','使用心得：与描述相符。',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (767,280,'桥上的羽毛','使用心得：用过很多支了，非常好用，细腻的泡沫，洗得干净又不会觉得干燥',5,0,'2012-03-01 16:04:02');
INSERT INTO `goods_comment` VALUES (768,281,'wodalao','使用心得：好！！！！！！！！！！！！！',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (769,281,'5242407**','使用心得：很不错哦。 我买的 一套',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (770,281,'jojoli1012','使用心得：用了商欤看起砜赜托Ч有c，好',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (771,281,'潴小晨','使用心得：味道很好闻诶。淡淡的。感觉很舒服。现在南方天气好冷暂时搁置不用。夏天绝对是绝佳的选择啊。嘻嘻。很不错噢。赞！',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (772,281,'竹君作文','使用心得：清爽不油腻，适合夏天使用，用后不紧绷',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (773,281,'老冰~','使用心得：中草药化妆品，性价比超高',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (774,281,'zw4688','使用心得：很清香，很喜欢闻那个味道、用了脸上也不油、',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (775,282,'yearn_song','使用心得：可以，不紧绷，像香皂的味道，而且价钱实惠',4,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (776,282,'心如止水66','使用心得：还没有使用，希望有效果吧',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (777,282,'wxx8023','使用心得：只用了一次，有没有效果还不知道，但是我很喜欢那个味道，而且感觉还挺好的',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (778,282,'唐伯牛','使用心得：很温和，挺舒服的，洗完脸后也不干，很喜欢，继续用。',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (779,282,'财经联盟','使用心得：这东西用了几个月，用点效果了，以前的斑很明显，现在渐渐淡了。价格便宜的好东东，真的高兴极了！',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (780,282,'mxf7','使用心得：相宜本草的东西价位适中，性质温和，他们家的红石榴，四倍，美白，斑系列都用过了很喜欢。',5,0,'2012-03-01 16:04:03');
INSERT INTO `goods_comment` VALUES (781,283,'履如薄冰','使用心得：这款挺适合中性及干性皮肤使用。。。',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (782,283,'cjcj921','使用心得：在很多网站上看到大家说用了还不错，我就买了试试，还没用，期待会有好的效果~~',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (783,283,'墨宸','使用心得：希望适合我',4,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (784,283,'zhuzhuailaogong','使用心得：温和性的洗面奶  很适合早上用哦',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (785,283,'下辈子我要做猪','使用心得：秋季用很好啊，不会很干了，很温和',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (786,283,'hawu_tu**@163.com','使用心得：有点油油的...     可能因为以前用的都是泡沫的     还没习惯乳',4,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (787,283,'润宇记','使用心得：非常好的洁面乳，已经是第二次购买了，保湿效果很好',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (788,283,'jshuida','使用心得：洗完好像没洗净一样滑滑的，我喜欢洗完脸上干干的那种，这款可能不适合我。但相宜的东西还不错的。',4,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (789,283,'果品燕来','使用心得：我的皮肤偏干性，特意选了这款无泡沫的，据说无泡沫的洗面奶刺激性小且品质好，反正这款用着不错。',5,0,'2012-03-01 16:04:04');
INSERT INTO `goods_comment` VALUES (790,284,'5522cy','使用心得：清洁效果很好，用起来也很方便',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (791,284,'胖梨1912','使用心得：之前就是听说适合经常用电脑的人才买的,不过,感觉确实不错的.',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (792,284,'solic','使用心得：效果挺好，使用方便，洗的也挺干净的',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (793,284,'丑闻发炎人','使用心得：期待使用效果中。。。',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (794,284,'糖酥酥','使用心得：洗的蛮干净',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (795,285,'可法莩','使用心得：用起来滑滑的，不紧绷，洗的还挺干净的，不错。',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (796,285,'njhdv','使用心得：这款洗面奶不错，泡沫很细腻，洗完之后不会干干的',5,0,'2012-03-01 16:04:05');
INSERT INTO `goods_comment` VALUES (797,287,'yxr408702350','使用心得：我已经买了三套了，用了效果很不错，谢谢客服小姐给我推荐，只买对的，不选贵的。',5,0,'2012-03-01 16:04:07');
INSERT INTO `goods_comment` VALUES (798,287,'^','使用心得：价格不贵，对脸部的清洁效果明显。',5,0,'2012-03-01 16:04:07');
INSERT INTO `goods_comment` VALUES (799,287,'cixiaofeng','使用心得：价格便宜，中药成分没刺激。',5,0,'2012-03-01 16:04:07');
INSERT INTO `goods_comment` VALUES (800,287,'苦命的猫','使用心得：还不错，中草药成分的东东，用了一个星期痘痘是还在冒，不过脸已经不太油了，我会坚持用的',5,0,'2012-03-01 16:04:07');
INSERT INTO `goods_comment` VALUES (801,287,'瓷碗清茶','使用心得：感觉很好，没不好的反映',5,0,'2012-03-01 16:04:07');
INSERT INTO `goods_comment` VALUES (802,288,'暗香001','使用心得：洁面效果好，洗后不紧绷，很舒服。',5,0,'2012-03-01 16:04:09');
INSERT INTO `goods_comment` VALUES (803,288,'wj520ang','使用心得：用过了，很清爽，刺激性小 ，价格合理，质量不错',5,0,'2012-03-01 16:04:09');
INSERT INTO `goods_comment` VALUES (804,288,'紫燕尘埃','使用心得：洗的挺干净的，没有总冲不净的假滑感。超好的洗面奶，会一直支持，美白效果超棒的',5,0,'2012-03-01 16:04:09');
INSERT INTO `goods_comment` VALUES (805,288,'kongbai91','使用心得：首先大赞下它的味道，淡雅的清新，非常非常的好闻，绝对不浓烈，不刺鼻；其次是它的效果，用时在手心加点水再用双手轻揉会有丰富细腻的泡沫，敷在脸上非常舒服，洗完后脸变得白皙舒爽、干净剔透，而且不紧绷，即使第一次使用也可以明显体验到它惊人的突破亮白。我用了一个星期左右，脸明显比以前白皙均匀了好多~~~连雀斑都变淡了不少，超级震撼的效果。做为药妆，它的质量真得是不容置疑。强烈推荐！虽然价格不算低，但真的值得败!',5,0,'2012-03-01 16:04:09');
INSERT INTO `goods_comment` VALUES (806,288,'心尖上的烟头','优点：长期使用效果不错 使用心得：美白洗面奶我用了好多，用的时候还可以，但是一不用了就又回去了，理肤泉美白泡沫用了三个月了，皮肤好了许多，中间停用了两个多星期也没发现变回去，感觉不错。',5,0,'2012-03-01 16:04:09');
INSERT INTO `goods_comment` VALUES (807,289,'3863393**@qq.com','使用心得：东东不错，清洁效果很好。',4,0,'2012-03-01 16:04:10');
INSERT INTO `goods_comment` VALUES (808,289,'偶然~','使用心得：清洁力比较强，用一点就可以揉出很多泡沫，洗完了感觉清爽，但是有点干，有点绷',4,0,'2012-03-01 16:04:10');
INSERT INTO `goods_comment` VALUES (809,289,'回忆如潮水','优点：泡沫丰富，洗的干净，味道要好闻 使用心得：不错，泡沫丰富，比20多元的品牌洗面奶效果要好，洗的要干净，味道要好闻',5,0,'2012-03-01 16:04:10');
INSERT INTO `goods_comment` VALUES (810,290,'yilixia','使用心得：还没用过，不过感觉量好少。',4,0,'2012-03-01 16:04:10');
INSERT INTO `goods_comment` VALUES (811,290,'一江秋水.','使用心得：清洁力比较强，夏天出油的时候用一点就可以揉出很多泡沫，洗完了感觉清爽，但是有点干，有点绷',4,0,'2012-03-01 16:04:10');
INSERT INTO `goods_comment` VALUES (812,291,'maoweifei','使用心得：泡沫不多，有保湿的小颗粒在里面，洗后觉得还算干净，挺清新，主要是味道清香，跟水、乳一样的味道，不干燥，挺舒服。',5,0,'2012-03-01 16:04:11');
INSERT INTO `goods_comment` VALUES (813,291,'小帖子','使用心得：用泊美植物臻白系列的产品半年了，感觉很舒服，因为是纯植物的，所以不必担心刺激皮肤。',5,0,'2012-03-01 16:04:11');
INSERT INTO `goods_comment` VALUES (814,292,'wangrui0890','使用心得：不错啊，洗的干净不紧绷，很喜欢绿茶的味道，就是不禁用',4,0,'2012-03-01 16:04:12');
INSERT INTO `goods_comment` VALUES (815,295,'dervla','使用心得：很喜欢 没有泡沫 很温和 特别适合像我这种干燥又敏感的皮肤',5,0,'2012-03-01 16:04:16');
INSERT INTO `goods_comment` VALUES (816,295,'laura1106','使用心得：洗后没有紧绷感，不错。客服及快递人员态度都挺好。谢谢！',5,0,'2012-03-01 16:04:16');
INSERT INTO `goods_comment` VALUES (817,296,'灰灰夜雨','使用心得：皂的味道很喜欢，因为滋润成分多，所以洗完之后整张脸润润的',5,0,'2012-03-01 16:04:17');
INSERT INTO `goods_comment` VALUES (818,296,'雁之行','使用心得：泡沫很丰富，很耐用的，味道也非常喜欢，',5,0,'2012-03-01 16:04:17');
INSERT INTO `goods_comment` VALUES (819,296,'快乐天使WL','使用心得：这皂不错滴，很温和又洗的很干净，婴儿般的天然香。洗完不会有总洗不干净的假滑感，但又没有别的皂洗完后的涩涩感，灰常好～',5,0,'2012-03-01 16:04:17');
INSERT INTO `goods_comment` VALUES (820,296,'ywq198592','使用心得：这个不错。感觉很好',5,0,'2012-03-01 16:04:17');
INSERT INTO `goods_comment` VALUES (821,297,'shirley000','使用心得：感觉很清凉，洗后平复不紧绷，不干燥，坚持使用后，脸上痘痘减少，味道也很好闻，不刺鼻。',5,0,'2012-03-01 16:04:18');
INSERT INTO `goods_comment` VALUES (822,298,'lili740820','使用心得：宝贝收到，非常喜欢，味道也很好闻，不错，而且好大一瓶的，下次还会来买的.',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (823,298,'shanss','使用心得：好大的一瓶，还没用了，客服满足了我要求特价产品新鲜的要求，非常满意',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (824,298,'sarah_lisa68','使用心得：泡沫型的洁面，淡淡的鼠尾草味道，适合混合偏油的肌肤，洁面很干净，也不会感觉紧绷，会一直用下去。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (825,298,'七把剑','使用心得：温和不刺激，洗完不会觉得不干燥，清洁力也不错 非常大一只，可以用很长时间，味道也是我所喜欢的！',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (826,298,'咪咪s巫','使用心得：使用感很好，味道习惯就好了，而且用这个的时候，痘变得好转，洗的很干净的感觉，用量很省。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (827,298,'戏雪','使用心得：拿到后没想好大一瓶，呵呵，可以用好长时间啊！洁肤效果感觉一般般，用后不是特别滋润，整体感觉一般，算是很便宜了。',4,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (828,298,'asis816','使用心得：香味很清新，洗的也很干净，洗完后脸上不紧绷，保湿效果不错，性价比很高啊',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (829,298,'xiaoyao419','使用心得：我只能说雅顿是最适合我肌肤的护肤品，肯定一直用下去的。提醒各位姐妹，我是属于混合型的肌肤，不过敏，但是用薇姿等产品的有点容易长痘痘。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (830,298,'apple11119','使用心得：保湿效果期待ing',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (831,298,'无双MM','使用心得：特价时买的，味道很好闻，用完感觉很舒服，赞一个',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (832,298,'刘兰娟','使用心得：还没开始用，但是很期待！！千万不要让我失望啊~~~~',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (833,298,'牛魔王','使用心得：五星。很好用，虽然是乳液没有泡沫，一样能清洗干净。最重要的是绝对不过敏。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (834,298,'lijun1211','使用心得：用了能有2周了，感觉洗脸洗的很干净、彻底。洗后不油、不干。很好，赞一个。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (835,298,'豆豆495405535','使用心得：很好用，很清爽',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (836,298,'luchuanjunnana','使用心得：我用完一瓶才来评价的，味道没有加入太多香精，脸洗得比较干净，洗完后脸滑滑的，我属敏感型肌肤，用后没有过敏或不舒服感觉，压嘴式用起来也方便，个人觉得不错。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (837,298,'candy744**@yahoo.cn','使用心得：还没拿到手，不过蛮期待地~',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (838,298,'summersummer2010','使用心得：整体效果不错,适合夏天用,里面可能有薄荷,洗后有点凉的感觉.',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (839,298,'dorakk','使用心得：洗脸后不绷，感觉挺干净的，不错',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (840,298,'shilei100','使用心得：很大一瓶，比想象中的还要大，洗后很干净，有股药味',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (841,298,'淡舞嫣然','使用心得：专门用了一段时间上来写的.洗完脸很滑不紧绷但不会觉得没洗干净,感觉对调节水油平衡效果还不错,使用一段时间后脸没有那么爱出油了.我是混合型皮肤.最重要是实惠,保鲜期也是到13年9月份的,可能因为没有添加香精的原因,味道我不是很喜欢,不是很好闻,其他的都非常满意.',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (842,299,'圆圆扁扁的我','使用心得：洗完很清爽，很抗用的洗面奶，里面有小小的蓝色颗粒，味道也不错，会出很多泡泡，还是不错的。',5,0,'2012-03-01 16:04:19');
INSERT INTO `goods_comment` VALUES (843,301,'YYDETT','使用心得：价格便宜,帮朋友买的。不错',5,0,'2012-03-01 16:04:25');
INSERT INTO `goods_comment` VALUES (844,301,'昭D','使用心得：便宜就买了，比较适合我的肤质，呵呵',5,0,'2012-03-01 16:04:25');
INSERT INTO `goods_comment` VALUES (845,302,'马洁00','使用心得：说是适合任何肤质我就买了，可我使用后，面部泛红，鼻梁特别明显',3,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (846,302,'tbeye','使用心得：货到的很快，我妈用了说很好',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (847,302,'taihua','使用心得：朋友说刚到货就用了，挺好。。。我觉得还是稍贵些。。。',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (848,302,'cz5020','使用心得：很好清洗，挺好用',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (849,303,'宝贝','使用心得：洗得很干净,而且不紧绷',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (850,303,'vipshop588','使用心得：现在在用，感觉泡沫很细腻，很舒服。',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (851,303,'mlzgcbblhm','使用心得：温和，不刺激,感觉非常好，应该适用于干性和敏感性皮肤',5,0,'2012-03-01 16:04:26');
INSERT INTO `goods_comment` VALUES (852,304,'wangrui0890','使用心得：保湿效果不错，量也足，可以用很长时间~',5,0,'2012-03-01 16:04:27');
INSERT INTO `goods_comment` VALUES (853,304,'chenxiaochenxi','使用心得：这款洗面奶不错，温和又洁净，老少皆宜，我妈和我都用了不错。  但有个问题哦，我一直是在贵网站买兰芝的产品，发现那款毛孔修复乳液颜色和在专柜不一样，专柜的颜色要白些；我朋友经我介绍也在你们网站买了很多产品，发现契尔氏的黄瓜水比从香港买的颜色要淡些，请问能给个解释吗？',5,0,'2012-03-01 16:04:27');
INSERT INTO `goods_comment` VALUES (854,305,'老冰~','使用心得：无泡沫，很细腻的膏体质地，非常的柔滑。洗完很干净，很滋润，不紧绷，正好！很喜欢',5,0,'2012-03-01 16:04:28');
INSERT INTO `goods_comment` VALUES (855,305,'charm','使用心得：@一款o泡。  不^清能力挺好，洗完之后上非常柔，z滑的感X。',5,0,'2012-03-01 16:04:28');
INSERT INTO `goods_comment` VALUES (856,306,'微凉a','使用心得：味道淡淡的。用量省，泡沫丰富，很细。洗的很干净，鼻子上的黑头洗完会浮出小白头。夏天用洗完脸不干。是这个系列我最喜欢用的。',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (857,306,'怡心小亭','使用心得：用过一管，觉得还不错，就是有点小贵。洗的很干净，洗完皮肤很柔软，泡沫也很细腻。',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (858,306,'气愤的大宝贝','使用心得：我是混合性有点点敏感的皮肤，原来用完这款洗面奶感觉还算挺温和的。',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (859,306,'天空之蔚蓝','使用心得：干净不紧绷，滑滑的嫩嫩的，总之是喜欢。最后说一句，很经用啊这款。',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (860,306,'sally513','使用心得：用了很久了，干性皮肤很适合，用后不紧绷，挺舒服的',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (861,306,'nsxiaoma','使用心得：真的超好用！超赞，强烈推荐！丰富的超微泡沫，温和清除面部各种污垢，不含皂素，可彻底清洁每一个毛孔',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (862,306,'磕西地那','使用心得：资生堂洗面皂真的超好用！超赞，强烈推荐！温和度是洗面奶中上乘之选，价格上优势不大，但是能接受',5,0,'2012-03-01 16:04:29');
INSERT INTO `goods_comment` VALUES (863,307,'159954759**','使用心得：东东还不错,洗后不紧绷,洗得也很干净.',5,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (864,308,'樊美美','使用心得：很好的一款洁面乳，洗得很干净。',5,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (865,308,'a765296993','使用心得：佰草集的很好用， 这款洁面乳泡沫丰富， 很细腻，温和， 挺好用的， ！',5,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (866,308,'小兔招财','使用心得：泡沫很丰富细腻，一点点就可以洗很干净，不过洗后还是有点紧绷感，夏天用好一些。',4,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (867,308,'大冬瓜','使用心得：还可以了 洗的蛮干净的',3,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (868,308,'succyiyi','使用心得：很好用，洁面后皮肤细致爽滑，佰草集的产品值得推荐！另外，N5的价格非常优惠，比别的网站便宜不少呢！',5,0,'2012-03-01 16:04:30');
INSERT INTO `goods_comment` VALUES (869,309,'jindoudou0511','使用心得：感觉还不错的',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (870,309,'相似的思维','使用心得：很好的东西，用得很舒服',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (871,309,'yanlijuan051','使用心得：嗯，是正品，很好用',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (872,309,'酸甜苦辣闲','使用心得：泡沫丰富而细腻，很温和，洗后不紧绷，几乎没有什么味道，而且省时，很适合上班族，真的是多、快、好、省！赞',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (873,309,'智者乐仁者寿','使用心得：样子很新颖，泡沫很温和，就是用的有点快！',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (874,310,'黛黛黛442768751','使用心得：用完了，还可以。',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (875,310,'蓝皮不要爱','使用心得：用了几次才来评价的，味道很好，洗的干净，但有刺痛感，不知道为什么。',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (876,310,'becky香奈儿','使用心得：ㄠ状的用力搓出泡沫才能洗的干净，不过用后觉得确实不紧绷而且业挺干净的',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (877,310,'清月悠悠','使用心得：我已经用了5瓶了，现在还在用，很好，洗得很干净，推荐',5,0,'2012-03-01 16:04:31');
INSERT INTO `goods_comment` VALUES (878,313,'summer5156','使用心得：第一次用洁面皂，这个洗的很干净的，很不错',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (879,313,'Tiffanytm','使用心得：还没使用但是外观跟我专柜购买的不太一样 特别是那个DHC的橄榄标志不一样  感觉很假的样子  先用吧 用了再来评价一个',4,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (880,313,'熙熙熙','使用心得：不错，应该是正品',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (881,313,'那多小姐','使用心得：很不错的洁面皂',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (882,313,'aimer.j','使用心得：有点儿淡淡的生姜味，泡沫蛮多的  貌似洗得蛮干净  不错，不错',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (883,313,'紫色何风','使用心得：买了还没有用 应该是正品 是正品很值的哦',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (884,313,'xiangxizy','使用心得：好好好好好',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (885,313,'1062630**','使用心得：香味很正，应该是正品',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (886,313,'qqfanli_973930693','使用心得：效果是非常的明显，推荐使用！',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (887,313,'Cawin','使用心得：正品，买之前还担心是不是正品，货一到马上拿来用，果然跟在专卖店买的一样。',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (888,313,'cghjjzcjy','使用心得：蛮好，跟之前在官网买的一样！下次还会买',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (889,313,'宝贝亮','使用心得：洗的很干净',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (890,314,'猫巫...bianbian','使用心得：洁净力强。但也不会伤皮肤。用后不会有干干的感觉~不错。',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (891,314,'人_丑','使用心得：包装很漂亮，清洁效果不错，温和细腻，洗的干净，而且很很清爽。',5,0,'2012-03-01 16:04:34');
INSERT INTO `goods_comment` VALUES (892,315,'XLT-LUCK','使用心得：无色无味的纯透明着哩，很温和',5,0,'2012-03-01 16:04:35');
INSERT INTO `goods_comment` VALUES (893,315,'my9party','使用心得：非常清爽，洗完脸很干净很舒服，也不紧绷，还很保湿，我很喜欢。',5,0,'2012-03-01 16:04:35');
INSERT INTO `goods_comment` VALUES (894,315,'陈鱼络雁','使用心得：洗后脸软软的，不紧绷，泡沫非常之细腻，比较保湿。',5,0,'2012-03-01 16:04:35');
INSERT INTO `goods_comment` VALUES (895,316,'萌萌mm','使用心得：我的皮肤是敏感肤质，尤其对洗面奶，更敏感。之前大意用了杂牌洗面奶，导致脸上冒痘痘了。立刻换了这款洗面奶，用了两三天的时间，痘痘就有所缓解了。不错的产品。',5,0,'2012-03-01 16:04:36');
INSERT INTO `goods_comment` VALUES (896,317,'58392**','使用心得：产品不错，洗了很舒服，保湿好，就是压嘴不好用',4,0,'2012-03-01 16:04:36');
INSERT INTO `goods_comment` VALUES (897,319,'fanfan79','使用心得：真的很好用，脸很滑 不干',5,0,'2012-03-01 16:04:38');
INSERT INTO `goods_comment` VALUES (898,319,'qunanok','使用心得：很好 不错 赞一个(*^__^*) 嘻嘻……',5,0,'2012-03-01 16:04:38');
INSERT INTO `goods_comment` VALUES (899,320,'迷你号豆豆','使用心得：很大一支，很划算。一点点泡沫就很多！性价比很高！',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (900,320,'lady馨','使用心得：不错不错！！',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (901,320,'zhongqian','使用心得：还没用，看着还可以。跟韩国买的包装不太一样。',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (902,320,'kk16537','使用心得：已经第三次购买了，帮同事订的，因为用的好介绍给她们，大家都觉得物超所值，支持N05。',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (903,320,'prove123','使用心得：洗的很干净，很舒服。',4,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (904,320,'mlzgcbblhm','使用心得：味道很好闻，效果也蛮好',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (905,320,'wstxdywe','使用心得：味道一般,效果不错,量也够足',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (906,320,'人生姿态','使用心得：水蜜桃味道很淡，洗的时候泡沫不多，本人喜欢泡沫多的，瓶身很大，但对着阳光看里面大概是小三分之二多的量，质地软润，洗完不会很干，清洁力不强算是温和型',4,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (907,320,'小绿葱葱','使用心得：很好用，泡沫丰富，是我用过觉得很好的一款，我是混合型皮肤，用完很滋润！用完想买个柠檬的！！',5,0,'2012-03-01 16:04:39');
INSERT INTO `goods_comment` VALUES (908,321,'刘宇0601','使用心得：超大一支啊，一直在用的，效果吗一般，也没见得能收缩毛孔，清洁度还可以，但保湿效果不错。',4,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (909,321,'泛泛','使用心得：用的很舒服，洗的也干净',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (910,321,'碧伊','使用心得：第二次在5N买东东了，很喜欢',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (911,321,'娜娜118','使用心得：量很多，开始还担心效果不好，现在看来之前的担心是多余的，用了清除效果也很不错，很好，赞一个。。',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (912,321,'lijunis532','使用心得：很好用，天然的没有刺激。能洗得很干净。推荐。',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (913,321,'小白wokaonima','使用心得：恩，油洗掉了。只能夏天用用。',4,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (914,321,'十八子娟娟','使用心得：超值的，很大一支，而且去污能力很不错，用后皮肤也不紧绷。。',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (915,321,'凌峡','使用心得：东西很不错啊！比想象中的要好的多',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (916,321,'seagirlqing','使用心得：速度好快，期待效果',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (917,321,'男人何必在乎','使用心得：很喜欢',5,0,'2012-03-01 16:04:40');
INSERT INTO `goods_comment` VALUES (918,325,'wn68522','使用心得：宝贝收到后很脏',1,0,'2012-03-01 16:04:42');
INSERT INTO `goods_comment` VALUES (919,327,'王兰兰','使用心得：不错，洗过后脸上不紧绷。',5,0,'2012-03-01 16:04:44');
INSERT INTO `goods_comment` VALUES (920,329,'qqfanli_548938404803','使用心得：15号下单，17号到货，速度还可以，上海到南京。如果是北京到南京估计就慢了。  玫琳凯用起来没什么泡沫，清洁效果一般',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (921,329,'★370天的爱情','使用心得：不错不错，很好用的一款东东。控油效果好，而且不会干燥。',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (922,329,'熊欣慧','使用心得：发货太慢，象蜗牛，中通服务超差，市内也不送',2,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (923,329,'水玲','使用心得：嗯，不错，以前有用过，这次买的东东是一样的',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (924,329,'zhouju','使用心得：给老婆买的，听说用着还行吧',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (925,329,'chen0728','使用心得：基础护理很不错.赞',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (926,330,'徐小姐ABC','使用心得：这一款是没有泡沫的，适合干性皮肤使用，每次用量很多，不然感觉没洗着似的。不知道为什么我买的玫琳凯产品包装盒上的生产日期下的批号都被刻意的划掉了。',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (927,330,'zhuxiaocha890116','使用心得：不错  适合皮肤干的女生  很保湿   但是卸妆力度不是很强    建议用完卸妆液在使用',5,0,'2012-03-01 16:04:45');
INSERT INTO `goods_comment` VALUES (928,331,'tutulhg','使用心得：发货可以就是，就是近俩次的产品收到时外包装不是完整的，很影响心情',5,0,'2012-03-01 16:04:46');
INSERT INTO `goods_comment` VALUES (929,331,'fsk','使用心得：07年就开始用MK产品了，一直保持着好感。就是到货太慢了，希望以后做好备货工作。',5,0,'2012-03-01 16:04:46');
INSERT INTO `goods_comment` VALUES (930,334,'cathead1987','使用心得：挺好的洗的不干',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (931,334,'5522cy','使用心得：泡沫确实相当的绵细，用起来很舒服，不会紧绷，洗后脸上滑滑的',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (932,334,'amc60','使用心得：用过好几瓶，泡沫细腻，用后脸很滑，一瓶能用3、4个月，真的很好用！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (933,334,'二月的卤煮火烧','使用心得：清洁能力不错，洗后肌肤舒适不紧绷。洗完脸真的会有变白的感觉哦！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (934,334,'落纸云烟','使用心得：很好的洁面品，喜欢这种味道',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (935,334,'bloody-marry','使用心得：用后脸很干,以前买过KOSE的东西不这样,很不喜欢,不推荐!',3,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (936,334,'xilas**@qq.com','使用心得：好用！泡沫很绵密，洗起来很舒服！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (937,334,'乌龙虾','使用心得：这款让我觉得洗脸是一种享受~ 有着淡淡的花香，清新怡人。使用很方便卫生，~ 超微细柔和的丰富泡沫，温和，不刺激皮肤',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (938,334,'人生姿态','使用心得：泡泡挺细腻的 在脸上按摩的时候感觉好舒服 不用怕像洗面奶一样在手上或棉上起泡时已经弄脏了 放心很多~ 而且真的超级滋润的 洗完皮肤弹性很不错 水水的~',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (939,334,'sanjingjie','使用心得：用了高丝慕斯，最好的地方就是慕斯很细腻，能深入到毛孔清洁到毛孔深处的垃圾，也能照顾到这些脸部死角，让里面藏的污垢统统再见~',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (940,334,'208241**','使用心得：一般，没感觉出好用……',3,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (941,334,'bidder79','使用心得：用了几次，洗得挺干净的。',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (942,334,'nancy22','使用心得：这个很好用，',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (943,334,'roooreo','使用心得：不错不错啊！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (944,334,'dzxdg','使用心得：超赞！很喜欢！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (945,334,'xx080913','使用心得：一个礼拜菜到货,期待了好久呢,还没开始用',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (946,334,'fengwei000','使用心得：第一次用感觉还不错',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (947,334,'nuonuo33','使用心得：还没用 看样子很喜欢的',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (948,334,'sarysha','使用心得：味道淡淡的，就喜欢这种味道。、发货速度很快，从开始下单到拿到货不到三天。。赞！！',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (949,334,'小小杨舒','使用心得：用着 感觉不错',5,0,'2012-03-01 16:04:48');
INSERT INTO `goods_comment` VALUES (950,335,'SaLaNeiO','优点：东西不错 使用心得：没有起炮球，得自己配。东西不错，很滋润，不紧绷。',4,0,'2012-03-01 16:04:49');
INSERT INTO `goods_comment` VALUES (951,336,'liuhuiyun','使用心得：好喜欢这种味道，沉浸其中，是一种享受！挺不错的一款洗面奶！洗后，皮肤真的不紧绷！',5,0,'2012-03-01 16:04:50');
INSERT INTO `goods_comment` VALUES (952,336,'chen0728','使用心得：很好用，洗的很干净，不紧绷。推荐~~~',5,0,'2012-03-01 16:04:50');
INSERT INTO `goods_comment` VALUES (953,336,'借口时间','使用心得：味道像酒店沐浴液，泡沫不好洗，没有密封',2,0,'2012-03-01 16:04:50');
INSERT INTO `goods_comment` VALUES (954,339,'wj520ang','使用心得：质地很温和，清爽的泡沫，轻柔细致的泡沫慕丝能够彻底洁净肌肤，温和地清洁面部。洗完后的皮肤嫩白净、光滑剔透。赞！',5,0,'2012-03-01 16:04:52');
INSERT INTO `goods_comment` VALUES (955,339,'zhuzhu7626','使用心得：今天刚收到这个产品，迫不及待的使用了。发表感受，洗后好舒服，如上家说的一样，泡沫好丰富。还有淡淡清香。正品。如果NO.5产品再齐全点就好了。如果可以按客户要求定货更好。',5,0,'2012-03-01 16:04:52');
INSERT INTO `goods_comment` VALUES (956,339,'cui88cui','使用心得：洗后不紧绷，还有美白的效果，泡沫也比较多',5,0,'2012-03-01 16:04:52');
INSERT INTO `goods_comment` VALUES (957,341,'猪小8睡着了','使用心得：没有味道&#183;&#183;&#183;&#183;&#183;泡沫很丰富&#183;&#183;&#183;&#183;&#183;&#183;',5,0,'2012-03-01 16:04:53');
INSERT INTO `goods_comment` VALUES (958,341,'舍舍包子','使用心得：理肤泉的洁面效果非常棒啊，专为敏感肌肤设计的，味道很清香，洁面的过程是一种享受啦，而且泡沫还比较丰富，清洁力不错，彩妆后就算不用卸妆液，直接用这款洁面泡沫也可以很好的清洁肌肤，用后不会有紧绷绷的现象，而且绝对 是低刺激哦，专为敏感肌设计的，绝对不会出现过敏的现象哦，长时间使用皮肤还会变白呢，不错的产品，赞一个',5,0,'2012-03-01 16:04:53');
INSERT INTO `goods_comment` VALUES (959,341,'哈哈爱狗','使用心得：泡沫丰富，用后一点没有紧绷感，而且很温和不刺激，很多产品是刚用时效果还好，用一段时间后就没什么感觉了，这款长期使用也不会减效，很赞！&#160;',5,0,'2012-03-01 16:04:53');
INSERT INTO `goods_comment` VALUES (960,343,'dayinyuwang','使用心得：洗的很干净，皮肤不会干哦~这个味道我也很喜欢。',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (961,343,'ssrb031','使用心得：很不错 味道也非常好 洗的很干净 但不干燥',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (962,343,'政治老师','使用心得：很好用的 ，洗完后很干净而且不干',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (963,343,'5522cy','使用心得：甜甜的味道，洗的也很干净，不错',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (964,343,'一盆土豆','使用心得：给个五分，  味道非常好。  可爱的不得了。  想起它的同品牌苹果味。  去角质也不错。  推荐。  （干性皮肤MM慎用）',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (965,343,'小叶子2011','使用心得：很喜欢这个味道，不错哦',5,0,'2012-03-01 16:04:54');
INSERT INTO `goods_comment` VALUES (966,344,'qiqizanai**@vip.qq.com','使用心得：真的特别好用,~ 刚刚又买了一套,希望下个感到惊喜的是你,~',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (967,344,'TB8349372','使用心得：还没有用呢 不知道怎么样 只是怎么我买了半个月了 还只是普通会员呢',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (968,344,'5242407**','使用心得：效果很不错 量大  一点点就能打出好多泡沫',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (969,344,'5522cy','使用心得：泡沫很细腻，洗的很干净，味道也不错，很实惠',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (970,344,'hj_crystal','使用心得：用了几支了，量大，价格也划算，挺好的。',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (971,344,'min1267','使用心得：挺好的 味道喜欢 赞一个！！',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (972,344,'人_丑','使用心得：价格实惠，这个我用有点小干',4,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (973,344,'WOSXKE','使用心得：好大哦，泡沫很细腻',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (974,344,'闲不住的闲人','使用心得：好大只，还没用过，看着很不错哦',5,0,'2012-03-01 16:04:55');
INSERT INTO `goods_comment` VALUES (975,345,'xieyufeisi','使用心得：产地：比利时，蛮大的一支，估计要用大半年。',5,0,'2012-03-01 16:04:56');
INSERT INTO `goods_comment` VALUES (976,346,'leilei1920','使用心得：有点香了但是小泡沫很舒服，洗完干净不紧绷，美白效果还没看出来。',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (977,346,'润宇记','使用心得：洗面奶质地且不油，洗完之后润润的，很干净，而且不会觉得干。贵还是有点道理滴。',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (978,346,'静待莲开','使用心得：我就觉得这一款很好，泡沫刚刚好，很舒服，味道也不错~洗完很水润的，水润就对了嘛，这样后续才能好好吸收~~',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (979,346,'XLT-LUCK','使用心得：洁面效果不错，觉得洗完之后有美白的效果，而且皮肤摸着很柔滑',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (980,346,'~无知~','使用心得：很好用 洗面后肤色会明显变白~',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (981,346,'紧扣啦','使用心得：使用感觉很好,不会很干.一点点就会出很多的泡泡.但相对比较冬天不是恨适合.',5,0,'2012-03-01 16:04:57');
INSERT INTO `goods_comment` VALUES (982,347,'enjolee','使用心得：洗完有绷紧感，有脱皮现象',3,0,'2012-03-01 16:04:58');
INSERT INTO `goods_comment` VALUES (983,348,'131974834**','使用心得：货到了，品貌不好。提问客服长时间不回复苏',5,0,'2012-03-01 16:04:58');
INSERT INTO `goods_comment` VALUES (984,348,'ydt笑笑','使用心得：很好，很喜欢',5,0,'2012-03-01 16:04:58');
INSERT INTO `goods_comment` VALUES (985,349,'guninghaiyue','使用心得：还不错。',4,0,'2012-03-01 16:04:59');
INSERT INTO `goods_comment` VALUES (986,349,'琴瘦97','优点：很干净 使用心得：新活再生系列配套使用.. 很好..',5,0,'2012-03-01 16:04:59');
INSERT INTO `goods_comment` VALUES (987,349,'幸福的筹码M','优点：经济实惠，性价比超高 使用心得：新活系列的我觉得都不错。这一款我用了好几年了，非常好！又不贵1',5,0,'2012-03-01 16:04:59');
/*!40000 ALTER TABLE `goods_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods_efficacy
#

DROP TABLE IF EXISTS `goods_efficacy`;
CREATE TABLE `goods_efficacy` (
  `efficacy_id` int(10) unsigned NOT NULL COMMENT '功效ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table goods_efficacy
#

LOCK TABLES `goods_efficacy` WRITE;
/*!40000 ALTER TABLE `goods_efficacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_efficacy` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods_map
#

DROP TABLE IF EXISTS `goods_map`;
CREATE TABLE `goods_map` (
  `map_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_real_id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table goods_map
#

LOCK TABLES `goods_map` WRITE;
/*!40000 ALTER TABLE `goods_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_map` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods_real
#

DROP TABLE IF EXISTS `goods_real`;
CREATE TABLE `goods_real` (
  `goods_real_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `provider_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `brand_name` varchar(32) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_thumb` text NOT NULL COMMENT '商品缩略图',
  `goods_images` text NOT NULL COMMENT '商品细节图',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `goods_url` varchar(255) NOT NULL COMMENT '来源网站中商品的url',
  `goods_orig_pid` varchar(15) NOT NULL COMMENT '来源网站中商品编号',
  `goods_score` float NOT NULL COMMENT '商品评分',
  `goods_forskin` set('干性','油性','混合性','中性','敏感性') NOT NULL DEFAULT '' COMMENT '商品适用的肤质',
  `goods_notforskin` set('干性','油性','混合性','中性','敏感性') DEFAULT '' COMMENT '商品不适合的肤质',
  `goods_noticeforskin` set('干性','油性','混合性','中性','敏感性') DEFAULT '' COMMENT '商品对应肤质用法需要注意的',
  `goods_age` set('20岁以下','20-25岁','26-30岁','30-35岁','36-40岁','40岁以上') NOT NULL COMMENT '商品适用的年龄范围',
  `goods_description` text NOT NULL COMMENT '商品的特点及成分',
  `goods_specification` text NOT NULL COMMENT '商品的用法',
  `goods_count` int(10) unsigned NOT NULL COMMENT '商品库存',
  `goods_is_new` tinyint(3) unsigned NOT NULL COMMENT '商品是否新品',
  `goods_is_hot` tinyint(3) unsigned NOT NULL COMMENT '商品是否热销',
  `goods_buy_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品销量',
  `goods_view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品浏览量',
  `goods_add_time` datetime NOT NULL COMMENT '商品的添加时间',
  `goods_last_update` datetime NOT NULL COMMENT '商品最后更新的时间',
  `goods_status` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '商品的状态，0表示不可用，3表示新添加待审核，6表示已审核',
  `goods_rank` int(10) NOT NULL COMMENT '商品的排序值，越大的优先级越高',
  PRIMARY KEY (`goods_real_id`)
) ENGINE=MyISAM AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table goods_real
#

LOCK TABLES `goods_real` WRITE;
/*!40000 ALTER TABLE `goods_real` DISABLE KEYS */;
INSERT INTO `goods_real` VALUES (1,1,0,0,'AVON 雅芳','护肤','AVON雅芳卸妆乳','http://photo.no5.com.cn/product/mphoto/200807181047471061848116.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200807181047471061848116.jpg\";}',39,'http://www.no5.com.cn/goods/17616.html','17616',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含丰富天然植物营养成分：小麦胚芽油、鳄梨油和芦荟萃取精华，温和卸除面部彩妆。  使用方法：\r\n取适量于面部轻轻推匀，卸除彩妆，用纸巾拭净或以温水洗净。','',0,0,0,0,0,'2012-03-01 12:20:16','2012-03-01 12:20:16',3,0);
INSERT INTO `goods_real` VALUES (2,1,0,0,'BIODERMA 贝德玛','护肤','BIODERMA 法国贝德玛舒妍洁肤液(女人我最大推荐)(64579)','http://photo.no5.com.cn/product/mphoto/17630_M_101206103203_39815193.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/17630_M_101206103203_39815193.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/17630_M_101206103227_54817024.jpg\";}',175,'http://www.no5.com.cn/goods/17630.html','17630',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','敏感、脆弱肤质首选卸妆、清洁最佳护理产品。专利独特\r\nMicelle新科技，四效合一，可当清洁、卸妆、化妆水及保湿乳液使用，不必再用水洗。能有效卸除脸部和眼唇的彩妆及不洁物，甚至是防水彩妆，提升皮肤的舒适度，改善紧绷不适感并使肌肤柔嫩，使用后倍感清爽舒适，成份温和能适用于脆弱的眼部肌肤。不含香料、防腐剂，具舒缓、安抚等功效。欧洲当红畅销品。适用范围：敏感、脆弱及一般肤质等均可使用。使用方式 ：将洁肤液倒取至化妆棉上，轻轻卸除眼与脸的彩妆污物，必要时可重复使用至完全洁净为止。再次使用即作为化妆水及保湿乳液功能。','',0,0,0,0,0,'2012-03-01 13:39:46','2012-03-01 13:39:46',3,0);
INSERT INTO `goods_real` VALUES (3,1,0,0,'L’Occitane 欧舒丹','护肤','L’Occitane欧舒丹乳木果卸妆保湿水(14789)特价！','http://photo.no5.com.cn/product/mphoto/23934_M_111010153245_34195686.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23934_M_111010153245_34195686.jpg\";}',75,'http://www.no5.com.cn/goods/23934.html','23934',0,'','','','','不含酒精的温和卸妆水，一次完成洁净及爽肤程序。适合面部、眼部及唇部肌肤使用，专为干性肌肤而设，特e呵护脆弱的眼部肌肤。\r\n温和性质经皮肤科及眼科专家测试。\r\n每日早晚以化妆棉轻抹肌肤，或直接喷在脸上，令肌肤恢复生气。','',0,0,0,0,0,'2012-03-01 13:51:19','2012-03-01 13:51:19',3,0);
INSERT INTO `goods_real` VALUES (4,1,0,0,'Anna Sui 安娜苏','护肤','Anna Sui安娜苏魔幻眼部卸妆液(10280)','http://photo.no5.com.cn/product/mphoto/20101106182412581555301.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101106182412581555301.jpg\";}',110,'http://www.no5.com.cn/goods/22516.html','22516',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','双层的卸妆液能轻柔卸去防水型睫毛膏、浓密层次的睫毛妆以及其他繁复的眼部妆容，并且不伤害小魔女柔嫩娇弱的眼部肌肤。 上层：亲脂性配方，迅速和彩妆中的油性成分融合并柔和卸除。\r\n下层：水性配方，防止皮肤敏感。富含大量柔肤成分令卸妆后的肌肤柔软，光滑不干燥。 使用方法：\r\n使用前摇匀 让上下层液体充分混合。\r\n在化妆棉上倒上适量卸妆液 轻按于眼部数秒后擦去彩妆。','',0,0,0,0,0,'2012-03-01 13:54:25','2012-03-01 13:54:25',3,0);
INSERT INTO `goods_real` VALUES (5,1,0,0,'Anna Sui 安娜苏','护肤','Anna Sui安娜苏水娃娃清爽紧肤水','http://photo.no5.com.cn/product/mphoto/20101106182259581555301.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101106182259581555301.jpg\";}',175,'http://www.no5.com.cn/goods/22513.html','22513',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','能维持肌肤表面的湿润，并留下柔顺、有弹性的质感，以及健康的光译！　液状的质地，能够再次清洁柔软肌肤和平衡肌肤PH质，立即提供肌肤表皮层大量滋润保湿的成分，创造出水嫩柔细，平滑紧致的好脸色。　滋润、丰富、温和，能够快速渗入角质层的每个角落，有效地滋润肌肤恢复表层层肌肤的最佳状态。全新的天然植物精华配方，温和不伤肌肤。使用建议：\r\n清洁肌肤后，取少量保湿液于掌心或化妆棉上，然后轻拍并稍许按摩脸部肌肤。','',0,0,0,0,0,'2012-03-01 13:57:40','2012-03-01 13:57:40',3,0);
INSERT INTO `goods_real` VALUES (6,1,0,0,'Shu Uemura 植村秀','明星推荐','Shu uemura植村秀汉方尊享洁颜油(35265大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/2009110417564395804965.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009110417564395804965.jpg\";}',520,'http://www.no5.com.cn/goods/16824.html','16824',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','植村秀汉方尊享洁颜油带着洋甘菊淡淡的芬芳，瓶身有磨砂的感觉，柔和轻巧，充分乳化后，对于面部彩妆的卸除非常温和和干净。 植村秀洁颜油系列都采用精选植物油进行配方。红花油富含亚油酸，为肌肤代来营养并帮助细胞更新。霍霍巴油含有天然维他命E，令肌肤滋润与柔软，并有助于保持肌肤弹性。鳄梨油含有大量的维他命，矿物质，蛋白质与卵磷脂。玉米油是肌肤良好的保湿剂，帮助肌肤保持天然水润。 根据肌肤的不同需要，植村秀有四款不同的洁颜油可以选择。但对于女性生理期，在某些压力特别大，频繁出差的时期，在肌肤感觉干燥与粗糙的时刻，除了赶紧做一个保养面膜外，从清洁开始的保养程序更需要一个特别的清洁产品。 汉方尊享洁颜油在传统的配方中特别添加了甘草与氨基酸，并带有洋甘菊的香氛，针对肌肤有问题的日子，带来更舒缓与镇静的洁颜新感受。 甘草历史悠久，性平，味甘，在中医上用于补脾益气，滋咳润肺，缓急解毒，调和百药，亦在西医临床上主要作为缓和剂。 在植村秀汉方尊享洁颜油中，甘草发挥了其特性，帮助缓和与镇静肌肤，从而修复肌肤自身能量，达到肌肤的自我完善于更新。洋甘菊被称为“月亮之花”，有清凉与镇定的作用。在医学上，洋甘菊的镇定、舒缓作用使得它成为很好的止痛成分。在植村秀汉方尊享洁颜油中，洋甘菊带来淡雅的芬芳，这样的芬芳能安神，静心，在芳香中帮助镇定与舒缓肌肤。这种芬芳还来自少量的熏衣草和香柠檬，恬淡、纯净，不张扬。 而同时，在东京实验室的研究于帮助下，在这款全新的汉方尊享洁颜油中还加入了特别研发的氨基酸。氨基酸是保湿因子NMF的重要组成部分，为肌肤带来额外的保湿与润泽，使肌肤变得更饱满，抵御外界侵害。因为配方独特，植村秀汉方尊享洁颜油有着温柔细腻的触感，洗后肌肤如轻薄的羊绒拂过面庞，温婉柔软，轻盈而又非常滋润。 温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。\r\n&nbsp;','',0,0,0,0,0,'2012-03-01 14:57:22','2012-03-01 14:57:22',3,0);
INSERT INTO `goods_real` VALUES (7,1,0,0,'AVON 雅芳','护肤','AVON雅芳卸妆油','http://photo.no5.com.cn/product/mphoto/200807181054492857443.jpg','a:1:{i:0;s:64:\"http://photo.no5.com.cn/product/mphoto/200807181054492857443.jpg\";}',39,'http://www.no5.com.cn/goods/17615.html','17615',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','来自日本配方的高品质卸妆油，含鳄梨油、葵花子油和芝麻精油等成分,高效卸除持久型彩妆或浓妆并同时滋润肌肤。任何肤质均适用。  使用方法：\r\n取适量于面部轻轻推匀，将色彩卸下，再以清水拍湿使卸妆油充分乳化，将脏污色彩溶于其中，以清水冲净后，再用洁容霜清洗干净。','',0,0,0,0,0,'2012-03-01 15:22:13','2012-03-01 15:22:13',3,0);
INSERT INTO `goods_real` VALUES (8,1,0,0,'BIODERMA 贝德玛','护肤','BIODERMA 法国贝德玛净妍洁肤液(64585)','http://photo.no5.com.cn/product/mphoto/20080722134010726645834.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080722134010726645834.jpg\";}',175,'http://www.no5.com.cn/goods/17629.html','17629',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','-无皂碱、PH5.5温和不刺激,彻底卸除面部,眼部妆容；\r\n-清爽、不需水洗，清洁杀菌不刺激，清洁卸妆无负担；\r\n-最佳舒缓配方,不刺激皮肤；\r\n-清洁、卸妆、化妆水、保湿乳液四效合一。适用肌肤：混合性、油性肤质适用。使用方法：\r\n-将洁肤液倒取于化妆棉上，轻轻卸除眼与脸的彩妆污物、脸上油脂，重复至完全洁净为止。\r\n-无须用清水洗净(眼部除外)，只需用毛巾轻轻拍干面部即可。不习惯免洗水洗也可以。\r\n-平时可以当作化妆水使用，沾适量于化妆棉上，加强肌肤的保湿与二次清洁。','',0,0,0,0,0,'2012-03-01 15:22:32','2012-03-01 15:22:32',3,0);
INSERT INTO `goods_real` VALUES (9,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂恋爱魔镜魔法卸妆眼蜜(50105)','http://photo.no5.com.cn/product/mphoto/22792_M_101216133123_17751900.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22792_M_101216133123_17751900.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22792_M_101216141322_33250862.jpg\";}',89,'http://www.no5.com.cn/goods/22792.html','22792',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','现在的女生总是爱画上超级浓睫的完美眼妆，闪耀出楚楚动人的魅惑电眼。但是不晕染、不脱妆、防油防水的眼妆，总是很难轻松又快速的卸干净。魔法卸妆眼蜜，油质凝胶型态首创开架先例，溶解清洁油的洁净配方，可以快速溶解超难卸的防水型睫毛膏或是眼线，连不易卸除的浓密纤维，也能瞬间脱落，轻松迅速将难卸的浓密眼妆，卸的干干净净。此外胶状的质地，不论用于修饰画失败的眼线、沾到眼皮的睫毛膏，或是睫毛膏晕染的熊猫眼，都可以非常轻松的局部修正，不需要清洗。只要用手指或棉花棒沾取少量于想修正的部份，即可轻松卸除超干净。更添加维他命E诱导体和澳洲坚果油，卸妆同时也能温和滋润眼部肌肤，保护眼睛周围的细致敏感肌肤。','',0,0,0,0,0,'2012-03-01 15:22:33','2012-03-01 15:22:33',3,0);
INSERT INTO `goods_real` VALUES (10,1,0,0,'Kracie 葵缇亚','护肤','Kracie 葵缇亚蜜桃西柚清爽透亮卸妆液(送化妆棉68464)(原嘉娜宝)','http://photo.no5.com.cn/product/mphoto/22970_M_110131105433_54159218.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22970_M_110131105433_54159218.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22970_M_110131105503_17953774.jpg\";}',85,'http://www.no5.com.cn/goods/22970.html','22970',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','内含水溶及油溶份子可全面洗净肌肤毛孔内外污垢，再加上青瓜植物精华，用后绝不紧绷。能不费力气地将厚厚的防晒乳和睫毛膏等彩妆卸的很干净，并且温和不刺激。成份简单，不含香料，敏感肌肤亦可使用。不用水洗，清洁卸妆无负担，具镇静、舒缓、退红等功效；亦可当化妆水使用。使用方法：\r\n将洁肤液倒取于化妆棉上，轻轻卸除眼与脸的彩妆污物、脸上油脂，重复至完全洁净为止。平时可以当作化妆水使用，沾适量于化妆棉上，加强肌肤的保湿与二次清洁即可。','',0,0,0,0,0,'2012-03-01 15:23:21','2012-03-01 15:23:21',3,0);
INSERT INTO `goods_real` VALUES (11,1,0,0,'DHC 蝶翠诗','护肤','DHC橄榄深层卸妆油','http://photo.no5.com.cn/product/mphoto/23271_M_110530155426_85179115.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23271_M_110530155426_85179115.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23271_M_110530155520_52709022.jpg\";}',68,'http://www.no5.com.cn/goods/23271.html','23271',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深入毛孔、彻底去除污垢的植物性天然油 \r\n洁净无垢的肌肤，是保持肌肤光泽、塑造美丽彩妆的基础。以优质橄榄精华油为主要成分的DHC深层卸妆油虽是“油类”，但又具有水溶性，可用清水完全洗净，是一种划时代的卸妆品。可迅速溶解难以脱落的彩妆，并渗透到毛孔内，让堆积的不洁皮脂、老化角质自然浮出，彻底清除毛孔内污垢。污垢和卸妆油混合之后，可用清水彻底冲净，清爽不油腻。内含的植物成分温和无刺激，是超人气卸妆品。不化妆的人士也可安心使用，建议一周使用1-2次，以画圈按摩的方式去除肌肤污垢、鼻部黑头、老化角质等。 \r\n&nbsp;\r\nDHC的独到之处&nbsp;&nbsp;&nbsp; \r\n与彩妆混合时为亲油性，与水接触后即转变为亲水性，虽为油类却可以用水冲洗干净。保管时请注意瓶内不要进水。 \r\n&nbsp;\r\n深层卸妆油除了以与皮脂构造相似的橄榄精华油为主要成分之外，还含有被称为“天然抗生物”的迷迭香、甘草诱导体以及维生素E，是纯植物性卸妆油。在给予肌肤温柔呵护的同时，使造成肌肤粗糙的角栓及毛孔中的黑头很容易地自然浮出，达到彻底清洁的效果。 按摩效果可使肌肤变得水润、透明。 \r\n&nbsp;\r\n使用方法&nbsp;&nbsp;&nbsp; \r\n1.取适量于干燥的掌心。用掌心温度使其温热，涂抹于面部并轻轻按摩，使卸妆油与彩妆污垢充分融合。最后卸除重点彩妆，可避免彩妆污垢扩散。 \r\n2.20-30秒后，用清水或温水冲洗干净。 \r\n3.之后，请务必用洁面用品洗脸。油性/青春痘肌肤请使用纯榄芦荟皂，敏感性肌肤请使用纯榄修护皂，其他肤质请使用纯榄滋养。','',0,0,0,0,0,'2012-03-01 15:23:22','2012-03-01 15:23:22',3,0);
INSERT INTO `goods_real` VALUES (12,1,0,0,'UZISE 柚子舍','护肤','UZISE柚子舍柚枳卸洗凝胶','http://photo.no5.com.cn/product/mphoto/23477_M_110721164457_89988380.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23477_M_110721164457_89988380.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23477_M_110721164518_28173805.jpg\";}',128,'http://www.no5.com.cn/goods/23477.html','23477',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n颠覆卸洗护肤新领域，柚子舍高科技纳米植物微囊包裹技术，特别添加柚子枳实萃取精华，通过超强亲肤性的植物凝胶吸附的方法，快速渗透肌肤底层，把脸上的彩妆和毛孔中的污垢深层代谢并在皮肤正常“呼吸”中清洁干净，自然更新角质层皮垢代谢新环境。产品特点： \r\n称“皮肤的吸尘器”1分钟黑头及污垢浮出、3分钟毛孔收细肤色变亮。产品成分： \r\n内含枳实、植物胶原、葡萄柚精油、迷迭香精油、枸橼酸、阿拉伯胶树胶、氨基酸保湿剂、维生素原B5、椰油基两性醋酸钠。适用皮肤： \r\n化妆、角质层厚、毛孔粗大、黑头及多油的皮肤都适用。','',0,0,0,0,0,'2012-03-01 15:23:33','2012-03-01 15:23:33',3,0);
INSERT INTO `goods_real` VALUES (13,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳海洋面部绿洲洁面卸妆水(105)','http://photo.no5.com.cn/product/mphoto/23599_M_110822155938_53086677.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23599_M_110822155938_53086677.jpg\";}',215,'http://www.no5.com.cn/goods/23599.html','23599',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','温和清除面部彩妆和污垢，令肌肤清爽、柔滑、水润。成分：\r\n水、癸基葡糖苷、月桂醇聚醚磺基琥珀酸酯二钠、聚天冬氨酸氨、业有限及苹果氨基酸类钠、裙带菜提取物、海茴香提取物、石莼提取物、熏衣草花提取物、卵磷脂、尿囊素、抗坏血酸磷酸酯镁、视黄醇棕榈酸酯、生育酚乙酸酯、海盐、PEG-7 甘油椰油酸酯、椰油酰谷氨酸钠等使用方法：\r\n可用于日常的卸妆和洁面。取出适量，于干燥的面部打圈按摩，之后用清水洗净。','',0,0,0,0,0,'2012-03-01 15:23:34','2012-03-01 15:23:34',3,0);
INSERT INTO `goods_real` VALUES (14,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝深层洁肤霜(15833)','http://photo.no5.com.cn/product/mphoto/23813_M_110930113657_22702614.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23813_M_110930113657_22702614.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23813_M_110930113710_98057838.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23813_M_110930113722_26223732.jpg\";}',119,'http://www.no5.com.cn/goods/23813.html','23813',0,'','','','','产品介绍滋润光滑的洁肤霜如融化般迅速脱落并浮起化妆品。\r\n使用感柔和光滑，不易引起摩擦，使容易干燥、粗糙的肌肤保持滋润的同时，彻底清除毛孔和肌理中的污垢。\r\n不粘腻，洗后肌肤润泽柔滑。\r\n严格选取优质而低刺激性的原料，不给柔嫩的肌肤添加任何负担使用方法取葡萄粒大小的量于干爽的掌心，用指腹轻柔细致地将其与彩妆和皮脂融合。','',0,0,0,0,0,'2012-03-01 15:23:36','2012-03-01 15:23:36',3,0);
INSERT INTO `goods_real` VALUES (15,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝深层洁肤油(15836)','http://photo.no5.com.cn/product/mphoto/23821_M_110930134742_35085579.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23821_M_110930134742_35085579.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23821_M_110930134752_25640083.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23821_M_110930134807_65840431.jpg\";}',119,'http://www.no5.com.cn/goods/23821.html','23821',0,'','','','','产品介绍不油腻、清爽的洁肤油迅速融解并浮起渗入到肌理及毛孔中的化妆品。配合精制提炼的油质与紫苏精华等保湿成分，在保持肌肤滋润度的将化妆品及附着在毛孔、肌肤纹理中的污垢迅速而彻底的清除。易于冲洗，洗后肌肤毛孔不粗糙、无黑头，触感光滑清爽。严格选取优质而低刺激性的原料，不给柔嫩的肌肤添加任何负担。使用方法取按压喷嘴4～5次量于干爽的掌心，用指腹轻柔细致地将其与彩妆和皮脂融合。','',0,0,0,0,0,'2012-03-01 15:23:37','2012-03-01 15:23:37',3,0);
INSERT INTO `goods_real` VALUES (16,1,0,0,'L’Occitane 欧舒丹','护肤','L\'Occitane欧舒丹乳木果卸妆保湿水(147764)','http://photo.no5.com.cn/product/mphoto/23948_M_111010162836_76071449.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23948_M_111010162836_76071449.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23948_M_111010162849_56164223.jpg\";}',170,'http://www.no5.com.cn/goods/23948.html','23948',0,'','','','','不含酒精的温和卸妆水，一次完成洁净及爽肤程序。\r\n适合面部、眼部及唇部肌肤使用，专为干性肌肤而设，特e呵护脆弱的眼部肌肤。\r\n温和性质经皮肤科及眼科专家测试。每日早晚以化妆棉轻抹肌肤，或直接喷在脸上，令肌肤恢复生气。','',0,0,0,0,0,'2012-03-01 15:23:38','2012-03-01 15:23:38',3,0);
INSERT INTO `goods_real` VALUES (17,1,0,0,'L’Occitane 欧舒丹','护肤','L\'Occitane欧舒丹乳木果舒润卸妆洁面乳(14765)','http://photo.no5.com.cn/product/mphoto/23952_M_111010163434_46520973.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23952_M_111010163434_46520973.jpg\";}',162,'http://www.no5.com.cn/goods/23952.html','23952',0,'','','','','丝柔质地能轻易滑上肌肤，帮助带走化妆品及污垢，同时温和洁净调理肌肤，无残余配方，防止硬水刺激，令肌肤柔软、亮采、舒适。','',0,0,0,0,0,'2012-03-01 15:23:39','2012-03-01 15:23:39',3,0);
INSERT INTO `goods_real` VALUES (18,1,0,0,'L’Occitane 欧舒丹','护肤','L\'Occitane欧舒丹蜡菊卸妆洁面乳(11506)','http://photo.no5.com.cn/product/mphoto/23956_M_111010164015_24313484.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23956_M_111010164015_24313484.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23956_M_111010164043_99437995.jpg\";}',238,'http://www.no5.com.cn/goods/23956.html','23956',0,'','','','','抗衰老功效的洁面乳：可干湿两用。柔软幼滑的洁面乳，与水混合后形成细致柔润的泡沫，蕴含蜡菊花水，有效清除眼部、脸部及唇部的化妆及杂质，带来第一重抗衰老功效。&nbsp; 蜡菊：地中海传说之花不易凋谢的花之秘密......蜡菊 蔓生于地中海沿岸，喜沙质土壤，每年六月开花。它的拉丁学名是Helichrysum，解作「金色太阳」，因其G丽的金黄色簇生花朵形如太阳而得名。蜡菊 至今仍以人手采摘，延续优良的传统收割方法。 珍贵罕有的花朵蜡菊 出名持久耐开，花朵不易凋谢，即使摘下来之后，花瓣亦不易脱落。利用蒸馏处理方法，将蜡菊 提炼出：一种金黄色、带迷人幽香的有机精华油，蜡菊有益成份尽在这种浓缩液之中；一种有机香花水，浓度较低，故此特别适合敏感肌肤。蒸馏法能提炼出植物中的精华，又可保存蜡菊花的细致香味。','',0,0,0,0,0,'2012-03-01 15:23:40','2012-03-01 15:23:40',3,0);
INSERT INTO `goods_real` VALUES (19,1,0,0,'L’Occitane 欧舒丹','护肤','L\'Occitane欧舒丹蜡菊眼部卸妆液(11475)','http://photo.no5.com.cn/product/mphoto/23958_M_111011181026_29720131.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23958_M_111011181026_29720131.jpg\";}',178,'http://www.no5.com.cn/goods/23958.html','23958',0,'','','','','质感清爽的两用配方，温和而有效地卸除普通及防水眼妆。\r\n经眼科医生测试，不含香氛，蕴含具舒缓作用的香花水，令眼部肌肤舒适清新。','',0,0,0,0,0,'2012-03-01 15:23:40','2012-03-01 15:23:40',3,0);
INSERT INTO `goods_real` VALUES (20,1,0,0,'Clinique 倩碧','超值小样','Clinique 倩碧眼部/唇部卸妆液','http://photo.no5.com.cn/product/mphoto/24096_M_111109135713_16797463.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24096_M_111109135713_16797463.jpg\";}',39,'http://www.no5.com.cn/goods/24096.html','24096',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','祛除眼睑、眼睫毛和唇部彩妆。独特双效配方，能够减轻紧绷感，加速祛除眼部彩妆、睫毛膏和唇膏。通过眼科医生测试。适合隐形眼睛佩带者使用。\r\n高效迅速清洁祛除敏感眼部和唇部彩妆。彻底祛除眼部彩妆（包括牢固的防水型彩妆），不会松弛眼部肌肤。适合隐形眼睛佩带者使用。通过眼科医生测试。使用方法：用前摇晃。倒少许于棉球之上，轻轻擦拭眼部和唇部。','',0,0,0,0,0,'2012-03-01 15:23:41','2012-03-01 15:23:41',3,0);
INSERT INTO `goods_real` VALUES (21,1,0,0,'Clinique 倩碧','超值小样','Clinique 倩碧水洗卸妆泡沫霜(2个装)','http://photo.no5.com.cn/product/mphoto/24098_M_111109135804_59995704.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24098_M_111109135804_59995704.jpg\";}',55,'http://www.no5.com.cn/goods/24098.html','24098',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','浓缩泡沫的柔润性卸妆品，中性及混合性肌肤适用，能温和快捷地清除持久的妆容。\r\n在开始清洁步骤之前有效清除彩妆和防晒品。令肌肤倍觉滋润，清洁和清新。\r\n令倩碧洁肤皂更有效发挥作用，令肌肤倍觉滋润清洁和清新。含有甘菊精华，效果持久。使用方法：弄湿脸部和手，挤适量于手掌中，揉搓使之成泡沫状，在脸部轻轻按摩，然后用清水洗净。接着使用护肤三步骤。','',0,0,0,0,0,'2012-03-01 15:23:42','2012-03-01 15:23:42',3,0);
INSERT INTO `goods_real` VALUES (22,1,0,0,'Lancome 兰蔻','超值小样','Lancome 兰蔻清滢洁肤水','http://photo.no5.com.cn/product/mphoto/24125_M_111109141002_42545296.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24125_M_111109141002_42545296.jpg\";}',58,'http://www.no5.com.cn/goods/24125.html','24125',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含法国玫瑰精华，与肌肤完美接合，温和卸除彩妆，洁肤爽肤一步到位，具有神奇效果。 质地清新，蕴含法国蔷薇花提取物。帮助深层清洁肌肤，温和去除彩妆，使肌肤更加均匀。有光泽，同时带来清爽感受。适合所有肌肤类型。用法：\r\n用于脸部，眼部，唇部的清洁及滋润，使用后用纸巾轻轻拭去。 &nbsp;','',0,0,0,0,0,'2012-03-01 15:23:43','2012-03-01 15:23:43',3,0);
INSERT INTO `goods_real` VALUES (23,1,0,0,'Nuxe 欧树','护肤','Nuxe欧树三色玫瑰净颜水(4807596)','http://photo.no5.com.cn/product/mphoto/24241_M_111118144311_10242745.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24241_M_111118144311_10242745.jpg\";}',108,'http://www.no5.com.cn/goods/24241.html','24241',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','1.高耐受性：PH接近生理水平。\r\n2.不含酒精与香料，适用于隐形眼镜使用者。\r\n3.可清除防水性彩妆。&nbsp;&nbsp; 成分及功效：\r\n1.32%花水、玫瑰、矢车菊、酸橙花：镇静柔润肌肤\r\n2.1%绿茶提取物：抗氧化\r\n3.超柔和的表面活性剂：清除全部化妆及不洁痕迹，包括防水产品&nbsp;&nbsp; \r\n&nbsp;\r\n使用方法：\r\n用化妆棉均匀涂在面部和颈部，不需清洗。&nbsp;&nbsp; \r\n&nbsp;\r\n效果及感受：\r\n即使是防水性化妆品也可以完全卸除，肌肤得到完美洁净和调理。','',0,0,0,0,0,'2012-03-01 15:23:44','2012-03-01 15:23:44',3,0);
INSERT INTO `goods_real` VALUES (24,1,0,0,'Nuxe 欧树','护肤','Nuxe欧树三色玫瑰净颜水(4807573)','http://photo.no5.com.cn/product/mphoto/24242_M_111118144328_79423652.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24242_M_111118144328_79423652.jpg\";}',155,'http://www.no5.com.cn/goods/24242.html','24242',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','1.高耐受性：PH接近生理水平。\r\n2.不含酒精与香料，适用于隐形眼镜使用者。\r\n3.可清除防水性彩妆。&nbsp;&nbsp; 成分及功效：\r\n1.32%花水、玫瑰、矢车菊、酸橙花：镇静柔润肌肤\r\n2.1%绿茶提取物：抗氧化\r\n3.超柔和的表面活性剂：清除全部化妆及不洁痕迹，包括防水产品&nbsp;&nbsp; \r\n&nbsp;\r\n使用方法：\r\n用化妆棉均匀涂在面部和颈部，不需清洗。&nbsp;&nbsp; \r\n&nbsp;\r\n效果及感受：\r\n即使是防水性化妆品也可以完全卸除，肌肤得到完美洁净和调理。','',0,0,0,0,0,'2012-03-01 15:23:45','2012-03-01 15:23:45',3,0);
INSERT INTO `goods_real` VALUES (25,1,0,0,'Anna Sui 安娜苏','护肤','Anna Sui安娜苏水精灵洁颜油(11203)','http://photo.no5.com.cn/product/mphoto/24255_M_111116115700_45480019.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24255_M_111116115700_45480019.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24255_M_111121162006_97942481.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24255_M_111121162405_19885994.jpg\";}',264,'http://www.no5.com.cn/goods/24255.html','24255',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','水精灵洁面油带有玫瑰花香氛而滋润的洁面油，有效及快速地去除脸上的妆容，能唤醒肌肤之余，更留下柔滑的完美触感。能温和清除污垢和，彩妆包括睫毛膏，穿透及深入毛孔，将化妆品完全卸除，温和去除老废角质，肌肤更清新洁净。带给肌肤清爽与净洁的感觉。<?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" />成分玫瑰果油、野玫瑰精华、葡萄籽油、水蜜桃籽油。\r\n使用方法：\r\n取适量洁肤油于干爽的掌心上，清除彩妆和污垢后，再以冷水或温水彻底洗净。&nbsp;','',0,0,0,0,0,'2012-03-01 15:23:46','2012-03-01 15:23:46',3,0);
INSERT INTO `goods_real` VALUES (26,1,0,0,'Benefit 贝玲妃','护肤','Benefit 贝玲妃快速卸妆液(03820)','http://photo.no5.com.cn/product/mphoto/24345_M_111129092712_56956611.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24345_M_111129092712_56956611.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24345_M_111129092725_92524848.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24345_M_111205091913_28269936.jpg\";}',161,'http://www.no5.com.cn/goods/24345.html','24345',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','无油的卸妆水，能彻底清除眼部彩妆，即使是持久和防水化妆品亦能轻松卸除；\r\n无油保湿配方，卸妆同时再造清新柔嫩感觉，令肌肤洁净水润；\r\n无需冲洗的特殊配方，温和无刺激。使用方法：\r\n将沾有快速卸妆液的化妆棉在脸上彩妆部分轻敷半分钟，轻轻擦拭后用清水洗净即可。','',0,0,0,0,0,'2012-03-01 15:23:46','2012-03-01 15:23:46',3,0);
INSERT INTO `goods_real` VALUES (27,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗即时眼部卸妆液(20061)','http://photo.no5.com.cn/product/mphoto/24398_M_111206110237_60621925.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24398_M_111206110237_60621925.jpg\";}',55,'http://www.no5.com.cn/goods/24398.html','24398',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','去除浓妆或防水妆容，不会留下油性残质。\r\n软化、舒缓肌肤，并补充水分。使皮肤获得清新舒适之感。\r\n保护睫毛。产品成份：\r\n挥发性精油。\r\n矢车菊与玫瑰水。\r\n大豆蛋白。使用方法：\r\n使用前充分摇匀，使两种成分均匀混合。使用化妆棉浸醮卸妆液，去除眼部化妆痕迹。\r\n要点：两只眼睛各使用一块化妆棉。','',0,0,0,0,0,'2012-03-01 15:23:47','2012-03-01 15:23:47',3,0);
INSERT INTO `goods_real` VALUES (28,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀全新均效洁颜油(保湿型37169)','http://photo.no5.com.cn/product/mphoto/24494_M_111209111639_36197945.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24494_M_111209111639_36197945.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24494_M_111209111655_47629219.jpg\";}',145,'http://www.no5.com.cn/goods/24494.html','24494',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','全球热销40年的经典保湿型洁颜油。萃取自山茶花、金姜根的精华植物油份，强化保湿效能；在高效清洁的同时，引导出仿佛沐浴着朝露的花瓣般透明美肌。适用于任何肤质彻底清洁肌肤堵塞毛孔的污垢，柔和均衡肌肤的水油比例。效果：\r\n甘草精萃舒缓敏感肌肤。植物氨基酸混合物维持肌肤天然保护屏障，促进胶元蛋白生成。海洋深层水r肌肤伸层滋润，散发自然光泽。主要成分: \r\n&#8226; 山茶花精萃油\r\n&#8226; 金姜根萃取\r\n&#8226; 5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n&#8226; 海洋深层水使用方法：\r\n第一步，温和洁颜油卸妆，包括防水睫毛膏，同时温和洁净、滋润、镇定肌肤。 按下列简单步骤使用，植村秀洁颜油将达到更好的效果。 \r\n1.对着干燥的手心按压瓶口3~4次。 \r\n2.轻轻抹开，涂至干燥的脸部肌肤。 \r\n3.使用少量温水帮助乳化。 (洁颜油将变成乳白色) \r\n4.用温水冲洗干净。 \r\n5.随后配合使用植村秀的化妆水和润肤霜。','',0,0,0,0,0,'2012-03-01 15:23:48','2012-03-01 15:23:48',3,0);
INSERT INTO `goods_real` VALUES (29,1,0,0,'Sisley 希思黎','护肤','Sisley 希思黎植物平衡洁肤乳(112200)','http://photo.no5.com.cn/product/mphoto/24508_M_111209113750_39176613.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24508_M_111209113750_39176613.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24508_M_111209113803_47180153.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24508_M_111209113816_78408790.jpg\";}',485,'http://www.no5.com.cn/goods/24508.html','24508',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','卸除彩妆及污垢&nbsp;&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp; \r\n产品功效： \r\n&#8226; 流畅质地瞬间营造舒适感受。\r\n&#8226; 彻底卸除所有彩妆、污物与多余皮脂，净化肌肤。\r\n&#8226; 令肌肤洁净柔软。 \r\n\r\n活性成分： \r\n&#8226; 鼠尾草 ：净化肌肤,均匀肤色 \r\n\r\n使用方法： \r\n用指尖涂抹在脸部和颈部，以打圈的方式轻柔按摩，充分溶解所有彩妆。\r\n用纸巾拭去，然后用温水洗净。\r\n眼唇卸妆液更适合卸除比较脆弱的眼唇部肌肤的彩妆。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 15:23:49','2012-03-01 15:23:49',3,0);
INSERT INTO `goods_real` VALUES (30,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀绿茶舒润洁颜油(限量版37670)','http://photo.no5.com.cn/product/mphoto/24515_M_111209093344_37170235.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24515_M_111209093344_37170235.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24515_M_111209093418_50529610.jpg\";}',525,'http://www.no5.com.cn/goods/24515.html','24515',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','“花蝶绮想”限量版绿茶洁颜油的纸盒包装及洁颜油瓶身布满了可人的水果、花朵、蝴蝶及丝带图案，充满着少女情怀。Lisa想象着这些花朵幻化成长发飘逸的女孩，而女孩身边的这些花朵、水果、蝴蝶及丝带随之偏偏舞动，以此来展现用完绿茶洁颜油清洁皮肤之后，那种迷人气味带来的愉悦。效果：\r\n茶多酚提取自绿茶；卓越的抗氧化性能。绿色/木质香味源自西瓜、茉莉花和檀香的舒缓香味。植物油包含荷荷芭油和坚果油，保湿、舒缓肌肤。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。\r\n[超凡净彻] 专利HPO洁颜系统\r\n极速包裹毛孔深处各种传统洁面产品无法祛除的顽固彩妆、脏污；一冲即净，深彻净透，绝无残留！\r\n[双倍抗氧] 绿茶×银杏配方\r\n2种矜贵植物精油，2倍于原配方的添加浓度，预防肌肤氧化，绝迹黯沉黄气！\r\n[温和舒润] 天然植物油分\r\n安全温和，不刺激肌肤；不引发粉刺；主要成分: \r\n・儿茶酚，含有从绿茶中萃取的具有抗氧化作用的活性成分\r\n・5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n・海洋深层水使用方法：\r\n卸妆、洁面合为一步的温和洁颜油，用于卸妆，包括卸除防水睫毛膏，同时清洁、滋润、镇定肌肤。 为达到最好的效果，使用植村秀洁颜油时，请遵照以下简单步骤： \r\n1.按压3~4次于干燥的手心。 \r\n2.在干燥的脸部肌肤轻轻推开。 \r\n3.用少量温水湿润肌肤，帮助乳化(洁颜油会变成乳白色) 。\r\n4.用温水冲洗干净。\r\n5.随后配合使用植村秀的化妆水和乳液。 \r\n\r\n温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。','',0,0,0,0,0,'2012-03-01 15:23:51','2012-03-01 15:23:51',3,0);
INSERT INTO `goods_real` VALUES (31,1,0,0,'Guerlain 娇兰','护肤','Guerlain 娇兰纯净奥秘莲花明采卸妆ㄠ(62722)','http://photo.no5.com.cn/product/mphoto/24537_M_111215095415_54606911.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24537_M_111215095415_54606911.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24537_M_111215095425_87488990.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24537_M_111215095437_77398048.jpg\";}',299,'http://www.no5.com.cn/goods/24537.html','24537',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','明采卸妆ㄠ的奇妙变化 \r\n纯净奥秘莲花洁肤系列的新明星产品隆重登场。明采卸妆ㄠ那精心研制的复合质地能通过连续的变化释放出强大的洁净力。通过三个步骤完成彻底的清洁： \r\n第一步 \r\n如同按摩霜那样一触即溶，明采卸妆ㄠ与肌肤融为一体，软化肌肤并带走杂质。 \r\n第二步 \r\n在按摩的作用下，明采卸妆ㄠ变成了如丝般细腻的洁肤油，对肌肤显现出绝妙的亲和力，溶解残留的污垢和彩妆。 \r\n第三步 \r\n遇水后，油体又变成了透明澄净的乳液并释放出核心活性成分：具有清洁、活化和明采功效的晶莹莲花复合配方，以及能保护皮脂膜的滋润保湿因子。','',0,0,0,0,0,'2012-03-01 15:23:52','2012-03-01 15:23:52',3,0);
INSERT INTO `goods_real` VALUES (32,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀绿茶舒润洁颜油','http://photo.no5.com.cn/product/mphoto/24586_M_111216135640_40271126.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24586_M_111216135640_40271126.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24586_M_111216135755_17578865.jpg\";}',35,'http://www.no5.com.cn/goods/24586.html','24586',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','“洁颜油之父”植村秀全新呈现兼具深彻洁净力与卓越抗氧化功效的洁颜新品，每日清洁，祛除各种令肌肤加速老化的顽固彩装，皮脂污垢，高效抗氧祛黄，守护青春光彩！效果：\r\n茶多酚提取自绿茶；卓越的抗氧化性能。绿色/木质香味源自西瓜、茉莉花和檀香的舒缓香味。植物油包含荷荷芭油和坚果油，保湿、舒缓肌肤。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。\r\n[超凡净彻] 专利HPO洁颜系统\r\n极速包裹毛孔深处各种传统洁面产品无法祛除的顽固彩妆、脏污；一冲即净，深彻净透，绝无残留！\r\n[双倍抗氧] 绿茶×银杏配方\r\n2种矜贵植物精油，2倍于原配方的添加浓度，预防肌肤氧化，绝迹黯沉黄气！\r\n[温和舒润] 天然植物油分\r\n安全温和，不刺激肌肤；不引发粉刺；主要成分: \r\n・儿茶酚，含有从绿茶中萃取的具有抗氧化作用的活性成分\r\n・5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n・海洋深层水使用方法：\r\n卸妆、洁面合为一步的温和洁颜油，用于卸妆，包括卸除防水睫毛膏，同时清洁、滋润、镇定肌肤。 为达到最好的效果，使用植村秀洁颜油时，请遵照以下简单步骤： \r\n1.按压3~4次于干燥的手心。 \r\n2.在干燥的脸部肌肤轻轻推开。 \r\n3.用少量温水湿润肌肤，帮助乳化(洁颜油会变成乳白色) 。\r\n4.用温水冲洗干净。\r\n5.随后配合使用植村秀的化妆水和乳液。','',0,0,0,0,0,'2012-03-01 15:33:44','2012-03-01 15:33:44',3,0);
INSERT INTO `goods_real` VALUES (33,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻清滢洁肤水(74228)','http://photo.no5.com.cn/product/mphoto/24639_M_120118092442_73029609.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24639_M_120118092442_73029609.jpg\";}',250,'http://www.no5.com.cn/goods/24639.html','24639',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含法国玫瑰精华，与肌肤完美接合，温和卸除彩妆，洁肤爽肤一步到位，具有神奇效果。 质地清新，蕴含法国蔷薇花提取物。帮助深层清洁肌肤，温和去除彩妆，使肌肤更加均匀。有光泽，同时带来清爽感受。适合所有肌肤类型。用法：\r\n用于脸部，眼部，唇部的清洁及滋润，使用后用纸巾轻轻拭去。','',0,0,0,0,0,'2012-03-01 15:33:45','2012-03-01 15:33:45',3,0);
INSERT INTO `goods_real` VALUES (34,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻清滢洁面卸妆油(74114)','http://photo.no5.com.cn/product/mphoto/24648_M_111212153850_64600349.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24648_M_111212153850_64600349.jpg\";}',296,'http://www.no5.com.cn/goods/24648.html','24648',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','瞬间深层去除各种类型的彩妆污垢，用后不感油腻。\r\n\r\n富含白莲与法国玫瑰精华，与肌肤很好接合，达到深层洁净的效果。\r\n\r\n对肌肤无刺激。\r\n使用方法：\r\n用于未沾水的脸部，加以按摩充分洁净肌肤，然后以温水洗净。避免接触眼睛。','',0,0,0,0,0,'2012-03-01 15:33:46','2012-03-01 15:33:46',3,0);
INSERT INTO `goods_real` VALUES (35,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗即时眼部卸妆液(2001)','http://photo.no5.com.cn/product/mphoto/24758_M_120113112631_61452766.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24758_M_120113112631_61452766.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24758_M_120113112656_27001015.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24758_M_120113112706_60459877.jpg\";}',208,'http://www.no5.com.cn/goods/24758.html','24758',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','针对浓艳，或防水性的眼部彩妆。\r\n极度温和，双重配方的眼部卸妆液，适合眼睛容易敏感，以及配戴隐形眼镜者使用，以确保眼周肌肤的年轻光彩。\r\n美容效益：\r\n清除所有的眼部彩妆，即使最浓艳与防水彩妆也不例外。\r\n- 润泽，舒缓与柔软眼脸肌肤。\r\n- 保护脆弱的睫毛。\r\n- 与泪液的酸碱值相同，不会引起刺痛感。使用说明\r\n每次使用前摇匀，以化妆棉沾取适量即时眼部卸妆露（Instant Eye Make-up Remover），温和地拂拭过眼睛周围。切勿过度用力，以免伤害脆弱的眼周肌肤。','',0,0,0,0,0,'2012-03-01 15:33:47','2012-03-01 15:33:47',3,0);
INSERT INTO `goods_real` VALUES (36,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻速洁眼部卸妆水','http://photo.no5.com.cn/product/mphoto/24830_M_120130174200_30538612.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24830_M_120130174200_30538612.jpg\";}',35,'http://www.no5.com.cn/goods/24830.html','24830',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','快速卸除一切彩妆，不会有黏腻感。\r\n能卸除所有的彩妆，包括防水性彩妆。敏感性眼睛或配戴隐形眼镜者均可使用。\r\n快速眼唇卸妆液的PH值与泪水相似，非常温和不刺激。特别适合戴隐形眼镜者使用，能迅速有效的卸除眼部及唇部彩妆，包括防水性彩妆。\r\n它含有挥发性油脂（不含酒精）和温和的清洁因子。','',0,0,0,0,0,'2012-03-01 15:33:47','2012-03-01 15:33:47',3,0);
INSERT INTO `goods_real` VALUES (37,1,0,0,'Sisley 希思黎','超值小样','Sisley 希思黎百合洁肤乳','http://photo.no5.com.cn/product/mphoto/24869_M_120131090227_29500404.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24869_M_120131090227_29500404.jpg\";}',49,'http://www.no5.com.cn/goods/24869.html','24869',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','卸妆，滋润及舒缓产品功效： \r\n从第一次使用开始：\r\n&#8226; 肌肤完美洁净清透（98%女士获此效果）。\r\n&#8226; 肤色光彩焕发 (95%女士获此效果)。\r\n&#8226; 肌肤回复清爽 (95%女士获此效果)，弹性 (99%女士获此效果)，柔软(98%女士获此效果)。\r\n&#8226; 令干性、极干性与敏感性肌肤感觉舒适(96%女士获此效果)和舒缓 (97%女士获此效果)。 活性成分： \r\n&#8226; 百合 ：保湿柔软\r\n&#8226; 锦葵 ：保湿柔肤\r\n&#8226; 菩提花 ：柔软、舒缓肌肤\r\n&#8226; 葵花 ：滋养柔肤，增添活力\r\n&#8226; 维生素E ：抵抗自由基\r\n&#8226; 橙花 ：舒缓镇静，柔润肌肤使用方法： \r\n将百合洁肤乳涂抹在脸部和颈部，以打圈的方式用指尖轻柔按摩，充分溶解彩妆。用纸巾擦去剩余洁面乳，然后配合使用花香化妆水。\r\n眼唇卸妆液更适合卸除比较脆弱的眼唇部肌肤的彩妆。* 100位女性于每天一次使用百合洁肤乳，连续使用三周。 \r\n&nbsp;','',0,0,0,0,0,'2012-03-01 15:33:48','2012-03-01 15:33:48',3,0);
INSERT INTO `goods_real` VALUES (38,1,0,0,'Sisley 希思黎','超值小样','Sisley 希思黎焕白洁肤乳','http://photo.no5.com.cn/product/mphoto/24870_M_120131090212_81213050.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24870_M_120131090212_81213050.jpg\";}',58,'http://www.no5.com.cn/goods/24870.html','24870',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','高效卸妆，匀亮肤色产品功效： \r\n质感宛如乳霜般轻盈细腻，能有效去除彩妆、杂质与多余皮脂，同时带给脸部清爽无油的舒适感受。\r\n&#8226; 抑制酪氨酸酶，有助于减少黑色素的生成。\r\n&#8226; 促进肌肤最表层对水分的吸收，保持水油平衡。\r\n&#8226; 加强肌肤的天然屏障功能。 \r\n活性成分： \r\n&#8226; 白桑椹与黄芩精华：焕白肌肤。\r\n&#8226; 柠檬精华：调理美白。\r\n&#8226; 植物甘油：保持水油平衡。\r\n&#8226; 葵花油与维生素B5：滋养柔肤。\r\n&#8226; 维生素E：抵抗自由基。\r\n使用方法： \r\n每日早晚，取足量产品涂抹于微湿的脸部，充分按摩后用温水洗净即可，避开眼周区域。','',0,0,0,0,0,'2012-03-01 15:33:52','2012-03-01 15:33:52',3,0);
INSERT INTO `goods_real` VALUES (39,1,0,0,'PAYOT 柏姿','护肤','PAYOT 柏姿柔和洗面奶(002822)','http://photo.no5.com.cn/product/mphoto/24890_M_120202115803_10708290.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24890_M_120202115803_10708290.jpg\";}',177,'http://www.no5.com.cn/goods/24890.html','24890',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','嘧巳岷徒嗝嫒Démaquillant Essentiel滋润柔滑，质地柔软，即刻有效卸妆。主要有效成分：\r\n乳木果油可滋养肌肤，令肌肤柔软并保护皮肤。 \r\n荷荷巴油可防止肌肤干燥并软化肌肤。使用方法：\r\n大量涂用，打小圈按摩后除去。之后再涂于嘧怂肤水。&nbsp;&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 15:33:53','2012-03-01 15:33:53',3,0);
INSERT INTO `goods_real` VALUES (40,1,0,0,'PAYOT 柏姿','护肤','PAYOT 柏姿柔和洗面奶(100271)','http://photo.no5.com.cn/product/mphoto/24895_M_120202131305_32954231.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24895_M_120202131305_32954231.jpg\";}',117,'http://www.no5.com.cn/goods/24895.html','24895',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','嘧巳岷徒嗝嫒Démaquillant Essentiel滋润柔滑，质地柔软，即刻有效卸妆。主要有效成分：\r\n乳木果油可滋养肌肤，令肌肤柔软并保护皮肤。 \r\n荷荷巴油可防止肌肤干燥并软化肌肤。使用方法：\r\n大量涂用，打小圈按摩后除去。之后再涂于嘧怂肤水。','',0,0,0,0,0,'2012-03-01 15:33:54','2012-03-01 15:33:54',3,0);
INSERT INTO `goods_real` VALUES (41,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺甘菊温和眼部卸妆液(28311)','http://photo.no5.com.cn/product/mphoto/24974_M_120220143858_69161049.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24974_M_120220143858_69161049.jpg\";}',115,'http://www.no5.com.cn/goods/24974.html','24974',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不油腻，清爽无香精的液体，能温和迅速地卸除眼部彩妆。能清洁睫毛，留有柔软光滑的触感,含有甘菊萃取，能舒缓眼部肌肤；玫瑰水成分，在温和清洁的同时，发挥微微收敛的作用。\r\n质地温和，不刺激眼部肌肤，任何肌肤都适用，敏感肌肤也适用。\r\n含有甘菊萃取液及甘菊精油精华，可达到舒缓、镇静眼睛周围肌肤的功效。\r\n所含有的甘油成分为天然的保湿剂，可使肌肤柔滑、细致。【使用方法】：\r\n取少量在卸妆棉上，闭上眼睛，将卸妆棉覆在眼部周围几秒钟，然后轻轻擦拭，不要拉扯眼部肌肤，最后再用清水清洁一下。','',0,0,0,0,0,'2012-03-01 15:33:56','2012-03-01 15:33:56',3,0);
INSERT INTO `goods_real` VALUES (42,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉矿泉爽肤卸妆乳(900837)','http://photo.no5.com.cn/product/mphoto/20080814092759471757789.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080814092759471757789.jpg\";}',220,'http://www.no5.com.cn/goods/17854.html','17854',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Biotherm Biosource clarifying cleansing milk\r\n新一代洁净因子Ethylhexyl Palmitate，能有效溶解脸部彩妆及污垢。矿泉活性萃取精华(PETP)，能舒缓肌肤。矿物微量组合，促进肌肤新生，重拾活力。浅绿色的乳胶状清爽质地，味道清香，温和无油腻感。 \r\n\r\n主要成份: \r\n*洁净因子(Ethylhexyl Palmitate棕榈酸酯)&nbsp;\r\n* 润泽因子(Butylene glycol) \r\n*矿泉活性萃取精华(PETP) \r\n*矿物微量组合 \r\n\r\n适合中性肌肤/混合性肌肤\r\n护肤程序的第一步。','',0,0,0,0,0,'2012-03-01 15:33:59','2012-03-01 15:33:59',3,0);
INSERT INTO `goods_real` VALUES (43,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo快速免洗卸妆液(31346)','http://photo.no5.com.cn/product/mphoto/20080825144440308001430.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080825144440308001430.jpg\";}',65,'http://www.no5.com.cn/goods/17889.html','17889',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','清爽型质地，没有卸妆油容易导致封闭式粉刺的困扰，油皮MM都可以放心使用。性质温和，特别的配方能够在轻柔按摩中彻底卸除彩妆和污垢。','',0,0,0,0,0,'2012-03-01 15:34:01','2012-03-01 15:34:01',3,0);
INSERT INTO `goods_real` VALUES (44,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧柔性洁颜油(6H9K)','http://photo.no5.com.cn/product/mphoto/20081008175913599546348.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081008175913599546348.jpg\";}',255,'http://www.no5.com.cn/goods/18067.html','18067',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','轻盈的透明卸妆油，稍作按摩，其滑的配方即能彻底地溶解面上的化妆及皮肤表面的油脂。只需加入少许清水，卸妆油即由透明的油质状态转变成非油性的乳状，_洗容易，也不会阻碍肌肤的天然水份屏障。&nbsp; 用后肌肤感觉氐捉嗑唬并如丝般幼滑柔软，舒适自在，不会引起皮肤干燥或脱皮。虽然它看起来和触摸起来都属于油份性质，但却适用于所有肌肤类型。在倩碧护肤三步骤之前使用，以卸除面上的彩妆。使用前应避免沾湿双手或面部。取出一个硬币的量，置于掌心，涂蛉面后，再轻轻按摩，使彩妆溶解，并加入少许清水，便能产生轻盈的乳状泡沫，再彻底洗净并以毛巾印干水份。随后可使用CLINIQUE的洗面皂。','',0,0,0,0,0,'2012-03-01 15:34:02','2012-03-01 15:34:02',3,0);
INSERT INTO `goods_real` VALUES (45,1,0,0,'Avene 雅漾','护肤','Avene 雅漾舒润卸妆水','http://photo.no5.com.cn/product/mphoto/20081008180706599546348.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081008180706599546348.jpg\";}',119,'http://www.no5.com.cn/goods/18089.html','18089',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','专为敏感性肌肤设计的配方，柔和洁肤，无需冲洗。富含具有舒缓、抗刺激特性的雅漾活泉水。含透明质酸钠，有效保湿。\r\n\r\n成分：雅漾活泉水96%；透明质酸钠0.01%；混合红没药醇0.05%；柔和表面活性物质。适用范围：适用于敏感皮肤的清洁和卸妆。\r\n\r\n使用方法：用化妆棉蘸取适量本品，擦拭脸部和颈部，无需冲洗，然后喷雾雅漾活泉水。可适用于眼部和唇部的洁肤卸妆。','',0,0,0,0,0,'2012-03-01 15:34:03','2012-03-01 15:34:03',3,0);
INSERT INTO `goods_real` VALUES (46,1,0,0,'日本JuJu','护肤','JuJu AQUAMOIST透明质酸美肌高保湿卸妆乳(60010)','http://photo.no5.com.cn/product/mphoto/18208_M_110607170221_84936042.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18208_M_110607170221_84936042.jpg\";}',99,'http://www.no5.com.cn/goods/18208.html','18208',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','「新AQUAMOIST透明质酸美肌高保湿卸妆乳」，双倍玻尿酸高保湿因子配合，像是用乳液一般轻松擦去脸上的淡妆及空气中的脏污，肌肤深呼吸，洁净、自然、舒适。\r\n&nbsp;\r\n＊适用于干燥肌、普通肌、混合肌、油性肌以及敏感肌。\r\n＊利用乳酸菌球发酵法制成，整理肌肤、浸透保湿滋润，卸完妆时也能有好肌肤。\r\n＊弱酸性、无香料、无着色，温和不刺激肌肤。\r\n＊无矿物油、无添加酒精，肌肤水灵柔嫩、不黏腻使用方法：\r\n1、将白色阻隔器取出之后，按压适量于化妆棉上。\r\n2、就像擦化妆水一样，轻轻擦拭脸庞，便可以将脸上的淡妆以及空气中的脏污擦拭掉。\r\n3、使用后可以不需要洗颜，如果想要使用洗颜乳再洁净一次也可以。\r\n&nbsp;\r\n注意事项：\r\n1、请置于幼儿无法取得处。\r\n2、眼睛周围、黏膜等部位请勿使用。\r\n3、如有伤口或是红肿发脓或裂伤的地方请勿使用。\r\n4、万一进入眼睛时不要揉眼睛，请用清水冲洗眼部，如有不适请尽速就医治疗。\r\n5、为了避免误食并保持品质的关系，请不要跟其它容器交换。','',0,0,0,0,0,'2012-03-01 15:34:04','2012-03-01 15:34:04',3,0);
INSERT INTO `goods_real` VALUES (47,1,0,0,'日本JuJu','护肤','JuJu AQUAMOIST透明质酸高保湿卸y洗颜按摩乳霜(20214)','http://photo.no5.com.cn/product/mphoto/20081024165105193816377.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081024165105193816377.jpg\";}',88,'http://www.no5.com.cn/goods/18209.html','18209',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','此款为「AQUAMOIST透明质酸保湿卸妆洗颜按摩乳霜」，添加细分子玻尿酸高保湿成分，让从卸妆、洗脸就开始帮肌肤做保养，锁住水分，让肌肤水嫩滑溜、从底透亮！＊保湿成分添加。\r\n＊无香料、无着色。\r\n＊弱酸性。使用方式：\r\n1、卸妆时，将卸妆乳霜倒于干燥的手心，轻抹匀于整脸，轻轻搓揉后，以温水洗净即可。\r\n2、做按摩霜使用时，需先卸妆后，再将乳霜轻敷上脸，以手指腹轻轻按摩脸部后，再以温水洗净。注意事项：\r\n1、请置于幼儿无法取得处。\r\n2、眼睛周围、黏膜等部位请勿使用。\r\n3、如有伤口或是红肿发脓或裂伤的地方请勿使用。\r\n4、万一进入眼睛时不要揉眼睛，请用清水冲洗眼部，如有不适请尽速就医治疗。\r\n5、为了避免误食并保持质量的关系，请不要跟其它容器交换。\r\n6、使用中如有发疹、发红、痒、刺激、痛、热或脱皮等现象时请暂停使用，如暂停使用后仍未好转请停止使用，并询问药剂师或医生。','',0,0,0,0,0,'2012-03-01 15:34:05','2012-03-01 15:34:05',3,0);
INSERT INTO `goods_real` VALUES (48,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻清滢洁面卸妆乳(2893020)','http://photo.no5.com.cn/product/mphoto/20090828155945984847320.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090828155945984847320.jpg\";}',185,'http://www.no5.com.cn/goods/18433.html','18433',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','一步到位的清洁效果，乳液状质地，温和清洁眼部及脸部彩妆。\r\n\r\n将适量产品以划圈方式轻轻按摩于脸部及眼周，然后以化妆棉拭去。清滢洁面卸妆乳含从大自然提炼的木瓜和凤梨两种酵素，能帮助老角质的剥落，让肌肤变得更洁净、透明。','',0,0,0,0,0,'2012-03-01 15:34:06','2012-03-01 15:34:06',3,0);
INSERT INTO `goods_real` VALUES (49,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯清爽卸妆液','http://photo.no5.com.cn/product/mphoto/20100719112403444539313.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100719112403444539313.jpg\";}',81,'http://www.no5.com.cn/goods/18484.html','18484',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','独有油水混合双重配方，能清除眼部，脸部和唇部的防水与不防水化妆品，如防水性睫毛膏，眼影，粉底液，腮红，唇膏等，不会留下残留，同时能滋润肌肤。   质地清爽，独特的二层式的油水混合双重配方。 \r\n能温和并彻底的清除眼部防水及不防水化妆品，不会留下残留物，并能滋润眼部肌肤。\r\n对卸除防水性粉底液、腮红、唇膏等脸部及唇部化妆品同样安全有效。   主要成分：\r\n环甲基硅氧烷：可以有效去除防水性的彩妆，而不会有粘稠、油腻感。\r\nPoloxamer184（温和的乳化剂）：可以有效去除一般性的彩妆。 \r\n充分摇匀后，用棉球沾取适量本品，轻轻抹去眼部化妆品，接着进行平常的清洁护理。  使用方法：\r\n产品使用请勿入眼。在使用过程中若有任何不适，请立即停止并请教医生。隐形眼镜佩戴者，请在卸除隐形眼镜后再卸妆。眼部存在炎症时，请勿使用任何眼部化妆品，以免污染产品或导致不适症状加重。','',0,0,0,0,0,'2012-03-01 15:34:07','2012-03-01 15:34:07',3,0);
INSERT INTO `goods_real` VALUES (50,1,0,0,'SANA 珊娜','护肤','SANA 珊娜豆乳美肌保湿卸妆乳(45061)','http://photo.no5.com.cn/product/mphoto/20081216094535941169567.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081216094535941169567.jpg\";}',83,'http://www.no5.com.cn/goods/18537.html','18537',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','揉合丰富豆乳成份的卸妆洁面乳，蕴含大豆异黄铜素成份，彻底去除面上化妆之余，能锁紧肌肤内的水份。无香料、无色素及矿物油成份，性质温和。本商品特别添加胶原蛋白及纯天然豆腐萃取物（大豆异黄酮素） 处方研制而成 。能让肌肤变得细致白皙,促进肌肤的深层渗透力来达到美肤的效果。  用法：倒适量于掌心，轻轻按摩面部，然后用温水洗净。   &nbsp;','',0,0,0,0,0,'2012-03-01 15:34:08','2012-03-01 15:34:08',3,0);
INSERT INTO `goods_real` VALUES (51,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻清滢洁面卸妆乳(2893000)','http://photo.no5.com.cn/product/mphoto/20090106163528413882797.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090106163528413882797.jpg\";}',255,'http://www.no5.com.cn/goods/18628.html','18628',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','一步到位的清洁效果，乳液状质地，温和清洁眼部及脸部彩妆。\r\n\r\n将适量产品以划圈方式轻轻按摩于脸部及眼周，然后以化妆棉拭去。  清滢洁面卸妆乳含从大自然提炼的木瓜和凤梨两种酵素，能帮助老角质的剥落，让肌肤变得更洁净、透明。','',0,0,0,0,0,'2012-03-01 15:34:09','2012-03-01 15:34:09',3,0);
INSERT INTO `goods_real` VALUES (52,1,0,0,'Za 姬芮','护肤','ZA 姬芮卸妆蜜','http://photo.no5.com.cn/product/mphoto/2009011013215821930641.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009011013215821930641.jpg\";}',35,'http://www.no5.com.cn/goods/18780.html','18780',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','双重配方：哩状膏体能紧密包裹污垢与残妆，加水冲洗时哩状变为泡沫状，更易冲洗干净。\r\n能去除阻塞毛孔的污垢及造成肌肤暗沉的老化角质。\r\n清爽不粘腻，使肌肤娇嫩润泽。\r\n可卸除油性彩妆。\r\n\r\n使用方法：\r\n涂抹时无须加水，挤出约4cm左右与掌心，以螺旋状的脸部涂开，待彩妆完全溶解后，再用清水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:58:42','2012-03-01 15:58:42',3,0);
INSERT INTO `goods_real` VALUES (53,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳双重功效眼部卸妆液(00188)','http://photo.no5.com.cn/product/mphoto/20090112085901346895687.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090112085901346895687.jpg\";}',148,'http://www.no5.com.cn/goods/18832.html','18832',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不含油脂的洁肤配方，水层具醒肤及舒缓功效，洁肤层：能有效卸除防水型睫毛膏及其它彩妆；内含柔和天然成分，舒缓幼嫩细致的眼部肌肤。 适用人群：任何肌肤 使用方法：用前要先摇匀，然后倒出湿透化妆棉，轻抹于眼部四周即可。','',0,0,0,0,0,'2012-03-01 15:58:43','2012-03-01 15:58:43',3,0);
INSERT INTO `goods_real` VALUES (54,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP纯米闪亮卸妆乳(01930)','http://photo.no5.com.cn/product/mphoto/20100525155425376214444.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100525155425376214444.jpg\";}',47,'http://www.no5.com.cn/goods/19352.html','19352',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','新款大米系列，用七种不同五谷萃取物（例如棕米，黑米，米糠……）深入渗透皮肤，给皮肤提供丰富营养，保护皮肤不受外界侵害。独有的双重洁净功效，可彻底去除眼，唇部，彩妆的残余，清除毛孔内的杂物，重组肌肤平衡系统。The Face Shop大米系列：大米源自于韩国热销米糙乳液，可充分保充面部所缺少的水分并可持久不流失，性质温和，气味宜人。在收缩毛孔、调理毛孔的同时会温和补水，控制油脂分泌过盛问题。此款卸妆乳从天然谷物中提取精华，皮肤感觉清爽，还具有美白功效，使皮肤更加明亮、细嫩、光滑。','',0,0,0,0,0,'2012-03-01 15:58:43','2012-03-01 15:58:43',3,0);
INSERT INTO `goods_real` VALUES (55,1,0,0,'SANA 珊娜','护肤','SANA 珊娜豆乳美肌卸妆洗面膏(45031)','http://photo.no5.com.cn/product/mphoto/20090505165602970836601.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090505165602970836601.jpg\";}',55,'http://www.no5.com.cn/goods/19516.html','19516',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深层洁净，高度保湿，让肌肤如布甸般柔滑，有弹力。特别添加胶原蛋白及纯天然豆腐萃取物（大豆异黄酮素）处方研制而成，让肌肤变得细致白皙，促进肌肤的深层渗透力来达到美肤的效果。\r\n加入胶原蛋白跟纯天然豆腐萃取物研制而成，可以让皮肤变得细腻白皙，有效美肤。\r\n属于纯天然的保养品，无香料、无矿物油、无着色。\r\n因采用大豆的卵磷脂萃取液，使得肌肤拥有弹力、滋润、通透。丰富的泡沫蕴含豆乳成分，能深入毛孔溶解化妆及污垢，彻底去除面上污垢及化妆之余，能锁紧肌肤内的水分。大豆异黄酮素成分能够高度保湿，洗面后仍感觉划嫩及有弹性。无香料，无色素及矿物油成分，性质温和。用法：适量于掌心，加水轻揉至起泡，按摩面部，然后用清水洗净。','',0,0,0,0,0,'2012-03-01 15:58:44','2012-03-01 15:58:44',3,0);
INSERT INTO `goods_real` VALUES (56,1,0,0,'其他护肤品牌','护肤','美人语 多效氧气洁肤慕丝(22326)特价！','http://photo.no5.com.cn/product/mphoto/20090508164506428054912.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090508164506428054912.jpg\";}',155,'http://www.no5.com.cn/goods/19544.html','19544',0,'干性,油性,混合性,中性,敏感性','','','','革命性化妆水擦拭清洁法\r\n全新的美人语多效氧气洁肤慕斯。它的配方就想水一般温和不刺激，敏感脆弱的肌肤也可以安心使用。轻轻一压，就有绵密细致的泡沫出现，并利用liposome传输科技，以细小分子彻底清除脸上的脏污，残妆等。同时运送膏含氧精华及保湿因子深达肌肤内层，滋润肤质，内外兼顾，给你惊奇的细致洁净感以及柔嫩水感肤质。卸妆、清洁、保养一次完成。三合一功能，可当保湿化妆水及卸妆用，温和不刺激。\r\n\r\n高含氧精华主要功能：润泽肌肤，延缓老化，抚平细纹。一次完成多重功能：清洁、卸妆、保湿、修护、补氧。\r\n\r\n主要成分：\r\n高含氧精华、海藻醣、山梨醇、小黄瓜萃取液、芦荟萃取液。\r\n\r\n使用方法：\r\n1.卸妆：挤出适量慕斯于手心，再涂抹于脸上，待妆容融化后用化妆棉擦拭即可。\r\n2.洗脸：将泡泡涂抹于全脸’并加以按摩，然后用清水洗净即可。\r\n3.化妆水：用化妆绵沾取适量慕斯涂抹全脸，并拍打至吸收后即可做后续保养。','',0,0,0,0,0,'2012-03-01 15:58:47','2012-03-01 15:58:47',3,0);
INSERT INTO `goods_real` VALUES (57,1,0,0,'Purity Herbs普丽缇.赫柏','护肤','Purity Herbs 普丽缇.赫柏多效洁面奶(1116)','http://photo.no5.com.cn/product/mphoto/20091023172243119644913.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091023172243119644913.jpg\";}',235,'http://www.no5.com.cn/goods/19973.html','19973',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','该产品由完全天然成分构成，不含皂基及其他任何化学清洁成分，内含丰富的洋甘菊精油与玫瑰、薰衣草、金盏花萃取液，适用于所有类型肤质，具有很好的卸妆尤其是清洁眼部妆容的效果，也可用于替代男式剃须乳液，起到润滑滋润受损皮肤的效果。  产品成份：冰岛纯水、酒精、牛油果树、甜杏仁、油橄榄、甘油、金盏菊、洋甘菊、黄春菊、锦葵、矢车菊。\r\n使用方法： 早晚使用，用手或化妆棉，轻柔地按摩面部，颈部及眼周围，温水清洗，洁面后使用PH面部爽肤营养水及面霜，效果更佳\r\n适用人群：成熟型、眼部护理、敏感型、一般型、油性、特殊护理型、特别干燥型、干燥发疹型的肤质、剃胡须。','',0,0,0,0,0,'2012-03-01 15:58:47','2012-03-01 15:58:47',3,0);
INSERT INTO `goods_real` VALUES (58,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉立润保湿洁面乳(41031)','http://photo.no5.com.cn/product/mphoto/2009092213052439802912.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009092213052439802912.jpg\";}',159,'http://www.no5.com.cn/goods/20045.html','20045',0,'','','','','轻松去除脸部彩妆,即使是防水性彩妆,皮肤仍感觉象丝柔般的洁净柔顺。温和卸除脸部彩妆与不洁物,保护皮肤油水平衡的完整性。细柔滑润的质地,可减少与皮肤摩擦的机率，特殊锁水成份,更能预防皮肤水分的散失。\r\n功效：含理肤泉laroche-posay温泉水，舒缓、镇定、抗自由基；有高效保湿玻尿酸；温和有效清洁脸部皮肤上之不洁物，也可卸除防水彩妆；锁水成分，预防皮肤水分流失。  使用方法：取适量以指腹轻轻按摩脸部肌肤,再以卸妆棉擦拭即可。不含香料, 防腐剂及表面活性剂。\r\n特别适合于缺水性肌肤，及干燥地区/季节。','',0,0,0,0,0,'2012-03-01 15:58:48','2012-03-01 15:58:48',3,0);
INSERT INTO `goods_real` VALUES (59,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物水润系列深层卸妆ㄠ','http://photo.no5.com.cn/product/mphoto/20090925155904533955273.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090925155904533955273.jpg\";}',42,'http://www.no5.com.cn/goods/20090.html','20090',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','轻松去除浓妆与毛孔的污垢，配合天然植物精华复合体与保湿因子，在洁面的同时赋予肌肤滋润令肌肤清爽水嫩。\r\n配合清爽洁净油分子的ㄠ，能迅速融合并可去除难以卸除的浓妆和顽固污垢，清爽不黏腻。在沾湿脸部和双手的情况下也能有效卸妆，使用后无需使用洁面膏。淋浴时也可轻松完成卸妆与洁面。配合白百合、芦荟、蜂蜜的天然植物精华于保湿因子在，在洁面的同时赋予肌肤滋润，令肌肤清爽水嫩。柔柔的花香，令心情格外放松。经过过敏测试。  使用方法：取适量在脸部以螺旋状涂抹开，与彩妆和污垢充分融合之后，用面纸擦拭干净，或用温水充分清洗。使用后无需使用洁面膏。对付防水类化妆品难以卸除的彩妆时，请保持脸部和双手在干燥的状态进行上述卸妆步骤。','',0,0,0,0,0,'2012-03-01 15:58:48','2012-03-01 15:58:48',3,0);
INSERT INTO `goods_real` VALUES (60,1,0,0,'Avene 雅漾','护肤','Avene 雅漾柔润水溶性洁肤凝胶(05145)','http://photo.no5.com.cn/product/mphoto/20091021100719839786848.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091021100719839786848.jpg\";}',160,'http://www.no5.com.cn/goods/20228.html','20228',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含雅漾活泉水，具有舒缓和抗刺激作用，本品质地柔润，能有效卸妆、柔和洁肤，可用于眼周和唇部敏感部位的卸妆。保湿成分能保持水脂层平衡，使之清新亮丽，无损肌肤。\r\n\r\n适用于中性、混合性敏感性肌肤。  使用方法：用湿润的指尖将本品打圈按摩脸部和颈部的肌肤后，用水洗净。拭干后用雅漾舒护活泉水喷雾。','',0,0,0,0,0,'2012-03-01 15:58:49','2012-03-01 15:58:49',3,0);
INSERT INTO `goods_real` VALUES (61,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀均效洁颜油(保湿型)','http://photo.no5.com.cn/product/mphoto/200910281631501004565131.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200910281631501004565131.jpg\";}',235,'http://www.no5.com.cn/goods/20375.html','20375',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','全球热销40年的经典保湿型洁颜油。萃取自山茶花、金姜根的精华植物油份，强化保湿效能；在高效清洁的同时，引导出仿佛沐浴着朝露的花瓣般透明美肌。适用于任何肤质彻底清洁肌肤堵塞毛孔的污垢，柔和均衡肌肤的水油比例。效果：\r\n甘草精萃舒缓敏感肌肤。植物氨基酸混合物维持肌肤天然保护屏障，促进胶元蛋白生成。海洋深层水r肌肤伸层滋润，散发自然光泽。主要成分: \r\n&#8226; 山茶花精萃油\r\n&#8226; 金姜根萃取\r\n&#8226; 5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n&#8226; 海洋深层水使用方法：\r\n第一步，温和洁颜油卸妆，包括防水睫毛膏，同时温和洁净、滋润、镇定肌肤。 按下列简单步骤使用，植村秀洁颜油将达到更好的效果。 \r\n1.对着干燥的手心按压瓶口3~4次。 \r\n2.轻轻抹开，涂至干燥的脸部肌肤。 \r\n3.使用少量温水帮助乳化。 (洁颜油将变成乳白色) \r\n4.用温水冲洗干净。 \r\n5.随后配合使用植村秀的化妆水和润肤霜。','',0,0,0,0,0,'2012-03-01 15:58:52','2012-03-01 15:58:52',3,0);
INSERT INTO `goods_real` VALUES (62,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀花颜净透美白洁颜油(蓝色36853)','http://photo.no5.com.cn/product/mphoto/20498_M_110818172317_76597419.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/20498_M_110818172317_76597419.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/20498_M_110818172333_19671761.jpg\";}',515,'http://www.no5.com.cn/goods/20498.html','20498',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','植村秀春季保养新品~一步步深入肌肤 绽放如花瓣般的净白肌使用方式想要全方位美白的美女一定不能错过的洁颜油。\r\n\r\n完整美白护理程序的完美补充： → 配方中含有与美白系列完全相同的美白精华成分，在日复一日的洗颜过程中，活性成分的累加效应，帮助更快实现美白梦想 → 提升其他美白护肤品的吸收率，通过简单手部演示实验即可证明：使用过美白洁颜油的肌肤对比未使用的肌肤，对美白产品的吸收率显著提升！使用方法：取适量洁颜油，置于干爽手心，轻轻推开按摩至全脸，混入清水或暖水轻轻按摩至洁颜油乳化，以清水或暖水彻底冲净。温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。','',0,0,0,0,0,'2012-03-01 15:58:52','2012-03-01 15:58:52',3,0);
INSERT INTO `goods_real` VALUES (63,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀花颜净透美白洁颜油(蓝色35738/36854)','http://photo.no5.com.cn/product/mphoto/20100705085652114873796.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100705085652114873796.jpg\";}',245,'http://www.no5.com.cn/goods/20499.html','20499',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','植村秀春季保养新品~一步步深入肌肤 绽放如花瓣般的净白肌使用方式想要全方位美白的美女一定不能错过的洁颜油。\r\n\r\n完整美白护理程序的完美补充： → 配方中含有与美白系列完全相同的美白精华成分，在日复一日的洗颜过程中，活性成分的累加效应，帮助更快实现美白梦想 → 提升其他美白护肤品的吸收率 通过简单手部演示实验即可证明：使用过美白洁颜油的肌肤对比未使用的肌肤，对美白产品的吸收率显著提升！使用方法：取适量洁颜油，置于干爽手心，轻轻推开按摩至全脸，混入清水或暖水轻轻按摩至洁颜油乳化，以清水或暖水彻底冲净。','',0,0,0,0,0,'2012-03-01 15:58:53','2012-03-01 15:58:53',3,0);
INSERT INTO `goods_real` VALUES (64,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀均效洁颜油(润泽型03143)','http://photo.no5.com.cn/product/mphoto/20100202174216959140453.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100202174216959140453.jpg\";}',235,'http://www.no5.com.cn/goods/20758.html','20758',0,'干性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','苦橙皮、番茄萃取物，为干燥肌肤而设计。蕴含苦橙皮、番茄、红椒等活肤植物精华，有效促进血液循环及细胞新陈代谢，带来润泽健康的肌肤。\r\nShu uemura植村秀经典的保湿型高效平衡洁颜油面世近30年，现已成为全球女士最坚信的美容秘诀之一。Shu uemura洁颜油系列凭着卓越的护肤功效，一直在原产地日本占据市场上的领导地位。今天，每30秒就有一瓶洁颜油售出。据SOGO百货统计，Shu uemura的「防晒隔离霜」及「洁颜油」几乎乎年年入榜。\r\n二合一卸妆及洁颜油的油份比率为45%清爽油份及55%丰润油份，能保持肌肤内在的平衡并清除肌肤上的所有杂质。用后肌肤柔润平滑，不会有油份残流在肌肤上，洗后肌肤不紧绷，干燥，经皮肤科医师测试，成分温和不刺激。\r\n能有效卸除防水的化妆品。配方含橙皮、蕃茄及红椒等“红色”植物的温暖色泽和香气，帮助柔软肌肤及改善光泽。\r\n润泽主要针对，干燥和有问题的肌肤.尤其是春秋天，我们的皮肤大量缺水,容易造成干纹,选择润泽.不但可以润泽肌肤.\r\n油份比率为45%清爽油份及55%丰润油份，能保持肌肤内在的平衡并清除肌肤上的所有杂质,所以是干性肌肤，以及初秋干燥时的好选择!  使用说明:\r\n1、挤出适量的洁颜油于掌中，然后涂于干爽的面上。\r\n2、用指尖将洁颜油均匀地涂于全面。在这过程中，洁颜油可吸去油溶性污垢。\r\n3、双掌沾满清水轻轻按摩面部，直至洁颜油变成乳状。\r\n4、当感觉到洁颜油开始减少，即表示已完全乳化。最后用清水冲洗，你会发现脸上充满清新舒适的洁净感。\r\n5、早晚使用。  干性肌肤适用：给与肌肤深度滋润','',0,0,0,0,0,'2012-03-01 15:58:54','2012-03-01 15:58:54',3,0);
INSERT INTO `goods_real` VALUES (65,1,0,0,'佰草集','护肤','佰草集 清洁霜','http://photo.no5.com.cn/product/mphoto/20100413173524460371794.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100413173524460371794.jpg\";}',51,'http://www.no5.com.cn/goods/21052.html','21052',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','夏枯草提取液的功效性成份：夏枯草甙，有活血散结，促进皮肤血液微循环,增进供血供氧，促进细胞新生的作用。新陈代谢的加速能帮助皮肤毛孔充分舒张，使毛孔内的各种污物和细胞碎片容易排出。佰草集清洁霜，细腻柔滑，能温和且彻底地去除脸部的彩妆，多余油脂，和尘垢。用后绝不感到油腻。令肌肤清洁，爽滑和舒适。持续使用，皮肤自身的毛孔排污能力会趋向一个理想的状态。是一款内外协同，治表治本的植物型清洁霜。  使用方法：将适量（葡萄般大小，约3ml）挤在手上，轻轻按摩于面部，再用面纸擦去，或以温水洗净。\r\n适宜人群：适合于所有类型的肌肤使用。','',0,0,0,0,0,'2012-03-01 15:58:54','2012-03-01 15:58:54',3,0);
INSERT INTO `goods_real` VALUES (66,1,0,0,'SKIN FOOD 思亲肤','护肤','SKIN FOOD绿豆眼唇卸妆凝露(10969)','http://photo.no5.com.cn/product/mphoto/20100420144907625460024.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100420144907625460024.jpg\";}',42,'http://www.no5.com.cn/goods/21251.html','21251',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含绿豆提取物，无刺激性的轻松擦去眼睛和嘴部周围的化妆，清爽无油腻感的ㄠ状卸妆水。   使用方法：取适量蘸在化妆棉，放置于眼睛和嘴部肌肤上，待彩妆溶解随即擦拭，再以温水洗净即可','',0,0,0,0,0,'2012-03-01 15:58:55','2012-03-01 15:58:55',3,0);
INSERT INTO `goods_real` VALUES (67,1,0,0,'MISS FACE','护肤','MISS FACE 豆乳雪肌清爽卸妆油','http://photo.no5.com.cn/product/mphoto/20100428151320967320875.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428151320967320875.jpg\";}',32,'http://www.no5.com.cn/goods/21351.html','21351',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含皮肤必需的维他命及大豆异黄酮素”成分，深入渗透皮肤，给皮肤提供丰富营养，保护皮肤不受外界侵害。独有的双重洁净功效，可彻底去除彩妆的残余，清除毛孔内的杂物，使肌肤全日滋润平衡，柔软舒适。  主要成分: 月见草油、葡萄籽油、荷荷芭油、脂肪酸山梨坦、聚山梨酯、豆乳发酵液。  使用方法:取适量于掌心,涂抹于面部并轻轻按摩,使卸妆油与彩妆污垢充分融合.20-30秒后用清水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:58:55','2012-03-01 15:58:55',3,0);
INSERT INTO `goods_real` VALUES (68,1,0,0,'MISS FACE','护肤','MISS FACE 透明质酸美肌舒润卸妆乳','http://photo.no5.com.cn/product/mphoto/20100428152101967320875.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428152101967320875.jpg\";}',40,'http://www.no5.com.cn/goods/21361.html','21361',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含皮肤必需的维他命及存在于肌肤的结缔组织透明质酸成分，深入渗透皮肤，给皮肤提供丰富营养，保护皮肤不受外界侵害。独有的双重洁净功效，可彻底去除彩妆的残余，清除毛孔内的杂物，使肌肤享受滋润平衡，柔软舒适的卸妆过程。  主要成分: 去离子水、 十六十八醇、单甘酯、DC200/350、K12、卡波940、透明质酸。  使用方法: 取适量于掌心，涂抹于面部并轻轻按摩，使卸妆乳与彩妆污 垢充分融合20-30秒后用清水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:58:56','2012-03-01 15:58:56',3,0);
INSERT INTO `goods_real` VALUES (69,1,0,0,'其他护肤品牌','护肤','美凯娜 橄榄轻柔卸妆油','http://photo.no5.com.cn/product/mphoto/20100428143040967305208.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428143040967305208.jpg\";}',36,'http://www.no5.com.cn/goods/21391.html','21391',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含植物性修复配方，能轻柔彻底卸除面部残妆及污垢，性质温和，用后没有油腻和紧绷感，肌肤嫩滑清爽。\r\n\r\n产品成份：橄榄精华、PG、卸妆油、鳄梨油、荷荷芭油等。&nbsp;\r\n\r\n使用方法：去卸妆棉蘸取适量卸妆油，沿皮肤纹理轻柔按摩后用清水冲洗干净即可。','',0,0,0,0,0,'2012-03-01 15:58:57','2012-03-01 15:58:57',3,0);
INSERT INTO `goods_real` VALUES (70,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP纯米闪亮眼唇卸妆油(01933)','http://photo.no5.com.cn/product/mphoto/20100621120412858704651.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100621120412858704651.jpg\";}',50,'http://www.no5.com.cn/goods/21403.html','21403',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含有温和的滔米水，去除彩妆及污垢。\r\n由大米成分形成的上层乳和下层的卸妆水集中溶解重点彩妆，轻柔去除彩妆及污垢，质地温和无刺激。使用方法：充分摇匀后，用化妆棉占湿，轻轻擦拭即可。','',0,0,0,0,0,'2012-03-01 15:58:57','2012-03-01 15:58:57',3,0);
INSERT INTO `goods_real` VALUES (71,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP纯米闪亮清洁油(适合中油性肤质01928)','http://photo.no5.com.cn/product/mphoto/20100521174839742197110.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100521174839742197110.jpg\";}',58,'http://www.no5.com.cn/goods/21513.html','21513',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','卸妆效果很好，取出一点在脸上轻抹一下，粉底彩妆都很容易就可以被卸下来，使用后毛孔特别干净，或者用于深层清洁，推荐使用。源自于韩国热销米糙，收毛孔调理毛孔的同时温和补水，可充分保充面部所缺少的水分并可持久不流失.柔和而不粘腻，在收缩毛孔得同时也会控制你的面部油份分泌过盛!大米具有美白的功效，性质温和，皮肤感觉清爽，气味宜人.从天然谷物中提取精华，全日均可使用。用七种不同五谷萃取物（例如棕米，黑米，米糠 ）深入渗透皮肤，给皮肤提供丰富营养，保护皮肤不受外界侵害。独有的双重洁净功效，可彻底去除彩妆的残余，清除毛孔内的杂物，重组肌肤平衡系统。\r\n&nbsp;\r\n使用方法： \r\n第一步-卸妆油倒在干手上：一定要保持手和脸部的干燥，否则潮湿环境会减弱卸妆油的清洁力。 　　\r\n第二步-轻柔的按摩全脸：双手沾满卸妆油后，轻柔的按摩全脸，用力要轻，守法由内而外打圈。 　　\r\n第三步-来回按摩鼻翼处：在容易堆积污垢的鼻翼处，来回按摩3次就可以了。太多反而会损害肌肤。 　\r\n第四步-用温水沾湿双手：选择与体温湿度相近的温水，先洗净双手再将温水拍打全脸。\r\n第五步-充分乳化卸妆油：用温水充分乳化脸部的卸妆油，令污垢与彩妆自然浮到肌肤的表层最后使用大量的清水（以微温的水为佳）冲洗干净。偏油的皮肤觉得清水洗不净，可再用洗面奶清洁一次。\r\n睫毛膏部分，则可将卸妆油倒在化妆棉上，于眼部轻轻按摩再冲洗。','',0,0,0,0,0,'2012-03-01 15:58:58','2012-03-01 15:58:58',3,0);
INSERT INTO `goods_real` VALUES (72,1,0,0,'Beauty Diy','护肤','Beauty Diy樱花保湿美白洗卸露(1142361)','http://photo.no5.com.cn/product/mphoto/201006041749411071945346.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/201006041749411071945346.jpg\";}',75,'http://www.no5.com.cn/goods/21563.html','21563',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','樱花保湿美白洗卸露结合了卸妆、洗脸、保湿-One Step-，让一次达到『浸润、美白、净颜术』。 \r\n添加樱花叶萃取、吟酿曲萃取、及维他命C醣苷，可以发挥深层美白功效，均匀肤色、同时净白肌肤。\r\n复合式胺基酸精华及D-泛醇则能够让补足水份，提升肌肤含水量及修护性，维持润泽度，让在带走污垢、彩妆的同时也让肌肤注入满满的水分。使用说明：先以化妆棉沾取适量洗卸露。轻轻擦拭于脸部及眼部肌肤直到彩妆或污垢卸除干净，之后可直接用清水中洗干净，不需再洗脸。过度出油的肌肤则可以考虑再以洗颜产品清洗一次。','',0,0,0,0,0,'2012-03-01 15:58:59','2012-03-01 15:58:59',3,0);
INSERT INTO `goods_real` VALUES (73,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo玻尿酸高保湿眼唇卸妆液(31815)','http://photo.no5.com.cn/product/mphoto/21608_M_110504105101_94314247.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/21608_M_110504105101_94314247.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/21608_M_110504105112_94599891.jpg\";}',85,'http://www.no5.com.cn/goods/21608.html','21608',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','添加玻尿酸保湿成份，针对特别干燥的眼周四周，给予保护滋润，贴近眼泪中性成分，不刺激双眼，敏感肌也适用。轻松卸除眼部及唇部彩妆。彻底卸除超难卸的防水性睫毛膏及口红，溶解效果迅速，根根包覆每根睫毛，溶解更彻底。无香料、色素、酒精配方，用起来更安心。无需清水洗净，使用后触感水润，没有黏腻感，无残留。适用于眼部彩妆及唇彩，并给予保湿与洁净的脸蛋!使用说明：使用方式取适量卸妆液轻触在眼部，静待约3分，眼部彩妆随之迅速溶解。','',0,0,0,0,0,'2012-03-01 15:58:59','2012-03-01 15:58:59',3,0);
INSERT INTO `goods_real` VALUES (74,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo净白莹透卸妆洁面乳(31565)','http://photo.no5.com.cn/product/mphoto/20100609162707883023582.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100609162707883023582.jpg\";}',72,'http://www.no5.com.cn/goods/21609.html','21609',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','双重功效的清洁配方！泡i柔细，使用后倍感清爽亮丽。新添加白真珠成份。去除角质，卸妆洗颜，带给您净白莹透的肌肤。使用说明：取适量置于双手，再于脸部肌肤微力按摩配合清水洗Q即可。','',0,0,0,0,0,'2012-03-01 15:59:02','2012-03-01 15:59:02',3,0);
INSERT INTO `goods_real` VALUES (75,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo牛奶保湿嫩肤卸妆洁面乳(31276)','http://photo.no5.com.cn/product/mphoto/20100609162804883023582.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100609162804883023582.jpg\";}',79,'http://www.no5.com.cn/goods/21610.html','21610',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','把牛奶乳液加进去，让干燥毛孔从内侧饱满起来，让别人好羡慕您像婴儿般细致柔滑肌。摆脱没水份的干燥肌。添加玻尿酸保湿因子，长效柔嫩保湿，使用30分后依旧持续水嫩嫩。温和洗净柔软如牛奶般柔嫩肌，添加牛奶乳液柔嫩成份，像乳液一般柔滑质感，温和不刺激。&nbsp; \r\n\r\n使用说明：请先将双手水份擦干，取适量于手心，轻轻按摩脸部肌肤，直到脸部彩妆及脏污浮出后，再用化妆绵轻轻擦拭干净，再使用洗面奶完整清洁肌肤即可。  适合肤质：任何肤质。敏感、痘痘肌皆适用。','',0,0,0,0,0,'2012-03-01 15:59:03','2012-03-01 15:59:03',3,0);
INSERT INTO `goods_real` VALUES (76,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP纯米闪亮清洁油(适合干性肤质01927)','http://photo.no5.com.cn/product/mphoto/20100611152032163021011.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100611152032163021011.jpg\";}',58,'http://www.no5.com.cn/goods/21642.html','21642',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','卸妆效果很好，取出一点在脸上轻抹一下，粉底彩妆都很容易就可以被卸下来，使用后毛孔特别干净，或者用于深层清洁，推荐使用。源自于韩国热销米糙，收毛孔调理毛孔的同时温和补水，可充分保充面部所缺少的水分并可持久不流失。柔和而不粘腻，在收缩毛孔得同时也会控制你的面部油份分泌过盛!大米具有美白的功效，性质温和，皮肤感觉清爽，气味宜人。从天然谷物中提取精华，全日均可使用。用七种不同五谷萃取物（例如棕米，黑米，米糠 ）深入渗透皮肤，给皮肤提供丰富营养，保护皮肤不受外界侵害。独有的双重洁净功效，可彻底去除彩妆的残余，清除毛孔内的杂物，重组肌肤平衡系统。\r\n&nbsp;\r\n使用方法： \r\n第一步-卸妆油倒在干手上：一定要保持手和脸部的干燥，否则潮湿环境会减弱卸妆油的清洁力。 　　\r\n第二步-轻柔的按摩全脸：双手沾满卸妆油后，轻柔的按摩全脸，用力要轻，守法由内而外打圈。 　　\r\n第三步-来回按摩鼻翼处：在容易堆积污垢的鼻翼处，来回按摩3次就可以了。太多反而会损害肌肤。 　\r\n第四步-用温水沾湿双手：选择与体温湿度相近的温水，先洗净双手再将温水拍打全脸。\r\n第五步-充分乳化卸妆油：用温水充分乳化脸部的卸妆油，令污垢与彩妆自然浮到肌肤的表层最后使用大量的清水（以微温的水为佳）冲洗干净。偏油的皮肤觉得清水洗不净，可再用洗面奶清洁一次。\r\n睫毛膏部分，则可将卸妆油倒在化妆棉上，于眼部轻轻按摩再冲洗。','',0,0,0,0,0,'2012-03-01 15:59:03','2012-03-01 15:59:03',3,0);
INSERT INTO `goods_real` VALUES (77,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉均衡清润卸妆水(41033)','http://photo.no5.com.cn/product/mphoto/20100701145033480638949.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100701145033480638949.jpg\";}',165,'http://www.no5.com.cn/goods/21740.html','21740',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','理肤泉均衡清润卸妆水，运用温和但具有强效清洁力的胶囊技术，吸引并有效抓住不洁物，脸部，眼部，唇部三步卸妆一步完成。高溶解力的清洁因子，尽可能减少机械外力的清洁过程，即使最敏感的肌肤也能使用；滋润和舒缓因子，尽可能得保证皮肤清洁后的舒适感；理肤泉温泉水，作为溶剂温和、舒缓、镇定，并具有抗氧化功效；pH值中性，不含皂基、酒精、色素，解决肌肤敏感问题困扰的第一步。温和清洁面部、眼部及唇部彩妆，不易刺激皮肤，不含皂基，帮助维护皮肤天然平衡。不含酒精、色素。不含泥泊金酯类防腐剂。不易堵塞毛孔。使用方法：\r\n用棉片沾取适量本品擦拭面部肌肤，无需再用水冲洗。仅供外用。','',0,0,0,0,0,'2012-03-01 15:59:05','2012-03-01 15:59:05',3,0);
INSERT INTO `goods_real` VALUES (78,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP水果清洁霜(27823)','http://photo.no5.com.cn/product/mphoto/20100709145249822637196.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100709145249822637196.jpg\";}',29,'http://www.no5.com.cn/goods/21783.html','21783',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','选用草莓，柠檬，猕猴桃，西柚等多种富含VA VC等维他命天然水果，香味宜人，触感细腻。皮肤感觉温和舒适。适合混合－干性肌肤、敏感肌肤使用。用来卸妆和做为早晚清洁用品。收毛孔调理毛孔的同时温和补水，可以当卸妆霜和按摩膏使用的，取一点在脸上轻抹，粉底彩妆就落下来了，而且毛孔很干净。卸妆乳霜可说是历史最悠久的卸妆品，全脸涂抹乳霜之后，以按摩的方式，缓缓将脸上的彩妆溶解，再以柔软的面纸拭去。利用乳霜卸妆虽然比较花时间，但其丰厚滋润的质地，非常适合经常化妆及在外面走动的女性使用，不会过度带走肌肤原有的油脂，同时又能为肌肤补充适度的滋润。使用方法：\r\n洁面--清水彻底湿润面部后，取一元硬币大小均匀按摩面部，保持润滑感觉，洗净面部污染，最后以清水彻底冲洗洁肤。\r\n卸妆--清水彻底湿润面部，取3g左右，覆盖面部，以化妆棉擦拭。洁净彩妆，冲净后再使用一次清洁霜作为洁面，皮肤质感柔滑。','',0,0,0,0,0,'2012-03-01 15:59:06','2012-03-01 15:59:06',3,0);
INSERT INTO `goods_real` VALUES (79,1,0,0,'SK-Ⅱ','护肤','SK-Ⅱ 活肤卸妆蜜(02929)','http://photo.no5.com.cn/product/mphoto/20100715151553810520058.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100715151553810520058.jpg\";}',285,'http://www.no5.com.cn/goods/21805.html','21805',0,'','','','','产品功效：\r\n温和彻底卸除脸上的妆，并加强肌肤在卸妆后的保护屏障，同时带给肌肤滋润平滑的触感。  产品特性：\r\n1、可消除水溶性的可见脏污。\r\n2、海洋茴香萃取物能加强皮肤的保湿，以继续皮肤障壁的功能。  使用方法：\r\n取适量卸妆后，再取相同量清洁按摩2-3分钟，达到深层清洁，然后以化妆纸拭净或用清水/温水清洗。','',0,0,0,0,0,'2012-03-01 15:59:06','2012-03-01 15:59:06',3,0);
INSERT INTO `goods_real` VALUES (80,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀汉萃断黑净白洁颜油(升级版25600)','http://photo.no5.com.cn/product/mphoto/20100819170344561143553.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100819170344561143553.jpg\";}',68,'http://www.no5.com.cn/goods/21945.html','21945',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','利用植物成分的力量，从梅果实中提取有效成分阻断皮肤角质细胞摄食黑色素，含有和梅果、樱花叶萃取物及维他命C,独特“黑色素断食”科技，提升美白效果，还原肌肤极致净透细白！西梅精萃净化肌肤。樱花叶精萃舒缓肌肤，并提升肌肤质感。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。主要成分: 矿物油 , 肉W蔻酸异丙酯, c12-15 烷醇苯甲酸酯, peg-20 甘油三异硬脂酸酯 , 碳酸二辛酯, 油酸乙酯, 日本樱花叶精萃, 水解欧洲李, 海水, 精氨酸, 聚山梨醇酯 85, 失水山梨醇三油酸酸酯 , 甘油, 醋酸盐维他命e, 油酸, 辛乙二醇 , 己基肉桂醛 , 孟氧基丙二醇 , 丁苯基甲基丙醛 , 芳樟醇 , 水杨酸苄酯 , 香精/香料使用方法：\r\n1.取适量于干燥的手心。 2. 在干燥的脸部肌肤轻轻推开。 3. 用少量温水湿润肌肤，帮助乳化。. (洁颜油会变成乳白色) 4. 用温水冲洗干净。 5.随后配合使用植村秀的化妆水和乳液。','',0,0,0,0,0,'2012-03-01 15:59:07','2012-03-01 15:59:07',3,0);
INSERT INTO `goods_real` VALUES (81,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯清爽卸妆液(迷你装)','http://photo.no5.com.cn/product/mphoto/20100930131507476964657.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100930131507476964657.jpg\";}',35,'http://www.no5.com.cn/goods/22244.html','22244',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','各种肤质使用。敏感性肌肤使用。不含香料。经过眼部测试，隐形眼镜佩戴者也可安心使用。  透明双层油水混合配方，能温和地清除防水和不防水化妆品，不会留下残留。  使用方法：\r\n请摇动瓶体直至上下两层混合均匀，以棉球蘸取适量并轻拭眼部、脸部及唇部化妆品。','',0,0,0,0,0,'2012-03-01 15:59:08','2012-03-01 15:59:08',3,0);
INSERT INTO `goods_real` VALUES (82,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀樱花洁颜油(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/22277_M_110616143533_29981056.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22277_M_110616143533_29981056.jpg\";}',75,'http://www.no5.com.cn/goods/22277.html','22277',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','质地更清爽、并含有独特的樱桃萃取物新配方，可有效紧致毛孔柔嫩肌肤，洗后肤触更加柔软、明亮，让肌肤如樱花花瓣般紧致，如新生儿般的粉嫩无瑕、吹弹可破。采用高效洁颜油系统，此系统结合三种高效洁肤油份：HP-EO及DCC对卸除睫毛膏特别有效，而AB则可有效清除唇膏和粉底。糅合植物精华内一种独特成份，有别于一般传统油质洁肤产品，绝无半点油腻感觉，缔造洁肤后清凉的用后感。灵感源自柔美的樱花，触感绝不油腻，加入樱桃萃取物，能促进细胞再生机能，令肌肤展现柔滑细致的肤质。特别注入香熏治疗的元素，将樱花所发出的清雅香气完全融入洁颜油中，带来更舒缓、更畅快的洁肤体验。用法：\r\n1、在瓶顶按压3-4下，挤出适量的洁颜油于掌中，然后涂于干爽的面部。\r\n2、用指尖将洁颜油均匀地涂于全面，并用指腹轻轻按摩，并加强眼妆及唇彩等较不容易卸除的部位，或是易长粉刺的T字部位。在这过程中，洁颜油可吸去油溶性污垢。\r\n3、双掌沾满清水轻轻按摩面部，直至洁颜油变成乳状。\r\n4、当感觉到洁颜油开始减少，即表示已完全乳化。最后用清水冲洗，你会发现脸上充满清新舒适的洁净感。\r\n5、早晚使用。','',0,0,0,0,0,'2012-03-01 15:59:08','2012-03-01 15:59:08',3,0);
INSERT INTO `goods_real` VALUES (83,1,0,0,'Shu Uemura 植村秀','明星推荐','Shu uemura植村秀绿茶抗氧化洁颜油(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/20101105151052404571800.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101105151052404571800.jpg\";}',75,'http://www.no5.com.cn/goods/22460.html','22460',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','“洁颜油之父”植村秀全新呈现兼具深彻洁净力与卓越抗氧化功效的洁颜新品，每日清洁，祛除各种令肌肤加速老化的顽固彩装，皮脂污垢，高效抗氧祛黄，守护青春光彩！效果：\r\n茶多酚提取自绿茶；卓越的抗氧化性能。绿色/木质香味源自西瓜、茉莉花和檀香的舒缓香味。植物油包含荷荷芭油和坚果油，保湿、舒缓肌肤。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。\r\n[超凡净彻] 专利HPO洁颜系统\r\n极速包裹毛孔深处各种传统洁面产品无法祛除的顽固彩妆、脏污；一冲即净，深彻净透，绝无残留！\r\n[双倍抗氧] 绿茶×银杏配方\r\n2种矜贵植物精油，2倍于原配方的添加浓度，预防肌肤氧化，绝迹黯沉黄气！\r\n[温和舒润] 天然植物油分\r\n安全温和，不刺激肌肤；不引发粉刺；主要成分: \r\n・儿茶酚，含有从绿茶中萃取的具有抗氧化作用的活性成分\r\n・5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n・海洋深层水使用方法：\r\n卸妆、洁面合为一步的温和洁颜油，用于卸妆，包括卸除防水睫毛膏，同时清洁、滋润、镇定肌肤。 为达到最好的效果，使用植村秀洁颜油时，请遵照以下简单步骤： \r\n1.按压3~4次于干燥的手心。 \r\n2.在干燥的脸部肌肤轻轻推开。 \r\n3.用少量温水湿润肌肤，帮助乳化(洁颜油会变成乳白色) 。\r\n4.用温水冲洗干净。\r\n5.随后配合使用植村秀的化妆水和乳液。','',0,0,0,0,0,'2012-03-01 15:59:09','2012-03-01 15:59:09',3,0);
INSERT INTO `goods_real` VALUES (84,1,0,0,'Estee Lauder 雅诗兰黛','护肤','Estee Lauder雅诗兰黛轻柔眼部卸妆液(W09A)','http://photo.no5.com.cn/product/mphoto/20101104174138227644774.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101104174138227644774.jpg\";}',105,'http://www.no5.com.cn/goods/22469.html','22469',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不含油脂的配方能够迅速彻底地抹去水溶性的眼部彩妆，并不留下任何油脂残留。而且在卸妆清洁后，可以立刻再次为眼部上妆。\r\n质地轻盈，能够迅速彻底地抹去水溶性的眼部彩妆，并不留全使用。使用方法：\r\n不含油脂，不含香精香料，经皮肤科专家测试。在卸妆清洁后，可以立刻再次为眼部上妆。采用无油配方，经眼科专家测试通过，佩带隐形眼睛的用户也可以安全是用。将卸妆液倒于棉球或者化妆棉上，闭上眼睛，轻轻拭去眼部彩妆。','',0,0,0,0,0,'2012-03-01 15:59:10','2012-03-01 15:59:10',3,0);
INSERT INTO `goods_real` VALUES (85,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻温和卸妆乳(803021) 新装','http://photo.no5.com.cn/product/mphoto/201004041523131015515119.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/201004041523131015515119.jpg\";}',255,'http://www.no5.com.cn/goods/1616.html','1616',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','- 能彻底卸除脸部彩妆及不洁物\r\n- 肌肤感觉柔软舒适\r\n乳状的质地可卸除浓妆，同时给予肌肤湿润和滋养，使用后肌肤感觉非常舒适。\r\n适合敏感性和干性肌肤使用。\r\n温和卸妆乳富含植物性乳蛋白（杏仁萃取物），谷类和酵母萃取物，能滋养并柔软肌肤。','',0,0,0,0,0,'2012-03-01 15:59:10','2012-03-01 15:59:10',3,0);
INSERT INTO `goods_real` VALUES (86,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻温和卸妆乳(803022) 新装','http://photo.no5.com.cn/product/mphoto/20090225154525628773697.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090225154525628773697.jpg\";}',178,'http://www.no5.com.cn/goods/1624.html','1624',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','- 能彻底卸除脸部彩妆及不洁物\r\n- 肌肤感觉柔软舒适\r\n乳状的质地可卸除浓妆，同时给予肌肤湿润和滋养，使用后肌肤感觉非常舒适。适合敏感性和干性肌肤使用。\r\n温和卸妆乳富含植物性乳蛋白（杏仁萃取物），谷类和酵母萃取物，能滋养并柔软肌肤。','',0,0,0,0,0,'2012-03-01 15:59:11','2012-03-01 15:59:11',3,0);
INSERT INTO `goods_real` VALUES (87,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻速洁眼部卸妆水(803033)','http://photo.no5.com.cn/product/mphoto/1688_M_110801110651_37019173.jpg','a:1:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/1688_M_110801110651_37019173.jpg\";}',215,'http://www.no5.com.cn/goods/1688.html','1688',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','快速卸除一切彩妆，不会有黏腻感。\r\n能卸除所有的彩妆，包括防水性彩妆。敏感性眼睛或配戴隐形眼镜者均可使用。\r\n快速眼唇卸妆液的PH值与泪水相似，非常温和不刺激。特别适合戴隐形眼镜者使用，能迅速有效的卸除眼部及唇部彩妆，包括防水性彩妆。\r\n它含有挥发性油脂（不含酒精）和温和的清洁因子。','',0,0,0,0,0,'2012-03-01 15:59:12','2012-03-01 15:59:12',3,0);
INSERT INTO `goods_real` VALUES (88,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻眼部卸妆水(803034)','http://photo.no5.com.cn/product/mphoto/1711_M_110812163617_16706826.jpg','a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/1711_M_110812163617_16706826.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/1711_M_110812163627_21595741.jpg\";}',215,'http://www.no5.com.cn/goods/1711.html','1711',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合所有肤质，非常温和凉爽的眼部卸妆水。性质湿和又不刺激皮肤。轻柔的卸除眼部化妆品。（可以卸除普通睫毛膏） 产品成分：\r\nEFFACIL的软化成分和玫瑰精华可以有效地卸去眼睫毛和眼帘上的彩妆。 用法：\r\n沾适量于化妆棉上,轻按在睫毛及眼盖位置大约30秒.然后向睫毛生长方向外抹.以上步骤重复直至眼部化妆完全卸除。','',0,0,0,0,0,'2012-03-01 15:59:12','2012-03-01 15:59:12',3,0);
INSERT INTO `goods_real` VALUES (89,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧眼部/唇部卸妆液(60MK)','http://photo.no5.com.cn/product/mphoto/2007127171151009073014.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007127171151009073014.jpg\";}',185,'http://www.no5.com.cn/goods/2587.html','2587',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Clinique Take The Day Off Make Up Remover for Lids, Lashes & Lips\r\n祛除眼睑、眼睫毛和唇部彩妆。独特双效配方，能够减轻紧绷感，加速祛除眼部彩妆、睫毛膏和唇膏。通过眼科医生测试。适合隐形眼睛佩带者使用。\r\n高效迅速清洁祛除敏感眼部和唇部彩妆。彻底祛除眼部彩妆（包括牢固的防水型彩妆），不会松弛眼部肌肤。适合隐形眼睛佩带者使用。通过眼科医生测试。使用方法：用前摇晃。倒少许于棉球之上，轻轻擦拭眼部和唇部。','',0,0,0,0,0,'2012-03-01 15:59:13','2012-03-01 15:59:13',3,0);
INSERT INTO `goods_real` VALUES (90,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺芦荟舒缓卸妆乳(22609)','http://photo.no5.com.cn/product/mphoto/20100129162029251384980.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100129162029251384980.jpg\";}',105,'http://www.no5.com.cn/goods/3194.html','3194',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','芦荟舒缓卸妆乳\r\n不添加任何人工色素及香料的芦荟系列产品，经临床证明非常适合于敏感性肌肤及干性肤质使用，其中不只是使用具温和性的天然成分，更添加了具舒缓、补充水分及镇静肌肤功效的天然芦荟胶。&nbsp; \r\n&nbsp;\r\n使用方法： \r\n取适量按摩全脸及颈部后用面纸擦拭即可，搭配芦荟舒缓洁肤乳 效果更佳。 \r\n&nbsp;\r\n适合肤质： \r\n任何肤质，尤适合干燥、敏感性肌肤使用。 \r\n&nbsp;\r\n配合使用： \r\n可一起使用的产品：为达更佳的效果建议搭配：芦荟舒缓调理水。','',0,0,0,0,0,'2012-03-01 15:59:14','2012-03-01 15:59:14',3,0);
INSERT INTO `goods_real` VALUES (91,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀高效平衡洁颜油(橙色润泽型03142)(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/200712131518481034892787.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200712131518481034892787.jpg\";}',535,'http://www.no5.com.cn/goods/3393.html','3393',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','每当肌肤干燥缺水，最适合使用高效平衡洁颜油（润泽型）。二合一卸妆及洁颜油的油份比率为45%清爽油份及55%丰润油份，能保持肌肤内在的平衡并清除肌肤上的所有杂质。用后肌肤柔润平滑，不会有油份残流在肌肤上。能有效卸除防水的化妆品。配方含橙皮、蕃茄及红椒等“红色”植物的温暖色泽和香气，帮助柔软肌肤及改善光泽。\r\n&nbsp; \r\n使用方法\r\n用干的手取适量的洁颜油（约四至六下）。将洁颜油涂在手及颈部的位置，再加水使化妆油乳化。按摩肌肤后用冷或温水冲洗。\r\n&nbsp; \r\n原产地:日本温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。','',0,0,0,0,0,'2012-03-01 15:59:14','2012-03-01 15:59:14',3,0);
INSERT INTO `goods_real` VALUES (92,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉矿泉柔肤卸妆乳(900835)','http://photo.no5.com.cn/product/mphoto/20080324143057963307156.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080324143057963307156.jpg\";}',175,'http://www.no5.com.cn/goods/5412.html','5412',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','移除脸部彩妆及污垢，润泽及柔嫩肌肤。使用后，脸部感觉洁净无比、舒适、平滑及柔软。新一代洁净因子(Ethylhexyl Palmitate)，温和不刺激，能有效溶解脸部彩妆及污垢。甘油及乳油木油，可润泽及补充角质层肌肤的水份，强化干性肌肤的保护屏障。尿囊素及PETP矿泉舒活因子，能舒缓肌肤。矿物微量组合，能补充细胞活力。  主要成份\r\n洁净因子(Ethylhexyl Palmitate棕榈酸酯)\r\n保湿润泽因子(甘油、丁二醇及乳油木油)\r\n舒缓因子(矿泉活性萃取精华及尿囊素)\r\n矿物微量组合(锰镁铜锌钾钠)  使用方法：取适量于脸部四个部位(额头、两颊、下巴)。两手指腹紧贴肌肤，轻轻以划圆方式，将产品均匀推抹开来。以化妆棉轻轻拭去脸上的残妆及污垢。\r\n  适合肤质：适合干性肌肤','',0,0,0,0,0,'2012-03-01 15:59:15','2012-03-01 15:59:15',3,0);
INSERT INTO `goods_real` VALUES (93,1,0,0,'Elizabeth Arden 雅顿','护肤','Elizabeth Arden 雅顿眼部及唇部速效卸妆水','http://photo.no5.com.cn/product/mphoto/20071261533241008850898.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071261533241008850898.jpg\";}',99,'http://www.no5.com.cn/goods/6711.html','6711',0,'干性,油性,混合性,中性,敏感性','','','','产地：美国\r\n为浅绿色水油分离状，全天然百分百不含香料，性质温和清爽，在清除化妆残渍的同时，强化敏感性皮肤，瞬间卸除眼部睫毛膏和眼影，还能卸除唇部残留的彩妆，补充眼部和唇部的水分。','',0,0,0,0,0,'2012-03-01 15:59:15','2012-03-01 15:59:15',3,0);
INSERT INTO `goods_real` VALUES (94,1,0,0,'Vichy 薇姿','护肤','Vichy薇姿泉之净卸妆乳','http://photo.no5.com.cn/product/mphoto/7663_M_111115142010_47857185.jpg','a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/7663_M_111115142010_47857185.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/7663_M_111115142015_35777718.jpg\";}',142,'http://www.no5.com.cn/goods/7663.html','7663',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合任何肤质,首次加入细胞呼吸激活因子――辅酶Q,能彻底清除由于环境污染造成的有害物质,让皮肤自由呼吸，保留良好的组织物质,完整的泉水护理.\r\n3合1，同时清洁面部，卸除眼部彩妆，并具有爽肤水的功效。取适量，轻按于面部和颈部，然后用化妆棉拭净即可。\r\n一个步骤即可同时清洁面部及眼部，同时滋润皮肤赋予活力，用后皮肤倍感清爽，柔细，它的无油配方适合于最敏感的皮肤。ph值与泪水相同，适合敏感性眼睛及隐形眼镜配戴者使用，不生粉刺配方。','',0,0,0,0,0,'2012-03-01 15:59:16','2012-03-01 15:59:16',3,0);
INSERT INTO `goods_real` VALUES (95,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀绿茶洁颜油(绿色)(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/8724_M_101206103043_39253517.jpg','a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/8724_M_101206103043_39253517.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/8724_M_101206103100_24637581.jpg\";}',525,'http://www.no5.com.cn/goods/8724.html','8724',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','“洁颜油之父”植村秀全新呈现兼具深彻洁净力与卓越抗氧化功效的洁颜新品，每日清洁，祛除各种令肌肤加速老化的顽固彩装，皮脂污垢，高效抗氧祛黄，守护青春光彩！效果：\r\n茶多酚提取自绿茶；卓越的抗氧化性能。绿色/木质香味源自西瓜、茉莉花和檀香的舒缓香味。植物油包含荷荷芭油和坚果油，保湿、舒缓肌肤。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。\r\n[超凡净彻] 专利HPO洁颜系统\r\n极速包裹毛孔深处各种传统洁面产品无法祛除的顽固彩妆、脏污；一冲即净，深彻净透，绝无残留！\r\n[双倍抗氧] 绿茶×银杏配方\r\n2种矜贵植物精油，2倍于原配方的添加浓度，预防肌肤氧化，绝迹黯沉黄气！\r\n[温和舒润] 天然植物油分\r\n安全温和，不刺激肌肤；不引发粉刺；主要成分: \r\n・儿茶酚，含有从绿茶中萃取的具有抗氧化作用的活性成分\r\n・5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n・海洋深层水使用方法：\r\n卸妆、洁面合为一步的温和洁颜油，用于卸妆，包括卸除防水睫毛膏，同时清洁、滋润、镇定肌肤。 为达到最好的效果，使用植村秀洁颜油时，请遵照以下简单步骤： \r\n1.按压3~4次于干燥的手心。 \r\n2.在干燥的脸部肌肤轻轻推开。 \r\n3.用少量温水湿润肌肤，帮助乳化(洁颜油会变成乳白色) 。\r\n4.用温水冲洗干净。\r\n5.随后配合使用植村秀的化妆水和乳液。 \r\n\r\n温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。','',0,0,0,0,0,'2012-03-01 15:59:18','2012-03-01 15:59:18',3,0);
INSERT INTO `goods_real` VALUES (96,1,0,0,'Shu Uemura 植村秀','护肤','Shu uemura植村秀樱花洁颜油(粉色37520)(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/8742_M_110818171352_23272530.jpg','a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/8742_M_110818171352_23272530.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/8742_M_110818171424_56824776.jpg\";}',495,'http://www.no5.com.cn/goods/8742.html','8742',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Shu uemura植村秀经典的保湿型高效平衡洁颜油面世近30年，现已成为全球女士最坚信的美容秘诀之一。Shu uemura洁颜油系列凭着卓越的护肤功效，一直在原产地日本占据市场上的领导地位。今天，每30秒就有一瓶洁颜油售出。据SOGO百货统计，Shu uemura的「防晒隔离霜」及「洁颜油」几乎是年年入榜。\r\n采用高效洁颜油系统，此系统结合三种高效洁肤油份：HP-EO及DCC对卸除睫毛膏特别有效，而AB则可有效清除唇膏和粉底。糅合植物精华内一种独特成份，有别于一般传统油质洁肤产品，绝无半点油腻感觉，缔造洁肤后清凉的用后感。 \r\n灵感源自柔美的樱花，触感绝不油腻，加入樱桃萃取物，能促进细胞再生机能，令肌肤展现柔滑细致的肤质。特别注入香熏治疗的元素，将樱花所发出的清雅香气完全融入洁颜油中，带来更舒缓、更畅快的洁肤体验。\r\n用法：\r\n1、在瓶顶按压3-4下，挤出适量的洁颜油于掌中，然后涂于干爽的面部。\r\n2、用指尖将洁颜油均匀地涂于全面，并用指腹轻轻按摩，并加强眼妆及唇彩等较不容易卸除的部位，或是易长粉刺的T字部位。在这过程中，洁颜油可吸去油溶性污垢。\r\n3、双掌沾满清水轻轻按摩面部，直至洁颜油变成乳状。\r\n4、当感觉到洁颜油开始减少，即表示已完全乳化。最后用清水冲洗，你会发现脸上充满清新舒适的洁净感。\r\n5、早晚使用。温馨提示：此产品在运输过程中容易出现压嘴被挤压导致渗漏、瓶身被磨损等现象，因此，我们对压嘴部分做了特殊保护处理，并将瓶身裹上保护膜，请广大用户留意，使用时先将保护纸片和保护膜去除。\r\n&nbsp;','',0,0,0,0,0,'2012-03-01 15:59:19','2012-03-01 15:59:19',3,0);
INSERT INTO `goods_real` VALUES (97,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉矿泉爽肤卸妆乳(900838)','http://photo.no5.com.cn/product/mphoto/20071211182510792190119.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071211182510792190119.jpg\";}',175,'http://www.no5.com.cn/goods/10517.html','10517',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Biotherm Biosource clarifying cleansing milk\r\n新一代洁净因子Ethylhexyl Palmitate，能有效溶解脸部彩妆及污垢。矿泉活性萃取精华(PETP)，能舒缓肌肤。矿物微量组合，促进肌肤新生，重拾活力。浅绿色的乳胶状清爽质地，味道清香，温和无油腻感。 \r\n主要成份: \r\n*洁净因子(Ethylhexyl Palmitate棕榈酸酯)&nbsp;\r\n* 润泽因子(Butylene glycol) \r\n*矿泉活性萃取精华(PETP) \r\n*矿物微量组合 \r\n\r\n适合中性肌肤/混合性肌肤\r\n护肤程序的第一步。','',0,0,0,0,0,'2012-03-01 15:59:20','2012-03-01 15:59:20',3,0);
INSERT INTO `goods_real` VALUES (98,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺小黄瓜卸妆清洁乳(83599)','http://photo.no5.com.cn/product/mphoto/201004041547201015515119.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/201004041547201015515119.jpg\";}',71,'http://www.no5.com.cn/goods/10806.html','10806',0,'','','','','\"小黄瓜汁可以彻底清洁肌肤，尤其可以改善脸部泛红的现象，使脸色更为明亮动人\r\n*质地清爽的清洁乳，可彻底清除脸部的油垢及彩妆，使肌肤透明柔软及光滑\r\n*小黄瓜萃取亦可温和地收敛毛孔，使肌肤清爽而凉爽 \r\n*含有蔬果甘油及棉羊油，能润滑并柔软肌肤\r\n适合中性至油性肌肤。\r\n取适量轻轻在脸上按摩，然后用面纸清洁干净，再使用清洁品洗净即可，最后拍上调理水即可.配合小黄瓜调理水能更有效的收缩毛孔\"','',0,0,0,0,0,'2012-03-01 15:59:20','2012-03-01 15:59:20',3,0);
INSERT INTO `goods_real` VALUES (99,1,0,0,'LOREAL 欧莱雅','护肤','LOREAL 欧莱雅眼部及唇部特效卸妆水(233053)','http://photo.no5.com.cn/product/mphoto/2010102816454062563868.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2010102816454062563868.jpg\";}',69,'http://www.no5.com.cn/goods/11184.html','11184',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','*适用于任何皮肤，能彻底卸除防水的眼部化妆及浓妆，彩妆。\r\n无任何刺激，用后绝不油腻，有效舒缓柔嫩眼部肌肤，补充肌肤水分。 \r\n*不含油脂，基本成分为水。 \r\n*不含香料，PH均衡。 \r\n*温和、无刺激性配方。','',0,0,0,0,0,'2012-03-01 15:59:23','2012-03-01 15:59:23',3,0);
INSERT INTO `goods_real` VALUES (100,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧水洗卸妆泡沫霜(663E)本周特价！','http://photo.no5.com.cn/product/mphoto/20071210152751577957469.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071210152751577957469.jpg\";}',225,'http://www.no5.com.cn/goods/11563.html','11563',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Clinique Rinse-Off Foaming Cleanser\r\n浓缩泡沫的柔润性卸妆品，中性及混合性肌肤适用，能温和快捷地清除持久的妆容。\r\n在开始清洁步骤之前有效清除彩妆和防晒品。令肌肤倍觉滋润，清洁和清新。\r\n令倩碧洁肤皂更有效发挥作用，令肌肤倍觉滋润清洁和清新。含有甘菊精华，效果持久。\r\n\r\n使用方法：弄湿脸部和手，挤适量于手掌中，揉搓使之成泡沫状，在脸部轻轻按摩，然后用清水洗净。接着使用护肤三步骤。','',0,0,0,0,0,'2012-03-01 15:59:23','2012-03-01 15:59:23',3,0);
INSERT INTO `goods_real` VALUES (101,1,0,0,'Kose 高丝','护肤','Kose 高丝清肌晶卸妆油','http://photo.no5.com.cn/product/mphoto/2007122011262842854327.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007122011262842854327.jpg\";}',168,'http://www.no5.com.cn/goods/14019.html','14019',0,'','','','','新技术修复保湿成分和4种汉方植物精油和植物成分的配合，在保持肌肤原有的柔软，弹力感的基础上保持良好的手感。4种汉方植物精油名：米苡仁精油，桃仁精油，红花草精油，油溶性甘草精油。经常使用就会在无形中使自己的肌肤变得健康，滑爽细腻。肌肤的皲裂，座疮，容易出疹等现象都可以得到改善。传承药用清肌晶的奇妙芳香，给人产生愉悦轻松的美妙感觉。  使用后肌肤清爽不油腻，呈现应有的光采，乳化效果佳，不会在脸上留下不清爽油腻感，是最佳的卸妆产品。本产品洁肤能力超卓，涂上面后再加少许按摩，化妆品会自动浮上表面与油混合，更易清除。  防水型等不易卸除的彩妆料、毛孔粉刺、造成晦暗肌肤的含麦拉淋色素老废角质等，都可溶解浮出，创造高透明感、柔嫩肌肤的洗颜效果。采用新技术，并藉由添加4种汉方植物油质＆成分的力量，维持肌肤柔嫩与润泽。温和的肌肤触感，给予质感佳的使用感。\r\n基质呈现薏仁油的天然黄色，无添加色素。不易从指尖滴落的冻胶状基质，可滑溜、顺畅地融合于肌肤。  持续使用，创造不易产生干荒、青春痘、粉刺的健康肤质，展现护肤的效果。将清爽洁净感的高丝 清肌晶（洗颜皂）的香气完整呈现，给予舒畅的气息。推荐与高丝 清肌晶（洗颜皂）搭配使用。  使用方法:\r\n于干燥的掌心约按压压嘴2次的量（约2ml左右），以指尖与彩妆料充分融合后，用清水或温水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:59:24','2012-03-01 15:59:24',3,0);
INSERT INTO `goods_real` VALUES (102,1,0,0,'DHC 蝶翠诗','护肤','DHC橄榄深层卸妆油(日本版全新上市)','http://photo.no5.com.cn/product/mphoto/20071210162326577957469.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071210162326577957469.jpg\";}',77,'http://www.no5.com.cn/goods/14861.html','14861',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深入毛孔、彻底去除污垢的植物性天然油 \r\n洁净无垢的肌肤，是保持肌肤光泽、塑造美丽彩妆的基础。以优质橄榄精华油为主要成分的DHC深层卸妆油虽是“油类”，但又具有水溶性，可用清水完全洗净，是一种划时代的卸妆品。可迅速溶解难以脱落的彩妆，并渗透到毛孔内，让堆积的不洁皮脂、老化角质自然浮出，彻底清除毛孔内污垢。污垢和卸妆油混合之后，可用清水彻底冲净，清爽不油腻。内含的植物成分温和无刺激，是超人气卸妆品。不化妆的人士也可安心使用，建议一周使用1~2次，以画圈按摩的方式去除肌肤污垢、鼻部黑头、老化角质等。 \r\n&nbsp;\r\nDHC的独到之处&nbsp;&nbsp;&nbsp; \r\n与彩妆混合时为亲油性，与水接触后即转变为亲水性，虽为油类却可以用水冲洗干净。保管时请注意瓶内不要进水。 \r\n&nbsp;\r\n深层卸妆油除了以与皮脂构造相似的橄榄精华油为主要成分之外，还含有被称为“天然抗生物”的迷迭香、甘草诱导体以及维生素E，是纯植物性卸妆油。在给予肌肤温柔呵护的同时，使造成肌肤粗糙的角栓及毛孔中的黑头很容易地自然浮出，达到彻底清洁的效果。 \r\n按摩效果可使肌肤变得水润、透明。 \r\n&nbsp;\r\n使用方法：&nbsp;&nbsp; \r\n1. 按压喷头2~3次，取适量于干燥的掌心。用掌心温度使其温热，涂抹于面部并轻轻按摩，使卸妆油与彩妆污垢充分融合。最后卸除重点彩妆，可避免彩妆污垢扩散。 \r\n2. 20~30秒后，用清水或温水冲洗干净。 \r\n3. 之后，请务必用洁面用品洗脸。油性/青春痘肌肤请使用纯榄芦荟皂，敏感性肌肤请使用纯榄修护皂，其他肤质请使用纯榄滋养皂。','',0,0,0,0,0,'2012-03-01 15:59:25','2012-03-01 15:59:25',3,0);
INSERT INTO `goods_real` VALUES (103,1,0,0,'ito 一朵','护肤','ito 一朵左旋C-深层温柔卸妆液','http://photo.no5.com.cn/product/mphoto/20071212141424792337887.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071212141424792337887.jpg\";}',52,'http://www.no5.com.cn/goods/14964.html','14964',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','肌肤在最干净的状态下，保养品才能更好地吸收渗透。当面部肌肤每日面对着外界的污染空气、粉尘污垢、彩妆及各种污染源时，如果长期清洁不当，毛孔粗大面疱、晦暗等肌肤问题就会在面部体现，所以清洁必须从卸妆开始。\r\n1、亲水亲油配方的小分子深入毛孔，对于不易卸净彩妆及深层污垢都能有效卸除，并在卸妆同时滋润保养肌肤，卸妆后肌肤不紧绷，长时间不油腻。\r\n2、超清爽的质地，卸妆后肌肤清爽舒适，呼吸顺畅无负担。\r\n3、深层彻底洁净，粉尘彩妆不残留，洗时不油腻，洗后不干涩。\r\n4、毛孔粗大、肤色晦暗等问题的根本解决方案。\r\n4、性质温和的全能卸妆液，适合眼、唇部卸妆及脸部全效卸妆。  产品成分：\r\n左旋维他命C　 天苎葵精油　天然氨基酸　葡萄籽萃取精华　黄瓜萃取液　甘草萃取液　洋甘菊  适合肌肤：适合各类肤质使用　  使用方法：\r\n1、保持手部、面部干燥，取适量于脸部充分与彩妆、污垢融合，再以清水冲净；或用纸巾沾取适量，轻轻擦拭，再以清水冲净。\r\n2、外出可准备沾取的纸巾，或无纺布，随时随地可使用。  &nbsp;','',0,0,0,0,0,'2012-03-01 15:59:25','2012-03-01 15:59:25',3,0);
INSERT INTO `goods_real` VALUES (104,1,0,0,'DHC 蝶翠诗','护肤','DHC橄榄深层卸妆油','http://photo.no5.com.cn/product/mphoto/20080425174751175894930.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080425174751175894930.jpg\";}',158,'http://www.no5.com.cn/goods/15098.html','15098',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深入毛孔、彻底去除污垢的植物性天然油 \r\n洁净无垢的肌肤，是保持肌肤光泽、塑造美丽彩妆的基础。以优质橄榄精华油为主要成分的DHC深层卸妆油虽是“油类”，但又具有水溶性，可用清水完全洗净，是一种划时代的卸妆品。可迅速溶解难以脱落的彩妆，并渗透到毛孔内，让堆积的不洁皮脂、老化角质自然浮出，彻底清除毛孔内污垢。污垢和卸妆油混合之后，可用清水彻底冲净，清爽不油腻。内含的植物成分温和无刺激，是超人气卸妆品。不化妆的人士也可安心使用，建议一周使用1-2次，以画圈按摩的方式去除肌肤污垢、鼻部黑头、老化角质等。 \r\n&nbsp;\r\nDHC的独到之处&nbsp;&nbsp;&nbsp; \r\n与彩妆混合时为亲油性，与水接触后即转变为亲水性，虽为油类却可以用水冲洗干净。保管时请注意瓶内不要进水。 \r\n&nbsp;\r\n深层卸妆油除了以与皮脂构造相似的橄榄精华油为主要成分之外，还含有被称为“天然抗生物”的迷迭香、甘草诱导体以及维生素E，是纯植物性卸妆油。在给予肌肤温柔呵护的同时，使造成肌肤粗糙的角栓及毛孔中的黑头很容易地自然浮出，达到彻底清洁的效果。 按摩效果可使肌肤变得水润、透明。 \r\n&nbsp;\r\n使用方法&nbsp;&nbsp;&nbsp; \r\n1.按压喷头2-3次，取适量于干燥的掌心。用掌心温度使其温热，涂抹于面部并轻轻按摩，使卸妆油与彩妆污垢充分融合。最后卸除重点彩妆，可避免彩妆污垢扩散。 \r\n2.20-30秒后，用清水或温水冲洗干净。 \r\n3.之后，请务必用洁面用品洗脸。油性/青春痘肌肤请使用纯榄芦荟皂，敏感性肌肤请使用纯榄修护皂，其他肤质请使用纯榄滋养。','',0,0,0,0,0,'2012-03-01 15:59:26','2012-03-01 15:59:26',3,0);
INSERT INTO `goods_real` VALUES (105,1,0,0,'Guerlain 娇兰','护肤','Guerlain 娇兰伊诗美鲜花精华洁面霜(60302)','http://photo.no5.com.cn/product/mphoto/20079251641521053383534.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20079251641521053383534.jpg\";}',338,'http://www.no5.com.cn/goods/15347.html','15347',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','质地细嫩柔滑，即使是防水的化妆品，也可以轻松卸除，不仅让肌肤获得舒适柔润的感受，更确实达到保湿的效果，重现亮丽的神采。\r\n\r\n性质温和，能彻底卸除各种化妆，舒缓和滋润皮肤，令肌肤回复光采和舒适。含锦葵、鸢尾兰、玫瑰、山渣及百合等五种鲜花精粹及抗敏舒缓因子，能及时舒缓镇静肌肤的敏感与不适，能彻底消除防水性彩妆，提供肌肤所需养分，增加温柔防护膜，长期使用，可帮助调节肌肤防卫系统，强化天然防御力。  使用方法：每晚将洁面霜涂在面部与颈部，以指腹轻轻按摩肌肤表面，再以温水冲洗，或以化妆棉或柔软的面纸拭净。','',0,0,0,0,0,'2012-03-01 15:59:27','2012-03-01 15:59:27',3,0);
INSERT INTO `goods_real` VALUES (106,1,0,0,'Guerlain 娇兰','护肤','Guerlain 娇兰伊诗美鲜花精华洁面乳(60300)','http://photo.no5.com.cn/product/mphoto/15348_M_110511113446_54575325.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/15348_M_110511113446_54575325.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/15348_M_110511113505_69384895.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/15348_M_110511113526_40166756.jpg\";}',285,'http://www.no5.com.cn/goods/15348.html','15348',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','质地清淡舒爽，特别针对适合唇、眼与面部细嫩肌肤的配方，即使是防水的化妆品，也可轻松卸除，同步完成深层卸妆与滋润，享受温和舒适的呵护，让肌肤恢复自然柔润的光采。\r\n\r\n性质温和，能彻底卸除各种化妆，舒缓和滋润皮肤，令肌肤回复光采和舒适。含锦葵、鸢尾兰、玫瑰、山渣及百合等五种鲜花精粹及抗敏舒缓因子，能及时舒缓镇静肌肤的敏感与不适，能彻底消除防水性彩妆，提供肌肤所需养分，增加温柔防护膜，长期使用，可帮助调节肌肤防卫系统，强化天然防御力。\r\n\r\n使用方法：每晚将洁面乳涂在面部与颈部，以指腹轻轻按摩肌肤表面，再以温水冲洗，或以化妆棉布拭净。  &nbsp;','',0,0,0,0,0,'2012-03-01 15:59:29','2012-03-01 15:59:29',3,0);
INSERT INTO `goods_real` VALUES (107,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉矿泉柔肤卸妆乳(900834)','http://photo.no5.com.cn/product/mphoto/20079281526621696291.jpg','a:1:{i:0;s:63:\"http://photo.no5.com.cn/product/mphoto/20079281526621696291.jpg\";}',218,'http://www.no5.com.cn/goods/15401.html','15401',0,'干性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','移除脸部彩妆及污垢，润泽及柔嫩肌肤。使用后，脸部感觉洁净无比、舒适、平滑及柔软。新一代洁净因子(Ethylhexyl Palmitate)，温和不刺激，能有效溶解脸部彩妆及污垢。甘油及乳油木油，可润泽及补充角质层肌肤的水份，强化干性肌肤的保护屏障。尿囊素及PETP矿泉舒活因子，能舒缓肌肤。矿物微量组合，能补充细胞活力。  主要成份\r\n洁净因子(Ethylhexyl Palmitate棕榈酸酯)\r\n保湿润泽因子(甘油、丁二醇及乳油木油)\r\n舒缓因子(矿泉活性萃取精华及尿囊素)\r\n矿物微量组合(锰镁铜锌钾钠)  使用方法：取适量于脸部四个部位(额头、两颊、下巴)。两手指腹紧贴肌肤，轻轻以划圆方式，将产品均匀推抹开来。以化妆棉轻轻拭去脸上的残妆及污垢。\r\n  适合肤质：适合干性肌肤','',0,0,0,0,0,'2012-03-01 15:59:30','2012-03-01 15:59:30',3,0);
INSERT INTO `goods_real` VALUES (108,1,0,0,'Fancl 无添加','护肤','[Fancl 无添加]速净卸妆液','http://photo.no5.com.cn/product/mphoto/20090303091425560471619.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090303091425560471619.jpg\";}',179,'http://www.no5.com.cn/goods/15430.html','15430',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','采用纳米速净技术，以超微细分子深层卸妆及净化毛孔，深入毛孔将溶性的化妆品彻底洁净，令因化妆而引起的面黄、暗疮、粉刺等问题全部消失；一次就卸除面部以及眼唇部为的所有化妆，遇水一冲即快速乳化脱离肌肤，用感清爽；纳米的超微细分子轻易将化妆品包裹而无需揉擦，椰子保护油在化妆品及肌肤之间形成保护膜，双重呵护肌肤；全天然植物油成分，高效抗氧、防敏、去黄，促进肌肤健康使用方法：\r\n不要湿水,把瓶嘴按下至樽颈2-3次，然后将卸妆液均匀涂在面上。轻按15秒至化妆浮起，再用清水洗净，然后如日常般用洁面粉洁面\r\n&nbsp;','',0,0,0,0,0,'2012-03-01 15:59:31','2012-03-01 15:59:31',3,0);
INSERT INTO `goods_real` VALUES (109,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂导入式洁颜油(37435)','http://photo.no5.com.cn/product/mphoto/15521_M_110720170836_42387367.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/15521_M_110720170836_42387367.jpg\";}',108,'http://www.no5.com.cn/goods/15521.html','15521',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','配合Aqua Synergy成份，滋润软化粗糙肌肤，在卸妆的同时，还能吸附含有黑色素的老化角质，洗后肌肤清、透、嫩，可用化妆棉或面纸拭去，或用清水洗净，手湿湿的也可以卸妆喔！\r\n\r\n添加玻尿酸保湿配方，针对脸部特e干燥的部位，有迅速导入皮肤深层，补充水份的作用！\r\n添加S他命C诱导液，让使用后的皮肤更加透亮白哦！\r\n添加胶原蛋白，让皮肤更健康有弹力，肌肤不留岁月痕迹~让您肌肤看起来更有活力唷！无香料．无着色\r\n&nbsp;&nbsp; \r\n（Auqa Synergy成份：为了使有效成份迅速、有效地深层渗透肌肤，资生堂独自开发研究的一种保湿成份。在AUQALABEL系列产品中均有使用）','',0,0,0,0,0,'2012-03-01 15:59:32','2012-03-01 15:59:32',3,0);
INSERT INTO `goods_real` VALUES (110,1,0,0,'Shu Uemura 植村秀','明星推荐','Shu uemura植村秀绿茶洁颜油(绿色30900)(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/20101018085338440693837.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101018085338440693837.jpg\";}',245,'http://www.no5.com.cn/goods/15535.html','15535',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','“洁颜油之父”植村秀全新呈现兼具深彻洁净力与卓越抗氧化功效的洁颜新品，每日清洁，祛除各种令肌肤加速老化的顽固彩装，皮脂污垢，高效抗氧祛黄，守护青春光彩！效果：\r\n茶多酚提取自绿茶；卓越的抗氧化性能。绿色/木质香味源自西瓜、茉莉花和檀香的舒缓香味。植物油包含荷荷芭油和坚果油，保湿、舒缓肌肤。海洋深层水取于海平面两百米以下的深海。天然成分滋润肌肤，提升通透感，改善肌肤质地。\r\n[超凡净彻] 专利HPO洁颜系统\r\n极速包裹毛孔深处各种传统洁面产品无法祛除的顽固彩妆、脏污；一冲即净，深彻净透，绝无残留！\r\n[双倍抗氧] 绿茶×银杏配方\r\n2种矜贵植物精油，2倍于原配方的添加浓度，预防肌肤氧化，绝迹黯沉黄气！\r\n[温和舒润] 天然植物油分\r\n安全温和，不刺激肌肤；不引发粉刺；主要成分: \r\n・儿茶酚，含有从绿茶中萃取的具有抗氧化作用的活性成分\r\n・5 种植物油(玉米、红花、荷荷巴、澳大利亚坚果以及橄榄油中的角鲨烷）\r\n・海洋深层水使用方法：\r\n卸妆、洁面合为一步的温和洁颜油，用于卸妆，包括卸除防水睫毛膏，同时清洁、滋润、镇定肌肤。 为达到最好的效果，使用植村秀洁颜油时，请遵照以下简单步骤： \r\n1.按压3~4次于干燥的手心。 \r\n2.在干燥的脸部肌肤轻轻推开。 \r\n3.用少量温水湿润肌肤，帮助乳化(洁颜油会变成乳白色) 。\r\n4.用温水冲洗干净。\r\n5.随后配合使用植村秀的化妆水和乳液。','',0,0,0,0,0,'2012-03-01 15:59:32','2012-03-01 15:59:32',3,0);
INSERT INTO `goods_real` VALUES (111,1,0,0,'Shu Uemura 植村秀','明星推荐','Shu uemura植村秀樱花洁颜油(粉色375214)(大S美容大王推荐)','http://photo.no5.com.cn/product/mphoto/15741_M_110720171614_10077950.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/15741_M_110720171614_10077950.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/15741_M_110720171641_66135688.jpg\";}',220,'http://www.no5.com.cn/goods/15741.html','15741',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Shu uemura植村秀经典的保湿型高效平衡洁颜油面世近30年，现已成为全球女士最坚信的美容秘诀之一。Shu uemura洁颜油系列凭着卓越的护肤功效，一直在原产地日本占据市场上的领导地位。今天，每30秒就有一瓶洁颜油售出。据SOGO百货统计，Shu uemura的「防晒隔离霜」及「洁颜油」几乎是年年入榜。\r\n采用高效洁颜油系统，此系统结合三种高效洁肤油份：HP-EO及DCC对卸除睫毛膏特别有效，而AB则可有效清除唇膏和粉底。糅合植物精华内一种独特成份，有别于一般传统油质洁肤产品，绝无半点油腻感觉，缔造洁肤后清凉的用后感。 \r\n灵感源自柔美的樱花，触感绝不油腻，加入樱桃萃取物，能促进细胞再生机能，令肌肤展现柔滑细致的肤质。特别注入香熏治疗的元素，将樱花所发出的清雅香气完全融入洁颜油中，带来更舒缓、更畅快的洁肤体验。\r\n用法：\r\n1、在瓶顶按压3-4下，挤出适量的洁颜油于掌中，然后涂于干爽的面部。\r\n2、用指尖将洁颜油均匀地涂于全面，并用指腹轻轻按摩，并加强眼妆及唇彩等较不容易卸除的部位，或是易长粉刺的T字部位。在这过程中，洁颜油可吸去油溶性污垢。\r\n3、双掌沾满清水轻轻按摩面部，直至洁颜油变成乳状。\r\n4、当感觉到洁颜油开始减少，即表示已完全乳化。最后用清水冲洗，你会发现脸上充满清新舒适的洁净感。\r\n5、早晚使用。','',0,0,0,0,0,'2012-03-01 15:59:33','2012-03-01 15:59:33',3,0);
INSERT INTO `goods_real` VALUES (112,1,0,0,'Kose 高丝','护肤','Kose 高丝玻尿酸保湿卸妆凝冻(美丽教主伊能静推荐）','http://photo.no5.com.cn/product/mphoto/200711817328181945883.jpg','a:1:{i:0;s:64:\"http://photo.no5.com.cn/product/mphoto/200711817328181945883.jpg\";}',55,'http://www.no5.com.cn/goods/15751.html','15751',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','独特的冻胶质地，卸妆同时也能深层清洁毛孔！含玻尿酸及薏仁精华，肌肤水嫩净白透明度。干湿两用超方便超好卸，清爽肌肤零负担！  SUPER 冻胶状，特别的卸妆冻，能够深层卸除毛孔中的污垢，无论是彩妆或是难以卸除之睫毛膏等，都能轻松除去!本产品无着色、无香料、弱酸性。富含玻尿酸保湿成分配合，照顾脸部肌肤，卸妆同时也嫩白保湿！使用时，湿湿的手也可沾取使用，没有一般卸妆油的限制不便。无着色、无香料、弱酸性；独特的果冻质地，卸妆同时也能深层清洁毛孔含玻尿酸及薏仁精华，使肌肤水嫩嫩。轻轻松松便能卸除脸上彩妆，睫毛膏，就连上毛细孔内脏污也能解且轻易卸除，温和不伤肌肤。  用途：快速洁净脸部肌肤用  适用肤质：任何类型肌肤都可使用，尤其适合不喜欢卸妆油油腻感觉，希望全部卸除面部和眼部彩妆，并带有清爽补水感觉的使用。  使用方法：轻适量均匀洁净按摩脸部肌肤后，再以清水充分洗净即可。  注意事项：请放置远离高温及火气之处/取用时，请勿重力按压，本产品为卸妆冻性质，用力按压易成液状。使用后，请确实回盖瓶盖。  &nbsp;','',0,0,0,0,0,'2012-03-01 15:59:34','2012-03-01 15:59:34',3,0);
INSERT INTO `goods_real` VALUES (113,1,0,0,'Kose 高丝','护肤','Kose 高丝清肌晶卸妆油(21119)','http://photo.no5.com.cn/product/mphoto/2007112015217288647611.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007112015217288647611.jpg\";}',265,'http://www.no5.com.cn/goods/15924.html','15924',0,'','','','','新技术修复保湿成分和4种汉方植物精油和植物成分的配合，在保持肌肤原有的柔软，弹力感的基础上保持良好的手感。4种汉方植物精油名：米苡仁精油，桃仁精油，红花草精油，油溶性甘草精油。经常使用就会在无形中使自己的肌肤变得健康，滑爽细腻。肌肤的皲裂，座疮，容易出疹等现象都可以得到改善。传承药用清肌晶的奇妙芳香，给人产生愉悦轻松的美妙感觉。  使用后肌肤清爽不油腻，呈现应有的光采，乳化效果佳，不会在脸上留下不清爽油腻感，是最佳的卸妆产品。本产品洁肤能力超卓，涂上面后再加少许按摩，化妆品会自动浮上表面与油混合，更易清除。  防水型等不易卸除的彩妆料、毛孔粉刺、造成晦暗肌肤的含麦拉淋色素老废角质等，都可溶解浮出，创造高透明感、柔嫩肌肤的洗颜效果。采用新技术，并藉由添加4种汉方植物油质＆成分的力量，维持肌肤柔嫩与润泽。温和的肌肤触感，给予质感佳的使用感。\r\n基质呈现薏仁油的天然黄色，无添加色素。不易从指尖滴落的冻胶状基质，可滑溜、顺畅地融合于肌肤。  持续使用，创造不易产生干荒、青春痘、粉刺的健康肤质，展现护肤的效果。将清爽洁净感的高丝 清肌晶（洗颜皂）的香气完整呈现，给予舒畅的气息。推荐与高丝 清肌晶（洗颜皂）搭配使用。  使用方法:\r\n于干燥的掌心约按压压嘴2次的量（约2ml左右），以指尖与彩妆料充分融合后，用清水或温水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:59:34','2012-03-01 15:59:34',3,0);
INSERT INTO `goods_real` VALUES (114,1,0,0,'Avene 雅漾','护肤','Avene 雅漾舒润卸妆水','http://photo.no5.com.cn/product/mphoto/200712121757101006369399.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200712121757101006369399.jpg\";}',205,'http://www.no5.com.cn/goods/16040.html','16040',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','专为敏感性肌肤设计的配方，柔和洁肤，无需冲洗。富含具有舒缓、抗刺激特性的雅漾活泉水。含透明质酸钠，有效保湿。\r\n\r\n成分：雅漾活泉水96%；透明质酸钠0.01%；混合红没药醇0.05%；柔和表面活性物质。适用范围：适用于敏感皮肤的清洁和卸妆。\r\n\r\n使用方法：用化妆棉蘸取适量本品，擦拭脸部和颈部，无需冲洗，然后喷雾雅漾活泉水。可适用于眼部和唇部的洁肤卸妆。','',0,0,0,0,0,'2012-03-01 15:59:38','2012-03-01 15:59:38',3,0);
INSERT INTO `goods_real` VALUES (115,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo温和保湿卸妆油(31132)','http://photo.no5.com.cn/product/mphoto/20100525155245376214444.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100525155245376214444.jpg\";}',72,'http://www.no5.com.cn/goods/16435.html','16435',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','softymo卸妆油含天然保湿成分，有效御除面部及眼部化妆，温和不刺激成份，保护细嫩脆弱肌肤，清爽柔软。能轻易去除脸部老旧角质与彩妆，能深入脸上细微处，将囤积在毛孔与肌肤的污垢去除。不论是皮脂、彩妆、汗水或灰尘，不论是亲油性或亲水性的污垢，都能一次洗净。清除黑头、白头，预防粉刺黑头的生成。让肌肤澄净白皙，使用后肌肤呈现应有的光采，是最佳的卸妆产品！帮助肌肤维持稳定及健康状态，增强肌肤抵抗力，肌肤越发光彩明丽，充满动人的朝气。轻松帮带走厚重彩妆，眼、唇妆轻松卸下，毛穴的污垢也能温和带走，让的脸清清爽爽不紧绷，甩掉一日的负担。使用方法：轻轻挤压适量于掌心，于全脸均匀涂抹，以指腹按摩脸部肌肤30秒，并加强眼部与唇部，待彩妆与污垢角质浮出，即可以清水冲洗，擦干后即完成卸妆动作。\r\n&nbsp;','',0,0,0,0,0,'2012-03-01 15:59:39','2012-03-01 15:59:39',3,0);
INSERT INTO `goods_real` VALUES (116,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP黑竹深层清洁眼唇卸妆液(01960)','http://photo.no5.com.cn/product/mphoto/16527_M_110328155502_63383613.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/16527_M_110328155502_63383613.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/16527_M_110328155530_58538643.jpg\";}',55,'http://www.no5.com.cn/goods/16527.html','16527',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','【产品介绍】\r\nTHE FACE SHOP 黑竹眼唇深层卸妆液含有竹枝液提取物、马齿苋提取物、海藻提取物等天然植物成分，温和卸妆，深层清洁，完全去除彩妆不伤皮肤。【使用方法】\r\n用化妆棉蘸取本品适量，轻轻擦拭眼唇部位，然后用温水洗净。&nbsp;','',0,0,0,0,0,'2012-03-01 15:59:40','2012-03-01 15:59:40',3,0);
INSERT INTO `goods_real` VALUES (117,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳海洋清洁ㄠ(156)','http://photo.no5.com.cn/product/mphoto/2009011017410251471608.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009011017410251471608.jpg\";}',175,'http://www.no5.com.cn/goods/1638.html','1638',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含丰富的海洋植物成分和维他命，性质温和。有效清洁面部肌肤，卸妆并去除油脂尘垢。润肤粒子在清洁之余能够帮助肌肤锁住水份，使肌肤更加润滑。&nbsp; \r\n&nbsp;\r\n适用所有肌肤。&nbsp;&nbsp;\r\n&nbsp;\r\n使用方法：&nbsp; \r\n取适量加水揉出泡沫，涂于面部，并用指尖适度按摩，然后用清水洗净即可。','',0,0,0,0,0,'2012-03-01 15:59:40','2012-03-01 15:59:40',3,0);
INSERT INTO `goods_real` VALUES (118,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉净肤控油洁面泡沫','http://photo.no5.com.cn/product/mphoto/6342_M_120223113447_17838417.jpg','a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/6342_M_120223113447_17838417.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/6342_M_120223113459_80608802.jpg\";}',139,'http://www.no5.com.cn/goods/6342.html','6342',0,'','','','','功效:不含皂素的清洁因子深入清洁毛孔，疏通并收敛毛孔.质地柔和，泡沫细腻，易于冲洗，使用后令皮肤洁净、柔软，不会紧绷\r\n特别适用于油性敏感性皮肤\r\n主要成分:\r\nGlycacil：抗菌因子\r\nZinc pidolate ：去除多余油脂','',0,0,0,0,0,'2012-03-01 15:59:41','2012-03-01 15:59:41',3,0);
INSERT INTO `goods_real` VALUES (119,1,0,0,'Estee Lauder 雅诗兰黛','护肤','Estee Lauder雅诗兰黛红石榴鲜活营养二合一洁面泡沫(9CK4)','http://photo.no5.com.cn/product/mphoto/200904171753201007227925.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200904171753201007227925.jpg\";}',225,'http://www.no5.com.cn/goods/14216.html','14216',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合肤质： 适合所有肌肤Estee Lauder雅诗兰黛红石榴鲜活营养二合一洁面泡沫，将阻碍美肌的表面杂质统统洗走!\r\n\r\n使用方法：\r\n1、早上可用作轻柔的洁面泡沫；晚间敷用5分钟作简单面膜。\r\n2、配合磁力矿物泥等成分，即能中和刺激、污染及阻塞毛孔的杂质。以清水洗净后，享受肌肤洁净轻柔的新一面。','',0,0,0,0,0,'2012-03-01 15:59:42','2012-03-01 15:59:42',3,0);
INSERT INTO `goods_real` VALUES (120,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧柔性液体洁面皂(6GOR)','http://photo.no5.com.cn/product/mphoto/20081008175857599546348.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081008175857599546348.jpg\";}',168,'http://www.no5.com.cn/goods/18066.html','18066',0,'干性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','倩碧护肤三步骤中第一步，适合干性肌肤使用。此款为温和的洁面乳，能满足干性肌肤的需要。用后肌肤洁净舒爽，不紧绷。每日早晚两次。','',0,0,0,0,0,'2012-03-01 15:59:42','2012-03-01 15:59:42',3,0);
INSERT INTO `goods_real` VALUES (121,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP黑莓桑葚去黑头洗面奶(01029)','http://photo.no5.com.cn/product/mphoto/20100504155423955367701.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100504155423955367701.jpg\";}',42,'http://www.no5.com.cn/goods/21402.html','21402',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','这款桑葚泡沫洗面奶特有植物萃取物针对讨厌的黑头所设计，有效清除黑头，还能彻底清洗油腻污垢和化妆品使肌肤干净柔软 桑葚薏仁和黑米萃取物富含抗衰老物质让肌肤看上去健康光泽。\r\n\r\n黑莓鲜果中糖维生素C、维生素B1、维生素B2、有机酸、粗蛋白、维生素K和氨基酸，其中维生素E含量是所有栽培和野生、半野生果树中最高的，而硒含量在果树中罕见。氨基酸共有18种，8种必需氨基酸都有，且含量较高，还富含γ-氨基丁酸。对人体至关重要的6种矿质元素（钾钙钠镁锌铁）含量也较高。维生素E能够保护细胞和细胞内部结构的完整，防止某些酶和细胞内部成分遭到破坏，延缓衰老；硒能抗氧化、防衰老，提高免疫力，与维生素E共同起排毒提供保护剂作用。使用方法：取适量于手中加水揉出泡沫按摩脸部再以温水洗净。','',0,0,0,0,0,'2012-03-01 15:59:43','2012-03-01 15:59:43',3,0);
INSERT INTO `goods_real` VALUES (122,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺茶树洁面胶(13539)','http://photo.no5.com.cn/product/mphoto/20100525154854376214444.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100525154854376214444.jpg\";}',83,'http://www.no5.com.cn/goods/10808.html','10808',0,'','','','','英国库克船长(Captain Cook 1728-1779)相信，用Melaleuca或Leptospermen的叶子来泡茶，可以防止坏血症，并且命令他的船员喝这种含有茶树精油的茶，这就是”茶树”油名字的由来。\r\n* 一种非常温和不刺激肌肤的 脸部洁面胶，适合各个年龄层的男女使用，尤适合易患有问题肌肤的人。 \r\n* 含有镇静及杀菌功效的茶树精油，能深层洁净毛孔污垢，控制脸部异常出油，亦能帮助防止面疱、粉刺的产生。 \r\n* 甘油是一种天然的保湿剂，能帮助肌肤防止水分的丧失，这是油性及问题肌肤经常洗脸后，常有肌肤缺水的现象。 \r\n* 含熏衣草及迷迭香精油，有镇静肌肤的功效。 \r\n* 含有荨麻萃取精华，有振奋的效果，是一种天然的收敛剂，能改善肤色。\r\n适合肤质：适合中性肌肤、油性肌肤或者问题肌肤。\r\n早晚卸妆后，取适量于手心上，轻柔的用打圈方式按摩于全脸，再以温水清洗干净即可。\r\n注意事项：请避开眼睛使用，如不甚接触眼睛，请以清水冲洗','',0,0,0,0,0,'2012-03-01 15:59:44','2012-03-01 15:59:44',3,0);
INSERT INTO `goods_real` VALUES (123,1,0,0,'CETAPHIL 丝塔芙','护肤','CETAPHIL丝塔芙洁面乳(号称全世界最最温和的洗面乳--敏感肌肤必备)','http://photo.no5.com.cn/product/mphoto/14157_M_120227165059_27410256.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/14157_M_120227165059_27410256.jpg\";}',78,'http://www.no5.com.cn/goods/14157.html','14157',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不含皂，无刺激性清洁成分，柔和清洁。 \r\n弱酸配方，接近人体正常肌肤需求。 \r\n不含香料、色素，无刺激，安全适用于敏感肌肤。 \r\n清洗后留有薄薄一层保护膜，给肌肤即刻柔润保护。 \r\n水洗、干洗皆宜。 适用人群\r\n健康肌肤的日常清洁护理 \r\n一般敏感及脆弱肌肤（干燥、痤疮类肌肤；对水质敏感类肌肤） \r\n婴幼儿肌肤（正常或患有皮炎湿疹的婴幼儿肌肤） \r\n使用皮肤药物时而引起皮肤干燥蜕皮的患者； 使用方法：\r\n干水洗两用：独特免洗配方，可直接干洗，方便又安心。 \r\n轻松卸妆：卸除淡妆，一步搞定，可多次卸妆不伤害肌肤。','',0,0,0,0,0,'2012-03-01 15:59:45','2012-03-01 15:59:45',3,0);
INSERT INTO `goods_real` VALUES (124,1,0,0,'CETAPHIL 丝塔芙','护肤','CETAPHIL丝塔芙洁面乳(号称全世界最最温和的洗面乳--敏感肌肤必备)','http://photo.no5.com.cn/product/mphoto/14198_M_120227165123_46420723.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/14198_M_120227165123_46420723.jpg\";}',47,'http://www.no5.com.cn/goods/14198.html','14198',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不含皂，无刺激性清洁成分，柔和清洁。 \r\n弱酸配方，接近人体正常肌肤需求。 \r\n不含香料、色素，无刺激，安全适用于敏感肌肤。 \r\n清洗后留有薄薄一层保护膜，给肌肤即刻柔润保护。 \r\n水洗、干洗皆宜。 适用人群\r\n健康肌肤的日常清洁护理 \r\n一般敏感及脆弱肌肤（干燥、痤疮类肌肤；对水质敏感类肌肤） \r\n婴幼儿肌肤（正常或患有皮炎湿疹的婴幼儿肌肤） \r\n使用皮肤药物时而引起皮肤干燥蜕皮的患者； 使用方法：\r\n干水洗两用：独特免洗配方，可直接干洗，方便又安心。 \r\n轻松卸妆：卸除淡妆，一步搞定，可多次卸妆不伤害肌肤。','',0,0,0,0,0,'2012-03-01 15:59:45','2012-03-01 15:59:45',3,0);
INSERT INTO `goods_real` VALUES (125,1,0,0,'Estee Lauder 雅诗兰黛','护肤','Estee Lauder雅诗兰黛柔丝焕采洁面霜(1Y1J)','http://photo.no5.com.cn/product/mphoto/20090113174956585392876.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090113174956585392876.jpg\";}',205,'http://www.no5.com.cn/goods/11220.html','11220',0,'干性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','ESTEE LAUDER Soft Clean Moisture Rich Foaming Cleanser\r\n为干性肌肤量身订制的清洁产品。 \r\n\r\n丰润醇厚的洁面霜能继而形成富含水份的泡沫，温柔地清洁肌肤，同时又镇静并柔软肌肤。为您带来无与伦比的满足感。\r\n\r\n柔丝焕采系列为干性肌肤提供了质地温和，效果显着的清洁配方，维护肌肤自身的保湿屏障，补充水份，调理肌肤。由西番莲，火绒草等舒缓性植物萃取精华组成的混合物，能镇静并柔软肌肤，令干性肌肤感受到清洁后前所未有的舒适。 \r\n&nbsp;\r\n功效：雅诗兰黛的洁肤产品拥有柔和的色彩，顺滑的质地，迷人的清香，让您的感官觉得清新振奋。每天使用两次，作为您护理肌肤的第一个步骤。令您的肌肤达到最佳状态，能最大限度的吸收后续的滋润品，给您带来焕然一新的健康外观。&nbsp;\r\n&nbsp;\r\n使用方法: 先打湿双手，将柔丝焕采洁面霜倒于掌心并磨出泡沫，以打圈方式在全脸按摩，然后用温水洗净。每天早晚各使用一次，继而使用柔丝焕采化妆水，然后再使用修护类产品。  &nbsp;  &nbsp;  &nbsp;','',0,0,0,0,0,'2012-03-01 15:59:46','2012-03-01 15:59:46',3,0);
INSERT INTO `goods_real` VALUES (126,1,0,0,'ito 一朵','护肤','ito 一朵茶树泡沫洁颜露','http://photo.no5.com.cn/product/mphoto/20071212141327792337887.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071212141327792337887.jpg\";}',39,'http://www.no5.com.cn/goods/11700.html','11700',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','【商品说明】：\r\n－－含天然茶树精油成分，独特的泡沫、质感细纹、轻柔，能充分洁净肌肤多余油脂与污垢，让洗后肤质清爽、不紧绷；\r\n－－能用于洗脸同时，改善原有的痘痘、粉刺、油脂分泌旺盛等肌肤问题；\r\n－－天天使用令面部肌肤水嫩、清爽、无油光、零负担；\r\n【主要成分】：\r\n1、茶树精油：抗菌防粉刺、抑制油脂过度分泌；\r\n2、天然保湿因子：含胺基酸，维持细胞水分含量正常，使肌肤柔软饱水；\r\n3、尿囊素：促进细胞增生，具修复作用；\r\n4、独特温和洁肤因子：不刺激，适合敏感性肌肤使用；\r\n5、海藻萃取液：可提供皮肤细胞再生能量，有助肌肤修护镇静功能；\r\n6、精氨酸：肌肤中不可或缺的氨基酸，能平衡肌肤酸碱值，提供细胞能量来源；\r\n7、金缕梅萃取液：具自然收敛性、嫩白、保护肌肤调节皮脂分泌及促进血管收缩作用；\r\n8、芦荟萃取液：含丰富维生素、微量元素及天然保湿成分，具有安抚、舒缓、及修复痘痘作用，并可安抚晒后泛红之肌肤；\r\n【使用方法】：\r\n茶树泡沫洁颜露→化妆水（或喷雾）→去痘修复精华素','',0,0,0,0,0,'2012-03-01 15:59:46','2012-03-01 15:59:46',3,0);
INSERT INTO `goods_real` VALUES (127,1,0,0,'Avene 雅漾','护肤','Avene 雅漾清爽洁肤凝胶','http://photo.no5.com.cn/product/mphoto/20071261746351008881949.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071261746351008881949.jpg\";}',158,'http://www.no5.com.cn/goods/12605.html','12605',0,'','','','','适用范围\r\n青春期、油性痤疮敏感性皮肤。成分\r\n雅漾活泉水56%\r\n葡糖酸锌0.3% \r\n南瓜子油0.1%\r\n西曲溴铵0.05%\r\n甘油4%\r\n咪唑烷基脲\r\n柔和清洁剂（阴离子、非离子、两性表面活性剂）功效\r\n对有青春期、油性问题的皮肤进行清洁和卸妆。\r\n三种活性成分结合在一起产生的完整的作用：\r\n缓解炎症\r\n调节油脂分泌\r\n净化肌肤\r\n清爽的凝胶质地：使皮肤洁净。\r\n无皂基：维持皮肤的pH。使用方法\r\n将面部打湿后取1圆硬币大小产品与手心，有手指揉搓至有泡沫产生，均匀地在湿润的脸部打圈清洁，用清水彻底冲洗干净，使用雅漾舒护活泉水镇定肌肤。\r\n\r\n注意事项\r\n避免在皮肤破损处，触及洁面乳。\r\n如果皮肤有过敏或者不耐受现象，需要使用雅漾修护洁面乳。','',0,0,0,0,0,'2012-03-01 15:59:47','2012-03-01 15:59:47',3,0);
INSERT INTO `goods_real` VALUES (128,1,0,0,'Laneige 兰芝','护肤','Laneige 兰芝紧致毛孔深层洁面泡沫','http://photo.no5.com.cn/product/mphoto/20100714112020633603259.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100714112020633603259.jpg\";}',125,'http://www.no5.com.cn/goods/12625.html','12625',0,'','','','','蕴含的睡莲、鸢尾草、金缕梅萃取物有效去除残余彩妆和环境污染带给肌肤的有害成分，净化毛孔内的代谢物，镇静肌肤。  具有卓越肌肤调理效果的三氯生和柳树皮萃取物清洁肌肤，护理毛孔问题。  白色颗粒柔和的去除毛孔内的代谢物，而蓝色胶囊中含有的维生素E成分，被肌肤吸收，缔造光滑、健康的肌肤。  使用方法：取3CM左右的泡沫于掌心，加水揉出丰富泡沫后，按摩肌肤。最后用温水清洗干净即可。','',0,0,0,0,0,'2012-03-01 15:59:48','2012-03-01 15:59:48',3,0);
INSERT INTO `goods_real` VALUES (129,1,0,0,'Zogu 昭贵','护肤','Zogu 昭贵雪肤润白洁面乳','http://photo.no5.com.cn/product/mphoto/12645_M_110401163714_15311562.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/12645_M_110401163714_15311562.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/12645_M_110401163730_75883308.jpg\";}',31,'http://www.no5.com.cn/goods/12645.html','12645',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于暗沉肌肤。\r\n清洁令肌肤暗沉的代谢沉积物及粉尘。\r\n提亮肤色、增强肌肤光泽。\r\n保护皮脂膜、令肌肤洁净润白。\r\n&#61548; \r\n用法：\r\n取适量揉成泡沫，轻揉肌肤两分钟，清水冲净。成分：\r\n水、库拉索芦荟凝胶汁、月桂醇磷酸酯、椰油酰胺丙基甜菜碱、甘油、月桂基葡糖苷、椰油酰两性基二乙酸二钠、三乙醇胺、乙二醇二硬脂酸酯、丙烯酸（酯）类/硬脂醇聚醚-20甲基丙烯酸酯共聚物、乳酸钠、氢氧化钾、葡萄糖酸钠、EDTA二钠、苯氧乙醇、甲基氯异噻唑啉酮、甲基异噻唑啉酮、甲基二溴戊二晴、香精。对芦荟过敏者请慎用。','',0,0,0,0,0,'2012-03-01 15:59:49','2012-03-01 15:59:49',3,0);
INSERT INTO `goods_real` VALUES (130,1,0,0,'Zogu 昭贵','护肤','Zogu 昭贵紧肤养颜洁面乳','http://photo.no5.com.cn/product/mphoto/12656_M_110401164247_64421821.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/12656_M_110401164247_64421821.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/12656_M_110401164318_57659736.jpg\";}',31,'http://www.no5.com.cn/goods/12656.html','12656',0,'干性,油性,混合性,中性,敏感性','','','','产品特点：\r\n本品不含皂素，细腻温和，帮助加快老化角质脱落，彻底清除面部灰尘及污垢的同时，调节肌肤的油水平衡，加速皮肤的新陈代谢，有效抵抗自由基的氧化，提高皮肤免疫抗衰能力。\r\n&#61548; \r\n适用于松弛、衰老肌肤。\r\n泡沫丰富细腻、温和清洁。\r\n柔软肌肤、改善粗糙，令肌肤紧致有弹性。用法：\r\n取适量揉成泡沫，轻揉肌肤两分钟，清水冲净。芦荟过敏者慎用。功效成份：\r\n【芦荟鲜液】芦荟中蛋白质、钙、镁及维生素C等的协同可促进肌肤内胶原蛋白及弹力蛋白的生成，增强肌肤弹性；维生素B12可促进蛋白质的合成及加强角质代谢，细化粗糙表皮，延缓肌肤衰老。\r\n【优质甘油】最传统、最安全的保湿剂，温和无刺激。补水保湿，提高肌肤含水量。\r\n【氨基酸保湿剂】天然保湿因子，能快速渗入皮肤组织，具有极佳的保湿能力。','',0,0,0,0,0,'2012-03-01 15:59:49','2012-03-01 15:59:49',3,0);
INSERT INTO `goods_real` VALUES (131,1,0,0,'其他护肤品牌','明星推荐','韩国思美兰(白)大米皂(吴佩慈推荐)','http://photo.no5.com.cn/product/mphoto/20090715111657685843787.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090715111657685843787.jpg\";}',15,'http://www.no5.com.cn/goods/13469.html','13469',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','韩国思美兰大米皂（吴佩慈推荐）100克 \r\n从稻粒中提取的 RICE BRAN OIL 是您的皮肤清澈柔嫩。\r\n白米美容皂是用优质大米提炼而成的，rice day 美容香皂是用大米提炼而成的。rice day oil 具有柔软 皮肤的作用：它含有丰富的维生素，蛋白质，植物脂肪和植物纤维有明显的皮肤保湿效果和整顿皮肤的效果。以纯植物成份palm和palm kemel oil理想的配合产生丰富的泡沫柔滑的洗去脸部污垢。  enjoy your rice day!内含优质大米提取物，能够促进皮肤新陈代谢，防止皮肤老化。天然保湿成分，使皮肤更柔嫩，湿润。泡沫柔和丰富，用后皮肤滑爽。\r\n【特点】：含有丰富的维生素、蛋白质、氨基酸、脂肪质、植物纤维等，泡沫丰富，天然大米粉中的净化成份有去除角质的效果，可美容皮肤，使皮肤充满健康和活力。  【成份】:大米糠馏油、棕桐仁油、白米粉，含有约在大米500g中萃取的大米糠馏油（优质大米中富含钙、维生素、必需的氨基酸、硒、食物纤维等  【功效】：大米糠馏油和大米的营养泡沫能起深层去污效果，天然优质大米粉的净化成份有去除角质的效果。大米糠馏油的含量及大米粉（天然净化成分），作用于皮肤美容，帮助皮肤活力和健康）严格选料提炼纯植物性棕榈仁油为主原料，能产生丰富乳脂状的泡沫洗净身体老废物。您永保青春的法宝.','',0,0,0,0,0,'2012-03-01 15:59:50','2012-03-01 15:59:50',3,0);
INSERT INTO `goods_real` VALUES (132,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP杏仁三合一洗面奶(00695)','http://photo.no5.com.cn/product/mphoto/20100504114000955230523.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100504114000955230523.jpg\";}',39,'http://www.no5.com.cn/goods/21412.html','21412',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含有保湿、收敛效果的三种天然植物萃取物(五行草、桑白皮、何首乌)，群杏籽粉末，有效去除老化角质，可达到换肤效果的植物性去角质洗面乳,不但可以有效清洁肌肤鹊睦戏衔镏剩同时使肌肤更加透明光滑。非常温和，具有按摩效果，去角质却一点也不使皮肤紧绷。使用方法：取适量用少量温水揉出丰富的泡沫，将揉出的泡沫用双手按摩于脸部，用温水洗净。','',0,0,0,0,0,'2012-03-01 15:59:51','2012-03-01 15:59:51',3,0);
INSERT INTO `goods_real` VALUES (133,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP橄榄三合一洗面奶(00696)','http://photo.no5.com.cn/product/mphoto/20100504112710955230523.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100504112710955230523.jpg\";}',45,'http://www.no5.com.cn/goods/21413.html','21413',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','减少了清洁的1/3 的时间，皮肤刺激最小化，皮肤负担最小化，维持肌肤健康富有光泽。天然植物性橄榄成分温和的清洁皮肤，含有1/3的保湿剂，在洁面后也不会有紧蹦感的新概念三合一洗面奶。\r\n\r\n丰富而细腻的泡沫，能深层清洁脸部的油脂，污垢及化妆品残留物，并温和去除肌肤老化角质，令肌肤娇嫩净白。独有的橄榄油配方，全天候保持肌肤皮脂膜滋润保湿膜效果的成分有机结合，洁面后亦无紧绷感且保持滋润。使干涩肌肉肤重现生机，并能促进血液循环排出肌肤毒素，防止暗疮形成，令肌肤焕发健康亮泽.使用方法：取适量用少量温水揉出丰富的泡沫，将揉出的泡沫用双手按摩于脸部，用温水洗净。','',0,0,0,0,0,'2012-03-01 15:59:51','2012-03-01 15:59:51',3,0);
INSERT INTO `goods_real` VALUES (134,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP白雪公主水凝雪肌洁面乳(04610)','http://photo.no5.com.cn/product/mphoto/21455_M_111013162737_52641731.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/21455_M_111013162737_52641731.jpg\";}',65,'http://www.no5.com.cn/goods/21455.html','21455',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','The Face Shop白雪公主雪肌系列灵感来自晶莹耀眼的白雪的亮度，特点是在之前的白树系列上提高配方并特别添加天然纯净水分与纯美白雪的高级系列，提升肌肤明亮度与水凝光彩，肤色与肤质更为完美。The Face Shop白雪公主雪肌洁面乳，泡沫细腻丰盈，日常清洁同时可以干净卸除彩妆并且温柔去除皮肤表面老化角质，清洁后的肤色持久闪耀健康白皙的明艳光泽，水凝保湿配方皮肤不紧绷，日复一日缔造娇嫩欲滴宛如白雪公主动人光彩雪肌。全新升级加强配方采用芬兰维他命树萃取天然高效维他命C,由内而外淡化黑色素，一扫肌肤暗沉、色素沉积、粗糙、没有光泽等问题，呈现细腻无暇的水润白皙。添加晶莹天然纯美雪花，加强皮肤的弹力和柔韧，肌肤健康活力。采用日本天然温泉水为基底水，内含多种丰富矿物质，彻底解决干渴肌肤的不适，细腻柔嫩。适合所有肤质，推荐渴望水凝白皙肤质愿望的缺水性肌肤人群。 使用方法：以温水湿润面部皮肤，取少量揉出细腻丰盈泡沫打圈按摩后再以温水彻底清洁。','',0,0,0,0,0,'2012-03-01 15:59:52','2012-03-01 15:59:52',3,0);
INSERT INTO `goods_real` VALUES (135,1,0,0,'AVON 雅芳','护肤','AVON雅芳新活双重嫩颜洁面露','http://photo.no5.com.cn/product/mphoto/20100611152226163021011.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100611152226163021011.jpg\";}',68,'http://www.no5.com.cn/goods/21652.html','21652',0,'干性,油性,混合性,中性,敏感性','','','','一款突破性深层清洁并对抗肌肤老化的洁肤产品，即能清洁脸部，又能让你从洁肤第一步就开启肌肤老化进程，提升肌肤活力和光泽度，使肌肤看上去细滑柔嫩更年轻。  超细微晶颗粒深入肌肤里层，有效深层清洁脸部污垢，并调理肌肤纹理，珍贵嫩颜植物精华，能有效减少脸部细纹，皱纹，暗沉等岁月问题，令肌肤嫩滑充满年轻活力。  温和配方，泡沫丰富幼滑，适用于敏感性肌肤。  使用说明：\r\n每天早晚用水润湿脸部，取适量产品于手心，加少许水揉至泡沫后，双手伴随泡沫轻轻在脸部揉洗并伴以按摩，然后用清水洗净。','',0,0,0,0,0,'2012-03-01 15:59:53','2012-03-01 15:59:53',3,0);
INSERT INTO `goods_real` VALUES (136,1,0,0,'AVON 雅芳','护肤','AVON雅芳萃妍活化洁容霜','http://photo.no5.com.cn/product/mphoto/20100611152636163021011.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100611152636163021011.jpg\";}',55,'http://www.no5.com.cn/goods/21658.html','21658',0,'干性,油性,混合性,中性,敏感性','','','','萃取三重抗衰老植物精华，结合现代科技，促进有效成分迅速渗透，唤醒肌肤活力，全面抗氧化，再现娇嫩细致的青春容颜。  质地温和，泡沫细致丰富，有效深入清洁及舒缓肌肤，再现肌肤年轻光彩。  茴香萃取精华，柔软肌肤，肌肤健康有弹性。  多种肌肤所需氨基酸，有效抗氧化，滋养润泽肌肤。  使用说明：\r\n取适量于掌心，以水起泡后，轻面部，再用水洗净。','',0,0,0,0,0,'2012-03-01 15:59:54','2012-03-01 15:59:54',3,0);
INSERT INTO `goods_real` VALUES (137,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo薏仁透白洗颜泡泡(31569)','http://photo.no5.com.cn/product/mphoto/20100819170459561143553.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100819170459561143553.jpg\";}',62,'http://www.no5.com.cn/goods/21948.html','21948',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','天然美容成分融入肌肤，呈现透明素肌感。  延续以前的按压式泡沫设计，轻轻一压，瞬间就能压出超细滑的浓密泡泡，渗透至深层微小毛细孔中，彻底洁净毛孔、彩妆残污，同时白珍珠成分调理肌肤，令肌肤嫩滑细白。  特有的保湿成分和角质软化成分的配合，温柔洗去角质又滋养皮肤。  细细的洁肤因子能深入除去毛孔污垢，清洁的同时更能去除游离在皮肤表面的有害物质，修护调理肌肤。  含有白珍珠成分配合，洗后肌肤舒适不紧绷。  蕴含天然保湿成份配合，泡i丰富细腻，能彻底洗净面上污垢及化妆品残留，去除老化角质，使肌肤Q白柔滑，保持肌肤水嫩柔软。  去除老废角质，让脸色更透明有光泽。  无香料，无着色。  使用方法：压取适量于掌心，轻轻按摩面部，再用清水洗净。','',0,0,0,0,0,'2012-03-01 15:59:54','2012-03-01 15:59:54',3,0);
INSERT INTO `goods_real` VALUES (138,1,0,0,'其他护肤品牌','护肤','COSME大赏 Rosette Paste粉色洁面膏(痘痘普通肌肤10101)','http://photo.no5.com.cn/product/mphoto/20100819170715561143553.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100819170715561143553.jpg\";}',85,'http://www.no5.com.cn/goods/21953.html','21953',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','皮肤产生问题不仅仅是因为年龄和气候等外部条件，皮肤自身排出的废物没有得到彻底清洁也是一个很大的原因。  这款洁面膏含有天然硫磺成分，具有优秀的去角质和调整肌肤纹理作用，有消炎杀菌抗痘作用，药性成分配方，可防止皮肤粗糙且预防青春痘的产生。  取适量于浴用海绵上使之起泡后搽洗全身，洗后全身感到犹如泡过温泉浴之后那般地滋润，柔滑。  粉色款适合痘痘普通肌肤使用。  使用方法：\r\n因为含有天然硫黄素成分，所以特制具有防止污染的容器。\r\n1、首先打开盖子，然后将中间的塞子拔起。\r\n2、将两手拇指放在出口的两边，两手同时出力挤出适量洗面膏（约0.5cm-1cm)\r\n3、置洗面膏于手心，和水或则温水轻搓起泡后以按摩方式清洗脸部，然后用水冲干净即可。','',0,0,0,0,0,'2012-03-01 15:59:55','2012-03-01 15:59:55',3,0);
INSERT INTO `goods_real` VALUES (139,1,0,0,'其他护肤品牌','护肤','COSME大赏 去痘印神奇夜莺洁面粉(10001)','http://photo.no5.com.cn/product/mphoto/20100819171122561143553.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100819171122561143553.jpg\";}',98,'http://www.no5.com.cn/goods/21955.html','21955',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','它的质地非常的细腻，跟洗面奶的泡沫混合后洗脸，可以将深层毛孔中脏东西彻底的清洗干净，对付鼻子上的黑头也没问题，最让人放心的是它不含有任何化学成分的加入，属于纯天然产品。  日本连续几次COSME排行榜洁面类第二名，对于去豆豆印子有非常好的效果，而且可以美白皮肤、防止肤色暗沉，经常用这个洗脸皮肤会很透亮白皙，润滑，  使用方法：\r\n轻轻倒出大约一下至两下粉，在洁面扑上揉出泡沫，然后抹到脸上洗脸，有豆豆印子的地方，切记一定要用泡沫重点按摩。稍后用水冲洗干净。','',0,0,0,0,0,'2012-03-01 15:59:56','2012-03-01 15:59:56',3,0);
INSERT INTO `goods_real` VALUES (140,1,0,0,'迪豆','护肤','迪豆去黑清爽洁面乳','http://photo.no5.com.cn/product/mphoto/20100910150917159119402.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100910150917159119402.jpg\";}',19,'http://www.no5.com.cn/goods/22121.html','22121',0,'','','','','集清透、抑油、美白为一体。温和清洁油脂、坏损角质，净化毛孔，使未受损的毛孔持续保持健康，从洁面开始，减少痘痘形成机会。\r\n洗去皮肤暗黄问题，帮助回复清爽通透，自然亮白。\r\n由积雪草、香柠檬果、刺海门冬等本草提取物为主构成，与维A、维C、去离子水、甘油、棕榈酸、肉豆蔻酸、硬脂酸、羟丙基纤维素、双咪唑烷基脲、三乙醇胺、鲸蜡醇醚磷酸酯盐，科学配伍。  使用方法：\r\n早晚取适量在打湿的面部轻轻按摩，再以清水洗净。\r\n痘痘部位，需配合迪豆痘速消（祛痘水）使用，快速止痘。','',0,0,0,0,0,'2012-03-01 15:59:56','2012-03-01 15:59:56',3,0);
INSERT INTO `goods_real` VALUES (141,1,0,0,'迪豆','护肤','迪豆抑油补水洁面乳','http://photo.no5.com.cn/product/mphoto/20100910151059159119402.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100910151059159119402.jpg\";}',19,'http://www.no5.com.cn/goods/22125.html','22125',0,'','','','','温和清洁油脂、坏损角质等不洁物，净化毛孔，使未受损的毛孔持续保持健康。\r\n洗去皮肤油光光问题，帮助回复清透、水润。\r\n由茶、薄荷、刺海门冬等本草提取物为主构成，与去离子水、甘油、棕榈酸、肉豆蔻酸、硬脂酸、羟丙基纤维素、双咪唑烷基脲、三乙醇胺、鲸蜡醇醚磷酸酯盐，科学配伍。  使用方法：\r\n早晚取适量在打湿的面部轻轻按摩，再以清水洗净。\r\n痘痘部位，需配合迪豆痘速消（祛痘水）使用，快速止痘。','',0,0,0,0,0,'2012-03-01 15:59:57','2012-03-01 15:59:57',3,0);
INSERT INTO `goods_real` VALUES (142,1,0,0,'相宜本草','护肤','相宜本草 红景天幼白抗氧洁面膏','http://photo.no5.com.cn/product/mphoto/20100913105833689943482.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100913105833689943482.jpg\";}',35,'http://www.no5.com.cn/goods/22139.html','22139',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','特别添加红景天洗净颗粒，吸附污垢，带走老废角质，防止氧化导致的黯黄。\r\n积雪草/白芍药精华带给肌肤白皙、柔嫩的透明感。\r\n泡沫绵密，洁面后清爽滋润，焕发生机。  主要成份：&nbsp; &nbsp;\r\n【红景天】雪域极端气候顽强生长，富含“抗氧化焕白活性因子”，强韧看机黯黄粗糙侵害。\r\n【积雪草/白芍药】美白亮肤。  使用方法：\r\n本品泡沫丰富，只需少量（珍珠大小）于掌心，加水揉匀，在面部稍加按摩，使颗粒溶解，以清水洗净。','',0,0,0,0,0,'2012-03-01 15:59:58','2012-03-01 15:59:58',3,0);
INSERT INTO `goods_real` VALUES (143,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物盈粹系列活肤洁面膏(I号清爽型)','http://photo.no5.com.cn/product/mphoto/20100920143806854903145.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100920143806854903145.jpg\";}',79,'http://www.no5.com.cn/goods/22177.html','22177',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','配合蜜肌活性复合精华，在有效去除多余污垢的同时，保持肌肤滋润。\r\n塑造水润紧致，富有弹性，光透美肌的洁面膏。  能迅速形成浓密丰富的弹力泡沫，其细腻的质地能够温和地洗去污垢及老化角质。\r\n具有令肌肤饱满滋润的洁净效果。  使用方法：\r\n取约1cm置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。','',0,0,0,0,0,'2012-03-01 15:59:58','2012-03-01 15:59:58',3,0);
INSERT INTO `goods_real` VALUES (144,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物盈粹系列活肤洁面膏(II号滋润型)','http://photo.no5.com.cn/product/mphoto/20100920144016854903145.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100920144016854903145.jpg\";}',79,'http://www.no5.com.cn/goods/22181.html','22181',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','配合蜜肌活性复合精华，在有效去除多余污垢的同时，保持肌肤滋润。\r\n塑造水润紧致，富有弹性，光透美肌的洁面膏。  能迅速形成浓密丰富的弹力泡沫，其细腻的质地能够温和地洗去污垢及老化角质。\r\n具有令肌肤倍感饱满滋润的洁净效果。  使用方法：\r\n取约1cm置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。','',0,0,0,0,0,'2012-03-01 15:59:59','2012-03-01 15:59:59',3,0);
INSERT INTO `goods_real` VALUES (145,1,0,0,'御泥坊','护肤','御泥坊 矿物活肤洁面乳(适合油性肤质)','http://photo.no5.com.cn/product/mphoto/20101008143745818619292.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101008143745818619292.jpg\";}',29,'http://www.no5.com.cn/goods/22263.html','22263',0,'','','','','功效：\r\n矿物泥浆能有效吸附毛孔内的污垢和多余油脂，令肌肤呼吸清新自如。 富含多种矿物微量元素，矿物质能有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。有效调节平衡油脂分泌，保湿镇静消炎。成分：\r\n矿物泥浆精华水、去离子水、硬脂酸、丙三醇、月桂酸、肉豆蔻酸、氢氧化钾、月桂酰基谷氨酸钠、香精、聚乙醇合成双酯、活性炭、1，3-二羟甲基-5，5-二甲基乙内酰脲。使用方法： \r\n每天早晚使用。湿润脸部，取适量产品于掌心，用水搓出泡沫，在面部轻轻打圈，再以清水流洗净。矿物质过敏者慎用！','',0,0,0,0,0,'2012-03-01 16:00:00','2012-03-01 16:00:00',3,0);
INSERT INTO `goods_real` VALUES (146,1,0,0,'御泥坊','护肤','御泥坊 矿物润肤洁面乳(适合中干性肤质)','http://photo.no5.com.cn/product/mphoto/20101008143805818619292.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101008143805818619292.jpg\";}',29,'http://www.no5.com.cn/goods/22264.html','22264',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','功效：\r\n富含多种矿物微量元素，矿物质能有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。有效调节平衡油脂分泌，保湿镇静消炎。天然保湿，防止角质层老化。成分：\r\n矿物泥浆精华水、去离子水、异壬酸异壬酯、肉豆蔻酸异丙酯、1,3-丁二醇、单月桂醇磷酸酯、十六十八醇、硬脂酸、甘油硬脂酸酯(和)PEG-100硬脂酸酯、三乙醇胺、聚丙烯酸共聚物、香精、对羟基苯甲酸甲酯、对羟基苯甲酸丙酯、1，3-二羟甲基-5，5-二甲基乙内酰脲。使用方法：\r\n每天早晚使用。湿润脸部，取适量产品于掌心，在面部轻轻打圈，再以清水洗净。矿物质过敏者慎用！','',0,0,0,0,0,'2012-03-01 16:00:00','2012-03-01 16:00:00',3,0);
INSERT INTO `goods_real` VALUES (147,1,0,0,'Kose 高丝','护肤','Kose 高丝雪肌精洁面霜(04849)','http://photo.no5.com.cn/product/mphoto/20101021103035971404841.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101021103035971404841.jpg\";}',238,'http://www.no5.com.cn/goods/22346.html','22346',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深层洁净，清冽体验，肌肤透现澄净美感。\r\n着眼于韩方植物的自然恩赐，赋予肌肤生机与清亮之美。\r\n蕴含具有美白及保湿机能的汉方植物精华，温润地深层洁净肌肤，将各种肌肤污垢、杂质及余留的残妆等--浮起于肌肤表面，并有效去除由于外部紫外线或干燥条件的影响而发硬的老化角质。\r\n柔软绵密的霜体在洁肤的过程中给予肌肤幼嫩、柔滑的感受，让肌肤在经由深入清洁后更显澄净、透明。\r\n让深层洁净的肌肤金像晶莹剔透的自然礼遇。','',0,0,0,0,0,'2012-03-01 16:00:03','2012-03-01 16:00:03',3,0);
INSERT INTO `goods_real` VALUES (148,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺红石榴活颜卸妆洁面乳(84649)','http://photo.no5.com.cn/product/mphoto/20101104143555227595425.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101104143555227595425.jpg\";}',119,'http://www.no5.com.cn/goods/22439.html','22439',0,'干性,油性,混合性,中性,敏感性','','','','含丰富红石榴萃取，其天然高效抗氧化及植物性雌激素等活性成份，能促进胶原蛋白增生、紧致并拉提肌肤线条；柔滑细致的乳霜质地，可温和卸除脸部彩妆及残余污垢，另含天然黑麦、甜没药萃取，能有效镇静舒缓及紧致肌肤、同时增强肌肤对外防护力。 适用各种肤质。尤适合熟龄肌肤使用。 \r\n&nbsp;\r\n使用说明：&nbsp;&nbsp; \r\n取适量并以指腹均匀按摩全脸后，以微湿的化妆棉擦拭即可。','',0,0,0,0,0,'2012-03-01 16:00:03','2012-03-01 16:00:03',3,0);
INSERT INTO `goods_real` VALUES (149,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯舒颜洁面乳','http://photo.no5.com.cn/product/mphoto/20101104143726227595425.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101104143726227595425.jpg\";}',126,'http://www.no5.com.cn/goods/22443.html','22443',0,'敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','温和清洁肌肤。  令肌肤感觉清新，柔软，舒适和平衡。  甲基椰油酰基牛磺酸钠――温和的洁净成份。  聚二甲基硅氧烷――帮助保持皮肤表面的水油平衡。  使用方法：\r\n取适量产品，在湿润的脸部及颈部按摩，再用湿润温暖的毛巾擦净。\r\n请避开眼圈部位。\r\n该产品非肌肤过敏后的治疗药物，而是对健康肌肤能起到舒缓安抚作用的护肤品。肌肤过敏，请停止使用所有护肤产品并就医。  &nbsp;','',0,0,0,0,0,'2012-03-01 16:00:05','2012-03-01 16:00:05',3,0);
INSERT INTO `goods_real` VALUES (150,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗温和清洁乳(0116)(吸盘大法洗面奶)大S美容大王推荐','http://photo.no5.com.cn/product/mphoto/20101105150917404571800.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101105150917404571800.jpg\";}',235,'http://www.no5.com.cn/goods/22455.html','22455',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于干性或中性皮肤。以植物萃取精华为主要成份的乳液，质地柔滑、清新怡人。\r\n有助于维持皮肤天然均衡的pH值，中和硬水，洁净滋润肌肤。通过过敏性测试。轻柔清洁面部，去除杂质与残妆。\r\n保持并改善皮肤的自然平衡，维护清新色泽与青春光彩。\r\n软化肌肤，保持水分。改善干性和中性皮肤的弹性、舒适度与柔软性。\r\n刺激皮肤新陈代谢。\r\n避免硬水洗脸而造成的肌肤干燥紧绷。成分：\r\n轻油质。\r\n“BIO-ECOLIA”混合物。\r\n药属葵，菩提树，杏仁，维生素A和E。\r\n阿尔卑斯山药草（山金车花，刺柏，密蜂花）。\r\n软水剂。使用方法：\r\n根据皮肤类型的不同，每天使用一至两次。\r\n将乳液倒至手掌间温热。\r\n注意不要按压，以娇韵诗“吸盘式手法”清洁，像被皮肤烫到一样地将双手迅速抬离脸部。\r\n重复以上步骤五至六次。至清洁乳变成透明状态即可。\r\n使用清水彻底洁面，或用纸巾擦去残留产品。\r\n使用相应的爽肤水完成洁面过程。','',0,0,0,0,0,'2012-03-01 16:00:06','2012-03-01 16:00:06',3,0);
INSERT INTO `goods_real` VALUES (151,1,0,0,'Kracie 葵缇亚','护肤','Kracie 葵缇亚植物性泡沫洗面膏-石榴67384(原嘉娜宝)','http://photo.no5.com.cn/product/mphoto/20101105151343404571800.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101105151343404571800.jpg\";}',45,'http://www.no5.com.cn/goods/22468.html','22468',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','高保湿成分的配合，丰富的泡沫给予丝柔般的呵护，让肌肤柔嫩有弹性，100%植物素材的洗颜成分。细致丰盈有弹性的泡沫，深入毛孔带走肌肤表面多余的油脂，并且非常滋润保湿，帮助肌肤维持紧致弹性配合氨基酸为洁净因子，使用后肌肤感到前所未有的舒适，兼具卸妆功效。洗颜卸妆一次完成！为了让产品有效发挥更大的植物性，产品运用高科技的植物栽培及选择优良植物素材。使用方法：\r\n用清水润湿面部，取本品适量于手中，揉搓出丰富的泡沫后轻轻按摩整个面部后用水冲洗干净。芦荟：让皮肤变得更光滑\r\n石榴：清除角质，深层清洁毛孔\r\n水蜜桃：让皮肤变得更滋润\r\n绿茶：让皮肤清新光滑','',0,0,0,0,0,'2012-03-01 16:00:07','2012-03-01 16:00:07',3,0);
INSERT INTO `goods_real` VALUES (152,1,0,0,'Anna Sui 安娜苏','护肤','Anna Sui安娜苏柔和洁肤露','http://photo.no5.com.cn/product/mphoto/20101106182429581555301.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20101106182429581555301.jpg\";}',155,'http://www.no5.com.cn/goods/22517.html','22517',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','能够深层清洁肌肤，可轻易卸除眼妆及唇妆，如羽毛般轻柔的质地，让肌肤柔嫩无负担，经过敏感测试，富含牛奶精华，能够维持肌肤柔嫩的质感，并且保护肌肤，让肌肤柔润水嫩。  使用方法：\r\n取适量本品在面部均匀打圈按摩1-2分钟，用清水洗净即可。  &nbsp;','',0,0,0,0,0,'2012-03-01 16:01:01','2012-03-01 16:01:01',3,0);
INSERT INTO `goods_real` VALUES (153,1,0,0,'英国AA网','护肤','英国AA网茶树薄荷高保湿甘油手工皂(85204)','http://photo.no5.com.cn/product/mphoto/22817_M_101217113230_65553413.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22817_M_101217113230_65553413.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22817_M_101217113257_66053291.jpg\";}',39,'http://www.no5.com.cn/goods/22817.html','22817',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。茶树精油：收缩及畅通毛孔，改善分泌，杀菌消炎。\r\n薄荷精油：柔软皮肤，清除黑头粉刺。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:02','2012-03-01 16:01:02',3,0);
INSERT INTO `goods_real` VALUES (154,1,0,0,'英国AA网','护肤','英国AA网柠檬高保湿甘油手工皂(85202)','http://photo.no5.com.cn/product/mphoto/22818_M_101220160129_91209236.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22818_M_101220160129_91209236.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22818_M_101220160148_38765999.jpg\";}',39,'http://www.no5.com.cn/goods/22818.html','22818',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。柠檬具有温和的美白作用，能增加皮肤的光泽，可以帮助油性肌肤减少油脂分泌。同时具有杀菌功效，可深层清洁、净化、去除脸部及身体脏污、油脂。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:06','2012-03-01 16:01:06',3,0);
INSERT INTO `goods_real` VALUES (155,1,0,0,'英国AA网','护肤','英国AA网红玫瑰高保湿甘油手工皂(85203)','http://photo.no5.com.cn/product/mphoto/22819_M_101220160223_30218636.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22819_M_101220160223_30218636.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22819_M_101220160247_50037971.jpg\";}',39,'http://www.no5.com.cn/goods/22819.html','22819',0,'干性,油性,混合性,中性,敏感性','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。玫瑰有强壮和收缩微血管的效果，对老化皮肤有极佳的回春作用。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:08','2012-03-01 16:01:08',3,0);
INSERT INTO `goods_real` VALUES (156,1,0,0,'英国AA网','护肤','英国AA网维他命E高保湿甘油手工皂(85206)','http://photo.no5.com.cn/product/mphoto/22820_M_101220160329_99778571.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22820_M_101220160329_99778571.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22820_M_101220160354_69648567.jpg\";}',39,'http://www.no5.com.cn/goods/22820.html','22820',0,'干性,油性,混合性,中性,敏感性','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。维他命E可延缓肌肤衰老，令肌肤有弹性。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:10','2012-03-01 16:01:10',3,0);
INSERT INTO `goods_real` VALUES (157,1,0,0,'英国AA网','护肤','英国AA网薰衣草高保湿甘油手工皂(85201)','http://photo.no5.com.cn/product/mphoto/22821_M_101220160429_44125954.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22821_M_101220160429_44125954.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22821_M_101220160453_86379371.jpg\";}',39,'http://www.no5.com.cn/goods/22821.html','22821',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。薰衣草可帮助治疗青春痘、改善粉刺，均衡油脂分泌，淡化疤痕，去痘印。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:10','2012-03-01 16:01:10',3,0);
INSERT INTO `goods_real` VALUES (158,1,0,0,'英国AA网','护肤','英国AA网洋甘菊高保湿甘油手工皂(87102)','http://photo.no5.com.cn/product/mphoto/22822_M_101220160523_66686378.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22822_M_101220160523_66686378.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22822_M_101220160557_96739478.jpg\";}',39,'http://www.no5.com.cn/goods/22822.html','22822',0,'敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。洋甘菊非常温和，抗敏消炎，适合敏感肌肤使用。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:11','2012-03-01 16:01:11',3,0);
INSERT INTO `goods_real` VALUES (159,1,0,0,'英国AA网','护肤','英国AA网佛手柑高保湿甘油手工皂(87101)','http://photo.no5.com.cn/product/mphoto/22823_M_101220160653_10293557.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22823_M_101220160653_10293557.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22823_M_101220160716_79798561.jpg\";}',39,'http://www.no5.com.cn/goods/22823.html','22823',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。佛手柑对油性皮肤有益，可以平衡油性肤质的皮脂腺分泌。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:12','2012-03-01 16:01:12',3,0);
INSERT INTO `goods_real` VALUES (160,1,0,0,'英国AA网','护肤','英国AA网橙花高保湿甘油手工皂(87103)','http://photo.no5.com.cn/product/mphoto/22824_M_101220161105_15823799.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22824_M_101220161105_15823799.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22824_M_101220161126_37346016.jpg\";}',39,'http://www.no5.com.cn/goods/22824.html','22824',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。橙花可美白、保湿、淡斑。适合干性、敏感性及成熟型肌肤。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:12','2012-03-01 16:01:12',3,0);
INSERT INTO `goods_real` VALUES (161,1,0,0,'英国AA网','护肤','英国AA网檀香高保湿甘油手工皂(87104)','http://photo.no5.com.cn/product/mphoto/22825_M_101220161201_52237984.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22825_M_101220161201_52237984.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22825_M_101220161213_59236275.jpg\";}',39,'http://www.no5.com.cn/goods/22825.html','22825',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。檀香对干性及老化缺水的皮肤特别有益。可使皮肤柔软，改善皮肤发痒或发炎的现象。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:13','2012-03-01 16:01:13',3,0);
INSERT INTO `goods_real` VALUES (162,1,0,0,'英国AA网','护肤','英国AA网葡萄柚高保湿甘油手工皂(85205)','http://photo.no5.com.cn/product/mphoto/22826_M_101220161302_80976844.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22826_M_101220161302_80976844.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22826_M_101220161310_28198525.jpg\";}',39,'http://www.no5.com.cn/goods/22826.html','22826',0,'','','','','这款高品质的植物手工皂从上世纪以来一直沿用控制严格的生产工艺，其独特的手工配方于1893年诞生于俄罗斯明斯克、富含棕榈油、椰子油、蓖麻油等高级植物油成分，由于添加了高含量的甘油，使得这款手工皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。葡萄柚可治疗毛孔粗大，调理油腻不洁皮肤。使用方法：\r\n沾湿香皂后，用双手打起丰富的泡沫，然后以打圈方式均匀的按摩面部，再以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:14','2012-03-01 16:01:14',3,0);
INSERT INTO `goods_real` VALUES (163,1,0,0,'花妍','护肤','花妍 深层洁净洗面乳','http://photo.no5.com.cn/product/mphoto/22879_M_101229113422_54385811.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22879_M_101229113422_54385811.jpg\";}',28,'http://www.no5.com.cn/goods/22879.html','22879',0,'','','','','加强洁净配方，以柔细泡沫深层清洁脸上的脏污与残妆，洗脸后肌肤润泽保湿不干涩，且能平衡油脂，维持肌肤含水量，使肌肤回复健康明亮的光泽。添加七叶树萃取帮助调节油脂分泌、鼠尾草、木贼收敛粗大的毛孔，让肌肤回复水油平衡状态，清爽柔嫩。\r\n高岭土深层清洁毛孔脏污，让肌肤回复天然无负担状态。\r\nVitB6调理毛孔，避免过多油脂分泌，还你一张清爽洁净的脸庞。主要成份：\r\n水、酵母提取物、欧洲七叶树、鼠尾草、木贼、甘草酸胺、VitB6、丙二醇、高岭土、尿囊素。使用方法：\r\n每日早晚，取适量于手掌上加水揉搓出泡沫后，以泡沫洗脸并用清水冲净即可。搭配机能水系列将可让肌肤散发迷人光采。注意事项：如不慎入眼，请立即用清水冲洗。','',0,0,0,0,0,'2012-03-01 16:01:15','2012-03-01 16:01:15',3,0);
INSERT INTO `goods_real` VALUES (164,1,0,0,'花妍','护肤','花妍 柔敏亮白洁面乳','http://photo.no5.com.cn/product/mphoto/22880_M_101229113512_52552467.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22880_M_101229113512_52552467.jpg\";}',28,'http://www.no5.com.cn/goods/22880.html','22880',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','弱酸性配方，选用天然胺基酸接口活性剂，泡沫细致，温和洗净不伤肌肤，草本萃取液镇静与修护敏感的肌肤。含有多种植物提取物，维持肌肤水嫩光采；洋甘菊与金盏花，舒活每一寸肌肤，回复迷人自信风采。\r\n胺基酸接口活性剂将肌肤维持在弱酸性，洗后舒适无紧绷感，彷佛沉浸在水嫩光泽里。\r\n双重复合维他命B群，全方位由里到外的透亮净白，让你拥有真正的净白肌肤。主要成份：\r\n水、洋甘菊、金盏花、甘草根、胺基酸、尿囊素、复合维他命B群使用方法：\r\n每日早晚，取适量于手掌上加水揉搓出泡沫后，以泡沫洗脸并用清水冲净即可。搭配机能水系列将可让肌肤散发迷人光采。注意事项：\r\n如不慎入眼，请立即用清水冲洗。\r\n\r\n&nbsp;','',0,0,0,0,0,'2012-03-01 16:01:15','2012-03-01 16:01:15',3,0);
INSERT INTO `goods_real` VALUES (165,1,0,0,'花妍','护肤','花妍 水漾润泽洗面露','http://photo.no5.com.cn/product/mphoto/22881_M_101229113537_95992408.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22881_M_101229113537_95992408.jpg\";}',28,'http://www.no5.com.cn/goods/22881.html','22881',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','温和不刺激，能清除皮肤表层多余的油脂与脏污。添加多种胺基酸成分，提供长时间的保湿效果，在洗颜的同时加强保湿，温和的弱酸性洗颜，让肌肤不干不涩好舒适。突破性科技结合复方草本精华─芦荟、小黄瓜补足水分，避免水份流失，让肌肤水润有弹性。\r\n海藻糖及维他命添加维持肌肤长时间的保湿，避免肌肤干燥。\r\n多种胺基酸添加，深层补充并滋养肌肤、维持肌肤弹性。主要成份：\r\n水、芦荟、小黄瓜、海藻糖、维他命、多种胺基酸、甘油、尿囊素。使用方法：\r\n每日早晚，取适量于手掌上加水揉搓出泡沫后，以泡沫洗脸并用清水冲净即可。搭配机能水系列将可让肌肤散发迷人光采。注意事项：\r\n如不慎入眼，请立即用清水冲洗。','',0,0,0,0,0,'2012-03-01 16:01:16','2012-03-01 16:01:16',3,0);
INSERT INTO `goods_real` VALUES (166,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧温和型洗面皂(6108)','http://photo.no5.com.cn/product/mphoto/22902_M_110105153029_48109871.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22902_M_110105153029_48109871.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22902_M_101230110937_77509285.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/22902_M_110105153047_38425423.jpg\";}',135,'http://www.no5.com.cn/goods/22902.html','22902',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','温和型洗面皂适合混合性及中性肌肤。\r\n倩碧基础护肤三步骤之第一步\r\n能温和地全面清除表面的污垢及油脂，令皮肤清洁舒爽，绝无干燥紧绷的感觉。使用方法：\r\n用温水将双手浸湿，在掌心涂上洁面皂并揉搓出泡沫，在面部及颈部按摩。之后用清水清洗3-5次。轻轻将肌肤拍干。','',0,0,0,0,0,'2012-03-01 16:01:17','2012-03-01 16:01:17',3,0);
INSERT INTO `goods_real` VALUES (167,1,0,0,'Nuxe 欧树','护肤','Nuxe欧树蜂蜜温和洁面ㄠ(9714971)','http://photo.no5.com.cn/product/mphoto/22931_M_110113141244_20389992.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22931_M_110113141244_20389992.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22931_M_110113141258_63099342.jpg\";}',360,'http://www.no5.com.cn/goods/22931.html','22931',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','功效：洁净、紧致肌肤、清洁之余不损皮肤的天然水脂膜、有效柔肤、舒缓、松弛、焕发及紧致肌肤。含丰富植物精华，能滋润、柔软、镇静肌肤。亲水性凝胶适合每天使用，清洁的同时也能留住脸部肌肤所需的水份和油脂。使用后肌肤干净清爽有光泽，毛孔缩小。纯中性配方，适合任何肤质。成份：金合欢花蜂蜜、桃子精华、菩提花精华、胡桃叶精华、人参精华、植物性洁肤成分。适用肤质：任何肤质，包括最干燥的肤质。用法：每日使用，可洁肤及卸妆，以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:17','2012-03-01 16:01:17',3,0);
INSERT INTO `goods_real` VALUES (168,1,0,0,'日本JuJu','护肤','JuJu 天然芦荟保湿洁面ㄠ(60043)','http://photo.no5.com.cn/product/mphoto/22967_M_110131105246_56992317.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22967_M_110131105246_56992317.jpg\";}',68,'http://www.no5.com.cn/goods/22967.html','22967',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','洁面ㄠ产生的温和泡沫，深层清洁肌肤的油脂及污垢，且不带走肌肤的水分。洗后清爽不紧绷，肌肤倍感柔滑。纯天然植物成分，通过肌肤检验测试，是问题肌肤的首选。 Natural JUJU系列的是采用100%有机栽培芦荟为主要成份，很适合现今追求天然成份的人士。 来自美国南部的温暖地区种植的库拉索芦荟。 芦荟中含60-80%是多糖体的透明胶状物，这胶状物具有强化免疫机能，防止老化，具美容保湿功效。 并且能刺激皮肤新陈代谢，促进皮肤细胞再生，抗衰老。 采用芦荟的胶状物完全榨汁而成，纯天然，防止引起皮肤敏感。 植物性成份，性质温和，无色素、无香料、无矿物油。','',0,0,0,0,0,'2012-03-01 16:01:18','2012-03-01 16:01:18',3,0);
INSERT INTO `goods_real` VALUES (169,1,0,0,'御泥坊','护肤','御泥坊 美白嫩肤矿物洁面乳','http://photo.no5.com.cn/product/mphoto/22971_M_110130094632_74961830.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/22971_M_110130094632_74961830.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/22971_M_110130112733_94660316.jpg\";}',39,'http://www.no5.com.cn/goods/22971.html','22971',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效： \r\n矿物精华水富含多种美白因子，深层洁净肌肤的同时，清除黯沉角质，淡化黑色素，纯净柔嫩肌肤，提高肌肤透明度。 \r\n矿物质有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。 主要成分：\r\n矿物泥浆精华水、去离子水、单月桂基聚氧乙烯醚磷酸酯、脂肪醇聚氧乙烯醚硫酸铵、月桂醇硫酸铵、月桂酰肌氨酸钠、氢氧化钾、聚丙烯酸共聚物、椰油酰胺丙基甜菜碱、烷醇酰胺、左旋VC、香精、乙二醇双硬脂酸酯、邻苯二甲酸烷基酰胺、1，3-二羟甲基-5，5-二甲基乙内酰脲。使用方法：\r\n每天早晚使用。润湿脸部，取适量用于掌心，用水搓出泡沫，在面部轻轻打圈，再以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:19','2012-03-01 16:01:19',3,0);
INSERT INTO `goods_real` VALUES (170,1,0,0,'御泥坊','护肤','御泥坊 矿物洁面乳(贡品)','http://photo.no5.com.cn/product/mphoto/23042_M_110304103013_59359871.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23042_M_110304103013_59359871.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23042_M_110304103024_93428474.jpg\";}',59,'http://www.no5.com.cn/goods/23042.html','23042',0,'干性,油性,混合性,中性,敏感性','','','','产品描述：\r\n富含多种矿物微量元素，矿物质能有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。\r\n贡品级矿物精华，质地温和细腻，深层洁净肌肤，清除老化角质，再生新细胞，平衡油脂分泌，使肌肤洁净透气，柔嫩有光泽。成分：\r\n矿物泥浆精华水、去离子水、天然脂肪醇琥珀酸酯衍生物、椰油酰胺丙基甜菜碱、硬脂酸乙二醇双酯和硬脂酸乙二醇单酯、烷醇酰胺、氯化钠、椰油酸甘油酯、聚乙醇合成双酯、瓜尔胶、乙二胺四乙酸二钠、1，3-二羟甲基-5，5-二甲基乙内酰脲、香精。使用方法：\r\n每天早晚使用。润湿脸部，取适量于掌心，用水搓出泡沫，在面部轻轻打圈，再以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:19','2012-03-01 16:01:19',3,0);
INSERT INTO `goods_real` VALUES (171,1,0,0,'御泥坊','护肤','御泥坊 红石榴矿物洁面乳','http://photo.no5.com.cn/product/mphoto/23047_M_110304103431_21682259.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23047_M_110304103431_21682259.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23047_M_110304103445_29667946.jpg\";}',39,'http://www.no5.com.cn/goods/23047.html','23047',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效： \r\n红石榴营养精华，能加强肌肤营养补给及抗氧化功效，洁净黯沉肌肤，使肌肤纯净有光泽。 \r\n矿物质有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。成分：\r\n去离子水、天然脂肪醇琥珀酸酯衍生物、椰油酰基丙基甜菜碱、聚丙烯酸共聚物、氯化钠、烷醇酰胺、PEG-7椰油酸甘油酯、三乙醇胺、瓜尔胶、香精、1,3-二羟甲基-5,5二甲基乙内酰脲、对羟基苯甲酸甲酯、乳酸薄荷酯、乙二胺四乙酸二钠。使用方法： \r\n每天早晚使用。润湿脸部，取适量用于掌心，用水搓出泡沫，在面部轻轻打圈，再以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:20','2012-03-01 16:01:20',3,0);
INSERT INTO `goods_real` VALUES (172,1,0,0,'LOREAL 欧莱雅','护肤','LOREAL 欧莱雅清润抗油光冰净洁面膏(00948)','http://photo.no5.com.cn/product/mphoto/23110_M_110411170328_62087227.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23110_M_110411170328_62087227.jpg\";}',55,'http://www.no5.com.cn/goods/23110.html','23110',0,'','','','','作用：\r\n欧莱雅清润冰净洁面膏富含活性纯净矿物质，能净化肌肤，远离油腻污垢，并感觉水润不紧绷。它能畅通堵塞的毛孔，并使其收缩不明显。\r\n此款独特配方能去除多余油脂的同时，帮助调节肌肤油光问题。效果：\r\n立即：你的肌肤变得纯净，感觉哑光，远离肌肤“油腻感”。\r\n日复一日：毛孔变得不明显，你的肌肤更细致，看起来健康有光彩。质地：\r\n此款“冰肌”质地，如同让肌肤直接感受来自海洋的清新。肌肤感觉滋润舒适不紧绷。成分：\r\n1持久保湿 珍贵深层海洋水\r\n直接萃取法国布列塔尼海洋外22米海床深处的深层海洋水，长期受到花岗岩的浸润，富含天然矿物质，帮助肌肤保湿。同时，其锌含量为普通海水的8倍*，这种锌普遍认为能够有利调节肌肤油脂分泌的元素，结合蔗糖酸锌，能出色地对抗油光。\r\n*来自Soliance数据2冰净肌肤 “冰肌”质地\r\n首创**“冰肌”质地，被肌肤吸收，赋予肌肤充足水润感的同时，更令你直接感受到来自海冰的冰爽清澈，沁爽对抗油光。\r\n**巴黎欧莱雅首创3持久抗油光 神奇“微海绵”科技***\r\n这个神奇的链状聚合物，如同“海绵吸水”般能将多余的油脂瞬间燃尽，即刻还原持久保湿肌肤的哑光质感，让人感觉神清气爽。\r\n***指的是甲基丙缘酸甲酯交联聚合物使用方法：\r\n早晚使用在经水润湿的脸部，再用水冲洗干净。避免触及眼周肌肤。','',0,0,0,0,0,'2012-03-01 16:01:21','2012-03-01 16:01:21',3,0);
INSERT INTO `goods_real` VALUES (173,1,0,0,'Kose 高丝','护肤','Kose 高丝Softymo深层清洁保湿洗面奶(31770)','http://photo.no5.com.cn/product/mphoto/23147_M_110420102723_30272194.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23147_M_110420102723_30272194.jpg\";}',49,'http://www.no5.com.cn/goods/23147.html','23147',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','让肌肤体会到从未有过的彻底的清洁本来真实的感觉！因为要每天使用，所以要对洁面乳的成分关注\r\n从滋润开始，使用新开发的洁面乳成分“CEM”，实现了能够自然除去污垢，感觉到自然而然的清爽感觉，不会觉得脸上还留有污垢，实现了前所谓有的洗颜效果。高质量的泡沫-轻轻的细腻的泡沫，可以达到抑制肌肤原本的水分流出的同时完成洗颜的功效。\r\n像刚出生一样本来的肌肤感觉-除去毛孔深出的污垢，肌肤表面更加细腻，平滑。\r\n有机母菌内提取成分-使干燥的基辅也同样得到很好的保湿效果，限定产地的有机栽培，有机母菌的提取得到了更有效的认证。使用方法：\r\n取适量于掌心，轻揉至起泡然后按摩面部，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:21','2012-03-01 16:01:21',3,0);
INSERT INTO `goods_real` VALUES (174,1,0,0,'Depiliss 丹派诗','护肤','Depiliss 丹派诗玫瑰矿物盐泡沫洁颜乳','http://photo.no5.com.cn/product/mphoto/23184_M_110427180037_29272438.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23184_M_110427180037_29272438.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23184_M_110427180050_59973732.jpg\";}',21,'http://www.no5.com.cn/goods/23184.html','23184',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','天然矢量的海盐微粒，透过泡沫去除多余老化角质，令肌肤光滑细致，补充干燥肌肤营养水分，促进血液循环，令身心放松。成分：\r\n去离子水、天然矿物盐、天然磨砂盐、脂肪醇醚硫酸钠、椰子油酰胺丙基甜菜碱、月桂基硫酸铵、小麦胚芽油、乙二醇双硬脂酸酯、聚乙二醇、乳木果油、玫瑰精油。使用方法：\r\n将面部淋湿，取适量本品涂抹面部，双手轻柔打面，然后用清水冲洗干净即可。','',0,0,0,0,0,'2012-03-01 16:01:22','2012-03-01 16:01:22',3,0);
INSERT INTO `goods_real` VALUES (175,1,0,0,'日本JuJu','护肤','JuJu AQUAMOIST透明质酸保湿洗面奶(30316)','http://photo.no5.com.cn/product/mphoto/23238_M_110520175453_37693459.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23238_M_110520175453_37693459.jpg\";}',68,'http://www.no5.com.cn/goods/23238.html','23238',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','*蕴含透明质酸：透明质酸是调节皮肤水份组织的主要元素，婴儿柔嫩的肌肤，正是因为有大量的透明质酸之缘故，但随着年龄增长，含量会遂渐降低。其独特的保湿效能，在不同的环境下均能自动调节保湿值，使肌肤的含水量保持最佳状态，冬天水嫩，夏天清爽。\r\n*具丰富泡沫，彻底洁净肌肤，缔造完美肌肤状态：深层清洁毛孔内的污垢，温和洗净面部多余油脂，使肌肤洁净透亮。\r\n*无添加配方，不伤害肌肤：无酒精、香料、色素及矿物油成份添加。\r\n*无使用动物性成份：由乳酸球菌发酵制成之透明质酸。使用方法：请用水起泡后轻轻打圈。','',0,0,0,0,0,'2012-03-01 16:01:23','2012-03-01 16:01:23',3,0);
INSERT INTO `goods_real` VALUES (176,1,0,0,'御泥坊','护肤','御泥坊 修护矿物洁面乳','http://photo.no5.com.cn/product/mphoto/23251_M_110525132451_22444435.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23251_M_110525132451_22444435.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23251_M_110525132511_53188301.jpg\";}',39,'http://www.no5.com.cn/goods/23251.html','23251',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效： \r\n针对电脑一族，日晒等受损肌肤，深层清洁毛孔内污垢及老化角质，深入滋养调理，抑制黑色素及色斑，促进细胞新陈代谢，使肌肤洁净健康。 \r\n矿物质有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。成分：\r\n矿物泥浆精华水、去离子水、绣线菊萃取物、单月桂基聚氧乙烯醚磷酸酯、脂肪醇聚氧乙烯醚硫酸铵、月桂醇硫酸铵、月桂酰肌氨酸钠、氢氧化钾、聚丙烯酸共聚物、椰油酰胺丙基甜菜碱、烷醇酰胺、香精、邻苯二甲酸烷基酰胺、乙二醇双硬脂酸酯、1，3-二羟甲基-5，5-二甲基乙内酰脲。使用方法\r\n每天早晚使用。润湿脸部，取适量用于掌心，用水搓出泡沫，在面部轻轻打圈，再以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:23','2012-03-01 16:01:23',3,0);
INSERT INTO `goods_real` VALUES (177,1,0,0,'御泥坊','护肤','御泥坊 逗逗矿物洁面乳','http://photo.no5.com.cn/product/mphoto/23253_M_110525151511_69395881.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23253_M_110525151511_69395881.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23253_M_110525151524_83930793.jpg\";}',39,'http://www.no5.com.cn/goods/23253.html','23253',0,'','','','','主要功效：\r\n针对问题肌肤，深层洁净毛孔污垢，清除脸部多余油脂，改善粉刺暗疮，令肌肤清爽柔润。矿物质有效强化皮肤天然防御能力，令肌肤健康强韧有弹性。成份：矿物泥浆精华水、去离子水、硬脂酸、丙三醇、氢氧化钾、肉豆蔻酸、月桂酸、月桂酰基谷氨酸钠、单甘脂、香精、聚乙醇合成双酯、1，3-二羟甲基-5，5-二甲基乙内酰脲。使用方法：每天早晚使用。润湿脸部，取适量于掌心，在面部轻轻打圈，再以清水洗净。适合肤质：矿物质过敏者慎用！','',0,0,0,0,0,'2012-03-01 16:01:24','2012-03-01 16:01:24',3,0);
INSERT INTO `goods_real` VALUES (178,1,0,0,'Clinique 倩碧','护肤','Clinique 倩碧加强型洗面皂(6109)','http://photo.no5.com.cn/product/mphoto/23260_M_110530094249_44130074.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23260_M_110530094249_44130074.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23260_M_110530094314_21076637.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23260_M_110530094325_15539528.jpg\";}',128,'http://www.no5.com.cn/goods/23260.html','23260',0,'油性','','','','加强型洗面皂适合油性/极油性肌肤。\r\n倩碧基础护肤三步骤之第一步\r\n能温和地全面清除表面的污垢及油脂，令皮肤清洁舒爽，绝无干燥紧绷的感觉。使用方法：\r\n用温水将双手浸湿，在掌心涂上洁面皂并揉搓出泡沫，在面部及颈部按摩。之后用清水清洗3-5次。轻轻将肌肤拍干。','',0,0,0,0,0,'2012-03-01 16:01:25','2012-03-01 16:01:25',3,0);
INSERT INTO `goods_real` VALUES (179,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗平衡泡沫洁面霜(12421油性/混合性肤质)','http://photo.no5.com.cn/product/mphoto/23262_M_110530095324_92450691.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23262_M_110530095324_92450691.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23262_M_110530095338_12976967.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23262_M_110530095405_46386391.jpg\";}',178,'http://www.no5.com.cn/goods/23262.html','23262',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品特点：\r\n含罗望子萃取精华。独特净化珍珠微粒能有效清除各\r\n种污垢及堆积的死皮细胞。气息清新宜人。产品功效：\r\n丰富的泡沫，彻底地清洁肌肤；&nbsp;&nbsp;&nbsp;&nbsp; \r\n保持肌肤PH值平衡；&nbsp;&nbsp;&nbsp;&nbsp; \r\n净化和细致肌肤。成分：\r\n满天星-天然皂苷植物因子，带来丰富细腻的泡沫，彻底清洁；\r\n北美洲包果菊--保护肌肤生态系统；\r\n棉花籽--保护和修复皮脂膜；\r\n软水剂--避免由于硬水质洗脸而造成的肌肤干燥紧绷感；\r\n罗望子―有助清除死皮细胞，细致肌肤纹理；\r\n净化珍珠微粒（水杨酸）―净化肌肤并抑制有害杂菌繁殖。 使用方法：\r\n早晨或晚上湿手湿脸使用，取杏仁大小的量，轻轻揉出泡沫；\r\n涂抹于面部及颈部，以打圈的方式轻柔按摩（注意避开眼周）；\r\n早上用冷水冲洗，晚上用温水冲洗；\r\n随后使用平衡爽肤露，净化调理肌肤，为后续晚间护理做好准备','',0,0,0,0,0,'2012-03-01 16:01:25','2012-03-01 16:01:25',3,0);
INSERT INTO `goods_real` VALUES (180,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂洗颜专科浓密泡沫洁面乳(81831)','http://photo.no5.com.cn/product/mphoto/23361_M_110614114307_34214912.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23361_M_110614114307_34214912.jpg\";}',39,'http://www.no5.com.cn/goods/23361.html','23361',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不同于一般的洁面产品！以往的泡泡松散空洞，洗完脸后皮肤又痒又干，而资生堂的Perfect Whip浓密泡泡洁面乳，泡泡既丰富又浓密，更加起到了深层清洁及保湿的功效呢！！洗颜专科，为你呈上柔密“丝胶蛋白”泡沫，清水带走浓郁泡沫瞬间，爱上这盈柔丝滑的润感。奥秘，就蕴含于蚕茧中的天然保湿因子--\"丝胶蛋白\"成分，再配合美容液成分，洗出柔澈舒润肌肤，期待下次泡沫与肌肤的亲密接触......适合各种肌肤的这款洁面产品，无皂质，温和决不刺激。细滑的膏体彻底洗净残余污垢，让肌肤柔滑，避免毛孔阻塞，防止暗疮的产生。菌类植物提取液，可重建肌肤凌乱的皮脂膜，细腻的圆形颗粒给予肌肤温柔的接触，软化表皮的角质层，有效地将这些角质细胞去掉，内涵温和的柔软因子，可使肌肤变得柔软细致。增加皮肤透明度，迅速补充水份及紧肤功效，使皮肤紧致，有弹性。','',0,0,0,0,0,'2012-03-01 16:01:28','2012-03-01 16:01:28',3,0);
INSERT INTO `goods_real` VALUES (181,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂盼丽风姿24小时抗皱修复洁面乳(10301)','http://photo.no5.com.cn/product/mphoto/23380_M_110629105049_33639504.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23380_M_110629105049_33639504.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23380_M_110629105059_72443214.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23380_M_110629105111_85577369.jpg\";}',265,'http://www.no5.com.cn/goods/23380.html','23380',0,'干性,油性,混合性,中性,敏感性','','','','资生堂盼丽风姿抗皱修复系列提供抗皱修复方案。长久以来得到一众女士们的爱戴。资生堂努力不懈的进行研究开发。崭新发现肌肤皱纹化的真正成因。从而研制出全新配方wrinkle resist24小时抗皱修复系列的奢华质感和怡人香氛。将每天早晚的抗皱防御变为极致享受。资生堂盼丽风姿24小时抗皱修复洁面乳能揉起丰盈泡沫的洁面产品，温和去除衰老迹象成因之一的污垢及老化表皮细胞，而不会带走肌肤所需水分。能迅速揉起细腻幼滑泡沫，令肌肤感觉水润柔滑。使用方法：\r\n以少量洁面泡沫和清水，揉起丰盈泡沫，以打圈动作轻轻洁净肌肤。洁面后以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:01:28','2012-03-01 16:01:28',3,0);
INSERT INTO `goods_real` VALUES (182,1,0,0,'SANA 珊娜','护肤','SANA 珊娜豆乳绢丝洗面膏(45072)','http://photo.no5.com.cn/product/mphoto/23383_M_110629105314_78967720.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23383_M_110629105314_78967720.jpg\";}',55,'http://www.no5.com.cn/goods/23383.html','23383',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','SANA日本原装珊娜无添加豆乳绢丝保湿洁面膏，蕴含添加天然蚕丝蛋白和微粒子及清净成份配合，能够深层洁净毛孔内污垢和老化角质，令您的肌肤变得丝绢般细致幼滑，让肌肤恢复光剔透美白！同时蚕丝内含有大量的氨基酸，发挥出色的保湿效果，令您肌肤水嫩细致！ 无香料、无色素及矿物油成份，性质温和，敏感肌肤也可使用；成分天然不刺激肌肤，轻轻搓揉就可以产生细致又绵密的泡沫，温和洁净肌肤，同时带给肌肤懒致的呵护！','',0,0,0,0,0,'2012-03-01 16:01:29','2012-03-01 16:01:29',3,0);
INSERT INTO `goods_real` VALUES (183,1,0,0,'Dior 迪奥','护肤','Dior 迪奥HYDRA水动力精萃洁面泡沫(95218)','http://photo.no5.com.cn/product/mphoto/23425_M_110705150213_70906501.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23425_M_110705150213_70906501.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23425_M_110705150235_71395393.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23425_M_110705150250_53465706.jpg\";}',280,'http://www.no5.com.cn/goods/23425.html','23425',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于所有肤质。 纯净透明的哩质地，遇水即转化为清新又丰富细腻的泡沫，彻底清洁肌肤与卸除残余彩妆。洁净润泽的肌肤，为接受后续水动力精萃护肤产品做好准备。 每日早晚，湿润脸部后，避开眼周区域进行轻柔按摩。用水彻底冲净。轻轻拭干。','',0,0,0,0,0,'2012-03-01 16:01:31','2012-03-01 16:01:31',3,0);
INSERT INTO `goods_real` VALUES (184,1,0,0,'英国 NYR','护肤','英国NYR玫瑰洁面胶(00046)','http://photo.no5.com.cn/product/mphoto/23453_M_110714171638_69156929.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23453_M_110714171638_69156929.jpg\";}',169,'http://www.no5.com.cn/goods/23453.html','23453',0,'','','','','功效：泡沫温和，具有良好的抗氧化和抗衰老功效,提亮肤色,改善粗糙暗陈,舒缓受损过敏皮肤,使皮肤水嫩透白,清新洁净，光滑柔软。富含珍贵的奥图玫瑰精华,芦荟精华以及玫瑰花瓣,具有良好的抗氧化和抗衰老功效,提亮肤色,改善粗糙暗哑皮肤,舒缓受损过敏皮肤,使皮肤水嫩透白。此款产品的天然有机成份,在温和清洁肌肤的同时,可以补充皮肤缺失的养分。这款洁面露能提供非常高的保湿效果，同时也能够更深层清洁肌肤。富有轻柔、清新的植物香氛，使人如沐于大自然的海洋中。玫瑰有强壮和收缩微血管的效果，对老化皮肤有极佳的修复作用。还有抚平情绪的功效，在沮丧、哀伤、妒忌和憎恶的时候，起到提振心情，舒缓神经紧张和压力的作用。其紧实、舒缓的特性，对皮肤发炎很有帮助。由于它还能收缩微血管，可延缓衰老，保持皮肤健康亮丽。适用于中性、敏感性及缺水性皮肤使用效果尤佳。有机成分：库拉索（芦荟）叶汁粉、大马士革玫瑰花精油、玫瑰花提取物等，有机成分+螺母的成分组成的天然精油洁面露。Aqua (Water), Glycerin*, Lauryl glucoside, Sucrose laurate, Cocamidopropyl betaine, Aloe barbadensis (Aloe vera) leaf juice powder*, Rosa damascena (Rose) flower oil*, Rosa centifolia (Rose) flower extract*, Potassium sorbate, Citric acid, Levulinic acid, Alcohol denat., Citral, Citronellol, Eugenol, Farnesol, Geraniol, Limonene, Linalool. * Organically produced ingredient + Nut-based ingredient Natural constituent of essential oils listed【使用方法】：\r\n取少量在掌心加水搓揉出细腻的泡沫后，在脸部打圈清洁，再用清水冲洗干净。可用冷水来帮助闭合毛孔。&nbsp;','',0,0,0,0,0,'2012-03-01 16:01:32','2012-03-01 16:01:32',3,0);
INSERT INTO `goods_real` VALUES (185,1,0,0,'英国 NYR','护肤','英国NYR玫瑰草洁面胶(00014)','http://photo.no5.com.cn/product/mphoto/23456_M_110714172123_45473152.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23456_M_110714172123_45473152.jpg\";}',165,'http://www.no5.com.cn/goods/23456.html','23456',0,'','','','','可帮助恢复皮肤保湿的状态，刺激天然皮脂的分泌。能促进表皮细胞再生,消除皱纹,并且抗菌、抗病毒、杀菌,对于痘痘和敏感有很好的疗效.适合混合/敏感/油性/发炎/痤疮等肌肤，使不稳定肌肤得到平衡，清爽不干燥，对肌肤的再生作用可以有效减少粉刺，黑头的问题，痤疮得到平复，敏感肌肤稳定，同时保湿收缩毛孔，减少细纹的产生。建议不化妆的MM，每次只需按压一次用量即可。化妆的MM可根据情况按压两次用量。官方建议：油性/混合性皮肤搭配使用：玫瑰草洁面+薰衣草花水+康复利面霜适用于混合偏油及油性肌肤、痘痘肌肤。','',0,0,0,0,0,'2012-03-01 16:01:32','2012-03-01 16:01:32',3,0);
INSERT INTO `goods_real` VALUES (186,1,0,0,'英国 NYR','护肤','英国NYR橙花洁面胶(00042)有机89%','http://photo.no5.com.cn/product/mphoto/23457_M_110714172148_22006355.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23457_M_110714172148_22006355.jpg\";}',169,'http://www.no5.com.cn/goods/23457.html','23457',0,'','','','','有机89%。有机天然成分，能够清洁肌肤的同时保存肌肤水分，不会感到干燥。可提亮肤色，淡化黑色素。温和清洁肌肤。温和的乳液状泡沫洁面蕴含营养丰富的橙花及橘子精油帮助清洁肌肤而不使其干燥。适用于中性/缺水性/干性/敏感肤质。&nbsp;&nbsp; 【产品成分】：\r\n橙色花水成分、向日葵籽油、霍霍巴油、甘油、金盏菊花提取、芦荟叶汁粉 、有机橙花精油 、柑橘精油、 依兰依兰精油 、黄原胶、柠檬酸、苯甲醇、苯甲酸苄酯、水杨酸苄酯、柠檬醛、香茅醇、丁香酚、法呢醇、香叶醇、异丁香酚、芳樟醇、有机成分+螺母等成分的天然精油组成。【使用方法】：\r\n取少量在掌心加水搓揉出细腻的泡沫后，在脸部打圈清洁，再用清水冲洗干净。可用冷水来帮助闭合毛孔。','',0,0,0,0,0,'2012-03-01 16:01:33','2012-03-01 16:01:33',3,0);
INSERT INTO `goods_real` VALUES (187,1,0,0,'UZISE 柚子舍','护肤','UZISE柚子舍柚芽柔和洗颜液','http://photo.no5.com.cn/product/mphoto/23478_M_110721164539_33348366.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23478_M_110721164539_33348366.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23478_M_110721164554_38248268.jpg\";}',138,'http://www.no5.com.cn/goods/23478.html','23478',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n通过细腻柔和有弹性的泡泡把毛孔中残留的污垢、多余的油脂和老化脱落的角质清洁干净，保护皮脂膜不受伤害。产品特点：\r\n称“不伤眼睛的泡泡”；以泡泡推动泡泡的方式清洁，特别的舒服就象给脸部做SPA一样。产品成分：\r\n柚子的柚甙成分、橘核、葡萄柚精油、氨基酸保湿剂、维生素原B5、枸橼酸、瓜尔胶、椰油基两性醋酸钠、矿泉水凝素。适用皮肤：\r\n皮肤干燥、皮肤角质层薄、中性、干性的皮肤。','',0,0,0,0,0,'2012-03-01 16:01:34','2012-03-01 16:01:34',3,0);
INSERT INTO `goods_real` VALUES (188,1,0,0,'H2o 水芝澳','美容工具','H2O 水芝澳海洋净痘洁肤棉(242)','http://photo.no5.com.cn/product/mphoto/23585_M_110822152030_33419777.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23585_M_110822152030_33419777.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23585_M_110822152043_58644386.jpg\";}',215,'http://www.no5.com.cn/goods/23585.html','23585',0,'','','','','每日洁肤，去除角质，畅通毛孔，同时舒缓肌肤，调理肤质。成分：\r\n水、SD乙醇39-C、北美金缕梅提取物、乳酸钠、PPG-5-鲸蜡醇聚醚-20、水杨酸、长穗地榆提取物、肉桂书皮提取物、姜根提取物、掌叶树提取物、海茴香提取物等使用方法：\r\n可随时使用，取一片擦拭全脸或痘痘部位。','',0,0,0,0,0,'2012-03-01 16:01:35','2012-03-01 16:01:35',3,0);
INSERT INTO `goods_real` VALUES (189,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳海洋清透净脂洁面泡沫(231)','http://photo.no5.com.cn/product/mphoto/23589_M_110822152308_32943245.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23589_M_110822152308_32943245.jpg\";}',205,'http://www.no5.com.cn/goods/23589.html','23589',0,'','','','','绵密泡沫去除面部油脂，污垢和死皮，收细毛孔，平衡油脂，用后肌肤感觉清新、水润。成分：\r\n水、月桂醇聚醚硫酸酯钠、月桂醇聚醚磺基琥珀酸酯二钠、癸基葡糖苷、椰油酰基苹果氨基酸类钠、油橄榄叶提取物、长穗地榆根提取物、肉桂树皮提取物、姜根提取物、掌叶树提取物、海茴香提取物、伸长海条藻提取物、星芒山藻提取物、巨藻提取物、赖氨酸羧甲基半胱氨酸盐等使用方法：\r\n挤出适量泡沫，涂于湿润的面部，轻轻按摩后，用清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:35','2012-03-01 16:01:35',3,0);
INSERT INTO `goods_real` VALUES (190,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳海洋净痘沁凉洁面ㄠ(247)','http://photo.no5.com.cn/product/mphoto/23592_M_110822153603_72196022.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23592_M_110822153603_72196022.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23592_M_110822153622_58485084.jpg\";}',155,'http://www.no5.com.cn/goods/23592.html','23592',0,'混合性','','','','洗去面部污垢、油脂和角质，畅通毛孔，舒缓肌肤，使肌肤清爽、洁净。成分：\r\n水、C14-16烯烃磺酸钠、椰油酰胺丙基甜菜碱、甘油、水杨酸、氯化钠、姜根提取物、长穗地榆根提取物、肉桂树皮提取物、库拉索芦荟叶汁、掌叶树提取物、海茴香提取物、伸长海条藻提取物、巨藻提取物、亚油酰胺丙基PG-二甲基氯化铵磷酸酯、薄荷醇、丙二醇等使用方法：\r\n早晚挤适量于手心，加水打出泡泡，在面部按摩后用清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:36','2012-03-01 16:01:36',3,0);
INSERT INTO `goods_real` VALUES (191,1,0,0,'Kracie 葵缇亚','护肤','Kracie 葵缇亚植物性泡沫洗面膏-芦荟67382(原嘉娜宝)','http://photo.no5.com.cn/product/mphoto/23627_M_110825115522_35122658.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23627_M_110825115522_35122658.jpg\";}',45,'http://www.no5.com.cn/goods/23627.html','23627',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','保湿成分的配合，丰富的泡沫给予丝柔般的呵护，让肌肤柔嫩有弹性，100%植物素材的洗颜成分。细致丰盈有弹性的泡沫，深入毛孔带走肌肤表面多余的油脂，并且非常滋润保湿，帮助肌肤维持紧致弹性配合氨基酸为洁净因子，使用后肌肤感到前所未有的舒适，兼具卸妆功效。洗颜卸妆一次完成！为了让产品有效发挥更大的植物性，产品运用高科技的植物栽培及选择优良植物素材。使用方法：\r\n用清水润湿面部，取本品适量于手中，揉搓出丰富的泡沫后轻轻按摩整个面部后用水冲洗干净。芦荟：让皮肤变得更光滑。\r\n石榴：清除角质，深层清洁毛孔。\r\n蜜桃：让皮肤变得更滋润。\r\n绿茶：让皮肤清新光滑。','',0,0,0,0,0,'2012-03-01 16:01:37','2012-03-01 16:01:37',3,0);
INSERT INTO `goods_real` VALUES (192,1,0,0,'Kracie 葵缇亚','护肤','Kracie 葵缇亚植物性泡沫洗面膏-蜜桃67381(原嘉娜宝)','http://photo.no5.com.cn/product/mphoto/23628_M_110825115544_97832618.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23628_M_110825115544_97832618.jpg\";}',45,'http://www.no5.com.cn/goods/23628.html','23628',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','保湿成分的配合，丰富的泡沫给予丝柔般的呵护，让肌肤柔嫩有弹性，100%植物素材的洗颜成分。细致丰盈有弹性的泡沫，深入毛孔带走肌肤表面多余的油脂，并且非常滋润保湿，帮助肌肤维持紧致弹性配合氨基酸为洁净因子，使用后肌肤感到前所未有的舒适，兼具卸妆功效。洗颜卸妆一次完成！为了让产品有效发挥更大的植物性，产品运用高科技的植物栽培及选择优良植物素材。使用方法：\r\n用清水润湿面部，取本品适量于手中，揉搓出丰富的泡沫后轻轻按摩整个面部后用水冲洗干净。芦荟：让皮肤变得更光滑。\r\n石榴：清除角质，深层清洁毛孔。\r\n蜜桃：让皮肤变得更滋润。\r\n绿茶：让皮肤清新光滑。','',0,0,0,0,0,'2012-03-01 16:01:37','2012-03-01 16:01:37',3,0);
INSERT INTO `goods_real` VALUES (193,1,0,0,'澳洲2N','护肤','澳洲2N疗亮有机超绵密净白保湿洗颜泡泡','http://photo.no5.com.cn/product/mphoto/23630_M_110826162337_89311347.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23630_M_110826162337_89311347.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23630_M_110826162351_97627998.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23630_M_110826162405_67690254.jpg\";}',56,'http://www.no5.com.cn/goods/23630.html','23630',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','以真空的按压式设计，轻轻一压，瞬间就能压出绝对想象不到的超浓密泡泡，如此超浓密的泡泡，才能真正渗透至深层微小毛细孔中，彻底洁净毛孔、彩妆残污，加强预防粉刺产生！\r\n特殊的5大草本精华更能同时赋予肌肤弹性、深层保湿，光洗脸就可以洗出光透美肌！5大草本精华：\r\n迷迭香精华-可促进循环，具抗氧、保湿化作用，有效预防肌龄渐长的问题\r\n柠檬精华-富含维他命C，温和去除老废角质\r\n蛇麻草精华-具有收敛、安抚功效\r\n杉菜精华-使肌肤饱满有弹性\r\n松树精华-促进肌肤更新清爽的淡淡花香，更让充分享受在洗颜洁净的乐趣之中！\r\n天然有机无化学成份，欧美女性口碑相传,一致好评!储存方法：避光保存，恒温。','',0,0,0,0,0,'2012-03-01 16:01:41','2012-03-01 16:01:41',3,0);
INSERT INTO `goods_real` VALUES (194,1,0,0,'相宜本草','护肤','相宜本草 芯净自然净妆洁面两用乳','http://photo.no5.com.cn/product/mphoto/23654_M_110830143314_64633308.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23654_M_110830143314_64633308.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23654_M_110830143328_68083015.jpg\";}',45,'http://www.no5.com.cn/goods/23654.html','23654',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','皮肤燥热和浊气会引发黯淡、出油和敏感等多种肌肤困扰。1、卸妆洁面：独特双重洁净配方，紧贴肌肤纹理，完全溶解粉底、B.B霜、防晒、隔离等日常淡妆。同时，毛孔内污垢和老废角质也能一洗而净。\r\n2、降燥排浊：含天然莲芯成分，降低燥热，舒缓安抚肌肤，将肌肤内积的浊气顺势带出，肌肤自然展现明亮白净。\r\n温和配方，让娇嫩肌肤不受到伤害。使用方法：\r\n取适量于掌心，加少量水轻揉，待泡沫充分溶解面部妆容后，再以清水洗净。&nbsp;','',0,0,0,0,0,'2012-03-01 16:01:42','2012-03-01 16:01:42',3,0);
INSERT INTO `goods_real` VALUES (195,1,0,0,'相宜本草','护肤','相宜本草 芯净自然净颜泡','http://photo.no5.com.cn/product/mphoto/23655_M_110830143351_36552254.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23655_M_110830143351_36552254.jpg\";}',59,'http://www.no5.com.cn/goods/23655.html','23655',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','皮肤燥热和浊气会引发黯淡、出油和敏感等多种肌肤困扰。1、深层洁净力：泡沫绵密有弹力，深层洁净毛孔，轻松带出毛孔深处的污垢和老化角质，肌肤干净清透。\r\n2、降燥排浊力：含天然莲芯成分，降低燥热，舒缓安抚肌肤，将肌肤内积的浊气顺势带出，肌肤自然展现明亮白净。\r\n天然亲肤配方，温和不刺激。使用方法：\r\n拍湿脸部，按压取适量泡沫于掌心，轻揉按摩面部后以清水冲洗即可。&nbsp;','',0,0,0,0,0,'2012-03-01 16:01:43','2012-03-01 16:01:43',3,0);
INSERT INTO `goods_real` VALUES (196,1,0,0,'草木年华','护肤','草木年华 桃颜水润净白洁面膏','http://photo.no5.com.cn/product/mphoto/23708_M_110906131328_58268104.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23708_M_110906131328_58268104.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23708_M_110906131341_11308419.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23708_M_110906131354_81533027.jpg\";}',41,'http://www.no5.com.cn/goods/23708.html','23708',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','黯黄不均，暗哑无光，干燥粗糙，干纹细纹……肌肤需要由内而外深层调理净化，祛除黄气，焕发粉嫩净白光彩。【卓越成分】\r\n粉桃精华：净化去屑，提升肌肤白皙度，令肌肤粉润净白有光泽。\r\n光果甘草根：深层美白，均匀肤色。\r\n桑白皮：具有美白修护双重作用，帮助肌肤净化老废角质，令肌肤净白透润有光泽。\r\n黄岑：温和美白，舒缓修护。\r\n雪耳：被誉为“植物透明质酸”，能够深层补水滋润，令皮肤细腻，丰润有弹性。产品说明：\r\n&#8226;丰富细腻泡沫，深入毛孔，清洁肌肤污垢，温和去除老化角质\r\n&#8226;蕴含多重植物美白成分，减轻肌肤暗沉，令肌肤通透明亮，净白有光泽。成分：\r\n水、硬脂酸、月桂酸、氢氧化钾、甘油、丙烯酸(酯)类共聚物、肉豆蔻酸、月桂基甜菜碱、N-椰油酰基-L-谷氨酸二钠、聚乙二醇-400、丁二醇、甘油硬脂酸酯和PEG-100硬脂酸酯、聚山梨醇酯-20、蓖麻油基马来酸酯类、光果甘草提取物、桑树根提取物、桃叶提取物、黄芩根提取物、海藻糖、尿囊素、羟苯甲酯、香精、双(羟甲基)咪唑烷基脲、EDTA二钠使用方法：\r\n取适量于掌心，加水揉出泡沫，再施用于脸部，轻轻打圈按摩，然后用清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:43','2012-03-01 16:01:43',3,0);
INSERT INTO `goods_real` VALUES (197,1,0,0,'草木年华','护肤','草木年华 雨林奇迹弹力丝滑洁面霜','http://photo.no5.com.cn/product/mphoto/23720_M_110906133045_61785103.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23720_M_110906133045_61785103.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23720_M_110906133101_11786324.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23720_M_110906133114_47568794.jpg\";}',41,'http://www.no5.com.cn/goods/23720.html','23720',0,'干性,油性,混合性,中性,敏感性','','','','松弛、缺乏弹性、细纹、干燥、粗糙、暗哑的轻熟龄肌肤，需要不断注入新能量，帮助肌肤回复弹力丝滑的诱人质感。【卓越成分】\r\n布里奇果油：源自热带雨林的神奇植物，补充肌肤每日所需能量，提升弹力，延缓肌肤提早衰老。\r\n雪耳精华：被誉为“植物透明质酸”，能够深层补水滋润，令皮肤细腻，丰润有弹性。\r\n燕麦精华：活化肌肤，淡化细纹，保持肌肤紧致度。产品说明：\r\n&#8226;丰润柔滑的泡沫，质地温和，肤感细腻。\r\n&#8226;深层净化，清洁多余油脂、老化角质和彩妆残留，通透毛孔。\r\n&#8226;帮助肌肤抵抗外界侵袭，恢复肌肤柔嫩丝滑。成分：\r\n水、硬脂酸、月桂酸、氢氧化钾、甘油、丙烯酸(酯)类共聚物、肉豆蔻酸、月桂基甜菜碱、N-椰油酰基-L-谷氨酸二钠、聚乙二醇－400、丁二醇、甘油硬脂酸酯和PEG-100硬脂酸酯、聚山梨醇酯-20、蓖麻油基马来酸酯类、布里奇果油、燕麦β-葡聚糖、海藻糖、尿囊素、羟苯甲酯、香精、双(羟甲基)咪唑烷基脲、EDTA-二钠使用方法：\r\n取适量于掌心，加水揉出泡沫，再施用于脸部，轻轻打圈按摩，然后用清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:44','2012-03-01 16:01:44',3,0);
INSERT INTO `goods_real` VALUES (198,1,0,0,'其他护肤品牌','护肤','DANZ 丹姿水密码活泉温和柔润洁面泡泡','http://photo.no5.com.cn/product/mphoto/23741_M_110908152240_54300667.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23741_M_110908152240_54300667.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23741_M_110908154615_51538978.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23741_M_110908114542_95121742.jpg\";}',34,'http://www.no5.com.cn/goods/23741.html','23741',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n&#8226;温柔细腻的洁面泡泡，柔和清洁皮肤，使肌肤感觉柔软、舒适。 \r\n&#8226;洁肤的同时呵护肌肤天然保护层，洗后肌肤清润舒爽不紧绷！ \r\n&#8226;冰川矿泉精华，滋养肌肤，帮助锁住肌肤天然水份，令肌肤如出水芙蓉般娇嫩亮采！ \r\n&#8226;收细毛孔，令肌肤变得细滑柔润更年轻！有效成分：\r\n水、月桂酰肌氨酸钠、月桂醇聚醚硫酸酯钠、天冬氨酸镁、葡糖酸锌、葡糖酸铜、葡糖酸锰、DMDM 乙内酰脲、香精使用方法：\r\n用水沾湿脸部，按压适量洁面泡泡于手中，轻轻按摩脸部肌肤，再以清水冲净即可。','',0,0,0,0,0,'2012-03-01 16:01:46','2012-03-01 16:01:46',3,0);
INSERT INTO `goods_real` VALUES (199,1,0,0,'其他护肤品牌','护肤','MAMONDE 梦妆花萃净白洁面粉','http://photo.no5.com.cn/product/mphoto/23755_M_110908115442_77046485.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23755_M_110908115442_77046485.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23755_M_110908115454_95789161.jpg\";}',97,'http://www.no5.com.cn/goods/23755.html','23755',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','泡沫丰盈细腻，先进的胶囊化技术使木瓜蛋白酶成分更稳定，温和清除肌肤表面油脂和老化角质，不刺激肌肤。 烟酰胺(Niacinamide)成分帮助调理角质层，改善黯沉肤色。花萃净白复合体(Pure White Complex)成分给予肌肤更多净白养护。在洁肤第一步，即能感受到肌底被唤醒般的净透皙白。 蕴含的珍贵松口蘑萃取物具有舒缓肌肤的功效，强化保护洁面时容易敏感的肤质。通过促进肌肤循环，让之后涂抹的美容成分均匀渗透，发挥更佳护肤效果。 \r\n&nbsp;\r\n使用方法：\r\n将面部与双手充分浸湿后，于手心倒出适量洁面粉，加少量水揉擦手掌生成丰富泡沫后，依照额头-鼻子-下颌-面颊的顺序，轻柔地打圈按摩清洁。而后用温水冲洗干净，再以冷水轻轻拍打面部。 \r\n注意:敏感肌肤请勿将本品与磨砂膏产品同时使用。','',0,0,0,0,0,'2012-03-01 16:01:48','2012-03-01 16:01:48',3,0);
INSERT INTO `goods_real` VALUES (200,1,0,0,'其他护肤品牌','护肤','B&C TSURURI 小鼻黑泥炭角栓洁颜皂(04484)送起泡网','http://photo.no5.com.cn/product/mphoto/23766_M_110909122014_92243324.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23766_M_110909122014_92243324.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23766_M_110909122027_60855385.jpg\";}',98,'http://www.no5.com.cn/goods/23766.html','23766',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','摩洛哥矿物泥+活性炭，提升泡沫黏着力，吸附毛孔角栓。12种植物精油作用力，溶解彩妆污垢！使用方法：\r\n1、先将盒子上下左右按压，让空气进入后，再按压盒底即可取出。\r\n2、请先沾湿脸部，加水揉搓起泡，揉搓出充分的泡沫之后，用泡沫轻柔按摩脸，再以温水洗净。','',0,0,0,0,0,'2012-03-01 16:01:49','2012-03-01 16:01:49',3,0);
INSERT INTO `goods_real` VALUES (201,1,0,0,'AVON 雅芳','护肤','AVON雅芳滢泽水润洁面乳','http://photo.no5.com.cn/product/mphoto/23801_M_110928155913_97106147.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23801_M_110928155913_97106147.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23801_M_111013165318_19068886.jpg\";}',39,'http://www.no5.com.cn/goods/23801.html','23801',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','泡沫丰富细腻，有效洁净面部脏污和多余油脂；特含升级水均衡提升因子（棕榈酰寡肽）帮助调整肌肤回复自然水润状态。洗后肌肤纯净光滑，散发健康水润光彩。使用方法：\r\n先洗湿面部，取适量于掌心，家伙随揉搓起泡，轻柔打圈按摩脸部，再以清水洗净。','',0,0,0,0,0,'2012-03-01 16:01:50','2012-03-01 16:01:50',3,0);
INSERT INTO `goods_real` VALUES (202,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝控油调护洁面粉(99812)','http://photo.no5.com.cn/product/mphoto/23865_M_111008133750_42541176.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23865_M_111008133750_42541176.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23865_M_111008133800_91985145.jpg\";}',104,'http://www.no5.com.cn/goods/23865.html','23865',0,'','','','','商品详情分解皮脂和分解蛋白质的两种酶，清除毛孔黑头及老化角质。\r\n每次都能新鲜使用的弱酸性的粉末，不给肌肤添加负担，洗出清爽美肌。\r\n清除不易清理的毛孔污垢，提高后续化妆品的渗透吸收效果。\r\n提高肌肤的防御功能和抵抗力，打造不易生粉刺和痘痘的靓丽肌肤。使用方法取1次量（1小盒）的洁面粉于掌心，\r\n使用少量清水或温水充分打泡后洁面。\r\n使用时，密封薄膜两侧均可开启。','',0,0,0,0,0,'2012-03-01 16:01:50','2012-03-01 16:01:50',3,0);
INSERT INTO `goods_real` VALUES (203,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝控油调护洁面粉(99813)','http://photo.no5.com.cn/product/mphoto/23867_M_111008134913_85864387.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23867_M_111008134913_85864387.jpg\";}',55,'http://www.no5.com.cn/goods/23867.html','23867',0,'','','','','商品详情分解皮脂和分解蛋白质的两种酶，清除毛孔黑头及老化角质。\r\n每次都能新鲜使用的弱酸性的粉末，不给肌肤添加负担，洗出清爽美肌。\r\n清除不易清理的毛孔污垢，提高后续化妆品的渗透吸收效果。\r\n提高肌肤的防御功能和抵抗力，打造不易生粉刺和痘痘的靓丽肌肤。使用方法取1次量（1小盒）的洁面粉于掌心，\r\n使用少量清水或温水充分打泡后洁面。\r\n使用时，密封薄膜两侧均可开启。','',0,0,0,0,0,'2012-03-01 16:01:53','2012-03-01 16:01:53',3,0);
INSERT INTO `goods_real` VALUES (204,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝柔润洗面霜(158371)','http://photo.no5.com.cn/product/mphoto/23872_M_111008141916_73778053.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23872_M_111008141916_73778053.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23872_M_111008141926_62105079.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23872_M_111008141936_66944557.jpg\";}',98,'http://www.no5.com.cn/goods/23872.html','23872',0,'','','','','商品详情滋润柔和的泡沫轻轻包覆易干燥的肌肤。\r\n不给肌肤添加任何负担，彻底清除肌理及毛孔中的污垢。\r\n使后续化妆品容易渗透，洗后肌肤滋润柔滑。\r\n严格选取优质而低刺激性的原料，不给柔嫩的肌肤添加任何负担。使用方法先将脸部打湿，取樱桃大小的量于掌心，再用清水或温水充分打泡后清洗。','',0,0,0,0,0,'2012-03-01 16:01:57','2012-03-01 16:01:57',3,0);
INSERT INTO `goods_real` VALUES (205,1,0,0,'freeplus 芙丽芳丝','护肤','freeplus芙丽芳丝润滑洁面ㄠ(158340)','http://photo.no5.com.cn/product/mphoto/23891_M_111008164937_57599312.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23891_M_111008164937_57599312.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23891_M_111008164951_89668403.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23891_M_111008165001_10380074.jpg\";}',98,'http://www.no5.com.cn/goods/23891.html','23891',0,'','','','','商品详情滋润柔和的泡沫轻轻包覆易干燥的肌肤。\r\n不给肌肤添加任何负担，彻底清除肌理及毛孔中的污垢。\r\n使后续化妆品容易渗透，洗后肌肤滋润柔滑。\r\n严格选取优质而低刺激性的原料，不给柔嫩的肌肤添加任何负担。使用方法先将脸部打湿，取樱桃大小的量于掌心，再用清水或温水充分打泡后清洗。','',0,0,0,0,0,'2012-03-01 16:01:58','2012-03-01 16:01:58',3,0);
INSERT INTO `goods_real` VALUES (206,1,0,0,'L’Occitane 欧舒丹','护肤','L’Occitane欧舒丹橙花香皂(18555)','http://photo.no5.com.cn/product/mphoto/23896_M_111008174910_66121956.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23896_M_111008174910_66121956.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23896_M_111008174937_77311531.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/23896_M_111008175003_31542488.jpg\";}',46,'http://www.no5.com.cn/goods/23896.html','23896',0,'','','','','【功效简介】\r\n以植物成份u成的香皂，砭d密而芳香的泡沫，睾Q肌w，用後不令皮w乾燥，更散l活花香。\r\n【成分介绍】\r\n橙花是指苦橙的白色花瓣，主要来源为法国南部、摩洛哥、埃及、意大利，精油为采用蒸馏法而得，接近透明的浅黄，价格昂贵，因为其产出比和玫瑰几乎一样少，１００公斤才可生产８０公克，为带有点苦味、药味的百合花香味。\r\n【使用说明】身体护理产品。\r\n【适用肤质】任何肤质弄湿香皂后直接或带上沐浴手套按摩全身，再以水清洗。','',0,0,0,0,0,'2012-03-01 16:02:00','2012-03-01 16:02:00',3,0);
INSERT INTO `goods_real` VALUES (207,1,0,0,'L’Occitane 欧舒丹','护肤','L’Occitane欧舒丹红米清爽洁面乳(150795)','http://photo.no5.com.cn/product/mphoto/23918_M_111010144836_49974800.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23918_M_111010144836_49974800.jpg\";}',52,'http://www.no5.com.cn/goods/23918.html','23918',0,'','','','','能洁净肌肤，平衡油脂分泌，保持肌肤的天然平衡。成分：水，麦芽糊精，香橡皮油，香豆素，榆绣线菊提取物。【使用方法】\r\n置掌心中加水揉出柔细泡沫，然后按摩脸部，用水洗净，早晚清洁面部及颈部。','',0,0,0,0,0,'2012-03-01 16:02:01','2012-03-01 16:02:01',3,0);
INSERT INTO `goods_real` VALUES (208,1,0,0,'Kiehl’s 科颜氏','护肤','Kiehl’s科颜氏高保湿洁面ㄠ(024192)','http://photo.no5.com.cn/product/mphoto/23940_M_111018161442_34768349.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23940_M_111018161442_34768349.jpg\";}',144,'http://www.no5.com.cn/goods/23940.html','23940',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品特色：● 自1970年推出以来，即不限男女、适用于各肤质的热卖品。\r\n● 能彻底清洁皮肤并清除残妆，而不会洗去皮肤天然的油脂造成紧绷不适感。\r\n● 高度精炼的角鲨烷, 粹取自橄榄；与皮肤的天然油份极其兼容，非常能吸收且柔软。\r\n● 经皮肤专家安全测试, 是一款敏感性肤质亦适用的轻柔保湿洁面乳这款温和的洁面乳温和的发泡配方，能溶解多余油脂彻底清洁皮肤并清除残妆，同时不会洗去皮肤天然的油脂，保持皮肤的自然防护功能。蕴涵角鲨烷，是高度精练的保湿油。同时添加温和的杏籽油，甜杏仁油等保湿成分，清洁的同时不会造成皮肤干燥。适合各类型肌肤，包括敏感性肌肤。\r\n主要成分：杏仁油杏仁油用杏仁提炼而成，蕴含大量维生素E（可加速脂肪吸收）。\r\n它是一种甘油三酸酯，含有75%的油酸、20%的亚油酸以及不饱和脂肪酸甘油脂 - 类似鳄梨油和芝麻油。\r\n人们发现它具有高度的亲肤性。 杏仁油可使肌肤润泽光滑，亮丽柔软。 牛油果油牛油果油用美洲热带牛油果树的果实提炼而成，是一种饱含脂肪酸的润滑剂，\r\n在所有的果油中保湿功能最强。它也是自然界中氨基酸蛋白、维生素A、D、E及钠元素的来源之一。\r\n有助于恢复肌肤的天然保湿功能。 \r\n角鲨烷（又称Perhydrosqualene或perhydrosqualene vegetal）角鲨烷是用橄榄制成的一种质地极为细腻的保湿油；质地如丝般光滑，容易吸收，\r\n可与人体自身油脂轻松融合；科颜氏众多产品中均添加了角鲨烷。 \r\n使用方法：\r\n用干净的指腹取少量,避开眼周在湿润的肌肤上向上轻轻打圈按摩,片刻后彻底冲洗干净并用湿毛巾清除残留物。','',0,0,0,0,0,'2012-03-01 16:02:02','2012-03-01 16:02:02',3,0);
INSERT INTO `goods_real` VALUES (209,1,0,0,'L’Occitane 欧舒丹','护肤','L’Occitane欧舒丹乳木果丰凝洁面皂(171738)','http://photo.no5.com.cn/product/mphoto/23944_M_111011173844_89465156.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23944_M_111011173844_89465156.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/23944_M_111011173854_31869331.jpg\";}',85,'http://www.no5.com.cn/goods/23944.html','23944',0,'','','','','乳霜配方洁面皂，以极度温和的植物洁净成份制成，含丰富乳木果油，温和洁净肌肤，洁净过程不会引起肌肤干燥与紧绷不适。\r\n泡沫幼滑如霜，用后令肌肤柔软、舒适、清新。\r\n将洁面皂置于湿润的掌心搓揉至充分起泡， 将细腻柔软的泡沫包覆整个脸部，用清水或温水充分冲洗干净。适合任何肌肤使用。','',0,0,0,0,0,'2012-03-01 16:02:02','2012-03-01 16:02:02',3,0);
INSERT INTO `goods_real` VALUES (210,1,0,0,'L’Occitane 欧舒丹','护肤','L\'Occitane欧舒丹蜡菊亮肤洁面泡沫(115015)','http://photo.no5.com.cn/product/mphoto/23950_M_111011180025_11716286.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/23950_M_111011180025_11716286.jpg\";}',246,'http://www.no5.com.cn/goods/23950.html','23950',0,'','','','','性质温和的泡沫洁面产品，彻底清除杂质、彩妆及日间或晚间积聚的污垢。\r\n配方蕴含蜡菊花水及柑橘果皮精华，用后令肤色更均匀、更明亮，适合任何肌肤使用。来自法国着名的无污染胜地普罗旺斯,至今已有三十年历史,其产品全部来自自然,以自然及芳香疗法原理研制,并保证生产过程无污染.产品主要原料为蜜蜂副产品,配以高品质的植物精油,如薰衣草,天竺葵等,开发出众多系列不同功效的身体护理品.温暖气候造就了肥沃的土地及普罗旺斯人爽朗的个性。普罗旺斯代代相传的工艺、习俗及传统，处处流露出阳光般的明亮感觉。我认为家乡最美的，莫过于阳光、庄稼以及我们对大自然的热爱。我衷心希望与世界各地的人分享，于是创办了L\'OCCITANE。','',0,0,0,0,0,'2012-03-01 16:02:03','2012-03-01 16:02:03',3,0);
INSERT INTO `goods_real` VALUES (211,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂透白美肌亮润洁面膏(10390)','http://photo.no5.com.cn/product/mphoto/24032_M_111025143949_36266609.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24032_M_111025143949_36266609.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24032_M_111025143959_69461799.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24032_M_111025144016_31026131.jpg\";}',285,'http://www.no5.com.cn/goods/24032.html','24032',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','加速调控斑点，突破透亮极限。2010年，资生堂结合百年美白智慧结晶与最新科技、延续美白及透明感两项保养诉求，先上全新进化升级的<新美 透 白>，添加美白成分4MSK及传明酸，形成创新美白科技，能锁定麦拉宁的3个形成阶段并彻底抑制。透过全系列商品中有效成分日以继夜作用，成就亮白系统，不仅改善、预防斑点及肤色不均，更创造由肌肤内部绽放明亮的美透白肌。突破亮白极限。透白美肌亮润洗面膏添加独特细致美白微粒，可温和洗去蕴含黑色素的老化角质，锁住肌肤必要水分，使肌肤更具透明感。使用方法：\r\n取适量洗面膏，加少量水揉搓起丰富泡沫，然后再面部轻轻打圈按摩，再用清水充分清洗。','',0,0,0,0,0,'2012-03-01 16:02:04','2012-03-01 16:02:04',3,0);
INSERT INTO `goods_real` VALUES (212,1,0,0,'Guerlain 娇兰','护肤','Guerlain 娇兰珍白泡沫洁面乳(60919)','http://photo.no5.com.cn/product/mphoto/24075_M_111103145410_72592903.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24075_M_111103145410_72592903.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24075_M_111103145426_22857796.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24075_M_111103145436_10130135.jpg\";}',345,'http://www.no5.com.cn/goods/24075.html','24075',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','经科学证实，珍珠的珠母体内蕴含刺激细胞活动的分子，而Guerlain 就以双层黑色素细胞角蛋白细胞系统，利用由宇和岛珍珠提炼而成的珍珠精华，成功研制独一无二的P.E.A.R.L.美白复合物，针对性击退色斑的形成，刺激其自体分解，让肤色回服亮白剔透。P.E.A.R.L. 复合物有效于皮肤表面发挥多层活化功能，针对色斑的源头，从深层位置开始，逐层地释出堵塞的黑色素，并调控黑色素合成，从而控制色素沉淀过程。珍珠极光绽白系列每一款产品，在使用时，质地、香味、触觉等感官都是一场夏日的飨宴，轻盈、新鲜且带有天真的气息，伴随着发亮的小白花、粉红干胡椒和白薄荷香。每一次使用，透过完美感官的体验，都能感受到肌肤正宛如珍珠般层层焕生更晶莹纯净的蜕变。娇兰珍珠极光绽白洁面乳，蕴含温和的珍珠磨砂微粒，日复日地亮化肤色，去除所有不需要的杂质和油光。','',0,0,0,0,0,'2012-03-01 16:02:05','2012-03-01 16:02:05',3,0);
INSERT INTO `goods_real` VALUES (213,1,0,0,'Clinique 倩碧','超值小样','Clinique 倩碧洁面皂-温和型(3个装)','http://photo.no5.com.cn/product/mphoto/24099_M_111109135821_49256569.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24099_M_111109135821_49256569.jpg\";}',54,'http://www.no5.com.cn/goods/24099.html','24099',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','用洁面皂清洁肌肤－倩碧皮肤科医生的最佳选择。\r\n倩碧洁面皂可使肌肤保持清新，洁净，舒适，无干燥紧绷感。\r\n分为柔性、温和型和加强型３款，适合不同肌肤类型的您。','',0,0,0,0,0,'2012-03-01 16:02:05','2012-03-01 16:02:05',3,0);
INSERT INTO `goods_real` VALUES (214,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻智能愉悦臻白洁面泡沫','http://photo.no5.com.cn/product/mphoto/24121_M_111109140602_93781410.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24121_M_111109140602_93781410.jpg\";}',49,'http://www.no5.com.cn/goods/24121.html','24121',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','温和洗去脸上的不洁物及彩妆，美白肌肤的第一步。兰蔻智能愉悦臻白洁面泡沫 全面更新的Lanc&ocirc;me兰蔻美白洁面产品，带来全新的洁面体验。洁净肌肤：泡沫细腻丰盈，濯净杂质与暗沉，有效清洁肌肤。洗后肌肤新鲜如初，柔软白皙。早晚美白第一步：每日早晚，取适量加水揉出丰富泡沫，轻轻按摩面部肌肤，彻底清洁后以温水洗净，肌肤再现澄净柔嫩。每天使用，保持肌肤澄澈透亮。','',0,0,0,0,0,'2012-03-01 16:02:06','2012-03-01 16:02:06',3,0);
INSERT INTO `goods_real` VALUES (215,1,0,0,'Lancome 兰蔻','超值小样','Lancome 兰蔻新清滢洁面乳','http://photo.no5.com.cn/product/mphoto/24126_M_111109141021_55954109.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24126_M_111109141021_55954109.jpg\";}',49,'http://www.no5.com.cn/goods/24126.html','24126',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','丰富莹白的泡沫，深层清理肌肤中的杂质。富含抗氧化成分，以及白莲与法国玫瑰精华，与肌肤很好接合，达到深层洁净的效果。 用法：\r\n用于润湿的脸部，加以按摩充分洁净肌肤，然后以温水洗净。避免接触眼睛。','',0,0,0,0,0,'2012-03-01 16:02:07','2012-03-01 16:02:07',3,0);
INSERT INTO `goods_real` VALUES (216,1,0,0,'CETAPHIL 丝塔芙','护肤','CETAPHIL丝塔芙洗面奶','http://photo.no5.com.cn/product/mphoto/24147_M_111115110903_25748573.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24147_M_111115110903_25748573.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24147_M_111115110929_37201820.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24147_M_111115110937_61624428.jpg\";}',82,'http://www.no5.com.cn/goods/24147.html','24147',0,'敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','不含皂，无刺激性清洁成分，柔和清洁。 \r\n弱酸配方，接近人体正常肌肤需求。 \r\n不含香料、色素，无刺激，安全适用于敏感肌肤。 \r\n清洗后留有薄薄一层保护膜，给肌肤即刻柔润保护。 \r\n水洗、干洗皆宜。 适用人群\r\n健康肌肤的日常清洁护理 \r\n一般敏感及脆弱肌肤（干燥、痤疮类肌肤；对水质敏感类肌肤） \r\n婴幼儿肌肤（正常或患有皮炎湿疹的婴幼儿肌肤） \r\n使用皮肤药物时而引起皮肤干燥蜕皮的患者； 干水洗两用：独特免洗配方，可直接干洗，方便又安心。 \r\n轻松卸妆：卸除淡妆，一步搞定，可多次卸妆不伤害肌肤。','',0,0,0,0,0,'2012-03-01 16:02:08','2012-03-01 16:02:08',3,0);
INSERT INTO `goods_real` VALUES (217,1,0,0,'其他护肤品牌','护肤','韩国思美兰石榴皂','http://photo.no5.com.cn/product/mphoto/24148_M_111115110955_57530647.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24148_M_111115110955_57530647.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24148_M_111115111005_34376961.jpg\";}',15,'http://www.no5.com.cn/goods/24148.html','24148',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','传统水果香味，柔软，舒适， 清洁皮肤。思美兰石榴皂，美白保湿，淡化黑色素，深层清洁皮肤，滋润不紧绷。成分 \r\n天然石榴保湿成分，米糠蛋白，维生素E 维生素A 。使用方法 \r\n使用于湿润的脸部和颈部肌肤，加入适量清水令泡沫更丰富，用清水和温湿毛巾冲洗干净。','',0,0,0,0,0,'2012-03-01 16:02:08','2012-03-01 16:02:08',3,0);
INSERT INTO `goods_real` VALUES (218,1,0,0,'其他护肤品牌','护肤','韩国思美兰莲花皂(特价！)','http://photo.no5.com.cn/product/mphoto/24149_M_111115111023_30564705.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24149_M_111115111023_30564705.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24149_M_111115111037_56184822.jpg\";}',10,'http://www.no5.com.cn/goods/24149.html','24149',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','质地很软，泡沫非常细腻，洗后清爽不紧绷。平衡舒缓皮肤的内饰 ，使皮肤处于一个清爽的环境 清洁皮肤，留下淡淡花香质地很软，泡沫非常细腻，洗后清爽不紧绷。成分 \r\n从莲花瓣中提炼出平衡和舒缓皮肤成分，柔和米糠蛋白，大米天然保湿成分。适用混合-油性肌肤使用方法 \r\n使用于湿润的脸部和颈部肌肤，加入适量清水令泡沫更丰富，用清水和温湿毛巾冲洗干净。','',0,0,0,0,0,'2012-03-01 16:02:09','2012-03-01 16:02:09',3,0);
INSERT INTO `goods_real` VALUES (219,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP E`thym 02水润优氧净颜洗面奶(04336)','http://photo.no5.com.cn/product/mphoto/24160_M_111115113230_67548805.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24160_M_111115113230_67548805.jpg\";}',45,'http://www.no5.com.cn/goods/24160.html','24160',0,'','','','','The Face Shop E\'thym O2水润优氧系列，特别5free自然健康护肤，更天然更安全更出色！水润优氧净颜洗面奶，泡沫细腻丰盈，彻底清洁附着皮肤油脂及污垢，洁净同时带来水润清新感受，富含O2活氧水及天然芦荟保湿精华，连续使用调节改善肌底水油平衡，令肌肤水润柔滑倍感清新舒适。特别 5 free自然护肤：不含矿物油\r\n不含防腐剂\r\n不含人工香料\r\n不含人工色素\r\n不含动物性原料\r\n天然原料呵护调理肌肤，经有关权威性部门验证，不含有任何伤害肌肤的成分，是款安全性高可放心使用的产品。使用方法：\r\n取适量加水，揉搓成泡沫，涂抹于脸部适度按摩，再以温水冲净即可。','',0,0,0,0,0,'2012-03-01 16:02:09','2012-03-01 16:02:09',3,0);
INSERT INTO `goods_real` VALUES (220,1,0,0,'佰草集','护肤','佰草集 悦风舒润洁面ㄠ','http://photo.no5.com.cn/product/mphoto/24232_M_111118143601_83348518.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24232_M_111118143601_83348518.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24232_M_111118143613_50823494.jpg\";}',96,'http://www.no5.com.cn/goods/24232.html','24232',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品成分：\r\n黄芩、地肤子、辛夷、防风等十八味中草药精华产品功效：\r\n佰草集悦风舒润洁面ㄠ，蕴含黄芩、地肤子、辛夷、防风等十八味中草药精华，ㄠ质地温和轻柔，在按摩肌肤的同时中草药精华深入清洁，为肌肤排浊减压，有助于舒缓和安抚疲惫不适的肌肤。使用方法：\r\n先蘸湿面部，挤出适量（樱桃般大小，约2克）于掌心，加水轻揉后，在面部轻轻按摩，再以温水洗净。搭配佰草集悦风舒润系列产品共同使用，效果尤佳。&nbsp;&nbsp;&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:10','2012-03-01 16:02:10',3,0);
INSERT INTO `goods_real` VALUES (221,1,0,0,'Anna Sui 安娜苏','护肤','Anna Sui安娜苏水精灵洁颜慕丝(11206)','http://photo.no5.com.cn/product/mphoto/24254_M_111116114029_18393227.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24254_M_111116114029_18393227.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24254_M_111116114047_60240150.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24254_M_111121162710_30912148.jpg\";}',247,'http://www.no5.com.cn/goods/24254.html','24254',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','古典甜美的淡紫色全新包装设计、成份升级的蔷薇保湿复合物，能维持肌肤长时间保湿、调理肌肤循环，让肌肤在上妆前，呈现自然的透亮水嫩！滋润、紧实、舒缓三重功效将带给前所未有的保湿魔法新体验！让更愉悦的享受护肤时光！充满丰富弹力泡沫的慕丝质地，可深层清洁毛孔；富含植物氨基酸保湿效果的玫瑰果油与多重植物精华，让洗净后肌肤清爽柔滑、滋润保湿!\r\n\r\n香调\r\n带有天然果香的蔷薇香氛，在加上甜美浪漫的白玫瑰花果香调，具有柔滑、镇静舒缓与拉提肌肤的香氛疗效。\r\n\r\n使用方法：\r\n湿润脸部及颈部后取适量搓揉于脸部及颈部，然后用清水洗干净。','',0,0,0,0,0,'2012-03-01 16:02:13','2012-03-01 16:02:13',3,0);
INSERT INTO `goods_real` VALUES (222,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉活泉臻透洁面乳(83333)','http://photo.no5.com.cn/product/mphoto/24263_M_111116154613_31135994.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24263_M_111116154613_31135994.jpg\";}',185,'http://www.no5.com.cn/goods/24263.html','24263',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','解决肌肤因老废角质堆积，造成表面粗糙，暗黄的问题\r\n蓝色植物按摩颗粒，每日温和代谢老废角质。 在深层清洁的同时按摩微粒帮助加快肌肤微循环\r\n5000公升矿物温泉精粹保湿不紧绷配方，轻松带走日常污垢，还原无负担的肌肤净化状态。\r\n\r\n主要成分：\r\n- PTP矿泉舒活因子\r\n- 不紧绷保湿配方\r\n- 天然晶透微粒\r\n\r\n使用方法：\r\n早、晚清水湿面，挤珍珠粒大小，混合， 清水起泡沫，避开眼周于面部打圈清洁','',0,0,0,0,0,'2012-03-01 16:02:14','2012-03-01 16:02:14',3,0);
INSERT INTO `goods_real` VALUES (223,1,0,0,'百雀羚','护肤','百雀羚草本水嫩盈透洁面泡沫','http://photo.no5.com.cn/product/mphoto/24323_M_111123161622_85290351.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24323_M_111123161622_85290351.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24323_M_111123161634_98375068.jpg\";}',45,'http://www.no5.com.cn/goods/24323.html','24323',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','[净化]丰富细腻的泡沫，能深入毛孔深处，净化深层油腻及污垢，预防多余油脂产生，肌肤澄澈洁净。\r\n[盈透]蕴含红景天.益母草.忍冬花等天然五行本草精华,注入鲜活的本草保湿能量,调理出水嫩盈透的健康肌肤。 \r\n[水嫩]在绵密泡沫的持续作用下，洁面过程更加清真.温和.水嫩滋润不紧绷!使用方法：\r\n湿面后，轻轻泵盖，压取适量泡沫于掌心，由下巴往额头方向轻轻按摩全脸再用清水洗净即可。成分：\r\n水.甘油.椰油酰甘氨酸钾.双丙甘醇.月桂醇硫酸脂TEA盐.椰油酰两性基二乙酸二钠.丁二醇.苯氧乙醇.羟苯甲酯.PEG-60氢化蓖麻油.(日用)香精.尿囊素.茶叶提取物.地黄根提取物.诃子果提取物.山茱萸果提取物.圣地红景天根提取物,高良姜根提取物,光果甘草根提取特,麦冬根提取物.黄蘖树皮提取物,芍药根提取物.东当归根提取物,知母根提取物.忍冬花提取物.细叶益母草提取物。','',0,0,0,0,0,'2012-03-01 16:02:15','2012-03-01 16:02:15',3,0);
INSERT INTO `goods_real` VALUES (224,1,0,0,'Benefit 贝玲妃','护肤','Benefit 贝玲妃泡沫洁面膏(03810)','http://photo.no5.com.cn/product/mphoto/24346_M_111129093326_49312874.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24346_M_111129093326_49312874.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24346_M_111129093334_35530525.jpg\";}',161,'http://www.no5.com.cn/goods/24346.html','24346',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','洁净透亮，不同凡响。\r\n这款一步到位的温和洁面膏，泡沫柔细绵密，深层洁净肌肤，能有效清除污垢及残留彩妆。\r\n同时蕴含氨基酸及天然植物萃取，清洁时能有效延长肌肤锁水时间。\r\n每天使用，肌肤洁净清爽，容光焕发。\r\n适用于所有肌肤类型。使用方法：\r\n先用水将脸沾湿，取适量泡沫洁面膏，用手搓起丰富泡沫后以画圈的方式轻轻按摩全脸，再以温水冲洗干净即可。','',0,0,0,0,0,'2012-03-01 16:02:15','2012-03-01 16:02:15',3,0);
INSERT INTO `goods_real` VALUES (225,1,0,0,'佰草集','护肤','佰草集 滋润洁面乳','http://photo.no5.com.cn/product/mphoto/24359_M_111130174102_38137032.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24359_M_111130174102_38137032.jpg\";}',49,'http://www.no5.com.cn/goods/24359.html','24359',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n佰草集滋润洁面乳，蕴含枸杞、麦冬等中草药精华，丰厚细腻，能有效洗净面部肌肤，保持肌肤滋润幼滑。适合中性至干性肌肤。产品成分：\r\n枸杞、麦冬中草药精华说明：有效洗净面部肌肤，保持肌肤滋润幼滑使用方法：\r\n先蘸湿面部，挤出适量（樱桃般大小，约2克）于掌心，加水揉匀，在面部轻轻按摩，再以温水洗净。搭配佰草集滋润系列产品共同使用，效果尤佳。','',0,0,0,0,0,'2012-03-01 16:02:16','2012-03-01 16:02:16',3,0);
INSERT INTO `goods_real` VALUES (226,1,0,0,'佰草集','护肤','佰草集 新恒美紧肤洁面乳','http://photo.no5.com.cn/product/mphoto/24361_M_111130174148_41092354.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24361_M_111130174148_41092354.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24361_M_111130174201_38669868.jpg\";}',120,'http://www.no5.com.cn/goods/24361.html','24361',0,'干性,油性,混合性,中性,敏感性','','','','产品功效：\r\n佰草集新恒美紧肤洁面乳，蕴含雪莲花、御苁蓉、黄芪等中草药精华，能温和洗净面部肌肤，泡沫柔软丰富，令肌肤紧实滑爽。适合年轻肌肤使用。产品成分：\r\n雪莲花、御苁蓉、黄芪中草药精华使用方法：\r\n先蘸湿面部，挤出适量（樱桃般大小，约2毫升）于掌心，加水揉出泡沫，在面部轻轻按摩，再以温水洗净。搭配佰草集新恒美紧肤系列产品共同使用，效果尤佳。','',0,0,0,0,0,'2012-03-01 16:02:17','2012-03-01 16:02:17',3,0);
INSERT INTO `goods_real` VALUES (227,1,0,0,'佰草集','护肤','佰草集 肌活新颜洁肤泡','http://photo.no5.com.cn/product/mphoto/24367_M_111130174447_35150124.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24367_M_111130174447_35150124.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24367_M_111130174455_49146706.jpg\";}',97,'http://www.no5.com.cn/goods/24367.html','24367',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n佰草集肌活新颜洁肤泡蕴含由桃花、豆蔻、蔓荆、人参等中草药精华组成的\"桃花豆蔻方\"，清香醒神；细腻丰富的碳酸泡，配合温和弱酸性氨基酸洁颜成分，清洁肌肤的同时将中草药活性成分注入肌肤，促进肌肤活力，令肌肤清新舒适、柔润嫩滑。 产品成分：\r\n桃花、豆蔻、蔓荆、人参等中草药精华组成的\"桃花豆蔻方\"使用方法：\r\n先蘸湿面部，充分振摇瓶体，轻按喷头挤出适量洁颜泡（约鸡蛋大小）于掌心，在面部轻轻按摩，再以温水洗净。','',0,0,0,0,0,'2012-03-01 16:02:17','2012-03-01 16:02:17',3,0);
INSERT INTO `goods_real` VALUES (228,1,0,0,'Laneige 兰芝','护肤','Laneige 兰芝雪漾亮白洁面泡沫(23292)','http://photo.no5.com.cn/product/mphoto/24392_M_111206094312_70911995.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24392_M_111206094312_70911995.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24392_M_111206094339_65720955.jpg\";}',198,'http://www.no5.com.cn/goods/24392.html','24392',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','功效：\r\n是一款以胺基酸为基础洁颜慕斯，其柔滑细致的泡沫分子能分解、代谢老废角质，深入毛孔净化脏污，让肌肤呈现亮采光泽。　　　　　　　　　　　　白茶与水飞蓟萃取能改善肤色不均与暗沉，全面提升肌肤明亮度。洗后给予肌肤柔嫩、洁净与亮白的清爽感受。使用方法：\r\n按压1~2次至手掌心，轻轻按摩于湿润的脸上，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:02:18','2012-03-01 16:02:18',3,0);
INSERT INTO `goods_real` VALUES (229,1,0,0,'Clarins 娇韵诗','超值小样','Clarins 娇韵诗纯净洁颜凝胶(13205)','http://photo.no5.com.cn/product/mphoto/24401_M_111206113704_97865577.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24401_M_111206113704_97865577.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24401_M_111206113316_24036080.jpg\";}',55,'http://www.no5.com.cn/goods/24401.html','24401',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','凝胶-果油-乳液，三重质地变化，包裹肌肤表面污垢并深度清洁。蕴含纯净硬果油，让你摆脱对传统矿物油卸妆产品的顾虑。更含有四倍于柑橘浓度的维他命C\r\n按摩促进吸收。\r\n易清洗。\r\n清新怡人，花香扑鼻。\r\n通过皮肤专家测试。适用于具有以下特点的用户：\r\n喜欢清水洁面的清新、爽洁感受。 \r\n浓妆女性。产品功效：\r\n深度清洁，彻底清除妆容\r\n-清除所有杂质，溶解油质与浓妆。\r\n-彻底清除所有残留杂质；易清洗。\r\n-皮肤清新光洁，柔嫩无油光。\r\n\r\n舒缓肌肤，精心呵护\r\n-保持皮肤水脂膜；软化和缓肌肤，再现舒适清新感受。 \r\n-使皮肤柔嫩光滑，恢复自然舒适状态。\r\n\r\n产品成分：\r\n矿物油，硬果油，硅树脂。\r\n柔和植物清洁基（棕榈与椰子）\r\n硅树脂\r\n硬果油，甘油三酸酯。\r\n\r\n使用方法：\r\n最好在晚间使用，适合干性皮肤。以指尖醮取少量本品，涂抹于整个面部。\r\n轻轻划圈按摩片刻，使皮肤得到放松，去除残妆与杂质。 \r\n加少量水即可乳化，易清洗。\r\n也适合早晨使用。','',0,0,0,0,0,'2012-03-01 16:02:19','2012-03-01 16:02:19',3,0);
INSERT INTO `goods_real` VALUES (230,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗清透美白洁面慕丝(12145)2个装','http://photo.no5.com.cn/product/mphoto/24405_M_111209141610_86540046.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24405_M_111209141610_86540046.jpg\";}',85,'http://www.no5.com.cn/goods/24405.html','24405',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于：\r\n所有希望明亮肤色并且喜欢清爽水洗泡沫质地清洁产品的女性。 特点：\r\n泡沫丰富,质地细腻温和，用后滋润不干燥，具有纯净肤质和明亮肤色的出色功效。是每天清新美白步骤的关键第一步。产品功效：\r\n清洁功效：清除杂质和污垢、保护皮脂膜；\r\n明亮肌肤：明亮通透肌肤；刺激淋巴及血液循环，排水、排毒；净化及收紧毛孔。产品成分：\r\nJua From Brazil巴西枣树\r\nAlchemilla 天山雨衣草\r\nParsley 欧芹使用方法：\r\n早晨或晚上湿手湿脸使用，取适量轻轻揉出泡沫，涂抹于面部和颈部，以打圈的方式轻柔按摩（避开眼周使用）。早晨用冷水冲洗，晚上用温水冲洗。&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:22','2012-03-01 16:02:22',3,0);
INSERT INTO `goods_real` VALUES (231,1,0,0,'Clarins 娇韵诗','超值小样','Clarins 娇韵诗清透美白深层洁肤露(12115)2个装','http://photo.no5.com.cn/product/mphoto/24409_M_111209141437_61826301.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24409_M_111209141437_61826301.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24409_M_111209141512_93411994.jpg\";}',72,'http://www.no5.com.cn/goods/24409.html','24409',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于：\r\n所有渴望动人肌肤与无油光粉嫩容颜的女性，所有希望获得亮丽容颜，塑造柔嫩娇美皮肤的女性。\r\n\r\n特点：\r\n清新舒适的乳液质地。\r\n通过皮肤专家测试，不会产生粉刺。\r\n不含油质。\r\n\r\n高效亮白\r\n在黑素细胞中心：减缓黑色素向角化细胞的转移，减缓黑色素的合成。减缓黑素细胞的繁殖。\r\n在表皮层与真皮层：减缓促进色素沉着的因子生成速度。色素沉着与紫外线、发炎、压力与年龄增长有关。\r\n高效清透\r\n刺激血液循环与淋巴排泄。保护血管壁，净化皮肤。高效补水与软化帮助皮肤补水，平缓发炎迹象。调理皮肤。成分\r\n锁颜美白系统（Lock-Around System HP），内含天山雨衣草、覆盆子、高浓度维生素C、从桦树中提取的桦木醇。 锁颜美白系统，专利欧芹与甘菊复合物、欧芹与覆盆子中提取的类黄酮、从天山雨衣草中提取的丹宁酸、棕榈油与椰子油、从天山雨衣草中提取的丹宁酸。使用说明\r\n取一块化妆棉，浸醮洁颜露。轻轻抚擦面部与颈部，避开眼部去除杂质与淡妆。不需清洗。 是使用皮肤护理产品前，早晚洁面的理想选择。','',0,0,0,0,0,'2012-03-01 16:02:23','2012-03-01 16:02:23',3,0);
INSERT INTO `goods_real` VALUES (232,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗平衡清洁乳(0127)','http://photo.no5.com.cn/product/mphoto/24412_M_111206134315_79354988.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24412_M_111206134315_79354988.jpg\";}',55,'http://www.no5.com.cn/goods/24412.html','24412',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合肤质：\r\n混合性皮肤 / 油及暗疮性皮肤\r\n产品简介\r\n含多种植物精华包括Gentian及Bio-Ecolia天然活性成份，能清洁面上化妆品及不洁物，同时亦能有助于保留皮肤的水脂膜。\r\n使用方法\r\n先将清洁乳置于干净的掌心中回温,使之与肌肤的温度相近。 \r\n将手掌平放在脸上,不要揉。保持数秒钟的接触，然后快速地提起手掌，重复5-6次。\r\n清洁乳将变稠并产生“吸盘作用”，温和地清除彩妆和污垢而不会拉扯或刺激皮肤。\r\n以清水彻底冲净或以面纸拭净。接着使用爽肤露以去除任何残留的清洁乳。\r\n\r\n使用心得：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多人用时因为不得法，把它当一般的洗面奶来洗，那真是糟蹋了它，我用这个原来也是没耐心，按上两分钟就洗了，也没有觉得有什么特殊的，反倒觉得脸洗不干净，有种沾沾的感觉，后在网上无意中看到了有关娇韵诗吸盘大法洗面奶的正确用法，才知这个东东对油性和混合性皮肤的MM来说，可真是个宝贝啊，我按照正确的洗脸手法用过以后，感觉真好，脸洗得很彻底，现将这种洗面奶特殊的洗面方式写出来，以便和大家一起分享心得。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 首先，取平常洗面奶用量的3倍，放在干燥的比较热的掌心，预热一下，然后涂在脸上开始用掌心垂直的按压（垂直脸向下）和粘（垂直脸向上），注意，，按时，鼻头可用掌心，两侧可以用手指。差不多2-3分钟的样子。洗面奶已经不是乳装，而是水水透明的感觉，继续2-3分钟，有些比较脏的部位，象鼻头，就开始有一种腻腻的黄黄的东西粘在皮肤表面，继续一直按，过一会儿感觉脸沾沾的，还是继续按，再过了一会儿，就会变得满脸是油，不要用纸巾或毛巾擦掉，就用手指在脸上画圈儿，慢慢的会出来好多好多好多脂肪粒，而当鼻子上的黑头吸出来后,是无数的呈黑色的油脂粒粒，用完脸上十分的干净，而且没有紧绷的感觉，也不会过敏。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 提醒大家的是这个“乳状”成“油状”的过程可能要好几分钟，大家要耐心一点按(注意不是揉，是按，一下一下的轻轻提起手来)。好玩的是会感觉这个洗面奶原来还是粘粘的象要干了一样，会突然一下象融化了一样变成油状，满脸就亮亮的了，不知道是不是皮肤表面温度达到了一定程度就会使它变性的原因。到了这个阶段，再耐心按个2分钟，就可以改换手势象按摩一样揉脸了，能揉多久揉多久，能挺多久挺多久，真的会有很多的油脂被揉出来，是我目前所用过最为效果显著的一样产品！！按完了以后会觉得皮肤非常的柔软，象是被滋润透了那种让人想掐一把的柔软，是用其它洗面产品之后不可能有的感觉。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果你的毛孔不是特别粗大的话，不用每天都用的，即使是每天用，也不会天天都有黑头的，建议大家还是周末时候用吧，用完了以后清水洗洗也就干净了，再用水水擦一遍，另外也可以接着敷上保湿面膜。','',0,0,0,0,0,'2012-03-01 16:02:23','2012-03-01 16:02:23',3,0);
INSERT INTO `goods_real` VALUES (233,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗温和清洁乳(0117)','http://photo.no5.com.cn/product/mphoto/24415_M_111206141100_22988259.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24415_M_111206141100_22988259.jpg\";}',55,'http://www.no5.com.cn/goods/24415.html','24415',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适用于干性或中性皮肤。以植物萃取精华为主要成份的乳液，质地柔滑、清新怡人。\r\n有助于维持皮肤天然均衡的pH值，中和硬水，洁净滋润肌肤。通过过敏性测试。轻柔清洁面部，去除杂质与残妆。\r\n保持并改善皮肤的自然平衡，维护清新色泽与青春光彩。\r\n软化肌肤，保持水分。改善干性和中性皮肤的弹性、舒适度与柔软性。\r\n刺激皮肤新陈代谢。\r\n避免硬水洗脸而造成的肌肤干燥紧绷。成分：\r\n轻油质。\r\n“BIO-ECOLIA”混合物。\r\n药属葵，菩提树，杏仁，维生素A和E。\r\n阿尔卑斯山药草（山金车花，刺柏，密蜂花）。\r\n软水剂。使用方法：\r\n根据皮肤类型的不同，每天使用一至两次。\r\n将乳液倒至手掌间温热。\r\n注意不要按压，以娇韵诗“吸盘式手法”清洁，像被皮肤烫到一样地将双手迅速抬离脸部。\r\n重复以上步骤五至六次。至清洁乳变成透明状态即可。\r\n使用清水彻底洁面，或用纸巾擦去残留产品。\r\n使用相应的爽肤水完成洁面过程。','',0,0,0,0,0,'2012-03-01 16:02:24','2012-03-01 16:02:24',3,0);
INSERT INTO `goods_real` VALUES (234,1,0,0,'Clarins 娇韵诗','护肤','Clarins 娇韵诗乳木果洁肤皂(80210)','http://photo.no5.com.cn/product/mphoto/24424_M_111202120114_12919289.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24424_M_111202120114_12919289.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24424_M_111202115904_53814522.jpg\";}',140,'http://www.no5.com.cn/goods/24424.html','24424',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合每天用于面部及身体肌肤。娇韵诗第一款有机洁肤皂。其蕴含的天然植物成分乳木果油及榛果油获得ECOCERT欧洲权威有机认证，不仅能有效温和清洁肌肤，洗净污垢和多余油脂，丰富细腻的泡沫同时滋养肌肤，保持肌肤天然水分。用后无干燥紧绷感，如同搽过滋润乳般润滑，清洁同时，令肌肤感受愉悦的乳木果清新气息。产品功效：\r\n温和清洁肌肤\r\n舒适并保护肌肤\r\n芳香肌肤\r\n获得欧洲国际权威ECO CERT有机认证，通过皮肤科医生测试产品成分：\r\n乳木果油：与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易吸收，不仅能防止干燥开裂，还能恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n榛果油：防止肌肤脱水，塑造柔软光滑的肌肤。使用方法：\r\n每天早上或晚上，在湿润的手上揉出泡沫，轻轻使用于面部和身体（避开眼部）。\r\n随后使用爽肤露，净化调理肌肤，为后续护理做好准备。\r\n早上用冷水冲洗，晚上用温水冲洗。','',0,0,0,0,0,'2012-03-01 16:02:25','2012-03-01 16:02:25',3,0);
INSERT INTO `goods_real` VALUES (235,1,0,0,'Sisley 希思黎','护肤','Sisley 希思黎美白洁净洗面凝胶(152425)','http://photo.no5.com.cn/product/mphoto/24503_M_111209113328_43124824.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24503_M_111209113328_43124824.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24503_M_111209113342_23662544.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24503_M_111209113355_82933784.jpg\";}',535,'http://www.no5.com.cn/goods/24503.html','24503',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效： \r\n蕴含白桑椹及黄芩、柠檬精华、薰衣草精油、聚乙烯微粒等，轻柔磨砂微粒融合多种美白植物精华，可每日用于微湿的面部，洁净同时瞬间唤醒肌肤，使之回复亮采活力：\r\n&#8226; 深层洁净肌肤。\r\n&#8226; 肤质光滑，肤色均匀。\r\n&#8226; 色斑淡褪，肌肤愈显透白。 \r\n\r\n活性成分： \r\n&#8226; 白桑椹及黄芩：有效抑制酪氨酸酶的活性，还原均匀剔透。\r\n&#8226; 柠檬精华：调理、美白肌肤。\r\n&#8226; 薰衣草精油：促进肌肤新陈代谢。\r\n&#8226; 聚乙烯微粒：去除肌肤表面老废角质。\r\n使用方法： \r\n每日早晚，取适量涂抹于微湿的脸部，以指尖轻轻按摩后以清水洗净，避开眼周区域。','',0,0,0,0,0,'2012-03-01 16:02:26','2012-03-01 16:02:26',3,0);
INSERT INTO `goods_real` VALUES (236,1,0,0,'Sisley 希思黎','护肤','Sisley 希思黎焕白泡沫洁面乳(159500)','http://photo.no5.com.cn/product/mphoto/24507_M_111209113652_62610450.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24507_M_111209113652_62610450.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24507_M_111209113712_83555885.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24507_M_111209113724_90554176.jpg\";}',595,'http://www.no5.com.cn/goods/24507.html','24507',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','清除污垢，美白肌肤&nbsp;\r\n&nbsp;&nbsp;&nbsp; \r\n产品功效： \r\n质地温和轻柔，彻底清洁的同时，帮助肌肤维持原有的水油平衡，令肤色更加清澈白皙，光彩照人。\r\n&#8226; 温和洁净肌肤，保护皮脂膜。\r\n&#8226; 抑制酪氨酸酶，有助于减少黑色素的生成。\r\n&#8226; 持续使用，令肌肤更具均衡亮采。 \r\n\r\n活性成分： \r\n&#8226; 白桑椹与黄芩精华：焕白肌肤。\r\n&#8226; 柠檬精华：调理美白。\r\n&#8226; 植物甘油：保持水油平衡。\r\n&#8226; 薰衣草与马郁兰精油：净化平衡肌肤使用方法： \r\n每日早晚，取足量产品涂抹于微湿的脸部，充分按摩后用温水洗净即可，避开眼周区域。','',0,0,0,0,0,'2012-03-01 16:02:27','2012-03-01 16:02:27',3,0);
INSERT INTO `goods_real` VALUES (237,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 全能玫瑰植物皂','http://photo.no5.com.cn/product/mphoto/24572_M_111216121513_94301887.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24572_M_111216121513_94301887.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24572_M_111216121526_90874153.jpg\";}',65,'http://www.no5.com.cn/goods/24572.html','24572',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','蕴含玫瑰精油、橄榄油、乳木果油、玫瑰花提取物等天然植物精华，玫瑰能够嫩白肌肤，使肌肤时刻保持健康红润，预防肌肤受外界环境因素的侵害，肌肤具有透明感，使肌肤更加柔软。采用手工冷制，活性精华渗透肌肤，密集地滋养肌肤，有助于改善暗沉肤色，令肌肤更嫩、更白、更自然。玫瑰精油\r\n玫瑰精油蕴含高浓度必须脂肪酸，维他命E成分，能使细胞结聚形成活膜，使疤痕很快愈合，促进肌肤新生，具有强化组织功效，其成分容易渗透真皮层，提升保湿度，促进肌肤光滑美白。使皮肤色素淡化，重现均匀色调，使皮肤平滑紧致。橄榄\r\n采用产自中国的橄榄。橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效,美容功效，被誉为“液体黄金”，“植物油皇后”。乳木果\r\n采用产自欧洲的乳木果。乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:28','2012-03-01 16:02:28',3,0);
INSERT INTO `goods_real` VALUES (238,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 薰衣草植物皂','http://photo.no5.com.cn/product/mphoto/24573_M_111216132208_82409187.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24573_M_111216132208_82409187.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24573_M_111216132231_27257820.jpg\";}',62,'http://www.no5.com.cn/goods/24573.html','24573',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','能镇定肌肤并给予肌肤坚强的防护层让敏感肌肤回复自然健康状态，同时享有自由自在的精油护理感受。可清热解毒、祛除淡疤、平衡皮肤油脂分泌，淡疤美白，祛皱嫩肤，最大程度修复受损肌肤。 薰衣草精油是极佳的抗忧郁精油，可安抚各类情绪问题，可缓解因工作或生活压力过大导致的失眠等症状。不同于市面上的机器制皂，朵拉朵尚采用全程纯手工制皂，不含一丝化学成分。 可用于沐浴、洗脸、洗发，进行全身心呵护。薰衣草花朵与皮肤亲密接触，沐浴和洁面后留有淡淡薰衣草香味。薰衣草\r\n采用产自法国的薰衣草，可以促进细胞再生，加速伤口愈合，改善粉刺、脓肿、湿疹、平衡皮脂分泌，对烧烫灼晒伤有奇效，可抑制细菌，减少疤痕。橄榄\r\n采用产自中国的橄榄。橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效,美容功效，被誉为“液体黄金”，“植物油皇后”。乳木果\r\n采用产自欧洲的乳木果。乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:29','2012-03-01 16:02:29',3,0);
INSERT INTO `goods_real` VALUES (239,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 茉莉植物皂','http://photo.no5.com.cn/product/mphoto/24574_M_111216132259_11723152.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24574_M_111216132259_11723152.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24574_M_111216132316_57992073.jpg\";}',62,'http://www.no5.com.cn/goods/24574.html','24574',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含纯白茉莉花萃取精华、橄榄油天然保湿因子。有助于创造美丽肌肤，改善敏感性肌肤，使肌肤柔嫩光滑，茉莉花杀菌消炎滋润，促进细胞再生平衡皮脂分泌。使用后令皮肤清爽舒适，散发出迷人、淡雅的橙花茉莉香气息。调理任何皮肤、尤其是干燥、敏感、老化肤质，还有安抚，促进精神和活力的作用，能够有效地美白，滋润，皮肤饱满，红润，让你亮丽动人。茉莉花\r\n来自世界上最大的茉莉花产地―广西南宁市横县，茉莉花在印度被称为“夜之女王”，与玫瑰一样成为人们最爱的花草之一。在我们的皂里添加入茉莉精油，是护肤良方，对干燥、缺水、过油以及敏感的肌肤、湿疹、发炎具调理作用，它也适合所有类型肌肤，还具有消炎镇定效果，在淡化疤痕与妊娠纹上的功效，而且它同时具有松弛和温暖情绪的功能，强力的抗忧郁能力可使人精神愉快，有助于恢复精力。橄榄\r\n采用产自中国的橄榄。橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效,美容功效，被誉为“液体黄金”，“植物油皇后”。乳木果\r\n采用产自欧洲的乳木果。乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:29','2012-03-01 16:02:29',3,0);
INSERT INTO `goods_real` VALUES (240,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 茶树植物皂','http://photo.no5.com.cn/product/mphoto/24575_M_111216132339_48977791.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24575_M_111216132339_48977791.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24575_M_111216132354_19040047.jpg\";}',62,'http://www.no5.com.cn/goods/24575.html','24575',0,'','','','','这是一款抗菌消炎、祛痘为一体的纯天然植物皂，内含茶树提取物--茶树精华，能够促进皮肤新陈代谢，防止皮肤老化，收缩毛孔，去除油油，控制生痘痘。并且是采用独特配方所调制，不含有碱性配方。洁面沐浴后让你的肌肤感觉像是在畅快呼吸，因为不含过敏源，所以敏感性肤质也可以适用。茶树精油\r\n采用澳洲的茶树精油。茶树中蕴含的“茶多酚”是水溶性物质，用它洗脸能清除面部的油腻，收敛毛孔，具有消毒、灭菌、抗皮肤老化，减少日光中的紫外线辐射对皮肤的损伤等功效。可延缓衰老，茶多酚具有很强的抗氧化性和生理活性 ，是人体自由基的清除剂。有助于预防和治疗辐射伤害茶多酚及其氧化产物具有吸收放射性物质锶90和钴60毒害的能力。橄榄\r\n采用产自中国的橄榄。橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效,美容功效，被誉为“液体黄金”，“植物油皇后”。乳木果\r\n采用产自欧洲的乳木果。乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:32','2012-03-01 16:02:32',3,0);
INSERT INTO `goods_real` VALUES (241,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 甘草植物皂','http://photo.no5.com.cn/product/mphoto/24576_M_111216132426_13991829.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24576_M_111216132426_13991829.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24576_M_111216132436_46659676.jpg\";}',62,'http://www.no5.com.cn/goods/24576.html','24576',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','本款皂内特别添加了甘草提取物，助于抗炎、抗过敏作用，是美容院里常用来增白肌肤的极佳草本。植物皂的低温制作工艺，很好地保留了草本的天然成份，有益肌肤。滋润皮肤、给皮肤带来丝般光滑、使失去水份的皮肤重新获取水份。甘草\r\n甘草对皮肤、毛发有营养保湿作用，并对损伤的皮肤、毛发有修复作用，其抗氧化能力与维生素E比较接近。甘草有免疫调节作用，外用可以防晒，增白消斑，防止皮肤粗糙等，预防黑斑，雀斑等黑色素沉淀，还有相当不错的杀菌消炎功能，对于敏感性肤质可预防感染，发炎的作用，美白肌肤和抗衰老。橄榄\r\n采用产自中国的橄榄。橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效,美容功效，被誉为“液体黄金”，“植物油皇后”。乳木果\r\n采用产自欧洲的乳木果。乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。\r\n使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:33','2012-03-01 16:02:33',3,0);
INSERT INTO `goods_real` VALUES (242,1,0,0,'朵拉朵尚','护肤','朵拉朵尚 竹炭活力皂','http://photo.no5.com.cn/product/mphoto/24577_M_111216132504_59958626.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24577_M_111216132504_59958626.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24577_M_111216132526_76795173.jpg\";}',62,'http://www.no5.com.cn/goods/24577.html','24577',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','以竹炭粉与其他天然植物精华精制而成的竹炭手工皂，能彻底清除毛孔污垢及过量油脂，滋润肌肤，洁身除味。促进血液循环和新陈代谢，缓解疲劳。长期使用，能使肌肤增白润滑，对青春痘、溢脂性皮肤等有良好效果。竹炭本身具有吸附性，所以竹炭手工皂的去油效果是最佳的。竹炭手工皂是最适合男性使用的手工皂，满足所有日常护肤的需要。椰油：\r\n椰油富含多种维生素及矿物质，有祛毒、美白、润颜之效。椰子油涂抹于经常烈日晒、海风吹的肌肤，使肌肤变得柔软光滑。橄榄：\r\n橄榄营养丰富，含有17种人体所需要的氨基酸，果肉富含钙质与维生素C，人们将橄榄称为“天堂之果”。橄榄油因为极佳的天然保健功效，美容功效，被誉为“液体黄金”，“植物油皇后”，“地中海甘露”。棕榈：\r\n棕榈油富含棕榈油酸、棕榈仁油酸等，保护肌肤细胞、防止细胞氧化，预防肌肤老化，促进肌肤细胞再生，使肌肤更具弹力；淡化斑点、痘印，使肌肤白皙柔嫩。乳木果：\r\n乳木果油与人体皮脂分泌油脂的各项指标最为接近，蕴含丰富的非皂化成分，极易于人体吸收，不仅能防止干燥开裂，还能进一步恢复并保持肌肤的自然弹性，具有不可思议的深层滋润功效。竹炭：\r\n竹炭具有去污增白、除痘、除斑、清爽效果，且对皮肤病有一定的预防和治疗作用。使用方法：\r\n先把皂浸入水中打湿，以手或打泡网轻轻搓揉出泡沫后使用，用泡沫在脸上轻揉3-5秒后再用清水冲洗干净。使用完后不要把皂皂泡在水里，避免浸泡后使手工皂变得绵软缩短使用寿命也非常浪费手工皂。\r\n注意事项：洗脸的水温不要超过40度，若是超过了会把脸上所有的保湿物质全部洗掉，会觉得很干，甚至是因水温过高，微血管扩张，毛孔打开，水分散失加快，很容易感觉缺水。使用过程中避免接触眼睛。\r\n如不慎入眼，请立即用清水彻底冲洗。因含保湿成份，用后请放置于阴凉干燥的地方尽量保持干燥。洗脸后请及时使用爽肤水/纯露，因为不管皂皂多么滋润，刚刚清洗过的皮肤都需要及时补水保湿，否则水分会快速蒸发造成肌肤干燥。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:34','2012-03-01 16:02:34',3,0);
INSERT INTO `goods_real` VALUES (243,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻金纯卓颜洁面乳(金纯滋润03188)','http://photo.no5.com.cn/product/mphoto/24645_M_111212115512_86582618.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24645_M_111212115512_86582618.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24645_M_111212145737_46448189.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/24645_M_111212115556_54354225.jpg\";}',530,'http://www.no5.com.cn/goods/24645.html','24645',0,'干性,油性,混合性,中性,敏感性','','','','丰润细腻的乳霜，在与肌肤的亲密相揉中，卸去残妆暗沉，涤去岁月浊迹。 \r\n每一天，展现肌肤润泽纯美的真相，还原肌肤柔嫩光洁。\r\n使用方法：\r\n适量涂抹于润湿的面部及颈部皮肤，加以轻轻按摩后以温水洗净。','',0,0,0,0,0,'2012-03-01 16:02:35','2012-03-01 16:02:35',3,0);
INSERT INTO `goods_real` VALUES (244,1,0,0,'相宜本草','护肤','相宜本草 红石榴鲜活亮白洁颜乳','http://photo.no5.com.cn/product/mphoto/24747_M_120109114815_58574348.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24747_M_120109114815_58574348.jpg\";}',41,'http://www.no5.com.cn/goods/24747.html','24747',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','绵密柔澈的泡沫，温和溶解毛孔深处的污垢、老废角质，清除导致肌肤黯黄的自由基，均匀提亮肤色，肌肤漾现通透白皙。富含石榴多酚以及花青素，深入渗透肌肤，给予肌肤充分的营养，帮助肌肤告别蜡黄倦容，焕发活力光彩。本草成份： \r\n【红石榴】含多酚、花青素及活力维他命，提亮肤色，增强肌肤弹性。&nbsp; 使用方法：\r\n用清水湿润面部，挤适量洁颜乳于手心，打出细腻泡沫后，均匀地涂于脸部，轻柔按摩，最后用清水洗净即可。','',0,0,0,0,0,'2012-03-01 16:02:35','2012-03-01 16:02:35',3,0);
INSERT INTO `goods_real` VALUES (245,1,0,0,'Sisley 希思黎','超值小样','Sisley 希思黎焕白泡沫洁面乳(3片装)','http://photo.no5.com.cn/product/mphoto/24846_M_120130174922_93773170.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24846_M_120130174922_93773170.jpg\";}',66,'http://www.no5.com.cn/goods/24846.html','24846',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','清除污垢，美白肌肤&nbsp;\r\n&nbsp;&nbsp;&nbsp; \r\n产品功效： \r\n质地温和轻柔，彻底清洁的同时，帮助肌肤维持原有的水油平衡，令肤色更加清澈白皙，光彩照人。\r\n&#8226; 温和洁净肌肤，保护皮脂膜。\r\n&#8226; 抑制酪氨酸酶，有助于减少黑色素的生成。\r\n&#8226; 持续使用，令肌肤更具均衡亮采。 \r\n\r\n活性成分： \r\n&#8226; 白桑椹与黄芩精华：焕白肌肤。\r\n&#8226; 柠檬精华：调理美白。\r\n&#8226; 植物甘油：保持水油平衡。\r\n&#8226; 薰衣草与马郁兰精油：净化平衡肌肤使用方法： \r\n每日早晚，取足量产品涂抹于微湿的脸部，充分按摩后用温水洗净即可，避开眼周区域。','',0,0,0,0,0,'2012-03-01 16:02:36','2012-03-01 16:02:36',3,0);
INSERT INTO `goods_real` VALUES (246,1,0,0,'其他护肤品牌','护肤','美国天然有机Aubrey organics绿茶银杏洁面乳(04121)','http://photo.no5.com.cn/product/mphoto/24914_M_120202133652_16439034.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24914_M_120202133652_16439034.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24914_M_120209105120_17655770.jpg\";}',109,'http://www.no5.com.cn/goods/24914.html','24914',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合中性肌肤的清盈洁面乳。非常非常的清爽，能够给缺水肌肤充分的补水与滋养。有机绿茶，银杏和维E发挥强大的抗氧化作用，清除自由基对皮肤造成的危害，保护肌肤免受污染的伤害，防止皮肤变粗，变老。质地有些稀薄，气泡相当细腻，细腻到难以察觉，应该是天然皂角作为起泡剂的缘故。清洁能力并不差，洗后脸上有很透气清爽的感觉。不会有洗不净的滑滑的感觉。绿茶：抗氧化，保护皮肤；\r\n银杏：可以使皮肤看起来更红润，更有活力。使用方法：\r\n湿润肌肤，取适量洁面乳，均匀按摩，最后用水冲洗干净即可。','',0,0,0,0,0,'2012-03-01 16:02:40','2012-03-01 16:02:40',3,0);
INSERT INTO `goods_real` VALUES (247,1,0,0,'Neutrogena 露得清','护肤','Neutrogena 露得清露得清无油祛痘洁面摩丝(01710)','http://photo.no5.com.cn/product/mphoto/24943_M_120214103446_42203346.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24943_M_120214103446_42203346.jpg\";}',72,'http://www.no5.com.cn/goods/24943.html','24943',0,'','','','','露得清Oil-Free Acne Wash是一款有效而温和的抗痘洁面产品。它可以深入毛孔达到清理皮肤的功效。其与众不同之处在于含有水杨酸，消除痘痘炎症，同时预防痘痘的重复发生。清除皮肤污垢和多余的油脂。所含有的特别舒缓成分安抚和滋润皮肤，防止刺激和干燥等不适反应。用后的皮肤干净清爽，无任何残留物──告别油腻。\r\n* 无油\r\n* 不阻塞毛孔\r\n* 洗后皮肤不干燥紧崩。\r\n* 无残留\r\n* 含有水杨酸。使用方法：\r\n湿润脸部，取适量清洁露加水轻柔搓洗脸部，用清水洗净。一天两次。','',0,0,0,0,0,'2012-03-01 16:02:41','2012-03-01 16:02:41',3,0);
INSERT INTO `goods_real` VALUES (248,1,0,0,'SANA 珊娜','护肤','SANA 珊娜去角质纤维泡沫洁面乳(45612)','http://photo.no5.com.cn/product/mphoto/24969_M_120220143626_33720528.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/24969_M_120220143626_33720528.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/24969_M_120220143655_64553657.jpg\";}',68,'http://www.no5.com.cn/goods/24969.html','24969',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','肌肤水嫩的秘密！让肌肤光滑！双重角质柔软成分。洁净肌肤的同时能彻底清除老化角质，毛孔大扫除。\r\n含超微米纤维浓密泡沫，让毛孔污垢，老废角质，粗糙感OUT AHA BHA 玻尿酸，带给肌肤光滑透明感，配合玻尿酸保湿成分，肌肤水嫩有弹性。无香料、无色素、无油脂、无酒精配方，给肌肤温柔呵护！用法：\r\n取适量于手中，加水轻揉至泡，然后按摩面部，最后再以清水冲洗干艏纯伞','',0,0,0,0,0,'2012-03-01 16:02:42','2012-03-01 16:02:42',3,0);
INSERT INTO `goods_real` VALUES (249,1,0,0,'AVON 雅芳','护肤','AVON雅芳肌肤管理凝白洁面乳','http://photo.no5.com.cn/product/mphoto/25086_M_120223103236_50915504.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/25086_M_120223103236_50915504.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/25086_M_120223103243_13117043.jpg\";}',45,'http://www.no5.com.cn/goods/25086.html','25086',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','雅芳肌肤管理凝白洁面乳泡沫丰盈，有效清洁面部污垢及多余油脂，同时保持肌肤天然水润。雅芳科学家运用精准萃取科技提炼的精纯丝肽精华（水解蚕丝）结合专利美白成分TDPA（二月桂醇硫代二丙酸酯），有效提亮肤色，去除暗哑粗糙，洗后肌肤清透清新柔滑，展现白皙光泽。成分：\r\n水、CI14-16、烯烃磺酸钠、甘油、椰油酰基牛磺酸钠、丙烯酸（酯）类共聚物、氯化钠、月桂酰两性基乙酸酯、柠檬酸、香精、乙二醇而硬脂酸酯、水杨酸、椰油酰胺丙基 PG-二甲基氯化铵磷酸酯、薄荷醇乳酸酯等使用方法：\r\n早晚，取适量加清水揉搓起泡，轻轻按摩脸部后，再以清洗洗净。配合同组产品使用，效果更佳。&nbsp;&nbsp;','',0,0,0,0,0,'2012-03-01 16:02:42','2012-03-01 16:02:42',3,0);
INSERT INTO `goods_real` VALUES (250,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP It girl 苹果泡沫洗面奶(02250)','http://photo.no5.com.cn/product/mphoto/18086_M_110407140113_41276375.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18086_M_110407140113_41276375.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18086_M_110407135725_98306403.jpg\";}',42,'http://www.no5.com.cn/goods/18086.html','18086',0,'干性,油性,混合性,中性,敏感性','','','','充满苹果芳香的洗面奶，泡沫细腻丰盈，日常清洁同时可以干净卸除彩妆并且温柔去除皮肤表面老化角质，清洁后的肤色持久闪耀健康白皙的明艳光泽，水凝保湿配方皮肤不紧绷，让肌肤柔嫩细致。让肌肤也像苹果一样散发沁人心脾的香味，清爽的苹果精华，帮助肌肤去除角质，每天使用之后，皮肤变得光滑细腻，持续使用，每个女孩都可以慢慢变漂亮。The Face Shop It girl时尚女郎系列，包装设计美丽个性，特别为时尚独特的你而设计，让你爱上洗脸的感觉！让你每一天都更趋近完美使用方法：\r\n用温水湿润脸部，取适量于掌中揉出充分泡沫后，圆形按摩状均匀搽抹于脸部，按摩片刻，然后以温水彻底洗净即可。','',0,0,0,0,0,'2012-03-01 16:02:45','2012-03-01 16:02:45',3,0);
INSERT INTO `goods_real` VALUES (251,1,0,0,'AVON 雅芳','护肤','AVON雅芳美颜洁容霜','http://photo.no5.com.cn/product/mphoto/18131_M_110309134408_47298256.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18131_M_110309134408_47298256.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18131_M_110309134426_83272987.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/18131_M_110309134442_99653602.jpg\";}',82,'http://www.no5.com.cn/goods/18131.html','18131',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','雅芳美颜露系列让皮肤晶莹剔透的秘密来自于雅芳日本护肤研究室的创新科技成份：酵母能量精华“Energy TRF”，它源源不绝地给细胞以氧气和能量，让皮肤充满活力，肌肤变得更加晶莹剔透。  酵母能量精华Energy TRF\r\n不公给肌肤供给氧气，更吸附氧气，让皮肤充满活力。  大豆萃取精华\r\n活性大豆萃取精华，给肌肤补充天然活性异黄酮，保持细胞健康。  球形润泽晶体\r\n球形润泽晶体轻柔按摩肌肤，给肌肤舒适和彻底的清洁，同时释放滋润成份，深层清洁而不紧绷。  雅芳美颜洁容霜轻柔按摩托以彻底的清洁肌肤，并吸附氧气以便后续的保养品的吸收。  使用方法：取适量于手掌，加水揉搓至起泡沫，在脸上轻轻按摩之后，以清水洗净即可。','',0,0,0,0,0,'2012-03-01 16:02:48','2012-03-01 16:02:48',3,0);
INSERT INTO `goods_real` VALUES (252,1,0,0,'Jurlique 茱莉蔻','护肤','Jurlique 茱莉蔻净肤泡沫洁面液','http://photo.no5.com.cn/product/mphoto/20081022105756873119789.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081022105756873119789.jpg\";}',298,'http://www.no5.com.cn/goods/18175.html','18175',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','蕴含澳洲植物精华的全天然有机护肤品，让洁面的过程充满舒适的享受。金缕梅、金盏花、马尾草等清新植物萃取，为肌肤疏解疲劳和压力。使用方法：\r\n将约1ml泡沫洁面精置于掌心，加清水稀释打出泡沫后清洁面部和颈部、避开眼部，用清水洗净。','',0,0,0,0,0,'2012-03-01 16:03:25','2012-03-01 16:03:25',3,0);
INSERT INTO `goods_real` VALUES (253,1,0,0,'PALMERS 美国雅儿','护肤','PALMERS 美国雅儿亮白泡沫洗面奶(07515)','http://photo.no5.com.cn/product/mphoto/20081022134757902642578.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081022134757902642578.jpg\";}',98,'http://www.no5.com.cn/goods/18183.html','18183',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','独特配方，蕴含色素淡化剂Hydroquinone，经医学证明，能有效消除或淡化各种斑点及色印，配合高效防晒成份Octisalate，令美白效果更全面，更显着。此外，产品中的Vitamin C也是很好的美白去斑元素。只要持续使用68星期，可明显改善不均匀的肤色，淡化黑点色素，令肌肤恢复亮丽、嫩白。  消除及淡化各类色印及斑点，包括阳光曝晒引起雀斑、女性怀孕期间引致的肚纹胎斑、年龄增长导致的老人斑、黄褐斑以及服食避孕药引起的斑印。  具美白及均匀皮肤色调的功效，改善黯淡肤色，淡化黑色素，重现皮肤天然光泽。  彻底清洁皮肤而不会导致干燥及绷紧。  有效清除阻塞毛孔之污垢及杂质。  具有软化及保肤功能的维生素E，令皮肤明显光滑及明亮。  用法：打湿脸后，轻轻一按，在手上的就是一堆细腻洁白的泡沫，然后轻轻揉搓于脸部，再用清水洗净即可。  注意：虽然本产品含有防晒成分，但是接触Hydroquinone的皮肤会对阳光特别敏感，故建议还是要涂上SPF 15或更高的防晒霜。','',0,0,0,0,0,'2012-03-01 16:03:26','2012-03-01 16:03:26',3,0);
INSERT INTO `goods_real` VALUES (254,1,0,0,'Vichy 薇姿','护肤','Vichy薇姿双重菁润焕白泡沫洁面霜','http://photo.no5.com.cn/product/mphoto/20081202095654602024907.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081202095654602024907.jpg\";}',205,'http://www.no5.com.cn/goods/18467.html','18467',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含多种稀有矿物质和微量元素的VICHY温泉水，有效镇静、舒缓、强化皮肤保护功能，使皮肤健永强韧。泡沫质地，深入清洁，去除含有黑色素的死皮细胞，明显改善暗淡肤色。使用方法：每日早晚，取适量产品于掌心加水揉搓至起泡沫，避免接触眼周肌肤，涂抹于打湿的脸部和颈部，加以按摩，最后用清水彻底干净。','',0,0,0,0,0,'2012-03-01 16:03:27','2012-03-01 16:03:27',3,0);
INSERT INTO `goods_real` VALUES (255,1,0,0,'OLAY 玉兰油','护肤','OLAY 玉兰油新生唤肤洁面乳','http://photo.no5.com.cn/product/mphoto/20081202142244646325314.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081202142244646325314.jpg\";}',85,'http://www.no5.com.cn/goods/18475.html','18475',0,'干性,油性,混合性,中性,敏感性','','','','温和深入地清洁肌肤并帮助加快肌肤表层更新，你能感觉到肌肤细致幼滑。内含亲肤微粒的配方，温和而深入地清洁肌肤表层的污垢和杂质，感觉滋润不紧绷。\r\n含有Amino-piptide complex（氨基酸肽复合物），清洁同时帮助肌肤表层更新。使用方法：每天早晚使用。先将脸部润湿，取适量本品轻柔按摩脸部，然后以清水充分洗净。','',0,0,0,0,0,'2012-03-01 16:03:27','2012-03-01 16:03:27',3,0);
INSERT INTO `goods_real` VALUES (256,1,0,0,'Zogu 昭贵','护肤','Zogu 昭贵冰肤痘痘洁面乳','http://photo.no5.com.cn/product/mphoto/20081208112331613790953.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20081208112331613790953.jpg\";}',31,'http://www.no5.com.cn/goods/18502.html','18502',0,'','','','','富含高效芦荟溶脂配方，能有效的深入毛孔溶解清除脂拴、油脂粒、溶解毛孔里的垃圾并除黑头，并以芦荟独有的特性有效的抑菌、杀菌消炎、解毒、控油，修复痘印肌肤，收缩毛孔并畅通，让肌肤恢复健康细腻光滑。  适用于青春痘、粉刺肌肤；\r\n清洁污垢及多余油脂；\r\n减少由于油脂堵塞毛孔所形成的痘痘及粉刺；\r\n用后肌肤清爽通透。  用法：取适量揉成泡沫，轻揉肌肤两分钟，清水冲净。  适用人群：痘痘、粉刺、暗疮、黑头肌肤','',0,0,0,0,0,'2012-03-01 16:03:30','2012-03-01 16:03:30',3,0);
INSERT INTO `goods_real` VALUES (257,1,0,0,'相宜本草','护肤','相宜本草  四倍蚕丝凝白洁面膏','http://photo.no5.com.cn/product/mphoto/20100111134523999039082.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100111134523999039082.jpg\";}',22,'http://www.no5.com.cn/goods/18616.html','18616',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','面部血色不好，肤色枯黄，皮肤干燥缺乏弹性红润，不够饱满，因为色素沉着，脸色看上去黯淡缺乏光泽，没有白皙度，毛孔粗大、没有细腻柔滑感。此类肌肤的护肤要点，要注意保湿防止干纹的出现，并且要提亮肤色，增加肌肤营养，并周期性去角质。  一款洗后肌肤倍感滋润、柔滑的洁面乳，洁净肌肤的同时，带给肌肤丝滑呵护。   白色细腻浓缩膏体，幼滑细腻的泡沫，有效清洁毛孔内的污垢，洗去暗沉，并在皮肤表层形成水润的保湿层，调理肤色，嫩白肌肤用后肌肤清新，柔嫩，白皙，光泽。   成分： \r\n【丝素】与肌肤具有优异的天然亲和力，内含18种氨基酸与肌肤形成天然保湿因子（NMF）。\r\n【甘草】美白润肤，能舒缓、净化、调理肌肤。  适合肤质： 任何肌肤','',0,0,0,0,0,'2012-03-01 16:03:30','2012-03-01 16:03:30',3,0);
INSERT INTO `goods_real` VALUES (258,1,0,0,'Neutrogena 露得清','护肤','Neutrogena 露得清深层净化洗面乳','http://photo.no5.com.cn/product/mphoto/18670_M_110524131033_82977729.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18670_M_110524131033_82977729.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18670_M_110526100215_24535958.jpg\";}',20,'http://www.no5.com.cn/goods/18670.html','18670',0,'','','','','油性及混合性肌肤适用\r\n\r\n深层洁净，作用于毛孔深处，去除导致毛孔阻塞和肤色暗沉的油垢、外界污染物和老化角质。\r\n特有无残留配方，亲水分子结构，在深层清洁同时容易冲洗，较少残留，有助回复肌肤透明感，再现健康光泽。\r\n持续使用，控油显著，迅速消除油腻感觉，让肌肤清爽健康。\r\n\r\n经皮肤专家测试：不含矿物油，不阻塞毛孔使用方法：挤适量于掌心，加水揉出细沫后，涂抹于润湿的脸部，轻轻按摩片刻后以清水充分冲洗，避开眼部细致的肌肤。建议每天早晚使用。','',0,0,0,0,0,'2012-03-01 16:03:32','2012-03-01 16:03:32',3,0);
INSERT INTO `goods_real` VALUES (259,1,0,0,'AUPRES 欧珀莱','护肤','AUPRES欧珀莱 时光锁紧实弹润系列 醒活柔润洁面膏','http://photo.no5.com.cn/product/mphoto/18674_M_111222172543_96819129.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18674_M_111222172543_96819129.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18674_M_111222172813_96780677.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/18674_M_111222172826_99175697.jpg\";}',115,'http://www.no5.com.cn/goods/18674.html','18674',0,'干性,油性,混合性,中性,敏感性','','','','本洁面膏泡沫细腻，在保持肌肤滋润的同时清除肌肤污垢，为蕴育赋予弹性的肌肤奠定了基础。含有保湿洗净成分，使洗后肌肤保持水润状态。\r\n泡沫经腻丰富，保持肌肤原有滋润，柔和洗净肌肤。含有保湿洗净成分、人体关联成分AMT\r\n易冲洗干净，无紧绷感。柔和的洁面效果，使每天的护理倍感舒适。\r\n通过敏感性肌肤测试使用方示：\r\n将面部打湿，然后取适量于心，加少量清水或温水揉至产生丰富泡沫。\r\n请充分冲洗干净，以免留有残余，如发际或下巴等处。&nbsp;','',0,0,0,0,0,'2012-03-01 16:03:35','2012-03-01 16:03:35',3,0);
INSERT INTO `goods_real` VALUES (260,1,0,0,'AUPRES 欧珀莱','护肤','AUPRES欧珀莱 臻白抗斑赋弹系列净透矿物泥洁面膏','http://photo.no5.com.cn/product/mphoto/18681_M_120131171903_69371162.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18681_M_120131171903_69371162.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18681_M_120131171914_48013740.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/18681_M_120131171929_51727119.jpg\";}',112,'http://www.no5.com.cn/goods/18681.html','18681',0,'干性,油性,混合性,中性,敏感性','','','','含有雪白矿物泥，其吸附力能够有效清除含有黑色素并导致肌肤暗沉的陈旧角质。与肌肤紧密贴合的霜质弹性泡沫，温和洗净肌肤。\r\n新添加的雪白矿物泥成分，有效清除含有黑色素并导致肌肤暗沉的陈旧角质，并同时清洁肌肤。保持肌肤润泽。\r\n\r\n―含有人体关联洗净成份AMT\r\n在清除肌肤污垢的同时，保持肌肤原有润泽，柔和洗净肌肤。\r\n\r\n―含有保湿类洗净成份\r\n与肌肤紧密贴合的霜质弹性泡沫，温和洗净肌肤。\r\n\r\n【使用方法】：\r\n将面部打湿，然后取适量（约1cm）干掌心，加少量清水或温水揉至产生丰富泡沫。用泡沫包住面部，轻柔地洗净。请充分冲洗千净，以免留有残余，如发际 或下巴等处。','',0,0,0,0,0,'2012-03-01 16:03:37','2012-03-01 16:03:37',3,0);
INSERT INTO `goods_real` VALUES (261,1,0,0,'AUPRES 欧珀莱','护肤','AUPRES欧珀莱 均衡保湿系列-柔润洁面膏','http://photo.no5.com.cn/product/mphoto/18694_M_120109090728_92042823.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18694_M_120109090728_92042823.jpg\";}',72,'http://www.no5.com.cn/goods/18694.html','18694',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','均衡保湿洁面膏，能彻底清除陈旧的角质及肌肤污垢，同时保持肌肤滋润，使肌肤光滑洁净。&#8226;产生柔和丰富的泡沫，洗净污垢和多余的皮脂、陈旧的角质。\r\n&#8226;温和清除肌肤的污垢，令肌肤更易吸收滋润成份。\r\n&#8226;感触柔滑、用后无紧绷感、令肌肤晶莹滑爽。 使用方法 ： \r\n1.首先净面部淋湿。从软管中取1CM于掌心，加少量清水或温水揉产生丰富泡沫。\r\n2.在面部轻柔地画圆圈清洗。\r\n3.用清水或温水充分冲洗干净','',0,0,0,0,0,'2012-03-01 16:03:39','2012-03-01 16:03:39',3,0);
INSERT INTO `goods_real` VALUES (262,1,0,0,'Neutrogena 露得清','护肤','Neutrogena 露得清深层柔珠洗面乳','http://photo.no5.com.cn/product/mphoto/20090108101455709277240.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090108101455709277240.jpg\";}',39,'http://www.no5.com.cn/goods/18695.html','18695',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','露得清深层柔珠洗面乳，特有双柔珠温和配方。能够深入毛孔清洁，有效地去除导致黑头产生的残留物。它特有温和滋润配方能保证肌肤在清爽的同时，更加柔嫩光滑。\r\n*深层净化清洁配方，清除阻塞毛孔的油垢和外界污染的残留物，帮助预防黑头的产生。\r\n*白色洁净柔珠，有效清除死皮细胞和黑头，预防毛孔阻塞。\r\n*橘色可溶性柔珠，轻轻按摩脸部时立即释放润肤精华。帮助柔润、舒缓肌肤。  经皮肤专家测试：不含皂质，不阻塞毛孔  使用方法：挤适量于掌心，加水揉出细沫后，涂沫于湿润的脸上，轻轻按摩片刻并以清水充分冲洗。注意避开眼周细致的肌肤。  注意事项：含水杨酸，三岁以下幼儿不得使用。','',0,0,0,0,0,'2012-03-01 16:03:39','2012-03-01 16:03:39',3,0);
INSERT INTO `goods_real` VALUES (263,1,0,0,'AUPRES 欧珀莱','护肤','AUPRES欧珀莱 纯澈亮白系列-净爽颗粒洁面膏','http://photo.no5.com.cn/product/mphoto/18711_M_110512161429_39449898.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18711_M_110512161429_39449898.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/18711_M_110512161444_10303170.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/18711_M_110512161457_51825996.jpg\";}',88,'http://www.no5.com.cn/goods/18711.html','18711',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','本洁面膏含有角质清除颗粒。\r\n可有效洗净与肌肤暗黄有密切关系的老化角质及多余皮脂。\r\n使清洁后的肌肤透明无瑕。使用方法：\r\n打湿面部后，取适量（约1.5CM）于掌心。\r\n加少量清水或温水揉至产生丰富的泡沫，用泡沫包住面部，轻柔地洗净。\r\n请充分冲洗干净，以免留有残余，如发际或下巴等处。','',0,0,0,0,0,'2012-03-01 16:03:40','2012-03-01 16:03:40',3,0);
INSERT INTO `goods_real` VALUES (264,1,0,0,'OLAY 玉兰油','护肤','OLAY 玉兰油水感透白深层洁肤乳','http://photo.no5.com.cn/product/mphoto/18744_M_110513112922_20911843.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18744_M_110513112922_20911843.jpg\";}',66,'http://www.no5.com.cn/goods/18744.html','18744',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','全新OLAY 水感透白面部护理系列，推出突破性的护肤理念――水感透白系统，帮你从多方面满足美白需求。同时，还根据不同的肌肤需求，提供不同质地的产品。\r\n水： 水润沁养，并有效帮助防止水分流失，使肌肤水感润泽。\r\n透：滋润肌肤，有内而外透出晶莹亮采。\r\n白：帮助改善肌肤暗哑，净白肤色。OLAY 玉兰油水感透白深层洁肤乳：有效清洁肌肤（清除污垢，彩妆，多余油脂，死皮等），回复肌肤清爽净透。 使用方法：每天早晚使用。润湿脸部，取适量于掌心，用清水揉出丰富泡沫，用指尖轻柔按摩脸部，然后以清水充分洗净。&nbsp;','',0,0,0,0,0,'2012-03-01 16:03:41','2012-03-01 16:03:41',3,0);
INSERT INTO `goods_real` VALUES (265,1,0,0,'OLAY 玉兰油','护肤','OLAY 玉兰油焦点皙白丝润深层洁面乳','http://photo.no5.com.cn/product/mphoto/20100925121043665816690.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100925121043665816690.jpg\";}',97,'http://www.no5.com.cn/goods/18749.html','18749',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','帮助清洁肌肤，让肌肤绽放光感白皙。蕴含微细洁面粒子和Glucosamine Hydrating Complex（葡萄糖胺丝润补水成分）的深层洁净配方，能清洁毛孔和表层纹理里的尘垢和因环境中空气光线照射产生的氧化角质，令肌肤展现光感。 使用方法：每天早晚洁面时，取适量（约1cm）置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。','',0,0,0,0,0,'2012-03-01 16:03:42','2012-03-01 16:03:42',3,0);
INSERT INTO `goods_real` VALUES (266,1,0,0,'Za 姬芮','护肤','ZA 姬芮洁面膏','http://photo.no5.com.cn/product/mphoto/2009011013213121930641.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009011013213121930641.jpg\";}',35,'http://www.no5.com.cn/goods/18779.html','18779',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含维他命E按摩颗粒，有效清除阻塞毛孔的深层污垢，特别使鼻部周围毛孔粗大的肌肤洁净光滑。\r\n去除造成肌肤暗沉的老化角质。\r\n清爽润泽的使用感。\r\n轻松去除残妆。\r\n\r\n使用方法：\r\n挤出约1cm左右于掌心，加少量水揉搓起泡，将泡沫涂抹于整个脸部，以螺旋状轻轻按摩，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:03:42','2012-03-01 16:03:42',3,0);
INSERT INTO `goods_real` VALUES (267,1,0,0,'Za 姬芮','护肤','ZA 姬芮水润精华洁露','http://photo.no5.com.cn/product/mphoto/200901101117077148046.jpg','a:1:{i:0;s:64:\"http://photo.no5.com.cn/product/mphoto/200901101117077148046.jpg\";}',50,'http://www.no5.com.cn/goods/18790.html','18790',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','柔和丰富的泡沫可有效地去除污垢，用后肌肤平滑润泽。\r\n温和洗去引起肤色暗沉的老化角质，呈现具有透明感的肌肤。\r\n可洗净残留的淡妆。\r\n在忙碌的清晨或略显疲劳的夜晚，液状洁面露能迅速起泡，可达到快速洁面的效果。  使用方法：取适量于掌心，加水起泡沫后涂抹在整个脸部，以打圈的方式轻轻按摩后，用清水洗净。','',0,0,0,0,0,'2012-03-01 16:03:43','2012-03-01 16:03:43',3,0);
INSERT INTO `goods_real` VALUES (268,1,0,0,'NIVEA 妮维雅','护肤','NIVEA 妮维雅丝润柔珠洁面乳','http://photo.no5.com.cn/product/mphoto/18809_M_101203163309_29667946.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/18809_M_101203163309_29667946.jpg\";}',32,'http://www.no5.com.cn/goods/18809.html','18809',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','中性、干性、敏感性肌肤适用温和洁净，肌肤柔嫩丝滑中性及干性/敏感性肌肤需要特别的保湿滋养和日常防护，因为此类肌肤本身缺少有效保湿因子和对外界的抵抗力来维持肌肤的柔嫩丝滑。 \r\n妮维雅实验室研发了妮维雅丝润柔珠系列来满足此类肌肤需求：\r\n温和纯净配方，有效清洁皮肤尘埃和彩妆。\r\n娇柔配方，提供肌肤额外的滋润使之保持柔嫩。\r\n\r\n产品功效:肌肤温和舒缓并净化，感觉柔嫩丝滑。\r\n\r\n使用方法:\r\n取适量本品于湿润的脸部及颈部，由下往上，以打小圈的方式轻轻按摩，避免接触眼部，再用温水洗净．\r\n配合其他妮维雅娇柔丝润系列产品使用，可获得更为理想的效果．不堵塞毛孔．','',0,0,0,0,0,'2012-03-01 16:03:47','2012-03-01 16:03:47',3,0);
INSERT INTO `goods_real` VALUES (269,1,0,0,'德国小甘菊','护肤','德国小甘菊敏感肌肤专用皂','http://photo.no5.com.cn/product/mphoto/2009011617182728903465.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009011617182728903465.jpg\";}',38,'http://www.no5.com.cn/goods/18912.html','18912',0,'敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','小甘菊以德国百年传统制皂方式，制成敏感脸部、身体肌肤专用的洁肤皂。以棕榈油、椰油为天然界面活性剂，添加德国洋甘菊萃取、甜没药、大豆保湿甘油，丰富而天然绵密的泡沫，清洁保湿肌肤，同时舒缓敏感肌肤不适。  无化学活性剂、无化学起泡剂、无防腐剂添加；\r\n敏感脸部、身体肌肤都可以使用。  成份：\r\n德国洋甘菊、棕榈油、椰油、大豆保湿甘油。  使用方法：\r\n直接以干净双手，抹取香皂于微湿的脸部或是其它部位肌肤，再以温水冲净即可。  &nbsp;','',0,0,0,0,0,'2012-03-01 16:03:47','2012-03-01 16:03:47',3,0);
INSERT INTO `goods_real` VALUES (270,1,0,0,'Nuxe 欧树','护肤','Nuxe欧树三色玫瑰净颜洁面摩丝(4667480)','http://photo.no5.com.cn/product/mphoto/20090123112408159430451.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090123112408159430451.jpg\";}',155,'http://www.no5.com.cn/goods/19175.html','19175',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','Nuxe 全新设计第一款适合任何肤质使用的三种玫瑰净颜洁面摩丝。\r\n选取三种玫瑰的独特配方，更能美白净颜。\r\n新颖设计，轻轻一压洁颜液瞬间成为柔细的慕丝。无皂碱成分能温和洗净脸部残留物质，即使敏感肌肤也能安心清洁而不刺激。适应肤应：适用任何肤质。使用方法：用温水或冷水先将脸部拍湿，由内向外、由脸部中央至周围画圆，慢慢分解彩妆与残留物质，轻柔按摩也能刺激脸部淋巴循环，洗净后清爽洁净，散发明亮肤色。','',0,0,0,0,0,'2012-03-01 16:03:48','2012-03-01 16:03:48',3,0);
INSERT INTO `goods_real` VALUES (271,1,0,0,'LA MER 海蓝之谜','护肤','LA MER 海蓝之谜美白洁面泡沫','http://photo.no5.com.cn/product/mphoto/19239_M_110325160603_97673316.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/19239_M_110325160603_97673316.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/19239_M_110325160632_50201393.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/19239_M_110325160656_18489357.jpg\";}',598,'http://www.no5.com.cn/goods/19239.html','19239',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品说明：\r\n磁化电气宝石和海蓝之谜独家专利的磁解水赋予了美白洁面泡沫出色的清洁功效。这些带正电的水分子能让美白洁面泡沫彻底而温和地去除面部污垢、杂质和残妆，令肌肤更纯净清澈，感觉焕然一新。美白洁面泡沫所蕴含的海藻纤维，犹如天然洁面布，能产生丰盈细腻的泡沫。肌肤所需的基础养分得到大量补充，油脂分泌回复到最平衡的状态。特别选用的珍珠粉末和翠玉，不仅能轻柔地磨滑肌肤，更凭借凭借其天然的修复滋养功能，让肌肤每天绽放明亮剔透的健康光彩。使用方法：\r\n以打圈的方式在湿润的肌肤上按摩片刻，当翠绿色泡沫变为白色泡沫时，代表洁面完成。以温水冲净。','',0,0,0,0,0,'2012-03-01 16:03:49','2012-03-01 16:03:49',3,0);
INSERT INTO `goods_real` VALUES (272,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP柠檬美白控油洗面奶(401066)','http://photo.no5.com.cn/product/mphoto/20091019163322485842354.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091019163322485842354.jpg\";}',29,'http://www.no5.com.cn/goods/19300.html','19300',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','柠檬具有很好的控油和美白效果，该款洗面奶含有柠檬鲜果萃取精华和维他命C，能深入毛孔清洁污垢，并能平衡油脂和肌肤的酸碱度，让肌肤呈现透明洁白的状态，清新的柠檬香味，让你格外醒神。使用方法：取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净，发挥收缩毛孔功效。','',0,0,0,0,0,'2012-03-01 16:03:53','2012-03-01 16:03:53',3,0);
INSERT INTO `goods_real` VALUES (273,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP芦荟美白保湿洗面奶(27492)','http://photo.no5.com.cn/product/mphoto/20091215172336908136019.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091215172336908136019.jpg\";}',29,'http://www.no5.com.cn/goods/19301.html','19301',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','芦荟：采用天然芦荟精华素精制而成，特别加入了天然植物润肤成分，性格温和，它既能为你滋养肌肤，又能清除细菌的污染。安全而无任何刺激。含有芦荟精华成份，排毒净化，具有抗菌和清除臭氧作用，一扫皮肤的晦暗，使皮肤回复通透白皙的质感，变的更加洁净、滑嫩。适合长期面对电脑的你。芦荟中萃取的丰富维它命，具有焕肤的功效，抑制黑色素细胞的活动，促进血液循环的同时，而且可以排除肌肤组织中的毒素。100%全天然植物配方，对皮肤无任何刺激！泡沫细腻丰富，轻轻松松就把每个毛孔里的脏东西统统洗干净。让你的皮肤立刻吃上鲜嫩的营养，自然的清香带给你24小时好心情！使用方法：\r\n取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净，发挥收缩毛孔功效。','',0,0,0,0,0,'2012-03-01 16:03:57','2012-03-01 16:03:57',3,0);
INSERT INTO `goods_real` VALUES (274,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP樱桃收缩毛孔洗面奶(401067)','http://photo.no5.com.cn/product/mphoto/20091109104559980454881.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091109104559980454881.jpg\";}',29,'http://www.no5.com.cn/goods/19302.html','19302',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','可补充肌肤日渐缺少的维生素C等营养成分，使您的肌肤变得像水果一样晶莹剔透，光滑有光泽。有良好的吸水性，帮助收缩毛孔，促进皮肤的油脂分泌平衡，促进皮肤的紧实、有弹性、含有维他命C、精氨酸等多种活性成分，可帮助保湿皮肤，改善皮肤弹性，改善皮肤的状况，防止皮肤暗黄无光泽。贴心改善你的肤质。使用方法：\r\n取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净，发挥收缩毛孔功效','',0,0,0,0,0,'2012-03-01 16:03:57','2012-03-01 16:03:57',3,0);
INSERT INTO `goods_real` VALUES (275,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP绿豆排毒洗面奶(01064)','http://photo.no5.com.cn/product/mphoto/20090924120323373335915.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090924120323373335915.jpg\";}',35,'http://www.no5.com.cn/goods/19303.html','19303',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','绿豆含有丰富的抗氧化剂──维生素E、异黄酮素和花青素，减少皮肤皱纹，达到养颜美容、保持青春的目的。用天然绿豆精华素精制而成，特别加入了天然植物润肤成分，性质温和，它既能为你滋养肌肤，又能清除细菌的污染，安全而无任何刺激，而且活化皮肤性能，淡化色素，美白肌肤，让皮肤滋润光泽！','',0,0,0,0,0,'2012-03-01 16:03:58','2012-03-01 16:03:58',3,0);
INSERT INTO `goods_real` VALUES (276,1,0,0,'相宜本草','护肤','相宜本草 美白滋润洁面膏(浓缩型)','http://photo.no5.com.cn/product/mphoto/20091117172024248603411.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091117172024248603411.jpg\";}',19,'http://www.no5.com.cn/goods/19380.html','19380',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','功效描述： \r\n有效清除毛孔内污垢，软化角质，去除表皮疲态，保持肌肤天然水分滋润，提亮肤色，嫩白肌肤，柔滑不紧绷   成分： \r\n【人参】同时具有滋润、美白、更新细胞三重功效。\r\n【银杏】天然美白成分，嫩白肌肤，改善肌肤暗淡无光的状态。 \r\n【甘草】天然保湿美白，收缩细致毛孔，防敏、修护\r\n&nbsp;\r\n使用方法：\r\n早晚取适量于掌心，加水揉匀，在面部轻轻按摩，再以清水洗净。 \r\n\r\n此类肌肤需求： 随着年龄的增长，环境的影响，肌肤表皮变厚、新陈代谢不佳，老死细胞废物排出受阻，看上去脸色不好；保水功能的逐渐降低，令肌肤变得干枯粗糙，暗沉无光。此类肌肤需要用营养滋润度高的护肤品，加强美白，适当去角质。 \r\n  &nbsp;','',0,0,0,0,0,'2012-03-01 16:03:59','2012-03-01 16:03:59',3,0);
INSERT INTO `goods_real` VALUES (277,1,0,0,'相宜本草','护肤','相宜本草 控油消痘洁面膏','http://photo.no5.com.cn/product/mphoto/20091103145157992545487.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091103145157992545487.jpg\";}',19,'http://www.no5.com.cn/goods/19381.html','19381',0,'','','','','功效描述： \r\n能彻底清除面部污脂、老化角质和粗皮，净化毛孔，阻断暗疮生成，消除粉刺，活化更新肌肤，令皮肤不再油光满面，恢复光滑细致，重现健康光彩。\r\n配合相宜 洁肤消痘面膜、消痘调理水及消痘修护凝胶使用，效果显著。  \r\n成分： \r\n【金银花/野菊】清凉舒缓，有效消除暗疮、青春痘并收缩毛孔。\r\n【黄柏】平衡油脂分泌，收敛毛孔，延缓皮肤角质化，保持肌肤柔滑湿润。  \r\n使用方法：\r\n早晚取适量于掌心，加水揉匀，在面部轻轻按摩，再以清水洗净。  适用肤质：\r\n适用于中至油性、青春痘、暗疮肌肤。','',0,0,0,0,0,'2012-03-01 16:04:00','2012-03-01 16:04:00',3,0);
INSERT INTO `goods_real` VALUES (278,1,0,0,'Jurlique 茱莉蔻','护肤','Jurlique 茱莉蔻衡肤泡i洁面液(100200)','http://photo.no5.com.cn/product/mphoto/20090320140301347578732.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090320140301347578732.jpg\";}',278,'http://www.no5.com.cn/goods/19392.html','19392',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','特性：\r\n1.纯天然非干燥型的洁肤胶，能洁净皮肤和平衡肤质。\r\n2.内含深层清洁和净化皮肤的茶树香精油及平衡肤质的熏衣草香精油。成份：\r\n植物萃取精华：熏衣草纯油,茶树纯精油,玫瑰,绿茶,金盏花,松木皮,金缕梅,葡萄种子,大豆蛋白质…等。使用方法：\r\n将质地轻柔细致的洁肤胶取1-2滴置于手心，加水稀释轻搓出细致的泡沫，轻轻的按摩脸部及颈部，再用清水洗净即可。适合肤质：适用任何型态肤质，特别适油性及易长痘痘型态肌肤','',0,0,0,0,0,'2012-03-01 16:04:01','2012-03-01 16:04:01',3,0);
INSERT INTO `goods_real` VALUES (279,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP It girl 鸡蛋泡沫洗面奶(02252)','http://photo.no5.com.cn/product/mphoto/19576_M_110407135926_31011025.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/19576_M_110407135926_31011025.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/19576_M_110407135957_41470009.jpg\";}',42,'http://www.no5.com.cn/goods/19576.html','19576',0,'干性,油性,混合性,中性,敏感性','','','','The Face Shop It girl鸡蛋泡沫洗面奶，内含有覆盆子、胡萝卜、黄瓜、黑莓等果蔬精华，洁面同时赋予肌肤营养。更加入尽职守毛孔效果极佳的鸡蛋成分，帮助去除角质，深层清洁毛孔里的污物，并且有效的收紧毛孔，让肌肤变得细腻。添加的牛奶蛋白，长期使用能让肌肤恢复鸡蛋般的细腻光滑。清洁后的肌肤柔软光滑，犹如剥壳的嫩白鸡蛋，细致隐形毛孔、肌肤滑溜溜，轻松让你的皮肤在每一天不知不觉中趋近完美。The Face Shop It girl时尚女郎系列，包装设计美丽个性，特别为时尚独特的你而设计，让你爱上洗脸的感觉！让你每一天都更趋近完美。使用方法：\r\n用温水湿润脸部，取适量于掌中揉出充分泡沫后，圆形按摩状均匀搽抹于脸部，按摩片刻，然后以温水彻底洗净即可。','',0,0,0,0,0,'2012-03-01 16:04:01','2012-03-01 16:04:01',3,0);
INSERT INTO `goods_real` VALUES (280,1,0,0,'Lancome 兰蔻','护肤','Lancome 兰蔻全新智能愉悦美白洁面泡(821918)','http://photo.no5.com.cn/product/mphoto/20090626175223608864214.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090626175223608864214.jpg\";}',272,'http://www.no5.com.cn/goods/19601.html','19601',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','细致的泡沫，能温和去除黑色素角质细胞，使肌肤愈洗愈净白迷人。洗净肌肤污垢皮脂同时将甘草、桑椹、黄岑等汉方植物美白成分导入，清洁纯净肌肤, 立刻透明纯净.植物美白精华：甘草、黄苓、桑树精华美白革命新发现：女性内在情绪波动，令肌肤产生情绪信使 CGRP ，加剧黑色素沉淀，催生顽固色斑。兰蔻先锋NeuroWhiteTM 科技，精确发送智能干扰信号，扰乱CGRP 传播，有效减少黑色素沉淀。智能阻击，从源头淡褪顽固色斑。针对外界紫外线侵害，层层阻截黑色素：在基底层，维他命 CG 源源释放精纯维C ，融合甘草精华，充分抑制黑色素生成；在表皮层，专有Mela-NO ComplexTM 科技，全面截击黑色素诱因NO ；在角质层，水杨酸温和祛除老化细胞。层层对抗，无间隙美白肌肤。数天，肤色呈现均匀剔透；日复一日，顽固色斑全面淡褪，肌肤持久无瑕透亮、莹润白皙！色斑形成的情绪因素 CGRP\r\n作为\"神经美容学\"领域的开拓者， LANCOME兰蔻率先以水份缘系列揭示了压力与皮肤之间的内在联系。今天，LANCOME兰蔻针对不规律色素沉淀的研究报告显示压力、情绪低落和神经紧张所产生的影响：压力加剧会促进媒介物质\" CGRP\"的合成，而CGRP 会加剧黑色素的生成。CGRP源自与表皮细胞接触的皮肤神经末梢，并把携带的信息传送给色素母细胞。 CGRP被认为能够增加含大量黑色素沉淀的细胞数量。使用方法\r\n加水揉出泡沫，涂抹在湿的面部，打圈按摩2-3分钟后清洗。','',0,0,0,0,0,'2012-03-01 16:04:02','2012-03-01 16:04:02',3,0);
INSERT INTO `goods_real` VALUES (281,1,0,0,'相宜本草','护肤','相宜本草 金缕梅控油净白洗颜泥','http://photo.no5.com.cn/product/mphoto/2010072315264578534941.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2010072315264578534941.jpg\";}',29,'http://www.no5.com.cn/goods/19720.html','19720',0,'','','','','本品采用《本草纲目》护肤养颜成分，结合现代科技研制而成，蕴含金缕梅、茶树油、翠竹等本草精华。\r\n\r\n本草清洁控油成分，深层清洁肌肤表层及毛孔中的污垢，多余油脂，软化去除导致肤色暗淡的老废角质，有效抑制油光，收敛粗大毛孔，预防黑头、粉刺、暗疮滋生。\r\n富含天然保湿因子，保护水脂膜，留住水分，令肌肤清透劲爽不紧绷。\r\n\r\n金缕梅：平衡皮脂分泌，补充水分，收缩毛孔。\r\n茶树油:天然清香，渗透力强，平衡油脂分泌，预防粉刺生成。\r\n翠&nbsp; 竹：含有天然保湿因子，补充水分及养分，保护水脂膜，防止肌肤干燥粗糙。使用方法： 早晚用温水润湿面部，取适量（约2cm左右）于掌心，加水揉匀，在面部轻柔按摩1-2分钟后用清水洗净。 \r\n适合肤质： 易泛油光、毛孔粗大的油性、混合性肌肤。&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:03','2012-03-01 16:04:03',3,0);
INSERT INTO `goods_real` VALUES (282,1,0,0,'相宜本草','护肤','相宜本草 美白祛斑洁面膏','http://photo.no5.com.cn/product/mphoto/20100111134918999039082.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100111134918999039082.jpg\";}',24,'http://www.no5.com.cn/goods/19725.html','19725',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','本品采用《本草纲目》护肤养颜成分结合现代科技研制而成，蕴含红花、熊果苷、甘草等本草精华。洗净毛孔内污垢，去除肌肤表面干燥老化角质，减轻肌肤表层色素沉着，淡化色斑，保持嫩白。\r\n\r\n红 花：消斑养颜，消除皮肤微循环不良所致的肤色不均、黯哑无光。\r\n甘 草：美白功能显著，有效改善肤色，提升肌肤亮白度。\r\n熊果苷：卓越美白成分，对色素有预防与消减作用，安全性佳。\r\n&nbsp;\r\n使用方法： 早晚取适量于掌心，加水揉匀，在面部稍加按摩，以清水洗净。&nbsp; \r\n适合肤质：有斑、暗黄肌肤。\r\n\r\n\r\n    &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:03','2012-03-01 16:04:03',3,0);
INSERT INTO `goods_real` VALUES (283,1,0,0,'相宜本草','护肤','相宜本草 海藻保湿洁面乳','http://photo.no5.com.cn/product/mphoto/2009120417212135277850.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009120417212135277850.jpg\";}',19,'http://www.no5.com.cn/goods/19726.html','19726',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','本品采用《本草纲目》护肤养颜成分结合现代科技研制而成，蕴含海藻、芦荟等本草精华。无泡沫，温和洗净污垢，特别保湿因子能有效补充洁面后肌肤流失的水分，持久保湿并锁住水分，洗后肌肤清爽干净、柔滑舒适&nbsp;\r\n \r\n海藻：激发细胞活力，能保持肌肤清新爽洁，显著舒缓肌肤干燥。\r\n芦荟：清润养颜，美白柔肤。\r\n&nbsp;\r\n使用方法： 取适量于掌心，加水揉匀，在面部稍加按摩，以清水洗净。 \r\n适合肤质：中至干性肌肤适用\r\n\r\n    &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:04','2012-03-01 16:04:04',3,0);
INSERT INTO `goods_real` VALUES (284,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP新款纯净蓝莓浆果洁面泡沫(00844)','http://photo.no5.com.cn/product/mphoto/20090806134341313198018.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090806134341313198018.jpg\";}',45,'http://www.no5.com.cn/goods/19840.html','19840',0,'干性,油性,混合性,中性,敏感性','','','','08年新款推出的净纯宝贝蓝莓浆果系列，专为年轻皮肤设计，成分更安全,防敏抗敏,防辐射，补水不油腻，解决皮肤的小困扰。\r\n\r\n本品针对长期使用电脑的人群，蕴含鲜花中提取的自然美白成分及丰富植物萃取液，有效调理肌肤，防止辐射等对皮肤的伤害，改善皮肤黯淡、发黄、干燥等不良现象，同时保护皮肤抵制外界环境的污染，并在皮肤表层形成保护膜！独有的莲花瓣精华成份，可彻底去除彩妆的残余，清除毛孔内的杂物，帮助清洁的同时滋润营养肌肤，洁面后感觉光滑不紧绷！\r\n\r\n使用方法：无需揉搓起泡，轻压瓶顶即可出现丰富的泡沫，将泡沫均匀涂抹于脸部轻轻按摩后用清水洗净即可。\r\n\r\n适合肤质：所有皮肤。','',0,0,0,0,0,'2012-03-01 16:04:05','2012-03-01 16:04:05',3,0);
INSERT INTO `goods_real` VALUES (285,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP石榴泡沫洗面奶(00692)','http://photo.no5.com.cn/product/mphoto/19841_M_110512162415_47208992.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/19841_M_110512162415_47208992.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/19841_M_110512162429_34096809.jpg\";}',43,'http://www.no5.com.cn/goods/19841.html','19841',0,'','','','','适合肤质：适合干性肤质。功能：改善肌肤细纹 保湿成份：纯天然石榴成份石榴中含有大量的多酚和抗氧化物质,此款洗面奶富含从石榴中提取的植物精华，它们能够强化肌肤弹性，并配合保湿因子改善肌肤纹.防止肌肤缺水、干燥，使疲惫的肌肤重新恢复元气与活力。使用方法：\r\n取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净，发挥收缩毛孔功效。','',0,0,0,0,0,'2012-03-01 16:04:05','2012-03-01 16:04:05',3,0);
INSERT INTO `goods_real` VALUES (286,1,0,0,'草木年华','护肤','草木年华 积雪草美白保湿洁面乳','http://photo.no5.com.cn/product/mphoto/20090901093046589377852.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090901093046589377852.jpg\";}',23,'http://www.no5.com.cn/goods/19873.html','19873',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','MAP温和洁面配方，洗去毛孔中残留恶的彩妆，污垢及多余皮脂，改善晦暗、发黄肤色，锁住肌肤水分，洗后肌肤莹润光滑，倍感舒适。产品蕴含亚洲积雪草，海藻提取物，甜菜等植物精华，适合各类肤质使用，尤其适合中性至干性、混合性肌肤。\r\n\r\n使用方法：取适量本品于掌心，加清水揉搓起泡，轻轻涂抹于面部按摩，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:04:06','2012-03-01 16:04:06',3,0);
INSERT INTO `goods_real` VALUES (287,1,0,0,'草木年华','护肤','草木年华 六重草本祛痘消印洁面乳','http://photo.no5.com.cn/product/mphoto/19878_M_110801151004_45150429.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/19878_M_110801151004_45150429.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/19878_M_110801151026_46562172.jpg\";}',25,'http://www.no5.com.cn/goods/19878.html','19878',0,'','','','','深入毛孔内部，清楚彩妆，污垢及老化角质，改善油脂分泌，抑制、祛除青春痘，粉刺，淡化痘印，洗后清爽不油腻。蕴含六重草本植物祛痘消印修护精华。\r\n\r\n使用方法：取适量本品于掌心，加清水揉搓起泡，轻抹于面部按摩，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:04:07','2012-03-01 16:04:07',3,0);
INSERT INTO `goods_real` VALUES (288,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉亮白洁面泡沫(40801)','http://photo.no5.com.cn/product/mphoto/2009092215302539802912.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2009092215302539802912.jpg\";}',190,'http://www.no5.com.cn/goods/20058.html','20058',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','包含专利DPS淡斑系统，这是理肤泉独享的一款创新美白专利，是首个可以在各个环节阻击黑色素的美百产品，真正达到立体美白.深入清洁皮肤，提亮肤色，使用后皮肤滋润无任何紧绷感。适合敏感肌肤的美白品使用方法：取适量产品于掌心，加适量温水使形成丰富泡沫。均匀涂抹于打湿的面部皮肤，以划圈的方式加以适度按摩，最后以清水冲洗干净。请避开眼睛使用。','',0,0,0,0,0,'2012-03-01 16:04:09','2012-03-01 16:04:09',3,0);
INSERT INTO `goods_real` VALUES (289,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物水润系列柔润洁面膏(滋润型)','http://photo.no5.com.cn/product/mphoto/20090925160825533955273.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090925160825533955273.jpg\";}',38,'http://www.no5.com.cn/goods/20081.html','20081',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','天然植物精华温和呵护肌肤，在保持肌肤滋润的同时，有效的清除污垢的洁面膏。\r\n洁面后肌肤滋润柔滑。轻松起泡，丰富泡沫有效除去肌肤污垢及老化角质，使肌肤具有透明感。柔柔的花香，让心情格外放松。经过过敏性测试。\r\n\r\n使用方法：取适量置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。\r\n适合中性肌肤~干性肌肤使用。','',0,0,0,0,0,'2012-03-01 16:04:10','2012-03-01 16:04:10',3,0);
INSERT INTO `goods_real` VALUES (290,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物水润系列柔润洁面膏(清爽型)','http://photo.no5.com.cn/product/mphoto/20090925160418533955273.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090925160418533955273.jpg\";}',37,'http://www.no5.com.cn/goods/20084.html','20084',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','天然植物精华温和呵护肌肤，在保持肌肤滋润的同时，有效的清除污垢的洁面膏。\r\n洁面后肌肤滋润柔滑。轻松起泡，丰富泡沫有效除去肌肤污垢及老化角质，使肌肤具有透明感。柔柔的花香，让心情格外放松。经过过敏性测试。\r\n\r\n使用方法：取适量置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。\r\n适合中性肌肤~油性肌肤使用。','',0,0,0,0,0,'2012-03-01 16:04:10','2012-03-01 16:04:10',3,0);
INSERT INTO `goods_real` VALUES (291,1,0,0,'PURE&MILD 泊美','护肤','PURE&MILD 泊美植物臻白系列凝皙洁面膏','http://photo.no5.com.cn/product/mphoto/20090925174610533955273.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090925174610533955273.jpg\";}',54,'http://www.no5.com.cn/goods/20091.html','20091',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','配合天然植物精华，温和呵护肌肤的洁面膏，在宝石肌肤滋润的同时，温和洗去含有黑色素的老化角质。\r\n洁净颗粒能有效清除堵塞毛孔的污垢和含有黑色素的老化角质，塑造白皙，光滑的透明肌肤。快速起泡，丰富柔滑的泡沫，保持肌肤滋润的同时温和清洁肌肤，让化妆水更容易渗入肌肤。经过过敏测试。  使用方法：取约1cm置于掌心，加清水或温水揉出丰富泡沫后按摩脸部，然后充分清洗。','',0,0,0,0,0,'2012-03-01 16:04:11','2012-03-01 16:04:11',3,0);
INSERT INTO `goods_real` VALUES (292,1,0,0,'H2o 水芝澳','护肤','H2O 水芝澳绿茶洗面奶(335)','http://photo.no5.com.cn/product/mphoto/20090927111922887916803.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090927111922887916803.jpg\";}',215,'http://www.no5.com.cn/goods/20107.html','20107',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','独有绿茶精华，彻底洗净肌肤表面污垢的同时去除面部黄气、舒缓镇静肌肤。特有海藻精华，在清洁肌肤同时，不带走肌肤水份，令肌肤充满弹性，回复健康光泽。&nbsp; \r\n&nbsp;\r\n适用所有肌肤（特别适合敏感脆弱、干燥、暗哑、黄气重的肌肤）&nbsp; \r\n&nbsp;\r\n使用方法：&nbsp; \r\n早晚将洗面奶涂于面部和颈部，打圈轻按，再用化妆棉抹掉或用清水过净。','',0,0,0,0,0,'2012-03-01 16:04:12','2012-03-01 16:04:12',3,0);
INSERT INTO `goods_real` VALUES (293,1,0,0,'Depiliss 丹派诗','护肤','Depiliss 丹派诗柑桔矿物盐泡沫洁颜粉','http://photo.no5.com.cn/product/mphoto/200910161020451028791548.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200910161020451028791548.jpg\";}',21,'http://www.no5.com.cn/goods/20197.html','20197',0,'干性,油性,混合性,中性,敏感性','','','','蕴含天然矿物盐，绿豆粉等成分，对肌肤有抑油、保湿、除皱的功效。加快细胞吸收于代谢，深层保湿滋润肌肤，并在肌肤表面形成杀菌保护膜，改善肤质，紧致肌肤，有效去除肌肤表面及细微处的污垢、死皮、暗疮，延缓老化，使肌肤年轻润泽嫩白，柔滑具有弹性。  使用方法：沐浴时取适量于掌心，润水后涂抹面部，重点打圈按摩累赘部位，洗净即可。','',0,0,0,0,0,'2012-03-01 16:04:12','2012-03-01 16:04:12',3,0);
INSERT INTO `goods_real` VALUES (294,1,0,0,'Depiliss 丹派诗','护肤','Depiliss 丹派诗玫瑰糙米矿物盐泡沫洁颜粉(特价！)','http://photo.no5.com.cn/product/mphoto/200910161033121028791548.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200910161033121028791548.jpg\";}',16,'http://www.no5.com.cn/goods/20198.html','20198',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','由天然矿物盐糙米粉等成分组成，富含人体所需的铁、钙、镁等多种微量元素，长期使用可以祛除粗糙的皮肤，消除肌肤的黑色素，让它逐渐恢复细白、嫩滑、有弹性，令肌肤细嫩光滑。使用方法：沐浴时取适量于掌心，润水后涂抹面部，重点打圈按摩累赘部位，洗净即可。','',0,0,0,0,0,'2012-03-01 16:04:13','2012-03-01 16:04:13',3,0);
INSERT INTO `goods_real` VALUES (295,1,0,0,'Avene 雅漾','护肤','Avene 雅漾柔润洁面乳(05151)','http://photo.no5.com.cn/product/mphoto/20091021094036839783919.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20091021094036839783919.jpg\";}',143,'http://www.no5.com.cn/goods/20227.html','20227',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','富含雅漾活泉水，具有舒缓和抗刺激作用，其所含洁面成分柔和无刺激，可用于眼周和唇部敏感部位卸妆，保湿成分能保持表皮上的水脂层平衡，使肌肤富有弹性和光泽。\r\n适合中性和干性敏感肌肤的清洁。使用方法：早晚使用，用指尖和化妆棉柔柔涂抹于面部和颈部，然后用雅漾柔润柔肤水清洗，洗净后用雅漾舒缓活泉水喷雾。&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:16','2012-03-01 16:04:16',3,0);
INSERT INTO `goods_real` VALUES (296,1,0,0,'Avene 雅漾','护肤','Avene 雅漾无皂基滋润洁肤皂(25489)','http://photo.no5.com.cn/product/mphoto/20230_M_110609142129_43751045.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/20230_M_110609142129_43751045.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/20230_M_110609142143_13599068.jpg\";}',65,'http://www.no5.com.cn/goods/20230.html','20230',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','无皂基，柔和洁肤，含雅漾滋润冷霜和具有舒缓、抗刺激作用的雅漾活泉水。\r\n适用于婴儿、儿童和成人的脸部和身体各部位的日常洁肤。使用方法：将本品涂抹于湿润后的肌肤上，轻轻按摩后清洗干净。&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:17','2012-03-01 16:04:17',3,0);
INSERT INTO `goods_real` VALUES (297,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉痘痘清舒缓洁面ㄠ(41163)','http://photo.no5.com.cn/product/mphoto/200910221052381016648701.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200910221052381016648701.jpg\";}',137,'http://www.no5.com.cn/goods/20245.html','20245',0,'','','','','温和清洁肌肤表面不洁物和多余油脂，令肌肤洁净，清新。适用于有痘痘的耐受性差肌肤。使用方法：取适量本品于湿润的双手，涂抹于面部肌肤并轻柔按摩，最后彻底清洗干净。','',0,0,0,0,0,'2012-03-01 16:04:18','2012-03-01 16:04:18',3,0);
INSERT INTO `goods_real` VALUES (298,1,0,0,'Elizabeth Arden 雅顿','护肤','Elizabeth Arden 雅顿双效洁肤露(3917400) 特价!','http://photo.no5.com.cn/product/mphoto/201003231002271039530942.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/201003231002271039530942.jpg\";}',130,'http://www.no5.com.cn/goods/20429.html','20429',0,'','','','','含鼠尾草、迷迭香和金缕梅等天然成分，是兼具清洁与调理双重功效的洁面乳，使用后肌肤感觉清爽柔滑不紧绷。\r\n主要特点描述: 兼具清洁与调理双重功效，使用后无需再使用化妆水，是现代都市忙碌女性的完美选择。它含有鼠尾草、迷迭香与金缕梅精华，可收敛毛孔，肌肤洗后柔滑不紧绷。\r\n-保湿、镇定、舒缓，让肌肤感受柔滑舒适\r\n-收敛毛孔镇定肌肤，改善痘痘和发炎现象\r\n-调节油脂分泌，收敛毛孔，使肤色细腻均匀使用方法: 早晚皆可使用。湿润脸部后，取适量涂于脸部轻柔按摩，再用温水洗净。','',0,0,0,0,0,'2012-03-01 16:04:19','2012-03-01 16:04:19',3,0);
INSERT INTO `goods_real` VALUES (299,1,0,0,'Biotherm 碧欧泉','护肤','Biotherm 碧欧泉深海源萃白洁面膏(056433)','http://photo.no5.com.cn/product/mphoto/20100705084233114873796.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100705084233114873796.jpg\";}',215,'http://www.no5.com.cn/goods/20497.html','20497',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','白色乳霜质地特含燕麦成分，彻底清除皮肤杂质及化妆品、环境污染的残留物，泡沫丰富、性情温和，肌肤感受到舒爽活力。洁面的同时深层补充皮肤水份，给肌肤华丽清新之感，肌肤更加洁净通透，让每一个细胞都深呼吸。   使用方法：润湿面部，取适量产品于掌心，加适量清水使其充分乳化、形成细密泡沫，然后均匀涂抹于面部皮肤，加以轻柔按摩，最后以清水冲洗干净。','',0,0,0,0,0,'2012-03-01 16:04:19','2012-03-01 16:04:19',3,0);
INSERT INTO `goods_real` VALUES (300,1,0,0,'草木年华','护肤','草木年华 积雪草海藻美白洗颜泥','http://photo.no5.com.cn/product/mphoto/20100111102920999020202.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100111102920999020202.jpg\";}',23,'http://www.no5.com.cn/goods/20636.html','20636',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','深层清洁肌肤，洗去毛孔中残留的彩妆、污垢及多余皮脂，改善油脂分泌及肤色暗沉，保持毛孔清爽畅通，洗后舒爽不紧绷。适合各类肌肤使用，尤其是中性至偏油性、混合性肌肤。\r\n独特之处：蕴含天然海藻泥，深层清洁肌肤，洗净面部污垢，改善油脂分泌，使肌肤亮丽白皙，水嫩柔滑  使用方法：取适量本品于掌心，加清水揉搓起泡，轻抹于面部按摩，再用清水洗净。','',0,0,0,0,0,'2012-03-01 16:04:21','2012-03-01 16:04:21',3,0);
INSERT INTO `goods_real` VALUES (301,1,0,0,'草木年华','护肤','草木年华 海藻糖活泉补水洁面乳','http://photo.no5.com.cn/product/mphoto/20100111111604999023894.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100111111604999023894.jpg\";}',28,'http://www.no5.com.cn/goods/20640.html','20640',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','MAP温和洁面配方，触感细腻，泡沫丰富，洗去面部残留彩妆、污垢及老化角质。锁住肌肤水分，保持肌肤弹性，清洁后皮肤不干燥，不紧绷，更有利于后续保养品的吸收。\r\n含天然保湿因子的代表物质TREHA（海藻糖），其具有优异的保持细胞活力和生物大分子活性的特性。皮肤细胞尤其是表皮细胞在高温、高寒、干燥、强紫外线辐射等环境下，极易失去水分发生角质化，甚至死亡脱落使皮肤受损。海藻糖在这种情况下能够在细胞的表层形成一层特殊的保护膜，不仅滋润着皮肤细胞，还具有将外来辐射反射回去的功能。从而保护皮肤不致受损。海藻糖也是化妆品中SOD等活性物质的重要保护剂。海藻糖还作为新一代的保湿因子能帮助平衡肌肤的湿润度并预防缺水状态的生成而成为化妆品的一个热门成分。使用方法:取适量本品于掌心，加清水揉搓起泡，轻抹于面部按摩，再用清水洗净&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:25','2012-03-01 16:04:25',3,0);
INSERT INTO `goods_real` VALUES (302,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂高密度弹力保湿洗面膏(37597)','http://photo.no5.com.cn/product/mphoto/20100202163626959140453.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100202163626959140453.jpg\";}',95,'http://www.no5.com.cn/goods/20750.html','20750',0,'干性,油性,混合性,中性,敏感性','','','','日本资生堂 AQUALABEL水之印系列护肤品以其全新的“导入式护肤”概念和卓越的效果深受广大女性的喜爱。其产品将有效的美肤营养成分使之深入渗透肌肤，令其充分吸收，切实发挥导入式护肤的作用。\r\n含有充分保湿成份的有弹力的泡沫，使肌肤像被完全包住般清洁的洁面乳。使用后，肌肤感到湿润、柔软、改善肌肤的纹理，只有清洗，就可以使肌肤感到调整纹理。  高效活肤水因子 AQUA SYNERY，能柔软老化的角质层，促进吸收。\r\n玻尿酸（保湿），能深入肌肤底层，有效对抗干燥环境，恢复弹性光华的肌肤，皮肤水润柔嫩！\r\n胶原蛋白（保湿），海洋性胶原蛋白具有超强保湿功能，给予肌肤丰富的弹力感！\r\n野玫瑰精华（保湿），从野生玫瑰果实中萃取，可以提高玻尿酸的吸收，加强保湿效果。\r\n海藻醣（保湿），不论在何种环境，都可以防止肌肤干燥的天然保湿成分，给予肌肤保湿补给。\r\n氨基酸（保湿），可以减少肌肤水分流失，增加肌肤本身保水度。  适合干性、中性、油性肤质的女性使用。在干燥的秋天和寒冷的冬天此款化妆品也是首选。  使用方法：取适量洗面奶于掌心，揉搓起泡。待到泡沫变得绵密时，用泡沫轻揉脸部，让泡沫深入毛孔带走多余油脂及污垢。最后，清水洗净即可。  &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:26','2012-03-01 16:04:26',3,0);
INSERT INTO `goods_real` VALUES (303,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺芦荟舒缓洁面慕丝(22617)','http://photo.no5.com.cn/product/mphoto/20100205085314416218663.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100205085314416218663.jpg\";}',85,'http://www.no5.com.cn/goods/20774.html','20774',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含瓜地马拉公平交易的芦荟胶、山梨糖醇、甘油，100%不含皂的慕丝质地，能温和洁净肌肤，洗后肌肤保湿柔嫩清爽。不含防腐剂；不含香料；不含色素。  使用说明：卸妆后，取适量轻柔按摩全脸肌肤后，再清洗。','',0,0,0,0,0,'2012-03-01 16:04:26','2012-03-01 16:04:26',3,0);
INSERT INTO `goods_real` VALUES (304,1,0,0,'Laneige 兰芝','护肤','Laneige 兰芝多效泡沫水润洁面乳(17614)','http://photo.no5.com.cn/product/mphoto/20815_M_120216164733_76103035.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/20815_M_120216164733_76103035.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/20815_M_120216164748_18913704.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/20815_M_120216164810_81887336.jpg\";}',157,'http://www.no5.com.cn/goods/20815.html','20815',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','快速卸除彩妆，能很全面的清除化妆的残余物和因环境污染而产生的皮肤有害成分，而且消除毛孔里的老废物，并且具有镇静皮肤的作用。从睡莲中萃取精华成分，在清洁时带来愉快和清爽的感觉。含有鸢尾草、金缕梅抽出物，增加皮肤弹性。与皮肤有亲和性，Polymer形成保护膜，清洁后使皮肤维持湿润。在玉米抽出的多糖体的Sorbitol成分在洗脸时带来爽快的清爽的感觉。含有橄榄抽出物，使皮肤变为弹性的皮肤。使用方法：\r\n取约2CM左右的洁面膏于手掌，用双手轻柔按摩于脸部。最后，用温水将洁面品洗净。','',0,0,0,0,0,'2012-03-01 16:04:27','2012-03-01 16:04:27',3,0);
INSERT INTO `goods_real` VALUES (305,1,0,0,'HR 赫莲娜','护肤','HR 赫莲娜Life Ritual滋养致柔洁面霜(20414)','http://photo.no5.com.cn/product/mphoto/20100205181538416274843.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100205181538416274843.jpg\";}',295,'http://www.no5.com.cn/goods/20822.html','20822',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','为了肌肤的持久美丽，纯净与光彩，HR赫莲娜汲取来自印度长生树Moringa树籽的力量，创新研发了致容新生基础护肤系列。\r\n蕴含印度长生树籽精粹，能滋润、软化肌肤，温和祛除彩妆，确保充分清洁。完美双效，净化润泽，完全清洁，留驻青春，去除令肌肤窒息的不洁杂物，增加肌肤滋润度，用后肌肤清新柔润。  使用方法：取少量洁面膏置于掌心，加少量清水产生丰富泡沫。在面部肌肤打圈按摩。用清水彻底漂清，随后使用化妆水。','',0,0,0,0,0,'2012-03-01 16:04:28','2012-03-01 16:04:28',3,0);
INSERT INTO `goods_real` VALUES (306,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂水活焕妍洗面皂(53066)','http://photo.no5.com.cn/product/mphoto/20100315110854697772974.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100315110854697772974.jpg\";}',230,'http://www.no5.com.cn/goods/20900.html','20900',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','丰盈柔滑的洁面泡沫,有效卸妆和清除面上污垢,同时保持肌肤平衡与柔滑,为随后的护肤程序作好准备。  使用方法U每天早晚使用。将手和脸打湿，取少量于掌心,以冷水或暖水揉起丰盈泡沫,用泡沫包住脸部，以打圈动作清洁肌肤,最后以清水彻底洗净。','',0,0,0,0,0,'2012-03-01 16:04:29','2012-03-01 16:04:29',3,0);
INSERT INTO `goods_real` VALUES (307,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯美白洗面乳','http://photo.no5.com.cn/product/mphoto/20100319152433331814171.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100319152433331814171.jpg\";}',127,'http://www.no5.com.cn/goods/20927.html','20927',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','丰盈乳霜状配方，细腻丰富的泡沫温柔清洁肌肤。\r\n美白护肤程序中的第一步：丰盈乳霜状配方，加水可揉出细腻丰富的泡沫，温柔清洁肌肤，洁净杂质。\r\n蕴含MelaCEPTM美白复合物，帮助抵抗导致肌肤肤色不均和失去活力的因素，有效的均匀肤色，使肤色更加明亮、剔透。\r\n甲基椰油酰基牛磺酸钠――温和的清洁成份。使用方法:取少量洁面乳于手掌混合水揉搓起泡，然后将其涂抹于脸部及颈部，避开眼部周围。用温水或者湿布洗去泡沫。每日早晚使用。','',0,0,0,0,0,'2012-03-01 16:04:30','2012-03-01 16:04:30',3,0);
INSERT INTO `goods_real` VALUES (308,1,0,0,'佰草集','护肤','佰草集 平衡洁面乳','http://photo.no5.com.cn/product/mphoto/20945_M_111222172431_19199349.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/20945_M_111222172431_19199349.jpg\";}',51,'http://www.no5.com.cn/goods/20945.html','20945',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','平衡洁面乳能彻底洗净面部油性区域的皮脂和尘垢，同时帮助干燥部位有效保持水分，使肌肤调和一致，爽洁柔软。该款洁面乳有独特的氨基酸基质配方，柔和无刺激，长期使用，肌肤会在中草药的逐步调理下，干性部位变得滋润，油腻部位变得爽适。\r\n土茯苓甙能给肌肤补充充足的水分和养分，促进人体自身对皮脂的调理，达到平衡。甘草酸及其衍生物有滋养肌肤，抑制炎性反应的作用。 使用方法：先蘸湿面部，挤出适量（樱桃大小）于掌心，加水揉出泡沫，在面部轻轻按摩，再以温水洗净。适合混合性肤质','',0,0,0,0,0,'2012-03-01 16:04:30','2012-03-01 16:04:30',3,0);
INSERT INTO `goods_real` VALUES (309,1,0,0,'佰草集','护肤','佰草集 新玉润保湿洁面泡','http://photo.no5.com.cn/product/mphoto/20100324151504142772092.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100324151504142772092.jpg\";}',90,'http://www.no5.com.cn/goods/20947.html','20947',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','细腻丰富的碳酸泡能促进肌肤活力，配合温和弱酸性氨基酸洁颜成分，清洁肌肤的同时本草活性成分渗透入肌肤，令肌肤柔润嫩滑。使用方法：先蘸湿面部，轻按喷头挤出适量泡沫于掌心，在面部轻轻按摩，再以温水洗净。搭配佰草集新玉润保湿系列产品共同使用，效果尤佳。','',0,0,0,0,0,'2012-03-01 16:04:31','2012-03-01 16:04:31',3,0);
INSERT INTO `goods_real` VALUES (310,1,0,0,'佰草集','护肤','佰草集 新七白美白洁面哩','http://photo.no5.com.cn/product/mphoto/20100324172650142788912.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100324172650142788912.jpg\";}',64,'http://www.no5.com.cn/goods/20955.html','20955',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','添加白芷、白芍、白术等七种中草药有效精华，能温和的洗净面部肌肤，泡沫柔软丰富，再加上经过轻轻的按摩后，更能有效的淡化面部的色素沉着，改善面部肌肤的血液微循环，增进皮肤的新陈代谢，有效抑制肌肤基地层黑色素的生成，进而增加肌肤对营养成分的吸收与自身的抵抗能力，有效抵御外界有害物质对肌肤造成的伤害。长期使用更令肌肤美白柔润。使用方法：先用温水蘸湿面部，挤出适量（樱桃般大小，约2克）于掌心，加水均匀的揉出泡沫，在面部以轻轻打圈的方式进行按摩，数分钟，再用温水洗净即可。适合于任何肤质使用，娇嫩敏感性肌肤亦可使用。','',0,0,0,0,0,'2012-03-01 16:04:31','2012-03-01 16:04:31',3,0);
INSERT INTO `goods_real` VALUES (311,1,0,0,'AVON 雅芳','护肤','AVON雅芳新活美白洁面乳','http://photo.no5.com.cn/product/mphoto/20100331094257307394963.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100331094257307394963.jpg\";}',75,'http://www.no5.com.cn/goods/20977.html','20977',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','超丰富细腻泡沫，深层洁净面部油污及死去细胞，为后续美白营养的吸收先打造肌肤的健康生态，同时提升肌肤锁水性，在深层美白洁净时保持肌肤水分不流失，肌肤尽显白皙水润。  历经10年，拥有1400项专利的雅芳萨芬全球护肤中心终于研究出突破性美白科技，在全面抑制黑色素的同时，激发肌肤自身活力美白的源源动力，助你突破美白瓶颈！\r\n三重锁黑科技同时抑制3种黑色素酶\r\n知道吗，导致肌肤变黑的黑色素酶共有3种。而一般的美白产品只能抑制1种黑色素酶（酪氨酸酶），美白效果十分有限。新活美白“三重锁黑科技”做到同时抑制3种黑色素酶，抑黑更彻底。\r\n\r\n能量优化系统从根源阻断黑色素能源\r\n“能量优化系统”有效切断黑色素能源供给，这样就从根源抑制了黑色素产品，抑黑更彻底。此外，还能把能量优化集中为细胞美白能量。\r\n\r\n细胞动能精华全方位激活细胞美白能量。获得优化后的能量，肌肤变得活力光彩。雅芳独家科技“细胞动能精华”深入渗透至肌底，加速细胞代谢更新，全方位激活底层细胞能量。美白营养层层上传，到达表皮。原本枯萎的细胞变得饱满、充盈有活力，整个肌肤绽放白皙光彩。  使用方法：每日早晚用水润湿面部，取适量产品与手心，加少许水揉搓至泡沫丰富后双手伴随泡沫轻轻在脸部揉洗，并伴以按摩，然后清水洗净。','',0,0,0,0,0,'2012-03-01 16:04:32','2012-03-01 16:04:32',3,0);
INSERT INTO `goods_real` VALUES (312,1,0,0,'其他洗护品牌','洗护','GERLASAN 洁兰萍洗浴液','http://photo.no5.com.cn/product/mphoto/20100331092258307394963.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100331092258307394963.jpg\";}',128,'http://www.no5.com.cn/goods/20982.html','20982',0,'','','','','彻底清洁肌肤，醒肤，维持水分平衡。激发活力、增强肌肤功能。温和性无皂卫生浴液，无刺激，适用于碱性皂液过敏的肌肤、不含酒精、无臭无味、泡沫丰富，经济实用，可平衡肌肤酸碱度。  使用方法：在清洁面部或沐浴时使用，用后清水冲洗。','',0,0,0,0,0,'2012-03-01 16:04:33','2012-03-01 16:04:33',3,0);
INSERT INTO `goods_real` VALUES (313,1,0,0,'DHC 蝶翠诗','护肤','DHC橄榄滋养皂','http://photo.no5.com.cn/product/mphoto/20100331113634359002544.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100331113634359002544.jpg\";}',85,'http://www.no5.com.cn/goods/20997.html','20997',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','洗后肌肤不紧绷、兼具“滋润”与“洗净力”的洁面皂。 \r\n皮肤粗糙、青春痘、暗沉等多半是因面部没有彻底洗净而造成的。DHC橄榄滋养皂是一款内含橄榄精华油和蜂蜜的透明洁面皂。具备能充分清除肌肤污垢及老化角质的“洗净力”和“滋润肌肤”的双重功效。迅速起泡，柔软细腻的泡沫能迅速包裹、分离污垢，温和洗净脸部。没有紧绷感，并能留住滋润，让洗脸也变成一种享受。 \r\n&nbsp;\r\n&nbsp;\r\n使用方法：将洁面皂置于湿润的掌心搓揉至充分起泡。 将细腻柔软的泡沫包覆整个脸部。清洁鼻翼、眼周时动作要轻柔，T型区则要仔细彻底。 用清水或温水充分冲洗干净。','',0,0,0,0,0,'2012-03-01 16:04:34','2012-03-01 16:04:34',3,0);
INSERT INTO `goods_real` VALUES (314,1,0,0,'佰草集','护肤','佰草集 舒盈祛痘洁面皂','http://photo.no5.com.cn/product/mphoto/20100414111122637484581.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100414111122637484581.jpg\";}',68,'http://www.no5.com.cn/goods/21001.html','21001',0,'','','','','佰草集舒盈祛痘洁面皂，蕴含藏红花、芦荟、忍冬等本草精华，能深入清洁面部肌肤，泡沫丰富细腻，温和洁净同时去除肌肤多余油脂，疏通堵塞毛孔，令肌肤保持清爽不紧绷。  使用方法:将洁面皂置于湿润的掌心搓揉至充分起泡，将泡沫涂抹整个面部，尤其注意T区部位，适度按摩1分钟，再以清水洗净。搭配佰草集舒盈祛痘系列产品共同使用，效果尤佳。','',0,0,0,0,0,'2012-03-01 16:04:34','2012-03-01 16:04:34',3,0);
INSERT INTO `goods_real` VALUES (315,1,0,0,'佰草集','护肤','佰草集 舒爽洁面哩','http://photo.no5.com.cn/product/mphoto/21046_M_110117151153_17456642.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/21046_M_110117151153_17456642.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/21046_M_110117151216_19000221.jpg\";}',48,'http://www.no5.com.cn/goods/21046.html','21046',0,'敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','产品功效：\r\n佰草集舒爽洁面ㄠ，蕴含甘草、瞿麦等中草药精华，温和细腻，洗净面部肌肤的同时令肌肤舒适幼滑。适合多种肤质，娇嫩肌肤亦可使用。卓效成分：\r\n甘草、瞿麦中草药精华。\r\n成分：\r\n水、椰油酰基谷氨酸 TEA盐、丁二醇、甘油、羟乙基纤维素、月桂酰燕麦氨基酸钠、瞿麦提取物、甘草酰铵、羟苯甲酯、羟苯乙酯、乙基已基甘油、丙二醇、甲基异噻唑啉酮、苯甲醇、甲基氯异噻唑啉酮使用方法：\r\n先蘸湿面部，挤出适量（樱桃般大小，约2g）于掌心，加水揉出泡沫，在面部轻轻按摩，再以温水洗净。搭配佰草集舒爽系列产品共同使用，效果尤佳。','',0,0,0,0,0,'2012-03-01 16:04:35','2012-03-01 16:04:35',3,0);
INSERT INTO `goods_real` VALUES (316,1,0,0,'佰草集','护肤','佰草集 深层洁容膏','http://photo.no5.com.cn/product/mphoto/20100413173604460371794.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100413173604460371794.jpg\";}',51,'http://www.no5.com.cn/goods/21053.html','21053',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','蕴含益母草、枸杞、土茯苓等中草药精华，还有天然活性泥成分，质地细腻，泡沫丰富，能有效清洁皮肤表面污垢、汗渍、彩妆和多余油脂，锁住水分和养分，不紧绷，不干燥，令肌肤臻至平衡状态。天然中草药成分配合叶绿素、胡萝卜素、维生素E等天然美容成分，增强肌肤抗氧化能力，更深层美肤。令肌肤细腻柔嫩、光泽有弹性。  使用方法：先将脸部湿润，取适量（约2茶匙，6克）于手心，加水揉出泡沫，在脸部轻轻按摩，再以清水洗净即可。\r\n适宜人群：适合任何肤质，敏感或娇嫩型肌肤亦可使用。','',0,0,0,0,0,'2012-03-01 16:04:36','2012-03-01 16:04:36',3,0);
INSERT INTO `goods_real` VALUES (317,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺智慧女人活肤再生丰润洁面乳(25564)','http://photo.no5.com.cn/product/mphoto/20100416170213991500241.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100416170213991500241.jpg\";}',122,'http://www.no5.com.cn/goods/21081.html','21081',0,'干性,油性,混合性,中性,敏感性','','','','智慧女人活肤再生丰润洁面乳含能促进胶原及弹力蛋白再生的独特复合配方，及辣木籽萃取精化、有机橄榄油、葵花子油。质地极为柔细滑顺，可温和卸除彩妆和污垢，在净化的同时，调理肤质增强皮肤的自然弹性。这款华贵的不含皂机的新一代智慧女人洁面乳含有独特的天然的肌肤再生因子。给肌肤完全的清爽，柔软，平滑，使皮肤看起来容光焕发。\r\n\r\n适用人群：适合40岁以上成熟女性\r\n\r\n适合肤质：任何皮肤','',0,0,0,0,0,'2012-03-01 16:04:36','2012-03-01 16:04:36',3,0);
INSERT INTO `goods_real` VALUES (318,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺复刻版百香果洁面凝胶(83601)','http://photo.no5.com.cn/product/mphoto/20100416175721991500241.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100416175721991500241.jpg\";}',78,'http://www.no5.com.cn/goods/21105.html','21105',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','纯天然百香果萃取,（百香果原产国巴西南部），这种天然水果是极其滋润保湿！\r\n洗后肌肤清爽柔嫩、滋润不干涩，并散发淡雅的散发热情果香味。\r\n百香果系列蕴含天然百香果籽油，带来清爽的滋润。  使用方法：早晚润湿手脸后，取适量于手心上，轻柔的用打圈方式按摩于全脸，再以温水清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:37','2012-03-01 16:04:37',3,0);
INSERT INTO `goods_real` VALUES (319,1,0,0,'The body shop 美体小铺','护肤','The body shop 美体小铺有机营养洁面泡沫(89501)','http://photo.no5.com.cn/product/mphoto/21106_M_120227100845_35350624.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/21106_M_120227100845_35350624.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/21106_M_120227100903_99367957.jpg\";}',105,'http://www.no5.com.cn/goods/21106.html','21106',0,'干性,油性,混合性,中性,敏感性','','','','泡沫洁面摩丝，轻轻去除面部油污和残妆。使肌肤柔软，恢复弹力，给你一个清新干爽，清洁的感觉。\r\n产品的气味是清香的植物味道，有点淡淡的中草药味。使用方法：早晚卸妆后，取适量于手心上，轻柔的用打圈方式按摩于全脸，再以厮清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:38','2012-03-01 16:04:38',3,0);
INSERT INTO `goods_real` VALUES (320,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP水蜜桃泡沫洗面奶(01068)','http://photo.no5.com.cn/product/mphoto/20100421103743802394895.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100421103743802394895.jpg\";}',33,'http://www.no5.com.cn/goods/21130.html','21130',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含有丰富有机酸、氨基酸（amino）丰富的水蜜桃萃取物以及9种herb成分，嫩滑肌肤的温和性洁面乳。泡沫丰富细腻，100％植物性吸取洗净成份，能深入毛穴，去除污垢及黑头，并能清除肌肤表层各种彩妆，让肌肤“呼吸”顺畅，促进肌肤正常血液循环。蜜桃之保湿精华，为肌肤提供深层滋润，同时可舒缓肌肤。洗面后，肌肤感到清爽舒适。使用方法：\r\n取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净。','',0,0,0,0,0,'2012-03-01 16:04:39','2012-03-01 16:04:39',3,0);
INSERT INTO `goods_real` VALUES (321,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP纯天然木炭去黑头洗面奶(00694)','http://photo.no5.com.cn/product/mphoto/20100421103537802394895.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100421103537802394895.jpg\";}',45,'http://www.no5.com.cn/goods/21131.html','21131',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','经过精细加工含特制天然木炭成份,具有强力吸附作用，能够有效的去除脸上的油脂，换您一张清透的脸庞．其蕴涵的矿物质成分，能强化皮肤的保湿能力，给予皮肤活力。具有美白,滋养,去黑头的多重功效。含特制天然木炭成份，具有去除面部化妆残渍有害物质、强化吸附皮脂的功效，其含有大量的矿物质，调节保湿能力显著，抗菌解毒作用优秀，还具有出色的美白效果，能强化皮肤的保湿能力，给予皮肤活力。\r\n使用方法：\r\n取适量于手心，加水轻轻打起泡沫，用于面部，洗后清水冲净，再次用冷水轻拍冲净。','',0,0,0,0,0,'2012-03-01 16:04:40','2012-03-01 16:04:40',3,0);
INSERT INTO `goods_real` VALUES (322,1,0,0,'SKIN FOOD 思亲肤','护肤','SKIN FOOD卡布奇诺洗面奶(10793)','http://photo.no5.com.cn/product/mphoto/20100420144602625460024.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100420144602625460024.jpg\";}',62,'http://www.no5.com.cn/goods/21250.html','21250',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','咖啡内含有丰富的咖啡酸，可帮助肌肤变得光滑细致，也能提高肌肤的弹力，同时可温和的去除老旧角质及彻底洗净的效果。让脸部曲线变得更加美丽动人。   使用方法：取适量沾点水搓成泡沫，涂于脸上轻揉按摩，再以温水冲干净。','',0,0,0,0,0,'2012-03-01 16:04:40','2012-03-01 16:04:40',3,0);
INSERT INTO `goods_real` VALUES (323,1,0,0,'MISS FACE','护肤','MISS FACE 豆乳雪肌美白洗面奶','http://photo.no5.com.cn/product/mphoto/20100428151226967320875.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428151226967320875.jpg\";}',29,'http://www.no5.com.cn/goods/21349.html','21349',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','研磨大豆制成的豆乳中所富含的”大豆异黄酮素”是女性朋友的伙伴。使用豆乳洗面奶洗脸，产生大量的泡沫。温和不紧绷．有效清除毛孔内的残留物．畅通毛孔。充分滋养，促使美白成分高效吸收，改善粗糙的肌肤，使皮肤富有弹性．光泽亮白。  <?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" />&nbsp;  主要成分：去离子水、甘油、豆乳发酵液．大豆精华、4Na、十二酸、珠光片、KOH、DMDMH、透明质酸钠。  &nbsp;  使用方法：取适量(卸妆时2～3CM，洗脸时1CM左右)放入手中，加水揉搓气泡后涂抹全脸,揉搓后，用清水或温水分清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:41','2012-03-01 16:04:41',3,0);
INSERT INTO `goods_real` VALUES (324,1,0,0,'MISS FACE','护肤','MISS FACE 豆乳清爽控油洗面奶','http://photo.no5.com.cn/product/mphoto/20100428151759967320875.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428151759967320875.jpg\";}',32,'http://www.no5.com.cn/goods/21355.html','21355',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','研磨大豆制成的豆乳中所富含的”大豆异黄酮素”是女性朋友的伙伴。清洁同时帮助肌肤表层细胞更新，平衡油脂分泌。其丰富细腻的泡沫能完美贴合肌肤．有效清除沉积在毛孔和肌肤纹理的油垢物质．回复肌肤新鲜本质。主要成分：去离子水、甘油、豆乳发酵液．大豆精华、4Na、十二酸、珠光片、KOH、DMDMH、透明质酸钠。使用方法:\r\n取适量(卸妆时2～3CM，洗脸时1CM左右)放入手中，加水揉搓气泡后涂抹全脸,揉搓后，用清水或温水分清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:42','2012-03-01 16:04:42',3,0);
INSERT INTO `goods_real` VALUES (325,1,0,0,'MISS FACE','护肤','MISS FACE 透明质酸水感净白莹采洗面奶','http://photo.no5.com.cn/product/mphoto/20100428152736967320875.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428152736967320875.jpg\";}',42,'http://www.no5.com.cn/goods/21370.html','21370',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','内含透明质酸及多种草本维他命精华，它能深入肌肤，增强皮肤的柔软度和强韧性，保湿润滑肌肤。能够在美白滋养的同时，温和去除老化角质和深层污垢，从而使肌肤焕发洁净新鲜的水嫩透白。  <?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" />&nbsp;  主要成分：去离子水、甘油、珠光片、M68、4Na、十二酸、十四酸，十六酸，珠光片、KOH、DMDMH、透明质酸钠。  &nbsp;  使用方法:取适量(卸妆时2～3CM，洗脸时1CM左右)放入手中，加水揉搓气泡后涂抹全脸,揉搓后，用清水或温水分清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:42','2012-03-01 16:04:42',3,0);
INSERT INTO `goods_real` VALUES (326,1,0,0,'MISS FACE','护肤','MISS FACE 透明质酸完美盈润滋养洗面奶','http://photo.no5.com.cn/product/mphoto/20100428152836967325510.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428152836967325510.jpg\";}',42,'http://www.no5.com.cn/goods/21372.html','21372',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','含有维他命E和透明质酸柔润因子配方，令肌肤享受天然滋润，锁住肌肤的自然水分，感觉柔嫩细滑。丰富的泡沫，可温和洗净肌肤内层的杂质，令肌肤全天盈润有弹性。\r\n  主要成分：去离子水、甘油、珠光片、M68、4Na、十二酸、十四酸，十六酸，珠光片、KOH、DMDMH、透明质酸钠。\r\n  使用方法：取适量(卸妆时2～3CM，洗脸时1CM左右)放入手中，加水揉搓气泡后涂抹全脸,揉搓后，用清水或温水分清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:43','2012-03-01 16:04:43',3,0);
INSERT INTO `goods_real` VALUES (327,1,0,0,'其他护肤品牌','护肤','比度克 抗痘控油洁面膏','http://photo.no5.com.cn/product/mphoto/20100428142515967305208.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100428142515967305208.jpg\";}',35,'http://www.no5.com.cn/goods/21386.html','21386',0,'','','','','彻底清洁毛孔中的油脂、污垢\r\n抑制细菌孳生，促进代谢平衡，令肌肤畅快呼吸\r\n清凉镇静，即刻舒缓疲惫肌肤&nbsp;\r\n用后肌肤清爽、光洁，焕发天然润泽<?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" />&nbsp;独特稠质膏体，泡沫细腻且丰富中油、混合性皮肤适用&nbsp;如何使用： 可每天使用。取适量加水搓揉出泡沫，轻柔、全面地按摩面部，然后彻底冲洗干净。 &nbsp;特别提示： 注意避免用过冷或过热的水。若不慎入眼，请用大量清水冲洗。','',0,0,0,0,0,'2012-03-01 16:04:44','2012-03-01 16:04:44',3,0);
INSERT INTO `goods_real` VALUES (328,1,0,0,'MISS FACE','护肤','MISS FACE 豆乳保水柔和洗面奶','http://photo.no5.com.cn/product/mphoto/21395_M_110304161531_78529640.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/21395_M_110304161531_78529640.jpg\";}',32,'http://www.no5.com.cn/goods/21395.html','21395',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','研磨大豆制成的豆乳中所富含的”大豆异黄酮素”是女性朋友的伙伴。丰富的泡沫，能温和细致地深层清洁肌肤、镇静舒缓肌肤，更新角质。帮助深层清洁肌肤的同时保持肌肤的自然水分，肌肤感觉柔润嫩滑．不紧绷。主要成分：去离子水、甘油、豆乳发酵液．大豆精华、4Na、十二酸、珠光片、KOH、DMDMH、透明质酸钠。使用方法:\r\n取适量(卸妆时2～3CM，洗脸时1CM左右)放入手中，加水揉搓气泡后涂抹全脸,揉搓后，用清水或温水分清洗干净即可。','',0,0,0,0,0,'2012-03-01 16:04:44','2012-03-01 16:04:44',3,0);
INSERT INTO `goods_real` VALUES (329,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯中性洗面乳(2#配方)','http://photo.no5.com.cn/product/mphoto/2007121010288577880233.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007121010288577880233.jpg\";}',76,'http://www.no5.com.cn/goods/14403.html','14403',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','适合肤质： 中性皮肤、混合性皮肤 玫琳凯中性洗面乳(2#配方)溶解并温和去除面部彩妆残留及污垢，肤感舒适，经常使用，能使皮肤愈发显得美丽健康、清新舒爽。作为肌肤日常护理的主要清洁步骤：洁面乳能清洁脸部，去除彩妆和污垢，令肌肤恢复清新，水分平衡状况得到改善，同时也为肌肤在之后的护理过程中吸收营养做好准备。 \r\n&nbsp;\r\n主要成分： 榉树芽胚提取物、聚二甲基硅氧烷、薰衣草提取物使用方法：\r\n(1) 用指腹顺着真皮纤维质的自然纹路，由下往上、有内往外轻揉，细柔的眼圈部位则以无名指运作，温和的按摩有助清洁效果\r\n(2) 用温的湿毛巾擦净，也可用清水冲净','',0,0,0,0,0,'2012-03-01 16:04:45','2012-03-01 16:04:45',3,0);
INSERT INTO `goods_real` VALUES (330,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯柔性洗面霜(1#配方)','http://photo.no5.com.cn/product/mphoto/200712261145340364314.jpg','a:1:{i:0;s:64:\"http://photo.no5.com.cn/product/mphoto/200712261145340364314.jpg\";}',77,'http://www.no5.com.cn/goods/14554.html','14554',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','经过皮肤过敏性及刺激性临床试验。干性皮肤适用。\r\n作为肌肤日常护理的主要清洁步骤，本产品能温和去除面部彩妆残留及污垢，肤感舒适，清洁后皮肤不干燥，不紧绷，并能帮助调理皮肤，使皮肤感觉洁净柔软，配方中包含木槿花和其他多种的提取物。','',0,0,0,0,0,'2012-03-01 16:04:45','2012-03-01 16:04:45',3,0);
INSERT INTO `goods_real` VALUES (331,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯深层清洁乳(3#配方)','http://photo.no5.com.cn/product/mphoto/2007122611473440364314.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007122611473440364314.jpg\";}',78,'http://www.no5.com.cn/goods/14557.html','14557',0,'油性','','','','经过皮肤过敏性及刺激性临床试验。油性皮肤适用。\r\n作为肌肤日常护理的主要清洁步骤，本产品能深层，彻底清洁肌肤，同时仍能继续保留肌肤的必要油脂及天然保湿成分。凝胶配方，独有肌肤调理和平衡功效，肌感清爽洁净。配方中包含温和天然收敛成分--榛子提取物。  注意事项：使用时请避免进入眼睛。如有不慎渗入眼内，应以清水彻底清洗。','',0,0,0,0,0,'2012-03-01 16:04:46','2012-03-01 16:04:46',3,0);
INSERT INTO `goods_real` VALUES (332,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯幻时系列三合一洁面乳(中性至干性肌肤)','http://photo.no5.com.cn/product/mphoto/2007127152711009040249.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007127152711009040249.jpg\";}',215,'http://www.no5.com.cn/goods/14836.html','14836',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','【主要功效】\r\n1 、洁肤、去角质、爽肤三合一。温和地清除面部污垢，防止皮肤老化，保持肌肤年轻。\r\n2 、独有的专利配方可帮助减少细纹。\r\n3 、含维生素A棕榈酸脂，可紧致肌肤。 \r\n4 、具有维生素E的抗氧化功能。\r\n5 、含有植物性爽肤成分。\r\n6 、包含可光滑肌肤的颗粒；蓝色颗粒蕴含维生素A和E，可溶解在肌肤上；绿色颗粒可帮助去除老化角质。\r\n7 、温和配方，可每天使用。  【主要成分】\r\n含维生素及植物精华的专利配方，淡化细纹。\r\n1、 维他命A棕榈酸脂--促使胶原质增生，紧致肌肤。\r\n2、 兰色微粒含维他命A、E衍生物--抗氧化。\r\n3 、含维生素及植物精华的专利复合物--减少细纹。\r\n4 、黄瓜、柠檬萃取液--爽肤。\r\n5 、绿色微粒--去角质。\r\n特性：洁肤、爽肤、去角质三效合一，程序简洁，使用方便。\r\n&nbsp;\r\n&nbsp;【使用方法】\r\n1 、每天早晚轻轻以朝上和朝外的方式清洗脸部和颈部。\r\n2 、在以清水或温湿毛巾洗去。\r\n3 、接着使用抗皱保湿乳。','',0,0,0,0,0,'2012-03-01 16:04:47','2012-03-01 16:04:47',3,0);
INSERT INTO `goods_real` VALUES (333,1,0,0,'Mary Kay 玫琳凯','护肤','Mary Kay 玫琳凯幻时系列三合一洁面乳(混合性至油性肌肤)','http://photo.no5.com.cn/product/mphoto/20071271527591009040249.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071271527591009040249.jpg\";}',215,'http://www.no5.com.cn/goods/14837.html','14837',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','【主要功效】\r\n1 、洁肤、去角质、爽肤三合一。温和地清除面部污垢，防止皮肤老化，保持肌肤年轻。\r\n2 、独有的专利配方可帮助减少细纹。\r\n3 、含维生素A棕榈酸脂，可紧致肌肤。 \r\n4 、具有维生素E的抗氧化功能。\r\n5 、含有植物性爽肤成分。\r\n6 、包含可光滑肌肤的颗粒；蓝色颗粒蕴含维生素A和E，可溶解在肌肤上；绿色颗粒可帮助去除老化角质。\r\n7 、温和配方，可每天使用。  【主要成分】\r\n含维生素及植物精华的专利配方，淡化细纹。\r\n1、 维他命A棕榈酸脂--促使胶原质增生，紧致肌肤。\r\n2、 兰色微粒含维他命A、E衍生物--抗氧化。\r\n3 、含维生素及植物精华的专利复合物--减少细纹。\r\n4 、黄瓜、柠檬萃取液--爽肤。\r\n5 、绿色微粒--去角质。\r\n特性：洁肤、爽肤、去角质三效合一，程序简洁，使用方便。\r\n&nbsp;\r\n&nbsp;【使用方法】\r\n1 、每天早晚轻轻以朝上和朝外的方式清洗脸部和颈部。\r\n2 、在以清水或温湿毛巾洗去。\r\n3 、接着使用抗皱保湿乳。  &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:47','2012-03-01 16:04:47',3,0);
INSERT INTO `goods_real` VALUES (334,1,0,0,'Kose 高丝','明星推荐','Kose 高丝超绵密净白保湿洗颜洁面泡泡(女人我最大推荐)','http://photo.no5.com.cn/product/mphoto/20071214172944259477128.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071214172944259477128.jpg\";}',55,'http://www.no5.com.cn/goods/15205.html','15205',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','特殊的5大草本精华更能同时赋予肌肤弹性、深层保湿，光洗脸就可以洗出光透美肌清爽的淡淡花香，更让充分享受在洗颜洁净的乐趣之中喔！特别添加五种天然植物配方：\r\n松树精华-促进肌肤更新\r\n迷迭香精华-可促进循环，具抗氧化作用，有效预防肌龄渐长的问题\r\n柠檬精华-富含维他命C，温和去除老废角质\r\n蛇麻草精华-具有收敛安抚功效；杉菜精华-使肌肤饱满有弹性使用方式：\r\n轻轻按压，取适量于手心中，按摩于脸部肌肤，\r\n再以清水冲洗干净即可。注意事项：\r\n小心！！ 使用洗面奶洁颜时，若起泡不完全可是超级伤害肌肤的喔！！','',0,0,0,0,0,'2012-03-01 16:04:48','2012-03-01 16:04:48',3,0);
INSERT INTO `goods_real` VALUES (335,1,0,0,'Fancl 无添加','护肤','[Fancl 无添加]保湿洁面粉(滋润型)','http://photo.no5.com.cn/product/mphoto/20090420133824464184631.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20090420133824464184631.jpg\";}',139,'http://www.no5.com.cn/goods/15427.html','15427',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','优质氨基酸系洁净成分，能选择性地洗去污垢及多余油脂，保留肌肤所需的水分及油分，形成保湿层，让不同性质的肌肤在洁面后都能回复健康状态。粉末幼细，以空气加水就能起出丰富细密的泡沫，发挥“垫子”功效，深入洁净毛孔之余，减少摩擦肌肤。不含SLS，SLES，洁面后在肌肤表面形成保湿层，有效提升肌肤吸收机能，让其后涂抹的美容成分更均匀渗透，发挥更佳护肤效果。 \r\n&nbsp;\r\n配合成分： 氨基酸系洁净成分、氨基酸 \r\n\r\n使用方法： \r\n1．清洁双手后将起泡海绵浸满水。 \r\n2．将约一茶匙份量（按压瓶身两下）的洁面粉均匀倒于海绵上。 \r\n3．加水在海绵上并慢慢将海绵搓起泡沫。 \r\n4．用手将泡沫轻轻揉擦面部以清除污垢，再用温水清洗便可。 \r\n5．亦可配合 \"洁面朴\" 使用，可帮助去除死皮，令肌肤更加洁净。 &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:49','2012-03-01 16:04:49',3,0);
INSERT INTO `goods_real` VALUES (336,1,0,0,'Miss Vivi 薇薇小姐','护肤','Miss Vivi莹润嫩白泡沫洁面乳','http://photo.no5.com.cn/product/mphoto/2007101214531838300128.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2007101214531838300128.jpg\";}',98,'http://www.no5.com.cn/goods/15474.html','15474',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','miss vivi这款洗面略带酸性，可以中和水的微碱性，通俗一点来说，可以将“硬水”软化，其中含有的丝兰等植物成分，是天然的水质软化剂，而丝兰本身就是用于抵抗一些污染的、情况严重的水质问题。 由于miss vivi的每一款产品中，均含有可食用珍珠粉成分，这种珍珠粉颗粒细，容易吸收，因此miss vivi产品的美白效果都相当不错。此外，珍珠粉的修复能力也是非常强的，对于去除痘印，痘疤，色素沉淀效果尤其好。使用这款洁面，在不知不觉中，皮肤会一天天透出珍珠般的白皙无暇哦~~~ ；由于该洁面的植物配方呈微酸性，能彻底中和微碱性的硬水，略带微酸性的植物水对收缩毛孔的效果十分显着，可以让毛孔细致、柔软，毛孔细致拉，黑头就无处可逃了，慢慢的，鼻子上的黑头一天比一天减少拉，有一天你终于可以欢呼――草莓鼻不见拉~~ ；有的美女担心太温和的配方，是否会洗的不干净呢，相反，这款洁面含有独特的清洁渗透因子，洁净力很强，放心使用哦，不但可以洗净，连毛孔里面的每一个脏东西都不会放过呢~~ 由于清洁成分天然温和，并且含有帮助形成皮肤水质膜的锁水保湿因子，可以让皮肤洗后更加滋润，舒缓！！   这是一款可以脱离爽肤水的洁面哦~~也就是说，用完这款洁面，甚至无需再用爽肤水了，因为该洁面所独有的锁水因子，可以将水份很好的锁住，让你的脸洁净无瑕的同时，依然水嫩滋润，一点都不会嫌干拉，所以即使秋冬洗完脸后，都感到水嫩嫩的呢。','',0,0,0,0,0,'2012-03-01 16:04:50','2012-03-01 16:04:50',3,0);
INSERT INTO `goods_real` VALUES (337,1,0,0,'Shiseido 资生堂','护肤','Shiseido 资生堂导入式美白洗面膏(37436)','http://photo.no5.com.cn/product/mphoto/20100925121112665816690.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100925121112665816690.jpg\";}',99,'http://www.no5.com.cn/goods/15523.html','15523',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','连含有黑色素的老废角质都一并清除\r\n内含细微白泡颗粒,能产生丰富绵密的泡沫，彻底洗净脸部脏污，并含资生堂独家研发专利保湿导入成分，持续保湿肌肤，呈现白晰透亮的好肤质。  有效去除令肌肤暗沉的老化角质及污垢，温和洁净肌肤的洁面膏\r\n1、洁净颗粒-柔和的泡沫和洁净颗粒能温和去除含黑色素的老化角质\r\n2、容易打出细腻绵密、丰富柔和的泡沫\r\n3、彻底去除深嵌于毛孔的多余皮脂\r\n4、含亲水渗透成分Aqua synergy、透明质酸、胶原蛋白，给予肌肤滋润\r\n5、在洁净肌肤的同时，能预防粉刺及肌肤粗糙\r\n6、无香料、无着色、经过防过敏性测试  添加玻尿酸保湿配，方针对脸部特别干燥的部位，有迅速导入皮肤深层，补充水份的作用；添加维他命C诱导体，让使用后的皮肤更加透亮白哦；添加胶原蛋白，让皮肤更健康有弹力，肌肤不留岁月痕迹~让您肌肤看起来更有活力唷。  （Auqa Synergy成份：为了使有效成份迅速、有效地深层渗透肌肤，资生堂独自开发研究的一种保湿成份。在AUQALABEL系列产品中均有使用）    &nbsp;','',0,0,0,0,0,'2012-03-01 16:04:50','2012-03-01 16:04:50',3,0);
INSERT INTO `goods_real` VALUES (338,1,0,0,'Kose 高丝','护肤','Kose 高丝纯肌粹洗面膏(20366)','http://photo.no5.com.cn/product/mphoto/200710261048331047357115.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200710261048331047357115.jpg\";}',135,'http://www.no5.com.cn/goods/15614.html','15614',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','丰富而轻盈的泡沫能温和洗去老化角质、过剩皮脂和残留在毛孔深部的污垢，清洁毛孔中的黑色物质，防止黑头的形成。配合有奇妙的[汉方精粹之水]（纯肌粹系列全品配合），缔造健康清净肌肤的洗颜霜。洗颜后能保持肌肤的润泽与柔滑。对肌肤干燥、日晒及雪反射造成的肌肤泛红具有舒缓作用。散发着汉方植物的清爽气息','',0,0,0,0,0,'2012-03-01 16:04:51','2012-03-01 16:04:51',3,0);
INSERT INTO `goods_real` VALUES (339,1,0,0,'Guerlain 娇兰','护肤','Guerlain 娇兰伊诗美鲜花精华泡沫洁面霜(60301)','http://photo.no5.com.cn/product/mphoto/200710261024171047357115.jpg','a:1:{i:0;s:67:\"http://photo.no5.com.cn/product/mphoto/200710261024171047357115.jpg\";}',265,'http://www.no5.com.cn/goods/15616.html','15616',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','神奇的质地，是清爽的泡沫，也是丰润的洁面霜。\r\n轻柔细致的泡沫慕丝能够彻底洁净肌肤，遇水后形成滑润的乳霜，温和地清洁面部。冲净后的肌肤嫩白净、光滑剔透。\r\n使用方法：每日早/晚将泡沫洁面霜涂在干净或打湿的面部，以指腹轻轻按摩肌肤表面，再以温水冲净。&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:52','2012-03-01 16:04:52',3,0);
INSERT INTO `goods_real` VALUES (340,1,0,0,'日本JuJu','护肤','JuJu AQUAMOIST透明质酸美肌保湿泡沫洗颜慕丝(60124)','http://photo.no5.com.cn/product/mphoto/15797_M_110524114730_36203438.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/15797_M_110524114730_36203438.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/15797_M_110524114802_32491432.jpg\";}',79,'http://www.no5.com.cn/goods/15797.html','15797',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','《新一代AQUAMOIST美肌保湿系列》新包装、新配方，保水力UP！两倍的玻尿酸高保湿因子配合，最完美的美肌阵容！「新AQUAMOIST玻尿酸美肌保湿泡沫洗颜慕丝」，双倍玻尿酸高保湿因子配合，浓厚细腻的泡沫，深入毛穴带走脏污、保湿滋润，肌肤深呼吸～滋润、弹力光泽、紧致。\r\n＊适用于干燥肌、普通肌、混合肌、油性肌以及敏感肌。\r\n＊利用乳酸菌球发酵法制成，整理肌肤、浸透保湿滋润，洗完脸也能有好肌肤。\r\n＊弱酸性、无香料、无着色，温和不刺激肌肤。\r\n＊无矿物油，肌肤水灵柔嫩、不黏腻。使用方式：\r\n1、将白色阻隔器取出之后，按压适量于化妆棉上\r\n2、按压数次于手中，轻轻按摩于全脸之后，再以清水冲洗干净即可。注意事项：\r\n1、请置于幼儿无法取得处。\r\n2、眼睛周围、黏膜等部位请勿使用。\r\n3、如有伤口或是红肿发脓或裂伤的地方请勿使用。\r\n4、万一进入眼睛时不要揉眼睛，请用清水冲洗眼部，如有不适请尽速就医治疗。\r\n5、为了避免误食并保持质量的关系，请不要跟其它容器交换。\r\n6、使用中如有发疹、发红、痒、刺激、痛、热或脱皮等现象时请暂停使用，如暂停使用后仍未好转请停止使用，并询问药剂师或医生。','',0,0,0,0,0,'2012-03-01 16:04:52','2012-03-01 16:04:52',3,0);
INSERT INTO `goods_real` VALUES (341,1,0,0,'LA roche-posay 理肤泉','护肤','LA roche-posay 理肤泉特安洁面泡沫','http://photo.no5.com.cn/product/mphoto/20071128143833490429024.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20071128143833490429024.jpg\";}',160,'http://www.no5.com.cn/goods/15877.html','15877',0,'','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','法国LA ROCHE-POSAY理肤泉的TOLERIANE特安系列的面部清洁产品又添新成员--理肤泉特安洁面泡沫Toleriane foaming cream，专为中性至油性肤质、有敏感问题的皮肤设计，极精简的配方：百分百理肤泉温泉水，不含香料，不含防腐剂，不含羊毛脂，不含酒精，具有极高的安全性。同时，理肤泉特安洁面泡沫能有效去除多余油脂，深层清洁、净化肌肤，还可温和卸除淡妆。质地柔滑细腻、不干燥，且泡沫丰富，是有敏感问题的皮肤日常洁肤的理想选择，能有效保护敏感或耐受性差的皮肤，泡沫丰富，柔软细腻。','',0,0,0,0,0,'2012-03-01 16:04:53','2012-03-01 16:04:53',3,0);
INSERT INTO `goods_real` VALUES (342,1,0,0,'其他护肤品牌','护肤','Silk Rou II诗柔胺基酸活肤洗面奶','http://photo.no5.com.cn/product/mphoto/200822105520389081912.jpg','a:1:{i:0;s:64:\"http://photo.no5.com.cn/product/mphoto/200822105520389081912.jpg\";}',98,'http://www.no5.com.cn/goods/16426.html','16426',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','清洁不当易堵塞毛孔，影响肌肤呼吸产生黑头、粉刺，加速肌肤老化，也影响产品的吸收，从而降低效果。清洁品所含的接口活性剂也为重要，如果是普通的接口活性剂会给肌肤带来不同程度的伤害，有损肌肤细胞。所以选择好的清洁品尤为重要，诗柔采用氨基酸做为接口，温和、刺激性低。\r\n\r\n含天然保湿因子“胺基酸”的洗面奶，其独特酸碱值（PH）5.5符合健康肌肤的弱酸性，最适合人体的皮肤，绝佳的洗净力彻底带走肌肤深层的污垢，还你清新自然。\r\n\r\n作用：温和清洁、保湿、美白、修护。\r\n\r\n特点：选用了最好的接口活性剂――氨基酸做为清洁成分，避免了普通接口活性剂对肌肤细胞的伤害，减少细胞的死亡率，预防皮肤粗糙。  使用方法：早晚取适量胺基酸活肤洗面奶均匀涂于面部及颈部，按照肌肉纹理轻轻打圈，然后用清水清洗干净即可。  适用：任何肤质及年龄。','',0,0,0,0,0,'2012-03-01 16:04:54','2012-03-01 16:04:54',3,0);
INSERT INTO `goods_real` VALUES (343,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP草莓去角质洗面奶(02337)','http://photo.no5.com.cn/product/mphoto/16526_M_110328155610_10197426.jpg','a:2:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/16526_M_110328155610_10197426.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/16526_M_110328155626_37926918.jpg\";}',49,'http://www.no5.com.cn/goods/16526.html','16526',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','草莓中萃取的丰富维它命，具有焕肤的功效，抑制黑色素细胞的活动。促进血液循环，排除肌肤组织中的毒素。天然水科学配方，可持续释放保湿成份，解除皮肤干燥现象。100% 全天然植物配方，泡沫丰富细腻，温和清洁。有效清除面部多余的油脂及污物，温和清洁老化角质及毛孔内的污垢，舒适不紧绷，保持肌肤一整天的湿润嫩滑。提取草莓中的丰富维它命、维生素C，并添加Phylolex成分，供给肌肤所必需的乳酸素，延缓皮肤老化，从而使缺少维生素C而失去光泽、变得粗糙的皮肤渐渐变回通透嫩白。使用方法：\r\n用温水湿润脸部，取本品适量于掌中，揉出充分泡沫后，圆形按摩状搽抹于脸部，然后冲洗干净。','',0,0,0,0,0,'2012-03-01 16:04:54','2012-03-01 16:04:54',3,0);
INSERT INTO `goods_real` VALUES (344,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP速洁毛孔洗面奶(00723)','http://photo.no5.com.cn/product/mphoto/20100105155141329007166.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100105155141329007166.jpg\";}',52,'http://www.no5.com.cn/goods/16531.html','16531',0,'','','','','快速洁净皮肤，控制油份补充充足水份。同时清洁毛孔内深层污垢，快速改善毛孔扩张。彻底清除毛孔深处的油垢、尘垢、老化角质及彩妆，预防粉刺和暗疮的发生。针对粗大的毛孔有神奇的效果，天然植物成分，绝对不含酒精，含有清爽性凉的植物萃取物，如甘草、绿茶、柠檬等，性质非常温和，无刺激性，无油，是帮助油腻皮肤度过夏天的绝好产品。功效：\r\n1、不含有其它添加剂，快速洁净皮肤，控制油份补充充足水份。\r\n2、同时清洁毛空内深层污垢，快速改善毛孔扩张。\r\n3、最适合怕油长痘皮肤。适合易出油皮肤和问题皮肤（易生痘痘、粉刺）。','',0,0,0,0,0,'2012-03-01 16:04:55','2012-03-01 16:04:55',3,0);
INSERT INTO `goods_real` VALUES (345,1,0,0,'Estee Lauder 雅诗兰黛','护肤','Estee Lauder雅诗兰黛全新密集焕白洁肤乳(WHYL)','http://photo.no5.com.cn/product/mphoto/16919_M_110429132730_32507912.jpg','a:3:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/16919_M_110429132730_32507912.jpg\";i:1;s:72:\"http://photo.no5.com.cn/product/mphoto/16919_M_110429132747_84253517.jpg\";i:2;s:72:\"http://photo.no5.com.cn/product/mphoto/16919_M_110429132802_59924293.jpg\";}',298,'http://www.no5.com.cn/goods/16919.html','16919',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','融入独创的Full Spectrum 光谱祛黄复合科技，解决导致肌肤暗黄和肤色不均的四种主要因素。帮助显现更清新、白皙、明亮的肌肤，传递全面美白效果，点亮每一寸肌肤，还原肌肤的美丽透明，由内而外焕发光彩。&nbsp; 使用方法：\r\n早晚使用。先用水湿润脸部，挤出适量于掌心，加水揉搓至起泡后，轻轻揉洗脸部，再以清水洗净即可。','',0,0,0,0,0,'2012-03-01 16:04:56','2012-03-01 16:04:56',3,0);
INSERT INTO `goods_real` VALUES (346,1,0,0,'Dior 迪奥','护肤','Dior迪奥雪晶灵焕白亮采洁面泡沫(93878)','http://photo.no5.com.cn/product/mphoto/20100630135350303842065.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100630135350303842065.jpg\";}',298,'http://www.no5.com.cn/goods/16987.html','16987',0,'干性,油性,混合性,中性,敏感性','','','','DIOR科技美妍中心将美白保养带入新的领域。持续观察肌肤斑点的形成，再加长达15年针对亚洲肤质的研究经验，DiorSnow SUBILSSIME 再次成为美白保养界得先锋。DiorSnow SUBILSSIME 在对抗黑色素的专利科技中，融入了新的美白方法。在迪奥的配方中前所未有的，将改善肌肤基底膜品质纳入考虑。让受困于肌肤深处的黑色素得以释放，进而淡化。DiorSnow SUBILSSIME挑战最先进科技，让肌肤无暇、净白，比以前更均匀、更美丽。  丰富柔润的洁面泡沫，彻底净除肌肤污垢与杂质，洗后肤色白皙明亮，远离干燥紧绷。  用法：早晚在湿润的脸上揉成泡沫，以轻柔的打圈动作按摩，再以清水彻底洗净，然后拍上化妆水。','',0,0,0,0,0,'2012-03-01 16:04:57','2012-03-01 16:04:57',3,0);
INSERT INTO `goods_real` VALUES (347,1,0,0,'THE FACE SHOP 菲诗小铺','护肤','THE FACE SHOP黑竹深层清洁去角质洗面乳(押嘴02111)','http://photo.no5.com.cn/product/mphoto/17026_M_110328155422_48563057.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/17026_M_110328155422_48563057.jpg\";}',55,'http://www.no5.com.cn/goods/17026.html','17026',0,'干性,油性,混合性,中性,敏感性','','','','细腻丰富的泡沫亦可彻底卸除彩妆，轻柔去除角质。\r\n肌肤在洗净后不会感到油腻和紧绷，肌肤不再油腻\r\n深层清洁毛孔，长时间保持洁净嫩滑的肌肤触感。 使用方法：\r\n加以按摩充分洁净肌肤，然后以温水洗净。避免接触眼睛。','',0,0,0,0,0,'2012-03-01 16:04:58','2012-03-01 16:04:58',3,0);
INSERT INTO `goods_real` VALUES (348,1,0,0,'LOREAL 欧莱雅','护肤','LOREAL 欧莱雅活力紧致洁面膏(23216)','http://photo.no5.com.cn/product/mphoto/2008051317531710971973.jpg','a:1:{i:0;s:65:\"http://photo.no5.com.cn/product/mphoto/2008051317531710971973.jpg\";}',65,'http://www.no5.com.cn/goods/17161.html','17161',0,'干性,油性,混合性,中性,敏感性','','','','每日温和清洁肌肤,可立即卸除淡妆，彻底清洁肌肤同时去除脸上小瑕疵，使肌肤完美洁净。让肌肤准备好接下来的每日抗皱紧实保养。有效对抗岁月痕迹要从基础清洁做起，使肌肤处于吸收高效抗老成分的最佳状态。柔肤果酸BHA与保湿甘油Glycerin可有效改善肌肤表面的粗糙黯沉状况，回复年轻活力。超柔软乳霜状质地遇水即能形成丰盈泡沫，容易洗净，带给肌肤柔软舒适的感受。&nbsp;','',0,0,0,0,0,'2012-03-01 16:04:58','2012-03-01 16:04:58',3,0);
INSERT INTO `goods_real` VALUES (349,1,0,0,'AVON 雅芳','护肤','AVON雅芳新活再生洁面露','http://photo.no5.com.cn/product/mphoto/20100820085829738041447.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20100820085829738041447.jpg\";}',59,'http://www.no5.com.cn/goods/17222.html','17222',0,'干性,油性,混合性,中性,敏感性','','','','不但能温和洗去脸上污垢，而且能抢先一步活化细胞，给肌肤第一层的营养，就让肌肤就像做了深呼吸，神清气爽活力倍增！','',0,0,0,0,0,'2012-03-01 16:04:59','2012-03-01 16:04:59',3,0);
INSERT INTO `goods_real` VALUES (350,1,0,0,'AVON 雅芳','护肤','AVON雅芳新自然温和护肤系列-洁容霜','http://photo.no5.com.cn/product/mphoto/20080523155744816343826.jpg','a:1:{i:0;s:66:\"http://photo.no5.com.cn/product/mphoto/20080523155744816343826.jpg\";}',81,'http://www.no5.com.cn/goods/17232.html','17232',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','纯净温和疏果保养，打造透亮[水美人]  含有天然疏果与值物精华，天然成份润泽滋养肌肤，令肤色通透明亮。新添加优异湿因子，形成网状锁水膜高效锁水，长效保温补水，令肌肤水嫩盈润。蕴含天然洁肤成份，迅速有效清洁肌肤，润泽不干涩，温和不伤肌肤。  用法：先洗湿面部，取适量于掌心，加少许水揉至起泡，涂于面部，轻柔按摩片刻后用水洗净即可。','',0,0,0,0,0,'2012-03-01 16:05:00','2012-03-01 16:05:00',3,0);
INSERT INTO `goods_real` VALUES (351,1,0,0,'AVON 雅芳','护肤','AVON雅芳凝白泡沫洁面乳','http://photo.no5.com.cn/product/mphoto/17251_M_101126162040_83209816.jpg','a:1:{i:0;s:72:\"http://photo.no5.com.cn/product/mphoto/17251_M_101126162040_83209816.jpg\";}',55,'http://www.no5.com.cn/goods/17251.html','17251',0,'干性,油性,混合性,中性,敏感性','','','20岁以下,20-25岁,26-30岁,30-35岁,36-40岁,40岁以上','蕴含桉树精华、甘草萃取、绿茶、芦荟、石榴，小麦胚芽油等天然植物美白成分，能有效清除表皮污垢及老化角质，令肌肤清新洁净，柔滑不紧绷。','',0,0,0,0,0,'2012-03-01 16:05:00','2012-03-01 16:05:00',3,0);
/*!40000 ALTER TABLE `goods_real` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table image
#

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `Img_id` int(11) NOT NULL AUTO_INCREMENT,
  `Img_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `Img_MD5` varchar(32) DEFAULT NULL COMMENT '图片链接校验',
  `Img_width` int(11) NOT NULL DEFAULT '0' COMMENT '图片宽（像素）',
  `Img_height` int(11) NOT NULL DEFAULT '0' COMMENT '图片高度',
  `Img_size` bigint(20) NOT NULL DEFAULT '0' COMMENT '图片大小（byte）',
  `Img_type` int(2) DEFAULT NULL COMMENT '图片的使用类型（0-网上图片 1-编辑图片）',
  `creatTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`Img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table image
#

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (3,'http://192.168.14.24:8080/img/boy~ipad.png','xsz9TmD4sevMDmrUDHZ5Aw==',238,508,109599,1,'2012-03-02 10:48:42');
INSERT INTO `image` VALUES (4,'http://192.168.14.24:8080/img/girl~ipad.png','hZLz/X43o/5j7VpYXSzhQQ==',174,532,130357,1,'2012-03-02 10:48:42');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table keyword
#

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关键词ID',
  `keyword` varchar(32) NOT NULL COMMENT '关键词',
  `keyword_count` int(10) unsigned NOT NULL COMMENT '关键词计数',
  `keyword_rank` int(11) NOT NULL COMMENT '关键词的排序值，越大的优先级越高',
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索关键词，可以用于‘自动完成搜索词’或者‘提示你想搜的是’';

#
# Dumping data for table keyword
#

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table order
#

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `order_num` varchar(64) NOT NULL COMMENT '订单号',
  `address_id` int(10) unsigned NOT NULL COMMENT '地址ID',
  `postage` float unsigned NOT NULL COMMENT '邮费',
  `payment_type` enum('货到付款') NOT NULL COMMENT '付款方式',
  `deliver_type` enum('送货上门') NOT NULL COMMENT '送货方式',
  `deliver_time` enum('周一至周五','周六日及公共假日','时间不限') NOT NULL COMMENT '送货时间',
  `invoice` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要发票',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `finish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否收获',
  `provider_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `related_num` varchar(64) NOT NULL COMMENT '供应商的订单号',
  `handled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员是否处理',
  `handled_time` datetime NOT NULL COMMENT '管理员处理时间',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单';

#
# Dumping data for table order
#

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table order_goods
#

DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单中包含的商品';

#
# Dumping data for table order_goods
#

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table provider
#

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `provider_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `provider_name` varchar(32) NOT NULL COMMENT '供应商名称',
  `provider_thumb` varchar(64) NOT NULL COMMENT '供应商缩略图',
  `provider_description` text NOT NULL COMMENT '供应商简介',
  `provider_service` text NOT NULL COMMENT '供应商客服与售后信息',
  `provider_deliver` text NOT NULL COMMENT '供应商发货与运费信息',
  PRIMARY KEY (`provider_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table provider
#

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'no5','provider_thumb','http://www.no5.com.cn/','provider_service','provider_deliver');
INSERT INTO `provider` VALUES (2,'lafaso','provider_thumb','http://www.lafaso.com/','provider_service','provider_deliver');
INSERT INTO `provider` VALUES (3,'jumei','provider_thumb','http://mall.jumei.com/','provider_service','provider_deliver');
INSERT INTO `provider` VALUES (4,'360buy','provider_thumb','http://www.360buy.com/beauty.html','provider_service','provider_deliver');
INSERT INTO `provider` VALUES (5,'dangdang','provider_thumb','http://cosmetic.dangdang.com/','provider_service','provider_deliver');
INSERT INTO `provider` VALUES (6,'amazon','provider_thumb','http://www.amazon.cn/%E9%AB%98%E6%A1%A3%E5%8C%96%E5%A6%86%E5%93%81/b/ref=sa_menu_bty5?ie=UTF8&node=746776051','provider_service','provider_deliver');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table provider_locations
#

DROP TABLE IF EXISTS `provider_locations`;
CREATE TABLE `provider_locations` (
  `provider_id` int(11) NOT NULL COMMENT '供应商ID',
  `province` varchar(32) NOT NULL COMMENT '省',
  `city` varchar(32) NOT NULL COMMENT '市',
  `distric` varchar(32) NOT NULL COMMENT '区、县'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table provider_locations
#

LOCK TABLES `provider_locations` WRITE;
/*!40000 ALTER TABLE `provider_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_locations` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table question
#

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '问答ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `question_title` varchar(128) NOT NULL COMMENT '问答的标题',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '问答内容的类型，如0表示文字，1表示录音等',
  `question_content` text NOT NULL COMMENT '问答的内容，可以为文字或者录音的路径',
  `question_coin` int(10) unsigned NOT NULL COMMENT '问答的悬赏美币值',
  `question_coin_remain` int(10) unsigned NOT NULL COMMENT '该问答剩余的悬赏美币值',
  `question_rank` int(11) NOT NULL COMMENT '问答的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table question
#

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table question_comment
#

DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE `question_comment` (
  `question_id` int(10) unsigned NOT NULL COMMENT '问答ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(4) NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '该回答获得的悬赏美币值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table question_comment
#

LOCK TABLES `question_comment` WRITE;
/*!40000 ALTER TABLE `question_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table report
#

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '测评ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `report_tags` text NOT NULL COMMENT '测评标签',
  `report_images` text NOT NULL COMMENT '测评图片',
  `report_title` varchar(64) NOT NULL COMMENT '测评标题',
  `content_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '测评内容类型，如0表示文字，1表示录音等',
  `report_content` text NOT NULL COMMENT '测评内容，可以为文字或者录音文件的路径',
  `report_rank` int(11) NOT NULL COMMENT '测评的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table report
#

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table report_comment
#

DROP TABLE IF EXISTS `report_comment`;
CREATE TABLE `report_comment` (
  `report_id` int(10) unsigned NOT NULL COMMENT '测评ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测评的评论';

#
# Dumping data for table report_comment
#

LOCK TABLES `report_comment` WRITE;
/*!40000 ALTER TABLE `report_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table report_goods
#

DROP TABLE IF EXISTS `report_goods`;
CREATE TABLE `report_goods` (
  `report_id` int(10) unsigned NOT NULL COMMENT '测评ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_score` float unsigned NOT NULL COMMENT '商品评分'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测评包含的商品，单独列一个表的原因是：1.一个测评可能涉及多个商品，2.可能根据商品搜索测评';

#
# Dumping data for table report_goods
#

LOCK TABLES `report_goods` WRITE;
/*!40000 ALTER TABLE `report_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_goods` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table shopping_cart
#

DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '商品的数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table shopping_cart
#

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table show
#

DROP TABLE IF EXISTS `show`;
CREATE TABLE `show` (
  `show_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'show ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `show_type` tinyint(3) unsigned NOT NULL COMMENT 'show的类型，如0表示彩妆show，1表示护肤show等',
  `show_tags` text NOT NULL COMMENT 'show的标签',
  `show_images` text NOT NULL COMMENT 'show的图片',
  `show_title` varchar(64) NOT NULL COMMENT 'show的标题',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT 'show内容的类型，如0表示文字，1表示录音等',
  `show_content` text NOT NULL COMMENT 'show的内容',
  `show_rank` int(11) NOT NULL COMMENT 'show的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`show_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table show
#

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table show_comment
#

DROP TABLE IF EXISTS `show_comment`;
CREATE TABLE `show_comment` (
  `show_id` int(10) unsigned NOT NULL COMMENT 'show ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table show_comment
#

LOCK TABLES `show_comment` WRITE;
/*!40000 ALTER TABLE `show_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table topic
#

DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题ID',
  `topic_name` varchar(32) NOT NULL COMMENT '专题名称',
  `category_id` int(10) unsigned NOT NULL COMMENT '类别ID',
  `topic_keywords` text NOT NULL COMMENT '专题关键词',
  `topic_images_id` int(11) DEFAULT '0' COMMENT '专题大图',
  `topic_rank` int(11) NOT NULL COMMENT '专题的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `topic_thumb_id` int(12) DEFAULT '0' COMMENT '专题缩略图',
  PRIMARY KEY (`topic_id`),
  KEY `NewIndex1` (`category_id`),
  KEY `NewIndex2` (`topic_rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table topic
#

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (3,'测试专题1',1,'干燥，保湿',4,0,'2012-03-01 11:30:30',3);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table topic_goods
#

DROP TABLE IF EXISTS `topic_goods`;
CREATE TABLE `topic_goods` (
  `topic_id` int(10) unsigned NOT NULL COMMENT '专题ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_note` text NOT NULL COMMENT '商品在专题中的额外描述信息',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '代理主键，没什么用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table topic_goods
#

LOCK TABLES `topic_goods` WRITE;
/*!40000 ALTER TABLE `topic_goods` DISABLE KEYS */;
INSERT INTO `topic_goods` VALUES (3,1,'',1);
INSERT INTO `topic_goods` VALUES (3,2,'',2);
/*!40000 ALTER TABLE `topic_goods` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nick_name` varchar(32) NOT NULL COMMENT '用户昵称',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `verified` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱是否验证',
  `sex` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '用户生日',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `image` varchar(64) NOT NULL COMMENT '用户头像',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '用户个人描述',
  `skin` enum('干性','油性','混合性','中性','敏感性') NOT NULL COMMENT '用户肤质',
  `hair` enum('干性','油性','混合性','中性','敏感性') NOT NULL COMMENT '用户发质',
  `point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户美币',
  `vip` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户的会员等级',
  `reg_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table user
#

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_address
#

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `province` smallint(5) unsigned NOT NULL COMMENT '省',
  `city` smallint(5) unsigned NOT NULL COMMENT '市',
  `district` smallint(5) unsigned NOT NULL COMMENT '区、县',
  `detail` varchar(128) NOT NULL COMMENT '详细地址',
  `mobile` varchar(32) NOT NULL COMMENT '手机',
  `telephone` varchar(32) NOT NULL COMMENT '固定电话',
  `receiver` varchar(32) NOT NULL COMMENT '收件人姓名',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认地址',
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table user_address
#

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_favorite
#

DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite` (
  `favorite_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `favorite_type` tinyint(3) unsigned NOT NULL COMMENT '收藏的类型，如0表示商品收藏、1表示测评收藏等',
  `related_id` int(10) unsigned NOT NULL COMMENT '该收藏条目对用的ID，如商品ID、测评ID等',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table user_favorite
#

LOCK TABLES `user_favorite` WRITE;
/*!40000 ALTER TABLE `user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_login
#

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `password_question` varchar(64) NOT NULL DEFAULT '' COMMENT '密码提示问题',
  `password_answer` varchar(64) NOT NULL DEFAULT '' COMMENT '密码提示答案',
  `uuid` varchar(64) NOT NULL COMMENT '用户唯一标示符，用户记录用户设备',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table user_login
#

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
