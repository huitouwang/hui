<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
 <%--vipLeft --%>
<div class="vipLeftBox">
<dl>
 <dt><i>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle">
  <polygon points="0,0 10,0 5,10"></polygon>
</svg>		
 </i>个人中心</dt>
 <dd><a href="<%=basePath%>member_index/member_center">我的首页</a></dd>
 <dd><a href="<%=basePath%>update_info/forword_url?url=head">基本信息</a></dd>
 <dd><a href="<%=basePath%>userinfovip/upgrade.htm">升级VIP</a></dd>
 <dd><a href="<%=basePath%>update_info/message_setting" id="mset">消息设置</a></dd>
 <dd><a href="<%=basePath%>update_info/forword_url?url=updatePwd" id="upPwd">修改密码</a></dd>
 <dd><a href="<%=basePath%>member_index/system_message" id="sysmess">系统消息</a></dd>
 <dd><a href="<%=basePath%>member/mail">安全中心</a></dd>
</dl>
<dl>
 <dt><i>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle">
  <polygon points="0,0 10,0 5,10"></polygon>
</svg>		
 </i>投资管理</dt>
 <dd><a href="<%=basePath%>depositshistory/init_two">投资记录</a></dd>
 <dd><a href="<%=basePath%>collectlist/collect">我的收藏</a></dd>
 <dd><a href="<%=basePath%>contract/query_page">回款计划</a></dd>
 <dd><a href="<%=basePath%>loaninfo/openLoan.htm">我要投资</a></dd>
</dl>
<dl>
 <dt><i>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle">
  <polygon points="0,0 10,0 5,10"></polygon>
</svg>		
 </i>借款管理</dt>
 <dd><a href="<%=basePath%>loanManage/achieveLoan.htm">借款记录</a></dd>
 <dd><a href="<%=basePath%>borrower_record/toRecord">借入记录</a></dd>
 <dd><a href="<%=basePath%>repay_plan/showBackMoney">还款安排</a></dd>
 <dd><a href="<%=basePath%>borrow/borr-type">我要借款</a></dd>
 <dd><a href="<%=basePath%>repayments/repayment.htm">我要还款</a></dd>
</dl>
<dl>
 <dt><i>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle">
  <polygon points="0,0 10,0 5,10"></polygon>
</svg>		
 </i>资金管理</dt>
 <dd><a href="<%=basePath%>my_money/my_money_sum">资金统计</a></dd>
 <dd><a href="<%=basePath%>recharge/openRecharge">我要充值</a></dd>
 <dd><a href="<%=basePath%>withdraw/openWithdraw">我要提现</a></dd>
 <dd><a href="<%=basePath%>expenses/myexpenses.htm">我的收支单</a></dd>
</dl>
<dl>
 <dt><i>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle">
  <polygon points="0,0 10,0 5,10"></polygon>
</svg>		
 </i>推广中心</dt>
 <dd><a href="<%=basePath%>generalize/get_promote_links">我要赚钱</a></dd>
 <dd><a href="<%=basePath%>generalize/generalize_list" id="gener">推广记录</a></dd>
</dl>
</div>
<script>
	$(function(){
		var href = window.location.href;
		var allhref="";
		if(href.indexOf($("#mset").attr("href"))!=-1 || href.indexOf("update_messge")!=-1){
			$("#mset").attr("class","vipNavLink");
			return;
		}
		if(href.indexOf($("#upPwd").attr("href"))!=-1){
			$("#upPwd").attr("class","vipNavLink");
			return;
		}
		if(href.indexOf($("#sysmess").attr("href"))!=-1){
			$("#sysmess").attr("class","vipNavLink");
			return;
		}
		if(href.indexOf($("#gener").attr("href"))!=-1 || href.indexOf("genmoney_list")!=-1){
			$("#gener").attr("class","vipNavLink");
			return;
		}
		$(".vipLeftBox dl dd a").each(function(){
			allhref=$(this).attr("href");
			if(href.indexOf(allhref.substr(0,allhref.lastIndexOf("/")))!=-1){
				$(this).attr("class","vipNavLink");
				$(this).parent().parent('dl').attr('class','tabopen');
				return false;
			}
		});
	});
	$('.vipLeftBox dl:lt(3)').attr('class','tabopen');
$('.vipLeftBox dl dt').click(function(){
//$(this).parent().parent().find('dl').removeAttr('class');
if(!$(this).parent('dl').hasClass('tabopen')){
$(this).parent('dl').attr('class','tabopen');
}else{
$(this).parent('dl').removeAttr('class');

}
});

</script>
<%--End vipLeft--%>