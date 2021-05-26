<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<%--判断是否有错误消息--%>
<c:if test="${msg!=null}">
    <script>
        alert("${msg}");
    </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <title>JAVA한국어-중국어  시스템</title>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="${ctx}/static/css/style.css" rel='stylesheet' type='text/css'/>
    <%--设置ico图标--%>
    <link rel="shortcut icon" href="${ctx}/favicon.png" type="image/x-icon"/>
    <link rel="icon" href="${ctx}/favicon.png" type="image/gif">
</head>
<body style="background: url('${ctx}/static/bg123.jpg');background-position: center center;background-size: cover;">
<div class="main">
    <div class="login">
        <h1>사용자 로그인</h1> 
        <div class="inset">
            <!--start-main-->
            <form action="${ctx}/admininfo/login" method="post">
                <div>
                    <h2>JAVA한국어-중국어 시스템</h2>
                    <span><input type="text" placeholder="아니디" value="admin" name="username" class="textbox"></span>
                </div>
                <div>
                    <span><input type="password" placeholder="비밀번호를" value="123456" name="password" class="password"></span>
                </div>
                <div>
                    <span>
                        <a href="${ctx}/index">홈페이지로 돌아 가기</a>
                    </span>
                </div>
                <div class="sign">
                    <input type="submit" value="로그인" class="submit"/>
                </div>
            </form>
        </div>
    </div>
    <!--//end-main--> 
</div>


</body>
</html>