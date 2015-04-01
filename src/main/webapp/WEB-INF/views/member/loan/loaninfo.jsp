<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷款平台-<c:if test="${loan.loanType==1 }">
	   	<c:if test="${loan.loansignType.id==1}">
	   	${loan.loansignbasics.loanTitle}（助人贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==2}">
	   	${loan.loansignbasics.loanTitle}（助企贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==3}">
	   	${loan.loansignbasics.loanTitle}（企业群联保贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==4}">
	  	${loan.loansignbasics.loanTitle}（投资人周转贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==5}">
	  	${loan.loansignbasics.loanTitle}（秒标）
	   	</c:if>
   </c:if>
   <c:if test="${loan.loanType==2}">
   		${loan.loansignbasics.loanTitle}（天标）
   </c:if>
   <c:if test="${loan.loanType==3}">
   		${loan.loansignbasics.loanTitle}（秒标）
   </c:if>
    </title>
<base href="<%=basePath%>"/>
<script>
	  //格式化金额
  //优化负数格式化问题
  function fmoney(s, n) {
      n = n > 0 && n <= 20 ? n : 2;
      f = s < 0 ? "-" : ""; //判断是否为负数
      s = parseFloat((Math.abs(s) + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";//取绝对值处理, 更改这里n数也可确定要保留的小数位
      var l = s.split(".")[0].split("").reverse(),
      r = s.split(".")[1];
      t = "";
      for(i = 0; i < l.length; i++ ) {
         t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
      }
      return f + t.split("").reverse().join("");
  }

</script>

</head>
<body onload="showtime()">
<!--head-->
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />

<!--End head-->

<!--Content-->
<div class="Content">
 <div class="w1000px">
 <!--mapLinkBox-->
 <div class="mapLinkBox"><a href="<%=basePath%>">首页</a> / <a href="loaninfo/openLoan.htm" >我要投资</a> / <a href="javascript:void(0)" style="color: #ff9e57;">
	   <c:if test="${loan.loanType==1 }">
	   	<c:if test="${loan.loansignType.id==1}">
	   	${loan.loansignbasics.loanTitle}（助人贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==2}">
	   	${loan.loansignbasics.loanTitle}（助企贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==3}">
	   	${loan.loansignbasics.loanTitle}（企业群联保贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==4}">
	  	${loan.loansignbasics.loanTitle}（投资人周转贷）
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==5}">
	  	${loan.loansignbasics.loanTitle}（秒标）
	   	</c:if>
   </c:if>    
   <c:if test="${loan.loanType==2}">
   		${loan.loansignbasics.loanTitle}（天标）
   </c:if>
   <c:if test="${loan.loanType==3}">
   		${loan.loansignbasics.loanTitle}（秒标）
   </c:if>
    </a></div>
 <!--End mapLinkBox-->
 				 <!--借款信息-->
 	   <div class="contwrapBox">
			<div class="contwrapbox w100">
	        <dl>
	    <dt><div class="box">
	   <c:if test="${loan.loanType==1 }">
	   	<c:if test="${loan.loansignType.id==1}">
	   	${loan.loansignbasics.loanTitle}（助人贷）<a href="javascript:openWin('/views/model.html');" class="xy">借款协议</a>
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==2}">
	   	${loan.loansignbasics.loanTitle}（助企贷）<a href="javascript:openWin('/views/model.html');" class="xy">借款协议</a>
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==3}">
	   	${loan.loansignbasics.loanTitle}（企业群联保贷）<a href="javascript:openWin('/views/model.html');" class="xy">借款协议</a>
	   	</c:if>
	   	<c:if test="${loan.loansignType.id==4}">
	  	${loan.loansignbasics.loanTitle}（投资人周转贷）<a href="javascript:openWin('/views/model.html');" class="xy">借款协议</a>
	   	</c:if>
   </c:if>
   <c:if test="${loan.loanType==2}">
   		${loan.loansignbasics.loanTitle}（天标）
   </c:if>
   <c:if test="${loan.loanType==3}">
   		${loan.loansignbasics.loanTitle}（秒标）
   </c:if>
    		<div class="dadatype" style="display: inline-block;">
    	<c:if test="${loan.loansignType.id==1}">
	    <span><i class="t1"></i></span>
	   	</c:if>
    	<c:if test="${loan.loansignType.id==2}">
	    <span><i class="t2"></i></span>
	   	</c:if>
    	<c:if test="${loan.loansignType.id==3}">
	    <span><i class="t3"></i></span>
	   	</c:if>
		</div>

