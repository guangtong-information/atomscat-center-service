package com.atomscat.modules.base.dao;

import com.atomscat.modules.base.entity.Role;
import com.atomscat.base.AtomscatBaseDao;

import java.util.List;

/**
 * 角色数据处理层
 * @author Howell.Yang
 */
public interface RoleDao extends AtomscatBaseDao<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
