<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>p2p网-百姓的理财助手 企业的融资参谋 社会的诚信标杆</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script>
//数据源面板
var url=  "http://211.149.169.103:8080/loanSign/loanSignList";
var objarr=new Array();
$.getJSON(url,{},function(data){ 
//此处返回的data已经是json对象 
//以下其他操作同第一种情况 
$.each(data.rows,function(idx,item){ 
objarr[idx]=new Array();
objarr[idx]['id']=item.id;
objarr[idx]['loanNumber']=item.loanNumber;
objarr[idx]['loanTitle']=item.loanTitle;
objarr[idx]['name']=item.name;
objarr[idx]['loanUnit']=item.loanUnit;
objarr[idx]['issueLoan']=item.issueLoan;
objarr[idx]['month']=item.month;
objarr[idx]['rate']=item.rate;
objarr[idx]['reward']=item.reward;
objarr[idx]['successfulLending']=item.successfulLending;
objarr[idx]['remainingCopies']=item.remainingCopies;
objarr[idx]['refundWay']=item.refundWay;
objarr[idx]['loanstate']=item.loanstate;
objarr[idx]['iscredit']=item.iscredit;
objarr[idx]['publishTime']=item.publishTime;
objarr[idx]['creditTime']=item.creditTime;
objarr[idx]['flotTime']=item.flotTime;
objarr[idx]['isShow']=item.isShow;
objarr[idx]['isRecommand']=item.isRecommand;
if(idx==0){
$('#onetype').text("("+objarr[idx]['refundWay']+")");
$('#reward').text(parseFloat(objarr[idx]['reward']));

}
}); 
}); 

function getUrl(url){
if(url!=''){
document.location = url;
}
}
</script>
	<script type="text/javascript" src="resources/js/default.js"></script>
	<style>
.topBox {
width: 100%;
height: 40px;
background: #f6f2f3;
border-bottom: 1px solid #e0e0e0;
position: relative;
z-index: 100;
}
</style>

	<!--banner-->
	<div class="bannerBox" id="bannerBox">
		<c:set var="i" value="1" />
		<c:forEach items="${application_banner}" var="banner">
		<c:if test="${banner.type eq 1 }">
			<a href="${empty banner.url ? 'javascript:void(0);':banner.url}"
				name="#ffdeb4"
				<c:if test="${i == 1 }">style="display:inline-block;"</c:if>
				<c:if test="${i != 1 }">style="display:none;"</c:if>
				id="banner${i }" target="_bank"><img
				title="${banner.picturename}" alt="${banner.picturename}"
				src="${banner.imgurl}" /></a>
			<c:set var="i" value="${i+1 }" />
		</c:if>
		</c:forEach>
	</div>
	<!--End banner-->
	<!--Notice-->
	<div class="Notice">
	<div class="w1000px">
	<span class="Noticebox"><i></i><b>最新公告：</b>接到工商银行系统维护通知，慧投手机网页模板快捷充值在以下时间段内无法进行支付。
	<c:forEach items="${deputy }" var="a">
<c:if test="${a.deputysection.id  == 17}">
	${a.pageHtml}
    </c:if>
    </c:forEach>
		</span>
    </div>
	</div>
	<!--End Notice-->
	
	<!--Content-->
	<div class="Content">
		<div class="w1000px">
			<!--tuwen-->
			<ul class="tuwenList">
				<li style="margin: 0px;"><a href="/to/single-4-95.htm"> <span
						class="tuwenIcon_1">&nbsp;</span>
						<h2	class="tuwenColor_1">低风险，高回报</h2>
						<p>专业的风控审核从借款源头降低投资风险，16%以上的年化收益回报远高于其它投资渠道</p>
				</a></li>
				<li><a href="/to/single-4-94.htm"> <span class="tuwenIcon_2">&nbsp;</span>
						<h2	class="tuwenColor_2">100%本金保障</h2>
						<p>引入第三方担保机构，应对一切逾期及坏账风险，100%保障投资者资金安全</p>
				</a></li>
				<li><a href="/to/single-4-95.htm"> <span class="tuwenIcon_3">&nbsp;</span>
						<h2	class="tuwenColor_3">第三方资金托管</h2>
						<p>与第三方支付平台合作资金托管机制，规避平台运营风险，化解国家监管难题，更加保障投资者资金安全</p>
				</a></li>
			</ul>
			<!--End tuwen-->
			<div class="clear"></div>
			<!--jiekuanList-->
			<div class="jiekuanList">
				<div class="jiekanTitleBox">
    <ul><li class="on"><h1>借款列表</h1></li><li><h1>债权转让</h1></li></ul>
					<!--a href="loaninfo/openLoan.htm">更多借款项目 &gt;&gt;</a-->
				</div>
		<div class="tablistbox">
			<!--借款信息-->
			<div class="contwrapbox">
	        <dl>
	    	<c:forEach items="${loanlist5}" var="loanList"  end="0">
	 	    <dt>${loanList[1]}
	 	<c:choose>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">
        (企业经营贷)
        </c:when>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">
		(房产周转贷)
        </c:when>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">
		(车辆抵押贷)
        </c:when>
        </c:choose>
