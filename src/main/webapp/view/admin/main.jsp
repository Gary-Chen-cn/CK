<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<c:if test="${sessionScope.loginUser==null}">
    <script>
        alert("로그인 후 방문 가능");
        location.href = "${ctx}/view/admin/login.jsp";
    </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>JAVA한국어-중국어  시스템</title>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <script src="${ctx}/static/js/jquery-1.9.1.min.js"></script>
    <%--设置ico图标--%>
    <link rel="shortcut icon" href="${ctx}/favicon.png" type="image/x-icon"/>
    <link rel="icon" href="${ctx}/favicon.png" type="image/gif">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="width: 250px;">JAVA한국어-중국어  시스템</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" >
            <li class="layui-nav-item">
                <a href="javascript:;">관리자 관리</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/admininfo/add" target="tqmContent">관리자 추가</a></dd>
                    <dd><a href="${ctx}/admininfo/list" target="tqmContent">관리자 목록</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">사용자 관리</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/userinfo/add" target="tqmContent">사용자 추가</a></dd>
                    <dd><a href="${ctx}/userinfo/list" target="tqmContent">사용자 목록</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">번역 정보 관리</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/msginfo/add" target="tqmContent">번역 정보 추가</a></dd>
                    <dd><a href="${ctx}/msginfo/list" target="tqmContent">번역 정보 목록</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">공지 사항 관리</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/noticeinfo/add" target="tqmContent">공지 사항 추가</a></dd>
                    <dd><a href="${ctx}/noticeinfo/list" target="tqmContent">공지 사항 목록</a></dd>
                </dl>
            </li>


        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${ctx}/static/aa.jpg" class="layui-nav-img">
                    ${sessionScope.loginUser.adminname}-${sessionScope.loginUser.role}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/admininfo/edit?id=${sessionScope.loginUser.adminid}"
                           target="tqmContent">비밀번호 변경</a></dd>
                    <dd><a href="${ctx}/admininfo/detail?id=${sessionScope.loginUser.adminid}"
                           target="tqmContent">개인 센터</a>
                    </dd>
                    <dd><a href="${ctx}/admininfo/loginOut">로그아웃</a>
                    </dd>
                </dl>

            </li>
        </ul>
    </div>


    <div class="layui-body" style="left: 0px;width: 100%;">
        <!-- 内容主体区域 -->
        <!-- 内容主体区域 -->
        <div style="padding: 0px;height: 100%;width: 100%;">
            <iframe src="${ctx}/view/welcome.jsp" name="tqmContent"
                    style="border: 0px solid blue;height: 100%;width: 100%;scrolling:auto;">

            </iframe>
        </div>
    </div>

    <div class="layui-footer" style="left: 0px;text-align: center;">
        <!-- 하단 저작권 영역 -->
      JAVA한국어-중국어  시스템-하단 저작권 영역
    </div>
</div>

<script>
    //JavaScript代码区域
    layui.use(['element', 'form'], function () {
        var element = layui.element;
        var form = layui.form;

    });
</script>
</body>
</html>