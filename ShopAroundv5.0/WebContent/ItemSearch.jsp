<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp" %>
</head>
<body>
<div class="shell">
<%@ include file="Adminnevigation.jsp"%> 


<center>

<table>
<tr>
	<td>
		
	</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>
	<center><p style="color: red; font-size: 20px">${message}</p></center>
	<form name="itemSearch" action="ItemSer.jsp" method="post" onsubmit= "return validateform()">
		<table align="right">
		<tr>
							<td></td>
							<td></td>
						</tr>
		<tr>
			<td>
			</td>
			<td>
				<h2><i>Search Item</i></h2><br>
			</td>
		</tr>
		
		<tr>
			<td>Search By Item Name<br>
			</td>
			<td><select name="itemname" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select itemname from item");
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
										finally
										{
											con.close();
										}
									%>
							</select><br><br>
			</td>
		</tr>
		

		<tr>
			<td>
			</td>
			<td><center><input type="submit" value="Search" style="height: 46px; width: 112px">
			</center></td>
		</tr>
	</table></form>
	
</td>
</tr>
</table></center>



<%@ include file="AFooter.jsp"%>
</div>
</body>
</html>

