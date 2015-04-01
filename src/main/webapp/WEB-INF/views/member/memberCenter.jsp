<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="LN" %>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网-百姓的理财助手 企业的融资参谋 社会的诚信标杆</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />

<script>
function getUrl(url){
if(url!=''){
document.location = url;
}
}	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="resources/js/usertab.js"></script>
<div class="vipHeadbox">
	  <div class="w1000px">
	  <div class="mymsagess" title="最新消息"><a href="<%=basePath%>member_index/system_message" class="vipmsg">${messagecount}</a></div>
          <!--头部信息-->
        <div class="vipmainHeadBox curvyCorners_5">
            <div class="basicBox">
              <div class="userImg">
              	<img src="${user.userrelationinfo.imgUrl}" alt="${user.userName }" title="${user.userName }" />
              </div>
              <h2>
              	<c:if test="${empty isVip }">普通会员</c:if>
              	<c:if test="${!empty isVip }"><font id="blink">特权会员</font></c:if>
              </h2>
            </div>
            <div class="vipboxs">
            <div class="vipHeadTop">              
              <h1>您好，
              <c:if test="${empty user.name || fn:length(user.name)<=0}">您还没有填写真实姓名</c:if>
              <c:if test="${!empty user.name }"> ${user.name }</c:if>
              <span class="logintext">上次登录：${loginLog.address } ${fn:substring(loginLog.logintime,0,10) }</span>
              </h1></div>
        <!--vipHeadLeft-->
          <div class="vipHeadLeft">
            <div class="datainfo">
              <label>账户余额：<font><fmt:formatNumber value="${empty user.userfundinfo.cashBalance ? '0.00':user.userfundinfo.cashBalance}"  type="currency"/></font>元</label>
              <div class="operatingBnt">
              	<a class="t1" href="<%=basePath%>recharge/openRecharge">充值</a>
              	<a class="t2" href="<%=basePath%>withdraw/openWithdraw" >提现</a>
              	<a class="t3" href="http://account.ips.com.cn/" target="_bank">环迅支付</a>
              </div>
            <br/>
            </div>
            <div class="clear"></div>
          </div>
        <!--End vipHeadLeft-->
        <!--vipHeadRight-->
          <div class="vipHeadRight">
           <table cellpadding="0" cellspacing="0" class="vipHeadTab">
            <tr><th colspan =2>账户名：${user.userName}<i 
            	<c:if test="${empty isVip }">class="vipSeverIconone"</c:if>
              	<c:if test="${!empty isVip }">class="vipSeverIcontwo"</c:if>
            ></i></th></tr>
            <tr><th style="width:30%">会员期限：<c:if test="${empty isVip }">永久</c:if><c:if test="${!empty isVip }">${isVip }</c:if></th><th style="width:70%">推广编号：TG-${user.id }</th>
            </tr>
           </table>
          </div>
          </div>
        <!--End vipHeadRight-->
          <div class="clear"></div>
        </div>
        </div>
        </div>
      <!--End 头部信息-->
