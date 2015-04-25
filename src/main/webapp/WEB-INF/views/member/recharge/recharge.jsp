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
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
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
				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">在线充值</a></li>
							<li><a href="/recharge/openRechargeRecord">充值记录</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="resources/images/vipseversicon.png" /></span>温馨提示：
							</h1>
							<p>
								单笔充值金额必须大于<font>100元</font>。为遵守国家反洗钱和套现行为的相关法律规定：信用卡充值，不投标要超过30天
								后才能提现： 储蓄卡充值，不投标要等7天后才能提现<br/>
								注：您充值的手续费由平台支付给环讯。
							</p>
						</div>
						<form action="/recharge/sign" id="from-data-tjcz" method="post" >
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipVerification lineTables">
								<tbody>
									<tr>
										<th><img src="resources/images/recharge.jpg" title=""
											alt="" /></th>
										<td><p>您好，请选择支付方式</p>
											<br /> <input type="radio" name="rechargeType" value="2" /> 资金代扣<br />
											<input type="radio" name="rechargeType" value="1" checked="checked" />
											在线充值</td>
									</tr>
								</tbody>
							</table>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<th>请输入充值金额:</th>
										<td><input type="text" id="tranAmt" name="tranAmt" class="vipTextBox validate[required,custom[numberNullMinus,min[1],max[200000]]]"
											style="width: 160px;" value="100" /> 元</td>
									</tr>
									<!-- <tr>
										<th>请选择银行:</th>
										<td><select style="width: 160px;" name="bankinfo" >
											<c:forEach items="${banks}" var="bank"><option value="${bank.bankNumber}">${bank.bankName}</option></c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>充值手续费:</th>
										<td>￥<span id="poundage" style="color:#fd8419">0.30</span> 元<span style="color:#fd8419">(由p2p网支付)</span></td>
									</tr>
									<tr>
										<th>实际到账金额:</th>
										<td><span id="dMoney" style="color:#fd8419">100.00</span> 元</td>
									</tr>
									 -->
								</tbody>
							</table>
							
							<div class="tableSetBntBox">
								<input type="submit" value="提交" /> <input type="reset"
									value="取消" />
							</div>
						</form>
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage" style="border:0px;">
								<tbody>
									<tr>
										<td style="border:0px;">温馨提示：</td>
									</tr>
									<tr>
										<td style="border:0px;">1.单笔充值金额必须大于100元。</td>
									</tr>
									<tr>
										<td style="border:0px;">2.环迅支付会向每笔充值收取相应金额的充值手续费，该费用由p2p网替会员承担。</td>
									</tr>
									<tr>
										<td style="border:0px;">3.为防止货币资源的闲置造成额外的成本开支，会员用户在成功充值后15天之内提现，p2p网会对提现金额中未投资部分收取0.5%的费用。会员用户在成功充值后15天以后提现的，对提现金额中未投资部分收取0.3%的费用。</td>
									</tr>
									<tr>
										<td style="border:0px;">4. 为遵守国家反洗钱和套现行为的相关法律规定，p2p网不支持信用卡充值。</td>
									</tr>
									<tr>
										<td style="border:0px;">5. 在充值过程如遇任何问题，请联系P2P网贷平台客服 ${footer.phone }</td>
									</tr>
								</tbody>
							</table>
					</div>
				</div>
				<!--End vipRight-->
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<script>
	$(function() {
		$("#from-data-tjcz").validationEngine({});
		$("#tranAmt").keyup(function(){
			var num = $(this).val();
			if(isNaN(num)){
				$(this).val('');
			}else{
				if(num.indexOf(".")>0){
					if(num.substring(num.indexOf(".")).length>3){
						$(this).val(num.substring(0,num.indexOf(".")+3));
					}
				}
			}
		});
		$("#tranAmt").blur(function(){
			var num = $(this).val();
			if(num<=0){
				$(this).val(100);
				num=100;
			}
			if(num>200000){
				$(this).val(200000);
				num=200000;
			}
			$("#poundage").text(fmoney(num*0.003,2));
			$("#dMoney").text(fmoney(num));
		});
	});
	
	function fmoney(s, n)   
		{   
		   n = n > 0 && n <= 20 ? n : 2;   
		   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
		   var l = s.split(".")[0].split("").reverse(),   
		   r = s.split(".")[1];   
		   t = "";   
		   for(i = 0; i < l.length; i ++ )   
		   {   
		      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
		   }   
		   return t.split("").reverse().join("") + "." + r;   
		} 

	</script>
</body>
</html>
