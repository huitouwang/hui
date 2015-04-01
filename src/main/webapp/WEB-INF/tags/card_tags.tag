<%@ tag language="java" pageEncoding="UTF-8"%>

<%@attribute name="cardnum" required="true" rtexprvalue="true"  type="java.lang.String" description="要屏蔽的身份证号码" %>
<%@attribute name="substitution" required="false" rtexprvalue="true" type="java.lang.String" description="屏蔽部分显示的字符。默认为*" %>

<%
	if(null==substitution){
	    substitution="***********";
	}
	
	if(null!=cardnum&&(cardnum.length()==15||cardnum.length()==18)){
	    cardnum=cardnum.substring(0,2)+substitution+cardnum.substring(14);	    
	}
	
	request.setAttribute("cardnum", cardnum);
%>

<label>
	${requestScope.cardnum}
</label>

