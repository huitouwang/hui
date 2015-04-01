$(function(){
  //借款信息
	$(".dataInfo li h1").mouseover(function(){
				$(this).parent().parent("ul").find("li").removeClass("on");
				$(this).parent('li').addClass("on");
				var $loanid = $("#loanid").val();
				var $thisIndex=$(this).parent("li").index();
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
				}else if($thisIndex==1){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$.ajax({
						type:'post',
						url:'loaninfo/loanSignRecord.htm',
						data:{id:$loanid,pageNo:1},
						success:function(msg){
							$(".dataContBox:eq("+$thisIndex+")").html(msg);
						}
					});
					$(".dataContBox:eq("+$thisIndex+")").show();
				}else if($thisIndex==4){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$(".dataContBox:eq("+$thisIndex+")").show();
				}
		});
	//购买借款标
	$("#form1").submit(function(){
		var $logo = $("#logo").val();
		var $effective = $("#effective").text();
		var $investMoney = $("#investMoney").val();
		var $userId = $("#userId").val();
		var $user = $("#user").val();
		var $loanUnit = $("#loanUnit").val();
		var $loanid = $("#loanid").val();
		var reg = /^[0-9]*[1-9][0-9]*$/;
		if($logo!="logo"){
			ymPrompt.succeedInfo('您还未登录额!',400,200,'提示',function(){window.location.href="/visitor/to-login";});
			return false;
		}
		if($investMoney==""){
			ymPrompt.succeedInfo('请输入购标金额!',400,200,'提示',function(){});
			return false;
		}
		if($investMoney==null){
			ymPrompt.succeedInfo('请输入购标金额!',400,200,'提示',function(){});
			return false;
		}
		if(!reg.test($investMoney)){
			ymPrompt.succeedInfo('您的输入有误，请重新输入!',400,200,'提示',function(){});
			$("#investMoney").val("");
			return false;
		}
		if($userId==$user){
			ymPrompt.succeedInfo('不能购买自己的借款标!',400,200,'提示',function(){});
			return false;
		}
		if(parseInt($investMoney)%parseInt($loanUnit)>0){
			ymPrompt.succeedInfo('您的输入有误,请重新输入'+$loanUnit+'的倍数!',400,200,'提示',function(){});
			return false;
		}
		if(parseInt($investMoney)>parseInt($effective)){
			ymPrompt.succeedInfo('您的输入已超过了最大购买金额,请重新输入!',400,200,'提示',function(){});
			return false;
		}
		$.ajax({
			type:'post',
			url:'/plank/ajaxLoanInfo.htm',
			async:false,
			data:{id:$loanid,money:$investMoney,loanUnit:$loanUnit},
			success:function(msg){
				if(msg=="0"){
					ymPrompt.succeedInfo('您还未登录额!',400,200,'提示',function(){window.location.href="/visitor/to-login";});
					return false;
				}else if(msg=="1"){
					ymPrompt.succeedInfo('您的输入有误，请重新输入!',400,200,'提示',function(){});
					$("#investMoney").val("");
					return false;
				}else if(msg=="2"){
					ymPrompt.succeedInfo('您的输入有误，请重新输入!',400,200,'提示',function(){});
					$("#investMoney").val("");
					return false;
				}else if(msg=="3"){
					ymPrompt.succeedInfo('您的输入已超过了您的当前余额,请重新输入!',400,200,'提示',function(){});
					return false;
				}else if(msg=="4"){
					ymPrompt.succeedInfo('抱歉！由于该借款标有投资订单尚在付款中，故剩余可投金额可能小于您输入的投资金额，请刷新本页面再次操作。由此给您带来的不便，敬请谅解!感谢您的耐心等待!',400,200,'提示',function(){});
					return false;
				}else if(msg=="5"){
					ymPrompt.succeedInfo('请输入购买金额!',400,200,'提示',function(){});
					return false;
				}else if(msg=="8"){
					return true;
				}
			}
		});
	});
});

//收藏借款标
function collect(){
	var $logo = $("#logo").val();
	var id=$("#loanid").val();
	if($logo!="logo"){
		ymPrompt.succeedInfo('您还未登录额!',400,200,'提示',function(){window.location.href="visitor/to-login";});
		return;
	}
	$.ajax({
		type:'post',
		url:'/collectlist/addCollect',
		data:'id='+id,
		success:function(msg){
			if(msg=="1"){
				$(".collect").css("background", "url('resources/images/listinfo_bnt_d.png')");
				$(".collect").css("padding-bottom", "0px");
				ymPrompt.succeedInfo("收藏成功！",400,200,'提示');
			}else{
				ymPrompt.succeedInfo("您已成功收藏此借款标！",400,200,'提示');
			}
		}
	});
}

$(document).ready(function(){
	var $logo = $("#logo").val();
	var id=$("#loanid").val();
	if($logo!="logo"){
		return;
	}
	$.ajax({
		type:'post',
		url:'collectlist/checkCollect',
		data:'id='+id,
		success:function(msg){
			if(msg=="1"){
				$(".collect").css("padding-bottom", "0px");
				$(".collect").css("background", "url('resources/images/listinfo_bnt_d.png')");
			}
		}
	});
});