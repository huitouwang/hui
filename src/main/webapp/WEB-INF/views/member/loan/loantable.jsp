<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
		$(function(){
		$(".dadaloadbox .loading span").load("javascript:void(0)",function(){
			var $data_value=$(this).attr("data-value");					   
				$(this).animate({
				width:$data_value+"%"	
						});	
				if($data_value<100)
				{
				  $(this).css("background","#12a5f5");
			}else{
			      $(this).css("background","#9ace63");
			}
		});
	});
</script>
 <!--End mapLinkBox-->
 				 <!--借款信息-->
			<div class="contwrapbox w100">
	        <dl>
	    <dt><div class="box">借款列表 <span>资金使用效率高，投标完成，明天就有利息！</span>
    </div></dt>
			<c:forEach items="${page.list}" var="loanList">
	 	    <dd class="list">
	 	    <div class="contwrapbody left">
	 	    <div class="pic"><!--i></i--><img src="resources/img/contwrap-hot.jpg"/></div>
	 	    <div class="dada">
	        <h1><a href="/loaninfo/getLoanInfo.htm?id=${loanList[0]}">${loanList[1]}</a></h1>
	 	    <table style="width: 420px;">
	        <tr>
	 	    <th>年化收益</th>
	 	    <th>投资金额</th>
	 	    <th>可投金额</th>
	 	    <th>投资期限</th>
	        </tr>
	        <tr>
	 	    <td><b class="h"><fmt:formatNumber value="${loanList[4]*100}"	pattern="0.00" /></b>%</td>
	 	    <td><b class="h"><fmt:formatNumber value="${loanList[3]}" type="number"/></b>元</td>
	 	    <td><b class="h" id="nextok">
	        <c:if test="${loanList[8] != loanList[3]}">
	        <fmt:formatNumber  value="${loanList[3]-loanList[8]/loanList[3]*100}"/></b>元
	        </c:if>
	        <c:if test="${loanList[8] == loanList[3]}">
	        0</b>元
	        </c:if>
	 	    </td>
	 	    <td>
			<c:if test="${!empty loanList[5]}"><b>${loanList[5]}</b>月</c:if>
			<c:if test="${!empty loanList[6]}"><b>${loanList[6]}</b> 天</c:if>
			<c:if test="${empty loanList[6]&&empty loanList[5]}">秒标</c:if>
	　　　　</td>
	        </tr>
	 	    </table>
	 	    <div class="dadaloadbox">
			投资进度：<div class="loading"><span data-value="<fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"/>"></span>
		    </div>
		    <b><fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />%</b>
		    </div>
		<div class="textbox">
		<ul>
		<li>
		<span id="onok">已投金额：<fmt:formatNumber  value="${(loanList[3]-loanList[8]/loanList[3]*100)}"/></span>
		</li>
		</ul>
		<div class="clear"></div>
		</div>
	 	    </div>
	 	<i class="live"></i>
	 	    </div>
	 	    <div class="contwrapbody right">
   <form id="form1">
   <div class="investment">
    <h3>今日投资，明日就有利息</h3>
<h3></h3>
   </div>
   <div class="smbox" id="button_Bat" style="text-align:center;">
           <c:if test="${loanList[7]== 4 }">
       		<span class="ListBntTwo">已完成</span>
       </c:if>
       <c:if test="${loanList[7]== 2 && loanList[8]!=loanList[3]}">
	   <input type="button"  onclick="window.location.href='/loaninfo/getLoanInfo.htm?id=${loanList[0]}'" class="sm" style="border: 0px;vertical-align: middle;" value="我要投资" />
       </c:if>
       <c:if test="${loanList[7]== 2 && loanList[8] == loanList[3]}">
       		<span class="ListBntTwo" title="满标"><a href="/loaninfo/getLoanInfo.htm?id=${loanList[0]}">查看详情</a></span>
       </c:if>
       <c:if test="${loanList[7]==3}">
       		<span class="ListBntTwo">回款中</span>
       </c:if>
       <c:if test="${loanList[7]==5}">
       		<span class="ListBntTwo">流标</span>
       </c:if>

   </div>
   </form>
  <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <c:if test="${loanList[7]== 2 && loanList[8] == loanList[3]}">
  <i class="endstart"></i>
  </c:if>
  </dd>
  </c:forEach>
  </dl>
  </div>

<div class="quotes">
<jsp:include page="/WEB-INF/views/member/communal/page.jsp"/></div>
<script>
	var num =  new Array();
	    num[0]=fmoney($("#nextok").html(),2);
	    num[1]=fmoney($("#onok").html(),2);
	    $("#nextok").html(num[0]);
	    $("#onok").html(num[1]);
<script>