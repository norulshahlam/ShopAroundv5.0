<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>
<body>
	<div class="shell">

		<%@ include file="Nevigation.jsp"%>

 

<script type="text/javascript">
function TrackUserFunc()
{
	var oid =document.TrackUser.oid.value;
	var void1=/^[0-9]*$/;
			
		if((oid==null || oid=="") ||!oid.match(void1))
		{
			if (oid==null || oid=="") 
			{
	       		document.getElementById("soid").innerHTML="Enter Order ID";
       			document.getElementById("soid").style.color = "red";
       			document.getElementById("soid").style.display = "block"; 
       		}	
       		else if(!oid.match(void1))
			{
				document.getElementById("soid").innerHTML="Enter Correct Order Id!!";
  				document.getElementById("soid").style.color = "red";
       			document.getElementById("soid").style.display = "block";
			}
			else
			{
				document.getElementById("soid").innerHTML="";
  			}
  			return false;
  		}
  		else
  		return true;  	
}
</script>	



<%
		if (session.getAttribute("uname")==null) {
		
   			response.sendRedirect("Login.jsp"); 
		}
		
	 %>
<center>
<BR>
<BR>
<BR>
<B><font size=4><I>Track your status</I></font></B>
<BR>
<form action="MyAccount" method="post" style="height: 71px; ">
<center><p style="color: red; font-size: 20px">${message}</p></center><br/>
<table align="Center">
<tr>
							<td></td>
							<td></td><td></td><td></td><td></td>
						</tr>
<tr>
<td><input type="submit" name="submit" value="Personalinfo"></td>
<td><input type="submit" name="submit" value="Address"></td>
<td><input type="submit" name="submit" value="ChangePassword"></td>
<td><input type="submit" name="submit" value="Order Details"></td>
<td><input type="submit" name="submit" value="Tracking"></td>
<td><input type="submit" name="submit" value="Add Review"></td>
</tr>
</table><BR/>
</form>
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
	
						%>
<form name="TrackUser"action="TrackUser" method="post" onsubmit="return TrackUserFunc()">
ORDER ID <font color="red">*</font>&nbsp;<select name="oid" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select oid from shipment where cid=?");
											pstmt.setInt(1,cid);
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%></option>
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
							</select>  <br><br>

<input type="submit" name="Trackshipment" value="View Status">
</form>
		<br/><br/>
		<h2>${s}</h2>
		<br/><br/>
		
</center>


<%@ include file="Slide.jsp"%>
		<%@ include file="Textcol.jsp"%>
		<%@ include file="Footer.jsp"%>
		</div>
</body>
</html>