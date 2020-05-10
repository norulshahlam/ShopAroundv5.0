<%@ page import="com.shopping.jdbc.*"
language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body >
<div class="shell">
<%@ include file="Nevigation.jsp"%> 

<%
int cid=0,oid=0;

	double shipcost=0;
		if (session.getAttribute("uname")==null) 
		{
   				response.sendRedirect("Login.jsp"); 
   				//cid=1001;
		}
		else
		{
  				String uname=session.getAttribute("uname").toString();
      			cid=Integer.parseInt(session.getAttribute("cid").toString());
      			oid=Integer.parseInt(session.getAttribute("oid").toString());
		}
		response.setContentType("text/html");
		//PrintWriter pw= response.getWriter();
		
		
		String s="";
		
		//int oid=1;
		Buy by=new Buy();
		
		Transaction tc =new Transaction();
		
		int amt=tc.getOtotal(oid);
		
		String pkey=tc.getTransshop(oid,cid);
		Connection con=Connect.getConnect();
		s=by.getOrderDetails(oid);
		s+="</table>";
		try
		{
				
				PreparedStatement stmt2=con.prepareStatement("select shipcost from shipment where oid=?");
				stmt2.setInt(1,oid);
				//System.out.println("ADD TO THE DATABASE");
				 ResultSet rs2= stmt2.executeQuery();
				if(rs2.next())
				{
					shipcost=rs2.getDouble(1);
				}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
				con.close();
		}
		out.print(s);
		
		double totalcost=amt+shipcost;
		
		
 %>
 
 <form action="http://172.17.111.109:8989/PaymentGateway/home.jsp" method='post'>
 <br><br>
 <center><input type="submit" name="submit" value="Place Order" style="color: #000000; height: 51px; width: 134px"></center>
 <input type="hidden" name="to" value="100000000100">
 <input type="hidden" name="amt" value=<%=totalcost%>>
 <input type="hidden" name="pkey" value=<%=pkey %>>
 <input type="hidden" name="url" value="http://172.17.111.163:8989/ShopAroundv5.0/AfterTrans.jsp">
 </form>

 <form action="Cancelorder" method='post'>
 <center><input type="submit" name="submit" value="Cancel Order" style="color: #000000; height: 51px; width: 134px"></center>
 </form>
</div>

<%@ include file="Slide.jsp"%>
		<%@ include file="Textcol.jsp"%>
		<%@ include file="Footer.jsp"%>
</body>
</html>


