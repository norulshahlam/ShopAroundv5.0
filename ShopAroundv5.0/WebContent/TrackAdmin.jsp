<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@ include file="Head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TRACK</title>
</head>
<body>
<div class="shell">

 <%@ include file="Adminnevigation.jsp"%>
 <center>
<form name="TrackAdmin" action="TrackAdminStatus" method="post" >
<br>
<br>
<h3>Please change the ship status of the order</h3>
<br>
<br>
<p style="color:red; font-size:20px">${messaget}</p>
<table align="center">
<tr><td></td><td></td></tr>
<tr>
<td>
ORDER ID</td><td><select name="oid" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select oid  from shipment");
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%></option>
									<%
										}
											//con.close();
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										finally
										{
											con.close();
										}
									%>
							</select></td></tr>
<tr>
<td>
SHIPPING CURRENT STATUS</td><td><select name="status" style="width: 120px">

<option value="Shipped">Shipped</option>
<option value="Delivered">Delivered </option></select>


</td></tr>
</table>
<input type="submit" name="Trackshipment" value="CHANGE STATUS">
</center>
</form>

<%@ include file="AFooter.jsp"%>
</div>
</body>
</html>

