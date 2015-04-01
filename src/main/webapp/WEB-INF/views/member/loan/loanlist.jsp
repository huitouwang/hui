<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷款平台-借款列表</title>
<base href="<%=basePath %>" />

</head>
<body>
<!--head-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script type="text/javascript" src="resources/js/condition.js"></script>
<script type="text/javascript" src="resources/js/loanSign/loanlist.js"></script>
<!--End head-->

<!--Content-->
<div class="Content">
 <div class="w1000px">
 <!--mapLinkBox-->
 <div class="mapLinkBox"><a href="<%=basePath%>">首页</a> / <a href="javascript:void(0);" >我要投资</a> / <a href="javascript:void(0)" style="color: #ff9e57;">借款列表</a></div>
 <!--End mapLinkBox-->
 
 <!--搜索条件-->
 <div class="contwrap condition">
   <h1>筛选借款项目</h1>
   <ul class="conditionList">
    <li>
      <dl>
       <dt>借款金额：</dt>
       <dd name="money"><span value="0" class="active">不限</span><span value="1">10万以内</span><span value="2">10-100万</span><span value="3">100-200万</span><span value="4">200万以上</span></dd>
      </dl>
    </li>
    <li>
      <dl>
       <dt>借款期限：</dt>
       <dd name="deadline"><span value="0" class="active">不限</span><span value="1">1-3个月</span><span value="2">3-12个月</span><span value="3">12个月以上</span></dd>
      </dl>
    </li>
    <li>
      <dl>
       <dt>还款方式：</dt>
       <dd name="type"><span value="0" class="active">不限</span><span value="2">每月付息到期还本</span><span value="1">每月等额本息还款</span><span value="3">到期一次性偿还本息</span></dd>
      </dl>
    </li>
    <li>
      <dl>
       <dt>信用等级：</dt>
       <dd name="rank"><span value="0" class="active">不限</span><span value="1">1星</span><span value="2">2星</span><span value="3">3星</span><span value="4">4星</span><span value="5">5星</span></dd>
      </dl>
    </li>
    <li>
      <dl>
       <dt>借款类型：</dt>
       <dd name="loanType"><span value="0" class="active">不限</span><span value="1">天标</span><span value="2">助人贷</span><span value="3">助企贷</span><span value="5">企业群联保贷</span><span value="4">投资人周转贷</span></dd>
      </dl>
    </li>
   </ul>
   <div class="clear"></div>
 </div>
 <!--End 搜索条件-->
 
 <!--jiekuanList-->
 <div class="jiekuanList">
 </div>
 <!--End jiekuanList-->
 </div>
</div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<!--End footer-->
</body>
</html>