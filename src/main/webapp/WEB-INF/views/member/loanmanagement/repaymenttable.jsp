<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table cellpadding="0" cellspacing="0" border="0"
	class="vipSeversTable">
	<thead>
		<tr>
			<th>借款编号</th>
			<th>借款标题</th>
			<th>借款金额</th>
			<th>年化利率</th>
			<th>还款方式</th>
			<th>借款期限</th>
			<th>借款时间</th>
			<th>还款时间</th>
			<th>还款金额</th>
			<th>状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list}" var="loan">
			<tr>
				<td><a href="/loaninfo/getLoanInfo.htm?id=${loan[11]}">${loan[0]}</a></td>
				<td>${loan[1]}</td>
				<td><fmt:formatNumber value="${loan[2]}" pattern="0.00" /></td>
				<td><fmt:formatNumber value="${loan[3]*100}"
						pattern="0.00" />%</td>
				<td>${loan[4]}</td>
				<c:if test="${loan[6]>0}">
					<td>${loan[6]}天</td>
				</c:if>
				<c:if test="${loan[5]>0}">
					<td>${loan[5]}个月</td>
				</c:if>
				<c:if test="${loan[12]==3}">
					<td>满标回款</td>
				</c:if>
				<td>${loan[7]}</td>
				<td>${loan[8]}</td>
				<td><fmt:formatNumber value="${loan[9]}" pattern="0.00" /></td>
				<c:if test="${loan[10]==1}">
					<td>已还款</td>
				</c:if>
				<c:if test="${loan[10]==2}">
					<td>逾期未还款</td>
				</c:if>
				<c:if test="${loan[10]==3}">
					<td>提前已还款</td>
				</c:if>
				<c:if test="${loan[10]==4}">
					<td>未还款</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
	<tr >
		<td colspan="10" style="border: 0px;"><div class="quotes"><jsp:include page="/WEB-INF/views/member/communal/page.jsp" /></div></td>
	</tr>
</table>

	<!--End footer-->
</body>
</html>
