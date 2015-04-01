<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	  <table cellpadding="0" cellspacing="0" border="0" class="vipSeversTable">
		 <thead>
		  <tr><th>投标人</th><th>利率</th><th>投标金额</th><th>状态</th><th>投标时间</th></tr>
		 </thead>
		 <tbody>
		 <c:forEach items="${page.list}" var="record">
		  <tr>
			  <td>${fn:substring(record[0], 0,1)}***</td>
			  <td><fmt:formatNumber value="${record[1]*100}" pattern="0.00"/>% </td>
			  <td>￥<fmt:formatNumber value="${record[2]}" pattern="0.00"/></td>
			  <td>${record[3]}</td>
			  <td>${record[4]}</td>
		  </tr>
		 </c:forEach>
		 <tr>
		 	<td colspan="5" >
		 		<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/>
		 	</td>
		 </tr>
		 </tbody>
	  </table>
 
  <!-- End借出记录 -->
<script type="text/javascript">

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	$.ajax({
		type:'post',
		url:'loaninfo/loanRecord.htm',
		data:{pageno:pageno},
		success:function(msg){
			$(".dataContBox:eq(1)").html(msg);
		}
	});
}
</script>