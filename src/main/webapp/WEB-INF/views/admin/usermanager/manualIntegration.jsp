<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script src="resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="resources/js/usermanager/customer.js"></script> -->
<style type="text/css">
	.body{width:670px;background-color: #FFFFFF; border: 0;}
	.inp{
		height: 18px;
		font:10px arial,tahoma,helvetica,sans-serif;
		border: 1px solid #7EADD9
	}
	table{
		border:1px solid #7EADD9; 
		font:11px arial,tahoma,verdana,helvetica; 
		line-height:25px;
		border-collapse:collapse;
	}
	th{
		padding-top: 3px;
		padding-bottom: 3px;
		background-color:#ffffff;
	}
	
	td{
		border:1px solid #7EADD9; 
		background-color:#ffffff;
		text-align:left;
		padding-left:10px;
		padding-top: 3px;
		padding-bottom: 3px;
	}
</style>

<form method="post" action="<%=basePath %>userinfo/saveOrUpdateman"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this,dialogAjaxDone)" id="manform">
	<div class="pageContent">
		<div class="pageFormContent" layoutH="50">
		<div class="body">
	<table cellpadding="0" cellspacing="0">
		
			<tr>
				<th width="6%" style="text-align: center;">序号</th>
				<th width="22%" style="text-align: center;">项目名称</th>
				<th width="11%" style="text-align: center;">积分规则</th>
				<th width="19%" style="text-align: center;">实际积分</th>
				<th width="42%" style="text-align: center;">备注说明</th>
			</tr>
			<tr>
			
				<td>1</td>
				<td>本人身份证（正面）</td>
				<td>2-17</td>
				<td><input type="checkbox" name="ck1" id="ck1" value="2"/>2分 <input type="checkbox" name="ck2" value="15"/>15分</td>
				<td>通过实名认证加计15分</td>
			</tr>
			<tr>
				<td>2</td>
				<td>本人身份证（背面）</td>
				<td>2</td>
				<td><input type="checkbox"/ name="ck3" value="2">2分 </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>3</td>
				<td>家人身份证（正面）</td>
				<td>1-11</td>
				<td><input type="checkbox" name="ck4" value="1"/>1分 <input type="checkbox" name="ck5" value="10"/>10分</td>
				<td>需配偶（单身需直系亲属）</td>
			</tr>
			<tr>
				<td>4</td>
				<td>家人身份证（背面）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck6" value="1"/>1分 </td>
				<td>通过实名认证加计10分</td>
			</tr>
		    <tr>
				<td>5</td>
				<td>注册邮箱</td>
				<td>10</td>
				<td> <input type="checkbox" name="ck7" value="10"/>10分</td>
				<td>依据注册时登录用的邮箱</td>
			</tr>
			<tr>
				<td>6</td>
				<td>户口本（户主页+本人页）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck8" value="2" />2分 </td>
				<td>与本人页同时上传</td>
			</tr>
			<tr>
				<td>7</td>
				<td>户口本（家人页）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck9" value="1"/>1分 </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>8</td>
				<td>工作证明（劳动合同证明）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck10" value="2" />2分 </td>
				<td>真实在职三个月以上，提供电话地址验证</td>
			</tr>
			<tr>
				<td>9</td>
				<td>银行流水（最近三个月）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck11" value="2" />2分 </td>
				<td>银行柜台打印盖章，扫描原件上传</td>
				
			</tr>
			
			<tr>
				<td>10</td>
				<td>手机话单（最近两个月）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck12" value="2"/>2分 </td>
				<td>本人实名手机通话清单，使用年限</td>
			</tr>
			<tr>
				<td>11</td>
				<td>住址证明（水电交费单）</td>
				<td>1-3</td>
				<td><input type="checkbox" name="ck13" value="2" />2分 <input type="checkbox" name="ck14" value="1"/>1分  </td>
				<td>本人2分，非本人1分</td>
			</tr>
			<tr>
				<td>12</td>
				<td>住址证明（房产证明）</td>
				<td>1-3</td>
				<td><input type="checkbox" name="ck15" value="2" />2分 <input type="checkbox" name="ck16" value="1" />1分  </td>
				<td>本人2分，非本人1分</td>
			</tr>
			<tr>
				<td>13</td>
				<td>住址证明（租赁合同）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck17" value="2"/>2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>14</td>
				<td>联系电话（固定电话）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck18" value="2" />2分   </td>
				<td>本人或户口本家人实名电话通话清单</td>
			</tr>
			<tr>
				<td colspan="5" align="center">以上部分是初审前必备资料<input type="text" id="ckVaule" name="ckVaule" value="${manualintegral.ckVaule}"/><input type="text" id="uid" name="userbasicsinfo.id" value="${uid}"/></td>
			</tr>
			
			
			<tr>
				<td>15</td>
				<td>结婚证</td>
				<td>2</td>
				<td><input type="checkbox" name="ck19" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>16</td>
				<td>行驶证（正本）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck20" value="1" />1分   </td>
				<td>只有正本</td>
			</tr>
			<tr>
				<td>17</td>
				<td>行驶证（正本副页）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck21" value="2" />2分   </td>
				<td>正本和副页齐全</td>
			</tr>
			<tr>
				<td>18</td>
				<td>行驶证（10万-20万）</td>
				<td>3</td>
				<td><input type="checkbox" name="ck22" value="3"/>3分   </td>
				<td>10-20万车辆正本和副页齐全</td>
			</tr>
			<tr>
				<td>19</td>
				<td>行驶证（30万-50万）</td>
				<td>4</td>
				<td><input type="checkbox" name="ck23" value="4" />4分   </td>
				<td>30-50万车辆正本和副页齐全</td>
			</tr>
			<tr>
				<td>20</td>
				<td>行驶证（50万）</td>
				<td>5</td>
				<td><input type="checkbox" name="ck24" value="5"/>5分   </td>
				<td>50万车辆正本和副页齐全</td>
			</tr>
			<tr>
				<td>21</td>
				<td>驾驶证（正本）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck25" value="1"/>1分   </td>
				<td>只有正本</td>
			</tr>
			<tr>
				<td>22</td>
				<td>驾驶证（正本副页）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck26" value="2"/>2分   </td>
				<td>正本和副页齐全</td>
			</tr>
			
			<tr>
				<td>23</td>
				<td>毕业证（高中及以下）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck27" value="1" />1分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>24</td>
				<td>毕业证（大专）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck28" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>25</td>
				<td>毕业证（本科）</td>
				<td>3</td>
				<td><input type="checkbox" name="ck29" value="3"/>3分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>26</td>
				<td>毕业证（硕士）</td>
				<td>4</td>
				<td><input type="checkbox" name="ck30" value="4" />4分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>27</td>
				<td>生活照（本人普通）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck31" value="1"/>1分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>28</td>
				<td>生活照（公检法）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck32" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>29</td>
				<td>营业执照（注册资金3万元）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck33" value="1" / >1分   </td>
				<td>法人（个人）实名</td>
			</tr>
			<tr>
				<td>30</td>
				<td>营业执照（注册资金5-10万元）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck34" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>31</td>
				<td>营业执照（注册资金10-50万元）</td>
				<td>3</td>
				<td><input type="checkbox" name="ck35" value="3" />3分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>32</td>
				<td>营业执照（注册资金50-100万元）</td>
				<td>4</td>
				<td><input type="checkbox" name="ck36" value="4"/>4分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>33</td>
				<td>营业执照（注册资金100-500万元）</td>
				<td>5</td>
				<td><input type="checkbox" name="ck37" value="5"/>5分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>34</td>
				<td>营业执照（注册资金500-800万元）</td>
				<td>6</td>
				<td><input type="checkbox" name="ck38" value="6"/>6分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>35</td>
				<td>营业执照（注册资金800-1000万元）</td>
				<td>7</td>
				<td><input type="checkbox" name="ck39" value="7"/>7分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>36</td>
				<td>营业执照（注册资金1000-2000万元）</td>
				<td>8</td>
				<td><input type="checkbox" name="ck40" value="8"/>8分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>37</td>
				<td>营业执照（注册资金2000-3000万元）</td>
				<td>9</td>
				<td><input type="checkbox" name="ck41" value="9" />9分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>38</td>
				<td>营业执照（注册资金3000-5000万元）</td>
				<td>10</td>
				<td><input type="checkbox" name="ck42" value="10" />10分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr >
				<td colspan="5" align="center">资料上传</td>
			</tr>
			
			
			<tr>
				<td>39</td>
				<td>组织代码</td>
				<td>2</td>
				<td><input type="checkbox" name="ck43" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>40</td>
				<td>国税</td>
				<td>2</td>
				<td><input type="checkbox" name="ck44" value="2" />2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>41</td>
				<td>地税</td>
				<td>2</td>
				<td><input type="checkbox" name="ck45" value="2"/>2分   </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>42</td>
				<td>银行信用证明</td>
				<td>2</td>
				<td><input type="checkbox" name="ck46" value="2"/>2分   </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>43</td>
				<td>房产证</td>
				<td>1-5</td>
				<td><input type="text" class="inp" size="6" id="houseCardPoints" maxlength="1" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" name="houseCardPoints" value="${manualintegral.houseCardPoints}" />  </td>
				<td>本地本人5;本地非本人2；外地本人4;外地非本人1分</td>
			</tr>
			
			
			<tr>
				<td>44</td>
				<td>银行流水</td>
				<td>2-N</td>
				<td><input type="text" class="inp" size="6" id="bankWaterPoints" maxlength="3" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" name="bankWaterPoints"  value="${manualintegral.bankWaterPoints}"/> </td>
				<td>近三月第一次2分;第二次或以上每上传一次不重复流水积2分</td>
			</tr>
			<tr>
				<td>45</td>
				<td>社保</td>
				<td>1-5</td>
				<td><input type="text" class="inp" size="6" id="socialPoints" maxlength="1" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" name="socialPoints" value="${manualintegral.socialPoints }"/>  </td>
				<td>&nbsp;</td>
			</tr>
				<tr>
				<td>46</td>
				<td>信用卡账单</td>
				<td>1-10</td>
				<td><input type="text" class="inp" size="6" id="creditCardPoints"maxlength="2" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" name="creditCardPoints" value="${manualintegral.creditCardPoints }"/>  </td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>47</td>
				<td>个人信息账单（煤气）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck47" value="1" />1分</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>48</td>
				<td>个人信息账单（有线电视）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck48" value="1" />1分</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>49</td>
				<td>个人信息账单（电费）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck49" value="1"/>1分</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>50</td>
				<td>个人信息账单（水费）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck50" value="1"/>1分</td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>51</td>
				<td>个人信息账单（其他）</td>
				<td>1</td>
				<td><input type="checkbox" name="ck51" value="1"/>1分</td>
				<td>&nbsp;</td>
			</tr>
			
			
			<tr>
				<td>52</td>
				<td>销售合同及发票</td>
				<td>1-5</td>
				<td><input type="text" class="inp" size="6" id="salesContractInvoicePoints" name="salesContractInvoicePoints" value="${manualintegral.salesContractInvoicePoints}" maxlength="1" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;"/></td>
				<td><span id="cuowuxx" style="color: red;"></span></td>
			</tr>
			
			<tr>
				<td>53</td>
				<td>借款承诺书（视频认证）</td>
				<td>2</td>
				<td><input type="checkbox" name="ck52" value="2"/>2分</td>
				<td>签字区域不可用电脑打印，并盖上红色手指膜，然后扫描上传积分</td>
			</tr>
			
			
			<tr>
				<td align="center" colspan="4">合计：&nbsp;&nbsp;<span id="money" style="color: red;"><b>${amounts}</b></span>分</td>
				<td>
