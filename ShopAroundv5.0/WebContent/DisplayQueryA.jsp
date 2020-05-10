<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp"%>
</head>
<body>
<div class="shell">
<script>
function DisplayQueryFunc()
{
	var qid = document.DisplayQuery.qid.value;
	var vqid = /^[0-9]*$/;
	
	var ans = document.DisplayQuery.ans.value;
	if((qid == null || qid == "")||!qid.match(vqid)||(ans == null || ans == "")||ans.length>20)
		{
	if (qid == null || qid == "") {
		document.getElementById("sqid").innerHTML = "Please enter Query ID";
		document.getElementById("sqid").style.color = "red";
		document.getElementById("sqid").style.display = "block";
	}
	else if(!qid.match(vqid))
		{
		document.getElementById("sqid").innerHTML = "Please Correct Query Id!!";
		document.getElementById("sqid").style.color = "red";
		document.getElementById("sqid").style.display = "block";
		}
	else
		{
		document.getElementById("sqid").innerHTML = "";
		}
	
	if (ans == null || ans == "") {
		document.getElementById("sans").innerHTML = "Please enter Answer!!";
		document.getElementById("sans").style.color = "red";
		document.getElementById("sans").style.display = "block";
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
		
		}
	return false;
		}
}
</script>
	<%@ include file="Adminnevigation.jsp"%>
	

	<center>
	<p style="color: red; font-size: 20px">${message}</p>
	</center>
	<%
	Connection con=Connect.getConnect();
		try {
			
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Support WHERE Answer IS NULL");
			ResultSet rs = stmt.executeQuery();
            if(rs.next())
            {
            	out.println("<br><br><center><h1>QUERY</h1><br/><br/></center>");
				out.println("<table align='center' border=1 width=50% height=50>");
				out.println("<tr><th>Query_ID</th><th>Customer_ID</th><th>Question</th><th>Answer</th></tr>");
				do {

				int qid = rs.getInt(1);
				int cid = rs.getInt(2);
				String que = rs.getString(3);
				String ans = rs.getString(4);

				out.println("<tr><td>" + qid + "</td><td>" + cid
						+ "</td><td>" + que + "</td><td>" + ans
						+ "</td></tr>");
				}while (rs.next());
			System.out.println("Sucess");
			out.println("</table><br><br><br><br><br><br>");
			
			out.println("<form name='DisplayQuery' action='SupportUpdate' method='post' onsubmit='return DisplayQueryFunc()''>");
			out.println("<center>Enter Query ID ");
			%>
			<select name="qid" id="qid" style="width: 120px">
									<%
										//Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select qid  from support where answer is null");
											ResultSet rs1 = pstmt.executeQuery();
											while (rs1.next()) {
									%>
									<option value="<%=rs1.getInt(1)%>"><%=rs1.getInt(1)%></option>
									<%
										}
											
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										
									%>
							</select>
			
			<%
			out.println("</center><br/><br/><br/>");
			out.println("<center>Enter Answer  :<input type='text'name='ans'><span id='sans'></span><br><br><br><br><br></center>");
			out.println("<center><input type='submit' value='Update'></center>");
            }
            else
            {
            	out.println("<br/><br/><center><h1>No QUERY</h1></center>");
            }
			out.println("<center><a href='DisplayQuery.jsp'>Back</a></center>");
			
			//con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		finally
		{
				con.close();
		}
	%>



	
	<%@ include file="AFooter.jsp"%>
	</div>

</body>
</html>