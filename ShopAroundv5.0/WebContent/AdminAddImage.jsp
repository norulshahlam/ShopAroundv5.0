<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<script>
function AdminAddImageFunc()
{
		var pid =document.AdminAddImage.pid.value;
		var cid=document.AdminAddImage.cid.value;
		var title =document.AdminAddImage.title.value;
		
		var photo=document.AdminAddImage.photo.value;
		
		if((pid==null || pid=="" )||isNaN(pid)||(cid==null || cid=="" ) ||isNaN(cid)||(title==null || title=="" )|| (photo==null || photo=="" )  )
		{
		if (pid==null || pid=="" ) 
			
			{
       			document.getElementById("spid").innerHTML="Please enter Product ID";
       			document.getElementById("spid").style.color = "red";
       			document.getElementById("spid").style.display = "block"; 
       		}	
       		else if(isNaN(pid) )
       		{
       			document.getElementById("spid").innerHTML="Please Enter Numeric Value Only!!";
       			document.getElementById("spid").style.color = "red";
       			document.getElementById("spid").style.display = "block"; 
       		}
   			else 
   			{
         	     document.getElementById("spid").innerHTML = ""; 
         	     document.getElementById("spid").style.display = "none";
        	}
        	
        	if (cid==null || cid=="" ) 
			{
       			document.getElementById("scid").innerHTML="Please enter Category ID";
       			document.getElementById("scid").style.color = "red";
       			document.getElementById("scid").style.display = "block"; 
       		}	
       		else if(isNaN(cid) )
       		{
       			document.getElementById("scid").innerHTML="Please Enter Numeric Value Only!!";
       			document.getElementById("scid").style.color = "red";
       			document.getElementById("scid").style.display = "block"; 
       		}
   			else 
   			{
         	     document.getElementById("scid").innerHTML = ""; 
         	     document.getElementById("scid").style.display = "none";
        	}
        	
        	if (title==null || title=="" ) 
			{
       			document.getElementById("stitle").innerHTML="Please enter Product Name";
       			document.getElementById("stitle").style.color = "red";
       			document.getElementById("stitle").style.display = "block"; 
       		}	
       		else 
   			{
         	     document.getElementById("suname").innerHTML = ""; 
         	     document.getElementById("suname").style.display = "none";
        	}
        	
        	if (photo==null || photo=="" ) 
			{
       			document.getElementById("sphoto").innerHTML="Please Add Photo!!";
       			document.getElementById("sphoto").style.color = "red";
       			document.getElementById("sphoto").style.display = "block"; 
       		}	
       		else 
   			{
         	     document.getElementById("sphoto").innerHTML = ""; 
         	     document.getElementById("sphoto").style.display = "none";
        	}
        	return false;
        }
}

</script>
<body>
<div class="shell">
<%@ include file="Adminnevigation.jsp"%> 
  
   <br><center><h1>Add Photo</h1></center><br>
         <form name="AdminAddImage" id="form1" enctype="multipart/form-data" action="AdminAddImageServ" method="post" onsubmit="return AdminAddImageFunc()">
         <center> <p style="color: red; font-size: 20px">${message}</p></center>
            <table align="center">
            <tr>
							<td></td>
							<td></td>
						</tr>
               <tr>
							<td>Product Name</td>
							<td><select name="pid" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select pid,pname from product");
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
									<%
										}
											
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										
									%>
							</select></td>
						</tr>
               
                <tr>
							<td>Category Name<font color="red">*</font></td>
							<td><select name="cid" id="cid" style="width: 120px">
									<%
										
										PreparedStatement pstmt1;
										try {
											pstmt1 = con.prepareStatement("select catid,catname from category");
											ResultSet rs1 = pstmt1.executeQuery();
											while (rs1.next()) {
									%>
									<option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></option>
									<%
										}
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
							</select>  </td>
						</tr>
                <tr>
                    <td>Enter Photo Name <font color="red">*</font>:</td>
                    <td><input  type="text"  name="title"/><span id="stitle"></span></td>
                </tr>
                
                <tr>
                    <td>Select Photo<font color="red">*</font>  </td>
                    <td><input type="file"  name="photo" /><span id="sphoto"></span>
                </tr>
            </table>
            <p/><br>
            <center><input type="submit" value="Add Photo"/></center>
        </form>

       
 



<%@ include file="AFooter.jsp"%>
</body>
</html>