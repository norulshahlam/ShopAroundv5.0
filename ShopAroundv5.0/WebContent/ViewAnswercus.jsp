<%@ page import="java.sql.*" import="com.shopping.jdbc.Connect"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="Head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="shell">

	<%@ include file="Nevigation.jsp"%>

	<br />

	<br/><br/><center><h2>QUERY</h2></center><br/><br/>
	<%
		int Cid = Integer.parseInt(session.getAttribute("cid").toString());

		//int Cid=Integer.parseInt(request.getParameter("cid"));
		//ProductSearchjdbc psj=new ProductSearchjdbc();
		//productsearch(pid);
		Connection con = Connect.getConnect();
		try {
			//Connection con = Connect.getConnect();
			PreparedStatement stmt = con
					.prepareStatement("SELECT * from Support WHERE Cid=?");
			stmt.setInt(1, Cid);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				out.println("<table border=1 width=50% height=50% align='center'>");
				out.println("<tr><th>Query_ID</th><th>Customer_ID</th><th>Question</th><th>Answer</th></tr>");
				do{

					int qid = rs.getInt(1);
					int cid = rs.getInt(2);
					String que = rs.getString(3);
					String ans = rs.getString(4);
					if (ans != null) {
						out.println("<tr><td>" + qid + "</td><td>" + cid
								+ "</td><td>" + que + "</td><td>" + ans
								+ "</td></tr>");
					} else {
						out.println("<tr><td>" + qid + "</td><td>" + cid
								+ "</td><td>" + que
								+ "</td><td>Not Yet Answered</td></tr>");
					}

				}while(rs.next());
				out.println("</table><br/><br/><br/>");

			} else {
				String msg="No Query Found";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("SupportCust.jsp").forward(request, response);

			}

			//con.close();
		} catch (Exception e) {
			System.out.println(e);
			String msg="No Query Found";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("SupportCust.jsp").forward(request, response);

		}
		finally
		{
			con.close();
		}
	%>

	<%@ include file="Slide.jsp"%>
	<%@ include file="Textcol.jsp"%>
	<%@ include file="Footer.jsp"%>


</div>
</body>
</html>