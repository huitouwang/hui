<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="email" required="true" rtexprvalue="true"  type="java.lang.String" description="要屏蔽的邮箱地址" %>
<%@attribute name="substitution" required="false" rtexprvalue="true" type="java.lang.String" description="屏蔽部分显示的字符。默认为*" %>

<%
	if(null==substitution){
	    substitution="*****";
	}
	
	if(null!=email&&email.lastIndexOf("@")>=1){
	    email=email.substring(0, 1)+substitution+email.substring(email.lastIndexOf("@"));	    
	}
	
	request.setAttribute("email", email);
%>

<label>
	${requestScope.email}
</label>
