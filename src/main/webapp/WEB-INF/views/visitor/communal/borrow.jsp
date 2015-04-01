<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath %>" />
<title>p2p网贷款平台</title>
</head>
<body>
<!--top-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<!--End top-->
<!--Content-->
<div class="Content">
 <div class="w960px">
 <!--mapLinkBox-->
 <div class="mapLinkBox"><span>您当前的位置：</span><a href="#">p2p网</a>&gt;<a href="javascript:void(0)">我要借款</a></div>
 <!--End mapLinkBox-->
 
 <!--我要借款-->
 <div class="contwrap">
  <div class="listBanner">
  <c:set var="i" value="1" />
		<c:forEach items="${application_banner}" var="banner">
		<c:if test="${banner.type eq 3 && i eq 1 }">
			<img alt="${banner.picturename}" src="${banner.imgurl}" />
			<c:set var="i" value="${i+1 }" />
		</c:if>
		</c:forEach>
  </div>
  <div class="projectListBox">
   <span class="prctItemTitle">我可以借款吗？</span>
   <ul class="prctItemDL">
   <li>
    <span>贷款门槛低：</span>
    <p>只要您是年满22周岁的合法中国公民，具备完全民生行为能力，便可在p2p网平台上申请借款；</p>
    </li>
    <li>
    <span>借款用途广：</span>
    <p>无论您是生意周转、扩大生产、备货、创业、旅游、培训、结婚、住院看病、个人消费、短期生活周转等等，都可以在p2p网平台上选择合适的产品进行借款；</p>
    </li>
    <li>
    <span>借款审核快：</span>
    <p>p2p网专业的的风控团队，会在接收到借款申请后的第一时间安排对借款人进行“三审”审核，更专业的审核技能，促进了快速的审核完成，保障了快速的信息和发布资金获得；</p>
    </li>
    <li>
    <span>借款保障强：</span>
    <p>p2p网设置的风险拨备金和引入第三方担保机构制度，双重保障了投资者的资金安全，消除了投资顾虑，也就更加促进了借款人的快速融资。</p>
    </li>
   </ul>
   <div class="clear"></div>
  </div>
 <div class="projectListBox">
  <ul class="prcListUL">
  <li>
   <div class="prcListTxBox">
     <div><span class="prjListItem_1">&nbsp;</span>
      <h3>助人贷</h3>
     </div>
     <label>一款为广大工薪阶层白领精英人群提供的无抵押信用贷款产品。</label>
     <div>
     <a href="to/single-3-71.htm">详情&gt;&gt;</a>
     </div>
   </div>
  </li>
  <li>
   <div class="prcListTxBox">
     <div><span class="prjListItem_2">&nbsp;</span>
      <h3>助企贷</h3>
     </div>
     <label>一款为有资金需求的中小微企业及个体经营者提供的有抵押贷款产品。</label>
     <div>
     <a href="to/single-3-72.htm">详情 &gt;&gt;</a>
     </div>
   </div>
  </li>
  <li>
   <div class="prcListTxBox">
     <div><span class="prjListItem_3">&nbsp;</span>
      <h3>企业群联保贷</h3>
     </div>
     <label>一款专为小微企业群开发推出的授信贷款产品。</label>
     <div>
     <a href="to/single-3-73.htm">详情 &gt;&gt;</a>
     </div>
   </div>
  </li>
  <li>
   <div class="prcListTxBox" style="margin:0px;">
     <div><span class="prjListItem_4">&nbsp;</span>
      <h3>资金周转贷</h3>
     </div>
     <label>一款针对于p2p网平台投资者急需资金周转时可选择的无抵押贷款产品。</label>
     <div>
     <a href="to/single-3-74.htm">详情 &gt;&gt;</a>
     </div>
   </div>
  </li>
  </ul>
  <div class="clear"></div>
  <span class="prctItemTitle">借款流程</span>
  <div class="processPic"><img src="resources/images/listto_ll.jpg" alt="" title="" /></div>
  </div>
  <div class="processInfoLink"><a href="javascript:void(0)" class="topIcon_4" onClick="openWin('/views/Notice1.html');">借款人须知</a> <a href="javascript:void(0)" class="topIcon_4" onClick="openWin('/views/Notice2.html');">如何还款</a></div>
  <br />
  <br />
  <br />
  <br />
 </div>
 <!--End 我要借款-->
 </div>
 </div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<!--End footer-->
</body>
<script language="javascript">
function openWin(htmUrl)
{
var url=htmUrl; //要打开的窗口
var winName="newWin"; //给打开的窗口命名
// screen.availWidth 获得屏幕宽度
// screen.availHeight 获得屏幕高度
// 居中的算法是：
// 左右居中： (屏幕宽度-窗口宽度)/2
// 上下居中： (屏幕高度-窗口高度)/2
var awidth=765; //窗口宽度,需要设置
var aheight=800;//窗口高度,需要设置
var atop=100;//窗口顶部位置,一般不需要改
var aleft=100;//窗口放中央,一般不需要改
var param0="scrollbars=yes,status=0,menubar=0,resizable=2,location=0"; //新窗口的参数
//新窗口的左部位置，顶部位置，宽度，高度
var params="top=" + atop + ",left=" + aleft + ",width=" + awidth + ",height=" + aheight + "," + param0 ;
win=window.open(url,winName,params); //打开新窗口
win.focus(); //新窗口获得焦点
}
</script>


</html>
