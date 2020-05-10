<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp"%>
</head>
<body>
<div class="shell">
	<%@ include file="Adminnevigation.jsp"%>
	<script type="text/javascript">
		function UpdateProductFunc() {

			var qty = document.updateproduct.qty.value;
			var prc = document.updateproduct.prc.value;
			var vqty = /^[0-9]*$/;
			var vprc=/^[+]?([1-9][0-9]*(?:[\.][0-9]*)?|0*\.0*[1-9][0-9]*)(?:[eE][+-][0-9]+)?$/;
			
			if ((qty == null || qty == "") || !qty.match(vqty||qty.length>10)
					|| (prc == null || prc == "") || !prc.match(vprc||prc.length>8)) {

				if (qty == null || qty == "") {
					document.getElementById("sqty").innerHTML = "Please enter Quantity!!";
					document.getElementById("sqty").style.color = "red";
					document.getElementById("sqty").style.display = "block";
				} else if (!qty.match(vqty)) {
					document.getElementById("sqty").innerHTML = "Please Enter Correct Quantity";
					document.getElementById("sqty").style.color = "red";
					document.getElementById("sqty").style.display = "block";
				}
				else if(qty.length>10)
				{
					document.getElementById("sqty").innerHTML = "Maximum length exceeded!!";
					document.getElementById("sqty").style.color = "red";
					document.getElementById("sqty").style.display = "block";
				}
				 else {
					document.getElementById("sqty").innerHTML = "";
					document.getElementById("sqty").style.display = "none";
				}
				if (prc == null || prc == "") {
					document.getElementById("sprc").innerHTML = "Please enter Price";
					document.getElementById("sprc").style.color = "red";
					document.getElementById("sprc").style.display = "block";
				} else if (!prc.match(vprc)) {
					document.getElementById("sprc").innerHTML = "Please Enter Correct Price!!";
					document.getElementById("sprc").style.color = "red";
					document.getElementById("sprc").style.display = "block";
				}
				 else if (prc.length>8) {
					document.getElementById("sprc").innerHTML = "Maximum length exceeded!!";
					document.getElementById("sprc").style.color = "red";
					document.getElementById("sprc").style.display = "block";
				} 
				else {
					document.getElementById("sprc").innerHTML = "";
					document.getElementById("sprc").style.display = "none";
				}
				return false;
			} else
				return true;
		}
	</script>



	<table>
		<tr>
			<td><%@ include file="Productcat.jsp"%>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>

				<form name="updateproduct" action="UpdateProduct" method="post"
					onsubmit="return UpdateProductFunc()">
					<center><p style="color: red; font-size: 12px">${message}</p></center>
					<table align="right">
						<tr>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td></td>
							<td>
								<h2>
									<i>Update Products</i>
								</h2> <br>
							</td>
						</tr>

						<tr>
							<td>Product Name</td>
							<td><select name="pname" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select pname  from product");
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
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
							</select></td>
						</tr>
						<tr>
							<td>Quantity<font color="red">*</font></td>
							<td><input type="text" name="qty"
								style="height: 31px; width: 183px"><span id="sqty"></span><br>
								<br></td>
						</tr>
						<tr>
							<td>Price<font color="red">*</font></td>
							<td><input type="text" name="prc"
								style="height: 31px; width: 183px"><span id="sprc"></span><br>
								<br></td>
						</tr>


						<tr>
							<td></td>
							<td><input type="submit" value="Update"
								style="height: 46px; width: 112px"></td>
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

