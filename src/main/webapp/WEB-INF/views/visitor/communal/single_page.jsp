<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath %>" />
<title>p2p网贷款平台</title>
</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End top-->
<!--Content-->
<div class="Content">
  <div class="w960px mapString"><span>您当前位置：</span><a href="<%=basePath%>">p2p网</a>&gt;${deputy.topic.name }&gt;${deputy.name }</div>
  <div class="w960px">
      <jsp:include page="/WEB-INF/views/visitor/communal/left.jsp"/>
      <div class="projectRightBox">
      <!--TxList Cont-->
        <div class="pjRightCont">
           <div class="ContentTextBox">
           <c:if test="${type eq 'single' }">${deputy.pageHtml }</c:if>
           <c:if test="${type eq 'article' }">${article.context }</c:if>
          </div>
        </div>
           <!--End porjectBox-->
        </div>
        <!--End TxList Cont-->
      </div>
  </div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<script type="text/javascript" src="<%=basePath %>resources/js/autolist.js"></script>
<!--End footer-->
</body>
</html>
