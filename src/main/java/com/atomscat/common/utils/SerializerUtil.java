package com.atomscat.common.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class SerializerUtil {
    public <T> List<T> serializerListJson(JSONObject jsonObject, TypeReference typeReference) {
        //判断结果
        int code = (int) jsonObject.get("code");
        if (code == 0) {
            JSONObject dataObject = jsonObject.getJSONObject("data");
            JSONArray listObject = dataObject.getJSONArray("list");
            List<T> data = listObject.toJavaObject(typeReference);
            log.info("Data:" + data.toString());
            return data;
        }
        return null;
    }

    public <T> T serializerJson(JSONObject jsonObject, TypeReference typeReference) {
        //判断结果
        int code = (int) jsonObject.get("code");
        if (code == 0) {
            JSONObject dataObject = jsonObject.getJSONObject("data");
            JSONArray listObject = dataObject.getJSONArray("list");
            T data = listObject.toJavaObject(typeReference);
            log.info("反序列化得出的java实体:" + data.toString());
            return data;
        }
        return null;
    }
}
