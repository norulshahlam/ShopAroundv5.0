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
<script type="text/javascript">
/*function RemoveCategoryFunc()
{
	
	var cid =document.removecategory.cid.value;
			
		if((cid==null || cid=="") ||isNaN(cid))
		{
			if (cid==null || cid=="") 
			{
	       		document.getElementById("scid").innerHTML="Enter Product ID";
       			document.getElementById("scid").style.color = "red";
       			document.getElementById("scid").style.display = "block"; 
       		}	
       		else if(isNaN(cid))
			{
				document.getElementById("scid").innerHTML="Enter Numeric Value ONLY";
  				document.getElementById("scid").style.color = "red";
       			document.getElementById("scid").style.display = "block";
			}
			else
			{
				document.getElementById("scid").innerHTML="";
  			}
  			return false;
  		}
  		else
  		return true;  	
}*/
</script>	



<table>

<tr>
	<td>
		<%@ include file="Catcat.jsp"%>
	</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td></td>
	<td>
	
	<form name="removecategory" action="RemoveCategory" method="post" onsubmit= "return RemoveCategoryFunc()">
	<center><p style="color:red; font-size:12px">${message}</p></center>
		<table align="right">
		<tr>
		<td>
		</td>		
		<td>  </td></tr>
		
				<tr>
			<td>
			</td>
			<td>
				<h2><i>Remove Category</i></h2><br>
			</td>
		</tr>
		
		<tr>
			<td>Category Name
			</td>
			<td>
			<select name="catname" style="width:120px">
			
			<%
				Connection con= Connect.getConnect();
				
				PreparedStatement pstmt;
			
			try {
				pstmt = con.prepareStatement("select catname  from category");
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					%>
					
					<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>

				<%}
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				con.close();
			}

			
			
			%>
			</select>
			
			
			
			
			<!--  <input type="text" name="cid" style="height: 31px; width: 183px"><span id="scid">--></span><br><br>
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

