package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class ViewAnswer
 */
public class ViewAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);
		int Cid = Integer.parseInt(session.getAttribute("cid").toString());
		Connection con = Connect.getConnect();
		try {
			
			PreparedStatement stmt = con.prepareStatement("SELECT * from Support WHERE Cid=?");
			stmt.setInt(1, Cid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				
				out.println("<table border=1 width=50% height=50% align='center'>");
				out.println("<tr><th>Query_ID</th><th>Customer_ID</th><th>Question</th><th>Answer</th></tr>");
				while (rs.next()) {

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

				}
				out.println("</table>");
				out.println("<br><br><br><br><a href='SupportCust.jsp'>Back</a>");

			} else {
				String msg="No Query Found....";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("SupportCust.jsp").forward(request, response);
				
			}

			//con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		finally
		{
			
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