<!-- 				<input type="button" id="save" value="保存" style="width: 75px;height26px; margin: 3px 3px 3px 3px;"/>    <input type="button" value="取消" id="close1" style="width: 75px;height26px; margin: 3px 3px 3px 3px;"/> -->
				</td>
			</tr>
		</table>
</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="saveman">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(function($){
		
		 $("#saveman").click(function(){
			 var _ckVaule="";
   		 	 $(":checkbox").each(function(){
 				if($(this).is(":checked")){
 					_ckVaule+=$(this).attr("name")+"-"+$(this).val()+","
 				}
 			});	
   		 	 $("#ckVaule").val(_ckVaule);
    		var _houseCardPoints =document.getElementById("houseCardPoints").value;
    		var _socialPoints=document.getElementById("socialPoints").value;
    		var _creditCardPoints=document.getElementById("creditCardPoints").value;
    		var _salesContractInvoicePoints=document.getElementById("salesContractInvoicePoints").value;
			if(_houseCardPoints>5){
				$("#cuowuxx").html("房产证积分录入不对(1-5)");
			}else if(_socialPoints>5){
				$("#cuowuxx").html("社保积分录入不对(1-5)");
			}else if(_creditCardPoints>10){
				$("#cuowuxx").html("信用卡账单积分录入不对(1-10)");
			}else if(_salesContractInvoicePoints>5){
				$("#cuowuxx").html("销售合同及发票积分录入不对(1-5)");
			}else{
					$("#cuowuxx").html("");
					$("#manform").submit();
				}
		 });
		 
		  var va= document.getElementById("ckVaule").value;
          if(va!=null&&va!=""){
        	  var strs= new Array();
        	  var strstt=new Array();
            	strs=va.split(",");
        	  for (i=0;i<strs.length-1;i++)    
        	    {    
        	        strstt=strs[i].split("-");
        	        $("input[name='"+strstt[0]+"']").attr("checked", true);             	        
        	    } 
              }
          
	});
</script>