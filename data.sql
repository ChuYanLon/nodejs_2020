/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.30 : Database - typecho
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`typecho` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */;

USE `typecho`;

/*Table structure for table `typecho_comments` */

DROP TABLE IF EXISTS `typecho_comments`;

CREATE TABLE `typecho_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `typecho_comments` */

insert  into `typecho_comments`(`coid`,`cid`,`created`,`author`,`authorId`,`ownerId`,`mail`,`url`,`ip`,`agent`,`text`,`type`,`status`,`parent`) values 
(1,1,1611721825,'Typecho',0,1,NULL,'http://typecho.org','127.0.0.1','Typecho 1.1/17.10.30','欢迎加入 Typecho 大家族','comment','approved',0);

/*Table structure for table `typecho_contents` */

DROP TABLE IF EXISTS `typecho_contents`;

CREATE TABLE `typecho_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `text` longtext,
  `order` int(10) unsigned DEFAULT '0',
  `authorId` int(10) unsigned DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  `likes` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `typecho_contents` */

insert  into `typecho_contents`(`cid`,`title`,`slug`,`created`,`modified`,`text`,`order`,`authorId`,`template`,`type`,`status`,`password`,`commentsNum`,`allowComment`,`allowPing`,`allowFeed`,`parent`,`likes`,`views`) values 
(1,'欢迎使用 Typecho','start',1611721825,1611721825,'<!--markdown-->如果您看到这篇文章,表示您的 blog 已经安装成功.',0,1,NULL,'post','publish',NULL,1,'1','1','1',0,0,1),
(2,'关于','start-page',1611721825,1611721825,'<!--markdown-->本页面由 Typecho 创建, 这只是个测试页面.',0,1,NULL,'page','publish',NULL,0,'1','1','1',0,0,0);

/*Table structure for table `typecho_fields` */

DROP TABLE IF EXISTS `typecho_fields`;

CREATE TABLE `typecho_fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `typecho_fields` */

/*Table structure for table `typecho_links` */

DROP TABLE IF EXISTS `typecho_links`;

CREATE TABLE `typecho_links` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'links表主键',
  `name` varchar(200) DEFAULT NULL COMMENT 'links名称',
  `url` varchar(200) DEFAULT NULL COMMENT 'links网址',
  `sort` varchar(200) DEFAULT NULL COMMENT 'links分类',
  `image` varchar(200) DEFAULT NULL COMMENT 'links图片',
  `description` varchar(200) DEFAULT NULL COMMENT 'links描述',
  `user` varchar(200) DEFAULT NULL COMMENT '自定义',
  `order` int(10) unsigned DEFAULT '0' COMMENT 'links排序',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `typecho_links` */

/*Table structure for table `typecho_metas` */

DROP TABLE IF EXISTS `typecho_metas`;

CREATE TABLE `typecho_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `typecho_metas` */

insert  into `typecho_metas`(`mid`,`name`,`slug`,`type`,`description`,`count`,`order`,`parent`) values 
(1,'默认分类','default','category','只是一个默认分类',1,1,0);

/*Table structure for table `typecho_options` */

DROP TABLE IF EXISTS `typecho_options`;

