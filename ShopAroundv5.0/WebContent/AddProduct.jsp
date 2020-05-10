<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ include file="Head.jsp"%>
<script>
function AddProductFunc()
{
	var pname = document.AddProduct.pname.value;
	var qty = document.AddProduct.qty.value;
	var vqty = /^[0-9]*$/;
	var wt = document.AddProduct.wt.value;
	
	var prc = document.AddProduct.prc.value;
	
	
	var vprc=/^[+]?([1-9][0-9]*(?:[\.][0-9]*)?|0*\.0*[1-9][0-9]*)(?:[eE][+-][0-9]+)?$/;
	var prdes = document.AddProduct.prdes.value;
	
	if((pname == null || pname == "")||pname.length>20 || (qty == null || qty == "")||!qty.match(vqty)||(qty.length>5)||(prc == null || prc == "")||!prc.match(vprc)||prc.length>6||(prdes == null || prdes == "")||prdes.length>400||(wt == null || wt == "")||!wt.match(vprc)||wt.length>8)
		{
	if (pname == null || pname == "") {
		document.getElementById("spname").innerHTML = "Please enter Product name";
		document.getElementById("spname").style.color = "red";
		document.getElementById("spname").style.display = "block";
	}
	else if(pname.length>20)
	{
		document.getElementById("spname").innerHTML = "Maximum length exceeded!!";
		document.getElementById("spname").style.color = "red";
		document.getElementById("spname").style.display = "block";		
	}
	else
	{
		document.getElementById("spname").innerHTML = "";
	}
	if (qty == null || qty == "") {
		document.getElementById("sqty").innerHTML = "Please enter Quantity!!";
		document.getElementById("sqty").style.color = "red";
		document.getElementById("sqty").style.display = "block";
	} else if (!qty.match(vqty)) {
		document.getElementById("sqty").innerHTML = "Please Enter Correct Quantity";
		document.getElementById("sqty").style.color = "red";
		document.getElementById("sqty").style.display = "block";
	} 
	
	else if(qty.length>5)
	{	
	
		document.getElementById("sqty").innerHTML = "Maximum length exceeded!!";
		document.getElementById("sqty").style.color = "red";
		document.getElementById("sqty").style.display = "block";	
	}
	else {
		document.getElementById("sqty").innerHTML = "";
		document.getElementById("sqty").style.display = "none";
	}
	
	if (wt == null || wt == "") {
		document.getElementById("swt").innerHTML = "Please enter Weight!!";
		document.getElementById("swt").style.color = "red";
		document.getElementById("swt").style.display = "block";
	} 
	
	else if(!wt.match(vprc))
	{
		document.getElementById("swt").innerHTML = "Please Enter Valid Weight!!";
		document.getElementById("swt").style.color = "red";
		document.getElementById("swt").style.display = "block";
	}
	else if(wt.length>8)
	{
		document.getElementById("swt").innerHTML = "Maximum length exceeded!!";
		document.getElementById("swt").style.color = "red";
		document.getElementById("swt").style.display = "block";
	}
	else {
		document.getElementById("swt").innerHTML = "";
		document.getElementById("swt").style.display = "none";
	}
	
	if (prc == null || prc == "") {
		document.getElementById("sprc").innerHTML = "Please enter Price!!";
		document.getElementById("sprc").style.color = "red";
		document.getElementById("sprc").style.display = "block";
	} else if (!prc.match(vprc)) {
		document.getElementById("sprc").innerHTML = "Please Enter Correct Value";
		document.getElementById("sprc").style.color = "red";
		document.getElementById("sprc").style.display = "block";
	} 
	else if (prc.length>8) 
	{
				document.getElementById("sprc").innerHTML = "Maximum length exceeded!!";
				document.getElementById("sprc").style.color = "red";
				document.getElementById("sprc").style.display = "block";
	}
	else {
		document.getElementById("sprc").innerHTML = "";
		document.getElementById("sprc").style.display = "none";
	}
	if (prdes == null || prdes == "") {
		document.getElementById("sprdes").innerHTML = "Please enter Product Description!!";
		document.getElementById("sprdes").style.color = "red";
		document.getElementById("sprdes").style.display = "block";
	}
	else if(prdes.length>400)
	{
		document.getElementById("sprdes").innerHTML = "Maximum length exceeded!!";
		document.getElementById("sprdes").style.color = "red";
		document.getElementById("sprdes").style.display = "block";
		
	}
	else
		{
		document.getElementById("sprdes").innerHTML = "";
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
			<td><%@ include file="Productcat.jsp"%>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>

					<p style="color:red; font-size:20px">${message}</p>
					<table align="right">
					<form name="AddProduct" action="AddProduct" method="post" onsubmit="return AddProductFunc()">
					<tr><td></td><td></td></tr>
						<tr>
							<td></td>
							<td>
								<h2>
									<i>Add Products</i>
								</h2>
							</td>
						</tr>
						<tr>
							<td>Product Name<font color="red">*</font></td>
							<td><input type="text" name="pname"><span id="spname"></span></td>
						</tr>
						<tr>
							<td>Category Name<font color="red">*</font></td>
							<td><select name="catname" id="catname" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select catname  from category");
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
							</select>  </td>
						</tr>
						<tr>
							<td>Quantity<font color="red">*</font></td>
							<td><input type="text" name="qty"><span id="sqty"></span>
							</td>
						</tr>
						<tr>
							<td>Weight(kg)<font color="red">*</font></td>
							<td><input type="text" name="wt"><span id="swt"></span>
							</td>
						</tr>
						<tr>
							<td>Price(Rs.)<font color="red">*</font></td>
							<td><input type="text" name="prc"><span id="sprc"></span>
							</td>
						</tr>
						<tr>
							<td>Product Description<font color="red">*</font></td>
							<td><input type="text" name="prdes"><span
								id="sprdes"></span></td>
						</tr>
						<tr>
							<td></td>
							<td><br>
							<br> <input type="submit" value="SUBMIT"></td>
						</tr></form>
					</table>
				
			</td>
		</tr>
	</table>
	

	<%@ include file="AFooter.jsp"%>
</div>
</body>
</html>

