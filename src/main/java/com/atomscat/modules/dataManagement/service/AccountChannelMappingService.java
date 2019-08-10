package com.atomscat.modules.dataManagement.service;

import com.atomscat.base.AtomscatBaseService;
import com.atomscat.common.vo.PageVo;
import com.atomscat.modules.dataManagement.entity.AccountChannelMapping;
import org.springframework.data.domain.Page;

public interface AccountChannelMappingService extends AtomscatBaseService<AccountChannelMapping,String> {
    Page<AccountChannelMapping> findAllByPage(AccountChannelMapping accountChannelMapping, PageVo pageVo);
}
