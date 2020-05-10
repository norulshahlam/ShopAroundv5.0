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

import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class ItemSearch
 */
public class ItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemSearch() {
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

		String itemname1 = request.getParameter("itemname");
		Connection con = Connect.getConnect();

		try {

			
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM Item WHERE Itemname=?");
			stmt.setString(1, itemname1);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				int Itemid = rs.getInt(1);
				String itemname = rs.getString(2);
				out.println("<table border=1 width=50% height=50%>");
				out.println("<tr><th>Item_ID</th><th>Item_Name</th></tr>");
				out.println("<tr><td>" + Itemid + "</td><td>" + itemname
						+ "</td></tr>");
				out.println("</table><br><br><br>");
				out.println("<center><a href='ItemSearch.jsp'>Back to Search</a></center>");
			} else {

				out.println("<center><a href='ItemSearch.jsp'>Back to Search</a></center>");
				String msg = "Not Able to Search Item....";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("ItemSearch.jsp").forward(request,
						response);
				
			}
			//con.close();
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Not Able to Search Item....";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("ItemSearch.jsp").forward(request,
					response);
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
