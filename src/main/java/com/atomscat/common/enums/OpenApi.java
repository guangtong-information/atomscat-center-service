package com.atomscat.common.enums;

import lombok.Getter;

/**
 * 数据接口采集地址
 *
 */

public enum OpenApi {
    OcegAdData("https://ad.toutiao.com/open_api/2/report/advertiser/get/","巨量引擎-广告主数据"),
    OcegDataGroup("https://ad.toutiao.com/open_api/2/report/campaign/get/","巨量引擎-广告组数据"),
    OcegAdPlan("https://ad.toutiao.com/open_api/2/report/ad/get/","巨量引擎-广告计划数据"),
    OcegCreative("https://ad.toutiao.com/open_api/2/report/creative/get/","巨量引擎-广告创意数据"),
    OcegAdvertiser("https://ad.toutiao.com/open_api/2/advertiser/info/","巨量引擎-广告主信息"),
    OcegAgentAdvertiser("https://ad.toutiao.com/open_api/2/agent/advertiser/select/","巨量引擎-代理商-广告主列表"),
    EqqAdvertiser("https://api.e.qq.com/v1.1/advertiser/get","广点通-广告主数据"),
    EqqAdInsights("https://api.e.qq.com/v1.1/hourly_reports/get","广点通-广告数据洞察"),
    EqqLeads("https://api.e.qq.com/v1.1/leads/get","广点通-线索数据");


    @Getter
    public final String url;

    @Getter
    public final String desc;

    OpenApi(String url, String desc){
        this.url = url;
        this.desc = desc;
    }
}
