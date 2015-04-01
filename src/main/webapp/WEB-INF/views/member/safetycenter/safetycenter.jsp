<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
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
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/global.js"></script>
<script type="text/javascript" src="/resources/js/recharge.js"></script>
<script type="text/javascript" src="/resources/js/safetycenter.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<input type="hidden" id="id" value="${session_user.id }"/>
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
							<li><a href="javascript:void(0);" class="vipHeadLink">邮箱验证</a></li>
							<li><a href="javascript:void(0);">身份验证</a></li>
							<li><a href="javascript:void(0);">安全问题</a></li>
							<li><a href="javascript:void(0);">手机验证</a></li>
						</ul>
					</div>

					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>通过绑定邮箱，能够为您的账号提供更安全的保障。
							</h1>
							<p>尊敬的p2p网会员，在绑定邮箱并通过验证之后，您可以提升您在p2p网的用户安全等级。</p>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipVerification">
							<tbody>
								<tr>
									<th><img src="../resources/images/vipcenteremail.jpg"
										title="" alt="" /></th>
									<td><p>
											您好，您已经绑定了邮箱<font> 
											<tags:email_tags email="${session_user.userrelationinfo.email }" />
											</font>
										</p>会员可通过填写安全问题答案修改已绑定的邮箱</td>
								</tr>
							</tbody>
						</table>
						<div class="vipPromptBox">
							<p>您已设置安全问题，如果需要修改已绑定邮箱，请在下面填写您已经设置的安全问题答案!</p>
						</div>
						<form id="upt_email">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<th>安全问题1:</th>
										<td><select id="question03">
												<option value="">--请选择问题--</option>
												<c:forEach items="${safetyQuestions }" var="s">
													<option value="${s.id }">${s.problem }</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>答案1:</th>
										<td><input id="anwser03" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr>
										<th>安全问题2:</th>
										<td><select id="question04">
												<option value="">--请选择问题--</option>
												<c:forEach items="${safetyQuestions }" var="s">
													<option value="${s.id }">${s.problem }</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>答案2:</th>
										<td><input id="anwser04" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr>
										<th>输入新邮箱:</th>
										<td><input id="newemail" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input id="uptEmail01" type="button" value="保存" onclick="safety(this);" /> <input type="reset"
									value="取消" />
							</div>
						</form>
					</div>
					<!--End vipContBox-->

					<!--vipContBox-->
					<div class="vipContBox" style="display: none;">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>通过身份认证，能够为您的账号提供更安全的保障。
							</h1>
							<p>尊敬的p2p网会员，通过身份验证后可以提升您在p2p网的用户安全等级。</p>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipVerification">
							<tbody>
								<tr>
									<th><img src="../resources/images/vipcentereperson.jpg"
										title="" alt="" /></th>
									<td><p>
											温馨提示：<span>你已经完成了身份验证，你的身份信息如下。</span>
										</p> 真实姓名：<font>*${fun:substring(session_user.name,1,fun:length(session_user.name))}</font><br />
										身份证号：<font>
											<tags:card_tags cardnum="${session_user.userrelationinfo.cardId }" />
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="vipPromptBox">
							<h6>温馨提示：</h6>
							<p>如果你在公安机关修改了名字，请联系我们的客服，凭有关公安机关改名的核证材料修改您的身份信息。谢谢!</p>
						</div>
					</div>
					<!--End vipContBox-->

					<!--vipContBox-->
					<div class="vipContBox" style="display: none;">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>通过设置安全问题，能够为您的账号提供更安全的保障
							</h1>
							<p>尊敬的p2p网会员，设置安全问题并通过验证之后，您可以提升您在p2p网的用户安全等级。</p>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipVerification">
							<tbody>
								<tr>
									<th><img src="../resources/images/vipcentereQs.jpg"
										title="" alt="" /></th>
									<td><p>
											温馨提示：<span>您好，您的安全问题已设置。</span>
										</p> 1.会员可通过填写安全问题答案来修改已设置的安全问题。<br />
										2.会员若遗忘安全问题答案，请联系客服 ${footer.phone }。</td>
								</tr>
							</tbody>
						</table>
						<div class="vipPromptBox">
							<p>请在下面重新设置您的安全问题。</p>
						</div>
						<form id="Security_1">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<td colspan="2" align="center" id="prompt">
											请先回答您以前设置的安全问题！
										</td>
									</tr>
									<tr>
										<th>安全问题1:</th>
										<td>
							            <select style="width: 240px;" id="question05" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案1:</th>
										<td><input id="anwser05" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr>
										<th>安全问题2:</th>
										<td>
							            <select style="width: 240px;" id="question06" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案2:</th>
										<td><input id="anwser06" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input id="safety_problem01" type="button" value="提交" onclick="safety(this);" />
								<input id="safety_problem02" type="button" value="修改" onclick="safety(this);" style="display: none;"/>
								<input type="reset" value="取消" />
							</div>
						</form>
						<form id="Security_2" style="display: none;">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<td colspan="2" align="center">
											
										</td>
									</tr>
									<tr>
										<th>安全问题1:</th>
										<td>
							            <select style="width: 240px;" id="question07" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案1:</th>
										<td><input id="anwser07" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr>
										<th>安全问题2:</th>
										<td>
							            <select style="width: 240px;" id="question08" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案2:</th>
										<td><input id="anwser08" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input id="safety_problem" value="保存"/> <input type="reset"
									value="取消" />
							</div>
						</form>
					</div>
					<!--End vipContBox-->


					<!--vipContBox-->
					<div class="vipContBox" style="display: none;">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>通过绑定手机，能够为您的账号提供更安全的保障。
							</h1>
							<p>尊敬的p2p网会员，在绑定手机并通过验证之后，您可以通过手机找回登录密码。</p>
						</div>
						<table cellpadding="0" cellspacing="0" border="0"
							class="vipVerification">
							<tbody>
								<tr>
									<th><img src="../resources/images/vipcenterziliao_03.jpg"
										title="" alt="" /></th>
									<td><p>
											温馨提示：<span>您好，您已经绑定了手机号为<tags:phone_tags phonenum="${session_user.userrelationinfo.phone }" />
											的手机。</span>
										</p> 会员可通过填写安全问题答案修改已绑定的手机号。</td>
								</tr>
							</tbody>
						</table>
						<div class="vipPromptBox">
							<p>您已设置安全问题，如果需要修改已绑定手机号，请在下面填写您已经设置的安全问题答案!</p>
						</div>
						<form id="upt_phone">
							<table cellpadding="0" cellspacing="0" border="0"
								class="vipPwdManage">
								<tbody>
									<tr>
										<th>安全问题1:</th>
										<td>
							            <select style="width: 240px;" id="question9" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案1:</th>
										<td><input id="anwser9" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr>
										<th>安全问题2:</th>
										<td>
							            <select style="width: 240px;" id="question10" name="question01">
							            <option>请选中安全问题</option>
							            <c:forEach items="${safetyQuestions }" var="s">
							            <option value="${s.id }">${s.problem }</option>
							            </c:forEach>
							            </select>
							            </td>
									</tr>
									<tr>
										<th>答案2:</th>
										<td><input id="anwser10" type="text" class="vipTextBox"
											style="width: 240px;" /></td>
									</tr>
									<tr><th>输入新手机号:</th><td><input id="newPhone" type="text" class="vipTextBox" style="width:240px;"/></td></tr>
								</tbody>
							</table>
							<div class="tableSetBntBox">
								<input id="uptPhone" type="button" value="保存"  onclick="safety(this);"/> <input type="reset"
									value="取消" />
							</div>
						</form>
					</div>
					<!--End vipContBox-->

				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
</body>
</html>
