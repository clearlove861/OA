/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - qiyeoaguanlixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qiyeoaguanlixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qiyeoaguanlixitong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'bumen_types','部门',1,'部门1',NULL,NULL,'2022-04-29 13:51:34'),(2,'bumen_types','部门',2,'部门2',NULL,NULL,'2022-04-29 13:51:34'),(3,'bumen_types','部门',3,'部门3',NULL,NULL,'2022-04-29 13:51:34'),(4,'gangwei_types','岗位',1,'岗位1',NULL,NULL,'2022-04-29 13:51:34'),(5,'gangwei_types','岗位',2,'岗位2',NULL,NULL,'2022-04-29 13:51:34'),(6,'gangwei_types','岗位',3,'岗位3',NULL,NULL,'2022-04-29 13:51:34'),(7,'gongzuoshenpi_types','工作类型',1,'工作类型1',NULL,NULL,'2022-04-29 13:51:34'),(8,'gongzuoshenpi_types','工作类型',2,'工作类型2',NULL,NULL,'2022-04-29 13:51:34'),(9,'gongzuoshenpi_types','工作类型',3,'工作类型3',NULL,NULL,'2022-04-29 13:51:34'),(10,'gongzuoshenpi_yesno_types','工作审批状态',1,'未处理',NULL,NULL,'2022-04-29 13:51:34'),(11,'gongzuoshenpi_yesno_types','工作审批状态',2,'通过',NULL,NULL,'2022-04-29 13:51:34'),(12,'gongzuoshenpi_yesno_types','工作审批状态',3,'拒绝',NULL,NULL,'2022-04-29 13:51:34'),(13,'sex_types','性别',1,'男',NULL,NULL,'2022-04-29 13:51:34'),(14,'sex_types','性别',2,'女',NULL,NULL,'2022-04-29 13:51:34'),(15,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-04-29 13:51:34'),(16,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-04-29 13:51:34'),(17,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-04-29 13:51:34'),(18,'gerenbianqian_types','便签类型',1,'便签类型1',NULL,NULL,'2022-04-29 13:51:34'),(19,'gerenbianqian_types','便签类型',2,'便签类型2',NULL,NULL,'2022-04-29 13:51:34'),(20,'gerenbianqian_types','便签类型',3,'便签类型3',NULL,NULL,'2022-04-29 13:51:34'),(21,'richeng_types','日志类型',1,'日志类型1',NULL,NULL,'2022-04-29 13:51:34'),(22,'richeng_types','日志类型',2,'日志类型2',NULL,NULL,'2022-04-29 13:51:34'),(23,'richeng_types','日志类型',3,'日志类型3',NULL,NULL,'2022-04-29 13:51:34');

/*Table structure for table `gerenbianqian` */

DROP TABLE IF EXISTS `gerenbianqian`;

CREATE TABLE `gerenbianqian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `gerenbianqian_name` varchar(200) DEFAULT NULL COMMENT '便签名称 Search111',
  `gerenbianqian_types` int(11) DEFAULT NULL COMMENT '便签类型 Search111',
  `gerenbianqian_content` text COMMENT '日志信息详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='个人便签';

/*Data for the table `gerenbianqian` */

insert  into `gerenbianqian`(`id`,`yonghu_id`,`gerenbianqian_name`,`gerenbianqian_types`,`gerenbianqian_content`,`create_time`) values (1,1,'便签名称1',1,'日志信息详情1','2022-04-29 13:55:08'),(2,1,'便签名称2',2,'日志信息详情2','2022-04-29 13:55:08'),(3,3,'便签名称3',2,'日志信息详情3','2022-04-29 13:55:08'),(4,2,'便签名称4',2,'日志信息详情4','2022-04-29 13:55:08'),(5,3,'便签名称5',2,'日志信息详情5','2022-04-29 13:55:08');

/*Table structure for table `gongzuoshenpi` */

DROP TABLE IF EXISTS `gongzuoshenpi`;

CREATE TABLE `gongzuoshenpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `gongzuoshenpi_name` varchar(200) DEFAULT NULL COMMENT '工作标题 Search111',
  `gongzuoshenpi_types` int(11) DEFAULT NULL COMMENT '工作类型 Search111',
  `gongzuoshenpi_file` varchar(200) DEFAULT NULL COMMENT '工作文件',
  `gongzuoshenpi_text` text COMMENT '工作详情',
  `gongzuoshenpi_yesno_types` int(11) DEFAULT NULL COMMENT '工作审批状态',
  `gongzuoshenpi_yesno_text` text COMMENT '工作审批结果',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='工作审批';

/*Data for the table `gongzuoshenpi` */

insert  into `gongzuoshenpi`(`id`,`yonghu_id`,`gongzuoshenpi_name`,`gongzuoshenpi_types`,`gongzuoshenpi_file`,`gongzuoshenpi_text`,`gongzuoshenpi_yesno_types`,`gongzuoshenpi_yesno_text`,`create_time`) values (1,3,'工作标题1',2,'http://localhost:8080/qiyeOAguanlixitong/upload/file.rar','工作详情1',1,NULL,'2022-04-29 13:55:08'),(2,1,'工作标题2',1,'http://localhost:8080/qiyeOAguanlixitong/upload/file.rar','工作详情2',1,NULL,'2022-04-29 13:55:08'),(3,2,'工作标题3',2,'http://localhost:8080/qiyeOAguanlixitong/upload/file.rar','工作详情3',1,NULL,'2022-04-29 13:55:08'),(4,2,'工作标题4',3,'http://localhost:8080/qiyeOAguanlixitong/upload/file.rar','工作详情4',1,NULL,'2022-04-29 13:55:08'),(5,3,'工作标题5',3,'http://localhost:8080/qiyeOAguanlixitong/upload/file.rar','工作详情5',3,'拒绝1','2022-04-29 13:55:08'),(6,1,'工作标题6',3,'http://localhost:8080/qiyeOAguanlixitong/upload/1651214790719.doc','工作详情6',2,'通过','2022-04-29 14:46:34');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='通知公告';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',1,'http://localhost:8080/qiyeOAguanlixitong/upload/news1.jpg','2022-04-29 13:55:08','公告详情1','2022-04-29 13:55:08'),(2,'公告标题2',2,'http://localhost:8080/qiyeOAguanlixitong/upload/news2.jpg','2022-04-29 13:55:08','公告详情2','2022-04-29 13:55:08'),(3,'公告标题3',1,'http://localhost:8080/qiyeOAguanlixitong/upload/news3.jpg','2022-04-29 13:55:08','公告详情3','2022-04-29 13:55:08'),(4,'公告标题4',1,'http://localhost:8080/qiyeOAguanlixitong/upload/news4.jpg','2022-04-29 13:55:08','公告详情4','2022-04-29 13:55:08'),(5,'公告标题5',1,'http://localhost:8080/qiyeOAguanlixitong/upload/news5.jpg','2022-04-29 13:55:08','公告详情5','2022-04-29 13:55:08');

/*Table structure for table `richeng` */

DROP TABLE IF EXISTS `richeng`;

CREATE TABLE `richeng` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `richeng_richeng` varchar(200) DEFAULT NULL COMMENT '日志标题 Search111',
  `richeng_types` int(11) DEFAULT NULL COMMENT '日志类型 Search111',
  `richeng_time` timestamp NULL DEFAULT NULL COMMENT '日期',
  `richeng_text` text COMMENT '日志信息备注',
  `richeng_content` text COMMENT '日志信息详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='日志信息';

/*Data for the table `richeng` */

insert  into `richeng`(`id`,`yonghu_id`,`richeng_richeng`,`richeng_types`,`richeng_time`,`richeng_text`,`richeng_content`,`create_time`) values (1,1,'日志标题1',1,'2022-04-29 13:55:08','日志信息备注1','日志信息详情1','2022-04-29 13:55:08'),(2,1,'日志标题2',3,'2022-04-29 13:55:08','日志信息备注2','日志信息详情2','2022-04-29 13:55:08'),(3,1,'日志标题3',2,'2022-04-29 13:55:08','日志信息备注3','日志信息详情3','2022-04-29 13:55:08'),(4,2,'日志标题4',2,'2022-04-29 13:55:08','日志信息备注4','日志信息详情4','2022-04-29 13:55:08'),(5,1,'日志标题5',3,'2022-04-29 13:55:08','日志信息备注5','日志信息详情5','2022-04-29 13:55:08');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','skt6rvidognwd9ynm5xciop1xzb65byn','2022-04-29 14:10:25','2022-04-29 15:46:16'),(2,1,'admin','users','管理员','dt3kp8yyxn57f4kmp11m4gxmet5x05v4','2022-04-29 14:11:10','2022-04-29 15:46:56');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `bumen_types` int(11) DEFAULT NULL COMMENT '部门 Search111 ',
  `gangwei_types` int(11) DEFAULT NULL COMMENT '岗位 Search111 ',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`bumen_types`,`gangwei_types`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/qiyeOAguanlixitong/upload/yonghu1.jpg',1,'17703786901','410224199610232001','1@qq.com',2,2,1,'2022-04-29 13:55:08'),(2,'a2','123456','用户姓名2','http://localhost:8080/qiyeOAguanlixitong/upload/yonghu2.jpg',1,'17703786902','410224199610232002','2@qq.com',2,3,1,'2022-04-29 13:55:08'),(3,'a3','123456','用户姓名3','http://localhost:8080/qiyeOAguanlixitong/upload/yonghu3.jpg',2,'17703786903','410224199610232003','3@qq.com',1,2,1,'2022-04-29 13:55:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
