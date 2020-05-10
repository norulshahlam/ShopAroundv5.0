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
	
	<form action="MyAccount" method="post" style="height: 71px; ">
	
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
	<form action=ChangeAddress.jsp>
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
								list = aj.getAddress(cid);
								Customer a = (Customer) list.get(0);
								String address = a.getAddress();
								String street = a.getStreet();
								String city = a.getCity();
								String state = a.getState();
								String country = a.getCountry();
								int zip = a.getPincode();
						%>	

				<table align="center">
						<tr>
						<td>ADDRESS :</td>
						<td><%=address%></td>
						</tr>
						<tr>
						<td>STREET :</td>
						<td><%=street%></td>
						</tr>
						<tr>
						<td>CITY :</td>
						<td><%=city%></td>
						</tr>
						<tr>
						<td>STATE :</td>
						<td><%=state%></td>
						</tr>
						<tr>
						<td>COUNTRY :</td>
						<td><%=country%></td>
						</tr>
						<tr>
						<td>ZIP :</td>
						<td><%=zip%></td>
						</tr>
						</table>
						</hr>
					<center>
					
					<input type="submit" name="submit" value="CHANGE ADDRESS">
					</center>
					
</form>
	
	<%@ include file="Textcol.jsp"%>
			<%@ include file="Footer.jsp"%>
			</div>
			</body>
			</html>
			