CREATE TABLE `typecho_options` (
  `name` varchar(32) NOT NULL,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`name`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `typecho_options` */

insert  into `typecho_options`(`name`,`user`,`value`) values 
('theme',0,'cuckoo'),
('theme:Paul',0,'a:19:{s:7:\"favicon\";N;s:10:\"background\";N;s:6:\"avatar\";N;s:15:\"github_username\";N;s:8:\"weibo_id\";N;s:10:\"netease_id\";N;s:7:\"bili_id\";N;s:3:\"RSS\";N;s:8:\"blog_url\";N;s:9:\"note_nums\";N;s:14:\"is_hidden_note\";s:33:\"是否隐藏后续的日记内容\";s:6:\"secret\";s:6:\"secret\";s:15:\"display_bgm_num\";N;s:22:\"is_display_all_content\";s:27:\"日记预览页输出设置\";s:10:\"custom_css\";N;s:13:\"custom_script\";N;s:11:\"home_social\";N;s:11:\"author_text\";N;s:8:\"svg_path\";N;}'),
('timezone',0,'28800'),
('lang',0,NULL),
('charset',0,'UTF-8'),
('contentType',0,'text/html'),
('gzip',0,'0'),
('generator',0,'Typecho 1.1/17.10.30'),
('title',0,'褚燕龙的个人博客'),
('description',0,'记录每天的学习'),
('keywords',0,'typecho,php,blog'),
('rewrite',0,'0'),
('frontPage',0,'recent'),
('frontArchive',0,'0'),
('commentsRequireMail',0,'1'),
('commentsWhitelist',0,'0'),
('commentsRequireURL',0,'0'),
('commentsRequireModeration',0,'0'),
('plugins',0,'a:2:{s:9:\"activated\";a:9:{s:5:\"Links\";a:1:{s:7:\"handles\";a:3:{s:34:\"Widget_Abstract_Contents:contentEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}s:34:\"Widget_Abstract_Contents:excerptEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}s:34:\"Widget_Abstract_Comments:contentEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}}}s:10:\"HelloWorld\";a:1:{s:7:\"handles\";a:1:{s:21:\"admin/menu.php:navBar\";a:1:{i:0;a:2:{i:0;s:17:\"HelloWorld_Plugin\";i:1;s:6:\"render\";}}}}s:4:\"Snow\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}}}}s:7:\"Youtube\";a:1:{s:7:\"handles\";a:2:{s:27:\"admin/write-post.php:bottom\";a:1:{i:0;a:2:{i:0;s:14:\"Youtube_Plugin\";i:1;s:6:\"Insert\";}}s:27:\"admin/write-page.php:bottom\";a:1:{i:0;a:2:{i:0;s:14:\"Youtube_Plugin\";i:1;s:6:\"Insert\";}}}}s:14:\"Live2dHistoire\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:21:\"Live2dHistoire_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:21:\"Live2dHistoire_Plugin\";i:1;s:6:\"footer\";}}}}s:12:\"ColorfulTags\";a:1:{s:7:\"handles\";a:1:{s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:19:\"ColorfulTags_Plugin\";i:1;s:6:\"render\";}}}}s:9:\"HoerMouse\";a:1:{s:7:\"handles\";a:1:{s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:16:\"HoerMouse_Plugin\";i:1;s:6:\"footer\";}}}}s:13:\"LoginDesigner\";a:1:{s:7:\"handles\";a:2:{s:23:\"admin/header.php:header\";a:1:{i:0;a:2:{i:0;s:20:\"LoginDesigner_Plugin\";i:1;s:6:\"render\";}}s:20:\"admin/footer.php:end\";a:1:{i:0;a:2:{i:0;s:20:\"LoginDesigner_Plugin\";i:1;s:8:\"footerjs\";}}}}s:12:\"DynamicLines\";a:1:{s:7:\"handles\";a:1:{s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:19:\"DynamicLines_Plugin\";i:1;s:6:\"footer\";}}}}}s:7:\"handles\";a:10:{s:34:\"Widget_Abstract_Contents:contentEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}s:34:\"Widget_Abstract_Contents:excerptEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}s:34:\"Widget_Abstract_Comments:contentEx\";a:1:{i:0;a:2:{i:0;s:12:\"Links_Plugin\";i:1;s:5:\"parse\";}}s:21:\"admin/menu.php:navBar\";a:1:{i:0;a:2:{i:0;s:17:\"HelloWorld_Plugin\";i:1;s:6:\"render\";}}s:21:\"Widget_Archive:header\";a:2:{i:0;a:2:{i:0;s:21:\"Live2dHistoire_Plugin\";i:1;s:6:\"header\";}s:5:\"0.001\";a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:5:{i:0;a:2:{i:0;s:21:\"Live2dHistoire_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.001\";a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.002\";a:2:{i:0;s:19:\"ColorfulTags_Plugin\";i:1;s:6:\"render\";}s:5:\"0.003\";a:2:{i:0;s:16:\"HoerMouse_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.005\";a:2:{i:0;s:19:\"DynamicLines_Plugin\";i:1;s:6:\"footer\";}}s:27:\"admin/write-post.php:bottom\";a:1:{i:0;a:2:{i:0;s:14:\"Youtube_Plugin\";i:1;s:6:\"Insert\";}}s:27:\"admin/write-page.php:bottom\";a:1:{i:0;a:2:{i:0;s:14:\"Youtube_Plugin\";i:1;s:6:\"Insert\";}}s:23:\"admin/header.php:header\";a:1:{i:0;a:2:{i:0;s:20:\"LoginDesigner_Plugin\";i:1;s:6:\"render\";}}s:20:\"admin/footer.php:end\";a:1:{i:0;a:2:{i:0;s:20:\"LoginDesigner_Plugin\";i:1;s:8:\"footerjs\";}}}}'),
('commentDateFormat',0,'F jS, Y \\a\\t h:i a'),
('siteUrl',0,'http://txt.com'),
('defaultCategory',0,'1'),
('allowRegister',0,'1'),
('defaultAllowComment',0,'1'),
('defaultAllowPing',0,'1'),
('defaultAllowFeed',0,'1'),
('pageSize',0,'5'),
('postsListSize',0,'10'),
('commentsListSize',0,'10'),
('commentsHTMLTagAllowed',0,NULL),
('postDateFormat',0,'Y-m-d'),
('feedFullText',0,'1'),
('editorSize',0,'350'),
('autoSave',0,'0'),
('markdown',0,'1'),
('xmlrpcMarkdown',0,'0'),
('commentsMaxNestingLevels',0,'5'),
('commentsPostTimeout',0,'2592000'),
('commentsUrlNofollow',0,'1'),
('commentsShowUrl',0,'1'),
('commentsMarkdown',0,'0'),
('commentsPageBreak',0,'0'),
('commentsThreaded',0,'1'),
('commentsPageSize',0,'20'),
('commentsPageDisplay',0,'last'),
('commentsOrder',0,'ASC'),
('commentsCheckReferer',0,'1'),
('commentsAutoClose',0,'0'),
('commentsPostIntervalEnable',0,'1'),
('commentsPostInterval',0,'60'),
('commentsShowCommentOnly',0,'0'),
('commentsAvatar',0,'1'),
('commentsAvatarRating',0,'G'),
('commentsAntiSpam',0,'1'),
('routingTable',0,'a:33:{i:0;a:32:{s:5:\"index\";a:6:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:8:\"|^[/]?$|\";s:6:\"format\";s:1:\"/\";s:6:\"params\";a:0:{}}s:7:\"archive\";a:6:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:13:\"|^/blog[/]?$|\";s:6:\"format\";s:6:\"/blog/\";s:6:\"params\";a:0:{}}s:2:\"do\";a:6:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:32:\"|^/action/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:10:\"/action/%s\";s:6:\"params\";a:1:{i:0;s:6:\"action\";}}s:4:\"post\";a:6:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:26:\"|^/archives/([0-9]+)[/]?$|\";s:6:\"format\";s:13:\"/archives/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:10:\"attachment\";a:6:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:28:\"|^/attachment/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/attachment/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:8:\"category\";a:6:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:25:\"|^/category/([^/]+)[/]?$|\";s:6:\"format\";s:13:\"/category/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:3:\"tag\";a:6:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:20:\"|^/tag/([^/]+)[/]?$|\";s:6:\"format\";s:8:\"/tag/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:6:\"author\";a:6:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:24:\"|^/author/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/author/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"uid\";}}s:6:\"search\";a:6:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:23:\"|^/search/([^/]+)[/]?$|\";s:6:\"format\";s:11:\"/search/%s/\";s:6:\"params\";a:1:{i:0;s:8:\"keywords\";}}s:10:\"index_page\";a:6:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/page/([0-9]+)[/]?$|\";s:6:\"format\";s:9:\"/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:12:\"archive_page\";a:6:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:27:\"|^/blog/page/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/blog/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:13:\"category_page\";a:6:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:34:\"|^/category/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:16:\"/category/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:8:\"tag_page\";a:6:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:29:\"|^/tag/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/tag/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:11:\"author_page\";a:6:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/author/([0-9]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/author/%s/%s/\";s:6:\"params\";a:2:{i:0;s:3:\"uid\";i:1;s:4:\"page\";}}s:11:\"search_page\";a:6:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:32:\"|^/search/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/search/%s/%s/\";s:6:\"params\";a:2:{i:0;s:8:\"keywords\";i:1;s:4:\"page\";}}s:12:\"archive_year\";a:6:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:19:\"|^/([0-9]{4})[/]?$|\";s:6:\"format\";s:4:\"/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"year\";}}s:13:\"archive_month\";a:6:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:30:\"|^/([0-9]{4})/([0-9]{2})[/]?$|\";s:6:\"format\";s:7:\"/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:5:\"month\";}}s:11:\"archive_day\";a:6:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:41:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|\";s:6:\"format\";s:10:\"/%s/%s/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";}}s:17:\"archive_year_page\";a:6:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/([0-9]{4})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:12:\"/%s/page/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:4:\"page\";}}s:18:\"archive_month_page\";a:6:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:44:\"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/%s/%s/page/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:4:\"page\";}}s:16:\"archive_day_page\";a:6:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:55:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"/%s/%s/%s/page/%s/\";s:6:\"params\";a:4:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";i:3;s:4:\"page\";}}s:12:\"comment_page\";a:6:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:36:\"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"%s/comment-page-%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:11:\"commentPage\";}}s:4:\"feed\";a:6:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";s:4:\"regx\";s:17:\"|^/feed(.*)[/]?$|\";s:6:\"format\";s:7:\"/feed%s\";s:6:\"params\";a:1:{i:0;s:4:\"feed\";}}s:8:\"feedback\";a:6:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:29:\"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:5:\"%s/%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:4:\"type\";}}s:4:\"page\";a:6:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/([^/]+)\\.html[/]?$|\";s:6:\"format\";s:8:\"/%s.html\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:20:\"route_Live2dHistoire\";a:6:{s:3:\"url\";s:15:\"/Live2dHistoire\";s:6:\"widget\";s:21:\"Live2dHistoire_Action\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:23:\"|^/Live2dHistoire[/]?$|\";s:6:\"format\";s:15:\"/Live2dHistoire\";s:6:\"params\";a:0:{}}s:4:\"bind\";a:6:{s:3:\"url\";s:24:\"/admin/TeacherLogin/bind\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:4:\"bind\";s:4:\"regx\";s:32:\"|^/admin/TeacherLogin/bind[/]?$|\";s:6:\"format\";s:24:\"/admin/TeacherLogin/bind\";s:6:\"params\";a:0:{}}s:5:\"login\";a:6:{s:3:\"url\";s:25:\"/admin/TeacherLogin/login\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:5:\"login\";s:4:\"regx\";s:33:\"|^/admin/TeacherLogin/login[/]?$|\";s:6:\"format\";s:25:\"/admin/TeacherLogin/login\";s:6:\"params\";a:0:{}}s:5:\"reset\";a:6:{s:3:\"url\";s:25:\"/admin/TeacherLogin/reset\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:5:\"reset\";s:4:\"regx\";s:33:\"|^/admin/TeacherLogin/reset[/]?$|\";s:6:\"format\";s:25:\"/admin/TeacherLogin/reset\";s:6:\"params\";a:0:{}}s:9:\"auth-bind\";a:6:{s:3:\"url\";s:29:\"/admin/TeacherLogin/auth-bind\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:8:\"authbind\";s:4:\"regx\";s:38:\"|^/admin/TeacherLogin/auth\\-bind[/]?$|\";s:6:\"format\";s:29:\"/admin/TeacherLogin/auth-bind\";s:6:\"params\";a:0:{}}s:9:\"getqrcode\";a:6:{s:3:\"url\";s:29:\"/admin/TeacherLogin/getqrcode\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:9:\"getqrcode\";s:4:\"regx\";s:37:\"|^/admin/TeacherLogin/getqrcode[/]?$|\";s:6:\"format\";s:29:\"/admin/TeacherLogin/getqrcode\";s:6:\"params\";a:0:{}}s:9:\"getresult\";a:6:{s:3:\"url\";s:29:\"/admin/TeacherLogin/getresult\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:9:\"getresult\";s:4:\"regx\";s:37:\"|^/admin/TeacherLogin/getresult[/]?$|\";s:6:\"format\";s:29:\"/admin/TeacherLogin/getresult\";s:6:\"params\";a:0:{}}}s:5:\"index\";a:3:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:7:\"archive\";a:3:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:2:\"do\";a:3:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";}s:4:\"post\";a:3:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"attachment\";a:3:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"category\";a:3:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:3:\"tag\";a:3:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"author\";a:3:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"search\";a:3:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"index_page\";a:3:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_page\";a:3:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"category_page\";a:3:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"tag_page\";a:3:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"author_page\";a:3:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"search_page\";a:3:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_year\";a:3:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"archive_month\";a:3:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"archive_day\";a:3:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:17:\"archive_year_page\";a:3:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:18:\"archive_month_page\";a:3:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:16:\"archive_day_page\";a:3:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"comment_page\";a:3:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:4:\"feed\";a:3:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";}s:8:\"feedback\";a:3:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";}s:4:\"page\";a:3:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:20:\"route_Live2dHistoire\";a:3:{s:3:\"url\";s:15:\"/Live2dHistoire\";s:6:\"widget\";s:21:\"Live2dHistoire_Action\";s:6:\"action\";s:6:\"action\";}s:4:\"bind\";a:3:{s:3:\"url\";s:24:\"/admin/TeacherLogin/bind\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:4:\"bind\";}s:5:\"login\";a:3:{s:3:\"url\";s:25:\"/admin/TeacherLogin/login\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:5:\"login\";}s:5:\"reset\";a:3:{s:3:\"url\";s:25:\"/admin/TeacherLogin/reset\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:5:\"reset\";}s:9:\"auth-bind\";a:3:{s:3:\"url\";s:29:\"/admin/TeacherLogin/auth-bind\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:8:\"authbind\";}s:9:\"getqrcode\";a:3:{s:3:\"url\";s:29:\"/admin/TeacherLogin/getqrcode\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:9:\"getqrcode\";}s:9:\"getresult\";a:3:{s:3:\"url\";s:29:\"/admin/TeacherLogin/getresult\";s:6:\"widget\";s:19:\"TeacherLogin_Action\";s:6:\"action\";s:9:\"getresult\";}}'),
('actionTable',0,'a:1:{s:10:\"links-edit\";s:12:\"Links_Action\";}'),
('panelTable',0,'a:2:{s:5:\"child\";a:1:{i:3;a:1:{i:0;a:6:{i:0;s:12:\"友情链接\";i:1;s:18:\"管理友情链接\";i:2;s:44:\"extending.php?panel=Links%2Fmanage-links.php\";i:3;s:13:\"administrator\";i:4;b:0;i:5;s:0:\"\";}}}s:4:\"file\";a:1:{i:0;s:24:\"Links%2Fmanage-links.php\";}}'),
('attachmentTypes',0,'@image@'),
('secret',0,'Eh%RK9cxBRAf^p0GgU%(ZVhEpdcp%Sl$'),
('installed',0,'1'),
('allowXmlRpc',0,'2'),
('plugin:Live2dHistoire',0,'a:12:{s:11:\"live2d_type\";s:1:\"1\";s:6:\"appkey\";s:0:\"\";s:5:\"talk1\";s:54:\"真理惟一可靠的标准就是永远自相符合。\";s:5:\"talk2\";s:48:\"相信谎言的人必将在真理之前毁灭。\";s:5:\"talk3\";s:45:\"一件事实是一条没有性别的真理。\";s:5:\"talk4\";s:132:\"躯体总是以惹人厌烦告终。除思想以外，没有什么优美和有意思的东西留下来，因为思想就是生命。\";s:5:\"talk5\";s:111:\"你可以从别人那里得来思想，你的思想方法，即熔铸思想的模子却必须是你自己的。\";s:4:\"bgm1\";s:61:\"https://api.uomg.com/api/rand.music?sort=抖音榜&format=mp3\";s:4:\"bgm2\";s:61:\"https://api.uomg.com/api/rand.music?sort=电音榜&format=mp3\";s:4:\"bgm3\";s:61:\"https://api.uomg.com/api/rand.music?sort=热歌榜&format=mp3\";s:4:\"bgm4\";s:61:\"https://api.uomg.com/api/rand.music?sort=新歌榜&format=mp3\";s:4:\"bgm5\";s:61:\"https://api.uomg.com/api/rand.music?sort=飙升榜&format=mp3\";}'),
('theme:cuckoo',0,'a:34:{s:7:\"favicon\";s:0:\"\";s:7:\"logoUrl\";s:65:\"https://api.uomg.com/api/rand.avatar?sort=动漫男&format=images\";s:8:\"describe\";s:0:\"\";s:12:\"primaryColor\";s:4:\"blue\";s:11:\"accentColor\";s:4:\"blue\";s:13:\"drawerContact\";s:13:\"QQ:3345030031\";s:5:\"bgUrl\";s:34:\"http://api.btstu.cn/sjbz/?lx=suiji\";s:10:\"bgphoneUrl\";s:36:\"http://api.btstu.cn/sjbz/?m_lx=suiji\";s:11:\"staticFiles\";s:8:\"jsdelivr\";s:9:\"staticCdn\";s:0:\"\";s:7:\"randimg\";s:3:\"cdn\";s:10:\"randimgCdn\";s:63:\"https://api.uomg.com/api/rand.img1?sort=动漫男&format=images\";s:6:\"sticky\";s:0:\"\";s:15:\"statisticsBaidu\";s:0:\"\";s:5:\"beian\";s:0:\"\";s:6:\"Footer\";s:0:\"\";s:9:\"otherMenu\";s:397:\"[{\r\n        \"name\":\"分类\",\r\n        \"link\":\"#\",\r\n        \"icon\":\"view_list\",\r\n        \"type\":\"2\"\r\n       },{\r\n        \"name\":\"归档\",\r\n        \"link\":\"#\",\r\n        \"icon\":\"access_time\",\r\n        \"type\":\"1\"\r\n       },{\r\n        \"name\":\"页面\",\r\n        \"link\":\"#\",\r\n        \"icon\":\"view_carousel\",\r\n        \"type\":\"3\"\r\n       },{\r\n         \"type\":\"5\"\r\n       },{\r\n         \"type\":\"6\"\r\n       }]\";s:6:\"qrcode\";a:1:{i:0;s:4:\"open\";}s:10:\"textareaBG\";s:0:\"\";s:8:\"otherCss\";s:39:\"body::-webkit-scrollbar{display: none;}\";s:7:\"otherJs\";s:0:\"\";s:10:\"brightTime\";s:0:\"\";s:9:\"otherPjax\";s:0:\"\";s:8:\"tagCloud\";s:2:\"20\";s:11:\"articleCopy\";s:182:\"<a href=\"https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh\" target=\"_blank\" rel=\"nofollow\">知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a>\";s:7:\"fontUrl\";s:0:\"\";s:10:\"globalFont\";s:0:\"\";s:16:\"globalFontWeight\";s:0:\"\";s:8:\"logoFont\";s:0:\"\";s:13:\"linksIndexNum\";s:2:\"10\";s:11:\"BilibiliUid\";s:0:\"\";s:9:\"CacheTime\";s:0:\"\";s:5:\"Amout\";s:0:\"\";s:9:\"HideMedia\";s:0:\"\";}'),
('plugin:HelloWorld',0,'a:1:{s:4:\"word\";s:11:\"Hello World\";}'),
('plugin:Snow',0,'a:9:{s:6:\"mobile\";s:1:\"1\";s:10:\"flakeCount\";s:3:\"800\";s:4:\"size\";s:1:\"2\";s:7:\"minDist\";s:3:\"150\";s:5:\"speed\";s:3:\"0.5\";s:8:\"stepSize\";s:1:\"1\";s:9:\"snowcolor\";s:7:\"#ffffff\";s:7:\"opacity\";s:3:\"0.3\";s:7:\"bgcolor\";s:7:\"#7d895f\";}'),
('plugin:HoerMouse',0,'a:6:{s:6:\"jquery\";s:1:\"0\";s:10:\"bubbleType\";s:4:\"text\";s:10:\"bubbleText\";s:25:\"欢迎来到我的小站!\";s:11:\"bubbleColor\";s:6:\"随机\";s:11:\"bubbleSpeed\";s:4:\"3000\";s:9:\"mouseType\";s:3:\"dew\";}'),
('plugin:ColorfulTags',0,'a:4:{s:5:\"is_3d\";s:1:\"1\";s:6:\"radius\";s:2:\"80\";s:5:\"speed\";s:2:\"11\";s:7:\"is_pjax\";s:1:\"0\";}'),
('plugin:LoginDesigner',0,'a:3:{s:8:\"bgfengge\";s:5:\"white\";s:5:\"bgUrl\";s:0:\"\";s:6:\"diycss\";s:0:\"\";}'),
('plugin:DynamicLines',0,'a:5:{s:6:\"mobile\";s:1:\"1\";s:5:\"color\";s:7:\"0,0,255\";s:5:\"count\";s:2:\"99\";s:7:\"opacity\";s:3:\"0.7\";s:6:\"zIndex\";s:3:\"999\";}');

/*Table structure for table `typecho_relationships` */

DROP TABLE IF EXISTS `typecho_relationships`;

CREATE TABLE `typecho_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `typecho_relationships` */

insert  into `typecho_relationships`(`cid`,`mid`) values 
(1,1);

/*Table structure for table `typecho_users` */

DROP TABLE IF EXISTS `typecho_users`;

CREATE TABLE `typecho_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `authCode` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `typecho_users` */

insert  into `typecho_users`(`uid`,`name`,`password`,`mail`,`url`,`screenName`,`created`,`activated`,`logged`,`group`,`authCode`) values 
(1,'admin','$P$BAPauiIZZRycP9Q4NCuV2w5Hnuf3CO.','webmaster@yourdomain.com','http://www.typecho.org','admin',1611721825,1611734207,1611733178,'administrator','fb227ac92ee59f015ad8431d335edc7f');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
