<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.textarea{width: 510px;height: 100px;border:1px red soild}
</style>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="/resources/js/loanSign/addLoanSign.js" type="text/javascript"></script>

<script type="text/javascript">
	var $loanType;
	var $refundWay;
	var $month;
	var $loanUnit;
	var $riskAssess;
	$(function(){
	 	$loanType = $("#typeid").val();
	 	$refundWay = $("#refundWay").val();
	 	$month = $("#month").val();
	 	$loanUnit = $("#loanUnit").val();
	 	$riskAssess = $("#riskAssess").val();
	});
 	function onclickType(){
 		$("#typeid").find("option").eq($loanType-1).attr("selected",true);
 		$("#refundWay").find("option").eq($refundWay-1).attr("selected",true);
 		$("#month").find("option").eq($month-1).attr("selected",true);
 		$("#loanUnit").find("option[value='"+$loanUnit+"']").attr("selected",true);
 		$("#riskAssess").find("option").eq($riskAssess-1).attr("selected",true);
 	}
</script>


<div class="pageContent">
	<form method="post" action="/loanSign/saveOrUpdateLoansign" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
		<input type="text" style="display: none;" name="id" value="${loansign.id}"/>
			<p>
				<label> 借款人</label>
					<input type="text" class="required" name="BorrowersApply.name" value="${loansign.userbasicsinfo.name}" readonly="readonly"/>
					<input type="hidden"  name="BorrowersApply.id" value="${loansign.borrowersApply.id}" />
