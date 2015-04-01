function sms_ajax(_url,_param,_callback){
	$.ajax({
		url:_url,
		type:"post",
		data:_param,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		success:function(_msg){
			ymPrompt.succeedInfo(_msg, 400, 200, null, null);
		}
	});
}

function submits(){
	$('#userbankfrom').ajaxSubmit({
		dataType : 'text',
		success : function(msg) {
			if(msg==1){
				ymPrompt.succeedInfo("验证码已过期", 400, 200, '提示', null);
			}else if(msg==2){
				ymPrompt.succeedInfo("验证码输入错误", 400, 200, '提示', null);
			}else{
				ymPrompt.succeedInfo("添加成功", 400, 200, '提示', null);
			}	
		}
	});
}