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

import com.shopping.jdbc.AskQueryjdbc;
import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class AskQuery
 */
public class AskQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AskQuery() {
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
		PrintWriter pw = response.getWriter();

		HttpSession session = request.getSession(false);
		int cid = Integer.parseInt(session.getAttribute("cid").toString());
		Connection con = Connect.getConnect();
		// int Cid=Integer.parseInt(request.getParameter("cid"));
		String ques = request.getParameter("ques");
		try {
			
			
			PreparedStatement stmt = con.prepareStatement("SELECT * from Customer WHERE Cid=?");
			stmt.setInt(1, cid);
			ResultSet rsc = stmt.executeQuery();

			if (rsc.next()) {
				AskQueryjdbc aqj = new AskQueryjdbc();
				int r = aqj.askQuery(cid, ques);
				if(r!=0)
				{
				String msg="Query Submitted!";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("SupportCust.jsp").forward(request, response);
				}
				else
				{
					String msg="Not able to send Query";
					request.setAttribute("message", msg);
					request.getRequestDispatcher("SupportCust.jsp").forward(request, response);
			
				}

			} else {
				String msg="Not able to send Query";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("SupportCust.jsp").forward(request, response);
			}
			

			//con.close();
		} catch (Exception e) {
			String msg="Not able to send Query";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("SupportCust.jsp").forward(request, response);
		
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
