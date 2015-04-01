<%@ tag language="java" pageEncoding="UTF-8"%>

<%@attribute name="phonenum" required="true" rtexprvalue="true"  type="java.lang.String" description="要屏蔽的电话号码" %>
<%@attribute name="substitution" required="false" rtexprvalue="true" type="java.lang.String" description="屏蔽部分显示的字符。默认为*" %>

<%
	if(null==substitution){
	    substitution="*****";
	}
	
	if(null!=phonenum&&phonenum.length()==11){
	    phonenum=phonenum.substring(0,3)+substitution+phonenum.substring(8,11);	    
	}
	
	request.setAttribute("phonenum", phonenum);
%>

<label>
	${requestScope.phonenum}
</label>

