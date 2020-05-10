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
<%
		int cid=0;
		if (session.getAttribute("uname")==null) {
		
   			response.sendRedirect("Login.jsp"); 
		}
		else
		 {
  			String uname=session.getAttribute("uname").toString();
      	    cid=Integer.parseInt(session.getAttribute("cid").toString());
      		//out.print("WELCOME ");
		 }
	 %>
<center><br><br><br><br><br>

<form name="ViewAnswer" action="ViewAnswercus.jsp" method="post" onsubmit="return ViewAnswerFunc()">
Customer ID:<input type="text" name="cid" value="<%=cid%>" disabled="disabled"> <span id="scid"></span><br><br><br>

<input type="submit" value="Submit" style=" height: 46px; width: 112px">
</form>
</center><br><br><br><br><br><br><br>
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>

</body>
</html>

