<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>번역 정보 목록 페이지</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-container">


    <table class="layui-table">
        <tbody>
        <tr>
            <td style="width:150px;">번역 번호</td>
            <td>${msginfo.msgid}</td>
        </tr>
        <tr>
            <td style="width:150px;">번역자</td>
            <td>${msginfo.msguser}</td>
        </tr>
        <tr>
            <td style="width:150px;">번역 내용</td>
            <td>${msginfo.msgcontent}</td>
        </tr>
        <tr>
            <td style="width:150px;">번역 결과</td>
            <td>${msginfo.tid}</td>
        </tr>
        <tr>
            <td style="width:150px;">번역 시간</td>
            <td>${msginfo.msgaddtime}</td>
        </tr>
        </tbody>
    </table>
</div>


</body>
</html>
