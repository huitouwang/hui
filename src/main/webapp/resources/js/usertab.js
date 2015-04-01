$(function(){
					var $loanid = $("#loanid").val();
				var $thisIndex=0;
				if($thisIndex==0){
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$(".dataContBox:eq("+$thisIndex+")").show();
}

  //借款信息
	$(".dataInfo li h1").mouseover(function(){
				$(this).parent().parent("ul").find("li").removeClass("on");
				$(this).parent('li').addClass("on");
				var $loanid = $("#loanid").val();
				var $thisIndex=$(this).parent("li").index();
					$(".dataContBox:eq("+$thisIndex+")").siblings(".dataContBox").hide();
					$(".dataContBox:eq("+$thisIndex+")").show();
		});
});