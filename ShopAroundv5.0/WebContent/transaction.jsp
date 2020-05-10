<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.shopping.jdbc.Transaction"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ include file="Head.jsp"%>
<body>
<div class="shell">
<%@ include file="Adminnevigation.jsp"%> 
<% 
	Transaction tr=new Transaction();
	String str=tr.getTransactionDetails();
	out.print(str);
%>
<br/><br/><br/><br/><br/>

	<%@ include file="AFooter.jsp"%>

</div>

</body>
</html>