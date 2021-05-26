<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="layui-footer footer footer-index"
     style="text-align: center;background-color: rgba(0,0,0,0.8);padding: 10px;font-size: 15px;color: #eee;">
  <div class="layui-main">
    <h4>©  JAVA 한국어-중국어  시스템</h4>
    <p>
      JAVA한국어-중국어 시스템 프론트 페이지
    </p>
  </div>
</div>

<script>
  //注意：导航 依赖 element 模块，否则无法进行功能性操作
  layui.use('element', function(){
    var element = layui.element;

    //…
  });
</script>