<%-- 					<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}"> --%>
<%-- 						<input type="hidden"  name="BorrowersApply.id" value="${loansign.borrowersApply.id}" /> --%>
<%-- 					</c:if> --%>
					<c:if test="${operNumber eq '1'}">
						<a class="btnLook" href="/baseLoanSign/borrowersbaseLists" width="520" lookupGroup="BorrowersApply">查找带回</a>
					</c:if>
					<c:if test="${loperNumber ne '3'&& loansign.loanstate eq '1'}">
						<a class="btnLook" href="/baseLoanSign/borrowersbaseLists" width="520" lookupGroup="BorrowersApply">查找带回</a>
					</c:if>
			</p>
			<p>
				<label>还款方式</label>
				<select name="refundWay" id="refundWay" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> onchange="onclickType()" </c:if>  <c:if test="${operNumber eq '3'}">  onchange="onclickType()" </c:if>  >
						<option value="1" <c:if test="${loansign.refundWay eq  '1'}">selected="selected"</c:if>>按月等额本息</option>
						<option value="2" <c:if test="${loansign.refundWay eq  '2'}">selected="selected"</c:if>>按月付息到期还本</option>
						<option value="3" <c:if test="${loansign.refundWay eq  '3'}">selected="selected"</c:if>>到期一次性还本息</option>
				</select>
			</p>
			<p>
				<label>本期借款额</label>
				<input type="text"  name="issueLoan" id="issueLoan" value="${loansign.issueLoan}"  class="required number"  min="100" maxlength="15"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true"</c:if>>元
			</p>
			<p>
				<label>最小借出单位</label>
				<select name="loanUnit" id="loanUnit" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  onchange="onclickType();" </c:if>  <c:if test="${operNumber eq '3'}">  onchange="onclickType();" </c:if>>
						<option value="50" <c:if test="${loansign.loanUnit eq  '50'}">selected="selected"</c:if>>50</option>
						<option value="100" <c:if test="${loansign.loanUnit eq  '100'}">selected="selected"</c:if>>100</option>
						<option value="200" <c:if test="${loansign.loanUnit eq  '200'}">selected="selected"</c:if>>200</option>
						<option value="300" <c:if test="${loansign.loanUnit eq  '300'}">selected="selected"</c:if>>300</option>
						<option value="500" <c:if test="${loansign.loanUnit eq  '500'}">selected="selected"</c:if>>500</option>
						<option value="1000" <c:if test="${loansign.loanUnit eq  '1000'}">selected="selected"</c:if>>1000</option>
				</select>
			</p>
			<p>
				<label>借款标号</label>
				<input name="loanNumber"  type="text" value="${loansignbasics.loanNumber }"  class="required"  minlength="1" maxlength="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
			<p>
				<label>还款期限</label>
				<select name="month" id="month"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  onchange="onclickType()" </c:if>  <c:if test="${operNumber eq '3'}"> onchange="onclickType()" </c:if> >
						<option value="1" <c:if test="${loansign.month eq  '1'}">selected="selected"</c:if>>1个月</option>
						<option value="2" <c:if test="${loansign.month eq  '2'}">selected="selected"</c:if>>2个月</option>
						<option value="3" <c:if test="${loansign.month eq  '3'}">selected="selected"</c:if>>3个月</option>
						<option value="4" <c:if test="${loansign.month eq  '4'}">selected="selected"</c:if>>4个月</option>
						<option value="5" <c:if test="${loansign.month eq  '5'}">selected="selected"</c:if>>5个月</option>
						<option value="6" <c:if test="${loansign.month eq  '6'}">selected="selected"</c:if>>6个月</option>
						<option value="7" <c:if test="${loansign.month eq  '7'}">selected="selected"</c:if>>7个月</option>
						<option value="8" <c:if test="${loansign.month eq  '8'}">selected="selected"</c:if>>8个月</option>
						<option value="9" <c:if test="${loansign.month eq  '9'}">selected="selected"</c:if>>9个月</option>
						<option value="10" <c:if test="${loansign.month eq  '10'}">selected="selected"</c:if>>10个月</option>
						<option value="11" <c:if test="${loansign.month eq  '11'}">selected="selected"</c:if>>11个月</option>
						<option value="12" <c:if test="${loansign.month eq  '12'}">selected="selected"</c:if>>12个月</option>
						<option value="13" <c:if test="${loansign.month eq  '13'}">selected="selected"</c:if>>13个月</option>
						<option value="14" <c:if test="${loansign.month eq  '14'}">selected="selected"</c:if>>14个月</option>
						<option value="15" <c:if test="${loansign.month eq  '15'}">selected="selected"</c:if>>15个月</option>
						<option value="16" <c:if test="${loansign.month eq  '16'}">selected="selected"</c:if>>16个月</option>
						<option value="17" <c:if test="${loansign.month eq  '17'}">selected="selected"</c:if>>17个月</option>
						<option value="18" <c:if test="${loansign.month eq  '18'}">selected="selected"</c:if>>18个月</option>
						<option value="19" <c:if test="${loansign.month eq  '19'}">selected="selected"</c:if>>19个月</option>
						<option value="20" <c:if test="${loansign.month eq  '20'}">selected="selected"</c:if>>20个月</option>
						<option value="21" <c:if test="${loansign.month eq  '21'}">selected="selected"</c:if>>21个月</option>
						<option value="22" <c:if test="${loansign.month eq  '22'}">selected="selected"</c:if>>22个月</option>
						<option value="23" <c:if test="${loansign.month eq  '23'}">selected="selected"</c:if>>23个月</option>
						<option value="24" <c:if test="${loansign.month eq  '24'}">selected="selected"</c:if>>24个月</option>
						<option value="25" <c:if test="${loansign.month eq  '25'}">selected="selected"</c:if>>25个月</option>
						<option value="26" <c:if test="${loansign.month eq  '26'}">selected="selected"</c:if>>26个月</option>
						<option value="27" <c:if test="${loansign.month eq  '27'}">selected="selected"</c:if>>27个月</option>
						<option value="28" <c:if test="${loansign.month eq  '28'}">selected="selected"</c:if>>28个月</option>
						<option value="29" <c:if test="${loansign.month eq  '29'}">selected="selected"</c:if>>29个月</option>
						<option value="30" <c:if test="${loansign.month eq  '30'}">selected="selected"</c:if>>30个月</option>
						<option value="31" <c:if test="${loansign.month eq  '31'}">selected="selected"</c:if>>31个月</option>
						<option value="32" <c:if test="${loansign.month eq  '32'}">selected="selected"</c:if>>32个月</option>
						<option value="33" <c:if test="${loansign.month eq  '33'}">selected="selected"</c:if>>33个月</option>
						<option value="34" <c:if test="${loansign.month eq  '34'}">selected="selected"</c:if>>34个月</option>
						<option value="35" <c:if test="${loansign.month eq  '35'}">selected="selected"</c:if>>35个月</option>
						<option value="36" <c:if test="${loansign.month eq  '36'}">selected="selected"</c:if>>36个月</option>
				</select>
			</p>
			<p>
				<label>借款标题</label>
				<input name="loanTitle"  type="text"  value="${loansignbasics.loanTitle}" class="required"  minlength="1" maxlength="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
			<p>
				<label>风险评估</label>
				<select name="riskAssess" id="riskAssess"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  onchange="onclickType()" </c:if>  <c:if test="${operNumber eq '3'}">  onchange="onclickType()" </c:if>>
						<option value="1" <c:if test="${loansignbasics.riskAssess eq  '1'}">selected="selected"</c:if>>低</option>
						<option value="2" <c:if test="${loansignbasics.riskAssess eq  '2'}">selected="selected"</c:if>>中</option>
						<option value="3" <c:if test="${loansignbasics.riskAssess eq  '3'}">selected="selected"</c:if>>高</option>
				</select>
			</p>
			<c:if test="${!empty loansign.rate}"> 
				<p>
					<label>年化利率</label>
					<input name="rate"  type="text" class="required number"  min="0" max="30" value='<fmt:formatNumber value="${loansign.rate*100 }" pattern="0"/>'  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if> />%
				</p>
				
			</c:if>
			<c:if test="${empty loansign.rate}"> 
				<p>
					<label>年化利率</label>
					<input name="rate"  type="text" class="required number"  min="0" max="30" value="${loansign.rate}"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if> />%
				</p>
			</c:if>
			<p>
				<label>是否显示</label>
				<input name="isShow" <c:if test="${loansign.isShow ne  '2'}">checked="checked"</c:if>  value="1" type="radio"/>显 示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="isShow" <c:if test="${loansign.isShow eq  '2'}">checked="checked"</c:if> value="2" type="radio"/>不显示
			</p>
			<c:if test="${!empty loansignbasics.reward}">
				<p>
					<label>平台奖励</label>
					<input name="reward"  type="text" class="required number"  min="0" max="30" value="<fmt:formatNumber value="${loansignbasics.reward*100}" pattern="0"/>"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if> />%
				</p>
			</c:if>
			<c:if test="${empty loansignbasics.reward}"> 
				<p>
					<label>平台奖励</label>
					<input name="reward"  type="text" class="required number"  min="0" max="30" value="${loansignbasics.reward}"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if>  <c:if test="${operNumber eq '3'}">   readonly="true" </c:if> />%
				</p>
			</c:if>
			<p>
				<label>推荐到首页</label>
				<input name="isRecommand" <c:if test="${loansign.isRecommand ne  '2'}">checked="checked"</c:if> value="1" type="radio"/>推 荐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="isRecommand"  <c:if test="${loansign.isRecommand eq  '2'}">checked="checked"</c:if> value="2" type="radio"/>不推荐
			</p>
