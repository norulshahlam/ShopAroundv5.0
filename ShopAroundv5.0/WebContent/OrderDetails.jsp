<%@ page import="com.shopping.jdbc.OrderDetail" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="Head.jsp" %>
</head>
<body>
<div class="shell">
	<%@ include file="Nevigation.jsp"%>
<BR/><BR/><BR/>

<center><h2>ORDER DETAIL</h2></center>
<BR/><BR/>
<form action="MyAccount" method="post" style="height: 71px; ">
<center><p style="color: red; font-size: 20px">${message}</p>
<table align="Center">
<tr>
							<td></td>
							<td></td><td></td><td></td><td></td>
						</tr>
<tr>
<td><input type="submit" name="submit" value="Personalinfo"></td>
<td><input type="submit" name="submit" value="Address"></td>
<td><input type="submit" name="submit" value="ChangePassword"></td>
<td><input type="submit" name="submit" value="Order Details"></td>
<td><input type="submit" name="submit" value="Tracking"></td>
<td><input type="submit" name="submit" value="Add Review"></td>
</tr>
</table></center><BR/><BR/><BR/>
</form>
<% String s=" ";
			
			
			
		     
		      
			   // HttpSession session=request.getSession();
				int cid=Integer.parseInt(session.getAttribute("cid").toString());
				
		     	OrderDetail ord=new OrderDetail();
		     	s+= ord.getOrderDetail(cid);
		       
		      		   
		    	  	    	  
				     out.print(s);   %>
				     
				     
				     
				     <BR/>
				     <BR/><BR/>
				     <BR/><BR/><BR/>
		                 <%@ include file="Textcol.jsp"%>
						<%@ include file="Footer.jsp"%>
						 
		  </div>               

</body>


</html>