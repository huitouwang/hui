<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<div class="clear"></div>
<!--footer-->
<div class="footer">
	<div class="w1000px">
		<div class="footerCont">
			<div class="footerBox">
				<div style="border-top: 0px; text-align: center;border-bottom: 1px solid #b3b3b3;">
					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:forEach items="${topics }" var="t">
						<c:if test="${t.isfooter == 1 && i <= 3}">
							<c:set var="i" value="${i+1}" />
							<dl class="tab${i }">
								<dt>
								${t.name }</dt>
								<c:forEach items="${appDeputys }" var="d">
									<c:if test="${d.isfooter == 1 && d.topic.id == t.id && j<=4}">
										<c:set var="j" value="${j+1}" />
										<dd>
											<a href="${d.url }">${d.name }</a>
										</dd>
									</c:if>
								</c:forEach>
							</dl>
						</c:if>
						<c:set var="j" value="0" />
					</c:forEach>
	
			<div class="weibeBox" style="margin-top:0px;">
				<dl>
				<dt>关注我们</dt>
				<dd>
			    <a id="wecat" href="javascript:void(0);">
			    <img src="../resources/css/icons/weixin.png" title="关注我们微信" alt="微信二维码" onmousemove="$(this).attr('src','../resources/css/icons/weixin1.png')" onmouseout="$(this).attr('src','../resources/css/icons/weixin.png')"/>
				</a>
				<a href="#" target="_bank"><img src="../resources/css/icons/apple.png" title="苹果" alt="" onmousemove="$(this).attr('src','../resources/css/icons/apple1.png')" onmouseout="$(this).attr('src','../resources/css/icons/apple.png')"/>
				</a>
				<a href="#" target="_bank"><img	src="../resources/css/icons/android.png" title="安卓" alt="" onmousemove="$(this).attr('src','../resources/css/icons/android1.png')" onmouseout="$(this).attr('src','../resources/css/icons/android.png')"/>
				</a>
			</dd></dl></div>
			<div class="aboutUsBox" style="margin-top:0px;">
			<dl>
			<dt>联系客服</dt>
			<dd>
				<h1>${footer.phone}</h1>
				<span>(周一到周日: ${footer.workTime})</span>
				</dd>
			<dd>
				<h1>${footer.qqGroupNumber}</h1>
				<span>(周一到周日: ${footer.workTime})</span>
				</dd>
			<dd><span>E-mail：${footer.email}</span></dd>
			</dl>
		    </div>
					<div class="clear"></div>
				</div>
		<div class="webLinkBox">
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
				<div style="text-align: center;" >
					<c:set var="verify_count" value="0"/>
					<c:forEach items="${application_link}" var="link">
						<c:if test="${link.type eq 1 && verify_count < 5 }">
							<a href="${link.url}" target="_bank"><img  style="width:150px;height:50px;" src="${link.verifyImg}" title="${link.remark}" alt=""/></a>
						</c:if>
						<c:set var="verify_count" value="${verify_count+1 }"/>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
<div class="copyright">
<div class="w1000px">
© ${footer.copyright } <a href="#">${footer.name }</a>
${footer.context }<a href="#">备ICP证 ${footer.records}</a>
</div>
</div>
</div>
<script language="javascript" src="<%=basePath%>resources/js/jquery.Sonline.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/default_blue.css"/>
<script type="text/javascript">
$(function($){
	$("#wecat").click(function(){
		ymPrompt.win("<div align='center' ><img alt='P2P网贷平台二维码' src='../resources/images/weixin.jpg' width='320' height='320'></div>",350,360,'微信扫一扫加关注');
	});
	$("body").Sonline({
		Position:"right",//left或right
		Top:200,//顶部距离，默认200px
		Effect:true, //滚动或者固定两种方式，布尔值：true或false
		DefaultsOpen:true, //默认展开：true,默认收缩：false
		Qqlist:"1234567|客服01,1234567|客服02,1234567|客服03,1234567|客服04,1234567|客服05" //多个QQ用','隔开，QQ和客服名用'|'隔开
	});
});
</script>
<!--End footer-->