<!-- 			<p> -->
<!-- 				<label>结束时间</label> -->
<%-- 				<input type="text" datefmt="yyyy-MM-dd" class="date required" name="endTime" value="${loansign.endTime}" readonly="readonly"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> disabled="true" </c:if> <c:if test="${operNumber eq '3'}">  disabled="true" </c:if> /> --%>
<!-- 			</p> -->
			<p>
				<label>担保方</label>
				<input name="assure" class="required" value="${loansignbasics.assure}" type="text"  maxlength="50"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if><c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
			<p>
				<label>普通会员最大份数</label>
				<input name="counterparts" id="counterparts"  class="required" value="${loansign.counterparts}" type="text"  maxlength="30" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if><c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
			<p>
				<label>反担保方式</label>
				<input name="unassureWay"  class="required" value="${loansignbasics.unassureWay}" type="text"  maxlength="30"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if> <c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
		
			<p>
				<label>VIP最大份数</label>
				<input name="vipCounterparts" id="vipCounterparts" class="required" value="${loansign.vipCounterparts}" type="text"  maxlength="30" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  readonly="true" </c:if> <c:if test="${operNumber eq '3'}">   readonly="true" </c:if>/>
			</p>
			<p>
				<label>借款标类型</label>
				<select id="typeid" name="type" style="width: 133px;" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}">  onchange="onclickType()" </c:if>  <c:if test="${operNumber eq '3'}">  onchange="onclickType()" </c:if>>
				<c:forEach items="${loanType}" var="type">
					<c:if test="${type.id==loan.loansignType.id}">
						<option value="${type.id}" selected="selected">${type.typename}</option>
					</c:if>
					<c:if test="${type.id!=loan.loansignType.id}">
						<option value="${type.id}">${type.typename}</option>
					</c:if>
				</c:forEach>
				</select>