<span id="onetype"></span></dt>
	 	    <dd>
	 	    <div class="contwrapbody left">
	 	    <div class="pic"><i></i><img src="resources/img/contwrap-hot.jpg"/></div>
	 	    <div class="dada">
	 	    <table style="width: 400px;">
	        <tr>
	 	    <th>年化收益</th>
	 	    <th>投资金额</th>
	 	    <th>借款期限</th>
	 	    <th>平台奖励</th>
	        </tr>
	        <tr>
	        <td><b class="h"><fmt:formatNumber value="${loanList[4]*100}"	pattern="0.00" /></b>%</td>
	        <td>
            <b class="h"><fmt:formatNumber value="${loanList[3]}" type="number"/></b>元	        
            </td>
	        <td>
			<c:if test="${!empty loanList[5]}"><b>${loanList[5]}</b>月</c:if>
			<c:if test="${!empty loanList[6]}"><b>${loanList[6]}</b> 天</c:if>
			<c:if test="${empty loanList[6]&&empty loanList[5]}">秒标</c:if>
	        </td>
	        <td><b id="reward"></b>%</td>
	        </tr>
	 	    </table>
	 	    <div class="dadaloadbox">
			投资进度：<div class="loading"><span data-value="<fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />"></span>
		    </div>
		    <b><fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />%</b>
		    </div>
		<div class="textbox">
		<table width="100%">
		<tr>
		<td>募集结束：2014.10.26</td>
		<td>还款方式：到期一次性还本</td>
		<tr>
		<td>还款日期：2015.01.25</td>
		<td>第三方担保：重庆</td>
		</tr>
		</table>
		<div class="clear"></div>
		</div>
		<div class="dadatype">
		<c:choose>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">	    
        <span><i class="t1"></i>企业经营贷</span>
        </c:when>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">	    
		<span><i class="t2"></i>房产周转贷</span>
        </c:when>
        <c:when test="${loanList[11]==1&&loanList[10]==1}">	    
		<span><i class="t3"></i>车辆抵押贷</span>
        </c:when>
        </c:choose>
		</div>
	 	    </div>
	 	    </div>
	 	    <div class="contwrapbody right">
