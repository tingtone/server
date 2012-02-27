/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.21 : Database - beauty
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`beauty` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `beauty`;

/*Table structure for table `brand` */

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

/*Data for the table `brand` */

insert  into `brand`(`brand_id`,`brand_name`,`brand_alias`,`brand_other_names`,`brand_description`,`brand_rank`) values (2,'雅诗兰黛 ','雅诗兰黛 ','','',0),(3,'maybelline','美宝莲','othername test','测试描述',1),(4,'资生堂 ','','','',1),(5,'OLAY','玉兰油\r','','',0),(6,'Mentholatum','曼秀雷敦','','',0),(7,'dior','迪奥','','',0),(8,'maxfactor','蜜丝佛陀','','',0),(9,'chanel','香奈儿\r','','',0),(10,'kose','高丝','','',0),(11,'dove','多芬','','',0),(12,'娥佩兰','娥佩兰','','',0),(13,'火烈鸟','火烈鸟','','',0),(14,'芭茉儿','芭茉儿','','',0),(15,'碧欧泉','碧欧泉','','',0),(16,'百雀羚','','','',0),(17,'佰草集','','','',0),(18,'婵真','婵真','','',0),(19,'御泥坊','御泥坊','','',0),(20,'美即','美即','','',0);

/*Table structure for table `category` */

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

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`,`category_description`,`category_rank`,`parent_catid`,`cat_layer`) values (1,'护肤','',1,0,0),(2,'妆扮','',2,0,0),(3,'美发','',3,0,0),(4,'美体','',4,0,0),(5,'日护理','',5,1,1),(6,'周护理','',6,1,1),(8,'卸妆','',0,5,2),(9,'洁面','',0,5,2),(10,'化妆水','',0,5,2),(11,'乳液/面霜','',0,5,2),(13,'精华','',0,5,2),(14,'眼霜/精华','',0,5,2),(15,'润唇膏','',0,5,2),(16,'喷雾\r\n喷雾\r\n喷雾','',0,5,2),(17,'防晒','',0,5,2),(18,'精油','',0,5,2),(19,'面膜','',0,6,2),(20,'按摩霜','',0,6,2),(21,'去角质','',0,6,2),(22,'妆底','',0,2,1),(23,'眼部妆容','',0,2,1),(24,'唇部妆容','',0,2,1),(26,'面颊妆容','',0,2,1),(27,'沐浴清洁','',0,4,1),(28,'身体乳/霜','',0,4,1),(29,'手部护理','',0,4,1),(30,'足部护理','',0,4,1),(32,'洗发','',0,3,1),(33,'护法','',0,3,1),(34,'染发','',0,3,1),(35,'造型','',0,3,1),(36,'妆底隔离','',0,22,2),(37,'遮瑕膏','',0,22,2),(38,'粉底液','',0,22,2),(39,'粉底霜','',0,22,2),(40,'粉饼','',0,22,2),(41,'粉蜜（散粉）','',0,22,2),(42,'眼部底霜','',0,23,2),(43,'眼影','',0,23,2),(44,'眼线','',0,23,2),(45,'假睫毛','',0,23,2),(46,'睫毛膏','',0,23,2),(47,'眉笔','',0,23,2),(48,'唇彩','',0,24,2),(49,'唇线笔','',0,24,2),(50,'唇膏','',0,24,2),(51,'腮红（胭脂）','',0,26,2),(52,'卸妆油','',0,8,3),(53,'卸妆水','',0,8,3),(54,'卸妆乳','',0,8,3),(55,'全脸','',0,8,3),(56,'眼唇','',0,8,3),(57,'洁面乳','',0,9,3),(58,'洁面啫喱','',0,9,3),(59,'洁面摩丝','',0,9,3),(60,'洁面粉','',0,9,3),(61,'洁面皂','',0,9,3),(62,'深层清洁','',0,9,3),(63,'补水保湿','',0,9,3),(64,'美白/淡斑','',0,9,3),(65,'控油','',0,9,3),(66,'日','',0,11,3),(67,'夜','',0,11,3),(68,'轻盈防晒','',0,17,3),(69,'高度防晒','',0,17,3),(70,'面膜帖','',0,19,3),(71,'水洗式','',0,19,3),(72,'睡眠免洗','',0,19,3);

/*Table structure for table `coin_record` */

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

/*Data for the table `coin_record` */

/*Table structure for table `diary` */

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

/*Data for the table `diary` */

/*Table structure for table `diary_comment` */

DROP TABLE IF EXISTS `diary_comment`;

CREATE TABLE `diary_comment` (
  `diary_id` int(10) unsigned NOT NULL COMMENT '日记ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日记的评论';

/*Data for the table `diary_comment` */

/*Table structure for table `efficacy` */

DROP TABLE IF EXISTS `efficacy`;

CREATE TABLE `efficacy` (
  `efficacy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '功效ID',
  `efficacy_name` varchar(32) NOT NULL COMMENT '功效名称',
  `efficacy_rank` int(11) NOT NULL COMMENT '功效的排序值，越大的优先级越高',
  PRIMARY KEY (`efficacy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `efficacy` */

insert  into `efficacy`(`efficacy_id`,`efficacy_name`,`efficacy_rank`) values (1,'深层清洁',0),(2,'去角质',0),(3,'补水保湿',0),(4,'活肤滋润',0),(5,'美白/淡斑',0),(6,'提亮肤色',0),(7,'抗氧化',0),(8,'淡化细纹',0),(9,'抗皱紧肤',0),(10,'控油',0),(11,'细致毛孔',0),(12,'祛黑头',0),(13,'祛痘',0),(14,'祛痘印',0),(15,'舒缓抗敏',0),(16,'晒后修护',0),(17,'祛眼袋',0),(18,'祛黑眼圈',0),(19,'消除眼部浮肿',0),(20,'淡化眼部细纹',0);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content` varchar(255) NOT NULL COMMENT '反馈的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员是否读过',
  PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

/*Table structure for table `goods` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `goods` */

insert  into `goods`(`goods_id`,`brand_id`,`category_id`,`goods_name`,`goods_thumb`,`goods_images`,`goods_score`,`goods_forskin`,`goods_notforskin`,`goods_noticeforskin`,`goods_age`,`goods_description`,`goods_specification`,`goods_buy_count`,`goods_view_count`,`goods_add_time`,`goods_last_update`,`goods_status`,`goods_rank`) values (1,1,1,'test','test','test',100,'敏感性','敏感性','敏感性','40岁以上','test','test',0,0,'2012-02-01 00:00:00','2012-02-01 00:00:00',3,1);

/*Table structure for table `goods_comment` */

DROP TABLE IF EXISTS `goods_comment`;

CREATE TABLE `goods_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品评论',
  `commentator` varchar(32) NOT NULL COMMENT '评论者名称',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `comment_level` tinyint(3) unsigned NOT NULL COMMENT '评论的等级，如0为好评、1为中评、2为差评',
  `comment_rank` int(11) NOT NULL COMMENT '评论的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goods_comment` */

/*Table structure for table `goods_efficacy` */

DROP TABLE IF EXISTS `goods_efficacy`;

CREATE TABLE `goods_efficacy` (
  `efficacy_id` int(10) unsigned NOT NULL COMMENT '功效ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goods_efficacy` */

/*Table structure for table `goods_map` */

DROP TABLE IF EXISTS `goods_map`;

CREATE TABLE `goods_map` (
  `map_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_real_id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `goods_map` */

/*Table structure for table `goods_real` */

DROP TABLE IF EXISTS `goods_real`;

CREATE TABLE `goods_real` (
  `goods_real_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `provider_id` int(10) unsigned NOT NULL COMMENT '供应商ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_thumb` text NOT NULL COMMENT '商品缩略图',
  `goods_images` text NOT NULL COMMENT '商品细节图',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `goods_url` varchar(255) NOT NULL COMMENT '来源网站中商品的url',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goods_real` */

/*Table structure for table `keyword` */

DROP TABLE IF EXISTS `keyword`;

CREATE TABLE `keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关键词ID',
  `keyword` varchar(32) NOT NULL COMMENT '关键词',
  `keyword_count` int(10) unsigned NOT NULL COMMENT '关键词计数',
  `keyword_rank` int(11) NOT NULL COMMENT '关键词的排序值，越大的优先级越高',
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索关键词，可以用于‘自动完成搜索词’或者‘提示你想搜的是’';

/*Data for the table `keyword` */

/*Table structure for table `order` */

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

/*Data for the table `order` */

/*Table structure for table `order_goods` */

DROP TABLE IF EXISTS `order_goods`;

CREATE TABLE `order_goods` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单中包含的商品';

/*Data for the table `order_goods` */

/*Table structure for table `provider` */

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

/*Data for the table `provider` */

/*Table structure for table `provider_locations` */

DROP TABLE IF EXISTS `provider_locations`;

CREATE TABLE `provider_locations` (
  `provider_id` int(11) NOT NULL COMMENT '供应商ID',
  `province` varchar(32) NOT NULL COMMENT '省',
  `city` varchar(32) NOT NULL COMMENT '市',
  `distric` varchar(32) NOT NULL COMMENT '区、县'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `provider_locations` */

/*Table structure for table `question` */

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

/*Data for the table `question` */

/*Table structure for table `question_comment` */

DROP TABLE IF EXISTS `question_comment`;

CREATE TABLE `question_comment` (
  `question_id` int(10) unsigned NOT NULL COMMENT '问答ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(4) NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '该回答获得的悬赏美币值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `question_comment` */

/*Table structure for table `report` */

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

/*Data for the table `report` */

/*Table structure for table `report_comment` */

DROP TABLE IF EXISTS `report_comment`;

CREATE TABLE `report_comment` (
  `report_id` int(10) unsigned NOT NULL COMMENT '测评ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测评的评论';

/*Data for the table `report_comment` */

/*Table structure for table `report_goods` */

DROP TABLE IF EXISTS `report_goods`;

CREATE TABLE `report_goods` (
  `report_id` int(10) unsigned NOT NULL COMMENT '测评ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_score` float unsigned NOT NULL COMMENT '商品评分'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测评包含的商品，单独列一个表的原因是：1.一个测评可能涉及多个商品，2.可能根据商品搜索测评';

/*Data for the table `report_goods` */

/*Table structure for table `shopping_cart` */

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `goods_real_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '商品的数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shopping_cart` */

/*Table structure for table `show` */

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

/*Data for the table `show` */

/*Table structure for table `show_comment` */

DROP TABLE IF EXISTS `show_comment`;

CREATE TABLE `show_comment` (
  `show_id` int(10) unsigned NOT NULL COMMENT 'show ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '评论内容的类型，如0表示文字，1表示录音等',
  `comment_content` text NOT NULL COMMENT '评论的内容',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `show_comment` */

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题ID',
  `topic_name` varchar(32) NOT NULL COMMENT '专题名称',
  `category_id` int(10) unsigned NOT NULL COMMENT '类别ID',
  `topic_keywords` text NOT NULL COMMENT '专题关键词',
  `topic_images` text NOT NULL,
  `topic_rank` int(11) NOT NULL COMMENT '专题的排序值，越大的优先级越高',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `topic_thumb` text NOT NULL COMMENT '专题缩略图',
  PRIMARY KEY (`topic_id`),
  KEY `NewIndex1` (`category_id`),
  KEY `NewIndex2` (`topic_rank`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `topic` */

insert  into `topic`(`topic_id`,`topic_name`,`category_id`,`topic_keywords`,`topic_images`,`topic_rank`,`add_time`,`topic_thumb`) values (1,'test',1,'1234','4321',1,'2012-01-01 00:00:00','1');

/*Table structure for table `topic_goods` */

DROP TABLE IF EXISTS `topic_goods`;

CREATE TABLE `topic_goods` (
  `topic_id` int(10) unsigned NOT NULL COMMENT '专题ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_note` text NOT NULL COMMENT '商品在专题中的额外描述信息',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '代理主键，没什么用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `topic_goods` */

insert  into `topic_goods`(`topic_id`,`goods_id`,`goods_note`,`id`) values (1,1,'',1);

/*Table structure for table `user` */

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

/*Data for the table `user` */

/*Table structure for table `user_address` */

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

/*Data for the table `user_address` */

/*Table structure for table `user_favorite` */

DROP TABLE IF EXISTS `user_favorite`;

CREATE TABLE `user_favorite` (
  `favorite_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `favorite_type` tinyint(3) unsigned NOT NULL COMMENT '收藏的类型，如0表示商品收藏、1表示测评收藏等',
  `related_id` int(10) unsigned NOT NULL COMMENT '该收藏条目对用的ID，如商品ID、测评ID等',
  `add_time` datetime NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `user_favorite` */

/*Table structure for table `user_login` */

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

/*Data for the table `user_login` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
