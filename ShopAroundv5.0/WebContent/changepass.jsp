<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%>
<script>
function validateform()
	{ 	
		
		var newpass=document.changepass.newpass.value;
		var connewpass=document.changepass.connewpass.value;
		
		var vpass=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&#^()])[A-Za-z\d$@$!%*?&#^()]{8,}/;
		if((newpass.length<8 || newpass.length>20)|| !newpass.match(vpass) || newpass!=connewpass)
		{
			if(newpass.length<8 || newpass.length>20)
       	 	{  
				document.getElementById("snewpass").innerHTML="Password length should be of 8-20 characters";  
				document.getElementById("snewpass").style.color = "red";
    			document.getElementById("snewpass").style.display = "block"; 
				// return false;  
	  		} 
			else if(!newpass.match(vpass))
  			{
  				document.getElementById("snewpass").innerHTML="Password should have minimum 8 characters, <br>at least 1 Uppercase Alphabet,<br> 1 Lowercase Alphabet,<br> 1 Number and 1 Special Character";
  				document.getElementById("snewpass").style.color = "red";
       			document.getElementById("snewpass").style.display = "block"; 
  		    		
  			}
  			else 
   			{
          	    document.getElementById("snewpass").innerHTML = ""; 
          	    document.getElementById("snewpass").style.display = "none";
        	}
        	
			if(newpass!=connewpass)
  			{
	  			document.getElementById("sconnewpass").innerHTML="Passwords are not matching"; 
  				document.getElementById("sconnewpass").style.color = "red";
       			document.getElementById("sconnewpass").style.display = "block"; 
				
			}
			else 
   			{
          	    document.getElementById("sconnewpass").innerHTML = ""; 
          	    document.getElementById("sconnewpass").style.display = "none";
        	}
        		 	  		   	
        	return false;
  	  }
		
}
</script>

<form name="changepass" action="ChangepassServ" method="post" onsubmit="return validateform()">
<br><br><center><h1>Change Password</h1></center>
							
<br><br>
<center><p style="color: red; font-size: 20px">${message}</p></center>
<table align="center">
<tr>
							<td></td>
							<td></td>
						</tr>
	<tr>
		<td>New Password<font color="red">*</font>:</td>
		<td><input type="password" name="newpass" ><span id="snewpass"></td>
	</tr>
	
	<tr>
		<td>Confirm New Password<font color="red">*</font>:</td>
		<td><input type="password" name="connewpass" ><span id="sconnewpass"></td>
	</tr>

</table>
<br>
<center><input type="submit" value="Done"></center>
</form>
	<br/>
	<br/>
	<br/>
		


<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>

</div>
</body>
</html>