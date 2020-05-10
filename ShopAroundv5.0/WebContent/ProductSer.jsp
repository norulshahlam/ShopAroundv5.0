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

<br/><br/>
<br/>	
	<center><h1>PRODUCT DETAIL</h1></center>
	<br/><br/><br/>
	
	<%	
	String pname1=request.getParameter("pname");

	//ProductSearchjdbc psj=new ProductSearchjdbc();
	//productsearch(pid);

	Connection con= Connect.getConnect();
	try
	{
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM Product WHERE Pname=?");
		stmt.setString(1,pname1);
		ResultSet rs = stmt.executeQuery();

		//out.println("<html><body>");
		//out.println("<table border=1 width=50% height=50");
		//out.println("<tr><th>Category_ID</th><th>Product_ID</th><th>Name</th><th>Price</th><th>Weight</th><th>Quantity</th><th>Description</th></tr>");

		if(rs.next())
		{

			//int code= rs.getInt(1);
			int cid = rs.getInt(1);
			int Pid= rs.getInt(2); 
			String pname=rs.getString(3);
			//String remarks=rs.getString(5);
			int price=rs.getInt(4);

			int wt=rs.getInt(5);
			int qty=rs.getInt(6);
			String pdes=rs.getString(7);


			System.out.println(Pid);


			System.out.println("correct");
			out.println("<table border=1 width=50% height=50 align='center'>");
			out.println("<tr><th>Category_ID</th><th>Product_ID</th><th>Name</th><th>Price</th><th>Weight</th><th>Quantity</th><th>Description</th></tr>");
			out.println("<tr><td>"+cid+"</td><td>" +Pid + "</td><td>" +pname + "</td><td>" + price + "</td><td>" +wt+ "</td><td>"+qty+"</td><td>"+pdes+"</td></tr>"); 
			out.println("</table><br><br><br>");
			out.println("<center><a href='ProductSearch.jsp'>Back to Search</a></center>");
		}
		else
		{
			String msg="Not Able to Search Product";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("ProductSearch.jsp").forward(request, response);
		}
		//con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       finally
       {
       	con.close();
       }
	%><br/><br/><br/>
	
<%@ include file="AFooter.jsp"%>
</div>
	
</body>
</html>