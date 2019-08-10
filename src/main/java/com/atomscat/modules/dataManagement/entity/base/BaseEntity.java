package com.atomscat.modules.dataManagement.entity.base;

import lombok.Data;

import java.util.Date;


@Data
public class BaseEntity {

    private String sysCreateBy = "system";
    private Date sysCreateTime;
    private Integer delFlag=0;
    private String sysUpdateBy = "system";
    private Date sysUpdateTime;

}