<div class="listtitle"><h2>投资金额<c:if test="${!empty  loan.month }"><a href="<%=basePath%>arith/loan_Calculate?issueLoan=${loan.issueLoan}&month=${loan.month }&rate=${loan.rate*100}&mfeeratio=${loan.loansignbasics.reward*100}&refundWay=${loan.refundWay}"><i title="投资设计器"></i></a></c:if></h2></div>
   <form id="form1" action="/plank/getLoaninfo.htm" method="post" >
            <input type="hidden" id="loanUnit" name="loanUnit" value="${loan.loanUnit}"/>
            <input type="hidden" id="loanid" name="id" value="${loanList[0]}"/>
            <input type="hidden" id="userId" name="userId" value="${loan.userbasicsinfo.id}"/>
            <input type="hidden" id="user" name="user" value="${session_user.id}"/>
            <input type="hidden" id="logo" value="${logo}"/>
   <div class="investment">
    <h3>可投金额：<b><fmt:formatNumber value="${maxMoney}" pattern="0"/>0</b>元</h3>
    <h3>账户余额：<b><fmt:formatNumber value="${money}" type="number" />0</b>元</h3>
   </div>
   <div class="investment">
    <div class="text"><input type="text" id = "investMoney" name="money" placeholder="请输入投资额"/>元</div>
   </div>
   <div class="smbox" id="button_Bat" style="text-align:center;">
	<input type="submit" id="suBnt_a" class="sm" style="border: 0px;vertical-align: middle;" value="确认投标" />
   </div>
   </form>
  <div class="clear"></div>
  </div>
	 	    <div class="clear"></div>
	 	    </dd>
	        </c:forEach>
	        </dl>
	        </div>
                 <!--End 借款信息-->
        　　　　　　<div class="tabbody">
                            <div class="tabtop">
					<dl>
							<dt class="t1">项目名称</dt>
							<dt class="t2">金额</dt>
							<dt class="t3">年化收益</dt>
							<dt class="t4">期限</dt>
							<dt class="t5">进度</dt>
							<dt class="t6">状态</dt>
					</dl>
                    </div>

						<c:forEach items="${loanlist5}" var="loanList" begin="1">
                            <ul>
							<li class="t1">
								
								<c:choose>
								<c:when test="${loanList[11]==1&&loanList[10]==1}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}"  title="助人贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==2}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="助企贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==3}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" itle="企业群联保贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==4}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="周转贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==2}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="天标">${loanList[1]}(天标)</a>
								</c:when>
								 <c:otherwise>
								 	<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}">${loanList[1]}</a>
								 </c:otherwise>
								</c:choose>
								</li>
								<li class="t2">￥<fmt:formatNumber value="${loanList[3]}" type="number"/>元</li>
								<li class="t3"><fmt:formatNumber value="${loanList[4]*100}"
										pattern="0.00" />%</li>
										<li  class="t4">
										<c:if test="${!empty loanList[5]}">${loanList[5]}月</c:if>
										<c:if test="${!empty loanList[6]}">${loanList[6]} 天</c:if>
										<c:if test="${empty loanList[6]&&empty loanList[5]}">秒标</c:if>
										  </li>
								<li  class="t5">
								<div class="dadaloadbox">
			                    <div class="loading"><span data-value="<fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />"></span>
		                        </div>
		                        <b><fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />%</b>
		                        </div>
								</li>
								<li class="t6">
									 <c:if test="${loanList[7]== 4 }">
								       		<span class="ListBntTwo">已完成</span>
								       </c:if>
								       <c:if test="${loanList[7]== 2 && loanList[8]!=loanList[3]}">
								       		<input type="button" value="投资" class="ListBntOne" onclick="window.location.href='/loaninfo/getLoanInfo.htm?id=${loanList[0]}'"/>
								       </c:if>
								       <c:if test="${loanList[7]== 2 && loanList[8] == loanList[3]}">
								       		<span class="ListBntTwo">满标</span>
								       </c:if>
								       <c:if test="${loanList[7]==3}">
								       		<span class="ListBntTwo">回款中</span>
								       </c:if>
								       <c:if test="${loanList[7]==5}">
								       		<span class="ListBntTwo">流标</span>
								       </c:if>
								</li>
								</ul>
						</c:forEach>
					</div>
				    <div class="listAllbox">
				    <a href="loaninfo/openLoan.htm">更多</a>
				    </div>	
			<!--End jiekuanList-->
			</div>
		<div class="tablistbox"  style="display:none;">
        　　　　　　<div class="tabbody">
                    <div class="tabtop" style="background-color:#fff">
					<dl>
							<dt class="t1">项目名称</dt>
							<dt class="t2">金额</dt>
							<dt class="t3">年化收益</dt>
							<dt class="t4">期限</dt>
							<dt class="t5">进度</dt>
							<dt class="t6">状态</dt>
					</dl>
                    </div>

						<c:forEach items="${loanlist5}" var="loanList" begin="1">
                            <ul>
							<li class="t1">
								
								<c:choose>
								<c:when test="${loanList[11]==1&&loanList[10]==1}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}"  title="助人贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==2}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="助企贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==3}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" itle="企业群联保贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==1&&loanList[10]==4}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="周转贷">${loanList[1]}</a>
								</c:when>
								<c:when test="${loanList[11]==2}">
									<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}" title="天标">${loanList[1]}(天标)</a>
								</c:when>
								 <c:otherwise>
								 	<a href="loaninfo/getLoanInfo.htm?id=${loanList[0]}">${loanList[1]}</a>
								 </c:otherwise>
								</c:choose>
								</li>
								<li class="t2">￥<fmt:formatNumber value="${loanList[3]}" type="number"/>元</li>
								<li class="t3"><fmt:formatNumber value="${loanList[4]*100}"
										pattern="0.00" />%</li>
										<li  class="t4">
										<c:if test="${!empty loanList[5]}">${loanList[5]}月</c:if>
										<c:if test="${!empty loanList[6]}">${loanList[6]} 天</c:if>
										<c:if test="${empty loanList[6]&&empty loanList[5]}">秒标</c:if>
										  </li>
								<li  class="t5">
								<div class="dadaloadbox">
			                    <div class="loading"><span data-value="<fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />"></span>
		                        </div>
		                        <b><fmt:formatNumber  value="${loanList[8]/loanList[3]*100}"  pattern="#0.00" />%</b>
		                        </div>
								</li>
								<li class="t6">
									 <c:if test="${loanList[7]== 4 }">
								       		<span class="ListBntTwo">已完成</span>
								       </c:if>
								       <c:if test="${loanList[7]== 2 && loanList[8]!=loanList[3]}">
								       		<input type="button" value="投资" class="ListBntOne" onclick="window.location.href='/loaninfo/getLoanInfo.htm?id=${loanList[0]}'"/>
								       </c:if>
								       <c:if test="${loanList[7]== 2 && loanList[8] == loanList[3]}">
								       		<span class="ListBntTwo">满标</span>
								       </c:if>
								       <c:if test="${loanList[7]==3}">
								       		<span class="ListBntTwo">回款中</span>
								       </c:if>
								       <c:if test="${loanList[7]==5}">
								       		<span class="ListBntTwo">流标</span>
								       </c:if>
								</li>
								</ul>
						</c:forEach>
					</div>
		    </div>
			</div>
			<!--df_projectList-->
			<div class="df_projectList">
			  <div class="left-button"><i></i></div>
			  <div id="projectListbox" class="projectListbox">
				<ul class="projectListUl">
					<li onclick="getUrl('to/single-3-71.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_1">&nbsp;</span>
							<div class="prjListTx">
								<h3>企业经营贷</h3>
								<p>为广大工薪阶层白领精英人群提供的无抵押信用贷款产品。</p>
							</div>
						</div>
					</li>
					<li onclick="getUrl('to/single-3-72.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_2">&nbsp;</span>
							<div class="prjListTx">
								<h3>房产周转贷</h3>
								<p>为有资金需求的中小微企业及个体经营者提供的有抵押贷款产品。</p>
							</div>
						</div>
					</li>
					<li onclick="getUrl('to/single-3-73.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_3">&nbsp;</span>
							<div class="prjListTx">
								<h3>车辆抵押贷</h3>
								<p>为小微企业群及个体工商经营群开发推出的授信贷款产品。</p>
							</div>
						</div>
					</li>
					<li onclick="getUrl('to/single-3-72.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_2">&nbsp;</span>
							<div class="prjListTx">
								<h3>房产周转贷</h3>
								<p>为有资金需求的中小微企业及个体经营者提供的有抵押贷款产品。</p>
							</div>
						</div>
					</li>
					<li onclick="getUrl('to/single-3-73.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_3">&nbsp;</span>
							<div class="prjListTx">
								<h3>车辆抵押贷</h3>
								<p>为小微企业群及个体工商经营群开发推出的授信贷款产品。</p>
							</div>
						</div>
					</li>
					<li onclick="getUrl('to/single-3-71.htm');">
						<div class="prjListInfo">
							<span class="prjListItem_1">&nbsp;</span>
							<div class="prjListTx">
								<h3>企业经营贷</h3>
								<p>为广大工薪阶层白领精英人群提供的无抵押信用贷款产品。</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="right-button"><i></i></div>
			</div>
			<!--End df_projectList-->
			<div class="clear"></div>
			
			<!--新增模块-->
	<div class="randbox">
		<div class="randboxli randboxli_ph nomargin">
			<div class="randboxli_tit">
				<span class="randboxli_titli active">总排行</span>
				<span class="randboxli_titli">月排行</span>
			</div>
			<div class="randboxli_c">
				<div class="phlist active">
				<div class="title">
				<span class="t1">排名</span>
				<span class="t2">用户名</span>
				<span class="t3">投资总额(元)</span>
				</div>
				<c:forEach items="${totalRankList}" var="totalRankList"  varStatus="status">
				  <a class="paihangli"><span class="money t3">${totalRankList[1]}</span>
				  <c:if test="${status.count== 1}">
		          <span class="t1"><i class="num red">1</i></span><span class="t2">${totalRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 2}">
						<span class="t1"><i class="num blue">2</i></span><span class="t2">${totalRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 3}">
						<span class="t1"><i class="num green">3</i></span><span class="t2">${totalRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 4}">
						<span class="t1"><i class="num">4</i></span><span class="t2">${totalRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 5}">
						<span class="t1"><i class="num">5</i></span><span class="t2">${totalRankList[0]}</span>
				  </c:if>
				  </a>
				</c:forEach>
				</div>
				<div class="phlist">
				<div class="title">
				<span class="t1">排名</span>
				<span class="t2">用户名</span>
				<span class="t3">投资总额(元)</span>
				</div>
				<c:forEach items="${monthRankList}" var="monthRankList"  varStatus="status">
				  <a class="paihangli"><span class="money t3">${monthRankList[1]}</span>
				  <c:if test="${status.count== 1}">
		          <span class="num red t1">1</span><span class="t2">${monthRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 2}">
						<span class="num blue t1">2</span><span class="t2">${monthRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 3}">
						<span class="num green t1">3</span><span class="t2">${monthRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 4}">
						<span class="num t1">4</span><span class="t2">${monthRankList[0]}</span>
				  </c:if>
				  <c:if test="${status.count== 5}">
						<span class="num t1">5</span><span class="t2">${monthRankList[0]}</span>
				  </c:if>
				  </a>
				</c:forEach>
				</div>
			</div>
		</div>
		<c:set var="m" value="0" />
		<c:forEach items="${appDeputys }" var="d">
		<c:if test="${d.isRecommend == 1 && d.isShow == 1}">
	    <c:if test="${m < 2 }">		
			<div class="randboxli">
			<div class="randboxli_tit">${d.name }<a href="${d.url }">更多&gt;&gt;</a></div>
			<div class="randboxli_c">
		<c:set var="n" value="0" />
		<c:forEach items="${appArticles }" var="a">
		<c:if test="${a.deputysection.id  == d.id }">
		<c:if test="${n < 6}">
            <a href="${a.url }" title="${a.deputysection.id }"> 
            <c:choose>
            <c:when test="${fn:length(a.title)>25}">
            ${fn:substring(a.title,0,25)}...
            </c:when>
            <c:otherwise>
              <i></i>${a.title}
            </c:otherwise>
            </c:choose>	
            </a>
		</c:if>
		<c:set var="n" value="${n+1 }" />
		</c:if>
		</c:forEach>
		</div>
		</div>
		</c:if>
		<c:set var="m" value="${m+1 }" />
		</c:if>
		</c:forEach>
	</div>
	<!--新增模块end-->
			
		</div>
	</div>
	<!--End Content-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<script type="text/javascript" src="resources/js/tablist.js"></script>
	<script type="text/javascript">
    var sumItems=0;
	var sumWidth =0;
	var index =0;
	var scrollleft=0;
