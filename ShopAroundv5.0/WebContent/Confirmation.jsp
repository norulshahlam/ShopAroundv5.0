<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.shopping.bean.Cart"%>
   <%@page import="com.shopping.jdbc.Cartjdbc"%>
   <%@page import="java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%>
<form action="">
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
					Cartjdbc aj = new Cartjdbc();
					LinkedList<Cart> list = new LinkedList<Cart>();
					list = aj.getCart(cid);
					Cart a[] = new Cart[list.size()];//(Cart) list.get(0);
								
					for (int i = 0; i < list.size(); i++) {
						a[i] = (Cart) list.get(i);
					}
		
%>	
<b><u>ORDER DETAILS</u></b><br/><br/>
			<table align="center" border="1">
						<tr>
							<th>PRODUCT</th>
							<th>PRODUCT ID</th>
							<th>NAME</th>
							<th>QUANTITY</th>
							<th>PRICE</th>
							<th>TOTAL PRICE</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
							<tr>
							<td></td>
							<td><%=a[i].getPid()%></td>
							<td><%=a[i].getPname()%></td>
							<td><%=a[i].getCqty()%></td>
							<td><%=a[i].getCprice()%></td>
							<td><%=a[i].getCtotal()%></td>
							</tr>
													
						<%
							}
						%>
			</table>
			<br/>
			<b><u>SHIPPING ADDRESS</u></b><br/>
			<br/>
			<table>
				
			</table>

<input type="submit" name="submit" value="Confirm">
</form>
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>