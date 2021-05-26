<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ul class="layui-nav layui-bg-green" lay-filter="" style="margin-bottom: 0px;text-align: center;">
    <li class="layui-nav-item"><a href="${ctx}/index">JAVA한국어-중국어 시스템</a></li>
    <li class="layui-nav-item"><a href="${ctx}/index">중역한</a></li>
    <li class="layui-nav-item"><a href="${ctx}/view/index2.jsp">한역중</a></li>
    <li class="layui-nav-item"><a href="${ctx}/admininfo/tologin" target="_blank">백그라운드 관리</a></li>
    <li class="layui-nav-item"><a href="${ctx}/infoList">공고정보</a></li>


    <c:if test="${sessionScope.loginUserinfo==null}">
        <li class="layui-nav-item"><a href="${ctx}/view/login.jsp">로그인</a></li>
        <li class="layui-nav-item"><a href="${ctx}/view/register.jsp">회원가입하기</a></li>
    </c:if>
    <c:if test="${sessionScope.loginUserinfo!=null}">
        <li class="layui-nav-item"><a href="${ctx}/myList">나의기록</a></li>
        <li class="layui-nav-item">
            <a href=""><img src="${sessionScope.loginUserinfo.picurl}"
                            class="layui-nav-img">${sessionScope.loginUserinfo.name}-${sessionScope.loginUserinfo.role}</a>
            <dl class="layui-nav-child">
                <dd><a href="${ctx}/userinfoCenter">개인 센터</a></dd>
                <dd><a href="${ctx}/loginOut">로그아웃</a></dd>
            </dl>
        </li>
    </c:if>
</ul>