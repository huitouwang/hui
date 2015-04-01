$(function(){
		$.ajax({
			type:'post',
			data:'no='+1,
			url:'userinfovip/vipRecord.htm',
			success:function(msg){
				$(".vipContTitle").after(msg);
			}
		});
});

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	$.ajax({
		type:'post',
		url:'userinfovip/vipRecord.htm',
		data:'no='+pageno,
		success:function(msg){
			$(".vipContTitle").after(msg);
		}
	});
}
function deletes(vipId){
	ymPrompt.confirmInfo("是否删除该记录",400,200,"提示",function(tp){
		if(tp=="ok"){
			$.ajax({
				type:'post',
				url:'userinfovip/delete.htm',
				data:'id='+vipId,
				success:function(msg){
					if(msg=="1"){
						ymPrompt.succeedInfo('删除成功',400,200,'提示',function(){window.location.href="userinfovip/vipRecords.htm"});
					}else{
						ymPrompt.succeedInfo('删除失败',400,200,'提示',function(){});
					}
				}
			});
		}
	});
}
