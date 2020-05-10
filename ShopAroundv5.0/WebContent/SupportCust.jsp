<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp" %>
</head>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%> 


<center><br><br><h1>SUPPORT</h1><br><br>

<form action="AskQuery.jsp">

						
							
	<%
		if (session.getAttribute("uname")==null) {
		
   			response.sendRedirect("Login.jsp"); 
		}
	 %>
<br/>

<p style="color: red; font-size: 20px">${message}</p>				
<br/><br/>
<input type="submit" value="Ask Query" style=" height: 46px; width: 112px">
</form>
</center><br><br><br>
<center><br><br><br>
<form action="ViewAnswer.jsp">
<input type="submit" value="View Answer" style=" height: 46px; width: 112px">
</form>
</center><br><br>

<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>

