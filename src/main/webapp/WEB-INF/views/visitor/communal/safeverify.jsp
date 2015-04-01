<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<div class="layerBox layerBG_one">
	<input type="hidden" id="login_userid" value="${session_user.id }">
	<div class="layerHeadBox">
		<h1>安全认证</h1>
		<a href="javascript:void(0);" class="layerClose"
			onclick="layerClose();" title="关闭">&nbsp;</a>
	</div>
	<!--欢迎页-->
	<div class="layerBodyBox" style="display: block;">
		<!--步骤图-->
		<span class="stepLink stepIocn_01">&nbsp;</span>
		<!--End 步骤图-->
		<div class="welcomeBox">
			<span class="smileyBox">&nbsp;</span>
			<p>
				亲爱的<a href="#">${session_user.name }</a>，您好，欢迎注册p2p网！为了保证您的账户安全，请先完成p2p网的安全验证流程。
			</p>
			<div class="clear"></div>
		</div>
		<p class="authenticateBox">
			<a id="go_verify" href="javascript:;" class="authenticateBnt"
				onclick="fun_click('go_verify');">立即认证</a>
		</p>
	</div>
	<!--End 欢迎页-->
	<!--手机认证-->
	<div class="layerBodyBox" id="verify_phone" style="display: none;">
		<!--步骤图-->
		<span class="stepLink stepIocn_02">&nbsp;</span>
		<!--End 步骤图-->
		<div class="promptBox">
			<span>&nbsp;</span>
			<p>您在p2p网的充值提现等重要操作，都需要通过手机动态验证！请填写您真实的手机号码，完成手机验证</p>
			<div class="clear"></div>
		</div>
		<table cellpadding="0" cellspacing="0" class="layertable">
			<tr>
				<th>手机号:</th>
				<td><input id="phone" type="text" style="width: 160px;" /></td>
			</tr>
			<tr>
				<th>验证码:</th>
				<td><input type="text" id="sms_code" style="width: 80px;" /><a
					href="javascript:;" onclick="send_smscode();">获取验证码</a></td>
			</tr>
		</table>
		<p class="authenticateBox">
			<a href="javascript:;" class="authenticateBnt" id="submit_phone"
				onclick="submit_phone();">提交</a>
		</p>
	</div>
	<!--End 手机认证-->
	<!--邮箱认证-->
	<div class="layerBodyBox" id="verify_email" style="display: none;">
		<!--步骤图-->
		<span class="stepLink stepIocn_03">&nbsp;</span>
		<!--End 步骤图-->
		<div class="promptBox">
			<span>&nbsp;</span>
			<p id="email_context1">
				1、如果收件箱里没有收到该邮件，请查看垃圾箱，以免被误判为垃圾邮件。<br /> 2、如果您邮箱地址填写错误，请点击这里<a
					href="javascript:show_uptemail();">【修改邮箱】</a>。<br />
				3、如果您在验证过程中，出现任何问题，请致电<font>${footer.phone }</font><br /> <br />
				在注册时已向您的邮箱 <font> <c:if
						test="${fun:length(fun:substring(session_user.userrelationinfo.email,0,fun:indexOf(session_user.userrelationinfo.email,'@'))) > 5 }">
	             ${fun:substring(session_user.userrelationinfo.email,0,3)}
	             <c:forEach begin="0"
							end="${fun:length(fun:substring(session_user.userrelationinfo.email,3,fun:indexOf(session_user.userrelationinfo.email,'@')-2)) - 1}">*</c:forEach>
	             ${fun:substring(session_user.userrelationinfo.email,fun:indexOf(session_user.userrelationinfo.email,'@')-2,fun:length(session_user.userrelationinfo.email))}
       		</c:if> <c:if
						test="${fun:length(fun:substring(session_user.userrelationinfo.email,0,fun:indexOf(session_user.userrelationinfo.email,'@'))) < 6 }">
             ${session_user.userrelationinfo.email }
             </c:if>
				</font> 发送了一封激活电子邮件， 请登录邮箱完成验证。
			</p>
			<table id="tab_uptemail" cellpadding="0" cellspacing="0"
				class="layertabletwo" style="display: none;">
				<tr>
					<td width="120" align="right">新邮箱：</td>
					<td><input id="e-mail" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="120" align="right">确认邮箱：</td>
					<td><input id="e-mail2" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			<div class="clear"></div>
		</div>
		<p class="authenticateBox">
			<a id="send_email" href="javascript:fun_replymail();"
				class="authenticateBnt">重发送邮箱验证</a> <a id="update_email"
				href="javascript:uptEmail();" class="authenticateBnt"
				style="display: none;">修改邮箱</a>
		</p>
	</div>
	<!--End 邮箱认证-->
	<!--身份验证-->
	<div class="layerBodyBox" id="verify_identify" style="display: none;">
		<!--步骤图-->
		<span class="stepLink stepIocn_04">&nbsp;</span>
		<!--End 步骤图-->
		<div class="promptBox">
			<span>&nbsp;</span>
			<p>您在p2p网的充值提现等重要操作，都需要通过身份验证！请填写您的真实姓名和身份证号码！</p>
			<div class="clear"></div>
		</div>
		<table cellpadding="0" cellspacing="0" class="layertable">
			<tr>
				<th>真实姓名:</th>
				<td><input id="userName" type="text" style="width: 80px;" /></td>
			</tr>
			<tr>
				<th>身份证号:</th>
				<td><input id="cardId" type="text" style="width: 190px;" /></td>
			</tr>
		</table>
		<p class="authenticateBox">
			<a href="javascript:fun_verifyidentity();" class="authenticateBnt">提交</a>
		</p>
	</div>
	<!--End 身份验证-->

	<!--安全问题-->
	<div class="layerBodyBox" id="verify_safequestion"
		style="display: none;">
		<!--步骤图-->
		<span class="stepLink stepIocn_05">&nbsp;</span>
		<!--End 步骤图-->
		<div class="promptBox">
			<span>&nbsp;</span>
			<p>请认真填写安全问题并牢记答案，回答安全问题是修改已绑定手机和已绑定邮箱的唯一方式。</p>
			<div class="clear"></div>
		</div>
		<table cellpadding="0" cellspacing="0" class="layertabletwo">
			<tr>
				<th>安全问题1:</th>
				<td><select id="question01">
						<option value="">--请选择问题--</option>
						<c:forEach items="${safetyQuestions }" var="s">
							<option value="${s.id }">${s.problem }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>答案1:</th>
				<td><input id="anwser01" type="text" style="width: 160px;" /></td>
			</tr>
			<tr>
				<th>安全问题2:</th>
				<td><select id="question02">
						<option value="">--请选择问题--</option>
						<c:forEach items="${safetyQuestions }" var="s">
							<option value="${s.id }">${s.problem }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>答案2:</th>
				<td><input id="anwser02" type="text" style="width: 160px;" /></td>
			</tr>
		</table>
		<p class="authenticateBox">
			<a href="javascript:submit_question();" class="authenticateBnt">提交</a>
		</p>
	</div>
	<!--End 安全问题-->

	<!--注册IPS-->
	<div class="layerBodyBox" id="verify_ips"
		style="display: none;">
		<!--步骤图-->
		<span class="stepLink stepIocn_06">&nbsp;</span>
		<!--End 步骤图-->
		<div class="promptBox">
			<span>&nbsp;</span>
			<p>注册IPS提示内容</p>
			<div class="clear"></div>
		</div>
		<p class="authenticateBox">
			<a href="javascript:regist_ips();" class="authenticateBnt">立即进入环迅，注册IPS账户</a>
		</p>
	</div>
	<!--End 注册IPS-->
</div>
<div class="wrapBox"></div>
