<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-container" style="text-align: center;">
    <br>
    <br>

    <br>
    <div>
        <table class="layui-table layui-table-grid" lay-even lay-skin="line" lay-size="lg">
            <thead>
            <tr>
                <th colspan="2" style="color: green;font-weight: bold;text-align: center;font-size: 20px;">JAVA한국어-중국어 시스템</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>데이터 베이스</th>
                <th>MySQL</th>
            </tr>
            <tr>
                <th>배경 기술</th>
                <th>SSM프레임워크:Spring + Spring MVC + MyBatis</th>
            </tr>
            <tr>
                <th>프런트 엔드 기술</th>
                <th>Html+Css+JavaScript</th>
            </tr>
            <tr>
                <th>백그라운드 테스트</th>
                <th>구글 브라우저</th>
            </tr>
            <tr>
                <th>노트 저장</th>
                <th>구글 브라우저 기반</th>
            </tr>

            </tbody>
        </table>
    </div>
</div>

</body>
</html>
