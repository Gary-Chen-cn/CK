<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
<html>
<head>
    <title>사용자 정보 수정 페이지</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script>
        var ctx = '${ctx}/';
    </script>
</head>
<body>
<div class="layui-container">


    <form class="layui-form  layui-form-pane" action="${ctx}/userinfo/update" method="post" style="margin: 50px auto;">

        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" readonly id="id" value="${userinfo.id}" lay-verify autocomplete="off"
                       placeholder="ID를 입력해 주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">성별</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" value="${userinfo.name}" lay-verify autocomplete="off"
                       placeholder="성별을 입력해 주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">휴대전화</label>
            <div class="layui-input-block">
                <input type="text" name="phone" id="phone" value="${userinfo.phone}" lay-verify autocomplete="off"
                       placeholder="휴대전화를 입력해 주세요"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item ">
            <label class="layui-form-label">사진</label>
            <div class="layui-input-block">
                <input id="myfile" type="file" name="myfile" style="display: none;" onchange="uploadFileUtil('myfile','picurl')">
                <input type="text" id="picurl" name="picurl" value="${userinfo.picurl}" lay-verify="required"
                       placeholder="업로드 하려면 뒤에 있는 파일 업로드 버튼을 클릭하세요"
                       value="" class="layui-input" style="width: 80%;display: inline-block;"/>
                <span onclick="uploadFileUtilClick('myfile')" class="layui-btn"><i class="layui-icon layui-icon-upload"></i>파일 업로드</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">이메일</label>
            <div class="layui-input-block">
                <input type="text" name="email" id="email" value="${userinfo.email}" lay-verify autocomplete="off"
                       placeholder="이메일을 입력해 주세요"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">역할</label>
            <div class="layui-input-block">
                <%--<input type="text" name="role"   id="role" value="${userinfo.role}" lay-verify autocomplete="off"
                       placeholder="역할을 입력해 주세요"
                       class="layui-input">--%>
                <select name="role" id="role" class="layui-select">
                    <option value="사용자">사용자</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">성별/label>
            <div class="layui-input-block">
                <input type="text" name="sex" id="sex" value="${userinfo.sex}" lay-verify autocomplete="off"
                       placeholder="성별을 입력해 주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">비밀번호</label>
            <div class="layui-input-block">
                <input type="text" name="password" id="password" value="${userinfo.password}" lay-verify autocomplete="off"
                       placeholder="비밀번호를 입력해 주세요"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">비고</label>
            <div class="layui-input-block">
                <input type="text" name="intro" id="intro" value="${userinfo.intro}" lay-verify autocomplete="off"
                       placeholder="비고를 입력해 주세요"
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
    layui.use(['element', 'layer', 'jquery', 'form', 'laydate', 'layedit'], function () {
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
