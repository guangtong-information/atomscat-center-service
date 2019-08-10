package com.atomscat.common.utils;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Http请求
 */
@Slf4j
public class HttpUtil {

    private static final String TRACE_ID = "traceId";

    /**
     * post请求
     *
     * @param open_api_url_prefix
     * @param data
     * @return
     */
    public static JSONObject httpPostClient(String open_api_url_prefix, Map data, String accessToken) {
        String traceId = UUID.randomUUID().toString().replace("-", "");
        log.info("[" + traceId + "] request url:" + open_api_url_prefix);
        // 构造请求
        HttpPost httpEntity = new HttpPost(open_api_url_prefix);

        CloseableHttpResponse response = null;
        CloseableHttpClient client = null;

        try {
            client = HttpClientBuilder.create().build();
            log.info("[" + traceId + "] request body:" + JSONObject.toJSONString(data));
            httpEntity.setEntity(new StringEntity(JSONObject.toJSONString(data), ContentType.APPLICATION_JSON));
            if (accessToken != null) {
                httpEntity.setHeader("Access-Token", accessToken);
            }
            response = client.execute(httpEntity);
            if (response != null && response.getStatusLine().getStatusCode() == 200) {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
                StringBuffer result = new StringBuffer();
                String line = "";
                while ((line = bufferedReader.readLine()) != null) {
                    result.append(line);
                }
                bufferedReader.close();
                log.info("[" + traceId + "]response body:" + result.toString());
                return JSONObject.parseObject(result.toString());
            }

        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * get请求
     *
     * @param open_api_url_prefix
     * @param data
     * @return
     */
    public static JSONObject httpGetClient(String open_api_url_prefix, Map<String, Object> data, String accessToken) {
        String traceId = UUID.randomUUID().toString().replace("-", "");
        log.info("[" + traceId + "] request url:" + open_api_url_prefix);
        // 构造请求
        HttpEntityEnclosingRequestBase httpEntity = new HttpEntityEnclosingRequestBase() {
            @Override
            public String getMethod() {
                return "GET";
            }
        };

        CloseableHttpResponse response = null;
        CloseableHttpClient client = null;

        try {
            client = HttpClientBuilder.create().build();
            httpEntity.setURI(URI.create(open_api_url_prefix));
            httpEntity.setEntity(new StringEntity(JSONObject.toJSONString(data), ContentType.APPLICATION_JSON));
            if (accessToken != null) {
                httpEntity.setHeader("Access-Token", accessToken);
            }
            log.info("[" + traceId + "] request body:" + JSONObject.toJSONString(data));
            response = client.execute(httpEntity);
            if (response != null && response.getStatusLine().getStatusCode() == 200) {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
                StringBuffer result = new StringBuffer();
                String line = "";
                while ((line = bufferedReader.readLine()) != null) {
                    result.append(line);
                }
                bufferedReader.close();
                log.info("[" + traceId + "] response body:" + result.toString());
                return JSONObject.parseObject(result.toString());
            }

        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * get请求
     *
     * @param open_api_url_prefix
     * @param data
     * @return
     */
    public static JSONObject httpGetClient(String open_api_url_prefix, Map<String, String> data) {
        String traceId = UUID.randomUUID().toString().replace("-", "");
        log.info("[" + traceId + "] request url:" + open_api_url_prefix);
        // 构造请求
        HttpGet httpget = new HttpGet(open_api_url_prefix);

        CloseableHttpResponse response = null;
        CloseableHttpClient client = null;

        try {
            // 创建参数队列
            List<NameValuePair> formparams = new ArrayList<NameValuePair>();
            data.forEach((k, v) -> {
                formparams.add(new BasicNameValuePair(k, v));
            });

            log.info("[" + traceId + "] request body:" + JSONObject.toJSONString(data));
            String str = EntityUtils.toString(new UrlEncodedFormEntity(formparams, Charset.forName("UTF-8")));
            httpget.setURI(new URI(httpget.getURI().toString() + "?" + str));

            client = HttpClientBuilder.create().build();

            response = client.execute(httpget);
            if (response != null && response.getStatusLine().getStatusCode() == 200) {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
                StringBuffer result = new StringBuffer();
                String line = "";
                while ((line = bufferedReader.readLine()) != null) {
                    result.append(line);
                }
                bufferedReader.close();
                log.info("[" + traceId + "] response body:" + result.toString());
                return JSONObject.parseObject(result.toString());
            }

        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
