<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
table.vipSeversTable{width:578px; height:auto; border:0px; border-collapse:collapse; margin:20px auto;}
table.vipSeversTable th,table.vipSeversTable td{width:auto; height:35px; line-height:35px; border-bottom:1px solid #d0d0d0; font-weight:normal; color:#666666; text-align:center;font-size:15px;}
table.vipSeversTable td{border-bottom: 1px dashed #e0e0e0;}
table.vipSeversTable th{background:none;}
	table.vipSeversTable span{cursor:pointer; display:inline-block;}
	table.vipSeversTable font{color:#ff6600;}
</style>
<!-- 借出记录 -->
<table class="vipSeversTable">
	 <thead>
	  <tr><th>标号</th><th>借款标题</th><th>借款金额</th><th>年化利率</th><th>还款方式</th><th>借款期限</th></tr>
	 </thead>
	 <tbody>
	 <c:forEach items="${page.list}" var="loansign">
	  	<tr>
		  	<td><a href="/loaninfo/getLoanInfo.htm?id="+${loansign[0]}>${loansign[0]}</a></td>
		  	<td>${loansign[1]} </td>
		  	<td>￥<fmt:formatNumber value="${loansign[2]}" pattern="0.00"/>  </td>
		  	<td><fmt:formatNumber value="${loansign[3]*100}" pattern="0.00"/> %</td>
		  	<td><c:if test="${loansign[4]==1}">等额本息</c:if><c:if test="${loansign[4]==2}">按月付息到期还本</c:if><c:if test="${loansign[4]==3}">到期一次性还本息</c:if>   </td>
		  	<td><c:if test="${!empty loansign[5]}">${loansign[5]}月</c:if><c:if test="${!empty loansign[6]}">${loansign[6]}天</c:if><c:if test="${empty loansign[5] && empty loansign[6]}">满标回款</c:if>  </td>
	  	</tr>
	 </c:forEach>
	 </tbody>
	 <tr>
		 	<td colspan="6" width="578px;">
			 	<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/>
		 	</td>
		 </tr>
</table>
  <!-- End借出记录 -->

  <script type="text/javascript">

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	$.ajax({
		type:'post',
		url:'loaninfo/loanSignRecord.htm',
		data:{pageNo:pageno},
		success:function(msg){
			$(".dataContBox:eq(2)").html(msg);
		}
	});
}
</script>