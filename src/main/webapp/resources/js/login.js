$(function() {
	$("#df_rigster").validationEngine({
		promptPosition : "topRight",
		autoHidePrompt : true,
		autoHideDelay : 500,
		onSuccess : function(form, valid) {
			if (valid) {
				$("input").attr("readonly", "readonly");
				$("#user_rigster").val("正在注册");
			} else {

			}
		}
	});

	$("#password").keyup(function() {
		var password=$("#password").val();
		if(password.length < 6){
			return;
		}
		var securityLevelFlagArray = new Array(0, 0, 0, 0);
		var securityLevelFlag = 0;
		for (var i = 0; i < password.length; i++) {
			var asciiNumber = password.substr(i, 1).charCodeAt();
			if (asciiNumber >= 48 && asciiNumber <= 57) {
				securityLevelFlagArray[0] = 1; // 仅数字
			} else if (asciiNumber >= 97 && asciiNumber <= 122) {
				securityLevelFlagArray[1] = 1; // 小写
			} else if (asciiNumber >= 65 && asciiNumber <= 90) {
				securityLevelFlagArray[2] = 1; // 大写
			} else {
				securityLevelFlagArray[3] = 1; // 特殊字符
			} 
		}
		for (var i = 0; i < securityLevelFlagArray.length; i++) {
			if (securityLevelFlagArray[i] == 1) {
				securityLevelFlag++;
			}
		}
		if(securityLevelFlag==1){
			$("#password").next().text("密码安全等级：低").show();
		}else if(securityLevelFlag==2 || securityLevelFlag==3){
			$("#password").next().text("密码安全等级：中").show();
		}else{
			$("#password").next().text("密码安全等级：高").show();
		}
	});
	
	$("#password").focus(function(){
		var password=$("#password").val();
		if(password.length<6){
			$("#password").next().text("输入密码，建议用英文和数字的组合");
		}
	});

	$("#df_login").validationEngine({
		promptPosition : "topRight",
		autoHidePrompt : true,
		autoHideDelay : 500,
		onValidationComplete : function(form, valid) {
			if (valid) {
				waiting("正在登录，请稍后...", "login_form");
			}
		}
	});
});