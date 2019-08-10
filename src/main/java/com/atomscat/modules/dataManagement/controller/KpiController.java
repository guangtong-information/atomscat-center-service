package com.atomscat.modules.dataManagement.controller;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.StrUtil;
import com.atomscat.common.utils.ResultUtil;
import com.atomscat.common.vo.Result;
import com.atomscat.modules.dataManagement.entity.Kpi;
import com.atomscat.modules.dataManagement.service.KpiService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@Api(description = "/客户接口")
@RequestMapping("/api/dm/kpi")
@Transactional
@CacheConfig(cacheNames = "kpiData")
public class KpiController {

    @Autowired
    private KpiService kpiService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部")
    public Result<Object> get(@ModelAttribute Kpi kpi) {
        List<Kpi> kpiList = kpiService.findAll(new Specification<Kpi>() {
            @Override
            public Predicate toPredicate(Root<Kpi> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                Path<String> title = root.get("title");
                List<Predicate> list = new ArrayList<Predicate>();
                //模糊搜素
                if(StrUtil.isNotBlank(kpi.getTitle())){
                    list.add(cb.like(title,'%'+kpi.getTitle()+'%'));
                }
                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        });
        return new ResultUtil<Object>().setData(kpiList);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation(value = "添加数据")
    public Result<Object> add(@ModelAttribute Kpi kpi){
        String id = UUID.randomUUID().toString().replace("-", "");
        kpi.setId(id);
        if(kpiService.isHave(kpi) == false){
            kpiService.save(kpi);
            redisTemplate.delete("kpidata::kpilist");
            return new ResultUtil<Object>().setSuccessMsg("添加成功");
        } else {
            return new ResultUtil<Object>().setErrorMsg("指标已经存在");
        }
    }





}
