<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷款平台-用户登录</title>
<link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
<link rel="stylesheet" href="/resources/js/flexslider/flexslider.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.cookies.2.2.0.js"></script>
<script type="text/javascript" src="/resources/js/flexslider/jquery.flexslider.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script src="/resources/js/jquery.validationEngine.js"	type="text/javascript"></script>
<script src="/resources/js/jquery.validationEngine-zh_CN.js"	type="text/javascript"></script>
<script src="/resources/js/login.js" type="text/javascript"></script>
</head>
<body>
<%--会员未登录 --%>
<c:if test="${empty session_user }">
	<div class="topBox">
		<div class="w1000px pot_r">
			<div class="topLeftMenu">
            <span class="p1"><i class="ico"></i>客服电话：${footer.phone }</span><span class="p2">在线客服 (工作中)</span>
            <div class="topwebLinks"><a href="#" class="p1" title="QQ"></a><a href="# " class="p2" title="微信"></a><a href="#" class="p3" title="微博"></a></div>
			</div>
			<div class="topRightMenu">
	            <a href="<%=basePath%>to/single-5-49.htm">新手指引</a>
				<a href="/member_index/member_center" >我的账户</a> 
	            <a href="/recharge/openRecharge">充值</a> 
	            <span class="user-to"><a href="/visitor/to-login" style="border-right: 1px solid #e0e0e0;">登录</a><a href="/visitor/to-regist" style="color:#ff9e57;">注册</a></span>
			</div>
		</div>
	</div>
</c:if>
<%--会员已经登录 --%>
<c:if test="${!empty session_user }">
	<div class="topBox">
		<div class="w1000px pot_r">
			<div class="topLeftMenu">
            <span class="p1"><i class="ico"></i>客服电话：${footer.phone }</span><span class="p2">在线客服 (工作中)</span>
            <div class="topwebLinks"><a href="#" class="p1" title="QQ"></a><a href="# " class="p2" title="微信"></a><a href="#" class="p3" title="微博"></a></div>
			</div>
			<div class="topRightMenu">
				<span style="color: #656565;">欢迎，${session_user.userName}
					！</span><a href="/member_index/system_message" class="topIcon_5"><font
					<c:if test="${messagecount>0}">class="blink"</c:if>>消息</font><font
					class="colorRed">(${messagecount})</font></a><a
					href="/member_index/member_center" id="tip1" class="topIcon_3">我的账户</a>
				<a href="<%=basePath%>to/single-5-103.htm" class="topIcon_4">帮助</a>
				<a href="javascript:void(0);" class="login_out" >安全退出</a>
			</div>
		</div>
	</div> 
