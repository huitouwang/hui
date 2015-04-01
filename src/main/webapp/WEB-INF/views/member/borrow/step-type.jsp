<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>P2P网贷平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--Content-->
	<div class="Content">
		<div class="w1000px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
				
<!--vipRight-->
<div class="vipRightBox">
<div class="vipHeadMenuBox">
 <ul>
  <li><a href="javascript:void(0);" class="vipHeadLink">我要借款</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="/resources/images/vipseversicon.png" /></span>尊敬的P2P网贷平台会员，您可以在这里填写借款人信息。</h1>
</div>
<form>
<c:if test="${base.auditResult!=1}"><div style="color:red;margin-left:6%;">您还未申请成为借款人，请先申请成为借款人!<a href="../borrow/start-apply">【立刻申请】</a></div></c:if>
<table cellpadding="0" cellspacing="0" class="selectBnt">
<tr><td style="border-top:0px;border-left:0px;"><span class="selectBntBG_01">&nbsp;</span><h3>助人贷</h3><a href="../borrow/start-apply?type=1">立即申请>></a></td><td style="border-top:0px;border-right:0px;"><span class="selectBntBG_02">&nbsp;</span><h3>助企贷</h3><a href="../borrow/start-apply?type=2">立即申请>></a></td></tr>
<tr><td style="border-bottom:0px;border-left:0px;"><span class="selectBntBG_03">&nbsp;</span><h3>企业群联保贷</h3><a href="../borrow/start-apply?type=3">立即申请>></a></td><td style="border-bottom:0px;border-right:0px;"><span class="selectBntBG_04">&nbsp;</span><h3>投资人周转贷</h3><a href="../borrow/start-apply?type=4">立即申请>></a></td></tr>
</table>
</form>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

</div>
<!--End vipContBox-->
</div>
<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
</body>
</html>
