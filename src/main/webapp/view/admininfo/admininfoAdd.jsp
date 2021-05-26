<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />
<html>
<head>
    <title>사용자 정보 추가 페이지</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script>
        var ctx='${ctx}/';
    </script>
</head>
<body>
<div class="layui-container">


    <form class="layui-form  layui-form-pane" action="${ctx}/admininfo/insert" method="post" style="margin: 50px auto;">
			
				<div class="layui-form-item">
					<label class="layui-form-label">아이디</label>
					<div class="layui-input-block">
						<input type="text" name="adminname" id="adminname" value="" lay-verify autocomplete="off"
							   placeholder="사용자 아이디을 입력해주세요"
							   class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">비밀번호</label>
					<div class="layui-input-block">
						<input type="text" name="adminpwd" id="adminpwd" value="" lay-verify autocomplete="off"
							   placeholder="사용자 비밀번호를 입력해주세요"
							   class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">역할</label>
					<div class="layui-input-block">
						<input type="text" name="role" id="role" value="" lay-verify autocomplete="off"
							   placeholder="사용자 역할을 입력해주세요"
							   class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">사진</label>
					<div class="layui-input-block">
						<input type="text" name="headimg" id="headimg" value="" lay-verify autocomplete="off"
							   placeholder="사용자 프로필 사진을 입력해주세요"
							   class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">생성시간</label>
					<div class="layui-input-block">
						<input type="text" name="admincreatetime" id="admincreatetime" value="" lay-verify autocomplete="off"
							   placeholder="생성 시간을 입력해 주세요."
							   class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">상태</label>
					<div class="layui-input-block">
						<input type="text" name="islock" id="islock" value="" lay-verify autocomplete="off"
							   placeholder="사용자 상태을 입력해 주세요."
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
    layui.use(['element', 'layer', 'jquery', 'form','laydate','layedit'], function () {
        element = layui.element;
        layer = layui.layer;
        $ = layui.jquery;
        form = layui.form;
		var laydate = layui.laydate;
		var layedit = layui.layedit;

    });
</script>

</body>
</html>
