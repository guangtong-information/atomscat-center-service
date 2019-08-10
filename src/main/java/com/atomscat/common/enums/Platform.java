package com.atomscat.common.enums;

import lombok.Getter;

/**
 * 推广平台
 *
 */

public enum Platform {
    Oceg("1","巨量引擎"),
    Eqq("2","广点通");


    @Getter
    public final String value;

    @Getter
    public final String desc;

    Platform(String value, String desc){
        this.value = value;
        this.desc = desc;
    }
}
