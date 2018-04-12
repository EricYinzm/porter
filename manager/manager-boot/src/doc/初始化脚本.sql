-- 登陆用户表 
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` VARCHAR(100) NOT NULL COMMENT '登陆账户',
  `loginpw` VARCHAR(100) NOT NULL COMMENT '登陆密码',
  `nickname` VARCHAR(100) DEFAULT NULL COMMENT '昵称',
  `email` VARCHAR(50) NOT NULL COMMENT '邮箱',
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `depart_ment` VARCHAR(200) DEFAULT NULL COMMENT '部门名称',
  `role_code` VARCHAR(100) DEFAULT NULL COMMENT '角色id',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态 1正常，0禁止登陆，-1删除',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='登陆用户表';
-- 菜单目录表
DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` VARCHAR(10) DEFAULT NULL COMMENT '编号',
  `fathercode` VARCHAR(10) DEFAULT '-1' COMMENT '父类编号',
  `name` VARCHAR(100) DEFAULT NULL COMMENT '目录名称',
  `menu_url` VARCHAR(200) DEFAULT '#' COMMENT '目录路径',
  `menu_image` VARCHAR(200) DEFAULT '#' COMMENT '图片',
  `level` INT(5) DEFAULT '-1' COMMENT '目录等级',
  `sort` INT(5) DEFAULT '0' COMMENT '目录排序',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `type` INT(5) DEFAULT '1' COMMENT '类型',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='菜单目录表';
-- 角色表
DROP TABLE IF EXISTS `c_role`;
CREATE TABLE `c_role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` VARCHAR(100) DEFAULT NULL COMMENT '角色编号',
  `role_name` VARCHAR(100) DEFAULT NULL COMMENT '角色名称',
  `sort` INT(5) DEFAULT '0' COMMENT '角色排序',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `type` INT(5) DEFAULT '1' COMMENT '类型',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';
-- 角色菜单关联表
DROP TABLE IF EXISTS `c_role_menu`;
CREATE TABLE `c_role_menu` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` VARCHAR(100) DEFAULT NULL COMMENT '角色id',
  `menu_code` VARCHAR(100) DEFAULT NULL COMMENT '菜单code',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- 数据源信息表
DROP TABLE IF EXISTS `b_data_source`;
CREATE TABLE `b_data_source` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(100) NOT NULL COMMENT '数据源名称',
  `data_type` VARCHAR(100) NOT NULL COMMENT '数据源类型',
  `creater` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '创建人',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态',
  `iscancel` INT(5) NOT NULL DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='数据源信息表';
-- 数据源字段信息表
DROP TABLE IF EXISTS `b_data_source_plugin`;
CREATE TABLE `b_data_source_plugin` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` BIGINT(20) NOT NULL COMMENT '数据源id',
  `field_name` VARCHAR(100) DEFAULT NULL COMMENT '页面字段名称',
  `field_code` VARCHAR(100) DEFAULT NULL COMMENT '字段code',
  `field_value` VARCHAR(100) DEFAULT NULL COMMENT '页面传入的实际值',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='数据源字段信息表';
-- 数据表组信息表
DROP TABLE IF EXISTS `b_data_table`;
CREATE TABLE `b_data_table` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` BIGINT(20) NOT NULL COMMENT '数据源id',
  `data_type` VARCHAR(20) NOT NULL COMMENT '数据源类型(继承)',
  `bank_name` VARCHAR(500) DEFAULT NULL COMMENT '结构名、库名、前缀名、分组名',
  `table_name` VARCHAR(500) NOT NULL COMMENT '表名(多个，隔开)',
  `creater` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '创建人',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) NOT NULL DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='数据表组信息表';
-- 节点信息表
DROP TABLE IF EXISTS `b_nodes`;
CREATE TABLE `b_nodes` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_id` VARCHAR(100) DEFAULT NULL COMMENT '节点id',
  `machine_name` VARCHAR(100) DEFAULT NULL COMMENT '机器名',
  `ip_address` VARCHAR(100) DEFAULT NULL COMMENT 'ip地址',
  `pid_number` VARCHAR(100) DEFAULT NULL COMMENT '进程号',
  `heart_beat_time` VARCHAR(100) DEFAULT '0000-00-00 00:00:00' COMMENT '心跳时间',
  `state` INT(5) DEFAULT '-1' COMMENT '状态 1:在线 -1:离线',
  `node_type` VARCHAR(20) DEFAULT NULL COMMENT '节点类型1预配置2主动注册 先隐藏',
  `task_push_state` VARCHAR(20) DEFAULT NULL COMMENT '节点任务推送状态',
  `creater` BIGINT(20) DEFAULT '-1' COMMENT '创建人',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_id` (`node_id`)
) ENGINE=INNODB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='节点信息表';

-- 告警字段字典
DROP TABLE IF EXISTS `d_alarm_plugin`;
CREATE TABLE `d_alarm_plugin` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alert_type` VARCHAR(100) NOT NULL COMMENT '告警策略',
  `field_name` VARCHAR(100) DEFAULT NULL COMMENT '页面字段名称',
  `field_code` VARCHAR(100) DEFAULT NULL COMMENT '字段实际名',
  `field_order` INT(5) DEFAULT NULL COMMENT '页面展示顺序',
  `field_type` VARCHAR(50) DEFAULT 'TEXT' COMMENT '页面字段类型',
  `field_type_key` VARCHAR(50) DEFAULT NULL COMMENT '页面字段类型对应字典',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='告警字段字典';
