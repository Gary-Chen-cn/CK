<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>사용자 정보 목록 페이지</title>
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
                <td style="width:150px;">사용자 번호</td>
                <td>${admininfo.adminid}</td>
            </tr>
            <tr>
                <td style="width:150px;">사용자 아이디</td>
                <td>${admininfo.adminname}</td>
            </tr>
            <tr>
                <td style="width:150px;">사용자 비밀번호</td>
                <td>${admininfo.adminpwd}</td>
            </tr>
            <tr>
                <td style="width:150px;">사용자 역할</td>
                <td>${admininfo.role}</td>
            </tr>
            <tr>
                <td style="width:150px;">사용자 프로필 사진</td>
                <td>${admininfo.headimg}</td>
            </tr>
            <tr>
                <td style="width:150px;">생성 시간</td>
                <td>${admininfo.admincreatetime}</td>
            </tr>
            <tr>
                <td style="width:150px;">사용자 상태</td>
                <td>${admininfo.islock}</td>
            </tr>
        </tbody>
    </table>
</div>


</body>
</html>
