package com.project.demo.dao;

import com.project.demo.dao.base.BaseMapper;
import com.project.demo.entity.UserComplaints;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户投诉：(UserComplaints)Mapper接口
 *
 */
@Mapper
public interface UserComplaintsMapper extends BaseMapper<UserComplaints>{

}
