package com.project.demo.controller;

import com.project.demo.controller.base.BaseController;
import com.project.demo.entity.OrderAfterSale;
import com.project.demo.service.OrderAfterSaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单售后
 */
@RestController
@RequestMapping("order_after_sale")
public class OrderAfterSaleController extends BaseController<OrderAfterSale, OrderAfterSaleService> {
    /**
     * 服务对象
     */
    @Autowired
    public OrderAfterSaleController(OrderAfterSaleService service) {
        setService(service);
    }

}