<span class="no1">(企业编号：${loan.loansignbasics.loanNumber})</span>
    </div></dt>
	 	    <dd>
	 	    <div class="contwrapbody left">
	 	    <div class="pic"><i></i><img src="resources/img/contwrap-hot.jpg"/></div>
	 	    <div class="dada">
	 	    <table style="width: 400px;">
	        <tr>
	 	    <th>年化收益</th>
	 	    <th>投资金额</th>
	 	    <th>借款期限</th>
	 	    <th>标期</th>
	        </tr>
	        <tr>
	        <td><b class="h"><fmt:formatNumber value="${loan.rate*100}" pattern="##.##"  minFractionDigits="2"/></b>%</td>
	        <td>
<b class="h"><script type="text/javascript">
var str = parseFloat('<fmt:formatNumber value="${loan.issueLoan}" pattern="##.##"  minFractionDigits="2"/>');
document.write(fmoney(str,0));
</script></b>元</td>
	        <td>
	  	    <c:if test="${!empty loan.month}"><b>${loan.month}</b>月</c:if>
			<c:if test="${!empty loan.useDay}"><b>${loan.useDay}</b> 天</c:if>
            </td>
	        <td><b>${loan.loansignType.money}</b>天</td>
	 	    </tr>
	 	    </table>
	 	    <div class="dadaloadbox">
			投资进度：<div class="loading"><span data-value="<fmt:formatNumber  value="${scale/loan.issueLoan*100}"  pattern="#0.00" />"></span>
		    </div>
		    <b><fmt:formatNumber  value="${scale/loan.issueLoan*100}"  pattern="#0.00" />%</b>
		    </div>
		<div class="textbox">
		<table width="100%">
		<tr>
		<td>保障方式：本金+利息</td>
		<td>还款方式：<c:if test="${loan.loanType==1}">
      	<c:if test="${loan.refundWay==1}">等额本息</c:if>
      	<c:if test="${loan.refundWay==2}">每月付息到期还本</c:if>
      	<c:if test="${loan.refundWay==3}">到期一次性还本息</c:if>
      	</c:if>
      	<c:if test="${loan.loanType==2||loan.loanType==3}">到期一次性还本息</c:if>	</td>
		<tr>
		<td>借款人投标奖励：<fmt:formatNumber value="${loan.loansignbasics.reward*100}" pattern="##.##"  minFractionDigits="2"/>%</td>
		<td>第三方担保：${loan.loansignbasics.assure}</td>
		</tr>
		</table>
		<div class="clear"></div>
		</div>
		<div class="startingbox" id="showtime">
	    <input type="hidden" id="loantype" value="${loan.loanType }"/>
	    <input type="hidden" id="endtime_year" value="${fn:substring(loan.endTime,0,4) }" />
	    <input type="hidden" id="endtime_month" value="${fn:substring(loan.endTime,5,7) }"/>
	    <input type="hidden" id="endtime_day" value="${fn:substring(loan.endTime,8,10) }"/>
	    <input type="hidden" id="time" value="${time}"/>
	    剩余投标时间:<label id="showday" class="showtime"></label>天<label id="showhour" class="showtime"></label>时
	    <label id="showminute" class="showtime"></label>分<label id="showsecond" class="showtime"></label>秒
				   
		</div>
	 	    </div>
	 	    </div>
	 	    <div class="contwrapbody right">
