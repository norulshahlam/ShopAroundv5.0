<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="com.shopping.jdbc.Productjdbc"%>
<%@page import="com.shopping.bean.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Single Product View</title>
</head>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp" %>
<form action="addtocart" method="post"><center>
<table>
<tr>
<td>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));

%>

<% 
				System.out.print(pid);
				response.setContentType("text/html;charset=UTF-8");
 			// Connection con = Connect.getConnect();
    	        try {
    	               out.print("<input type='hidden' name='pid' value="+pid+">");
    	              
    	              /* PreparedStatement ps = con.prepareStatement("select * from Productimg where pid=?");
    	               ps.setInt(1, pid);
    	               ResultSet rs = ps.executeQuery();
    	               
    	               if ( rs.next()) {*/
    	             
    	                    out.println("<img width='200' height='200' src='DisplayPhotoServlet?pid=" +pid + "'></img> <p/>");
    	            //   }

    	              // con.close();
    	              }
    	             catch(Exception ex) {

    	             }
    	             finally{
    	             	//con.close();
    	             }
    	             
    %>
</td>
<td>
	
	<%
					
			Productjdbc aj = new Productjdbc();
			LinkedList<Product> list = new LinkedList<Product>();
			list = aj.getProduct(pid);
			Product a = (Product) list.get(0);
			
			String pname = a.getPname();
			double pprice =a.getPprice();
			double pweight = a.getPweight();
			String pdes=a.getPdes();
			int pqty=a.getPqty();
			String review=aj.searchprodReview(pid);	
			String qty;
			if(pqty<=0)
			{
				qty="<font color='red'>OUT OF STOCK</font>";
			}
			else
			{
				qty = "<font color='green'>In Stock</font>";
			}
			
	 %>
	 <br/><br/><center><h1>PRODUCT DETAILS</h1></center><br/><br/>
	 <center><p style="color:red; font-size:20px">${message}</p></center>
	 <table align="center" >
	 <tr><td></td><td></td></tr>
						<tr>
						<td>NAME :</td>
						<td><%=pname%></td>
						</tr>
						<tr>
						<td>PRICE :</td>
						<td><%=pprice%></td>
						</tr>
						<tr>
						<td>WEIGHT :</td>
						<td><%=pweight%></td>
						</tr>
						<tr>
						<td>DESCRIPTION :</td>
						<td><%=pdes%></td>
						</tr>
						<tr>
						<td>STOCK :</td>
						<td><%=qty%></td>
						</tr>
						<tr>
						<td>QUANTITY :</td>
						<td><select name=qty id="qty" style="width:60px">
  								<option value="1">1</option>
 								 <option value="2">2</option>
  								<option value="3">3</option>
  								<option value="4">4</option>
  								<option value="5">5</option>
  								<option value="6">6</option>
  								<option value="7">7</option>
  								<option value="8">8</option>
  								<option value="9">9</option>
  								<option value="10">10</option>
							</select>
						</td>
						</tr>
						
						</table>
						
						<br/>
						<%
							if(pqty<=0)
							{
								%>
									<br/>
									<input type="submit" name="submit" value="Add to Cart" disabled="disabled">
								<% 
							}
							else
							{
								%>
								<br/>
									<input type="submit" name="submit" value="Add to Cart">
								<%
							}
						%>
						
						</td>
</tr>
</table></center>
<br/><br/><h1>Review :</h1><br>
						<table style="font-size: 20px">
						<%=review%>
						</table>
</form>
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>