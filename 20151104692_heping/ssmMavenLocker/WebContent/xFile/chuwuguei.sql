/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/10/17 19:50:38                          */
/*==============================================================*/
CREATE DATABASE chuwugui_db ;
USE chuwugui_db ;

DROP TABLE IF EXISTS tb_area;

DROP TABLE IF EXISTS tb_cabinet;

DROP TABLE IF EXISTS tb_charge;

DROP TABLE IF EXISTS tb_locker;

DROP TABLE IF EXISTS tb_record;

DROP TABLE IF EXISTS tb_user;

/*==============================================================*/
/* Table: tb_area                                               */
/*==============================================================*/
CREATE TABLE tb_area
(
   ar_id                INT NOT NULL AUTO_INCREMENT COMMENT 	'地区ID',
   ar_name              VARCHAR(100) COMMENT 		'地区名',
   PRIMARY KEY (ar_id) 
);

/*==============================================================*/
/* Table: tb_cabinet                                            */
/*==============================================================*/
CREATE TABLE tb_cabinet
(
   ca_id                INT NOT NULL AUTO_INCREMENT COMMENT 	'柜子ID',
   lo_id                INT COMMENT 		'储物柜ID（外键）',
   ch_id                INT COMMENT 		'类型ID（外键）',
   ca_whether           VARCHAR(100) COMMENT 		'柜子是否空(1 空,2 满)',
   ca_deadline          VARCHAR(100) COMMENT 		'柜子租凭期限',
   PRIMARY KEY (ca_id)
);

/*==============================================================*/
/* Table: tb_charge                                             */
/*==============================================================*/
CREATE TABLE tb_charge
(
   ch_id                INT NOT NULL AUTO_INCREMENT COMMENT 	'类型ID',
   ch_type              VARCHAR(100) COMMENT 		'储物柜类型(1 大,2 中,3 小)',
   ch_charge            VARCHAR(100) COMMENT 		'储物柜收费',
   ch_overdue           VARCHAR(100) COMMENT 		'储物柜逾期收费',
   PRIMARY KEY (ch_id)
);

/*==============================================================*/
/* Table: tb_locker                                             */
/*==============================================================*/
CREATE TABLE tb_locker
(
   lo_id                INT NOT NULL AUTO_INCREMENT COMMENT	 '储物柜ID',
   ar_id                INT COMMENT 		'地区ID（外键）',
   lo_name              VARCHAR(100) COMMENT 		'储物柜名称',
   lo_phone             VARCHAR(100) COMMENT 		'联系人电话',
   PRIMARY KEY (lo_id)
);

/*==============================================================*/
/* Table: tb_record                                             */
/*==============================================================*/
CREATE TABLE tb_record
(
   re_id                INT NOT NULL AUTO_INCREMENT COMMENT 	'记录ID',
   u_id                 INT COMMENT 				'用户ID（外键）',
   ca_id                INT COMMENT 				'柜子ID（外键）',
   re_deposit           VARCHAR(100) COMMENT 			'存入时间',
   re_out               VARCHAR(100) COMMENT 			'取出时间',
   re_money             VARCHAR(100) COMMENT 			'付款金额',
   re_overdue           VARCHAR(100) COMMENT 			'是否逾期(1 逾期,2 未逾期)',
   re_charge            VARCHAR(100) COMMENT 			'逾期收费金额',
   re_code              VARCHAR(100) COMMENT 			'取件码',
   PRIMARY KEY (re_id)
);

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
CREATE TABLE tb_user
(
   u_id                 INT NOT NULL AUTO_INCREMENT COMMENT 	'用户ID',
   u_zh                 VARCHAR(100) COMMENT 			'账号',
   u_mm                 VARCHAR(100) COMMENT 			'密码',
   u_type               VARCHAR(100) COMMENT 			'用户类型',
   u_upload				VARCHAR(100) COMMENT			'图片',
   u_phone              VARCHAR(100) COMMENT 			'手机号码',
   u_site               VARCHAR(100) COMMENT 			'地址',
   PRIMARY KEY (u_id)
);
--  
-- 增加地区表
INSERT INTO tb_area(ar_name) VALUES("L1");
INSERT INTO tb_area(ar_name) VALUES("L2");
INSERT INTO tb_area(ar_name) VALUES("L3");
INSERT INTO tb_area(ar_name) VALUES("L4");

 
-- 增加楼层储物柜表
INSERT INTO tb_locker(ar_id,lo_name,lo_phone) VALUES(1,"丰巢",13358749864);
INSERT INTO tb_locker(ar_id,lo_name,lo_phone) VALUES(2,"丰巢",13587439865);
INSERT INTO tb_locker(ar_id,lo_name,lo_phone) VALUES(3,"丰巢",15825367424);
INSERT INTO tb_locker(ar_id,lo_name,lo_phone) VALUES(4,"丰巢",18599377234);

 
-- 增加柜子表
-- 储物柜名 类型大小 储物柜是否为空 期限
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(1,3,"满","3");

INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(2,3,"空","3");


INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(3,3,"空","3");


INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"满","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"满","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,1,"空","1");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,2,"空","2");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");
INSERT INTO tb_cabinet(lo_id,ch_id,ca_whether,ca_deadline) VALUES(4,3,"空","3");


 
-- 增加类型表
INSERT INTO tb_charge(ch_type,ch_charge,ch_overdue) VALUES("大","10","20");
INSERT INTO tb_charge(ch_type,ch_charge,ch_overdue) VALUES("中","7","14");
INSERT INTO tb_charge(ch_type,ch_charge,ch_overdue) VALUES("小","5","10");

 
-- 增加用户表
INSERT INTO tb_user(u_zh,u_mm,u_type,u_phone,u_site) VALUES('张三','123456','1','12345678910','测试');
INSERT INTO tb_user(u_zh,u_mm,u_type,u_phone,u_site) VALUES('李四','123456','2','12345678910','测试');
