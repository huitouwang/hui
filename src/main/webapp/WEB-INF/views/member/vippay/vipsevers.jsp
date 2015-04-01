<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷款平台-会员中心</title>
<base href="<%=basePath %>" />
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="resources/css/vip.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script src="resources/js/shade.js" type="text/javascript"></script>

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
  <li><a class="vipHeadLink">会员升级</a></li>
  <li><a href="userinfovip/vipRecords.htm">历史记录</a></li>
 </ul>
</div>
<!--vipContBox-->
<div class="vipContBox">
<div class="vipSeverHeadBox">
<p>VIP会员有什么特权？</p>
<p><font>保本又保利！提现更快！佣金更低！及时代偿！享受特殊产品！</font></p>
<a href="<%=basePath %>to/single-1-84.htm">点击查看会员体系详情 &gt;&gt;</a>
</div>
<table cellpadding="0" cellspacing="0" border="0" class="vipSeverTable">
 <tr><th>您当前会员级别：</th><td><c:if test="${typeVip==0}">普通会员</c:if><c:if test="${typeVip==1}">特权会员</c:if></td><th>到期时间：</th><td><c:if test="${!empty time}">${time}</c:if> <c:if test="${empty time}">永久</c:if> </td></tr>
</table>
<div class="vipContTitleBox">
<h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>请点击下列套餐，购买您所需要的会员服务。</h1>
</div>
<div class="vipSeversShop">
 <div><img src="resources/images/vipsevers_img.png" /></div>
 <span>购买VIP会员服务</span>
 <label>年费:<font id="vipMoney">${type.money}</font>元</label>
 <a onclick="ShowDiv('MyDiv','fade')"><img src="resources/images/vipseversBnt.png" title="立即升级" alt="" /></a>
</div>
<div class="vipContPrompt">
<h2 class="vipContTitle"><span><img src="resources/images/vipsevers_03.jpg" /></span>温馨提示:</h2>
<p>如您在投标时会员状态为VIP会员，则在您投的这个标存续期间，您在这个标上都享受VIP会员待遇，包括佣金优惠，逾期保本保息，及时优先赔付等。即使您的VIP会员已经到期，您依旧可以享受如上的VIP会员待遇。当然，如您在投标时的状态为普通会员，您无法享受VIP会员的待遇。</p>
</div>
</div>
</div>
<!--End vipRight-->
</div>
<!--End vipcontent-->
 
 </div>
</div>
<!--End vipContent-->
<div class="clear"></div>
 <div id="fade" class="black_overlay"></div>
                <div id="MyDiv" class="white_content">
                    <div class="white_d">
                        <div class="notice_t">
                            <span class="fl" style="height:36px; line-height:36px; background:url(resources/images/notice.jpg) no-repeat left center; padding-left:45px;">p2p网提醒您</span>
                            <span class="fr" style="margin-top:7px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="resources/images/close.gif" /></span>
                        </div>
                        <table border="0" align="center" style="width:375px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
                          <tr valign="top">
                            <td width="100"><img src="resources/images/warn.jpg" width="50" height="200" /></td>
                           	
                            <td align="center" style="padding-top:40px;">
	                            <p>支付方式：
						            <select name="Gateway_Type" id="gateway_Type">
						              <option value="01" selected="selected">借记卡</option>
						              <option value="04">IPS账户支付</option>
						              <option value="08">IB支付</option>
						              <option value="16">电话支付</option>
									  <option value="64">储值卡支付</option>
						            </select>
						         </p>
<!--                             	<p>您好，您选择了升级特级会员，系统将扣除你50元手续费！</p> -->
                               	<p style="padding-top:40px;">
                                	
                                    <a id="query"><img src="resources/images/btn_s.jpg" /></a>
                               
                                    <a onclick="CloseDiv('MyDiv','fade')"><img src="resources/images/btn_c.jpg" /></a>
                                </p>
                            </td>
                          </tr>
                        </table>
                    </div>
                </div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<!--End footer-->
               
</body>
<script type="text/javascript">
$(function(){
	$("#query").click(function(){
		var $moeny = $("#vipMoney").text();
		var $gateway = $("#gateway_Type").val();
		window.location.href='/userinfovip/payment.htm?money='+$moeny+"&type="+$gateway;
	});
});
</script>
</html>