<!--Content-->
<div class="Content">
  <div class="w1000px">
    <!--vipContent-->
    <div class="vipContentBox">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
      <!--vipRight-->
      <div class="vipRightBox">
        <div class="vipBasicInfoBox">
         <table cellpadding="0" cellspacing="0" class="basicTabIn">
          <tr><th class="infotop">账户资金总额</th></tr><tr><td class="infotop"><fmt:formatNumber value="${user.userfundinfo.money+toBeClosed+interestToBe-colltionPrinInterest+lentBid-overude}" type="currency" /><font>元</font></td></tr>
          <tr><th>可用金额</th></tr><tr><td><fmt:formatNumber value="${user.userfundinfo.money}" type="currency"/>元</td></tr>
          <tr><th>冻结金额</th></tr><tr><td><fmt:formatNumber value="${lentBid}" type="currency"/>元</td></tr>
          <tr><th>预计账户总收益</th></tr><tr><td style="padding-bottom:20px;"><fmt:formatNumber value="${interestToBe}" type="currency"/>元</td></tr>
         </table>
         <table cellpadding="0" cellspacing="0" class="basicTabIn">
          <tr><th class="infotop">已得收益</th></tr><tr><td class="infotop"><fmt:formatNumber value="${netInterest}" type="currency"/><font>元</font></td></tr>
          <tr><th>待收收益</th></tr><tr><td><fmt:formatNumber value="${interestToBe}" type="currency"/>元</td></tr>
          <tr><th>待收本金</th></tr><tr><td><fmt:formatNumber value="${toBeClosed}" type="currency"/>元</td></tr>
          <tr><th>奖励金额</th></tr><tr><td style="padding-bottom:20px;"><fmt:formatNumber value="${user.userfundinfo.bonusBalance}" type="currency"/>元</td></tr>
         </table>
         <table cellpadding="0" cellspacing="0" class="basicTabIn" style="margin:0px;">
          <tr><th class="infotop">累计已出借总额</th></tr><tr><td class="infotop"><fmt:formatNumber value="${totalInvest}" type="currency"/><font>元</font></td></tr>
          <tr><th>待确认充值</th></tr><tr><td><fmt:formatNumber value="${toRecharge}" type="currency"/>元</td></tr>
          <tr><th>待确认提现</th></tr><tr><td><fmt:formatNumber value="${toWithdraw}" type="currency"/>元</td></tr>
          <tr><th>提现处理中</th></tr><tr><td style="padding-bottom:20px;"><fmt:formatNumber value="${toWithdraw}" type="currency"/>元</td></tr>
         </table>
         <div class="clear"></div>
        </div>
        <div class="userbox">
        <table cellpadding="0" cellspacing="0" class="vipBasicInfo">
         <tbody>
          <tr>
          	<th>真实姓名：</th>
          	<td>
	          	<c:if test="${empty user.name || fn:length(user.name)<=0}">未设置</c:if>
	            <c:if test="${!empty user.name }"> ${user.name }</c:if>
          	</td>
              	<th>注册时间：</th>
          	<td>${fn:substring(user.createTime,0,10)}</td>
          	<th>电子邮箱：</th>
          	<td   style="border-right: 0px;">
          		<c:if test="${empty user.userrelationinfo.email || fn:length(user.userrelationinfo.email)<=0}">未设置</c:if>
	            <c:if test="${!empty user.userrelationinfo.email }"> <LN:email_tags email="${user.userrelationinfo.email }" /><a href="<%=basePath %>member/mail">[修改并验证]</a></c:if>
          	</td>
          </tr>
          <tr>
          	<th>手机号码：</th>
          	<td>
          		<c:if test="${empty user.userrelationinfo.phone || fn:length(user.userrelationinfo.phone)<=0}">未设置</c:if>
	            <c:if test="${!empty user.userrelationinfo.phone }"><LN:phone_tags phonenum="${user.userrelationinfo.phone }" /><a href="<%=basePath %>member/mail">[修改并验证]</a></c:if>
          	</td>
          	<th>身份证号：</th>
          	<td>
          		<c:if test="${empty user.userrelationinfo.cardId || fn:length(user.userrelationinfo.cardId)<=0}">未设置</c:if>
	            <c:if test="${!empty user.userrelationinfo.cardId }"><LN:card_tags cardnum="${user.userrelationinfo.cardId }" /></c:if>
          	</td>
          	<th>会员等级：</th>
          	<td   style="border-right: 0px;"> 
          		<c:if test="${empty isVip }">普通会员<a href="<%=basePath %>userinfovip/upgrade.htm">[升级成VIP]</a></c:if>
              	<c:if test="${!empty isVip }"><font id="blink">特权会员</font></c:if>
          	</td>
          </tr>
          <tr>
          	<th>昵称：</th>
          	<td>
          		<c:if test="${empty user.nickname || fn:length(user.nickname)<=0}">未设置</c:if>
	            <c:if test="${!empty user.nickname }"> ${user.nickname }<a href="<%=basePath %>update_info/basicinfo">[修改]</a></c:if>
          	</td>
    
          	<th>安全问题：</th>
          	<td>
          		<c:if test="${!bool}">未设置</c:if>
	            <c:if test="${bool}">已设置<a href="<%=basePath %>member/mail">[修改并验证]</a></c:if>
          	</td>
          </tr>
          <tr>
          </tr>
         </tbody>
         
         <c:if test="${empty user.userrelationinfo.cardId || empty user.userrelationinfo.phone || user.userrelationinfo.emailisPass!=1 || !bool}">
         <tfoot>
          <tr><td colspan="4"><i></i><span style="display: inline-block;">温馨提示：为了您账户安全，请尽快完善安全验证！</span></td></tr>
         </tfoot>
         </c:if>
        </table>
        </div>
 <div class="jiekuanList dataInfo" style="width:815px;">
 <div class="jiekanTitleBox">
 <ul>
 <li class="on"><h1 onclick="getUrl('depositshistory/init_two')">投资记录</h1></li>
 <li><h1 onclick="getUrl('<%=basePath%>borrower_record/toRecord')">借款记录</h1></li>
 </ul>
 </div>
 <div class="tabbody">
  <!-- End借款方相关资料 -->
   <!-- 借出记录 -->
  <div class="dataContBox" style="display: none;">
        <table cellpadding="0" cellspacing="0" class="vipRecordTab">
         <tbody>
          <tr>
          	<th>竞标中投资</th>
          	<th>回收中投资</th>
          	<th>收完的投资</th>
          	<th>累计收益</th>
          	<th>累计逾期</th>
          </tr>
          <tr>
          	<td><fmt:formatNumber value="${lentBid}" type="currency"/></td>
          	<td><fmt:formatNumber value="${goingBack}" type="currency"/></td>
          	<td><fmt:formatNumber value="${endBack}" type="currency"/></td>
          	<td><fmt:formatNumber value="${netInterest}" type="currency"/></td>
          	<td><fmt:formatNumber value="${overude}" type="currency"/></td>
          </tr>
         </tbody>
        </table>
  </div>
  <!-- End借出记录 -->
   <!-- 借款历史记录 -->
  <div class="dataContBox" style="display: none;">
        <table cellpadding="0" cellspacing="0" class="vipRecordTab">
         <tbody>
          <tr>
          	<th>发标中借款</th>
          	<th>偿还中借款</th>
          	<th>还清的借款</th>
          	<th>累计利息成本</th>
          	<th>授信额度</th>
          	<th>已用额度</th>
          </tr>
          <tr>
          	<td><fmt:formatNumber value="${goingLent}" type="currency"/></td>
          	<td><fmt:formatNumber value="${goingLented}" type="currency"/></td>
          	<td><fmt:formatNumber value="${endLent}" type="currency"/></td>
          	<td><fmt:formatNumber value="${interest}" type="currency"/></td>
          	<td><fmt:formatNumber value="${user.userfundinfo.credit}" type="currency"/>元</td>
          	<td><fmt:formatNumber value="${usedAmount}" type="currency"/></td>
          </tr>
         </tbody>
        </table>
  </div>
</div>
</div>
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
