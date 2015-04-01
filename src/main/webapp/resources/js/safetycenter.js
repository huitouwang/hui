//ajax请求：请求地址,参数,回调方法
function fn_ajax(_url, _param, _callback) {
	$.ajax({
		url : _url,
		type : "post",
		data : _param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success : function(_msg) {
			if (_callback) {
				_callback(_msg);
			}
		}
	});
}
function sendemail() {
	fn_ajax("/member/resetMail", {}, function(data) {
		if (data == "1") {
			ymPrompt.succeedInfo('邮件已发送至您的邮箱，请注意查收！', 400, 200, '成功', null);
		} else {
			ymPrompt.errorInfo('邮件发送失败了！', 400, 200, '失败', null);
		}
	});
}

function uptEmail() {
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; // 验证邮箱的正则表
	if ($("#e-mail").val() == "") {
		ymPrompt.alert('请输入您要修改的邮箱！', 400, 200, '提示', null);
	} else {
		if (!reg.test($("#e-mail").val())) {
			ymPrompt.alert('请输入正确的邮箱！', 400, 200, '提示', null);
			return false;
		} else {
			fn_ajax("/member/uptEmail", {
				id : $("#id").val(),
				email : $("#e-mail").val()
			}, function(data) {
				if (data == "1") {
					ymPrompt.succeedInfo('邮箱修改成功！', 400, 200, '成功', null);
				} else {
					ymPrompt.errorInfo('邮箱修改失败！', 400, 200, '失败', null);
				}
			});
		}
	}
}

