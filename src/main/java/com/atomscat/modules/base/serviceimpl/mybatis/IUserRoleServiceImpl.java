package com.atomscat.modules.base.serviceimpl.mybatis;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atomscat.modules.base.dao.mapper.UserRoleMapper;
import com.atomscat.modules.base.entity.Role;
import com.atomscat.modules.base.entity.UserRole;
import com.atomscat.modules.base.service.mybatis.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Howell.Yang
 */
@Service
public class IUserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<Role> findByUserId(String userId) {

        return userRoleMapper.findByUserId(userId);
    }

    @Override
    public List<String> findDepIdsByUserId(String userId) {

        return userRoleMapper.findDepIdsByUserId(userId);
    }
}
