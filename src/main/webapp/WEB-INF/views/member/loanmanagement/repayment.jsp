<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷款平台-我要还款</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
</head>
<body>
	<!--head-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="resources/js/lhgcalendar.min.js"></script>
	<script type="text/javascript" src="resources/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="resources/js/loanSign/repayments.js"></script>
	<!--End head-->

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
		  <li><a href="javascript:void(0);" class="vipHeadLink">我要还款</a></li>
		  <li><a href="javascript:void(0);">提前还款</a></li>
		  <li><a href="javascript:void(0);">逾期还款</a></li>
		 </ul>
		</div>
	<!--vipContBox 按时还款-->
		<div class="vipContBox" >
		<div class="vipContTitleBox">
		<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。</h1>
		<p>您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font> 笔还款中借入。</p>
		</div>
		<form>
		<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
		 <thead>
		  <tr>
		    <th>借款编号</th>
		    <th>借款金额</th>
		    <th>年化利率</th>
		    <th>借款期限</th>
		    <th>放款日期</th>
		    <th>本期还款时间</th>
		    <th>本期还款金额</th>
		    <th>操作</th>
		  </tr>
		 </thead>
		 <tbody>
		 <c:if test="${empty schedule}">
		 	<tr>
		 		<td colspan="9">你还没有借款可以按时还款哦!</td>
		 	</tr>
		 </c:if>
		 <c:if test="${!empty schedule}">
		 <c:forEach items="${schedule}" var="sc">
		  <tr>
			  <td><a href="loaninfo/getLoanInfo.htm?id=${sc.loansign.id}">${sc.loansign.loansignbasics.loanNumber}</a></td>
			  <td><fmt:formatNumber value="${sc.loansign.issueLoan}" type="number"/> </td>
			  <td><fmt:formatNumber value="${sc.loansign.rate*100}" pattern="0.00"/>% </td>
			  <c:if test="${!empty sc.loansign.month}">
			  	<td>${sc.loansign.month}月</td>
			  </c:if>
			  <c:if test="${!empty sc.loansign.useDay}">
			  	<td>${sc.loansign.useDay}天</td>
			  </c:if>
			   <c:if test="${empty sc.loansign.month && empty sc.loansign.useDay}">
			  	<td>满标回款</td>
			  </c:if>
			  <td>${sc.loansign.publishTime}</td>
			  <td>${sc.preRepayDate}</td>
			  <td>￥<fmt:formatNumber value="${sc.money+sc.preRepayMoney}" pattern="0.00"/> </td>
			  <td><span onclick="judge(${sc.id},0)" style="color: black;">还款</span></td>
		  </tr>
		  </c:forEach>
		  </c:if>
		 </tbody>
		</table>
		</form>
		<div class="vipContPrompt">
		<h2 class="vipContTitle">还款说明：</h2>
		<p>1.借款标的本期还款详情将在还款日到期前7天显示在表格中。</p>
		<p>2.如果还款时间超过约定还款日，请在逾期还款菜单中进行还款。</p>
		<p>3.是否准时还款会影响到您的信用评分等级，信用评分等级是影响借款的一个重要因素。</p>
		</div>
		</div>
<!--End vipContBox-->
<!--vipContBox提前还款-->
		<div class="vipContBox" style="display:none;">
		<div class="vipContTitleBox">
		<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。</h1>
		<p>您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font> 笔还款中借入。</p>
		</div>
		<form>
		<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
		 <thead>
		  <tr>
		    <th>借款标号</th>
		    <th>借款金额</th>
		    <th>本期期数</th>
		    <th>剩余应还本金</th>
		    <th>本期利息</th>
		    <th>违约金</th>
		    <th>提前还款总金额</th>
		    <th>操作</th>
		  </tr>
		 </thead>
		 <tbody>
		 <c:if test="${empty advance}">
		 	<tr>
		 		<td colspan="9">你还没有借款可以提前还款哦!</td>
		 	</tr>
		 </c:if>
		 <c:if test="${!empty advance}">
		 <c:forEach items="${advance}" var="adv">
		  <tr>
			  <td><a href="loaninfo/getLoanInfo.htm?id=${adv.loanid}">${adv.loanNumber}</a></td>
			  <td><fmt:formatNumber value="${adv.money}" type="number" pattern="0.00"/></td>
			  <td>${adv.periods}</td>
			  <td>￥<fmt:formatNumber value="${adv.surplusMoney}" type="number" pattern="0.00"/></td>
			  <td>￥<fmt:formatNumber value="${adv.intester}" type="number" pattern="0.00"/></td>
			  <td>￥<fmt:formatNumber value="${adv.penalty}" type="number" pattern="0.00"/></td>
			  <td>￥<fmt:formatNumber value="${adv.countMoney}" type="number" pattern="0.00"/></td>
			  <td><span onclick="judge(${adv.id},1)" style="color: black;">还款</span></td>
		  </tr>
		  </c:forEach>
		  </c:if>
		 </tbody>
		</table>
		</form>
		<div class="vipContPrompt">
		<h2 class="vipContTitle">提前还款说明：</h2>
		<p>1.选择提前还款（提前归还剩余本金）需支付违约金。</p>
		<p>2.提前还款违约金金额为剩余未支付利息的50%；</p>
		<p>3.提前还款违约金由所有投标者所得；</p>
		<p>4.借款如有逾期，提前还款操作前须先处理已逾期款项。</p>
		<p>5.如果您并不是想要提前归还借款本金，而是归还逾期的借款，则请您进行逾期还款操作</p>

		</div>
		</div>
