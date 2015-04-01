<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<form id="pagerForm" method="post" action="/invest/openInvestReords">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="investor" value="${investor}" />
	<input type="hidden" name="investMoney" value="${investMoney }" />
	<input type="hidden" name="time1" value="${time1 }" />
	<input type="hidden" name="time2" value="${time2}" />
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/invest/openInvestReords" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
					 	投资人：
					 			  <input type="text" name="investor" value="${investor }"/>
					</td>
					<td>
					 	投资金额：<input type="text" name="investMoney" value="${investMoney }"/>以上
					</td>
					<td>
					 	投资时间：<input type="text" id="time1" name="time1" value="${time1 }"/>-<input type="text" id="time2" name="time2" value="${time2 }"/>
					</td>
					<td>
					 	所属客服人员：<select name="serviceStaff">
					 	<option value="-1" selected="selected">请选择客服人员</option>
					 	<c:forEach items="${serviceStaffs }" var="staff">
					 	<option value="${staff[0] }" <c:if test="${staff[0] == serviceStaff}">selected="selected"</c:if>>${staff[1] }</option>
					 	</c:forEach>
					 	</select>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="panelBar" style="padding-top:10px;">
	<ul class="toolBar">
		<li>P2P网贷平台投资总额：￥<fmt:formatNumber value="${sumInvestMoney }" pattern="0.00" /></li>
		<li style="margin-left:20px;">所属客服下的投资总额：￥<fmt:formatNumber value="${sumInvestMoney2 }" pattern="0.00" /></li>
	</ul>
</div>
	<table class="table" width="99%" layoutH="120" rel="jbsxBox2">
		<thead>
			<tr>
				<th width="30px;">序号</th>
				<th>投资人</th>
				<th>投资金额</th>
				<th>投资时间</th>
				<th>所投标标题</th>
				<th>所投标借款金额</th>
				<th>所投标借款人</th>
				<th>所属客服人员</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${investReords}" var="invest" varStatus="i">
			<tr >
				<td>${i.index+1 }</td>
				<td>${invest[1] }</td>
				<td><fmt:formatNumber value="${invest[2] }" pattern="0.00" /></td>
				<td>${invest[3] }</td>
				<td>${invest[4] }</td>
				<td>${invest[5] }</td>
				<td>${invest[6] }</td>
				<td>${invest[7] }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
<script>
$(function(){
	$('#time1').omCalendar();
    $('#time2').omCalendar();
});
</script>