-- 数据源数据字典
DROP TABLE IF EXISTS `d_data_source_plugin`;
CREATE TABLE `d_data_source_plugin` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_type` VARCHAR(20) NOT NULL COMMENT '数据源类型枚举',
  `field_name` VARCHAR(100) DEFAULT NULL COMMENT '页面字段名称',
  `field_code` VARCHAR(100) DEFAULT NULL COMMENT '字段英文名',
  `field_order` INT(5) DEFAULT NULL COMMENT '页面展示顺序',
  `field_type` VARCHAR(20) DEFAULT 'TEXT' COMMENT '页面字段类型',
  `field_type_key` VARCHAR(50) DEFAULT NULL COMMENT '页面字段类型对应字典',
  `state` INT(5) DEFAULT '1' COMMENT '状态1启用 -1禁用',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8  COMMENT='数据源数据字典';
-- 数据字典表
DROP TABLE IF EXISTS `d_dictionary`;
CREATE TABLE `d_dictionary` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` VARCHAR(20) NOT NULL COMMENT '编码',
  `name` VARCHAR(100) NOT NULL COMMENT '名称',
  `parentcode` CHAR(20) NOT NULL DEFAULT '-1' COMMENT '父类编码',
  `level` INT(2) NOT NULL DEFAULT '1' COMMENT '树形等级',
  `dictype` CHAR(20) NOT NULL COMMENT '字典类别',
  `state` INT(2) NOT NULL DEFAULT '1' COMMENT '数据状态1正常-1作废0警告',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- 同步任务表
DROP TABLE IF EXISTS `job_tasks`;
CREATE TABLE `job_tasks` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` VARCHAR(100) NOT NULL COMMENT '任务名称',
  `job_state` VARCHAR(100) NOT NULL DEFAULT 'NEW' COMMENT '任务状态',
  `source_consume_adt` VARCHAR(100) NOT NULL COMMENT '来源数据-消费插件',
  `source_convert_adt` VARCHAR(100) NOT NULL COMMENT '来源数据-消费转换插件',
  `source_data_source_id` BIGINT(20) NOT NULL COMMENT '来源数据-元数据表数据源id',
  `source_data_tables_id` BIGINT(20) NOT NULL COMMENT '来源数据-元数据表分组id',
  `source_data_tables_name` VARCHAR(100) DEFAULT NULL COMMENT '来源数据-元数据表分组名称',
  `source_data_id` BIGINT(20) NOT NULL COMMENT '来源数据-同步数据源id(kafka\\cancl)',
  `source_data_name` VARCHAR(100) DEFAULT NULL COMMENT '来源数据-同步数据源名称',
  `target_load_adt` VARCHAR(100) NOT NULL COMMENT '目标数据-载入插件',
  `target_data_source_id` BIGINT(20) NOT NULL COMMENT '目标数据-数据源id',
  `target_data_tables_id` BIGINT(20) NOT NULL COMMENT '目标数据-载入数据表分组id',
  `target_data_tables_name` VARCHAR(100) DEFAULT NULL COMMENT '目标数据-载入数据表分组名称',
  `creater` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '创建人',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) NOT NULL DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='同步任务表';
-- 任务数据表对照关系表
DROP TABLE IF EXISTS `job_tasks_table`;
CREATE TABLE `job_tasks_table` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_task_id` BIGINT(20) NOT NULL COMMENT '任务id',
  `source_table_name` VARCHAR(200) NOT NULL COMMENT '来源数据-数据表名-记录全名',
  `target_table_name` VARCHAR(200) NOT NULL COMMENT '目标数据-数据表名-记录全名',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='任务数据表对照关系表';
