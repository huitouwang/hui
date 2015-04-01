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
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css"
	type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script src="/resources/js/jquery.validationEngine.js"
	type="text/javascript"></script>
<script src="/resources/js/jquery.validationEngine-zh_CN.js"
	type="text/javascript"></script>
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
	            <a href="#">充值</a> 
	　　　　　　<span　class="df_loginNav loginNavCkA curvyCorners_t5" id="df_loginNav"><i></i>登录
					<div class="df_loginBox" style="display: none;">
						<form action="/registration/user_login" method="post"
							id="login_form">
							<p>
								<label>用户名：</label> <input type="text" id="userName"
									name="userName" class="df_loginTx" />
							</p>
							<p>
								<label>密 码：</label> <input type="password" id="pwd" name="pwd"
									class="df_loginTx" />
							</p>
							<p style="line-height: 28px; text-align: center;">
								<a href="/find_password/init.do">忘记密码？</a>
								<input type="button" value="登录" class="df_loginBnt" />
							</p>
						</form>
					</div> </span><span><a href="/visitor/to-regist">注册</a></span>
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
			</div>
			<div class="loginRight">
							<form action="/registration/login" method="post" id="df_login">
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
								<td><input type="password" name="pwd" placeholder="请输入密码" class="loginTx validate[required,maxSize[12],minSize[6]]" /> <label
									class="userVf Vf_P2">请输入密码</label></td>
							</tr>
							<tr>
								<td><input type="text" name="captcha"
									class="loginVftx validate[required,maxSize[4],minSize[4]]" placeholder="请输入验证码"/>
									<span class="loginVfImg" style="margin:8px 0px;"> <img
										src="/cic/code?name=user_login"
										onclick="this.src='/cic/code?name=user_login&id='+new Date();"
										title="看不清，点击换一张" style="cursor: pointer;" />
								</span></td>
							</tr>
							<tr>
								<td><a href="/find_password/init.do"
									class="loginLinkA">忘记密码？</a></td>
							</tr>
							<tr>
								<td><input type="submit" value="登录" class="loginBnt" /> <c:if
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

			</div>
			<div class="clear"></div>
		</div>
		<div class="w960px loginPrompt">
			<span>温馨提示：</span>
			<p>一个账号一天之内连续密码错误5次，账号会被锁定24小时</p>
		</div>
	</div>
	<!--End Content-->
	<!--footer-->
	<div class="loginFooter">
		<div class="w960px">Copyright © 2014 p2p网 Corporation.All Rights
			Reserved.</div>
	</div>
	<!--End footer-->
</body>
</html>
