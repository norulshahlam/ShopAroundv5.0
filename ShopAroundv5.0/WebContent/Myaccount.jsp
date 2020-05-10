
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.shopping.bean.Customer"%>
<%@page import="com.shopping.jdbc.Customerjdbc"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>
<body>
	<div class="shell">

		<%@ include file="Nevigation.jsp"%>


		<br />
		<center>
			<h1 style="font-size: 50px">
				<strong>My Account</strong>
			</h1>
		</center>
		<br /> <br />

		<form action="MyAccount" method="post" style="height: 71px;">
			<%
				if (session.getAttribute("uname") == null) {

					response.sendRedirect("Login.jsp");
				}
				/*else
				 {
					String uname=session.getAttribute("uname").toString();
					int cid=Integer.parseInt(session.getAttribute("cid").toString());
					out.print("WELCOME ");
				 }*/
			%>
			<center><p style="color: red; font-size: 20px">${message}</p>
			<table align="Center">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Personalinfo"></td>
					<td><input type="submit" name="submit" value="Address"></td>
					<td><input type="submit" name="submit" value="ChangePassword"></td>
					<td><input type="submit" name="submit" value="Order Details"></td>
					<td><input type="submit" name="submit" value="Tracking"></td>
					<td><input type="submit" name="submit" value="Add Review"></td>
				</tr>
			</table></center>
		</form>
		<%@ include file="Slide.jsp"%>
		<%@ include file="Textcol.jsp"%>
		<%@ include file="Footer.jsp"%>
	</div>

</body>
</html>