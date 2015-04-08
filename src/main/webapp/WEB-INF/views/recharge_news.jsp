<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 该页面为测试环讯注册页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
	<h3>正在提交信息,请稍后......</h3>
	<form action="${map.url}" id="f456" method="post">
		<input type="hidden" name="Mer_code" value="${map.Mer_code}">
		<input type="hidden" name="Billno" value="${map.Billno}">
		<input type="hidden" name="Amount" value="${map.Amount}">
		<input type="hidden" name="Date" value="${map.Date}">
		<input type="hidden" name="Currency_Type" value="${map.Currency_Type}">
		<input type="hidden" name="Gateway_Type" value="${map.Gateway_Type}">
		<input type="hidden" name="Merchanturl" value="${map.Merchanturl}">
		<input type="hidden" name="FailUrl" value="${map.FailUrl}">
		<input type="hidden" name="OrderEncodeType" value="${map.OrderEncodeType}">
		<input type="hidden" name="RetEncodeType" value="${map.RetEncodeType}">
		<input type="hidden" name="Rettype" value="${map.Rettype}">
		<input type="hidden" name="ServerUrl" value="${map.ServerUrl}">
		<input type="hidden" name="attach" value="${map.attach}">
		<input type="hidden" name="SignMD5" value="${map.SignMD5}">
	</form>
	<script type="text/javascript">
 		document.getElementById("f456").submit();
    </script>  
</html>