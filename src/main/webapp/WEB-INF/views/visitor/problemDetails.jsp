<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>" />
<title>p2p网贷款平台</title>
</head>
<body>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px mapString">
			<span>您当前位置：</span><a href="#">p2p网</a>><a href="#">客户问答</a>
		</div>
		<div class="w960px">
			<div class="newsContentBox">
			${problem.replyContent }
			</div>
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<!--End footer-->
</body>
</html>
