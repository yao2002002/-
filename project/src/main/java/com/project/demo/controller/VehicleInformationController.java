package com.project.demo.controller;

import com.project.demo.entity.VehicleInformation;
import com.project.demo.service.VehicleInformationService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;


/**
 * 车辆信息：(VehicleInformation)表控制层
 *
 */
@RestController
@RequestMapping("/vehicle_information")
public class VehicleInformationController extends BaseController<VehicleInformation, VehicleInformationService> {

    /**
     * 车辆信息对象
     */
    @Autowired
    public VehicleInformationController(VehicleInformationService service) {
        setService(service);
    }



    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapvehicle_no = new HashMap<>();
        mapvehicle_no.put("vehicle_no",String.valueOf(paramMap.get("vehicle_no")));
        List listvehicle_no = service.selectBaseList(service.select(mapvehicle_no, new HashMap<>()));
        if (listvehicle_no.size()>0){
            return error(30000, "字段车辆编号内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }


}