<div class="listtitle"><h2>投资金额<c:if test="${!empty  loan.month }"><a href="<%=basePath%>arith/loan_Calculate?issueLoan=${loan.issueLoan}&month=${loan.month }&rate=${loan.rate*100}&mfeeratio=${loan.loansignbasics.reward*100}&refundWay=${loan.refundWay}"><i title="投资设计器"></i></a></c:if></h2></div>
   <form id="form1" action="/plank/getLoaninfo.htm" method="post" >
            <input type="hidden" id="loanUnit" name="loanUnit" value="${loan.loanUnit}"/>
            <input type="hidden" id="loanid" name="id" value="${loan.id}"/>
            <input type="hidden" id="userId" name="userId" value="${loan.userbasicsinfo.id}"/>
            <input type="hidden" id="user" name="user" value="${session_user.id}"/>
            <input type="hidden" id="logo" value="${logo}"/>
   <div class="investment">
    <h3>可投金额：<b><fmt:formatNumber value="${maxMoney}" pattern="0"/></b>元</h3>
    <h3>账户余额：<b><fmt:formatNumber value="${money}" type="number" /></b>元</h3>
   </div>
   <div class="investment">
    <div class="text"><input type="text" id = "investMoney" name="money" placeholder="请输入投资额(${loan.loanUnit}元起投)"/>元</div>
   </div>
   <div class="smbox" id="button_Bat" style="text-align:center;">
	<input type="submit" id="suBnt_a" class="sm" style="border: 0px;vertical-align: middle;" value="确认投标" />
   </div>
   </form>
  <div class="clear"></div>
  </div>
	 	    <div class="clear"></div>
	 	    </dd>
	        </dl>
	        </div>
                 <!--End 借款信息-->
        　　　　　　<div class="tabbody">
                    <div class="tabtype">
					<dl>
					<dt class="ts">资料审核状态</dt>
			        <dd class="icon"><i class="i1"></i>实名认证</dd>
			        <dd class="icon"><i class="i2"></i>邮箱认证</dd>
			        <dd class="icon"><i class="i3"></i>手机认证</dd>
			        <dd class="icon"><i class="i4"></i>头像认证</dd>
					</dl>
                    </div>
	        </div>
	        </div>

<!--借款信息资料--> 
	<div class="boxleft">
 	   <div class="contwrapBox min" style="margin-bottom:0px;min-height: 742px;">
		<div class="contwrapbox w100">
	    <dl>
	    <dt><div class="box">借款方相关资料</div></dt>
    <dd>
    <ul>
    <li class="tabopen"><div class="title"><i></i>借款用途<a class="tabopen" href="javascript:;">关闭详情</a></div><p class="body">${loan.loansignbasics.behoof}</p></li>
    <li><div class="title"><i></i>商业概述<a class="tabopen" href="javascript:;">展开详情</a></div><p class="body">${loan.loansignbasics.overview}</p></li>
    <li><div class="title"><i></i>还款来源<a class="tabopen" href="javascript:;">展开详情</a></div><p class="body">${loan.loansignbasics.loanOrigin }</p></li>
    <li><div class="title"><i></i>风险控制措施<a class="tabopen" href="javascript:;">展开详情</a></div><p class="body">${loan.loansignbasics.riskCtrlWay }</p></li>
    <li><div class="title"><i></i>借款人感言<a class="tabopen" href="javascript:;">展开详情</a></div><p class="body">${loan.loansignbasics.speech }</p></li>
    </ul>
    </dd>
    </dl>
	</div>
	</div>
	</div>
	<div class="boxright">
	 	<div class="contwrapBox img">
		<div class="contwrapbox w100">
	    <dl>
	    <dt><div class="box">项目图片</div></dt>
    <dd>
    <ul>
    <li><img src="/resources/images/typepic/pic1.jpg"/></li>
    <li><img src="/resources/images/typepic/pic2.jpg"/></li>
    <li><img src="/resources/images/typepic/pic3.jpg"/></li>
    <li><img src="/resources/images/typepic/pic4.jpg"/></li>
    </ul>
    </dd>
    </dl>
	</div>
	</div>
	 	<div class="contwrapBox img" style="margin-bottom:0px;">
		<div class="contwrapbox w100">
	    <dl>
	    <dt><div class="box">协议图片</div></dt>
    <dd>
    <ul>
    <li><img src="/resources/images/typepic/xy1.jpg"/></li>
    <li><img src="/resources/images/typepic/xy2.jpg"/></li>
    <li><img src="/resources/images/typepic/xy3.jpg"/></li>
    <li><img src="/resources/images/typepic/xy4.jpg"/></li>
    </ul>
    </dd>
    </dl>
	</div>
	</div>
	</div>
 <div class="clear"></div>
 <div class="jiekuanList dataInfo">
 <div class="usermask" <c:if test="${empty session_user }">style="display:block;"</c:if>>
 <p>请先<a href="/visitor/to-login">登录</a>或<a href="/visitor/to-regist">注册</a>后再查看</p>
 </div>
 <div class="jiekanTitleBox">
 <ul>
 <li class="on"><h1>借出记录</h1></li>
 <li><h1>借款历史记录</h1></li>
 </ul>
 </div>
 <div class="tabbody">
  <!-- End借款方相关资料 -->
   <!-- 借出记录 -->
  <div class="dataContBox" style="display: none;">
  </div>
  <!-- End借出记录 -->
   <!-- 借款历史记录 -->
  <div class="dataContBox" style="display: none;">
  </div>
