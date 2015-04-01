function judge(id,state){
		$.ajax({
			type:'post',
			data:{"id":id,"state":state},
			url:'loanManage/judge.htm',
			success:function(msg){
				if(msg=="1"){
					ymPrompt.succeedInfo('余额不足，请充值!',400,200,'提示',function(){});
				}else{
					ymPrompt.confirmInfo(msg,400,200,"提示",function(tp){
						if(tp=="ok"){
							window.location.href="/loanManage/repayment.htm?id="+id+"&state="+state;
						}
					});
				}
			}
		});
	}
