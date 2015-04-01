<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>P2P网贷平台-会员中心</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/vipcenter.css" />
<link rel="stylesheet"
	href="../resources/css/validationEngine.jquery.css" type="text/css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<script type="text/javascript" src="../resources/js/global.js"></script>
	<script type="text/javascript" src="../resources/js/recharge.js"></script>
	<script src="/resources/js/jquery.validationEngine.js"
		type="text/javascript"></script>
	<script src="/resources/js/jquery.validationEngine-zh_CN.js"
		type="text/javascript"></script>
	<!--Content-->
	<div class="Content">
		<div class="w1000px">
			<!--vipContent-->
			<div class="vipContentBox">
				<jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />


				<!--vipRight-->
				<div class="vipRightBox">
					<div class="vipHeadMenuBox">
						<ul>
							<li><a href="javascript:void(0);" class="vipHeadLink">我要借款</a></li>
						</ul>
					</div>
					<!--vipContBox-->
					<div class="vipContBox">
						<div class="vipContTitleBox">
							<h1 class="vipContTitle">
								<span><img src="../resources/images/vipseversicon.png" /></span>您已经是借款人，可以向P2P网贷平台申请借款。
							</h1>
						</div>

						<div class="upDataStep curvyCorners_5">
							<a class="stepLink">申请表单</a> <a href="../borrow/my-apply-result?type=${curType}">申请结果</a>
						</div>

						<fieldset class="imgfieldset">
							<legend>我的相册</legend>
							<ul>
								<c:if test="${!empty files }">
									<c:forEach items="${files }" var="b_img">
										<li><img src="${b_img.filePath}" width="159" height="134" /></li>
									</c:forEach>
								</c:if>
							</ul>
						</fieldset>

						<form action="borrow/uploadFile" method="post"
							enctype="multipart/form-data" id="form-data-sqdk">

							<input type="hidden" name="fileType" value="申请贷款" /> <input
								type="hidden" id="baseId" name="borrowersbase.id"
								value="${borrower.id}" />

							<input type="hidden" id="type" name="type" value="${curType}" />

							<fieldset class="fileUpfieldset">
								<legend>上传图片</legend>
								<span class="vipfileBox"> <input type="text"
									class="vipfileTx" /> <input type="file" name="file"
									class="vipfile validate[required,funcCall[money_format]]"
									onchange="$(this).siblings('.vipfileTx').val($(this).val());" />
									<span>选择</span>
								</span> <input type="submit" value="提交"
									class="vipfileUpDataBnt curvyCorners_3" />
								<p class="fileGeshi">请上传【jpg,gif,bmp,png】等图片格式的文件</p>
							</fieldset>
						</form>



						<table cellpadding="0" cellspacing="0" border="0"
							class="creditData">
							<tr>
								<td>您正在申请 ${enum_borrower_type[curType]}，上传以下资料可以提高您的审核通过率:
								</td>
							</tr>
							<tr>
								<c:if test="${curType==1}">
									<td>
										1、二代身份证正、反面各一张(姓名和身份证号清晰可见)<br/>
							            2、婚姻证明(包括配偶身份证)或未婚证明<br/>
							           	3、 户口簿<br/>
							            4、个人信用报告<br/>
							            5、加盖单位公章的劳动合同或工作证明<br/>
							            6、连续近6个月工资卡银行流水<br/>
							            7、其他有价资产及证明
							       </td>
								</c:if>
								<c:if test="${curType==2}">
									<td>
										1、二代身份证正、反面各一张(姓名和身份证号清晰可见)<br/>
							            2、户口簿<br/>
							           	3、 组织机构代码证(副本)<br/>
							            4、税务登记证(副本)<br/>
							            5、公司章程<br/>
							            6、银行对账单<br/>
							            7、最近6个月公司经营相关<br/>
							            8、所有公司和个人账户(需有户名、账号以及银行业务公章)<br/>
							            9、房屋所有权证、国有土地使用证<br/>
							            10、抵押物所有权人身份证正、反面<br/>
							            11、公司营业执照(副本)<br/>
							            12、购房合同、购房发票<br/>
							            13、备用房居所证明(本人房屋、他人房屋或租赁房屋等)<br/>
							            13、个人信用报告<br/>
							            14、其他有价资产及证明
							            
							       </td>
								</c:if>
								<c:if test="${curType==3}">
									<td>
										1、二代身份证正、反面各一张(姓名和身份证号清晰可见)<br/>
							            2、婚姻证明(包括配偶身份证)或未婚证明<br/>
							           	3、 户口簿<br/>
							            4、财产证明(复印件)：本人机动车行驶证、房产证、沪深A股B股股东卡、证券公司交易流水单、金融资产(如存款、基金、理财、股票、债券、股权、保险等)<br/>
							            5、信用文件：本人保险认购单、水电费、有线电视费、燃气费、保险费、物业费等本人账单，本人三个月内信用卡对账单，个人信用报告<br/>
							            6、证照资料：企业营业执照或个体工商执照、税务登记证、银行开户许可证、公司章程<br/>
							            7、经营资料：企业场地租赁协议及90天内的租金发票和水电等物业单据(附房东联系方式)、公司近3个月的营业税纳税凭证、财务报表(上年度及近期)、最近一次的验资报告或工商局出具并加盖公章的股权证明、近6个月银行流水、上年度以及本年度上下游合同和发票、库存管理清单、本次借款用途证明(如合同、发票)<br/>
							            8、企业有权人或有权机构同意提供担保的有关证明
							       </td>
								</c:if>
								<c:if test="${curType==4}">
									<td>
										1、二代身份证正、反面各一张(姓名和身份证号清晰可见)<br/>
							            2、借款金额不得超过在P2P网贷平台上待收本息总额的70%
							       </td>
								</c:if>
							</tr>
						</table>

						<form action="borrow/submit-apply" method="post" id="form-data-kssq">

							<table cellpadding="0" cellspacing="0" border="0"
								class="creditData">
								<tbody>
									<input type="hidden" id="type" name="type" value="${curType}" />
									<input type="hidden" name="borrowersbase.id" value="${borrower.id }" />
									<tr>
										<th>申请金额：</th>
										<td><input type="text" name="money"
											class="credit validate[required,custom[integerNullZero],max[200000]]"
											value="" /></td>
									</tr>
								</tbody>
							</table>

							<div class="tableSetBntBox">
								<input type="submit" value="提交申请" />
							</div>

						</form>

					</div>
					<!--End vipContBox-->
				</div>
				<!--End vipRight-->
			</div>
			<!--End vipcontent-->

		</div>
	</div>
	<!--End vipContent-->
	<!--End vipRight-->
	</div>
	<!--End vipcontent-->
	</div>
	</div>
	<!--End vipContent-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<script>
		$(function() {
			$("#form-data-sqdk").validationEngine({});
			$("#form-data-kssq").validationEngine({});
		})

		function money_format(o, a, c, b) {

			var FileName = o.val();

			var extension = FileName.substring(FileName.lastIndexOf(".") + 1,
					FileName.length);// 文件扩展名
			extension = extension.toLowerCase();
			if (FileName == null || FileName == "") {
				return "请选择您要上传的文件";
			}
			if (extension != "jpg" && extension != "png" && extension != "gif"
					&& extension != "bmp") {// 不安全的扩张名
				return "请选择图片上传";
			}

		}
	</script>
</body>
</html>