$(".projectListUl").find("li").each(function(){
    sumWidth += $(this).width()+20;
    sumItems +=sumItems+1;
});
$('.left-button i').click(function(){
	var scrollwidth=document.getElementById("projectListbox").scrollWidth;
	var objwidth=$(".projectListbox").width();
	index>0?index--:index=(scrollwidth/objwidth);
	scrollleft=$(".projectListbox").width()*index;
    $(".projectListbox").animate({scrollLeft:scrollleft},1000);
});
$('.right-button i').click(function(){
	var scrollwidth=document.getElementById("projectListbox").scrollWidth;
	var objwidth=$(".projectListbox").width();
    (scrollwidth-objwidth)>objwidth*index?index++:index=0;
	scrollleft=objwidth*index;
    $(".projectListbox").animate({scrollLeft:scrollleft},1000);
});
	$('.projectListUl').css('width',sumWidth);
	$(function(){
		$(".DataLoadding b").load("javascript:void(0)",function(){
			var $data_value=$(this).parent("span").attr("data-value");					   
				$(this).parent("span").animate({
				width:$data_value+"%"	
						});	
				if($data_value<50)
				{
				  $(this).parent("span").css("background","#ff8400");
				  $(this).parents(".DataLoadding").css("border-color","#a9a9a9");
				}
				$(this).text("完成进度"+$data_value+"%");
		});
	});
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
</body>
</html>