function safety(e) {
	var id = e.id;
	if (id == "email") {
		window.location.href = "/member/mail";
	}
	if (id == "identity") {
		window.location.href = "/member/identity";
	}
	if (id == "safety") {
		window.location.href = "/member/safety_quuestion";
	}
	if (id == "phone") {
		window.location.href = "/member/phone";
	}
	if (id == "ips") {
		window.location.href = "/member/openIps";
	}
	if (id == "identity_validate") {
		var uname = $("#uname").val();
		var ucardId = $("#ucardId").val();

		if (uname == "" || ucardId == "") {

			ymPrompt.alert('请输入真实姓名和正确的身份证号！', 400, 200, '提示', null);
			return false;
		} else {
			if (uname.length < 2) {
				ymPrompt.alert('真实姓名长度至少为2位！', 400, 200, '提示', null);
				return false;
			}
			if (checkIdcard(ucardId)) {
				$("#from_identity").submit();
			}
		}
	}
	if (id == "safety_problem01") {
		var question01 = $("#question05 option:selected").val();
		var anwser01 = $("#anwser05").val();
		var question02 = $("#question06 option:selected").val();
		var anwser02 = $("#anwser06").val();
		if (question01 == "" || anwser01 == "" || question02 == ""
				|| anwser02 == "") {
			ymPrompt.alert('请填写完整信息！', 400, 200, '提示', null);
			return false;
		}
		if (question01 == question02) {
			ymPrompt.alert('请选择不同的安全问题！', 400, 200, '提示', null);
			return false;
		} else {
			fn_ajax("/member/checkSafeQuestions", {
				id : $("#id").val(),
				question01 : question01,
				anwser01 : anwser01,
				question02 : question02,
				anwser02 : anwser02,
			}, function(data) {
				if (data == true) {
					ymPrompt.succeedInfo('恭喜您安全问题回答正确，现在您可以重新设置安全问题了！', 400, 200, '成功', function(){
						$("#Security_1")[0].reset();
						$("#safety_problem01").hide();
						$("#safety_problem02").show();
						$("#prompt").html("请您设置新的安全问题！");
					});
				} else {
					ymPrompt.errorInfo('对不起，安全问题回答错误！', 400, 200, '失败', null);
				}
			});
		}
	}
	
	if (id == "safety_problem02") {
		var question01 = $("#question05 option:selected").val();
		var anwser01 = $("#anwser05").val();
		var question02 = $("#question06 option:selected").val();
		var anwser02 = $("#anwser06").val();
		if (question01 == "" || anwser01 == "" || question02 == ""
				|| anwser02 == "") {
			ymPrompt.alert('请填写完整信息！', 400, 200, '提示', null);
			return false;
		}
		if (question01 == question02) {
			ymPrompt.alert('请选择不同的安全问题！', 400, 200, '提示', null);
			return false;
		} else {
			fn_ajax("/member/setSafetyProblem", {
				id : $("#id").val(),
				question01 : question01,
				anwser01 : anwser01,
				question02 : question02,
				anwser02 : anwser02,
			}, function(data) {
				if (data == "1") {
					ymPrompt.succeedInfo('安全问题设置成功！', 400, 200, '成功', function(){
						$("#Security_1")[0].reset();
					});
				} else {
					ymPrompt.errorInfo('安全问题设置失败！', 400, 200, '失败', function(){
						$("#Security_1")[0].reset();
					});
				}
			});
		}
	}

	if (id == "uptPhone") {
		var question01 = $("#question9 option:selected").val();
		var anwser01 = $("#anwser9").val();
		var question02 = $("#question10 option:selected").val();
		var anwser02 = $("#anwser10").val();
		var newPhone = $("#newPhone").val();
		var cellphone = /^(((1[0-9]{1}[0-9]{1}))+\d{8})$/;
		if (question01 == "" || anwser01 == "" || question02 == ""
				|| anwser02 == "") {
			ymPrompt.alert('请填写完整信息！', 400, 200, '提示', null);
			return false;
		}
		if (question01 == question02) {
			ymPrompt.alert('请选择不同的安全问题！', 400, 200, '提示', null);
			return false;
		}
		if (newPhone == "") {
			ymPrompt.alert('请输入手机号码！', 400, 200, '提示', null);
			return;
		}
		if (!cellphone.test(newPhone)) {
			ymPrompt.alert('请输入有效的手机号码！', 400, 200, '提示', null);
			return;
		} else {
			fn_ajax("/member/uptPhone", {
				id : $("#id").val(),
				question01 : question01,
				anwser01 : anwser01,
				question02 : question02,
				anwser02 : anwser02,
				newPhone : newPhone
			}, function(data) {
				if (data == "1") {
					ymPrompt.succeedInfo('手机号码修改成功！', 400, 200, '成功', function(){
						$("#upt_phone")[0].reset();
					});
				} else {
					ymPrompt.errorInfo('手机号码修改失败！', 400, 200, '失败', null);
				}
			});
		}
	}

	if (id == "uptEmail01") {
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; // 验证邮箱的正则表
		var question01 = $.trim($("#question03 option:selected").val());
		var anwser01 = $.trim($("#anwser03").val());
		var question02 = $.trim($("#question04 option:selected").val());
		var anwser02 = $.trim($("#anwser04").val());
		var newemail = $.trim($("#newemail").val());
		if (question01 == "" || anwser01 == "" || question02 == ""
				|| anwser02 == "" || newemail == "") {
			ymPrompt.alert('您还有未填写的信息，请填写完整的信息！', 400, 200, '提示', null);
			return false;
		}
		if (question01 == question02) {
			ymPrompt.alert('请选择不同的安全问题！', 400, 200, '提示', null);
			return false;
		}
		if (!reg.test(newemail)) {
			ymPrompt.alert('请输入正确的邮箱！', 400, 200, '提示', null);
			return false;
		} else {
			fn_ajax("/member/uptEmail1", {
				id : $("#id").val(),
				question01 : question01,
				anwser01 : anwser01,
				question02 : question02,
				anwser02 : anwser02,
				newemail : newemail
			}, function(data) {
				if (data == "1") {
					ymPrompt.succeedInfo('邮箱修改成功！', 400, 200, '成功', function(){
						$("#upt_email")[0].reset();
					});
				} else {
					ymPrompt.errorInfo('邮箱修改失败,请确保您的安全问题回答正确！', 400, 200, '失败', null);
				}
			});
		}
	}

	if (id == "smsValicode") {
		var cellphone = /^(((1[0-9]{1}[0-9]{1}))+\d{8})$/;
		var phone = $("#txt_phone").val();
		if (phone == "") {
			ymPrompt.alert('请输入手机号码！', 400, 200, '提示', null);
			return;
		}
		if (!cellphone.test(phone)) {
			ymPrompt.alert('请输入有效的手机号码！', 400, 200, '提示', null);
			return;
		} else {
			fn_ajax("/member/sendSMS", {
				phone : phone
			}, function(data) {
				if (data == "1") {
					ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收', 400, 200,
							'成功', null);
				} else {
					ymPrompt.errorInfo('手机验证码发送失败！', 400, 200, '失败', null);
				}
			});
		}
	}
	if (id == "file") {
		var FileName = $("#img_file").val();
		var extension = FileName.substring(FileName.lastIndexOf(".") + 1,
				FileName.length);// 文件扩展名
		extension = extension.toLowerCase();
		if (FileName == "") {
			ymPrompt.alert('请选择您要上传的图片！', 400, 200, '提示', null);
			return false;
		}
		if (extension != "JPG" && extension != "PNG" && extension != "GIF"
				&& extension != "BMP" && extension != "jpg"
				&& extension != "png" && extension != "gif"
				&& extension != "bmp") {
			ymPrompt
					.alert("请选择JPG, PNG,GIF, BMP格式的图片上传！", 400, 200, '提示', null);
			return;
		}
		if (checkfile()) {
			$("#form_upload").submit();
		}
	}
	if (id == "submit_phone") {
		var phonenumber = $("#txt_phone").val();
		var smscode = $("#txt_smscode").val();
		if (phonenumber == "") {
			ymPrompt.alert('请输入手机号！', 400, 200, '提示', null);
			return false;
		}
		if (smscode == "") {
			ymPrompt.alert('请输入手机验证码！', 400, 200, '提示', null);
			return false;
		}
		$("#form_phone").submit();
	}
}

