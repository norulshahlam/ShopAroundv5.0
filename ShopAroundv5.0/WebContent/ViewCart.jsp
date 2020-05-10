<%@page import="com.shopping.jdbc.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.shopping.bean.Cart"%>
   <%@page import="com.shopping.jdbc.Cartjdbc"%>
    <%@page import="com.shopping.jdbc.Connect"%>
   <%@page import="java.util.LinkedList"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<script>
function ConfirmFunc()
{
	var ans=Confirm("Your Order Will Be Confirmed After Checkout,Do You Want To Continue?");
	if(ans)
		{
			return false;	
		}
	
}
</script>
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
							        System.out.print("view cart"+cid);
							}
							//Connection con=Connect.getConnect();
							
					Cartjdbc aj = new Cartjdbc();
					LinkedList<Cart> list = new LinkedList<Cart>();
					list = aj.getCart(cid);
					Cart a[] = new Cart[list.size()];//(Cart) list.get(0);
					if(list.size()!=0)
					{
						for (int i = 0; i < list.size(); i++) {
							a[i] = (Cart) list.get(i);
						}
		
%>	
		<form action="Removeserv" action="post">
		<br/><center><h1>MY CART</h1></center><br/>
		<center><p style="color: red; font-size: 20px">${message}</p></center><br/>
			<center><table align="center" border="1">
			
						<tr>
							<th>PRODUCT</th>
							<th>PRODUCT ID</th>
							<th>NAME</th>
							<th>QUANTITY</th>
							<th>PRICE</th>
							<th>TOTAL PRICE</th>
							<th>REMOVE FROM CART</th>
						</tr>
						<% 
						
							for (int i = 0; i < list.size(); i++) {
							try
							{
							    
								 /*PreparedStatement ps = con.prepareStatement("select * from Productimg where pid=?");
								 ps.setInt(1,a[i].getPid());
    	                     	 ResultSet rs1 = ps.executeQuery();
    	                     	 if(rs1.next())*/
    	                     	 //{
    	                     	 out.println("<tr><td><img width='100' height='100' src=DisplayPhotoServlet?pid="+a[i].getPid()+"></td>");
    	                     	 //}
						%>
							<td><%=a[i].getPid()%></td>
							<td><%=a[i].getPname()%></td>
							<td><%=a[i].getCqty()%></td>
							<td><%=a[i].getCprice()%></td>
							<td><%=a[i].getCtotal()%></td>
							<td><a href="Removeserv?pid=<%=a[i].getPid()%>">remove</a></td>
							</tr>
							
																		
						<%  }
						 catch(Exception ex) 
    	       			 {
    	        			ex.printStackTrace();
    	       			 }
    	       			 //<input type="hidden" name="pid" value=""><input type="submit" name="remove" value="REMOVE"/>
						//<input type="button" name="cbtn" value="REMOVE"/>
					
						//<input type="submit" name="remove" value="REMOVE"/>
						//<form action='Removefromcart' method='post'> <input type='submit' name='submit' value='"+a[i].getPid()+"'></form>
							}
						%>
			</table></center>
						<%   
							 double amt=0;
							Connection con=Connect.getConnect();
							 PreparedStatement stmt=con.prepareStatement("select * from cart where cid=?");
							 stmt.setInt(1,cid);
	                     	 ResultSet rs1 = stmt.executeQuery();
	                     	 while(rs1.next())
	                     	 {
	                     		amt+=rs1.getDouble("ctotal");
	                     			 
	                     	 }
	                     	 out.print("<br/><center><h3>TOTAL COST :"+amt+"</h3></center>");
	                     	 System.out.print("view cart"+cid);
	                     	 con.close();
					%>
					<center><font style="color:red;">**SHIPPING COST MAY APPLY</font></center>
			</form>
			
			<br/>
			<br/>
			<form action="Checkoutserv" method="post">
<center><input type="submit" name="submit" value="CHECK OUT"></center>
</form>
			<% }
					else
					{
						out.print("<br/><br/>");
						out.print("<center><h1>Cart is Empty!!</h1></center>");
						out.print("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
						out.print("<br/><br/><br/><br/><br/><br/>");
					}
					//onsubmit="confirm('Are you Sure?')"
					
					
			%>
			
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>