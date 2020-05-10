<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%>

<!--  <form action="ServElectro" method="post"> -->

<form action="List.jsp" method="post">
<br><br><br><br><br><br><br>
<center>
<table>
<tr>
<td><input type="submit" name="submit" value="MEN" style='height: 67px; width: 150px; color: Purple; background-color: Teal; font-size: 24px; font-family: ''Comic Sans MS", Sans-Serif'/></td>
<td><input type="submit" name="submit" value="WOMEN" style='height: 67px; width: 168px; color: Purple; background-color: Teal; font-size: 24px; font-family: ''Comic Sans MS", Sans-Serif'/></td>
</tr>

</table>
</center>


</form>

<br><br><br><br><br><br>
<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>