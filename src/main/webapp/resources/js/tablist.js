$(function(){
  //借款信息
	$(".jiekuanList li h1").mouseover(function(){
				$(this).parent().parent("ul").find("li").removeClass("on");
				$(this).parent('li').addClass("on");
				var $thisIndex=$(this).parent("li").index();
				$(".tablistbox").hide();
				$(".tablistbox:eq("+$thisIndex+")").show();
				//alert($thisIndex);
		});
});