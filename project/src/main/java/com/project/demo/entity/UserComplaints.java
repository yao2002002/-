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
 * 用户投诉：(UserComplaints)表实体类
 *
 */
@TableName("`user_complaints`")
@Data
@EqualsAndHashCode(callSuper = false)
public class UserComplaints implements Serializable {

    // UserComplaints编号
    @TableId(value = "user_complaints_id", type = IdType.AUTO)
    private Integer user_complaints_id;

    // 注册用户
    @TableField(value = "`registered_user`")
    private Integer registered_user;
    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 投诉标题
    @TableField(value = "`complaint_title`")
    private String complaint_title;
    // 投诉时间
    @TableField(value = "`complaint_time`")
    private Timestamp complaint_time;
    // 投诉内容
    @TableField(value = "`complaint_content`")
    private String complaint_content;





    // 审核状态
    @TableField(value = "examine_state")
    private String examine_state;



    // 审核回复
    @TableField(value = "examine_reply")
    private String examine_reply;












	


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
