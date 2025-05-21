CREATE DATABASE IF NOT EXISTS project_db CHARACTER SET utf8;
USE `project_db`;
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '链接',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '轮播图',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `user_group` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户组',
  `mod_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块名',
  `table_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '表名',
  `page_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '页面标题',
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '路由路径',
  `parent` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '父级菜单',
  `parent_sort` int(10) NOT NULL DEFAULT '0' COMMENT '父级菜单排序',
  `position` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '位置',
  `mode` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '_blank' COMMENT '跳转方式',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看',
  `field_add` text CHARACTER SET utf8 COMMENT '添加字段',
  `field_set` text CHARACTER SET utf8 COMMENT '修改字段',
  `field_get` text CHARACTER SET utf8 COMMENT '查询字段',
  `table_nav_name` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '跨表导航名称',
  `table_nav` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '跨表导航',
  `option` text CHARACTER SET utf8 COMMENT '配置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `logistics_delivery`;
CREATE TABLE `logistics_delivery` (
  `logistics_delivery_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流配送ID',
  `order_number` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单号',
  `product_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `purchase_quantity` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '购买数量',
  `total_transaction_amount` double(10,2) DEFAULT '0.00' COMMENT '交易总额',
  `the_date_of_issuance` date DEFAULT NULL COMMENT '发货日期',
  `delivery_number` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '配送订单',
  `ordinary_users` int(11) DEFAULT '0' COMMENT '普通用户',
  `shipping_address` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货地址',
  `delivery_status` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '配送状态',
  `signing_status` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '签收状态',
  `recommend` int(11) NOT NULL DEFAULT '0' COMMENT '智能推荐',
  `contact_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人名字',
  `merchant_id` int(11) DEFAULT NULL COMMENT '商家id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`logistics_delivery_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='物流配送';
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `title` varchar(125) DEFAULT NULL COMMENT '标题',
  `img` text COMMENT '封面图：用于显示于产品列表页',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `price_ago` double(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` double(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '卖价',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '商品分类',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `content` longtext COMMENT '正文',
  `img_1` text COMMENT '主图1',
  `img_2` text COMMENT '主图2',
  `img_3` text COMMENT '主图3',
  `img_4` text COMMENT '主图4',
  `img_5` text COMMENT '主图5',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `customize_field` text COMMENT '自定义字段',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `user_id` int(11) unsigned DEFAULT '0' COMMENT '添加人',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品信息';
insert into `goods` values ('1','测试商品1','/upload/goods.jpg','测试商品1','110.0','99.0','0','80','分类一','0','<p>测试商品1</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','5','1','0');
insert into `goods` values ('2','测试商品2','/upload/goods.jpg','测试商品2','220.0','110.0','0','10','分类二','0','<p>测试商品2</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','6','1','0');
insert into `goods` values ('3','测试商品3','/upload/goods.jpg','测试商品3','20.0','10.0','0','10','分类二','0','<p>测试商品3</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','7','1','0');
insert into `goods` values ('4','测试商品4','/upload/goods.jpg','测试商品4','199.0','99.0','0','20','分类二','0','<p>测试商品4</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','8','1','0');
insert into `goods` values ('5','测试商品5','/upload/goods.jpg','测试商品5','110.0','99.0','0','30','分类二','0','<p>测试商品5</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','9','1','0');
insert into `goods` values ('6','测试商品6','/upload/goods.jpg','测试商品6','999.0','888.0','0','40','分类三','0','<p>测试商品6</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','10','1','0');
insert into `goods` values ('7','测试商品7','/upload/goods.jpg','测试商品7','20.0','220.0','0','110','分类一','0','<p>测试商品7</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 16:21:46.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','11','1','0');
insert into `goods` values ('8','测试商品8','/upload/goods.jpg','测试商品8','20.0','30.0','0','30','分类二','0','<p>测试商品8</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','12','1','0');
insert into `goods` values ('9','测试商品9','/upload/goods.jpg','测试商品9','40.0','35.0','0','20','分类三','0','<p>测试商品9</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','13','1','0');
insert into `goods` values ('10','测试商品10','/upload/goods.jpg','测试商品10','50.0','45.0','0','80','分类一','0','<p>测试商品10</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','14','1','0');
insert into `goods` values ('11','测试商品11','/upload/goods.jpg','测试商品11','60.0','50.0','0','10','分类二','0','<p>测试商品11</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','15','1','0');
insert into `goods` values ('12','测试商品12','/upload/goods.jpg','测试商品12','70.0','60.0','0','30','分类三','0','<p>测试商品12</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-30 18:21:49.0','2025-04-30 15:52:28.0','[{"field_name":"品牌","field_value":""},{"field_name":"规格","field_value":""}]','mall_center','mall_center_id','16','1','0');
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `title` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '图片',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `state` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：使用中，已失效',
  `price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `price_ago` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price_count` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `num` int(8) unsigned NOT NULL DEFAULT '1' COMMENT '数量',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `type` varchar(64) NOT NULL DEFAULT '未分类' COMMENT '商品分类',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='购物车';
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单号',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品标题',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品图片',
  `price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price_ago` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `num` int(8) NOT NULL DEFAULT '1' COMMENT '数量',
  `price_count` double(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价',
  `norms` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '规格',
  `type` varchar(64) NOT NULL DEFAULT '未分类' COMMENT '商品分类',
  `contact_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人姓名',
  `contact_email` varchar(125) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人邮箱',
  `contact_phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人手机',
  `contact_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件地址',
  `postal_code` varchar(9) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `merchant_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商家ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `state` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '待付款' COMMENT '订单状态：待付款，待发货，待签收，已签收，待退款，已退款，已拒绝，已完成',
  `remark` text CHARACTER SET utf8 COMMENT '订单备注',
  `delivery_state` varchar(16) CHARACTER SET utf8 DEFAULT '未配送' COMMENT '发货状态：未配送，已配送',
  `vip_discount` double(10,2) DEFAULT '0.00' COMMENT '折扣',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `buy_type` tinyint(2) DEFAULT NULL COMMENT '1-全额购买，2-积分兑换，3-钱包购买',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单';
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序',
  `name` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户组';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `content` longtext COMMENT '正文',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '临时访问牌',
  `info` text CHARACTER SET utf8 COMMENT '信息',
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
DROP TABLE IF EXISTS `code_token`;
CREATE TABLE `code_token` (
  `code_token_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '验证码ID',
  `token` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '令牌',
  `code` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '验证码',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '失效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`code_token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='验证码';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '封面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(125) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货地址',
  `name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `phone` varchar(13) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `postcode` varchar(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认判断',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='收货地址';
insert into `address` values ('3','田七','13590509090',null,'广州市越秀区东风西路187号','1','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0',1);
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` text COMMENT '分类图标',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `order_after_sale`;
CREATE TABLE `order_after_sale` (
  `order_after_sale_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单售后ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_number` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单号',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品标题',
  `price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price_ago` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `num` int(8) NOT NULL DEFAULT '1' COMMENT '数量',
  `price_count` double(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `merchant_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商家ID',
  `state` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '待付款' COMMENT '订单状态：待付款，待发货，待签收，已签收，待退款，已退款，已拒绝，已完成',
  `after_state` varchar(16) CHARACTER SET utf8 DEFAULT '未审核' COMMENT '售后状态：未审核，未通过，已通过',
  `after_state_reply` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '售后回复',
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '售后类型',
  `content_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '售后内容',
  `imgs` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '售后凭证',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `buy_type` tinyint(2) DEFAULT NULL COMMENT '1-全额购买，2-积分兑换，3-钱包购买',
  PRIMARY KEY (`order_after_sale_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='订单售后';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID',
  `content` longtext CHARACTER SET utf8 COMMENT '内容',
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品类型';
insert into `goods_type` values ('1','0','分类一','','',null,null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `goods_type` values ('2','0','分类二','','',null,null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `goods_type` values ('3','0','分类三','','',null,null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：(1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '所在用户组',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号码',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：(0未认证|1审核中|2已认证)',
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(16) CHARACTER SET utf8 DEFAULT '' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '邮箱',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：(0未认证|1审核中|2已认证)',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `open_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '针对获取用户信息字段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `vip_level` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级',
  `vip_discount` double(10,2) DEFAULT '0.00' COMMENT '会员折扣',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `balance` double(10,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户账户';
insert into `user` values ('1','1','管理员','2025-04-06 17:25:22.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg',null,'2025-04-30 17:35:13.0',null,'0.0','0','0.0');
ALTER TABLE `user` DROP COLUMN balance;
ALTER TABLE `user` DROP COLUMN integral;
ALTER TABLE `user` DROP COLUMN vip_level;
ALTER TABLE `user` DROP COLUMN vip_discount;
UPDATE `user` SET password = 'asd123';
ALTER TABLE `order` DROP COLUMN integral;
ALTER TABLE `order` DROP COLUMN buy_type;
ALTER TABLE `order_after_sale` DROP COLUMN integral;
ALTER TABLE `order_after_sale` DROP COLUMN buy_type;
ALTER TABLE `goods` DROP COLUMN integral;
UPDATE `goods` SET `img` =  '/api/upload/1874005080802328576.jpg' WHERE goods_id = 1;
UPDATE `goods` SET `img` =  '/api/upload/1874003557364006912.jpg' WHERE goods_id = 2;
UPDATE `goods` SET `img` =  '/api/upload/1874002771653427201.jpg' WHERE goods_id = 3;
UPDATE `goods` SET `img` =  '/api/upload/1874003904824344576.jpg' WHERE goods_id = 4;
UPDATE `goods` SET `img` =  '/api/upload/1874002804633239553.jpg' WHERE goods_id = 5;
UPDATE `goods` SET `img` =  '/api/upload/1874003626964287488.jpg' WHERE goods_id = 6;
UPDATE `goods` SET `img` =  '/api/upload/1874002747754283008.jpg' WHERE goods_id = 7;
UPDATE `goods` SET `img` =  '/api/upload/1874003517564256257.jpg' WHERE goods_id = 8;
UPDATE `goods` SET `img` =  '/api/upload/1874004839764066305.jpg' WHERE goods_id = 9;
UPDATE `goods` SET `img` =  '/api/upload/1874003502758363136.jpg' WHERE goods_id = 10;
UPDATE `goods` SET `img` =  '/api/upload/1874004654556184576.jpg' WHERE goods_id = 11;
UPDATE `goods` SET `img` =  '/api/upload/1874000684530008064.jpg' WHERE goods_id = 12;
UPDATE user SET avatar = '/api/upload/admin_avatar.jpg';
DROP TABLE IF EXISTS `registered_user`;
CREATE TABLE `registered_user`(registered_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '注册用户ID',
`user_name` varchar(64) comment '用户姓名',
`contact_information` varchar(16) comment '联系方式',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (registered_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '注册用户';
insert into `registered_user` values (1,'用户姓名1','18051780210','已通过',2,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu1','yonghu1','asd123','/api/upload/default_avatar.jpg');
insert into `registered_user` values (2,'用户姓名2','17185779694','已通过',3,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu2','yonghu2','asd123','/api/upload/default_avatar.jpg');
insert into `registered_user` values (3,'用户姓名3','17543060802','已通过',4,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu3','yonghu3','asd123','/api/upload/default_avatar.jpg');

DROP TABLE IF EXISTS `vehicle_information`;
CREATE TABLE `vehicle_information`(vehicle_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆信息ID',
`vehicle_no` varchar(64) NOT NULL UNIQUE comment '车辆编号',
`vehicle_name` varchar(64) comment '车辆名称',
`vehicle_model` varchar(64) comment '车辆型号',
`vehicle_brand` varchar(64) comment '车辆品牌',
`vehicle_price` double(8,2) DEFAULT 0 comment '车辆价格',
`vehicle_picture` varchar(255) comment '车辆图片',
`vehicle_introduction` text comment '车辆介绍',
`vehicle_condition` text comment '车辆情况',
`vehicle_details` longtext comment '车辆详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`collect_len` int(11) DEFAULT 0 NOT NULL comment '收藏数',
`comment_len` int(11) DEFAULT 0 NOT NULL comment '评论数',
`vehicle_reservation_limit_times` int(8) DEFAULT 0 NOT NULL comment '预订限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (vehicle_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '车辆信息';
insert into `vehicle_information` values (1,'车辆编号1','车辆名称1','车辆型号1','车辆品牌1',1,'/api/upload/1811238271531876353.jpg','车辆介绍1','车辆情况1','此处可上传文字、图片、视频、超链接等内容区1',573,37,410,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (2,'车辆编号2','车辆名称2','车辆型号2','车辆品牌2',2,'/api/upload/1811238535206797312.jpg','车辆介绍2','车辆情况2','此处可上传文字、图片、视频、超链接等内容区2',429,953,200,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (3,'车辆编号3','车辆名称3','车辆型号3','车辆品牌3',3,'/api/upload/1811238581985869825.jpg','车辆介绍3','车辆情况3','此处可上传文字、图片、视频、超链接等内容区3',236,160,494,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (4,'车辆编号4','车辆名称4','车辆型号4','车辆品牌4',4,'/api/upload/1811239458192752640.jpg','车辆介绍4','车辆情况4','此处可上传文字、图片、视频、超链接等内容区4',966,560,865,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (5,'车辆编号5','车辆名称5','车辆型号5','车辆品牌5',5,'/api/upload/1811238678404530177.jpg','车辆介绍5','车辆情况5','此处可上传文字、图片、视频、超链接等内容区5',302,312,318,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (6,'车辆编号6','车辆名称6','车辆型号6','车辆品牌6',6,'/api/upload/1811238625849901056.jpg','车辆介绍6','车辆情况6','此处可上传文字、图片、视频、超链接等内容区6',824,752,284,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (7,'车辆编号7','车辆名称7','车辆型号7','车辆品牌7',7,'/api/upload/1811238394768916480.jpg','车辆介绍7','车辆情况7','此处可上传文字、图片、视频、超链接等内容区7',776,919,150,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (8,'车辆编号8','车辆名称8','车辆型号8','车辆品牌8',8,'/api/upload/1811238447461957632.jpg','车辆介绍8','车辆情况8','此处可上传文字、图片、视频、超链接等内容区8',558,212,794,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (9,'车辆编号9','车辆名称9','车辆型号9','车辆品牌9',9,'/api/upload/1811239403041849345.jpg','车辆介绍9','车辆情况9','此处可上传文字、图片、视频、超链接等内容区9',47,257,753,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (10,'车辆编号10','车辆名称10','车辆型号10','车辆品牌10',10,'/api/upload/1811238489010733057.jpg','车辆介绍10','车辆情况10','此处可上传文字、图片、视频、超链接等内容区10',315,715,10,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (11,'车辆编号11','车辆名称11','车辆型号11','车辆品牌11',11,'/api/upload/1811238327458725888.jpg','车辆介绍11','车辆情况11','此处可上传文字、图片、视频、超链接等内容区11',423,945,909,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_information` values (12,'车辆编号12','车辆名称12','车辆型号12','车辆品牌12',12,'/api/upload/1811239503340240896.jpg','车辆介绍12','车辆情况12','此处可上传文字、图片、视频、超链接等内容区12',38,934,408,0,0,'2025-04-29 17:24:21','2025-04-29 17:24:21');

DROP TABLE IF EXISTS `vehicle_reservation`;
CREATE TABLE `vehicle_reservation`(vehicle_reservation_id int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆预订ID',
`vehicle_no` varchar(64) comment '车辆编号',
`vehicle_name` varchar(64) comment '车辆名称',
`vehicle_model` varchar(64) comment '车辆型号',
`vehicle_brand` varchar(64) comment '车辆品牌',
`vehicle_price` double(8,2) DEFAULT 0 comment '车辆价格',
`registered_user` int(11) DEFAULT 0 comment '注册用户',
`user_name` varchar(64) comment '用户姓名',
`contact_information` varchar(64) comment '联系方式',
`booking_quantity` double(8,2) DEFAULT 0 comment '预订数量',
`reservation_remarks` text comment '预订备注',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (vehicle_reservation_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '车辆预订';
insert into `vehicle_reservation` values (1,'车辆编号1','车辆名称1','车辆型号1','车辆品牌1',1,0,'用户姓名1','联系方式1',1,'预订备注1','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (2,'车辆编号2','车辆名称2','车辆型号2','车辆品牌2',2,0,'用户姓名2','联系方式2',2,'预订备注2','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (3,'车辆编号3','车辆名称3','车辆型号3','车辆品牌3',3,0,'用户姓名3','联系方式3',3,'预订备注3','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (4,'车辆编号4','车辆名称4','车辆型号4','车辆品牌4',4,0,'用户姓名4','联系方式4',4,'预订备注4','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (5,'车辆编号5','车辆名称5','车辆型号5','车辆品牌5',5,0,'用户姓名5','联系方式5',5,'预订备注5','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (6,'车辆编号6','车辆名称6','车辆型号6','车辆品牌6',6,0,'用户姓名6','联系方式6',6,'预订备注6','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (7,'车辆编号7','车辆名称7','车辆型号7','车辆品牌7',7,0,'用户姓名7','联系方式7',7,'预订备注7','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (8,'车辆编号8','车辆名称8','车辆型号8','车辆品牌8',8,0,'用户姓名8','联系方式8',8,'预订备注8','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (9,'车辆编号9','车辆名称9','车辆型号9','车辆品牌9',9,0,'用户姓名9','联系方式9',9,'预订备注9','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (10,'车辆编号10','车辆名称10','车辆型号10','车辆品牌10',10,0,'用户姓名10','联系方式10',10,'预订备注10','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (11,'车辆编号11','车辆名称11','车辆型号11','车辆品牌11',11,0,'用户姓名11','联系方式11',11,'预订备注11','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `vehicle_reservation` values (12,'车辆编号12','车辆名称12','车辆型号12','车辆品牌12',12,0,'用户姓名12','联系方式12',12,'预订备注12','2025-04-29 17:24:21','2025-04-29 17:24:21');

DROP TABLE IF EXISTS `auto_mall`;
CREATE TABLE `auto_mall`(auto_mall_id int(11) NOT NULL AUTO_INCREMENT COMMENT '汽车商城ID',
`car_name` varchar(64) comment '汽车名称',
`model` varchar(64) comment '车型',
`parameters` varchar(64) comment '参数',
`collect_len` int(11) DEFAULT 0 NOT NULL comment '收藏数',
`comment_len` int(11) DEFAULT 0 NOT NULL comment '评论数',
`cart_title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
`cart_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面图',
`cart_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
`cart_price_ago` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价',
`cart_price` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '卖价',
`cart_inventory` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
`cart_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未分类' COMMENT '商品分类',
`cart_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文',
`cart_img_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主图1',
`cart_img_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主图2',
`cart_img_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主图3',
`cart_img_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主图4',
`cart_img_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主图5',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (auto_mall_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '汽车商城';
insert into `auto_mall` values (1,'汽车名称1','车型1','参数1',586,0,'测试商品1','/api/upload/1874005080802328576.jpg','测试商品1','110.00','99.00','80','分类一','<p>测试商品1</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (2,'汽车名称2','车型2','参数2',610,0,'测试商品2','/api/upload/1874003557364006912.jpg','测试商品2','220.00','110.00','10','分类二','<p>测试商品2</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (3,'汽车名称3','车型3','参数3',75,0,'测试商品3','/api/upload/1874002771653427201.jpg','测试商品3','20.00','10.00','10','分类二','<p>测试商品3</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (4,'汽车名称4','车型4','参数4',72,0,'测试商品4','/api/upload/1874003904824344576.jpg','测试商品4','199.00','99.00','20','分类二','<p>测试商品4</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (5,'汽车名称5','车型5','参数5',683,0,'测试商品5','/api/upload/1874002804633239553.jpg','测试商品5','110.00','99.00','30','分类二','<p>测试商品5</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (6,'汽车名称6','车型6','参数6',440,0,'测试商品6','/api/upload/1874003626964287488.jpg','测试商品6','999.00','888.00','40','分类三','<p>测试商品6</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (7,'汽车名称7','车型7','参数7',303,0,'测试商品7','/api/upload/1874002747754283008.jpg','测试商品7','20.00','220.00','110','分类一','<p>测试商品7</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (8,'汽车名称8','车型8','参数8',889,0,'测试商品8','/api/upload/1874003517564256257.jpg','测试商品8','20.00','30.00','30','分类二','<p>测试商品8</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (9,'汽车名称9','车型9','参数9',349,0,'测试商品9','/api/upload/1874004839764066305.jpg','测试商品9','40.00','35.00','20','分类三','<p>测试商品9</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (10,'汽车名称10','车型10','参数10',220,0,'测试商品10','/api/upload/1874003502758363136.jpg','测试商品10','50.00','45.00','80','分类一','<p>测试商品10</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (11,'汽车名称11','车型11','参数11',471,0,'测试商品11','/api/upload/1874004654556184576.jpg','测试商品11','60.00','50.00','10','分类二','<p>测试商品11</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `auto_mall` values (12,'汽车名称12','车型12','参数12',437,0,'测试商品12','/api/upload/1874000684530008064.jpg','测试商品12','70.00','60.00','30','分类三','<p>测试商品12</p>','/upload/img_1.jpg','/upload/img_2.jpg','/upload/img_3.jpg','/upload/img_4.jpg','/upload/img_5.jpg','2025-04-29 17:24:21','2025-04-29 17:24:21');

update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称1"},{"field_name":"车型","field_value":"车型1"},{"field_name":"参数","field_value":"参数1"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 1 where goods_id = 1;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称2"},{"field_name":"车型","field_value":"车型2"},{"field_name":"参数","field_value":"参数2"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 2 where goods_id = 2;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称3"},{"field_name":"车型","field_value":"车型3"},{"field_name":"参数","field_value":"参数3"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 3 where goods_id = 3;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称4"},{"field_name":"车型","field_value":"车型4"},{"field_name":"参数","field_value":"参数4"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 4 where goods_id = 4;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称5"},{"field_name":"车型","field_value":"车型5"},{"field_name":"参数","field_value":"参数5"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 5 where goods_id = 5;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称6"},{"field_name":"车型","field_value":"车型6"},{"field_name":"参数","field_value":"参数6"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 6 where goods_id = 6;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称7"},{"field_name":"车型","field_value":"车型7"},{"field_name":"参数","field_value":"参数7"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 7 where goods_id = 7;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称8"},{"field_name":"车型","field_value":"车型8"},{"field_name":"参数","field_value":"参数8"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 8 where goods_id = 8;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称9"},{"field_name":"车型","field_value":"车型9"},{"field_name":"参数","field_value":"参数9"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 9 where goods_id = 9;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称10"},{"field_name":"车型","field_value":"车型10"},{"field_name":"参数","field_value":"参数10"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 10 where goods_id = 10;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称11"},{"field_name":"车型","field_value":"车型11"},{"field_name":"参数","field_value":"参数11"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 11 where goods_id = 11;
update `goods` set customize_field = '[{"field_name":"汽车名称","field_value":"汽车名称12"},{"field_name":"车型","field_value":"车型12"},{"field_name":"参数","field_value":"参数12"}]' , source_table = 'auto_mall' , source_field = 'auto_mall_id' , source_id = 12 where goods_id = 12;
DROP TABLE IF EXISTS `delivery_arrangements`;
CREATE TABLE `delivery_arrangements`(delivery_arrangements_id int(11) NOT NULL AUTO_INCREMENT COMMENT '交付安排ID',
`order_number` varchar(64) NOT NULL comment '订单编号',
`car_name` varchar(64) NOT NULL comment '汽车名称',
`registered_user` int(11) DEFAULT 0 comment '注册用户',
`user_name` varchar(64) comment '用户姓名',
`contact_information` varchar(64) comment '联系方式',
`delivery_time` datetime comment '交付时间',
`delivery_location` varchar(64) NOT NULL comment '交付地点',
`delivery_arrangements` text NOT NULL comment '交付安排',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (delivery_arrangements_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '交付安排';
insert into `delivery_arrangements` values (1,'订单编号1','汽车名称1',0,'用户姓名1','联系方式1','2025-04-29 17:24:21','交付地点1','交付安排1','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (2,'订单编号2','汽车名称2',0,'用户姓名2','联系方式2','2025-04-29 17:24:21','交付地点2','交付安排2','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (3,'订单编号3','汽车名称3',0,'用户姓名3','联系方式3','2025-04-29 17:24:21','交付地点3','交付安排3','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (4,'订单编号4','汽车名称4',0,'用户姓名4','联系方式4','2025-04-29 17:24:21','交付地点4','交付安排4','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (5,'订单编号5','汽车名称5',0,'用户姓名5','联系方式5','2025-04-29 17:24:21','交付地点5','交付安排5','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (6,'订单编号6','汽车名称6',0,'用户姓名6','联系方式6','2025-04-29 17:24:21','交付地点6','交付安排6','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (7,'订单编号7','汽车名称7',0,'用户姓名7','联系方式7','2025-04-29 17:24:21','交付地点7','交付安排7','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (8,'订单编号8','汽车名称8',0,'用户姓名8','联系方式8','2025-04-29 17:24:21','交付地点8','交付安排8','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (9,'订单编号9','汽车名称9',0,'用户姓名9','联系方式9','2025-04-29 17:24:21','交付地点9','交付安排9','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (10,'订单编号10','汽车名称10',0,'用户姓名10','联系方式10','2025-04-29 17:24:21','交付地点10','交付安排10','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (11,'订单编号11','汽车名称11',0,'用户姓名11','联系方式11','2025-04-29 17:24:21','交付地点11','交付安排11','2025-04-29 17:24:21','2025-04-29 17:24:21');
insert into `delivery_arrangements` values (12,'订单编号12','汽车名称12',0,'用户姓名12','联系方式12','2025-04-29 17:24:21','交付地点12','交付安排12','2025-04-29 17:24:21','2025-04-29 17:24:21');

DROP TABLE IF EXISTS `user_complaints`;
CREATE TABLE `user_complaints`(user_complaints_id int(11) NOT NULL AUTO_INCREMENT COMMENT '用户投诉ID',
`registered_user` int(11) DEFAULT 0 comment '注册用户',
`user_name` varchar(64) comment '用户姓名',
`complaint_title` varchar(64) NOT NULL comment '投诉标题',
`complaint_time` datetime comment '投诉时间',
`complaint_content` text NOT NULL comment '投诉内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (user_complaints_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '用户投诉';
insert into `user_complaints` values (1,0,'用户姓名1','投诉标题1','2025-04-29 17:24:22','投诉内容1','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (2,0,'用户姓名2','投诉标题2','2025-04-29 17:24:22','投诉内容2','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (3,0,'用户姓名3','投诉标题3','2025-04-29 17:24:22','投诉内容3','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (4,0,'用户姓名4','投诉标题4','2025-04-29 17:24:22','投诉内容4','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (5,0,'用户姓名5','投诉标题5','2025-04-29 17:24:22','投诉内容5','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (6,0,'用户姓名6','投诉标题6','2025-04-29 17:24:22','投诉内容6','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (7,0,'用户姓名7','投诉标题7','2025-04-29 17:24:22','投诉内容7','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (8,0,'用户姓名8','投诉标题8','2025-04-29 17:24:22','投诉内容8','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (9,0,'用户姓名9','投诉标题9','2025-04-29 17:24:22','投诉内容9','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (10,0,'用户姓名10','投诉标题10','2025-04-29 17:24:22','投诉内容10','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (11,0,'用户姓名11','投诉标题11','2025-04-29 17:24:22','投诉内容11','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');
insert into `user_complaints` values (12,0,'用户姓名12','投诉标题12','2025-04-29 17:24:22','投诉内容12','已通过','','2025-04-29 17:24:22','2025-04-29 17:24:22');

ALTER TABLE `vehicle_reservation` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
insert into `auth` values ('1','管理员','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','1','1','1','1','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{"examine":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('2','管理员','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','1','1','1','1','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('3','管理员','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('4','管理员','车辆信息','vehicle_information','信息详情','/vehicle_information/view','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('5','管理员','车辆信息','vehicle_information','车辆信息','/vehicle_information/list','','0','top','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('6','管理员','车辆信息','vehicle_information','信息详情','/vehicle_information/details','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('7','管理员','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/table','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('8','管理员','车辆预订','vehicle_reservation','预订详情','/vehicle_reservation/view','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('9','管理员','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/edit','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('10','管理员','汽车商城','auto_mall','汽车商城','/auto_mall/table','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('11','管理员','汽车商城','auto_mall','商城详情','/auto_mall/view','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('12','管理员','汽车商城','auto_mall','汽车商城','/auto_mall/list','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"cart_page":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('13','管理员','汽车商城','auto_mall','商城详情','/auto_mall/details','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_comment":true,"can_show_comment":true,"cart_page":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('14','管理员','交付安排','delivery_arrangements','交付安排','/delivery_arrangements/table','','0','','_blank','1','1','1','1','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('15','管理员','交付安排','delivery_arrangements','安排详情','/delivery_arrangements/view','','0','','_blank','1','1','1','1','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('16','管理员','用户投诉','user_complaints','用户投诉','/user_complaints/table','','0','','_blank','1','1','1','1','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{"examine":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('17','管理员','用户投诉','user_complaints','投诉详情','/user_complaints/view','','0','','_blank','1','1','1','1','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('18','管理员','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('19','管理员','订单','order','订单列表','/order/table','','0','','_blank','1','1','1','1','','','',null,'0','{"figure":true,"print":true,"export_db":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('20','管理员','订单','order','订单详情','/order/view','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('21','管理员','订单','order','我的订单','/order/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('22','管理员','订单','order','订单详情','/order/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_score":true,"can_show_comment":true,"can_show_score":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('23','管理员','商品','goods','商品列表','/goods/table','','0','','_blank','1','1','1','1','','','',null,'0','{"seller":true,"print":true,"export_db":true,"import_db":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('24','管理员','商品','goods','商品详情','/goods/view','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('25','管理员','商品','goods','商品列表','/goods/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('26','管理员','商品','goods','商品详情','/goods/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_score":true,"can_show_comment":true,"can_show_score":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('27','管理员','收货地址','address','收货地址','/address/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('28','管理员','收货地址','address','地址详情','/address/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('29','管理员','配送','logistics_delivery','订单配送','/logistics_delivery/table','','0','','_blank','1','1','1','1','','','',null,'0','{"sign_for":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('30','管理员','配送','logistics_delivery','订单配送','/logistics_delivery/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('31','管理员','售后','order_after_sale','订单售后','/order_after_sale/table','','0','','_blank','1','1','1','1','','','',null,'0','{"examine":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('32','管理员','售后','order_after_sale','订单售后','/order_after_sale/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('33','管理员','评论','comment','评论列表','/comment/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('34','管理员','评论','comment','评论详情','/comment/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('35','管理员','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('36','管理员','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('37','管理员','汽车资讯','article','汽车资讯','/article/table','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('38','管理员','汽车资讯','article','资讯详情','/article/view','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('39','管理员','汽车资讯','article','汽车资讯','/article/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('40','管理员','汽车资讯','article','资讯详情','/article/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('41','管理员','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('42','管理员','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('43','管理员','网站公告','notice','网站公告','/notice/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('44','管理员','网站公告','notice','公告详情','/notice/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('45','管理员','网站公告','notice','网站公告','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('46','管理员','网站公告','notice','公告详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('47','游客','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','1','0','0','0','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('48','游客','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','1','0','0','0','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('49','游客','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('50','游客','车辆信息','vehicle_information','信息详情','/vehicle_information/view','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('51','游客','车辆信息','vehicle_information','车辆信息','/vehicle_information/list','','0','top','_blank','0','0','0','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('52','游客','车辆信息','vehicle_information','信息详情','/vehicle_information/details','','0','','_blank','0','0','0','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('53','游客','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/table','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('54','游客','车辆预订','vehicle_reservation','预订详情','/vehicle_reservation/view','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('55','游客','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/edit','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('56','游客','汽车商城','auto_mall','汽车商城','/auto_mall/table','','0','','_blank','0','0','0','0','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('57','游客','汽车商城','auto_mall','商城详情','/auto_mall/view','','0','','_blank','0','0','0','0','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('58','游客','汽车商城','auto_mall','汽车商城','/auto_mall/list','','0','','_blank','0','0','0','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"cart_page":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('59','游客','汽车商城','auto_mall','商城详情','/auto_mall/details','','0','','_blank','0','0','0','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_comment":false,"can_show_comment":false,"cart_page":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('60','游客','交付安排','delivery_arrangements','交付安排','/delivery_arrangements/table','','0','','_blank','0','0','0','0','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('61','游客','交付安排','delivery_arrangements','安排详情','/delivery_arrangements/view','','0','','_blank','0','0','0','0','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('62','游客','用户投诉','user_complaints','用户投诉','/user_complaints/table','','0','','_blank','0','0','0','0','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('63','游客','用户投诉','user_complaints','投诉详情','/user_complaints/view','','0','','_blank','0','0','0','0','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('64','游客','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('65','游客','订单','order','订单列表','/order/table','','0','','_blank','0','0','0','0','','','',null,'0','{"figure":false,"print":false,"export_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('66','游客','订单','order','订单详情','/order/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('67','游客','订单','order','我的订单','/order/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('68','游客','订单','order','订单详情','/order/details','','0','','_blank','0','0','0','0','','','',null,'0','{"can_comment":false,"can_score":false,"can_show_comment":false,"can_show_score":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('69','游客','商品','goods','商品列表','/goods/table','','0','','_blank','0','0','0','0','','','',null,'0','{"seller":false,"print":false,"export_db":false,"import_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('70','游客','商品','goods','商品详情','/goods/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('71','游客','商品','goods','商品列表','/goods/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('72','游客','商品','goods','商品详情','/goods/details','','0','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_score":false,"can_show_comment":false,"can_show_score":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('73','游客','收货地址','address','收货地址','/address/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('74','游客','收货地址','address','地址详情','/address/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('75','游客','配送','logistics_delivery','订单配送','/logistics_delivery/table','','0','','_blank','0','0','0','0','','','',null,'0','{"sign_for":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('76','游客','配送','logistics_delivery','订单配送','/logistics_delivery/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('77','游客','售后','order_after_sale','订单售后','/order_after_sale/table','','0','','_blank','0','0','0','0','','','',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('78','游客','售后','order_after_sale','订单售后','/order_after_sale/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('79','游客','评论','comment','评论列表','/comment/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('80','游客','评论','comment','评论详情','/comment/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('81','游客','评论','comment','我的评论','/comment/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('82','游客','评论','comment','评论详情','/comment/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('83','游客','汽车资讯','article','汽车资讯','/article/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('84','游客','汽车资讯','article','资讯详情','/article/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('85','游客','汽车资讯','article','汽车资讯','/article/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('86','游客','汽车资讯','article','资讯详情','/article/details','','0','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('87','游客','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('88','游客','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('89','游客','网站公告','notice','网站公告','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('90','游客','网站公告','notice','公告详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('91','游客','网站公告','notice','网站公告','/notice/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('92','游客','网站公告','notice','公告详情','/notice/details','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('93','注册用户','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','0','0','0','0','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('94','注册用户','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','0','0','1','1','user_name,contact_information','user_name,contact_information','user_name,contact_information',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('95','注册用户','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('96','注册用户','车辆信息','vehicle_information','信息详情','/vehicle_information/view','','0','','_blank','0','0','0','0','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('97','注册用户','车辆信息','vehicle_information','车辆信息','/vehicle_information/list','','0','top','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('98','注册用户','车辆信息','vehicle_information','信息详情','/vehicle_information/details','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,vehicle_picture,vehicle_introduction,vehicle_condition,vehicle_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('99','注册用户','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/table','','0','','_blank','0','1','0','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('100','注册用户','车辆预订','vehicle_reservation','预订详情','/vehicle_reservation/view','','0','','_blank','0','1','0','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('101','注册用户','车辆预订','vehicle_reservation','车辆预订','/vehicle_reservation/edit','','0','','_blank','1','1','1','1','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks','vehicle_no,vehicle_name,vehicle_model,vehicle_brand,vehicle_price,registered_user,user_name,contact_information,booking_quantity,reservation_remarks',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('102','注册用户','汽车商城','auto_mall','汽车商城','/auto_mall/table','','0','','_blank','0','0','0','0','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_show_comment":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('103','注册用户','汽车商城','auto_mall','商城详情','/auto_mall/view','','0','','_blank','0','0','0','0','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('104','注册用户','汽车商城','auto_mall','汽车商城','/auto_mall/list','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"cart_page":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('105','注册用户','汽车商城','auto_mall','商城详情','/auto_mall/details','','0','','_blank','1','1','1','1','car_name,model,parameters','car_name,model,parameters','car_name,model,parameters',null,'0','{"can_comment":true,"can_show_comment":true,"cart_page":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('106','注册用户','交付安排','delivery_arrangements','交付安排','/delivery_arrangements/table','','0','','_blank','0','0','0','1','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('107','注册用户','交付安排','delivery_arrangements','安排详情','/delivery_arrangements/view','','0','','_blank','0','0','0','1','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements','order_number,car_name,registered_user,user_name,contact_information,delivery_time,delivery_location,delivery_arrangements',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('108','注册用户','用户投诉','user_complaints','用户投诉','/user_complaints/table','','0','','_blank','1','1','0','1','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('109','注册用户','用户投诉','user_complaints','投诉详情','/user_complaints/view','','0','','_blank','1','1','0','1','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content','registered_user,user_name,complaint_title,complaint_time,complaint_content',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('110','注册用户','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('111','注册用户','订单','order','订单列表','/order/table','','0','','_blank','0','0','0','0','','','',null,'0','{"figure":false,"print":false,"export_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('112','注册用户','订单','order','订单详情','/order/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('113','注册用户','订单','order','我的订单','/order/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('114','注册用户','订单','order','订单详情','/order/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_score":true,"can_show_comment":true,"can_show_score":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('115','注册用户','商品','goods','商品列表','/goods/table','','0','','_blank','0','0','0','0','','','',null,'0','{"seller":false,"print":false,"export_db":false,"import_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('116','注册用户','商品','goods','商品详情','/goods/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('117','注册用户','商品','goods','商品列表','/goods/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('118','注册用户','商品','goods','商品详情','/goods/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_score":true,"can_show_comment":true,"can_show_score":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('119','注册用户','收货地址','address','收货地址','/address/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('120','注册用户','收货地址','address','地址详情','/address/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('121','注册用户','配送','logistics_delivery','订单配送','/logistics_delivery/table','','0','','_blank','0','0','0','1','','','',null,'0','{"sign_for":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('122','注册用户','配送','logistics_delivery','订单配送','/logistics_delivery/view','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('123','注册用户','售后','order_after_sale','订单售后','/order_after_sale/table','','0','','_blank','1','1','1','1','','','',null,'0','{"examine":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('124','注册用户','售后','order_after_sale','订单售后','/order_after_sale/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('125','注册用户','评论','comment','评论列表','/comment/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('126','注册用户','评论','comment','评论详情','/comment/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('127','注册用户','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('128','注册用户','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('129','注册用户','汽车资讯','article','汽车资讯','/article/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('130','注册用户','汽车资讯','article','资讯详情','/article/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('131','注册用户','汽车资讯','article','汽车资讯','/article/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('132','注册用户','汽车资讯','article','资讯详情','/article/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('133','注册用户','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('134','注册用户','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('135','注册用户','网站公告','notice','网站公告','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('136','注册用户','网站公告','notice','公告详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('137','注册用户','网站公告','notice','网站公告','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `auth` values ('138','注册用户','网站公告','notice','公告详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `user_group` values ('3','100','注册用户',null,'registered_user','registered_user_id','0','3','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `collect` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `praise` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `cart` ADD FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE;
ALTER TABLE `order` ADD FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE;
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1811238137976848385.jpg','218','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1811237814822502401.jpg','593','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1811238048403292160.jpg','253','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');
insert into `article` values ('1','海外华媒重庆永川体验无人驾驶：科技让汽车“耳聪目明”','汽车','193','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p>中新网重庆7月10日电 (梁钦卿)APP一键叫车、手机确认、后排落座、系上安全带、点击开启行程，从始发点到目的地。一路上，主驾驶空无一人，方向盘却自主转动。车辆不仅能自动识别红绿灯，对障碍物进行避让，车速也很平稳。</p><p><br></p><p>“行走中国·2024海外华文媒体川渝行”参访团一行10日走进重庆永川，了解“聪明的车”是如何在“智慧的路”上安全行驶的。</p><p><br></p><p>图为海外华文媒体代表在重庆永川了解无人驾驶车。中新网记者何蓬磊摄</p><p>车辆行驶过程中，无人驾驶车的方向盘像科幻电影里那样，自动打轮、摆正，稳稳当当与对面车辆错车、避让行人和自行车……一整套动作行云流水。</p><p>汽车是怎么“看”到信号灯的？西部自动驾驶开放测试与示范运营基地工作人员袁如霞介绍，路口建设有车路协调系统，实时为车辆传递整体路网情况，不仅有前方信号灯的变化，还能提供是否有堵车等信息，让无人驾驶汽车更加“耳聪目明”。</p><p><br></p><p>图为海外华文媒体代表在永川体验无人驾驶车。中新网记者何蓬磊摄</p><p>“行驶过程中，无人驾驶车十分遵守交通规则，不管遇上红绿灯或遇到行人，以及前车减速或停车，车辆都处理得游刃有余，没有急刹或颠簸等不适感受。”科特迪瓦《西非华声》主编金浩表示，汽车屏幕上会实时显示行程、车速和剩余距离以及周边车辆等各种信息，坐在车内，有一种穿越时空之美。</p><p>当前，永川正在提速发展自动驾驶产业，加快建设国家自动驾驶测试服务平台，推进自动驾驶全场景应用示范，高标准举办智能汽车应用场景挑战赛，全力打造西部智能网联新能源汽车城。永川已开放全域1576平方公里、双向1385公里测试道路。当地还开通了L4级自动驾驶公交线，在国内率先实现全车无人自动驾驶商业示范运营。</p><p><br></p><p>图为行驶在永川道路上的无人驾驶车。中新网记者何蓬磊摄</p><p>此外，永川已构建起集“孪生仿真+封闭道路+开放道路”为一体的自动驾驶测试体系，涵盖市政路、快速路、乡村道路、山路等30个典型测试场景，助力企业实现创新成果转化和商业模式闭环。</p><p>谈到乘车感受时，德国欧洲新侨网总编辑高翔说：“十几分钟的行驶过程，平稳舒适，起步、加速、刹车，给我的感受像有个老司机坐在驾驶室。无人驾驶车像一个智能汽车机器人，让永川正在步入智能出行时代。”</p><p>“有了无人驾驶车，感觉未来都不用考驾照了。”罗马尼亚《欧洲侨报》副社长孙雨梅称，虽然之前在社交平台上看到不少人分享过打无人车的经历，但自己体验一次后觉得，科技的快速发展确实为人们带来一个更加多元和充满惊喜的世界。(完)</p><p><br></p><p><br></p>','/api/upload/1811241658600128512.jpg',null);
insert into `article` values ('2','百度无人驾驶出租车在武汉走红 “勺萝卜”价格实惠但需要更智能','汽车','469','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p><strong>《科创板日报》7月10日讯（记者 黄心怡）</strong>针对萝卜快跑在武汉投放了1000辆无人驾驶汽车，已爆单累计600万单等消息。百度内部人士对《科创板日报》记者表示，<strong>600万次为百度萝卜快跑在全国的累计服务单量，今年一季度武汉车辆的总数为500辆，其中全无人驾驶车辆超过300辆</strong>。</p><p><br></p><p>记者注意到，今年5月百度在武汉发布第六代萝卜快跑无人驾驶汽车，车上搭载全球首个支持L4级别无人驾驶应用的自动驾驶大模型。<strong>此次发布的六代无人车计划在武汉首批投放1000辆，加上现有的500多辆无人车，覆盖武汉3000平方公里、近700万人口。这或是市场相关数据传言的由来</strong>。</p><p>目前，萝卜快跑已在北京、武汉、重庆、深圳、上海开展全无人自动驾驶出行服务与测试。而武汉是百度的布局重中之重。百度创始人李彦宏曾透露，预计萝卜快跑将率先在武汉区域内实现UE盈亏平衡。</p><p>“无人驾驶智能汽车是未来交通领域的发展方向，也会涉及车路云的融合协同发展。但同样存在一些挑战，<strong>比如对传统出租车行业产生的影响、无人驾驶系统的安全性等等。我对此报以谨慎乐观的态度</strong>。”有智能网联汽车行业人士对记者表示。</p><p>多名武汉乘客评价萝卜快跑：车辆总体行驶平稳，而且遵守交通规则，但缺点是行驶速度比较慢。对于复杂路况，也没有那么会变通，因而也被戏称为“勺萝卜” （勺是武汉方言，意为笨、不聪明的意思)。</p><p><strong>▌武汉人评“勺萝卜”：行车平稳但速度缓慢、不懂变通</strong></p><p>公开数据显示，武汉市智能网联汽车开放测试道路里程已累计突破3379公里（单向里程），覆盖武汉12个行政区，辐射面积约3000平方公里。自动驾驶累计出行服务订单突破158万单，累计服务198万余人次。</p><p>曾乘坐萝卜快跑的武汉用户告诉记者，上车输入手机后四位，系好安全带，点击屏幕开始，就自动启程了。“车内可以自己调节温度，播放歌曲、视频。特别适合社恐人，不用和司机唠嗑，自己在车里嗨。”</p><p>从乘坐体验来看，多名乘客认为，<strong>车辆总体行驶平稳，而且遵守交通规则，和普通的武汉汽车相比，会礼让行人。但缺点是行驶速度比较慢</strong>。</p><p>“全程保持着40-50码，大桥上都不超过60码。遇到车辆稍微拥挤情况下，只有20码。另外一有车很远就开始减速。交通灯还没变黄灯、快要黄灯都会直接停下来。普通车程40分钟的路程，萝卜快跑差不多需要60分钟的时间。”</p><p>遇到某些意外的情况时，萝卜快跑相较人类没有那么会变通。</p><p>“上次遇到一边道路围起来修路，勺萝卜左转过来，就在斑马线停住了。不会合法逆行，然后乘客无奈下车。它就停在那，一直停着。”有武汉市民表示。</p><p><img src="https://pic.rmb.bdstatic.com/bjh/news/eb1736172107120c5626995ccede6730.gif" width="640"></p><p>另有位市民给记者的视频显示，萝卜快跑遇到前方有车辆临时停靠时，并没有进行变道等操作，而是等待侧方无车辆行驶后，才慢慢启动车辆。</p><p>《科创板日报》记者在采访中发现，武汉投放的萝卜快跑车辆不少已采用全无人模式，副驾没有安全员。如遇特殊情况，可以点击sos按钮，与远程的行车专员通话。根据百度提供的数据，今年一季度武汉车辆的总数为500辆，其中全无人驾驶车辆超过300辆，比例已超过60%。</p><p><strong>▌优惠价格源于平台补贴</strong></p><p>很多用户选择萝卜快跑是由于其价格低廉，10公里路程大约只需4元至16元，远低于普通网约车的18元至30元。</p><p>不过，《科创板日报》记者了解到，这一低廉的价格是来自于平台方的大力补贴。</p><p>从一名乘客晒出的付款金额来看，<strong>28公里的路程总计支付了26.52元，确实非常便宜。但优惠的金额高达109.51元。如果没有优惠折扣，乘客实际需要支出136.04元的费用</strong>。</p>','/api/upload/1811240207597436929.jpg',null);
insert into `article` values ('3','这一次，老司机们决定“放开”方向盘','汽车','657','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p>作为百度旗下自动驾驶出行服务平台，萝卜快跑已在全国11个城市开放了载人测试运营服务，实现超一线城市全覆盖。当下，自动驾驶不再是一个实验室中的概念，曾经的驾校教练、整车试验员、网约车司机、理工科学生们加入其中，见证着这项技术慢慢成熟。</p><p class="ql-align-justify">武汉的王娟曾在车厂当过20年的整车试验员，现在是萝卜快跑的一名安全员。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">多数时候，方向盘不在她的手中，车辆自动行驶，搭载的数据盘将记录下当天的一切行驶轨迹。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">前网约车司机李成在萝卜快跑做过主驾安全员、路测安全员，还兼任了启航讲师，对新入职的安全员进行职业技能培训。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">在北京的张星是萝卜快跑的高级测试开发工程师。在日本读研时，张星的研究方向是医学影像，2021年回国后，他进入萝卜快跑，研究自动驾驶图像，从零开始探索未知领域。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">对于像王娟、李成、张星和成千上万萝卜快跑的工作人员来说，自动驾驶不再是一个实验室中的概念，曾经的驾校教练、整车试验员、网约车司机、理工科学生们加入其中，见证着这项技术慢慢成熟。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong style="color: rgb(51, 51, 51);">老司机们，涌入自动驾驶行业</strong></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">2023年入职萝卜快跑成为一名安全员前，42岁的王娟做了20年的整车试验员，负责新车下线后的抽检工作，对整车进行外观、性能等方面的整体评价。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">2020年开始，凭借多年的汽车质量检测经验和敏锐的嗅觉，她察觉到，自动驾驶或许能成为她下一份工作的契机。那时，自动驾驶的概念时常浮现在她的脑海，她有许多疑问，自动驾驶是车上没有人吗?是不是有人在后台操作?</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">直到2023年，应朋友邀请，她成为了能够为自动驾驶技术出一份力的一线工作人员，监督着自动驾驶的车辆行驶，测量道路站点和线路的合理性。</p><p class="ql-align-justify"><br></p><p><br></p><p>“萝卜快跑”安全员王娟。受访者供图</p><p><br></p><p class="ql-align-justify">在正式入职萝卜快跑之前，曾做过驾校教练、开过网约车、当过8年全职爸爸的李成就对自动驾驶印象深刻，在带着孩子逛公园的寻常一天，一辆无人驾驶的车由远处驶来，将乘客放下后自行驶离，李成弯腰去看，主驾没有人，只有方向盘在动，“太不可思议了”，他这样形容。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">2022年7月，李成入职萝卜快跑，他记得，推荐他的朋友向他描绘了这份职业的美妙前景，“高科技、新兴行业、适合我们驾校出身的人。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">张星在日本求学时，有师兄在做自动驾驶图像相关的工作，他常常参与讨论，他意识到，未来自动驾驶将会有更广阔的探索空间。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">在那一年，自动驾驶技术就给了他极大的震撼，张星开车经验较少，起初对自动驾驶的信心并不是很高，在正式入职萝卜快跑之前，他在北京亦庄体验了一把，在一个没有信号灯的十字路口，四面都有车流汇入，在张星看来，即使是真人开车，这也是一个比较难驾驭的场景类型，而张星乘坐的那辆自动驾驶车，“行云流水”地穿过了那个路口。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">尽管已经做出了职业选择，但对王娟来说，入行之初，她仍然感到过忐忑。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">她还记得第一次坐上自动驾驶车辆时的感受，“说实话我不怎么信任那台车的”，当时，主驾上坐着培训老师，她坐在副驾，观察培训老师开车的状态，“他是全程不会碰方向盘、油门和刹车的，观察道路情况，只是预判和干预”，方向盘不在人手上，能靠谱吗?她想。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">但很快，王娟就发现，这辆车“挺聪明的”，在路上，遇到电动车、行人，离车稍微近一点的，它都会主动避让、减速。遇到货车大车，也能识别出来并及时减速、保持车距。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">忧虑是普遍的。张星的父亲是有多年驾龄的老司机，说起自动驾驶，也摇头。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">决定要入职后，李成也遭到了家人的强烈反对，“觉得是忽悠人的，简直是天方夜谭”，家人也担忧他的安全，忧心未来的工资待遇。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong style="color: rgb(51, 51, 51);">让车像人一样思考</strong></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">在副驾看了三天，第四天，王娟坐上了主驾。方向盘在她面前但不在她手上，她感到紧张，全程精神高度集中，有任何突发状况，她都要及时接管方向盘。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">但开了几天，王娟的紧张就消散了，她发现，车辆自己就能够处理大部分情况，只有出现一些特殊路况时，才需要她上手。及时控制车辆，保证驾驶安全后，她会记下刚刚发生的状况、存在的问题，发送给研发团队。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">刚入职时，李成是负责接送乘客的安全员，他坐在主驾上，大多数时候只是观察车辆行驶状况，遇到突发情况，他才会接管方向盘，最大限度保证行驶安全。</p><p class="ql-align-justify"><br></p><p><br></p><p>“萝卜快跑”路测安全员李成。 受访者供图</p><p><br></p><p class="ql-align-justify">李成入职前的忧虑在20天后就消失了，他发现，自动行驶中的车辆“和人的思维一模一样”，“见到前面有车违停，有障碍物，有道路维修，它会提前变道。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">2023年1月，李成负责的内容由运营转到路跑，直面车辆行驶问题，将测试中遇到的待改进问题都反馈给研发团队。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">张星就是那个在后方让汽车变得更聪明的人，他形容自己的工作是“日行万里”，坐在北京的电脑前，把武汉真实的道路结构还原在一个仿真系统中，车道、信号灯等等一一复刻，他和同事们模拟一辆正在驾驶中的车辆，按照不同的导航线路行驶。设置出可能停留的站点，把所有站点之间互相串联。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">如何让自动驾驶变得更人性化，让乘客体验更舒适，是张星和同事们正在努力的方向。“比如红灯变绿时，正常来说，0.3秒内完成主车的加速，如果考虑到乘坐人的感受，让乘客不晕车，或者说体感比较好，我们会适当延长这个时间，比如说在0—3秒之内有一个缓慢的加速过程，加速到一个比较合适的速度之后，再以一个更大的加速继续前进通过这个路口。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong style="color: rgb(51, 51, 51);">“在仿真系统里把武汉跑了很多遍”</strong></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">作为百度旗下自动驾驶出行服务平台，萝卜快跑已在全国11个城市开放了载人测试运营服务，实现超一线城市全覆盖。此外，萝卜快跑已经开始在北京、武汉、重庆、深圳、上海开展“车内无人”自动驾驶出行服务与测试。</p><p class="ql-align-justify"><br></p><p><br></p><p>“萝卜快跑”高级测试开发工程师张星。 受访者供图</p><p><br></p><p class="ql-align-justify">这几年，张星也见证着萝卜快跑的更新迭代，从最开始一味避让，到在安全基础上更像人一样开车，更加强调道路的通行效率，“我们自动驾驶有四个一直要不断去努力的方向，就是安全、体感、交规和智能性。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">对张星来说，任何一种可能出现的情况都需要认真对待，“没有corner case(罕见的场景)应该是行业的共识，只要一种场景在路上出现过一次，它就有可能出现一千次、一万次。在自动驾驶刚开始时，大家会觉得一种场景出现的频率非常低，我们可以先不管它，其实我们在路上落地的时候，你会发现随着里程的增加，没有什么场景是不会重复出现的。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">张星曾见过这样的案例，在武汉高架匝道上，有逆行电动车行驶到主路上，车主低头看手机，“我们基于这个场景，模拟电动车可能出现的位置，结果是可能在任何一个角落钻出来，基于此，我们需要将任何可能出现的状况都考虑到。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">更多罕见但并非不可能发生的情况也在发生着，张星记得，一次模拟中，一个人站在十字路口中间车辆左转的线上，阻挡主车行驶，张星和同事们在虚拟系统中将这个场景重现，并在所有大路口中设定行人随机出现，测试主车是否能绕过行人。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">萝卜快跑在后排设有一个展示屏，可以看到主车周围的画面，能够检测出路上的车、人的朝向和行动轨迹，在张星看来，这样的配置能够给乘客更强的信心和安全感。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">每一个新版本背后都是成千上万次的测试，“我们在仿真系统里已经把武汉能跑的每一条车道，每一个转向，每一个信号灯都跑过一遍了。”张星从未去过武汉，但进行过成千上万次的模拟，武汉的每一个高架，每一个停车场他都熟悉无比。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong style="color: rgb(51, 51, 51);">从武汉跑向全国</strong></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">王娟入职一年多，她从安全员升级成小组长。2023年3月，李成升级为启航讲师，培训了不少于500个安全员。还被评为了优秀教官、萝卜形象大使。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">李成家人也对自动驾驶从疑虑到认可，李成说，“我老婆现在上下班差不多天天坐(自动驾驶车)，一个月最少坐20天”。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">张星带着父亲在北京亦庄体验了自动驾驶，张星的父亲说，感觉以后无人驾驶真的能够跑到大街小巷，希望以后有一天坐着无人驾驶车上班下班，把自己从开车工作中解放出来。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">这几年，王娟不仅感受到了自动驾驶技术的飞速发展，她发现，从大家完全不认识，不去坐，到现在乘坐的群体越来越多，越来越广，大家的接受度和认知度已经发生了翻天覆地的改变。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">李成庆幸自己选择了这份工作，他见证了自动驾驶技术的慢慢成熟，同时期待着萝卜快跑全部实现无人化的那天，“我会说，无人驾驶刚开始的时候是我们这批人去付出的，我们所有的同事肯定是很自豪的。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">在张星看来，理想情况下，自动驾驶能够让道路交通变得更安全，这对任何一个道路交通的参与者都有好处，张星说，这是他和同事们的共同愿景。</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">王娟的同事们都开玩笑，“武汉人开车这么猛，如果我们把武汉都跑通了，跑遍全国也不是问题。”</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">文 李冰洁</p><p class="ql-align-justify">编辑 胡杰 校对 贾宁</p><p><br></p>','/api/upload/1811241958597722113.jpg',null);
insert into `article` values ('4','多地加速无人驾驶出租车商业化落地，现实中还有这些障碍','汽车','335','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p>近日，各地促进无人驾驶汽车商业化落地的政策频出，利好消息提振了无人驾驶板块上市公司股价。</p><p><br></p><p>7月8日，北京市经信局就《北京市自动驾驶汽车条例（征求意见稿）》对外征求意见，拟支持自动驾驶汽车用于城市公共电汽车客运、网约车、汽车租赁等城市出行服务。该条例旨在为L3级及以上的自动驾驶汽车提供清晰、透明和可预期的制度规范。同一天，济南市工业和信息化局发布《关于拟开放智能网联汽车测试道路的公示》，拟开放一些道路作为智能网联汽车测试道路（中巴车自动驾驶测试及示范应用）。根据工信部网站公布的关于智能网联汽车“车路云一体化”应用试点城市名单，目前全国已有包括北京、上海、重庆、济南、武汉、广州、深圳、成都等20个城市（联合体）列入应用试点城市。</p><p>就在上周，上海向首批四家公司发放无人驾驶智能网联汽车示范应用许可证，允许用户在金桥等示范区域试乘全无人驾驶汽车。与此同时，长沙宣布计划于2026年城区将全面开放智能网联汽车道路测试，单向测试道路总里程达1050公里。其中，湖南湘江新区核心区全域开放，火车站、高铁站、机场“两站一场”互通将优先实现。对于以往只能在郊区测试和运营来说，可谓前进了一大步。</p><p>不过记者多方采访了解到，尽管多地加速无人驾驶网约车的政策推进，但商业落地仍存在一些障碍。</p><p><strong style="color: rgb(51, 51, 51);">临时牌照到期“卡在哪”？</strong></p><p>早在四年多前，我国多地就已发布政策支持无人驾驶汽车上路。例如，上海过去几年来已陆续开放嘉定、临港新片区等示范区测试无人驾驶；北京也于2020年9月建成了全国首个高水平自动驾驶示范区；2019年9月，武汉向3家企业颁发首批自动驾驶车辆商用牌照，成为国内最早发放自动驾驶商用牌照的示范区之一。</p><p>但各地无人驾驶汽车的商业化推进速度和方式不尽相同，例如在一些示范区，无人驾驶出租车是可以进行服务收费的，但在另一些示范区，则是免费试乘。以上海为例，嘉定无人驾驶示范区可以针对主驾有人的无人驾驶汽车收费，但浦东示范区的全无人驾驶汽车则为免费试乘。</p><p>多位业内人士都表示，现在大部分开放无人驾驶测试的城市，开放区域仍然很有限，这导致提供的无人驾驶服务与用户的实际使用场景存在较大的偏差，这也影响了无人驾驶网约车订单的规模扩大，更大范围地开放无人驾驶商业化运营非常重要。</p><p>“萝卜在武汉最所以爆单，也是因为武汉全域都开放了无人驾驶，形成现实中的使用场景。”一位业内人士对第一财经记者表示。</p><p>第一财经记者了解到，在浦东最新开放了全无人驾驶服务后，需求旺盛。不过当记者申请预约金桥区域的无人驾驶试乘体验后却被告知相关企业的无人驾驶车辆临时牌照已到期，需要一周左右时间重新续期。</p><p>相关企业负责人告诉第一财经记者，上海的无人驾驶牌照更新周期大约是6个月，而且不仅仅是在上海，很多城市无人驾驶车都会遇到同样的临时牌照到期的问题，换证程序少则几天，多则一两个月，期间公司不得不中断无人驾驶服务，这是企业面临的一大困扰，对公司运营造成了一定影响。</p><p>他呼吁，国内应该早日像美国一样，许可具备自动驾驶能力的“铁牌车”在进入L4自动驾驶区域的时候，启动无人驾驶，而不是隔一段时间就要更新临时牌照。</p><p>第一财经记者了解到，在美国，无人驾驶汽车和普通车牌照一样，每隔两年需要续一次，但不影响车辆的正常运营。</p><p>除了临时牌照需要续期并缴纳相关费用之外，上述人士表示，更大的问题在于目前无人驾驶汽车仍然不允许卖给商业化公司。“此类交易还没有完全合法化，这才是我们更迫切的需求。”他对第一财经记者表示。</p><p>他进一步解释道，无法无人驾驶汽车交易尚未合法化，主要是因为目前无人驾驶的临时牌照都是捆绑无人驾驶汽车制造商的，如果没有无人驾驶牌照，就无法拥有无人驾驶汽车。</p><p>“无人驾驶每台车成本动辄几十万，资产特别重，必须要能买卖无人车车辆，市场才能流通起来，否则规模起不来。”上述人士表示，“无人车的资产所有权无法解决，无法买卖，市场无法流通，永远只能小规模试点。”</p><p><strong style="color: rgb(51, 51, 51);">无人驾驶立法尚待完善</strong></p><p>目前在全球范围内，只有中国和美国开放了自动驾驶的公开道路测试，但仍有严格限制。即便是在同一个城市，不同区域对于无人驾驶的要求也各不相同，例如上海嘉定在测试了多年“无人驾驶”后，至今尚未允许完全没有驾驶员的全无人驾驶自动驾驶汽车上路。</p><p>也有业内人士向第一财经记者指出，目前国内之所以无人驾驶汽车推进缓慢，主要在于立法方面尚待完善。</p><p>在立法层面，自2011年6月美国内华达州通过了第一部允许智能网联汽车到公共道路开展测试验证的法案开始，美国已经有32个州允许测试或部署自动驾驶汽车，其中，16个州允许车内无安全员测试或部署。</p><p>2017年5月，德国颁布了首部针对智能汽车的法律，又于2021年5月再次立法，将新法命名为《自动驾驶法》，旨在为无人驾驶技术的落地运营提供法律依据和监管框架。新法允许L4级别的智能驾驶汽车在德国公共道路制定区域常态化运营，对其技术要求、准入条件和数据处理规则进行规定。</p><p>一位国内无人驾驶技术公司负责人对第一财经记者表示：“无人驾驶汽车在我国的法律中尚不存在，这是根本问题。只有加快为无人驾驶立法的速度，才能从根本上推动无人驾驶商业化的落地。目前无人驾驶都是以地方区域支持实验研发等名目来对无人驾驶进行管理的，地方政府也很无奈。”</p><p>地方政府为无人驾驶立法的进程也在提速。今年5月1日，《杭州市智能网联车辆测试与应用促进条例》正式施行，杭州主要中心城区都作为智能网联车辆测试应用区域。杭州也成为除经济特区外，全国首个以地方立法明确自动驾驶车辆上路具体流程的城市，也是全国首个为低速无人车立法的城市。</p><p>针对北京最新发布的关于自动驾驶汽车条例的征求意见，北京市经信局相关负责人称，聚焦解决自动驾驶汽车商业化运营难题，有必要充分发挥地方立法实施性、补充性、探索性作用，为开展自动驾驶汽车创新活动提供兼具确定性与开放性的管理框架，为推动自动驾驶汽车产业高质量发展提供有力法治保障。</p><p>此外，自动驾驶违法行为、事故处理和责任承担也备受关注。根据北京最新的征求意见稿，自动驾驶汽车上道路行驶期间发生交通违法行为的，由公安交管部门按照现行法律法规进行处理和认定，车内有驾驶人的，依法对驾驶人进行处理；车内无驾驶人的，对车辆所有人、管理人进行处理。车辆在自动驾驶系统功能未激活状态下发生道路交通事故的，按照现行规定承担责任；激活状态下发生道路交通事故造成人身伤亡、财产损失的，属于自动驾驶汽车一方责任的，由车辆所有人、管理人承担赔偿责任。</p>','/api/upload/1811240616017788928.jpg',null);
insert into `article` values ('5','无人驾驶出租调查①丨记者上海体验：行车平稳，价格适中，只能在固定站点上下车','汽车','24','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p><strong style="color: rgb(51, 51, 51);">海报新闻记者 吴军林 王笑寅 刘敬怡 上海报道</strong></p><p>近日，在2024世界人工智能大会上，赛可智能科技（上海）有限公司、百度智行科技（上海）有限公司、上海裹动科技有限公司（AutoX）、小马易行科技（上海）有限公司成为获得上海市无驾驶人智能网联汽车示范应用许可的首批企业。这也意味着后续在上海市浦东区部分路段，乘客可通过小马智行、AutoX安途等软件呼叫乘坐无人驾驶车辆。</p><p>7月10日下午，海报新闻记者来到小马智行App上显示的上海市嘉定区服务区域，体验乘坐无人驾驶的网约车。若要乘坐，用户需前往App上标出的站点叫车，并在App上标出的站点下车。记者设定起点为“洪德路沪宜公路公交站”站点、终点为“上海国际赛车场路南”站点，页面显示全程7.3公里，将耗时17分钟。此外，在叫车页面，用户可选择三座SUV和五座SUV，还可选择安排无人驾驶车辆或有安全员的车辆。</p><p>小马智行上海市嘉定区站点</p><p>由于站点限制，以“洪德路沪宜公路公交站”为起点乘车，只能选择有安全员的三座SUV。14时45分，记者点击叫车按钮，页面显示有6人正在排队；15时05分，记者叫车成功，页面显示呼叫的车辆主驾位有安全员，车型为雷克萨斯RX450h，预计50分钟内到达。记者注意到，这辆车在10公里以外。</p><p>在同一站点，记者还尝试了通过萝卜快跑App叫车，约15分钟后，因无车接单，只好放弃。</p><p>小马智行App上显示的行程信息</p><p>15时55分，车辆准时抵达。记者通过车辆编号及车牌号确认车辆后上车，车内仅后排三个座位可以乘坐，安全员坐在主驾驶位，主驾驶位和副驾驶位后方均有供后座乘客使用的显示屏，记者根据车内语音提示系好安全带并在显示屏输入手机尾号后，车辆起步。</p><p>车辆内的显示屏</p><p>行驶过程中，乘客可以通过显示屏观看路况及行程情况。记者注意到，显示屏可实时显示周围的车辆及行人，并及时调整行车路线，显示屏下方可查看已行驶距离、距终点距离、预计耗时、实时计价等信息。</p><p>车内安全员表示，目前嘉定区大部分小马智行无人驾驶网约车集中在安亭商圈，此次所叫车辆也是从安亭派来，由于记者叫车地点距离安亭较远，因此候车时间较长。如果在安亭区域叫车是否也需要等这么久？安全员表示不一定，如果碰到早晚高峰，打车人数还是会比较多。</p><p>乘车过程中，记者感到车辆整体行驶较为平稳，未出现猛加油门、急刹等情况，但车速较路面行驶的其他车辆来说要慢一些。行车过程中，安全员双手始终手心向上，放在方向盘下方，除了启动雨刷器外，未对车辆进行其他操作。</p><p>“车速是按照道路限制开的，道路的限速不一样，车速也会有调整，乘客不能要求车速，所以比较适合不赶时间的人坐。”安全员说。</p><p>记者注意到，在驶过一小区出入口时，由于有车辆拐弯进入或驶出小区，造成了道路短暂拥堵，记者所乘车辆未强行绕过前方正在缓慢拐弯的车辆。此后，显示屏上的车辆行驶方向显示，车辆正根据前车位置不断变化拐弯程度，当前车拐弯至后车可以完全通过时，记者所乘车辆向右打方向绕过了它，继续向前行驶。</p><p>小马智行行程价格</p><p>16时13分，车辆准时抵达目的地。记者下车后，车辆在原地停留了约2分钟后驶离。小马智行App显示，平台计价规则为首3公里14元，超过3公里部分每公里2.7元，记者本次行程共计价25.3元，由于使用了首单优惠券，本次行程无需支付费用。</p><p>下车后，记者在滴滴出行平台输入与本次行程相同的起点和终点，页面显示快车价格预估20.07元、出租车价格预估29.93元；在高德平台输入与本次行程相同的起点和终点，页面显示价格预估在15元至23元。由此看来，抛去优惠券等叠加因素，小马智行无人驾驶网约车价格要略高于普通网约车，略低于出租车。</p><p>公开资料显示，2016年，国内首个“国家智能网联汽车（上海）试点示范区”封闭测试区在上海国际汽车城正式运营；2020年，嘉定区启动智能网联汽车测试道路的全域开放，随后，滴滴、小马智行、百度智行、AutoX等企业相继拿下自动驾驶路测牌照并在嘉定开展测试及示范应用。</p><p>在上海陆续开放嘉定、金桥等示范区自动驾驶测试道路的背景下，2023年5月，小马智行与锦江出租达成合作，在嘉定区开放测试道路范围内开展智能出租示范运营活动；2023年7月，小马智行获得上海浦东新区首批无驾驶人智能网联汽车道路测试许可；2024年4月，中国证监会发布关于小马智行境外发行上市备案通知书，小马智行拟赴美上市。</p><p>此次在2024世界人工智能大会上，小马智行首批获得上海市无驾驶人智能网联汽车示范应用许可，也是其在北京、广州、深圳获得全无人载客许可后的又一里程碑，意味着小马智行自动驾驶无人化出行载客服务正式覆盖北上广深四座超一线城市。</p><p><br></p><p><br></p>','/api/upload/1811241205275557889.jpg',null);
insert into `article` values ('6','无人驾驶车要大规模上路了吗？','汽车','480','0','2025-04-29 17:24:22.0','2025-04-29 17:24:22.0',null,null,null,'<p><strong>“行业视角出发，自动驾驶却没有那么火热。”</strong></p><p><br></p><p>4月末，马斯克突访北京，外界普遍分析：这是要为特斯拉的自动驾驶系统FSD V12入华扫清政策障碍。FSD V12是目前全球自动驾驶水平最高的系统。</p><p>或因此事刺激，“无人驾驶”话题关注度大幅提高，有媒体扒出，早在4月25日，杭州就宣布，5月1日起，杭州主城区将开放无人驾驶，开放面积为3474平方公里，占杭州市面积20%以上，服务人口超1000万。5月1日起，杭州主城区开放无人驾驶。开放面积为3474平方公里，超杭州市20%的面积。</p><p><br></p><p class="ql-align-center">杭州，无人巴士行驶在湘湖景区</p><p>很多人疑惑：今后在杭州街道上，是不是可以看到无人车到处跑了呢？杭州要做全世界第一个城区允许无人车大规模上路的大城市？</p><p>紧接着，5月6日，上海市经信委主任张英在媒体公开表态，上海已有1002条无人驾驶测试道路，测试里程达到2000公里。</p><p>5月7日，深圳市交通运输局发布《深圳市智能网联汽车道路测试与示范应用第六批开放道路目录》，此次开放道路总计43条，里程合计约106.01公里。目前，深圳测试开放总里程已经达到944公里。</p><p><strong>三城“出招”，竞争抢跑自动驾驶的意味浓郁。</strong></p><p>具体来看，各城各有优点。杭州的优势是全面开放主城区以及立法快，5月1日施行的《杭州市智能网联车辆测试与应用促进条例》是除经济特区外，全国首个以地方立法明确自动驾驶车辆上路具体流程的城市，也是全国首个为低速无人车立法的城市。</p><p>上海有特斯拉这一近水楼台的优势。此外，其在《城市智能网联汽车产业发展综合评价指数与最佳实践（2022年）》中，综合实力排在全国第二。</p><p>深圳的自动驾驶产业基础最为雄厚。据企查查数据，深圳现有921家自动驾驶企业，已经远远超过其他城市（此前是北京拔得头筹）。</p><p>其他城市虽然没“放话”，但打下好基础的也不少。在《城市智能网联汽车产业发展综合评价指数与最佳实践（2022年）》中，综合排名第一的是北京；武汉发放各类自动驾驶道路测试和运营牌照1581张，常态化测试和运营的智能网联车辆达387辆，发放牌照、常态化测试和运营车辆数量、累计出行服务订单量，均为全国最多。</p><p><strong>不过，若从行业视角出发，自动驾驶却没有那么火热。</strong></p><p>事实上，从美国和中国这两大市场来看，自动驾驶行业在近年是陷入低潮的。比如，去年硅谷自动驾驶企业的双子星之一、一度估值超300亿美元的Cruise Origin彻底失败，其Robotaxi（无人驾驶出租车）运营资格被吊销，自动驾驶驾驶车型也已经停产。</p><p>直接原因是：2023年10月2日晚，美国旧金山一名女子被一辆汽车撞后，恰巧一辆Cruise无人驾驶出租车路过，Cruise无人驾驶出租车成功刹车，但随后又做出错误判断，在靠边停车时对受伤女子造成二次碾压，并将其拖拽行驶了约6米。</p><p>小鹏创始人何小鹏曾表示：“完全无人驾驶还看不到完整的逻辑，甚至可能需要另寻他路。”</p><p>中国则可以通过新增自动驾驶企业数量锐减一窥，从2022年开始，新增企业数量较前几年拦腰砍半。</p><p><br></p><p>这是否意味着自动驾驶行业的重新复苏？小巴联系了杭州经信局有关负责人，以及行业内资深的专家，为我们做一番解读。</p><p><br></p><p><strong>杭州经信局相关负责人</strong></p><p><strong>智能网联车是大势所趋，以后的所有车都会是智能网联车。</strong></p><p>杭州政府一直都是勇立潮头。所以我们率先在全国做了这个动作。今后八个主城区的区域范围内，有牌照的无人车企业都可以选择路线跑测试，线路是备案制的，我们不做审批，只要告诉我们一下就行。</p><p>三四年前，包括杭州在内的很多城市，政府对企业的行政干预手段过多，其实对企业发展是不利的。</p><p>我们给它们划的路测路线，比如犄角旮旯的，企业都不感兴趣的。那些封闭的环境——比如像一些物流园区，无人驾驶技术已经很成熟了。现在政府不干涉企业的行为，企业可以自主选择。而且，我们也认为，不管有人车，还是无人车都有上路通行的权利。</p><p>本次立法的作用是把相关责任划分写得非常清楚。好比对交警来说，出事故不可怕，责任清楚就好。</p><p>另一方面，我们建立一个安全监测的平台，会接入无人车的视频数据、行驶轨迹定位。车前的、主驾左边、主驾右边，共三个摄像头，这些东西也可以作为我们判定责任的依据。</p><p>当然，因为所有无人驾驶企企走的都激光雷达的路线，激光雷达有一个优点是它的安全系数比较高，在城市里面能达到95%。但日常路况的标识标线可能是更不清楚的，对于企业是有挑战的。</p><p>目前杭州无人车（累计安全测试与应用里程已超过120万公里）没有出过主动事故。从全国来看，是有出过主动事故的，加起来应该大概有十来起。</p><p><br></p><p class="ql-align-center">全国首条无人驾驶网约车高铁站示范运行线</p><p>现在已经有很多企业打电话来咨询，对杭州来说，也是一个机遇和挑战。</p><p><strong>我们“破例”，做无人驾驶的企业就会从外地到杭州来，</strong>比如我们正在跟百度洽谈，因为我们能够给出很多场景让它去应用。它们一定需要丰富的应用场景去不断地迭代算法。如果政府不开放，也没法去迭代算法。现在各个城市也都在逐步放开路测限制，比如上海。</p><p>年底，我们可能要把无人车开进西湖景区，相当于在全国率先能够实现无人车进入景区。这还需要跟交管部门一同评估车流量、人流量各方面，包括技术水平做好准备，涉及方方面面的事情，综合评估论证后才可以。</p><p>杭州未来也会尝试应用更多无人驾驶模式。比如广州正在实践的夜间无人公交车，路线一般是从高铁、机场到城区。还有夜间高架无人清扫机，都是很值得学习的。</p><p><br></p><p><strong>朱西产</strong></p><p>同济大学汽车学院教授</p><p>汽车安全技术研究所所长</p><p><strong>我觉得现在谈城市自动驾驶这个话题为时尚早。</strong></p><p>自动驾驶带来的事故责任仍然是一个严重的问题。比如，如果无人车撞死了人，谁上法庭？这个问题看起来容易，但容易出现踢皮球的情况。之前深圳、上海浦东相类似法律已经出了一两年了，但无人车满街跑了吗？</p><p>中国的无人驾驶到底是单车智能还是车路云实现？这是个未知数。</p><p>特斯拉是单车，不需要路端感知、高清地图。特斯拉8月8号可能要上市的Robotaxi（无人驾驶出租车）是无图、无人驾驶。国内是高精度地图加智能车，再加智能路。我们叫车路云，那就要对路端设施进行改造，只有在道路设施改造后的路段上才可以运营。</p><p>还有一条技术路线，是美国谷歌旗下的Waymo，走的是地图加智能车路线，Waymo还需要高精度地图，它在无人驾驶车运行的区域需要配置足够的地图测绘车，地图要做到一个小时进行一次更新。如果没有高精度地图的刷新的话，它就不敢跑。所以它是L4路线。特斯拉是L5路线。</p><p>特斯拉FSD的真实路况总里程已经是12.5亿英里（约20亿公里），但是它承认还有事故（小巴注：据华盛顿邮报去年6月报道，自2019年以来，特斯拉Autopilot在美国共引起736起事故，其中共有17人死亡）。</p><p>马斯克认为可能需要大约60亿英里的自动驾驶测试里程，才能实现完全自动驾驶。</p><p><strong>无人车上路的第一个问题是责任。第二个问题是不挣钱。</strong>为了安全，上一堆人在那监管。1km的成本要30块钱，仍然赔钱。大部分要吃补贴。</p><p>所以，再做三年技术探索吧，在技术不成熟的情况下政府“拔苗助长”，会出来一些“骗补”的小公司做示范，最后无法量产，无法产生税收，会把城市搞穷的。无人驾驶还没有到大批量推广期。正在测试中的5G自动驾驶车辆</p><p>无人驾驶第一个要克服技术难关，现在还是解决不了，这是基础关。第二个要过法律关，如果基础关过不了，除非像美国政府似的，不追究责任。</p><p>美国的做法是：你要给每辆测试车买500万美元的保险，然后黑匣子装上。出了事故保险赔，负面影响（比如市值）企业自己承担。政府不追究刑事责任和产品责任。对自动驾驶汽车的责任豁免是自动驾驶真正落地的关键。</p><p>但是，硅谷自动驾驶企业的双子星之一Cruise Origin去年也倒闭了，出了一起严重伤人事故以后偃旗息鼓了。美国就只剩下Waymo在跑。拥有硅谷的加州也没敢说自己是“无人驾驶城”。</p><p>中国的人工智能能力还不足，包括：基础算力（工信部2025年有300E的算力建设，特斯拉的Dojo接近100E的算力）、车端高算力芯片、AI云端离线大模型、车端在线模型的训练、几十亿公里里程的AI训练数据采集……</p><p>现在FSD有可能进入中国，我们可以看外来的和尚会不会念经，看看老马能不能把这个事儿给跑通，再看特斯拉8月8日Robotaxi上市，能不能让跌入寒冬的无人驾驶再次火爆，重新鼓舞投资人信心。</p><p>未来看，无论从财力还是技术，我认为华为是最有潜力做成自动驾驶的。</p><p>华为在自动驾驶领域，芯片、算力、数据全链条已经构建完整。华为AI芯片昇腾910与英伟达A100对标，今年预计出货超40万片。没有算力和数据，就不可能有好的AI模型。</p>','/api/upload/1811242325746122752.jpg',null);
insert into `article_type` values ('1','100','汽车','0',null,null,null,'2025-04-29 17:24:22.0','2025-04-29 17:24:22.0');

UPDATE goods 
SET img_1 = CONCAT('/api',img_1),
img_2 = CONCAT('/api',img_2),
img_3 = CONCAT('/api',img_3),
img_4 = CONCAT('/api',img_4),
img_5 = CONCAT('/api',img_5);

UPDATE `auto_mall` 
SET cart_img_1 = CONCAT('/api',cart_img_1),
cart_img_2 = CONCAT('/api',cart_img_2),
cart_img_3 = CONCAT('/api',cart_img_3),
cart_img_4 = CONCAT('/api',cart_img_4),
cart_img_5 = CONCAT('/api',cart_img_5);