-- 任务数据字段对照关系表
DROP TABLE IF EXISTS `job_tasks_field`;
CREATE TABLE `job_tasks_field` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_task_id` BIGINT(20) NOT NULL COMMENT '任务id',
  `job_tasks_table_id` BIGINT(20) NOT NULL COMMENT '任务表对照关系id',
  `source_table_name` VARCHAR(200) NOT NULL COMMENT '来源数据-数据表名-记录全名',
  `source_table_field` VARCHAR(200) NOT NULL COMMENT '来源数据-数据表字段名称',
  `target_table_name` VARCHAR(200) NOT NULL COMMENT '目标数据-数据表名-记录全名',
  `target_table_field` VARCHAR(200) NOT NULL COMMENT '目标字段-数据表字段名称',
  `sort_order` INT(10) DEFAULT '-1' COMMENT '顺序，暂不启用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='任务数据字段对照关系表';
-- 任务与人员对照关系表
DROP TABLE IF EXISTS `job_tasks_user`;
CREATE TABLE `job_tasks_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_task_id` BIGINT(20) NOT NULL COMMENT '任务id',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='任务与人员对照关系表';

-- 任务泳道进度表
DROP TABLE IF EXISTS `mr_job_tasks_schedule`;
CREATE TABLE `mr_job_tasks_schedule` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` VARCHAR(100) DEFAULT NULL COMMENT '任务id',
  `swimlane_id` VARCHAR(100) DEFAULT NULL COMMENT '任务泳道',
  `node_id` VARCHAR(200) DEFAULT NULL COMMENT '节点id',
  `node_id_ip` VARCHAR(200) DEFAULT NULL COMMENT '节点id[ip]',
  `schema_table` VARCHAR(200) DEFAULT NULL COMMENT '数据表',
  `register_time` DATETIME DEFAULT NULL COMMENT '注册时间',
  `heart_beat_date` DATETIME DEFAULT NULL COMMENT '最后心跳时间',
  `alarm_number` BIGINT(20) DEFAULT NULL COMMENT '告警次数',
  `last_checked_time` DATETIME DEFAULT NULL COMMENT '最近告警检查时间',
  `insert_success` BIGINT(20) DEFAULT NULL COMMENT '插入次数success',
  `insert_failure` BIGINT(20) DEFAULT NULL COMMENT '插入次数failure',
  `update_success` BIGINT(20) DEFAULT NULL COMMENT '更新次数success',
  `update_failure` BIGINT(20) DEFAULT NULL COMMENT '更新次数failure',
  `delete_success` BIGINT(20) DEFAULT NULL COMMENT '删除次数success',
  `delete_failure` BIGINT(20) DEFAULT NULL COMMENT '删除次数failure',
  `dispose_schedule` VARCHAR(100) DEFAULT NULL COMMENT '处理进度',
  `last_loaded_data_time` DATETIME DEFAULT NULL COMMENT '最近导入数据时间',
  `last_loaded_system_time` DATETIME DEFAULT NULL COMMENT '最近导入系统时间',
  `create_user_id` BIGINT(20) DEFAULT '-1' COMMENT '创建人',
  `update_user_id` BIGINT(20) DEFAULT '-1' COMMENT '修改人',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `partition_day` DATE DEFAULT NULL COMMENT '预留时间分区字段',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='任务泳道进度表';
-- 任务泳道实时监控表
DROP TABLE IF EXISTS `mr_job_tasks_monitor`;
CREATE TABLE `mr_job_tasks_monitor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` VARCHAR(100) DEFAULT NULL COMMENT '任务id',
  `node_id` VARCHAR(100) DEFAULT NULL COMMENT '节点id',
  `node_id_ip` VARCHAR(200) DEFAULT NULL COMMENT '节点id[ip]',
  `swimlane_id` VARCHAR(100) DEFAULT NULL COMMENT '任务泳道',
  `monitor_date` DATETIME DEFAULT NULL COMMENT '实时监控时间',
  `monitor_ymd` DATE DEFAULT NULL COMMENT '实时监控年月日',
  `monitor_hour` INT(5) DEFAULT NULL COMMENT '实时监控小时(24h)',
  `monitor_minute` INT(5) DEFAULT NULL COMMENT '实时监控分',
  `monitor_second` INT(5) DEFAULT NULL COMMENT '实时监控秒',
  `insert_succes` BIGINT(20) DEFAULT NULL COMMENT '插入成功',
  `insert_failure` BIGINT(20) DEFAULT NULL COMMENT '插入失败',
  `update_succes` BIGINT(20) DEFAULT NULL COMMENT '更新成功',
  `update_failure` BIGINT(20) DEFAULT NULL COMMENT '更新失败',
  `delete_succes` BIGINT(20) DEFAULT NULL COMMENT '删除成功',
  `delete_failure` BIGINT(20) DEFAULT NULL COMMENT '删除失败',
  `alarm_number` BIGINT(20) DEFAULT NULL COMMENT '告警次数',
  `partition_day` DATE DEFAULT NULL COMMENT '预留时间分区字段',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1609 DEFAULT CHARSET=utf8 COMMENT='任务泳道实时监控表';
