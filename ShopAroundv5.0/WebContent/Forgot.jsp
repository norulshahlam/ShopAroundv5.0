<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%>

<script>
function ForgotPasswordFunc()
{
	var emailid=document.ForgotPassword.emailid.value;
	var ques=document.ForgotPassword.ques.value; 
	var ans=document.ForgotPassword.ans.value; 
	var vemailid=/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
	
	if(!emailid.match(vemailid)||emailid.length>25||(ans==null || ans=="")||(ques==null || ques=="") )
	{
			if(!emailid.match(vemailid))	
			{
			 	document.getElementById("semailid").innerHTML="Enter correct email id";  
			 	document.getElementById("semailid").style.color = "red";
       	     	document.getElementById("semailid").style.display = "block"; 
 			}
 			else if(emailid.length>25)
			{
				document.getElementById("semail").innerHTML="Maximum length exceeded!!";  
			 	document.getElementById("semail").style.color = "red";
       	     	document.getElementById("semail").style.display = "block"; 
			}
			else 
   			{
              	document.getElementById("semailid").innerHTML =""; 
              	document.getElementById("semailid").style.display = "none";
        	}
        	
        	if (ques==null || ques=="") 
			{
	       		document.getElementById("sques").innerHTML="Select Security Question";
       			document.getElementById("sques").style.color = "red";
       			document.getElementById("sques").style.display = "block";
       			//return false;
    		}
    		else 
   			{
              	document.getElementById("sques").innerHTML = ""; 
              	document.getElementById("sques").style.display = "none";
	              
        	} 
        	
        	if (ans==null || ans=="") 
			{
	       		document.getElementById("sans").innerHTML="Enter Answer";
       			document.getElementById("sans").style.color = "red";
       			document.getElementById("sans").style.display = "block";
       			//return false;
    		}
    		else if(ans.length>20)
    		{
    			document.getElementById("sans").innerHTML="Maximum 20 characters!!";
    			document.getElementById("sans").style.color = "red";
       			document.getElementById("sans").style.display = "block";
    		}
    		else 
   			{
              	document.getElementById("sans").innerHTML = ""; 
              	document.getElementById("sans").style.display = "none";
	              
        	} 
        	return false;
        }
        else 
        return true;
       
}

</script>
<br><br>
<center><p style="color: red; font-size: 20px">${message}</p></center>
<br>
<form name="ForgotPassword" action="Securityques" method="post" onsubmit="return ForgotPasswordFunc()">
<br><br><center><h1>Forgot Password</h1></center><br><br>
<table align="center">
<tr>
<td>Email Id<font color="red">*</font> :</td>
<td><input type="text" name="emailid"><span id="semailid"></span></td>
</tr>
<tr>
<td>
Security Question<font color="red">*</font> :</td>
<td><select name="ques"  style="width: 300px; height: 28px">
<option value="first_pet">What was the name of your first pet?</option>  
    <option value="child_friend">Who was your best childhood friend?</option>  
    <option value="meet_spouse">Where did you meet your spouse?</option>  
    <option value="fav_city">Which is your favourite city?</option>  
    </select><span id="sques"></span></td>
</tr>
<tr>
<td>Answer <font color="red">*</font>:</td>
<td><input type="text" name="ans"><span id="sans"></span></td>
</tr>
</table>
<br><br>
<center><input type="submit" name="submit" value="Submit"></center>
</form>

<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>
