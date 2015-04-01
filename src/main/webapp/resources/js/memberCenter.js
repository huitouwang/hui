$(function(){
		$.ajax({
			url:'member_index/ajaxRecord',
			tpye:'POST',
			global:false,
			dataType: "json", 
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			success:function(msg){
				//借款记录
				$("#going").text(parseFloat(msg.issuingThe).toFixed(2)+"元");
				$("#going").next().text(parseFloat(msg.repaymentThe).toFixed(2)+"元");
				$("#going").next().next().text(parseFloat(msg.borrowed).toFixed(2)+"元");
				$("#going").next().next().next().text(parseFloat(msg.interest).toFixed(2)+"元");
				$("#going").next().next().next().next().next().text(parseFloat(msg.usedAmount).toFixed(2)+"元");
				//投资记录
				$("#goinglent").text(parseFloat(msg.lentBid).toFixed(2)+"元");
				$("#goinglent").next().text(parseFloat(msg.recoveryLoan).toFixed(2)+"元");
				$("#goinglent").next().next().text(parseFloat(msg.harvestedLoan).toFixed(2)+"元");
				$("#goinglent").next().next().next().text(parseFloat(msg.inCome).toFixed(2)+"元");
				$("#goinglent").next().next().next().next().text(parseFloat(msg.overPayment).toFixed(2)+"元");
				
				$("#totalMoney").text(parseFloat(msg.useMoney+msg.lentBid+msg.noRecharge-msg.payment).toFixed(2));
				$("#frozenMoney").text(parseFloat(msg.lentBid+msg.noTransfer).toFixed(2));
				$("#toWithdraw").text(parseFloat(msg.noTransfer).toFixed(2));
				$("#noRecharge").text(parseFloat(msg.noRecharge).toFixed(2));
				$("#toMoney").text(parseFloat(msg.toMoney).toFixed(2));
				$("#realMoney").text(parseFloat(msg.realMoney).toFixed(2));
				$("#dueRepay").text(parseFloat(msg.dueRepay).toFixed(2));
				$("#preRepayMoney").text(parseFloat(msg.preRepayMoney).toFixed(2));
				$("#totalLent").text(parseFloat(msg.totalLent).toFixed(2));
				$("#goingWithdraw").text(parseFloat(msg.noTransfer).toFixed(2));
			}
		});
	});