-- 日志信息表
DROP TABLE IF EXISTS `mr_log_monitor`;
CREATE TABLE `mr_log_monitor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_id` VARCHAR(100) DEFAULT NULL COMMENT '节点id',
  `job_id` VARCHAR(100) DEFAULT NULL COMMENT '任务id',
  `job_name` VARCHAR(100) DEFAULT NULL COMMENT '任务标题',
  `ip_adress` VARCHAR(20) DEFAULT NULL COMMENT 'IP地址',
  `log_date` DATETIME DEFAULT NULL COMMENT '日志时间',
  `log_title` VARCHAR(200) DEFAULT NULL COMMENT '日志标题',
  `log_content` VARCHAR(2000) DEFAULT NULL COMMENT '日志内容',
  `create_user_id` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '创建人',
  `update_user_id` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '修改人',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) NOT NULL DEFAULT '0' COMMENT '是否作废',
  `partition_day` DATE DEFAULT NULL COMMENT '预留分区字段',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='日志信息表';
-- 节点任务监控表
DROP TABLE IF EXISTS `mr_nodes_schedule`;
CREATE TABLE `mr_nodes_schedule` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_id` VARCHAR(100) DEFAULT NULL COMMENT '节点id',
  `computer_name` VARCHAR(100) DEFAULT NULL COMMENT '机器名',
  `ip_address` VARCHAR(100) DEFAULT NULL COMMENT 'ip_address',
  `heart_beat_date` DATETIME DEFAULT NULL COMMENT '心跳时间',
  `process_number` VARCHAR(100) DEFAULT NULL COMMENT '进程号',
  `job_id_json` VARCHAR(200) DEFAULT NULL COMMENT '任务json信息',
  `job_name_json` VARCHAR(200) DEFAULT NULL COMMENT '任务json-name信息',
  `health_level` VARCHAR(100) DEFAULT NULL COMMENT '节点健康级别',
  `health_level_desc` VARCHAR(200) DEFAULT NULL COMMENT '节点健康级别描述',
  `create_user_id` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '创建人',
  `update_user_id` BIGINT(20) NOT NULL DEFAULT '-1' COMMENT '修改人',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` INT(5) NOT NULL DEFAULT '1' COMMENT '状态',
  `iscancel` INT(5) NOT NULL DEFAULT '0' COMMENT '是否作废',
  `partition_day` DATE DEFAULT NULL COMMENT '预留时间分区字段',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='节点任务监控表';
-- 节点任务实时监控表
DROP TABLE IF EXISTS `mr_nodes_monitor`;
CREATE TABLE `mr_nodes_monitor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_id` VARCHAR(100) DEFAULT NULL COMMENT '节点id',
  `monitor_date` DATETIME DEFAULT NULL COMMENT '实时监控时间',
  `monitor_ymd` DATE DEFAULT NULL COMMENT '实时监控年月日',
  `monitor_hour` INT(2) DEFAULT NULL COMMENT '实时监控小时',
  `monitor_minute` INT(5) DEFAULT NULL COMMENT '实时监控分',
  `monitor_second` INT(10) DEFAULT NULL COMMENT '实时监控秒',
  `monitor_tps` INT(20) DEFAULT NULL COMMENT '并发数',
  `monitor_alarm` INT(20) DEFAULT NULL COMMENT '告警次数',
  `partition_day` DATE DEFAULT NULL COMMENT '预留时间分区字段',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1609 DEFAULT CHARSET=utf8 COMMENT='节点任务实时监控表';

