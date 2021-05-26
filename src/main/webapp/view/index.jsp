<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
<%@ page import="com.code.util.SmartHttpUtil" %>
<c:if test="${sessionScope.loginUserinfo==null}">
    <jsp:forward page="login.jsp"></jsp:forward>
</c:if>

<%
    String content = "";
    if (request.getParameter("content") != null) {
        content = request.getParameter("content");
        //String url = "https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&sl=ko&tl=zh&q='" + content + "'";
        String url = "https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&sl=zh&tl=ko&q='" + content + "'";
        String translateStr = SmartHttpUtil.sendGet(url);
        translateStr = translateStr.substring(3);
        translateStr = translateStr.split(",")[0];
        translateStr = translateStr.replaceAll("\'\"", "");
        translateStr = translateStr.replaceAll("\"\'", "");
        request.setAttribute("content", content);
        request.setAttribute("translateStr", translateStr);
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script>
        var ctx = '${ctx}/';

        //实现文件上传
        function uploadFileUtil(fileID, inputID) {
            var formData = new FormData();
            formData.append('file', $('#' + fileID + '')[0].files[0]);  //添加图片信息的参数
            formData.append('fileType', "测试参数");  //添加其他参数 
            $.ajax({
                url: ctx + '/uploadFile',
                type: 'POST',
                cache: false, //上传文件不需要缓存
                data: formData,
                processData: false, // 告诉jQuery不要去处理发送的数据
                contentType: false, // 告诉jQuery不要去设置Content-Type请求头
                success: function (data) {
                    console.log(data);
                    if (data.status == 200) {
                        //alert("文件上传成功"); 
                        $('#' + inputID + '').val(data.data.src);
                        $.post("${ctx}/getFont", {"imgPath": data.data.src}, function (result) {
                            console.log(result);
                            var result = JSON.parse(result.data);
                            var words_result = result.words_result;
                            console.log(words_result);
                            var content = "";
                            for (let i = 0; i < words_result.length; i++) {
                                var ww = words_result[i].words;
                                content = content + ww + ",";
                            }
                            $("#content").val(content);
                        }, "JSON"); //返回json格式
                    } else {
                        alert("파일 업로드 실패") //文件上传失败
                    }
                },
                error: function (data) {
                    alert(" 업로드 실패");//上传失败
                }
            })
        }
    </script>
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<!--轮播图 start-->
<jsp:include page="banner.jsp"/>
<!--轮播图 end-->

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend> 중국어를 한국어로 번역 </legend> 
    </fieldset>

    <form class="layui-form layui-form-pane" method="post" action="${ctx}/view/index.jsp">
        <div class="layui-form-item ">
            <label class="layui-form-label">사진 번역</label>
            <div class="layui-input-block">
                <input id="myfile" type="file" name="myfile" style="display: none;" onchange="uploadFileUtil('myfile','picurl')">
                <input type="text" id="picurl" name="picurl" readonly="readonly" value=""
                       placeholder="사진 업로드를 원하시면 뒷면의 파일 업로드 버튼을 클릭하세요." 
                       value="" class="layui-input" style="width: 80%;display: inline-block;"/> 
                <span onclick="uploadFileUtilClick('myfile')" class="layui-btn">
                <i class="layui-icon layui-icon-upload"></i>파일 업로드
            </span>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">중국어 내용 표시 영역</label>
            <div class="layui-input-block">
                <textarea name="content" id="content" placeholder="내용을 입력해 주세요." style="min-height: 200px" class="layui-textarea">${content}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-danger layui-btn-fluid" lay-submit="" lay-filter="demo2">번역 클릭</button>
        </div>
    </form>
    <form class="layui-form layui-form-pane" action="${ctx}/view/index.jsp">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">한국어 내용 표시 영역</label>
            <div class="layui-input-block">
                <textarea name="content" placeholder="내용을 입력해 주세요" style="min-height: 200px" class="layui-textarea">${translateStr}</textarea>
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
        var translateStr = '${translateStr}';
        if (translateStr != "") {
            var data = {"msguser": '${sessionScope.loginUserinfo.name}', "msgcontent": '${content}', "msgaddtime": '${nowTime}', "tid": '${translateStr}'}
            $.post("${ctx}/msginfo_submit", data, function (result) {
                layer.msg("번역기록을 저장 성공"); 
            }, "JSON"); //返回json格式
        }

    });
</script>
<jsp:include page="foot.jsp"/>

</body>
</html>
