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




<form action="Search" method="post">
<p style="color: red; font-size: 20px">${message}</p>
<center><br><br><br><br><h1>SEARCH BY</h1><br><br></center>
 <center> <input type="radio" name="id"  onclick=getAnswer(a) value="a">Item Name<br><br></center>
<center><input type="radio" name="id" onclick=getAnswer(b) value="b">Product Name<br><br></center>
<center><input type="submit" value="Submit"></center>
<br/><br/><br/><br/>

</form>



<%@ include file="AFooter.jsp"%>
</div>

</body>
</html>

