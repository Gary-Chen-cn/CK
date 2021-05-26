<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    //获取项目路径 例如 http://localhost:8080/weinxinadmin/ 或者 http://www.xxx.com/weinxinadmin/
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Date date = new Date();
    String strDateFormat = "yyyy-MM-dd HH:mm:ss";
    SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>공지 정보 추가 페이지</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-container">


    <form class="layui-form  layui-form-pane" action="${ctx}/noticeinfo/insert" method="post" style="width: 500px;margin: 50px auto;">

        <div class="layui-form-item">
            <label class="layui-form-label">공고 제목</label>
            <div class="layui-input-block">
                <input type="text" name="noticetitle" id="noticetitle" value="" lay-verify autocomplete="off"
                       placeholder="공지 제목을 입력해주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">공고 내용</label>
            <div class="layui-input-block">
                <input type="text" name="noticecontent" id="noticecontent" value="" lay-verify autocomplete="off"
                       placeholder="공고 내용을 입력해주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">배포 시간</label>
            <div class="layui-input-block">
                <input type="text" name="noticeaddtime" id="noticeaddtime" value="<%=nowDate%>" lay-verify autocomplete="off"
                       placeholder="배포 시간을 입력해주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">공고 비고</label>
            <div class="layui-input-block">
                <input type="text" name="noticeremarker" id="noticeremarker" value="" lay-verify autocomplete="off"
                       placeholder="공고 비고를 입력해주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">즉시제출</button>
                <button type="reset" class="layui-btn layui-btn-primary">초기화</button>
            </div>
        </div>
    </form>

</div>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    //定义layui的变量
    var $;
    var layer;
    var element;
    var form;
    layui.use(['element', 'layer', 'jquery', 'form'], function () {
        element = layui.element;
        layer = layui.layer;
        $ = layui.jquery;
        form = layui.form;

    });
</script>

</body>
</html>
