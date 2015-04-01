<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="LeftMenu curvyCorners_3">
 <c:forEach items="${appDeputys }" var="d">
 <c:if test="${d.topic.id == topicId }">
	 <ul class="listNavUL">
	    <li><a href="${d.url }" <c:if test="${d.id == deputyId }">class="LeftMenuLink" </c:if> >${d.name }</a></li>
	  </ul>
  </c:if>
</c:forEach>
</div>
