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
<title>p2p网贷款平台-用户注册</title>
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/resources/js/global.js" ></script>
<script type="text/javascript" src="/resources/js/jquery.validationEngine.js" ></script>
<script type="text/javascript" src="/resources/js/jquery.validationEngine-zh_CN.js" ></script>
<script type="text/javascript" src="/resources/js/login.js" ></script>
</head>
<body>
<!--head-->
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
				class="Logintitle">欢迎注册</span>
	</div>
<!--End head-->

<!--Content-->
<div class="loginContent">
 <div class="w1000px loginBox">
  <div class="regist_start"><div class="start"></div><ul class="start-text"><li class="t1"><h3>1</h3><p>填写用户信息</p></li><li class="t2"><h3>2</h3><p>手机验证</p></li><li class="t3"><h3>3</h3><p>注册成功</p></li></ul></div>
  <div class="loginLeft" style="margin-top:10px;">
  <form id="df_rigster" action="/registration/registration_1_htm" method="post">
   <table cellpadding="0" cellspacing="0" border="0" class="loginTable">
      <tbody>
       <tr><th>用户名：</th><td><input type="text" value="${userName}" name="userName" class="loginTx validate[required,minSize[5],maxSize[20],custom[onlyLetterNumber],ajax[ajaxNameCall]]" value="" /><label class="userVf Vf_P1">由英文和数字构成，不能包含特殊字符</label></td></tr>
       <tr><th>密码：</th><td><input type="password" name="pwd" id="password" class="loginTx validate[required,maxSize[12],minSize[6]]" value="" /><label class="userVf Vf_P1">输入密码，建议用英文和数字的组合</label></td></tr>
       <tr><th>确认密码：</th><td><input type="password" class="loginTx validate[required,maxSize[25],equals[password],minSize[6]]" value="" /><label class="userVf Vf_P1">输入确认密码</label></td></tr>
       <tr><th>手机：</th><td><input type="text" value="${phone}" name="phone" class="loginTx validate[required,minSize[11],maxSize[11]]" value="" /><label class="userVf Vf_P1">输入您的手机号码</label></td></tr>
       <tr><th>邮箱：</th><td><input type="text" value="${email}" name="email" class="loginTx validate[required,minSize[5],maxSize[25],custom[email],ajax[ajaxEmailCall]]" value="" /><label class="userVf Vf_P1">输入您的常用邮箱</label></td></tr>
       <tr><th>验证码：</th><td><input type="text" name="captcha" class="loginVftx validate[required,maxSize[4],minSize[4]]" value="" /><span class="loginVfImg"><img name="验证码" title="看不清，点击换一张" src="<%=basePath %>cic/code?name=registration" onclick="this.src='/cic/code?name=registration&id='+new Date();" style="cursor: pointer;" /></span></td></tr>
       <tr><th><input id="regit" name="registbox" type="checkbox" class="validate[required]" value="1"/></th><td>
       <a href="javascript:void(0)" class="registerXY" onClick="openWin('/views/Agreement.html');">我已阅读并同意《p2p网注册协议》</a>
       </td></tr>
       <tr><th></th><td><c:if test="${msg eq 1}"><font style="color:red;">验证码错误</font></c:if></td></tr>
       <tr><th></th><td><input type="submit" value="同意协议并注册" class="registerBnt" /></td></tr>
      </tbody>
   </table>
   </form>
  </div>
  <div class="loginRight" style="margin-top:10px;border:0px;">
  <div class="box">
    <p>已注册？现在去<a href="/visitor/to-login">登录</a></p>
                <div class="third-party">
            <span class="title">第三方登录</span>
            <ul class="third-body">
            <li class="t1"></li>
            <li class="t2"></li>
            <li class="t3"></li>
            </ul>
			</div>

    </div>
    </div>
  <div class="clear"></div>
 </div>
 <div class="w1000px loginPrompt">
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
</body>
<script language="javascript">
function openWin(htmUrl)
{
var url=htmUrl; //要打开的窗口
var winName="newWin"; //给打开的窗口命名
// screen.availWidth 获得屏幕宽度
// screen.availHeight 获得屏幕高度
// 居中的算法是：
// 左右居中： (屏幕宽度-窗口宽度)/2
// 上下居中： (屏幕高度-窗口高度)/2
var awidth=765; //窗口宽度,需要设置
var aheight=800;//窗口高度,需要设置
var atop=100;//窗口顶部位置,一般不需要改
var aleft=100;//窗口放中央,一般不需要改
var param0="scrollbars=yes,status=0,menubar=0,resizable=2,location=0"; //新窗口的参数
//新窗口的左部位置，顶部位置，宽度，高度
var params="top=" + atop + ",left=" + aleft + ",width=" + awidth + ",height=" + aheight + "," + param0 ;
win=window.open(url,winName,params); //打开新窗口
win.focus(); //新窗口获得焦点
}
</script>
</html>
