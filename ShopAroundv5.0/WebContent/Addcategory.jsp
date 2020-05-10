<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ include file="Head.jsp"%>
<script>
	function AddCategoryFunc() {

		var catname = document.AddCategory.cname.value;
		var vcatname = /^[A-z ]+$/;

		if ((catname == null || catname == "") || !catname.match(vcatname)) {

			if (catname == null || catname == "") {
				document.getElementById("scatname").innerHTML = "Please enter Category Name";
				document.getElementById("scatname").style.color = "red";
				document.getElementById("scatname").style.display = "block";
			} else if (!catname.match(vcatname)) {
				document.getElementById("scatname").innerHTML = "Please Enter only Albhabets!!";
				document.getElementById("scatname").style.color = "red";
				document.getElementById("scatname").style.display = "block";
			} else {
				document.getElementById("scatname").innerHTML = "";
			}
			return false;
		}
	}
</script>
<div class="shell">

<body>

	<%@ include file="Adminnevigation.jsp"%>



	<table>
		<tr>
			<td><%@ include file="Catcat.jsp"%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>
				<form name="AddCategory" action="AddCategory" method="post"
					onsubmit="return AddCategoryFunc()">
					<p style="color: red; font-size: 20px">${message}</p>
					
					<table align="right">
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<h2>
									<i>Add Category</i>
								</h2>
							</td>
						</tr>
						<tr>
							<td>Item Name</td>
							<td><select name="itemid" style="width: 120px">

									<%
										Connection con = Connect.getConnect();

										PreparedStatement pstmt;

										try {
											pstmt = con.prepareStatement("select itemname,itemid from item");

											ResultSet rs = pstmt.executeQuery();

											while (rs.next()) {
									%>

									<option value="<%=rs.getInt(2)%>"><%=rs.getString(1)%></option>

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
							</select></td>
						</tr>
						<tr>
							<td>Category Name</td>
							<td><input type="text" name="cname"><span
								id="scatname"></span></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="submit" value="SUBMIT"></td>
						</tr>
					</table>


				</form>
			</td>
		</tr>
	</table>



	
	<%@ include file="AFooter.jsp"%>
</div>

</body>
</html>

