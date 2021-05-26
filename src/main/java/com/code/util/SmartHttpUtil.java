package com.code.util;

import org.apache.commons.collections.CollectionUtils;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
 
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
 

public class SmartHttpUtil {
 
    /**
     * 方法描述: 发送get请求
     *
     * @param url
     * @Return {@link String}
     * @throws
     * @date 2020年07月27日 09:10:10
     */
    public static String sendGet(String url) throws Exception {
        HttpGet httpGet = null;
        String body = "";
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            List<String> mapList = new ArrayList<>();
            httpGet = new HttpGet(url);
            httpGet.setHeader("Content-type", "application/json; charset=utf-8");
            httpGet.setHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
            HttpResponse response = httpClient.execute(httpGet);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                throw new RuntimeException("요청 실패");
            } else {
                body = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (httpGet != null) {
                httpGet.releaseConnection();
            }
        }
        return body;
    }
 
    /**
     * 方法描述: 发送post请求-json数据
     *
     * @param url
     * @param json
     * @param header
     * @Return {@link String}
     * @throws
     * @date 2020年07月27日 09:10:54
     */
    public static String sendPostJson(String url, String json, Map<String, String> header) throws Exception {
        HttpPost httpPost = null;
        String body = "";
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            httpPost = new HttpPost(url);
            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
            httpPost.setHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
            if (header != null) {
                for (Entry<String, String> entry : header.entrySet()) {
                    httpPost.setHeader(entry.getKey(), entry.getValue());
                }
            }
            StringEntity entity = new StringEntity(json, Charset.forName("UTF-8"));
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);
            HttpResponse response = httpClient.execute(httpPost);
 
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                throw new RuntimeException("요청 실패");
            } else {
               body = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return body;
    }
 
    /**
     * 方法描述: 发送post请求-form表单数据
     *
     * @param url
     * @param header
     * @Return {@link String}
     * @throws
     * @date 2020年07月27日 09:10:54
     */
    public static String sendPostForm(String url, Map<String, String> params, Map<String, String> header) throws Exception {
        HttpPost httpPost = null;
        String body = "";
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            httpPost = new HttpPost(url);
            httpPost.setHeader("Content-type", "application/x-www-form-urlencoded");
            httpPost.setHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
            if (header != null) {
                for (Entry<String, String> entry : header.entrySet()) {
                    httpPost.setHeader(entry.getKey(), entry.getValue());
                }
            }
            List<NameValuePair> nvps = new ArrayList<>();
            if (params != null) {
                for (Entry<String, String> entry : params.entrySet()) {
                    nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
                }
            }
            //设置参数到请求对象中
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
            HttpResponse response = httpClient.execute(httpPost);
 
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                throw new RuntimeException("요청 실패");
            } else {
                body = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (httpPost != null) {
                httpPost.releaseConnection();
            }
        }
        return body;
    }

    public static void main(String[] args) throws Exception {
        //学习地址
       // https://www.cnblogs.com/fanyang1/p/9414088.html
        String url="http://fanyi.youdao.com/translate?&doctype=json&type=AUTO&i=你好呀";
        String s = sendGet(url);
        System.out.println("s = " + s);
    }
}