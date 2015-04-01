<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>p2p网会员中心-资金统计</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/vipcenter.css" />
</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />

<!--Content-->
<div class="Content">
 <div class="w1000px">

<!--vipContent-->
<div class="vipContentBox">
<!--vipLeft-->
<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
<!--End vipLeft-->

<!--vipRight-->
<div class="vipRightBox">
<div class="vipHeadMenuBox">
 <ul>
  <li><a href="javascript:void(0);" class="vipHeadLink">资金统计</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="<%=basePath %>resources/images/vipseversicon.png" /></span>尊敬的p2p网用户，以下是您在p2p网的资金统计，敬请仔细审阅：</h1>
</div>
<form>
<table cellpadding="0" cellspacing="0" border="0" class="vipStatisticsTable">
 <thead>
  <tr><th colspan="3"><h4>资金流量</h4></th></tr>
 </thead>
 <tbody>
  <tr><th>累计充值总额：</th><td><fmt:formatNumber value="${rechargeSuccess}" type="currency"/>元</td><td>（注册至今您的账户累计充值总额）</td></tr>
  <tr><th>累计提现金额：</th><td><fmt:formatNumber value="${withdrawSucess}" type="currency"/>元</td><td>（注册至今，您的账户累计提现总额，已扣除提现手续费）</td></tr>
  <tr><th>累计投资金额：</th><td><fmt:formatNumber value="${investmentRecords}" type="currency"/>元</td><td>（注册至今，您账户借出资金总和）</td></tr>
  <tr><th>累计借款金额：</th><td><fmt:formatNumber value="${borrowing}" type="currency"/>元</td><td>（注册至今，您账户借入资金总和）</td></tr>
  <tr><th>累计支付管理费：</th><td><fmt:formatNumber value="${commission+borrowersFee}" type="currency"/>元 </td><td>（支付的p2p网借出与借入管理费总和）</td></tr>
 </tbody>
</table>

<table cellpadding="0" cellspacing="0" border="0" class="vipStatisticsTable">
 <thead>
  <tr><th colspan="3"><h4>资金详情</h4></th></tr>
 </thead>
 <tbody>
  <tr><th>账户余额：</th><td><fmt:formatNumber value="${empty user.userfundinfo.money ? '0.00':user.userfundinfo.money}" type="currency"/>元</td><td>（可以用来投标或者提现金额）</td></tr>
  <tr><th>待收本息金额：</th><td><fmt:formatNumber value="${toBeClosed+interestToBe}" type="currency"/>元</td><td>（已经借出，尚未收回的本金和利息总额，已扣除技术服务费）</td></tr>
  <tr><th>待付本息金额：</th><td><fmt:formatNumber value="${colltionPrinInterest}" type="currency"/>元</td><td>（已经借入，尚未偿还的本金和利息总额）</td></tr>
  <tr><th>待确认投标：</th><td><fmt:formatNumber value="${lentBid}" type="currency"/>元</td><td>（您已经投标，但尚未满标的投资金额）</td></tr>
  <tr><th>逾期总额：</th><td><fmt:formatNumber value="${overude}" type="currency"/>元 </td><td>（逾期的总额）</td></tr>
  <tr><th>冻结金额：</th><td><fmt:formatNumber value="${netMark}" type="currency"/>元 </td><td>（待付本息+逾期总额)</td></tr>
  <tr><th>已冻结：</th><td><fmt:formatNumber value="${empty user.userfundinfo.frozenAmtN ? '0.00':user.userfundinfo.frozenAmtN}" type="currency"/>元</td><td>（不能投标不能提现，只能还款的金额)</td></tr>
  <tr><th>还需冻结：</th><td><fmt:formatNumber value="${netMark-(empty user.userfundinfo.frozenAmtN ? '0.00':user.userfundinfo.frozenAmtN)}" type="currency"/>元</td><td>（还需要冻结的金额）</td></tr>
  </tbody>
  <tfoot>
   <tr><th>账户资产总额：</th><td><fmt:formatNumber value="${user.userfundinfo.money+toBeClosed+interestToBe-colltionPrinInterest+lentBid-overude}" type="currency"/>元 </td><td>（您在p2p网平台上现金资产总额)</td></tr>
   <tr><td colspan="3">账户资产总额 =可用金额+ 待收本息金额 - 待付本息金额 + 待确认投标-逾期总额</td></tr>
  </tfoot>