</div>
</div>
</div>
<!--End Content-->
<div class="clear"></div>
<!--footer-->
<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
<script type="text/javascript" src="resources/js/plank.js"></script>
<script type="text/javascript" src="resources/js/condition.js"></script>
<script type="text/javascript" src="resources/js/loanSign/loaninfo.js"></script>
<!--End footer-->
</body>
<!-- <script type="text/javascript"> -->
<!-- // 	var cuter10 = function(str){ -->
<!-- // 	var len = str.length, str2 = '', max = Math.floor(len / 3);  -->
<!-- // 	for(var i = 0 ; i < max ; i++){  -->
<!-- // 		var s = str.slice(len - 3, len);  -->
<!-- // 		str = str.substr(0, len - 3);  -->
<!-- // 		str2 = (',' + s) + str2;  -->
<!-- // 		len = str.length;  -->
<!-- // 	}  -->
<!-- // 	str += str2;  -->
<!-- // 	return str; -->
<!-- // }; -->
	
<!-- // // 	$(function($){ -->
<!-- // // 		var str=1000000; -->
<!-- // // 		alert(formatCurrency(str)); -->
		
<!-- // // 	}); -->
	

<!-- // 	function formatCurrency(num) {  -->
<!-- // 		var sign="";  -->
<!-- // 		if(isNaN(num)) {  -->
<!-- // 			num = 0;  -->
<!-- // 		}  -->
<!-- // 		if(num<0){  -->
<!-- // 		sign="-";  -->
<!-- // 		}  -->
<!-- // 		var strNum=num+"";  -->
<!-- // 		var arr1 = strNum.split(".");  -->
<!-- // 		var hasPoint=false;//是否有小数部分  -->
<!-- // 		var piontPart="";//小数部分  -->
<!-- // 		var intPart=strNum;//整数部分  -->
<!-- // 		if(arr1.length>=2) {  -->
<!-- // 			hasPoint=true;  -->
<!-- // 			piontPart= arr1[1];  -->
<!-- // 			intPart=arr1[0];  -->
<!-- // 		}  -->

<!-- // 		var res='';//保存添加逗号的部分  -->
<!-- // 		var intPartlength=intPart.length;//整数部分长度  -->
<!-- // 		var maxcount=Math.ceil(intPartlength/3);//整数部分需要添加几个逗号  -->
<!-- // 		for (var i = 1; i <=maxcount;i++)//每三位添加一个逗号  -->
<!-- // 		{  -->
<!-- // 			var startIndex=intPartlength-i*3;//开始位置  -->
<!-- // 			if(startIndex<0)//开始位置小于0时修正为0  -->
<!-- // 			{  -->
<!-- // 				startIndex=0;  -->
<!-- // 			} -->
<!-- // 			var endIndex=intPartlength-i*3+3;//结束位置  -->
<!-- // 			var part=intPart.substring(startIndex,endIndex)+",";  -->
<!-- // 			res=part+res;  -->
<!-- // 		}  -->
<!-- // 		res=res.substr(0,res.length-1);//去掉最后一个逗号  -->
<!-- // 		if(hasPoint)  -->
<!-- // 		{  -->
<!-- // 		return "￥"+sign+res+"."+piontPart;  -->
<!-- // 		}  -->
<!-- // 		else  -->
<!-- // 		{  -->
<!-- // 		return "￥"+sign+res;  -->
<!-- // 		}  -->

<!-- // 	}  -->
<!-- </script> -->
<script language="javascript">
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
				var $loanid = $("#loanid").val();
				var $thisIndex=0;
				if($thisIndex==0){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$.ajax({
						type:'post',
						url:'loaninfo/loanRecord.htm',
						data:{id:$loanid,pageno:1},
						success:function(msg){
							$(".dataContBox:eq("+$thisIndex+")").html(msg);
						}
					});
					$(".dataContBox:eq("+$thisIndex+")").show();
}
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
$('a.tabopen').click(function(){
$(this).parent().parent().parent('ul').find("li").removeAttr('class');
$(this).parent().parent().parent('ul').find("a").text('展开详情');
if(!$(this).parent().parent().hasClass('tabopen')){
$(this).parent().parent().attr('class','tabopen');
$(this).text('关闭详情');
}
if($(this).parent().next().text()==''){
$(this).parent().next().text('没找到相关信息');
}else if($(this).parent().next().text()=='没找到相关信息'){
$(this).parent().next().text('');
}
});
</script>
</html>