</c:if>
<!--End top-->
	<div class="w1000px" style="margin:0 auto;">
	<a href="<%=basePath %>" class="loginLogo"><img
				src="/resources/images/logo.png" alt="" title="p2p网平台" /></a> <span
				class="Logintitle">欢迎登录</span>
	</div>
	<!--Content-->
	<div class="loginContent">
		<div class="w1000px loginBox">
			<div class="loginLeft">
			<div class="listmask">
        <div class="flexslider">
          <ul class="slides">
				<li style="margin: 0px;"><a href="/to/single-4-95.htm"> <span class="tuwenIcon_1">&nbsp;</span>
						<h2 class="tuwenColor_1">低风险，高回报</h2>
						<p>专业的风控审核从借款源头降低投资风险，16%以上的年化收益回报远高于其它投资渠道</p>
				</a></li>
				<li><a href="/to/single-4-94.htm"> <span class="tuwenIcon_2">&nbsp;</span>
						<h2 class="tuwenColor_2">100%本金保障</h2>
						<p>引入第三方担保机构，应对一切逾期及坏账风险，100%保障投资者资金安全</p>
				</a></li>
				<li><a href="/to/single-4-95.htm"> <span class="tuwenIcon_3">&nbsp;</span>
						<h2 class="tuwenColor_3">第三方资金托管</h2>
						<p>与第三方支付平台合作资金托管机制，规避平台运营风险，化解国家监管难题，更加保障投资者资金安全</p>
				</a></li>
			</ul>
			</div>
			</div>
			</div>
			<div class="loginRight">
							<form action="/registration/login" method="post" id="df_login" >
					<table cellpadding="0" cellspacing="0" border="0"
						class="loginTable">
						<tbody>
							<tr>
						    <h1>用户登录</h1>
							</tr>
								<td><input type="text" id="username"
									class="loginTx validate[required,minSize[5],maxSize[20]]" name="userName" placeholder="用户名/手机号" value="${userName}" /> <label
									class="userVf Vf_P1">请输入帐号</label></td>
							</tr>
							<tr>
								<td><input id="pwd" type="password" name="pwd" placeholder="请输入密码" class="loginTx validate[required,maxSize[12],minSize[6]]" /> <label
									class="userVf Vf_P2">请输入密码</label></td>
							</tr>
							<tr>
								<td><input type="text" name="captcha"
									class="loginVftx validate[required,maxSize[4],minSize[4]]" placeholder="请输入验证码"/>
									<span class="loginVfImg" style="margin:10px 0px;"> <img
										src="/cic/code?name=user_login"
										onclick="this.src='/cic/code?name=user_login&id='+new Date();"
										title="看不清，点击换一张" style="cursor: pointer;" />
								</span></td>
							</tr>
							<tr>
								<td><span class="left"><input id="uscheck" class="checkbox" type="checkbox"/><label for="example">记住用户名</label></span><span class="right"><a href="/find_password/init.do" class="loginLinkA">忘记密码？</a> | <a href="/visitor/to-regist" class="registA">免费注册</a></span></td>
							</tr>
							<tr>
								<td><input type="submit" value="登录" class="loginBnt" onclick="saveUserInfo()"/> <c:if
										test="${!empty user_error}">
										<font style="color: red;">${user_error }</font>
									</c:if> <c:if test="${msg eq 1}">
										<font style="color: red;">验证码错误</font>
									</c:if> <c:if test="${error gt 0 && error lt 5}">
										<font style="color: red;">密码错误，还有${5-error}次机会。</font>
									</c:if> <c:if test="${!empty isLock }">
										<font style="color: red;">对不起你的账号在${isLock}已经锁定。</font>
									</c:if> <c:if test="${!empty lock }">
										<font style="color: red;">${lock}</font>
									</c:if> <c:if test="${!empty admin_lock }">
										<font style="color: red;">${admin_lock}</font>
									</c:if> <c:if test="${!empty please_login }">
										<font style="color: red;">${please_login}</font>
									</c:if>
										<font color="red">
											${logout}
				                  			<%
				                  				request.getSession().removeAttribute("logout");
				                  			%>
				                  		</font>
									</td>
							</tr>
						</tbody>
					</table>
				</form>
            <div class="third-party">
            <span class="title">第三方登录</span>
            <ul class="third-body">
            <li class="t1"></li>
            <li class="t2"></li>
            <li class="t3"></li>
            </ul>
			</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--End Content-->
	<!--footer-->
												
	<div class="loginFooter">
		<div class="webLinkBox" style="height:auto;">
			<div class="webLinks">
				<c:set var="link_count" value="0"/>
				<c:forEach items="${application_link}" var="link">
					<c:if test="${link.type eq 0 }">
				    <c:if test="${link_count > 0 }">
					| 
					</c:if>
				<a href="${link.url}" target="_bank">${link.name}</a>
					</c:if>
				<c:set var="link_count" value="${link_count+1 }"/>
				</c:forEach>
			</div>
		</div>
<div class="copyright" style="background: none;text-align: center;margin-bottom:30px;">
<div class="w1000px">
© ${footer.copyright } <a href="#">${footer.name }</a>
${footer.context }<a href="#">备ICP证 ${footer.records}</a>
</div>
</div>
	</div>
	<!--End footer-->
<script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "fade",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>

<script type="text/javascript">
//初始化页面时验证是否记住了密码
$(document).ready(function() {
    if ($.cookie("rmbUser") == "true") {
        $("#uscheck").attr("checked", true);
        $("#username").val($.cookie("userName"));
        $("#pwd").val($.cookie("passWord"));
    }
});

function saveUserInfo() {
    if ($("#uscheck").attr("checked") == true) {
        var userName = $("#username").val();
        var passWord = $("#pwd").val();
        $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie
    }
    else {
        $.cookie("rmbUser", "false", { expires: -1 });        // 删除 cookie
        $.cookie("userName", '', { expires: -1 });
        $.cookie("passWord", '', { expires: -1 });
    }
}
</script>

</body>
</html>
