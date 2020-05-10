<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>

	

<body>
	<div class="shell">

		<%@ include file="Nevigation.jsp"%>
		
		<br/>
		<center><br>
			<h1>LOGIN</h1><br/>
		</center>
		<center>
		
<script>
function LoginFunc()
{
	var emailid =document.Login.emailid.value;
	var password =document.Login.password.value;
	if((emailid==null || emailid=="" )||(password==null || password=="" ))
		{
		
	if (emailid==null || emailid=="" ) 
	{
			document.getElementById("semailid").innerHTML="Please enter Email Id!!";
			document.getElementById("semailid").style.color = "red";
			document.getElementById("semailid").style.display = "block"; 
	}	
	else
	{
		document.getElementById("semailid").innerHTML="";
	}
	
	if (password==null || password=="" ) 
	{
			document.getElementById("spassword").innerHTML="Please enter Password!!";
			document.getElementById("spassword").style.color = "red";
			document.getElementById("spassword").style.display = "block"; 
	}	
	else
	{
		document.getElementById("spassword").innerHTML="";
	}
	return false;
		}
	
}
</script>


<center>

<form name="Login" action="LoginValidate" method="post" onsubmit="return LoginFunc()">
</h2><br><br>
<br>
<table>
<tr>
							<td><p style="color: red; font-size: 20px">${message}</p></td>
							<td></td>
						</tr>
<tr><td>Enter EmailId<font color="red">*</font></td><td><input type="text" name="emailid"><span id="semailid"></span></td></tr>
<tr><td>Enter password<font color="red">*</font></td><td><input type="password" name="password"><span id="spassword"></span></td></tr>
<tr><td></td><td><input type="submit" value="login"></td></tr>
</table>
</form>
<br><br>
<a href="Registration.jsp">New User ??</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Forgot.jsp">Forget Password ??</a>
</center>
</center>
<br/><br/><br/><br/>
	
	
	
		<%@ include file="Slide.jsp"%>
			<%@ include file="Textcol.jsp"%>
			<%@ include file="Footer.jsp"%>
			</div>
			</body>
			</html>