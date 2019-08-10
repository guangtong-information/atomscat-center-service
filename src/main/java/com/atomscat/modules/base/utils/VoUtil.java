package com.atomscat.modules.base.utils;

import cn.hutool.core.bean.BeanUtil;
import com.atomscat.modules.base.entity.Permission;
import com.atomscat.modules.base.vo.MenuVo;

/**
 * @author Howell.Yang
 */
public class VoUtil {

    public static MenuVo permissionToMenuVo(Permission p){

        MenuVo menuVo = new MenuVo();
        BeanUtil.copyProperties(p, menuVo);
        return menuVo;
    }
}
