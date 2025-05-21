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
 * 交付安排：(DeliveryArrangements)表实体类
 *
 */
@TableName("`delivery_arrangements`")
@Data
@EqualsAndHashCode(callSuper = false)
public class DeliveryArrangements implements Serializable {

    // DeliveryArrangements编号
    @TableId(value = "delivery_arrangements_id", type = IdType.AUTO)
    private Integer delivery_arrangements_id;

    // 订单编号
    @TableField(value = "`order_number`")
    private String order_number;
    // 汽车名称
    @TableField(value = "`car_name`")
    private String car_name;
    // 注册用户
    @TableField(value = "`registered_user`")
    private Integer registered_user;
    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 交付时间
    @TableField(value = "`delivery_time`")
    private Timestamp delivery_time;
    // 交付地点
    @TableField(value = "`delivery_location`")
    private String delivery_location;
    // 交付安排
    @TableField(value = "`delivery_arrangements`")
    private String delivery_arrangements;




















	


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
