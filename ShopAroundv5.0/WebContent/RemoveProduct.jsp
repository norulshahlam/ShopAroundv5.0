<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp" %>
</head>
<body>
<div class="shell">
<%@ include file="Adminnevigation.jsp"%> 

<table>
<tr>
	<td>
		<%@ include file="Productcat.jsp"%>
	</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>

	<form name="removeproduct" action="RemoveProduct" method="post" onsubmit="return RemoveProductFunc()">
		<center><p style="color:red; font-size:20px">${message}</p></center>
		<table align="right">
		<tr><td></td><td></td></tr>
		<tr>
			<td>
			</td>
			<td>
				<h2><i>Remove Products</i></h2><br>
			</td>
		</tr>
		
		<tr>
			<td>Product Name
			</td>
			<td><select name="pname" style="width:120px">
			<%
				Connection con= Connect.getConnect();
				PreparedStatement pstmt; 
			try {
				pstmt = con.prepareStatement("select pname  from product");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>

				<%}
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
			</select><br><br>
			</td>
		</tr>
		

		<tr>
			<td>
			</td>
			<td><input type="submit" value="Remove" style="height: 46px; width: 112px">
			</td>
		</tr>
	</table></form>
	
</td>
</tr>
</table>



<%@ include file="AFooter.jsp"%>
</div>
</body>
</html>

