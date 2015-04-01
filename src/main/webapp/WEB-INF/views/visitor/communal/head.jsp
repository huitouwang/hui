<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources/css/huitou.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>resources/css/skin/simple_gray/ymPrompt.css" />
<script type="text/javascript" src="<%=basePath %>resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/head.js"></script>
<script type="text/javascript" src="<%=basePath %>resources/js/ymPrompt.js"></script>
<style>
</style>
<!--top-->
<input type="hidden" id="security_verifiy" value="${security_verifiy }">
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
<!--head-->
<div class="head">
	<div class="w1000px" id="main">
		<div class="logo">
			<a href="<%=basePath %>"><img src="<%=basePath %>resources/images/logo.png" title="p2p网平台" /></a>
		</div>
			<!--nav-->
			<div class="navBox">
				<c:set var="x" value="0" />
				<c:forEach items="${topics }" var="t">
					<c:if test="${t.isShow == 1 && x < 6 }">
						<span> <a 
						<c:if test="${t.id eq 1 }">href="/"</c:if>
						<c:if test="${t.id != 1 }">href="<%=basePath %>${t.url }"</c:if>
							<c:if test="${t.id eq topicId }">class="navLink"</c:if> id="dh1">${t.name }</a>
							<c:set var="o" value="0" /> <c:forEach items="${appDeputys }"
								var="appDeputy">
								<c:if test="${appDeputy.topic.id eq t.id && o eq 0}">
									<div>
										<c:forEach items="${appDeputys }" var="d">
											<c:if test="${d.topic.id == t.id }">
												<a href="<%=basePath %>${d.url }">${d.name }</a>
											</c:if>
										</c:forEach>
									</div>
									<c:set var="o" value="${o+1 }" />
								</c:if>
							</c:forEach>
						</span>
						<c:set var="x" value="${x+1 }" />
					</c:if>

				</c:forEach>
			</div>
			<!--End nav-->
		</div>
	</div>
	<span class="df_loginNav loginNavCkA curvyCorners_t5">
		<div <c:if test="${!empty session_user }">class="df_loginBox"</c:if>
			id="information" style="display: none;">
			<table>
				<tr>
					<td rowspan="4">
						<div class="userImg">
							<img src="${session_user.userrelationinfo.imgUrl}"
								alt="${session_user.userName }"
								title="${session_user.userName }" width="100" height="100" id="user_photo" />
						</div>
					</td>
					<td id="login_user">当前用户: ${session_user.userName }</td>
				</tr>
				<tr>
					<td id="login_money"><!--可用余额: <fmt:formatNumber
							value="${session_user.userfundinfo.cashBalance==null? '0.00':session_user.userfundinfo.cashBalance}"
							pattern="0.00" /> 元-->
					</td>
				</tr>
				<tr>
					<td>上次登录地址: ${loginLog.address}</td>
				</tr>
				<tr>
					<td>上次登录时间:<br />${loginLog.logintime}
					</td>
				</tr>
			</table>
		</div>
	</span>
</div>
<script type="text/javascript">
	$(function($){
		$(".login_out").click(function(){
			ymPrompt.confirmInfo('是否确认安全退出？', 320, 160, '是否退出', function(tp) {
				if (tp == 'ok') {
					window.location.href='<%=basePath%>update_info/login_out';
												}
											});
						});

	});
	function AddFavorite(sURL, sTitle)
	{
		 try
		    {
		        window.external.addFavorite(sURL, sTitle);
		    }
		    catch (e)
		    {
		        try
		        {
		            window.sidebar.addPanel(sTitle, sURL, "");
		        }
		        catch (e)
		        {
		            ymPrompt.errorInfo('加入收藏失败，请使用Ctrl+D进行添加!', 360, 160, '失败', null);
		        }
		    }
	}
</script>
<!--End head-->
<jsp:include page="/WEB-INF/views/visitor/communal/safeverify.jsp" />