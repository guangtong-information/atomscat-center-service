package com.atomscat.modules.base.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author Howell.Yang
 */
@Data
@AllArgsConstructor
public class RedisVo {

    private String key;

    private String value;
}
