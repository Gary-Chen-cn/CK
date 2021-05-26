<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <base href="${ctx}/"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-fluid">


    <table class="layui-table">
        <tbody>
        <tr class="layui-bg-blue">
            <th>공고 번호</th>
            <th>공고 제목</th>
            <%-- <th>공고 내용</th>--%>
            <th>배포 시간</th>
            <th>공고 비고</th>
            <th>구현하기</th>
        </tr>


        <c:forEach items="${noticeinfoList}" var="v">
            <tr>
                <td>${v.noticeid}</td>
                <td>${v.noticetitle}</td>
                    <%--<td>${v.noticecontent}</td>--%>
                <td>${v.noticeaddtime}</td>
                <td>${v.noticeremarker}</td>
                <td style="width: 180px;">
                    <a href="${ctx}/noticeinfo/edit?id=${v.noticeid}" class="layui-btn layui-btn layui-btn-sm">수졍</a>
                    <a href="${ctx}/noticeinfo/delete?id=${v.noticeid}" class="layui-btn layui-btn-danger layui-btn-sm">삭제</a>
                    <button path="${ctx}/noticeinfo/detail?id=${v.noticeid}"
                            class="layui-btn layui-btn-normal layui-btn-sm showDetail">세부
                    </button>
                </td>
            </tr>
        </c:forEach>


        </tbody>
    </table>

    <%--引入分页代码--%>
    <jsp:include page="../sortPage.jsp"></jsp:include>
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
        //绑定详情点击事件
        $(".showDetail").click(function () {
            var path = $(this).attr("path");
            layer.open({
                offset: '100px', //设置弹出窗口的位置 上边距100px
                type: 2,  //弹出类型
                skin: 'layui-layer-demo', //样式类名
                title: '공지 정보 세부 보기',
                anim: 2,    //弹出窗口使用的动画
                area: ['800px', '620px'],  //设置弹出窗口的大小 宽度,高度
                shadeClose: true, //开启遮罩关闭
                content: path  //加载内容路径
            });
        })
    });
</script>

</body>
</html>
