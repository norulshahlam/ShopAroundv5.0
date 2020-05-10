<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp" %>
</head>
<body>
<div class="shell">
<%@ include file="Adminnevigation.jsp"%> 
<br/><br/><br/>
<center>
<h1>ITEM DETAILS</h1>
</center>
<br/><br/><br/>
	<%
String itemname1=request.getParameter("itemname");
Connection con=Connect.getConnect();
try
{

PreparedStatement stmt = con.prepareStatement("SELECT * FROM Item WHERE Itemname=?");
stmt.setString(1, itemname1);
ResultSet rs = stmt.executeQuery();
if(rs.next()) {
	
	int Itemid = rs.getInt(1);
	String itemname=rs.getString(2);
	out.println("<table border=1 width=50% height=50 align='center'>"); 
	out.println("<tr><th>Item_ID</th><th>Item_Name</th></tr>"); 
	out.println("<tr><th>"+Itemid+"</th><th>" +itemname + "</th></tr>");
	out.println("</table><br><br><br>");
	out.println("<center><a href='ItemSearch.jsp'>Back to Search</a></center>");
	} 
else { 
	 out.println("<center><a href='ItemSearch.jsp'>Back to Search</a></center>");
	 String msg="Not Able to Search Item....";
	request.setAttribute("message", msg);
	request.getRequestDispatcher("ItemSearch.jsp").forward(request,response);
	//request.getRequestDispatcher("ItemSearch.jsp").include(request,response);
	} 
	} catch(Exception e) 
	{ System.out.println(e);
	} 
	finally
	{con.close();
	}%>

<%@ include file="AFooter.jsp"%>
	</div>
</body>

</html>