<%@page import="com.shopping.jdbc.Transaction"%>
<%@page import="com.shopping.jdbc.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp"%>
</head>
<body>
<div class="shell">
	<%@ include file="Nevigation.jsp"%>
	<%
		/*int cid = 0, oid = 0;
		if (session.getAttribute("uname") == null) {
			response.sendRedirect("Login.jsp");
			//cid=1001;
		} else {
			String uname = session.getAttribute("uname").toString();
			cid = Integer.parseInt(session.getAttribute("cid").toString());
			oid = Integer.parseInt(session.getAttribute("oid").toString());
		}*/
		//double amt=1000;
		double amt = Double.parseDouble(request.getParameter("amt"));
		String pkey =request.getParameter("pkey");
		String transid = request.getParameter("transid");
		String status = request.getParameter("status");
		Transaction tr = new Transaction();
		int i = tr.updatetrans(amt, transid, status, pkey);
		if (i != 0) {
			out.print("<br/><br/><br/><br/><center><h1>YOUR ORDER HAS BEEN PLACED</h1></center>");
			out.print("<br/><center><h1>YOUR ORDER WILL BE DELIVERED TO YOU IN 6 to 7 BUSINESS DAYS</h1></center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
		} else {
			out.print("<br/><br/><br/><br/><center><h1>SORRY ERROR HAS OCCURRED IN PLACING ORDER</h1></center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
			//out.print("<br/><center><h1>YOUR OR</h1></center>");
		}
	%>
	<h1></h1>
	</div>
	<%@ include file="Slide.jsp"%>
	<%@ include file="Textcol.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>