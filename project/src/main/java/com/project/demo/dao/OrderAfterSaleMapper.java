package com.project.demo.dao;

import com.project.demo.dao.base.BaseMapper;
import com.project.demo.entity.OrderAfterSale;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单售后：Mapper接口
 */
@Mapper
public interface OrderAfterSaleMapper extends BaseMapper<OrderAfterSale> {
}
