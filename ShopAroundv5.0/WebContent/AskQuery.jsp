<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp" %>
<script>
function AskQueryFunc()
{
		
		var cid=document.AskQuery.cid.value;
		var ques =document.AskQuery.ques.value;
		
		if((cid==null || cid=="" ) || isNaN(cid)||(ques==null || ques=="" ) )
		{	
        	if (cid==null || cid=="" ) 
			{
       			document.getElementById("scid").innerHTML="Please enter Customer ID";
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
        	
        	if (ques==null || ques=="" ) 
			{
       			document.getElementById("sques").innerHTML="Please enter your query!!";
       			document.getElementById("sques").style.color = "red";
       			document.getElementById("sques").style.display = "block"; 
       		}
       		else if(ques.length>500)
       		{
       			document.getElementById("sques").innerHTML="Maximum length exceeded!!";
       			document.getElementById("sques").style.color = "red";
       			document.getElementById("sques").style.display = "block";        			
       		}
       		else
       		{
       			document.getElementById("sques").innerHTML="";
       		}
       		return false;
       	}
       	else
       	return true;
 }
</script>
</head>
<body>

<div class="shell">
<%@ include file="Nevigation.jsp"%> 
<%
		int cid=0;
		if (session.getAttribute("uname")==null) {
		
   			response.sendRedirect("Login.jsp"); 
		}
		else
		 {
  			String uname=session.getAttribute("uname").toString();
  			
      	    cid=Integer.parseInt(session.getAttribute("cid").toString());
      		//out.print("WELCOME ");
		 }
	 %>
<center><br><br><br>
<form name="AskQuery" action="AskQuery" method="post" onsubmit="return AskQueryFunc()">
<br/><br/>
<p style="color: red; font-size: 20px">${message}</p>	
<br/><br/>
Customer ID:<input type="text" name="cid" value="<%=cid%>" disabled="disabled"><span id="scid"></span><br><br><br>
Question<font color="red">*</font>:<input type="text" name="ques"><span id="sques"></span><br><br><br><br><br><br>

<input type="submit" value="Submit Query" style=" height: 46px; width: 112px">
</form>
</center><br><br><br>
<center><br><br><br><br><br><br>
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>


