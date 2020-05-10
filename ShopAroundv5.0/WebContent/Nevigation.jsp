<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>

<!-- Header -->
  <div id="header">
 
    <h1 id="logo"><a href="#">shoparound</a></h1>
    <!-- Cart -->
    <%
      	
     	if (session.getAttribute("uname")!=null)
		 {
			Connection con=Connect.getConnect();
      		int cid=Integer.parseInt(session.getAttribute("cid").toString());
      		
      		PreparedStatement pstmt1;
      		int qty=0;
      		pstmt1 = con.prepareStatement("SELECT * from cart where cid=?");
			pstmt1.setInt(1, cid);
			ResultSet rs1=pstmt1.executeQuery();
			while(rs1.next())
			{
				qty+=rs1.getInt("cqty");
			}
			session.setAttribute("qty",qty);
			 con.close();
		 }
       %>
        <div id="cart"> <a href="ViewCart.jsp" class="cart-link">Your Shopping Cart</a>
      <font  size="4" color="red" style="background-color: #FFFFFF"> <%
       if(session.getAttribute("uname")!=null)
       {
    	    out.print(session.getAttribute("qty"));
       }
       %>
        </font> 
       
      <div class="cl"></div>
      <span> <strong><%
     	if (session.getAttribute("uname")==null) {
		
   			out.print("WELCOME");
		}
		else
		 {
  			String uname=session.getAttribute("uname").toString();
      		int cid=Integer.parseInt(session.getAttribute("cid").toString());
      		out.print("WELCOME " +uname+"  ");
      		out.print("<a href='Logout' class='logout'>Logout</a>");
		 }
		
       %></strong></span> &nbsp;&nbsp; <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="Home.jsp">Home</a></li>      
        <li><a href="Myaccount.jsp">My Account</a></li>        
        <li><a href="SupportCust.jsp">Support</a></li>
         <li><a href="Contactus.jsp">Contact</a></li>
        <!--  <li><a href="Logout">Logout</a></li>-->
      </ul>
    </div>
    </div>
   
   