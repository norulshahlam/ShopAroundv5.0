<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
   <%@page import="com.shopping.bean.Customer"%>
   <%@page import="com.shopping.jdbc.Customerjdbc"%>
   <%@page import="java.util.LinkedList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>
<body>
	<div class="shell">

		<%@ include file="Nevigation.jsp"%>


	<script>
	function ReviewFunc()
	{
		var review = document.Review.review.value;
		
		if (review == null || review == "") {
			document.getElementById("sreview").innerHTML = "Please enter Review!!";
			document.getElementById("sreview").style.color = "red";
			document.getElementById("sreview").style.display = "block";
			return false;
		}
		else if(review.length>200)
		 {
			document.getElementById("sreview").innerHTML = "Maximum 200 characters!!";
			document.getElementById("sreview").style.color = "red";
			document.getElementById("sreview").style.display = "block";
			return false;
		}
		
	}
	</script>
	
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
<form name="Review" action="reviewServ"  method="post" onsubmit="return ReviewFunc()">
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
					%>	<center><p style="color:red; font-size:20px">${message}</p></center>
						<table align="center">
						<tr><td></td><td></td></tr>
						<tr>
							<td>PRODUCT NAME</td>
							<td><select name="pname" style="width: 120px">
									<%
									Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
										//	Connection con = Connect.getConnect();
											pstmt = con.prepareStatement("select pname  from product");
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
									<%
										}
											
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										finally{
										con.close();
										}
									%>
							</select><span id="scatname"></span>  </td>
						</tr>
						<tr>
							<td>REVIEW<font color="red">*</font>:</td>
							<td><i><input type="text" name="review">  Maximum 200 Characters</i><span id="sreview"></span></td>
						</tr>
						</table>
						<center>
					<input type="submit" name="submit" value="ADD REVIEW">
					</center>
</form>
	
	<%@ include file="Textcol.jsp"%>
			<%@ include file="Footer.jsp"%>
			</div></body></html>