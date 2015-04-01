<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/resources/css/project.css" rel="stylesheet"  type="text/css" />
</head>
<body>
<!--mainBox-->
<div class="mainBox">
  <!--header-->
    <jsp:include page="/WEB-INF/views/visitor/communal/head.jsp"/>
    <script type="text/javascript" src="/resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/resources/js/highcharts.js"></script>
	<script type="text/javascript" src="/resources/js/exporting.js"></script>
	<script type="text/javascript" src="/resources/js/data.js"></script>
	<script type="text/javascript" src="/resources/js/receipts.js"></script>
  <!--End header-->
  <div class="clear"></div>
 
  <!--content-->
  <div class="content">
    <div class="w960box pot_r curvyCorners_3 mainBorder" style="padding:10px 0px;">
    <div class="webfileMap"><a href="#">p2p网首页</a><a href="#">安全保障</a>><a href="#">出借保障</a></div>
    <div class="securitybox">
      <jsp:include page="/WEB-INF/views/visitor/communal/left.jsp"/>
      
      <div class="securityright">
      <div class="contentTitlebox">
       <h2><c:if test="${deputy.topic.id == topicId }">${deputy.name }</c:if></h2>
       </div>
       <div class="contentContebox">
      	  <table cellpadding="0" cellspacing="0" class="projectTab1 pjtTabrow" style="height:200px; margin-top:20px;">
          <tr>
          <td>投资期限</td>
          <td colspan="3">
            <select>
             <option>7天</option>
             <option>10天</option>
             <option>15天</option>
             <option>30天</option>
             <option>60天</option>
             <option>自定义</option>
            </select>
          </td>
          </tr>
          <tr>
          <td>产品名称</td>
          <td colspan="3">ZH周满盈</td>
          </tr>
           <tr>
          <td>投资开始时间</td>
          <td colspan="3">2014-1-5</td>
          </tr>
           <tr>
          <td>投资结束时间</td>
          <td colspan="3">2014-1-12</td>
          </tr>
           <tr>
          <td>投资金额（元）</td>
          <td colspan="3">150000</td>
          </tr>
           <tr>
          <td>到期利息</td>
          <td>172.60</td>
          <td>利息支付方式</td>
          <td>到期支付</td>
          </tr>
          <tr>
          <td>到期本息</td>
          <td>150172.60</td>
          <td>本金支付方式</td>
          <td>到期</td>
          </tr>
         </table>
         <h3 style="color:#000; font-weight:bold;">投资收益比较</h3>
         <table cellpadding="0" cellspacing="0" class="projectTab2 pjtTabrow" id="datatable">
         <thead>
		 <tr>
			<th>名称</th>
			<th>收益值</th>
		  </tr>
          </thead>
          <tbody>
          <tr>
          <th width="25%" style="font-weight:bold; color:#ca2020;">p2p网</th>
          <td style="font-weight:bold; color:#ca2020;">172.60</td>
          </tr>
          <tr>
          <th>银行</th>
          <td>8.75</td>
          </tr>
          </tbody>
         </table>
         <div class="statisticsBox" id="container"></div>
        <br />
        <br />
        <br />
       </div>
      </div>
    </div>
    <div class="clear"></div>
    </div>
  </div>
  <!--End content-->
  <!--footer-->
  <jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp"/>
  <!--End footer-->
<div class="clear"></div>
</div>
<!--End mainBox-->
</body>
</html>