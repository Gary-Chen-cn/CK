<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>공지 정보 목록 페이지</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-container">


    <table class="layui-table">
        <tbody>
        <tr>
            <td style="width:150px;">공고 번호</td>
            <td>${noticeinfo.noticeid}</td>
        </tr>
        <tr>
            <td style="width:150px;">공고 제목</td>
            <td>${noticeinfo.noticetitle}</td>
        </tr>
        <tr>
            <td style="width:150px;">공고 내용</td>
            <td>${noticeinfo.noticecontent}</td>
        </tr>
        <tr>
            <td style="width:150px;">배포 시간</td>
            <td>${noticeinfo.noticeaddtime}</td>
        </tr>
        <tr>
            <td style="width:150px;">공고 비고</td>
            <td>${noticeinfo.noticeremarker}</td>
        </tr>
        </tbody>
    </table>
</div>


</body>
</html>
