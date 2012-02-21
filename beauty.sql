# MySQL-Front 5.1  (Build 4.2)

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table category
#

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table efficacy
#

LOCK TABLES `efficacy` WRITE;
/*!40000 ALTER TABLE `efficacy` DISABLE KEYS */;
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
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `provider_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_thumb` varchar(64) NOT NULL COMMENT '商品缩略图',
  `goods_images` text NOT NULL COMMENT '商品细节图',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `goods_url` varchar(255) NOT NULL COMMENT '来源网站中商品的url',
  `goods_score` float NOT NULL COMMENT '商品评分',
  `goods_skin` set('干性','油性','混合性','中性','敏感性') NOT NULL COMMENT '商品适用的肤质',
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
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table goods
#

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table goods_comment
#

DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品评论',
  `commentator` varchar(32) NOT NULL COMMENT '评论者名称',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `comment_level` tinyint(3) unsigned NOT NULL COMMENT '评论的等级，如0为好评、1为中评、2为差评',
  `comment_rank` int(11) NOT NULL COMMENT '评论的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table goods_comment
#

LOCK TABLES `goods_comment` WRITE;
/*!40000 ALTER TABLE `goods_comment` DISABLE KEYS */;
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
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table provider
#

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
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
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
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
  `topic_images` text NOT NULL,
  `topic_rank` int(11) NOT NULL COMMENT '专题的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table topic
#

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table topic_goods
#

DROP TABLE IF EXISTS `topic_goods`;
CREATE TABLE `topic_goods` (
  `topic_id` int(10) unsigned NOT NULL COMMENT '专题ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_note` text NOT NULL COMMENT '商品在专题中的额外描述信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table topic_goods
#

LOCK TABLES `topic_goods` WRITE;
/*!40000 ALTER TABLE `topic_goods` DISABLE KEYS */;
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
