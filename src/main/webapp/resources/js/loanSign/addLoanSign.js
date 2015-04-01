$(function(){
	var reg = /^[0-9]*[1-9][0-9]*$/;
	$("#issueLoan").blur(function(){
		var issueloan = $("#issueLoan").val();
		if(!reg.test(issueloan)){
			ymPrompt.succeedInfo('您的输入有误，请重新输入!',400,200,'提示',function(){});
			$("#issueLoan").val("");
			return;
		}
		if(parseFloat(issueloan)%50>0){
			alertMsg.info('您的数据输入有误，请输入50的倍数！');
			return;
		}
	});
	//判断普通会员的购买份数
	$("#counterparts").blur(function(){
		var issueloan = $("#issueLoan").val();
		var loanUnit = $("#loanUnit").val();
		var counterparts = $("#counterparts").val();
		var num = parseFloat(issueloan)/parseFloat(loanUnit);
		if(!reg.test(counterparts)){
			alertMsg.info('您的输入有误，请重新输入!');
			$("#counterparts").val("");
			return;
		}
		if(counterparts>num){
			alertMsg.info('您的数据输入有误，请输入小于'+num+'的份数！');
			return;
		}
	});
	$("#vipCounterparts").blur(function(){
		var issueloan = $("#issueLoan").val();
		var loanUnit = $("#loanUnit").val();
		var counterparts = $("#counterparts").val();
		var vipCounterparts = $("#vipCounterparts").val();
		var num = parseFloat(issueloan)/parseFloat(loanUnit);
		if(!reg.test(vipCounterparts)){
			alertMsg.info('您的输入有误，请重新输入!');
			$("#vipCounterparts").val("");
			return;
		}
		if(vipCounterparts>num){
			alertMsg.info('您的数据输入有误，请输入小于'+num+'的份数！');
			return;
		}
		if(parseFloat(counterparts)>parseFloat(vipCounterparts)){
			alertMsg.info('您的数据输入有误，请输入大于'+counterparts+'的份数！');
			return;
		}
		
	});
});