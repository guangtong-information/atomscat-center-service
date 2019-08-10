package com.atomscat.modules.base.dao;

import com.atomscat.modules.base.entity.User;
import com.atomscat.base.AtomscatBaseDao;

import java.util.List;

/**
 * 用户数据处理层
 * @author Howell.Yang
 */
public interface UserDao extends AtomscatBaseDao<User,String> {

    /**
     * 通过用户名获取用户
     * @param username
     * @return
     */
    User findByUsername(String username);

    /**
     * 通过手机获取用户
     * @param mobile
     * @return
     */
    User findByMobile(String mobile);

    /**
     * 通过邮件获取用户
     * @param email
     * @return
     */
    User findByEmail(String email);

    /**
     * 通过部门id获取
     * @param departmentId
     * @return
     */
    List<User> findByDepartmentId(String departmentId);
}
