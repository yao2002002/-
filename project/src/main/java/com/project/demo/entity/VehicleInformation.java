package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 车辆信息：(VehicleInformation)表实体类
 *
 */
@TableName("`vehicle_information`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VehicleInformation implements Serializable {

    // VehicleInformation编号
    @TableId(value = "vehicle_information_id", type = IdType.AUTO)
    private Integer vehicle_information_id;

    // 车辆编号
    @TableField(value = "`vehicle_no`")
    private String vehicle_no;
    // 车辆名称
    @TableField(value = "`vehicle_name`")
    private String vehicle_name;
    // 车辆型号
    @TableField(value = "`vehicle_model`")
    private String vehicle_model;
    // 车辆品牌
    @TableField(value = "`vehicle_brand`")
    private String vehicle_brand;
    // 车辆价格
    @TableField(value = "`vehicle_price`")
    private Double vehicle_price;
    // 车辆图片
    @TableField(value = "`vehicle_picture`")
    private String vehicle_picture;
    // 车辆介绍
    @TableField(value = "`vehicle_introduction`")
    private String vehicle_introduction;
    // 车辆情况
    @TableField(value = "`vehicle_condition`")
    private String vehicle_condition;
    // 车辆详情
    @TableField(value = "`vehicle_details`")
    private String vehicle_details;

    // 点击数
    @TableField(value = "hits")
    private Integer hits;

    // 点赞数
    @TableField(value = "praise_len")
    private Integer praise_len;

    // 收藏数
    @TableField(value = "collect_len")
    private Integer collect_len;

    // 评论数
    @TableField(value = "comment_len")
    private Integer comment_len;















		// 预订限制次数
	@TableField(value = "vehicle_reservation_limit_times")
	private String vehicle_reservation_limit_times;
	
	


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
