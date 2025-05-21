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
 * 车辆预订：(VehicleReservation)表实体类
 *
 */
@TableName("`vehicle_reservation`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VehicleReservation implements Serializable {

    // VehicleReservation编号
    @TableId(value = "vehicle_reservation_id", type = IdType.AUTO)
    private Integer vehicle_reservation_id;

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
    // 注册用户
    @TableField(value = "`registered_user`")
    private Integer registered_user;
    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 预订数量
    @TableField(value = "`booking_quantity`")
    private Double booking_quantity;
    // 预订备注
    @TableField(value = "`reservation_remarks`")
    private String reservation_remarks;




















		// 来源表
	@TableField(value = "source_table")
	private String source_table;
	
	// 来源ID
	@TableField(value = "source_id")
	private Integer source_id;
	
	// 来源用户ID
	@TableField(value = "source_user_id")
	private Integer source_user_id;
	


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