function checkIdcard(num) {
	num = num.toUpperCase();
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
		// alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');
		ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
		return false;
	}
	// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	// 下面分别分析出生日期和校验位
	var len, re;
	len = num.length;
	if (len == 15) {
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
		var arrSplit = num.match(re);

		// 检查生日日期是否正确
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/'
				+ arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2]))
				&& ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
				&& (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay) {
			// alert('输入的身份证号里出生日期不对！');
			ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
			return false;
		} else {
			// 将15位身份证转成18位
			// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var nTemp = 0, i;
			num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
			for (i = 0; i < 17; i++) {
				nTemp += num.substr(i, 1) * arrInt[i];
			}
			num += arrCh[nTemp % 11];
			return true;
		}
	}
	if (len == 18) {
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
		var arrSplit = num.match(re);

		// 检查生日日期是否正确
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/"
				+ arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2]))
				&& ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
				&& (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay) {
			// alert(dtmBirth.getYear());
			// alert(arrSplit[2]);
			// alert('输入的身份证号里出生日期不对！');
			ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
			return false;
		} else {
			// 检验18位身份证的校验码是否正确。
			// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var valnum;
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var nTemp = 0, i;
			for (i = 0; i < 17; i++) {
				nTemp += num.substr(i, 1) * arrInt[i];
			}
			valnum = arrCh[nTemp % 11];
			if (valnum != num.substr(17, 1)) {
				// alert('18位身份证的校验码不正确！应该为：' + valnum);
				ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
				return false;
			}
			return true;
		}
	}
	return false;
}

function regis() {
	$.ajax({
		type : 'post',
		url : '/member/regis',
		success : function(msg) {
			window.location.href = "/member_index/member_center";
		}
	});
}

// 验证上传文件的大小
function checkfile() {
	var maxsize = 2 * 1024 * 1024;// 2M-附件最大上传大小
	var errMsg = "上传的附件文件不能超过2M！";
	var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器。";
	var browserCfg = {};
	var ua = window.navigator.userAgent;//判断用户所使用的浏览器
	if (ua.indexOf("MSIE") >= 1) {//ie浏览器
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {//火狐浏览器
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {//谷歌浏览器
		browserCfg.chrome = true;
	}
	try {
		var obj_file = document.getElementById('img_file');
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome) {
			filesize = obj_file.files[0].size;
		} else if (browserCfg.ie) {
			var obj_img = document.getElementById('tempimg');
			obj_img.dynsrc = obj_file.value;
			filesize = obj_img.fileSize;
		} else {
			ymPrompt.alert(tipMsg, 400, 200, '提示', null);
			return ;
		}
		if (filesize == -1) {
			ymPrompt.alert(tipMsg, 400, 200, '提示', null);
			return ;
		} else if (filesize > maxsize) {
			ymPrompt.alert(errMsg, 400, 200, '提示', null);
			return ;
		} 
		return true;
	} catch (e) {
	}
	return true ;
}

function uptEmail(){
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; //验证邮箱的正则表
	var e1 = $.trim($("#e-mail").val());
	if(e1 == ""){
		ymPrompt.alert('请输入邮箱！', 400, 200, '提示', null);
		return false;
	}
	if(!reg.test(e1))
    {
		ymPrompt.alert('您输入的新邮箱有误！', 400, 200, '提示', null);
        return false;
    }
	else{
    	fn_ajax("/member/uptEmail",{id:$("#id").val(), email:e1},function(data){
    		if(data=="1")
    		{
//    			ymPrompt.succeedInfo('邮箱绑定成功！', 400, 200, '成功', null);
    			fn_ajax("/member/replymail",{},function(data){
    	    		if(data=="1"){
    	    			ymPrompt.succeedInfo('邮箱绑定成功，我们已将激活邮件发送至您的邮箱，请注意查收！', 400, 200, '成功', function(){
    	    				window.location.href = "/member/mail";
    	    			});
    	    			
    	    		} else if(data == "2"){
    	    			ymPrompt.errorInfo('您的请求过于频繁，请等待两分钟！', 400, 200, '失败', null);
    	    		} else{
    	    			ymPrompt.errorInfo('邮件发送失败！', 400, 200, '失败', null);
    	    		}
    	    	});
    		}
    		else{
    			ymPrompt.errorInfo('邮箱绑定失败！', 400, 200, '失败', null);
    		}
    	});
    }
}