</table>

<table cellpadding="0" cellspacing="0" border="0" class="vipStatisticsTable">
 <thead>
  <tr><th colspan="3"><h4>资金损益</h4></th></tr>
 </thead>
 <tbody>
  <tr><th>净赚利息：</th><td><fmt:formatNumber value="${netInterest}" type="currency"/>元</td><td>（投资净赚的投资利息总和，已扣除投资服务费）</td></tr>
  <tr><th>净付利息：</th><td><fmt:formatNumber type="currency" value="${netInterestPaid}"/>元</td><td>（借款支付的借款利息总和，已扣除服务费）</td></tr>
  <tr><th>逾期还款违约金：</th><td><fmt:formatNumber type="currency" value="${latePayment}"/>元</td><td>（借款者因逾期还款所支付的违约罚款）</td></tr>
  <tr><th>提前还款违约金：</th><td><fmt:formatNumber type="currency" value="${prepayment}"/>元 </td><td>（借款者因提前还款所支付的违约罚款）</td></tr>
  <tr><th>累计收到奖金：</th><td><fmt:formatNumber value="${accumulative}" type="currency"/>元</td><td>（累计收到奖金总额）</td></tr>
  <tr><th>累计支付会员费：</th><td><fmt:formatNumber value="${vipSum}" type="currency"/>元</td><td>（支付的p2p网平台会员费总和)</td></tr>
  <tr><th>累计提现手续费：</th><td><fmt:formatNumber value="${witharwDeposit}" type="currency"/>元</td><td>（支付的提现手续费总和）</td></tr>
  <tr><th>累计充值手续费：</th><td><fmt:formatNumber value="${rechargeDeposit}" type="currency"/>元</td><td>（支付的充值手续费总和）</td></tr>
  <tfoot>
   <tr><th>累计盈亏总额：</th><td><fmt:formatNumber value="${netInterest-netInterestPaid+accumulative-vipSum-witharwDeposit-rechargeDeposit-latePayment-prepayment}" type="currency"/>元</td><td>（您在p2p网平台上累计盈亏的总额)</td></tr>
   <tr><td colspan="3">累计盈亏总额=净赚利息 - 净付利息 + 累计收到奖金 - 累计支付会员费  - 累计提现手续费 - 累计充值手续费 - 逾期还款违约金 - 提前还款违约金</td></tr>
  </tfoot>
</table>

<table cellpadding="0" cellspacing="0" border="0" class="vipStatisticsTable">
 <thead>
  <tr><th colspan="3"><h4>资金逾期</h4></th></tr>
 </thead>
 <tbody>
  <tr><th>待收本金总额：</th><td><fmt:formatNumber value="${toBeClosed}" type="currency"/>元</td><td>（已经借出，尚未回收的本金总额）</td></tr>
  <tr><th>待收利息总额：</th><td><fmt:formatNumber value="${interestToBe}" type="currency"/>元</td><td>（已经借出，尚未回收的利息总额）</td></tr>
  <tr><th>待扣借出服务费：</th><td><fmt:formatNumber value="${lendingFees }" type="currency"/>元</td><td>（已经借出，尚未扣除的服务费总额）</td></tr>
  <tr><th>待付本金总额：</th><td><fmt:formatNumber value="${colltionPrinInterest-colltionInterest}" type="currency"/>元</td><td>（已经借入，尚未偿还的本金总额）</td></tr>
  <tr><th>待付利息总额：</th><td><fmt:formatNumber value="${colltionInterest}" type="currency"/>元 </td><td>（已经借入，尚未偿还的利息总额）</td></tr>
  </tbody>
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

</div>
<!--End vipContBox-->
</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
</body>
</html>