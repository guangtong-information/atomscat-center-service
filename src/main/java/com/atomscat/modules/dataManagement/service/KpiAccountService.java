package com.atomscat.modules.dataManagement.service;

import com.atomscat.base.AtomscatBaseService;
import com.atomscat.modules.dataManagement.entity.KpiAccount;

import java.util.List;

public interface KpiAccountService extends AtomscatBaseService<KpiAccount,String> {

    List<KpiAccount> delByIds(String id);

    /**
     * 获取客户的KPI指标
     * @param accountId
     * @return
     */
    List<KpiAccount> findKpiAccount(String accountId);

}
