package com.atomscat.modules.dataManagement.service;

import com.atomscat.base.AtomscatBaseService;
import com.atomscat.modules.dataManagement.entity.Kpi;

import java.util.List;

public interface KpiService extends AtomscatBaseService<Kpi,String> {
    boolean isHave(Kpi kpi);
    List<Kpi> getAllList();
}
