package com.code.admin;

import com.code.util.GlobalResult;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 文件上传请求处理类
 */
@Controller
public class FileUploadController {

    @RequestMapping(value = "/uploadFile", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
    @ResponseBody
    public GlobalResult uploadFile(MultipartFile file, HttpServletRequest request) {
        if (file == null) {
            return GlobalResult.errorMsg("파일을 비울 수 없습니다!");
        }
        String fileSub = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).toLowerCase();
        //if (".jpg".equals(fileSub) || ".jpeg".equals(fileSub) || ".png".equals(fileSub) || ".gif".equals(fileSub)) {
        if (true) {
            Random d = new Random();
            String img = System.currentTimeMillis() + "_" + d.nextInt(10) + "" + fileSub;
            //获取当前项目上传文件路径  中的upload文件中
            //将当前日期格式化为文件夹路径 例如"20190203"
            //获取项目路径 项目名（上下文）
            String basePath = request.getSession().getServletContext().getRealPath("/uploads");
            System.out.println("basePath = " + basePath);
            /*
                使用配置文件配置文件上传路径
                String dateStr = (new SimpleDateFormat("yyyyMMdd/")).format(new Date());
                String path = ConfigUtil.getUploadPath() + dateStr;  //读取配置文件中的路径+时间
            */
            String path = basePath;
            try {
                File f = new File(path);
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(new File(f, img));
            } catch (Exception e) {
                e.printStackTrace();
                return GlobalResult.errorMsg("파일 업로드 오류, 폴더를 만들 수 없습니다");
            }
            //获取项目路径 例如项目名为test  则值为  /test
            String contextPath = request.getServletContext().getContextPath();
            //获取图片上传绝对路径保存数据库
            //String contextPath = request.getScheme() + "://" + request.getServerName()+ ":" + request.getServerPort() + request.getContextPath()+ "/";
            Map<String, String> map = new HashMap<>();
            map.put("src", contextPath + "/uploads/" + img);
            map.put("savePath", path + File.separatorChar + img);
            return GlobalResult.ok(map);
        } else {
            return GlobalResult.errorMsg("파일 형식은 지원하지 않습니다, 다시 선택하세요!");
        }
    }

    /**
     * layui上传文件
     * 返回数据格式
     * {
     * "code": 0 //0表示成功，其它失败
     * ,"msg": "" //提示信息 //一般上传失败后返回
     * ,"data": {
     * "src": "图片路径"
     * ,"title": "图片名称" //可选
     * }
     * }
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/layeditUploadFile", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
    @ResponseBody
    public Map layeditUploadFile(MultipartFile file, HttpServletRequest request) {
        Map map = new HashMap();
        if (file == null) {
            map.put("code", -1);
            map.put("msg", "文件不能为空！");
            return map;
        }
        String fileSub = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).toLowerCase();
        if (".jpg".equals(fileSub) || ".jpeg".equals(fileSub) || ".png".equals(fileSub) || ".gif".equals(fileSub)) {
            Random d = new Random();
            String img = System.currentTimeMillis() + "_" + d.nextInt(10) + "" + fileSub;
            //获取当前项目上传文件路径  中的upload文件中
            //将当前日期格式化为文件夹路径 例如"20190203"
            //获取项目路径 项目名（上下文）
            String basePath = request.getSession().getServletContext().getRealPath("/uploads");
            System.out.println("basePath = " + basePath);
            /*
                使用配置文件配置文件上传路径
                String dateStr = (new SimpleDateFormat("yyyyMMdd/")).format(new Date());
                String path = ConfigUtil.getUploadPath() + dateStr;  //读取配置文件中的路径+时间
            */
            String path = basePath;
            try {
                File f = new File(path);
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(new File(f, img));
            } catch (Exception e) {
                e.printStackTrace();
                map.put("code", -1);
                map.put("msg", "文件上传错误，文件夹不能创建！");
                return map;
            }
            //获取项目路径
            String contextPath = request.getServletContext().getContextPath();
            map.put("code", "0"); //0代表成功
            map.put("msg", "업로드 성공success"); //0代表成功
            Map data = new HashMap();
            data.put("src", contextPath + "/uploads/" + img);
            data.put("savePath", path + img);
            map.put("data", data); //0代表成功
            return map;
        } else {
            map.put("code", -1);
            map.put("msg", "파일 형식은 지원하지 않습니다,다시 선택하세요!");
            return map;
        }
    }

    /**
     * 文件下载
     *
     * @param fileName 文件名称 例如 /CommonWeb/uploads/1570244659826_1.jpg
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/downloadFile")
    public String download(String fileName, HttpServletRequest request, HttpServletResponse response) {
        fileName = fileName.split("\\/")[3];
        System.out.println("fileName = " + fileName);
        response.setContentType("text/html;charset=utf-8");
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        String downLoadPath = request.getSession().getServletContext().getRealPath("/uploads/") + fileName;
        ;  //注意不同系统的分隔符
        //	String downLoadPath =filePath.replaceAll("/", "\\\\\\\\");   //replace replaceAll区别 *****
        System.out.println("downLoadPath=" + downLoadPath);
        try {
            long fileLength = new File(downLoadPath).length();
            response.setContentType("application/x-msdownload;");
            response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
            response.setHeader("Content-Length", String.valueOf(fileLength));
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


}