<%-- 				<input name="loanCategory" value="1"  <c:if test="${loansignbasics.loanCategory ne  '2'}">checked="checked"</c:if> type="radio"/>信用标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="loanCategory"  <c:if test="${loansignbasics.loanCategory eq  '2'}">checked="checked"</c:if> value="2" type="radio"/>抵押标 --%>
			</p>
<!-- 			<p> -->
<!-- 				<label>借款管理费</label> -->
<%-- 				<input name="mgtMoney" value="${loansignbasics.mgtMoney }" class="number" type="text"  readonly="readonly" maxlength="20" />元 --%>
<!-- 			</p> -->
			<p  style="clear: both;height: 100px;width: 100%">
				<label>借款方商业概述</label>
				<textarea class="textarea" name="overview" rows="20" cols="20"  <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> readonly="true" </c:if> <c:if test="${operNumber eq '3'}">  readonly="true" </c:if>>${loansignbasics.overview}</textarea>
			</p>
			<p style="clear: both;height: 100px;width: 100%">
				<label>借款方借款用途</label>
				<textarea class="textarea" name="behoof"  rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> readonly="true" </c:if> <c:if test="${operNumber eq '3'}">  readonly="true" </c:if>>${loansignbasics.behoof}</textarea>
			</p>
			<p style="clear: both;height: 100px;width: 100%">
				<label>借款方还款来源</label>
				<textarea class="textarea"  name="loanOrigin" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> readonly="true" </c:if> <c:if test="${operNumber eq '3'}">  readonly="true" </c:if>>${loansignbasics.loanOrigin}</textarea>
			</p>
			<p  style="clear: both;height: 100px;width: 100%">
				<label>风险控制措施</label>
				<textarea class="textarea"  name="riskCtrlWay" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> readonly="true" </c:if> <c:if test="${operNumber eq '3'}">  readonly="true" </c:if>>${loansignbasics.riskCtrlWay}</textarea>
			</p>
			<p  style="clear: both;height: 100px;width: 100%">
				<label>借款人感言</label>
				<textarea class="textarea" name="speech" rows="20" cols="20" <c:if test="${operNumber eq '2'&&loansign.loanstate ne 1}"> readonly="true" </c:if> <c:if test="${operNumber eq '3'}">  readonly="true" </c:if>>${loansignbasics.speech}</textarea>
			</p>
			</div>
		<div class="formBar">
			<ul>
				<c:if test="${operNumber ne '3'}">
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				</c:if>
				<li>
					<div class="button"><div class="buttonContent"><button type="reset" class="close"><c:if test="${operNumber ne '3'}">取消</c:if><c:if test="${operNumber eq '3'}">关闭</c:if></button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
