<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>" />
<title>p2p网贷款平台</title>
</head>
<body>
	<form id="form_page" action="" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="1" />
	</form>
	<!--top-->
	<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
	<!--End top-->
	<!--Content-->
	<div class="Content">
		<div class="w960px mapString">
			<span>您当前位置：</span><a href="<%=basePath%>">p2p网</a>&gt;${deputy.topic.name }&gt;${deputy.name }
		</div>
		<div class="w960px">
			<jsp:include page="/WEB-INF/views/visitor/communal/left.jsp" />

			<div class="projectRightBox">
				<c:set var="n" value="0"/>
				<!--TxList Cont-->
				<c:forEach items="${articles }" var="art">
					<div class="pjRightCont">
						<span data-position="titlebox"
						<c:if test="${n%2 == 0 }">class="Green"</c:if>
						<c:if test="${n%2 != 0 }">class="Orange"</c:if>
						 >${art.title }</span>
						<!--此处标题最多只能输入30个汉字-->
						<div class="pjcontBox">
							${art.context }
						</div>
					</div>
					<c:set var="n" value="${n+1 }"/>
				</c:forEach>
				<!--End TxList Cont-->

				<div class="pages">
					<a style="margin-right: 10px;" href="javascript:;" onclick="fun_page(1);">首 页</a><a
						 style="margin-right: 10px;" href="javascript:;" onclick="fun_page(${page.pageNum - 1});">上一页</a>
					<c:if test="${page.totalPage > 5 }">
					<c:forEach varStatus="pageNo" begin="1" end="4">
							<a href="javascript:;" onclick="fun_page(${pageNo.index});">
							<font <c:if test="${page.pageNum == pageNo.index }">color="orange"</c:if>>${pageNo.index}</font></a>
						</c:forEach>
						....
						<c:forEach varStatus="pageNo" begin="${page.totalPage }" end="${page.totalPage }">
							<a href="javascript:;" onclick="fun_page(${pageNo.index});"
							<c:if test="${page.pageNum == pageNo.index }">class="cur"</c:if>	>${pageNo.index}</a>
						</c:forEach>
					</c:if>
					<c:if test="${page.totalPage < 6 }">
						<c:forEach varStatus="pageNo" begin="1" end="${page.totalPage }">
							<a href="javascript:;" onclick="fun_page(${pageNo.index});">
							<font <c:if test="${page.pageNum == pageNo.index }">color="orange"</c:if>>${pageNo.index}</font></a>
						</c:forEach>
					</c:if>
					<a style="margin-right: 10px;margin-left: 10px;" href="javascript:;" onclick="fun_page(${page.pageNum + 1});">下一页</a><a
						href="javascript:;" onclick="fun_page(${page.totalPage});">尾页</a>
				</div>
			</div>

		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/visitor/communal/footer.jsp" />
	<script>
		function fun_page(currentpage) {
			if (currentpage < 1) {
				currentpage = 1;
			}
			if (currentpage > "${page.totalPage}") {
				currentpage = "${page.totalPage}";
			}
			$("#pageNum").val(currentpage);
			var url = $(".LeftMenuLink").attr("href");
// 			alert("url:"+url);
			$("#form_page").attr("action", url);
			$("#form_page").submit();
		}
	</script>
	<!--End footer-->
	<script type="text/javascript" src="<%=basePath %>resources/js/autolist.js"></script>
</body>
</html>
