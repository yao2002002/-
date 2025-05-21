package com.project.demo.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 售后订单：(Order)表实体类
 *
 * @author xxx
 *@since 202X-XX-XX
 */
@TableName("`order_after_sale`")
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderAfterSale implements Serializable {

    private static final long serialVersionUID = -79265503181582181L;

    /**
     * 订单售后id：
     */
    @TableId(value = "order_after_sale_id", type = IdType.AUTO)
    private Integer order_after_sale_id;

    /**
     * 订单ID：
     */
    @TableField(value = "order_id")
    private Integer order_id;

    /**
     * 订单号：
     */
    @TableField(value = "order_number")
    private String order_number;

    /**
     * 商品id：[0,8388607]
     */
    @TableField(value = "goods_id")
    private Double goods_id;

    /**
     * 商品标题：
     */
    @TableField(value = "title")
    private String title;

    /**
     * 价格：
     */
    @TableField(value = "price")
    private Double price;

    /**
     * 原价：
     */
    @TableField(value = "price_ago")
    private Double price_ago;

    /**
     * 数量：
     */
    @TableField(value = "num")
    private Integer num;

    /**
     * 总价：
     */
    @TableField(value = "price_count")
    private Double price_count;

    /**
     * 买家ID：
     */
    @TableField(value = "user_id")
    private Integer user_id;

    /**
     * 商家ID：
     */
    @TableField(value = "merchant_id")
    private Integer merchant_id;

    /**
     * 订单状态：待付款，待发货，待签收，已签收，待退款，已退款，已拒绝，已完成
     */
    @TableField(value = "state")
    private String state;

    /**
     * 售后状态：未审核，未通过，已通过
     */
    @TableField(value = "after_state")
    private String after_state;

    /**
     * 售后回复
     */
    @TableField(value = "after_state_reply")
    private String after_state_reply;

    /**
     * 售后类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 售后内容
     */
    @TableField(value = "content_desc")
    private String content_desc;

    /**
     * 售后凭证
     */
    @TableField(value = "imgs")
    private String imgs;

    /**
     * 创建时间：
     */
    @TableField(value = "create_time")
    private Timestamp createTime;

    /**
     * 更新时间：
     */
    @TableField(value = "update_time")
    private Timestamp updateTime;



}

