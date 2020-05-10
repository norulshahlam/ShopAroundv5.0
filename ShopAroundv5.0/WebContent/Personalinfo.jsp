<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.shopping.bean.Customer"%>
   <%@page import="com.shopping.jdbc.Customerjdbc"%>
   <%@page import="java.util.LinkedList"%>
    

	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
	
	<%@ include file="Nevigation.jsp"%>
	
	<br/>
	<center><h1 style="font-size:50px"><strong>My Account</strong></h1></center>
	<br/>
	<br/>
	
	<form action="MyAccount" method="post" style="height: 71px; "><center>
<table align="Center">

<tr>
<td><input type="submit" name="submit" value="Personalinfo"></td>
<td><input type="submit" name="submit" value="Address"></td>
<td><input type="submit" name="submit" value="ChangePassword"></td>
<td><input type="submit" name="submit" value="Order Details"></td>
<td><input type="submit" name="submit" value="Tracking"></td>
<td><input type="submit" name="submit" value="Add Review"></td>
</tr>
</table>	                    			
</form>
<form>
                       <%
	                        int cid=0;	
							if (session.getAttribute("uname")==null) {
   									response.sendRedirect("Login.jsp"); 
							}
							else
							 {
  									String uname=session.getAttribute("uname").toString();
      								cid=Integer.parseInt(session.getAttribute("cid").toString());
							 }
	
								Customerjdbc aj = new Customerjdbc();
								LinkedList<Customer> list = new LinkedList<Customer>();
								list = aj.getCustomer(cid);
								Customer a = (Customer) list.get(0);
								String name = a.getName();
								String emailId = a.getEmail();
								String gender = a.getGender();
								long mobno = a.getCont_no();
						%>	
						<table align="center">
						<tr>
						<td>NAME:</td>
						<td><%=name%></td>
						</tr>
						<tr>
						<td>EMAIL ID:</td>
						<td><%=emailId%></td>
						</tr>
						<tr>
						<td>CONTACT NO:</td>
						<td><%=mobno%></td>
						</tr>
						<tr>
						<td>GENDER :</td>
						<td><%=gender%></td>
						</tr>
						</table></center>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						
						
</form>
		<%@ include file="Slide.jsp"%>
		<%@ include file="Textcol.jsp"%>
			<%@ include file="Footer.jsp"%>
			
			</div></body></html>