<!--End vipContBox-->
	<!--vipContBox逾期还款-->
		<div class="vipContBox" style="display:none;">
		<div class="vipContTitleBox">
		<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>借款人所有的借款项目都可以申请提前还款，但是要承担相应的违约金。</h1>
		<p>您目前还款中的借入总额是：<font>￥${money }</font>，共 <font>${num }</font> 笔还款中借入。</p>
		</div>
		<form>
		<table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
		 <thead>
		  <tr>
		    <th>借款编号</th>
		    <th>借款金额</th>
		    <th>年化利率</th>
		    <th>借款期限</th>
		    <th>本期逾期</th>
		    <th>应还金额</th>
		    <th>违约金</th>
		    <th>操作</th>
		  </tr>
		 </thead>
		 <tbody>
		 <c:if test="${empty overdue}">
		 	<tr>
		 		<td colspan="9">你还没有借款可以逾期还款哦!</td>
		 	</tr>
		 </c:if>
<%-- 		  <c:if test="${!empty overdue}"> --%>
<%-- 		  <c:forEach items="${overdue }" var="over"> --%>
<!-- 		  <tr> -->
<%-- 			  <td>${over.id}</td> --%>
<%-- 			  <td>${over.loansign.loansignbasics.loanNumber}</td> --%>
<%-- 			  <td>${over.loansign.loansignbasics.loanTitle}</td> --%>
<%-- 			  <td><fmt:formatNumber value="${over.loansign.rate}" pattern="0.00"/>%</td> --%>
<%-- 			  <c:if test="${!empty over.loansign.month}"> --%>
<%-- 			  	<td>${over.loansign.month}月</td> --%>
<%-- 			  </c:if> --%>
<%-- 			  <c:if test="${!empty over.loansign.useDay}"> --%>
<%-- 			  	<td>${over.loansign.useDay}天</td> --%>
<%-- 			  </c:if> --%>
<%-- 			  <c:if test="${empty adv.loansign.month && empty adv.loansign.useDay}"> --%>
<!-- 			  	<td>满标回款</td> -->
<%-- 			  </c:if> --%>
<%-- 			  <td>${over.loansign.publishTime}</td> --%>
<%-- 			  <td>${over.preRepayDate}</td> --%>
<%-- 			  <td>￥<fmt:formatNumber value="${over.money+over.preRepayMoney}" pattern="0.00"/> </td> --%>
<%-- 			  <td><span onclick="judge(${over.id})" style="color: black;">还款</span></td> --%>
<!-- 		  </tr> -->
<%-- 		  </c:forEach> --%>
<%-- 		  </c:if> --%>
		 </tbody>
		</table>
		</form>
		<div class="vipContPrompt">
		<h2 class="vipContTitle">逾期还款说明：</h2>
		<p>1、逾期还款违约金金额计算公式为（本期应还金额*0.3%*逾期天数）+（本期应还金额*0.1%逾期催收费*逾期天数）；</p>
		<p>2、还款如有逾期，担保公司会进行代偿，逾期还款违约金由第三方担保公司收取；</p>
		<p>3、逾期还款时间从约定还款日的次日凌晨0:00点开始计算，以天为单位递增。</p>
		<p>4、逾期会严重影响信用评分等级。</p>

		</div>
		</div>
<!--End vipContBox-->
</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<!--End footer-->
</body>
</html>