-- 告警配置表
DROP TABLE IF EXISTS `s_alarm`;
CREATE TABLE `s_alarm` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alarm_type` VARCHAR(100) DEFAULT NULL COMMENT '告警方式',
  `create_user_id` BIGINT(20) DEFAULT '-1' COMMENT '创建人',
  `update_user_id` BIGINT(20) DEFAULT '-1' COMMENT '修改人',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='告警配置表';
-- 告警配置策略内容表
DROP TABLE IF EXISTS `s_alarm_plugin`;
CREATE TABLE `s_alarm_plugin` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alarm_id` BIGINT(20) DEFAULT NULL COMMENT '告警策略id',
  `alarm_type` VARCHAR(100) DEFAULT NULL COMMENT '告警方式',
  `plugin_code` VARCHAR(100) DEFAULT NULL COMMENT '字段code',
  `plugin_name` VARCHAR(100) DEFAULT NULL COMMENT '字段名称',
  `plugin_value` VARCHAR(200) DEFAULT NULL COMMENT '字段内容',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COMMENT='告警配置策略内容表';
-- 告警用户关联表
DROP TABLE IF EXISTS `s_alarm_user`;
CREATE TABLE `s_alarm_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alarm_id` BIGINT(20) NOT NULL COMMENT '告警信息表id',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='告警用户关联表';
-- 日志级别表
DROP TABLE IF EXISTS `s_log_grade`;
CREATE TABLE `s_log_grade` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_level` VARCHAR(20) DEFAULT NULL COMMENT '日志级别',
  `create_user_id` BIGINT(20) DEFAULT '-1' COMMENT '创建人',
  `update_user_id` BIGINT(20) DEFAULT '-1' COMMENT '修改人',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` INT(5) DEFAULT '1' COMMENT '状态',
  `iscancel` INT(2) DEFAULT '0' COMMENT '是否作废',
  `remark` VARCHAR(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='日志级别表';

-- 初始用户
INSERT  INTO `c_user`(`id`,`loginname`,`loginpw`,`nickname`,`email`,`mobile`,`depart_ment`,`role_code`,`state`,`remark`) VALUES 
(1,'admin','admin','admin','fu_zz@suixingpay.com','13844836009','码农','A0001',1,'');
-- 初始化角色
INSERT  INTO `c_role`(`id`,`role_code`,`role_name`,`sort`,`iscancel`,`type`,`state`,`remark`) VALUES 
(1,'A0001','超级管理员',0,0,1,1,'超级管理员角色组'),
(2,'A0002','普通管理员',1,0,1,1,'普通管理员'),
(3,'B0001','监控观察者',2,0,1,1,'观察者'),
(4,'C0001','访客',4,0,1,1,'访客');
-- 初始化菜单

-- 初始化菜单权限

-- 初始化告警数据字典
INSERT  INTO `d_alarm_plugin`(`id`,`alert_type`,`field_name`,`field_code`,`field_order`,`field_type`,`field_type_key`,`state`,`iscancel`,`remark`) VALUES 
(1,'EMAIL','邮件服务器','host',2,'TEXT',NULL,1,0,NULL),
(2,'EMAIL','邮件账户','username',3,'TEXT',NULL,1,0,NULL),
(3,'EMAIL','邮箱密码','password',4,'TEXT',NULL,1,0,NULL),
(4,'MOBILE','手机号','phone',1,'TEXT',NULL,1,0,NULL);
-- 初始化数据源数据字典
INSERT  INTO `d_data_source_plugin`(`id`,`source_type`,`field_name`,`field_code`,`field_order`,`field_type`,`field_type_key`,`state`,`iscancel`,`remark`) VALUES 
(1,'JDBC','数据库类型','dbtype',1,'RADIO','DbType',1,0,NULL),
(2,'JDBC','url','url',2,'TEXT',NULL,1,0,NULL),
(3,'JDBC','用户名','userName',3,'TEXT',NULL,1,0,NULL),
(4,'JDBC','密码','password',4,'TEXT',NULL,1,0,NULL),
(5,'KAFKA','服务器列表','dateServers',1,'TEXT',NULL,1,0,NULL),
(6,'KAFKA','主题','dateTopics',2,'TEXT',NULL,1,0,NULL),
(8,'CANAL','从属id','slaveId',1,'TEXT',NULL,1,0,NULL),
(9,'CANAL','地址','address',2,'TEXT',NULL,1,0,NULL),
(10,'CANAL','数据库','database',3,'TEXT',NULL,1,0,NULL),
(11,'CANAL','用户','username',4,'TEXT',NULL,1,0,NULL),
(12,'CANAL','密码','password',5,'TEXT',NULL,1,0,NULL),
(13,'CANAL','过滤器','filter',6,'TEXT',NULL,1,0,NULL);
-- 初始化字典表
INSERT  INTO `d_dictionary`(`id`,`code`,`name`,`parentcode`,`level`,`dictype`,`state`,`remark`) VALUES 
(1,'Manual','手动','-1',1,'PTmaintain',1,NULL),
(2,'Automatic','自动','-1',1,'PTmaintain',1,NULL);
