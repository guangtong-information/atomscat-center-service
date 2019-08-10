package com.atomscat.modules.dataManagement.controller;

import cn.hutool.core.lang.UUID;
import com.atomscat.common.utils.ResultUtil;
import com.atomscat.common.vo.PageVo;
import com.atomscat.common.vo.Result;
import com.atomscat.common.vo.SearchVo;
import com.atomscat.modules.dataManagement.entity.AccountChannelMapping;
import com.atomscat.modules.dataManagement.entity.Kpi;
import com.atomscat.modules.dataManagement.entity.KpiAccount;
import com.atomscat.modules.dataManagement.service.AccountChannelMappingService;
import com.atomscat.modules.dataManagement.service.KpiAccountService;
import com.atomscat.modules.dataManagement.service.KpiService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@Api(description = "/客户接口")
@RequestMapping("/api/dm/acm")
@Transactional
public class AccountChannelMappingController {

    @Autowired
    private AccountChannelMappingService accountChannelMappingService;

    @Autowired
    private KpiAccountService kpiAccountService;

    @Autowired
    private KpiService kpiService;

    @RequestMapping(value = "/getAllByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取全部")
    public Result<Object> getAllByPage(@ModelAttribute AccountChannelMapping accountChannelMapping,
                                       @ModelAttribute SearchVo searchVo,
                                       @ModelAttribute PageVo pageVo) {
        Page<AccountChannelMapping> page = accountChannelMappingService.findAllByPage(accountChannelMapping, pageVo);
        return new ResultUtil<Object>().setData(page);
    }

    @RequestMapping(value = "/addAccountChannel", method = RequestMethod.POST)
    @ApiOperation(value = "添加客户数据")
    public Result<Object> addAccountChannel(@ModelAttribute AccountChannelMapping accountChannelMapping){
        String id = UUID.randomUUID().toString().replace("-", "");
        accountChannelMapping.setId(id);
        accountChannelMappingService.save(accountChannelMapping);
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }

    @RequestMapping(value = "/delByIds/{ids}", method = RequestMethod.DELETE)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delByIds(@PathVariable String[] ids) {
        for (String id : ids) {
            AccountChannelMapping accountChannelMapping = accountChannelMappingService.get(id);
            accountChannelMapping.setDelFlag(1);
            accountChannelMappingService.update(accountChannelMapping);
        }
        return new ResultUtil<Object>().setSuccessMsg("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ApiOperation(value = "修改")
    public Result<Object> edit(@ModelAttribute AccountChannelMapping accountChannelMapping) {
        if (accountChannelMapping.getId() == null || accountChannelMapping.getId().length() == 0) {
            return new ResultUtil<Object>().setErrorMsg("id不能为空");
        }
        accountChannelMappingService.update(accountChannelMapping);
        return new ResultUtil<Object>().setSuccessMsg("修改成功");
    }

    @RequestMapping(value = "/saveKpi", method = RequestMethod.POST)
    @ApiOperation(value = "保存kpi")
    public Result<Object> saveKpi(@ModelAttribute AccountChannelMapping accountChannelMapping) {
        if (accountChannelMapping.getId() == null || accountChannelMapping.getId().length() == 0) {
            return new ResultUtil<Object>().setErrorMsg("id不能为空");
        }
        String id = accountChannelMapping.getId();
        String kpi = accountChannelMapping.getKpiIds();
        accountChannelMapping = accountChannelMappingService.get(id);
        accountChannelMapping.setKpiIds(kpi);
        accountChannelMappingService.update(accountChannelMapping);

        List<KpiAccount> list = new ArrayList<>();
        List<Kpi> kpis = kpiService.getAllList();
        for(String item : kpi.split(",")) {
            if(item != null && item.length() != 0) {
                KpiAccount kpiAccount = new KpiAccount();
                kpiAccount.setKpiId(item);
                kpiAccount.setAccountId(id);
                kpis.forEach((kpiItem -> {
                    if(kpiItem.getId().equals(item)) {
                        kpiAccount.setTitle(kpiItem.getTitle());
                    }
                }));
                kpiAccount.setId(UUID.randomUUID().toString().replaceAll("-",""));
                list.add(kpiAccount);
            }
        }
        kpiAccountService.delByIds(id);
        kpiAccountService.saveOrUpdateAll(list);
        return new ResultUtil<Object>().setSuccessMsg("修改成功");
    }

}
