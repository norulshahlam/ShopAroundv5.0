<%@ page 
import ='java.io.IOException'
import=' java.io.PrintWriter'
	import=' java.sql.Connection'
	import ='java.sql.DriverManager'
	import ='java.sql.PreparedStatement'
	import=' java.sql.ResultSet'
	import=' javax.servlet.http.HttpServlet'
	import ='javax.servlet.http.HttpServletRequest'
	import ='javax.servlet.http.HttpServletResponse'
	import ='javax.servlet.ServletException'
	import=' java.sql.SQLException'
	
language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body>
<div class="shell">
<%@ include file="Nevigation.jsp"%>

<%
		 response.setContentType("text/html;charset=UTF-8");
		String submit=request.getParameter("submit");
		PrintWriter pw=response.getWriter();
		System.out.println(submit);
		int s=0;
		Connection con=Connect.getConnect();
		try 
		{
			 con.setAutoCommit(false);
			 PreparedStatement stmt=con.prepareStatement("SELECT CATID FROM  CATEGORY WHERE CATNAME=?");
			 stmt.setString(1,submit);
			 
			 ResultSet rs=stmt.executeQuery();
			 if(rs.next())
			 {
				s=Integer.parseInt(rs.getString(1));
				System.out.println(s);
				//pw.println(s);
			 }
			 
			 
    	        //PrintWriter out = response.getWriter();
    	       // request.getRequestDispatcher("Nevigation.jsp").include(request,response);
    	        //try {
    	            //Class.forName("oracle.jdbc.driver.OracleDriver");
    	            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Govind", "Newuser123");
    	            PreparedStatement ps = con.prepareStatement("select * from Productimg where CATID=?");
    	            ps.setInt(1, s);
    	            ResultSet rs1 = ps.executeQuery();
    	            //out.println("<h1>Photos</h1>");
    	            String html="<html>" +"<head><title> SHOP AROUND </title></head>\n";
    	             //+          "<h1 align=\"center\">   SHOP AROUND </h1>\n" ;
    	            
    	            out.println(html);
    	            String html1="<table  align=\"center\">"+"<tr>" ;
    	            while ( rs1.next()) 
    	            {
    	                 html1+="<td><form action='Productview.jsp' method='post'><img width='200' height='200' src=DisplayPhotoServlet?pid="+ rs1.getString(1) + ">&nbsp;&nbsp;&nbsp</img><br><input type='hidden' name='pid' value="+rs1.getInt(1)+"><center>"+rs1.getString(3)+"<br><br><input type='submit' name='submit' value='View Product'/></center></form></td>";
    	            }
    	            
    	            html1+="</tr></table>";
    	            out.println(html1);
    	            
    	            
    	           
    	        }
    	        catch(Exception ex) 
    	        {
    	        	ex.printStackTrace();
    	        }
    	       
		finally
		{
			try 
			{
				con.setAutoCommit(true);
				con.close();
				
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		
		}    	     
 %> 
 
 <%@ include file="Slide.jsp"%>
 <%@ include file="Textcol.jsp"%>
  <%@ include file="Footer.jsp"%>
  </div>
</body>
</html>