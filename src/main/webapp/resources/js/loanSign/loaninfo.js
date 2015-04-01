$.fn.imgscroll = function(o){
	var defaults = {
		speed: 40,
		amount: 0,
		width: 1,
		dir: "left"
	};
	o = $.extend(defaults, o);
	
	return this.each(function(){
		var _li = $("li", this);
		_li.parent().parent().css({overflow: "hidden", position: "relative"}); //div
		_li.parent().css({margin: "0", padding: "0", overflow: "hidden", position: "relative", "list-style": "none"}); //ul
		_li.css({position: "relative", overflow: "hidden"}); //li
		if(o.dir == "left") _li.css({float: "left"});
		
		//初始大小
		var _li_size = 0;
		for(var i=0; i<_li.size(); i++)
			_li_size += o.dir == "left" ? _li.eq(i).outerWidth(true) : _li.eq(i).outerHeight(true);
		
		//循环所需要的元素
		if(o.dir == "left") _li.parent().css({width: (_li_size*3)+"px"});
		_li.parent().empty().append(_li.clone()).append(_li.clone()).append(_li.clone());
		_li = $("li", this);

		//滚动
		var _li_scroll = 0;
		function goto(){
			_li_scroll += o.width;
			if(_li_scroll > _li_size)
			{
				_li_scroll = 0;
				_li.parent().css(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll });
				_li_scroll += o.width;
			}
				_li.parent().animate(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll }, o.amount);
		}
		
		//开始
		var move = setInterval(function(){ goto(); }, o.speed);
		_li.parent().hover(function(){
			clearInterval(move);
		},function(){
			clearInterval(move);
			move = setInterval(function(){ goto(); }, o.speed);
		});
	});
};

$(document).ready(function(){
	$(".dataContBox").imgscroll({
		speed: 40,    //图片滚动速度
		amount: 0,    //图片滚动过渡时间
		width: 1,     //图片滚动步数
		dir: "left"   // "left" 或 "up" 向左或向上滚动
	});
});

function showtime(){
	var loantype=$("#loantype").val();
	var $loan = $(".DataLoadding span").attr("data-value");
	if(loantype!=3){
		if($loan!=100.00){
			var endyear=$("#endtime_year").val();
			var endmonth=$("#endtime_month").val();
			var endday=$("#endtime_day").val();
			var sTime=new Date();
			var enddate=endyear+"/"+endmonth+"/"+endday+" 00:00:00";
			var eTime=new Date(enddate);
			var sumSecond=parseInt((eTime.getTime()-sTime.getTime())/1000);sumSecond=sumSecond+(24*60*60);
			var showSecond=sumSecond%60;
			var sumMinute=(sumSecond-showSecond)/60;
			var showMinute=sumMinute%60;
			var sumHour=(sumMinute-showMinute)/60;
			var showHour=sumHour%24;
			var showData=(sumHour-showHour)/24;
			if(showData>-1){
				$("#showday").html(showData);
				$("#showhour").html(showHour);
				$("#showminute").html(showMinute);
				$("#showsecond").html(showSecond);
				timerID=setTimeout("showtime()",1000);
			}else{
				$("#showtime").html("<lable class='showtime'>已结束</lable>");
				$("#suBnt_a").attr("style","");
				$("#suBnt_a").css({backgroundImage:"url('/resources/images/listinfo_bnt_c.png')",border: "0px",verticalAlign:"middle"});
				$("#suBnt_a").attr("disabled",true);
				$("#collect").attr("disabled",true);
			}
		}else{
			$("#showtime").html("<lable class='showtime'>已结束</lable>");
			$("#suBnt_a").attr("style","");
			$("#suBnt_a").css({backgroundImage:"url('/resources/images/listinfo_bnt_c.png')",border: "0px",verticalAlign:"middle"});
			$("#suBnt_a").attr("disabled",true);
			$("#collect").attr("disabled",true);
		}
	}else{
		$("#showtime").html("<lable class='showtime'>无时间限制</lable>");
	}
}  