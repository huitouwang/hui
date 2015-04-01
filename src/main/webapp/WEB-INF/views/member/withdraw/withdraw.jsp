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
<title>p2p网贷款平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link rel="stylesheet" href="../resources/css/validationEngine.jquery.css"
	type="text/css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script src="/resources/js/jquery.validationEngine.js"
	type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js"
	type="text/javascript"></script>
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
							<li><a href="javascript:void(0);" class="vipHeadLink">账户提现</a></li>
							<li><a href="<%=basePath%>withdraw/query.htm">提现记录</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>温馨提示：
							</h1>
							<p>1、p2p网规定客户设置的提现账户名，必须与其在p2p网进行实名认证时身份证的名字相同。即提现的银行账户必须是客户本人账户。</p>
							<p>2、为遵守国家反洗钱和套现行为的相关法律规定，p2p网不支持信用卡提现。</p>
							<p>3、p2p网处理提现时间：周一至周五，上午11：00 处理一次，下午16：00处理一次。双休日和法定节假日期间，用户可以申请提现，p2p网会在最近一个工作日进行处理。</p>
							<p>4. 为防止货币资源的闲置造成额外的成本开支，会员用户在成功充值后15天之内提现，p2p网会对提现金额中未投资部分收取0.5%的费用。会员用户在成功充值后15天以后提现的，对提现金额中未投资部分收取0.3%的费用。</p>
							<p>5、平台禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户使用。</p>
							<p>6、在提现过程如遇任何问题，请联系P2P网贷平台客服 ${footer.phone }。</p>
						</div>
						<br /> <br /> <br />

						<form action="/withdraw/ipsWithdraw" method="post" id="withdraw">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<th>您的p2p网帐号:</th>
										<td>tangke</td>
									</tr>
									<tr>
										<th>您账户可用余额:</th>
										<td>0.00元</td>
									</tr>
									<tr>
										<th>提现金额:</th>
										<td><input type="text" name="money" class="vipTextBox"
											style="width: 120px;" /> 元</td>
									</tr>
									<tr>
										<th>提现手续费:</th>
										<td><span style="color:#fd8419">￥3.00元(由第三方托管平台收取)</span></td>
									</tr>
									<tr>
										<td colspan="2"><span style="color: #cb5c3e">注意:若提现金额中有未投标部分，该部分将会收取一定的费用</span></td>
									</tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input type="submit" value="提交" /> <input type="reset"
									value="取消" />
							</div>
						</form>
						<br /> <br /> <br /> <br />
						<div class="vipContPrompt">
							<h2 class="vipContTitle">
								<span><img src="resources/images/vipsevers_03.jpg" /></span>注意:
							</h2>
							<p>1、提现前请先到IPS绑定你本人现有的且可用的银行卡卡号,否则将不能提现。</p>
							<p>2、单笔提现金额不得低于最低限额0.001元。</p>
							<p>3、提现金额低于2000元提现手续费单笔0.001元,提现金额大于等于2000元免手续费(平台代付),手续费由第三方收取的，与p2p网无关。</p>
							<p>4、为确保款项能及时转入您的银行帐号，请正确填写您的联系方式。</p>
							<p>5、由于所有充值行为都是在第三方平台的账户之间划拨，烦请注意第三方平台的服务时间可能造成的时间延误。</p>
						</div>
						<br /> <br /> <br /> <br />
					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>

		</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<script>
	$(function() {
		$("#withdraw").validationEngine({});
	})
	</script>
</body>
</html>
