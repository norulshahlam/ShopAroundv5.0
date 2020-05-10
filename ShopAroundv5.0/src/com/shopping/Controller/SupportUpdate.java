package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class SupportUpdate
 */
public class SupportUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SupportUpdate() {
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
		int i = 0;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int qid = Integer.parseInt(request.getParameter("qid"));
		String ans = request.getParameter("ans");
		Connection con=Connect.getConnect();
		try {
			
			
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement("UPDATE Support SET Answer=? WHERE Qid=?");
			pstmt.setString(1, ans);
			pstmt.setInt(2, qid);
			i = pstmt.executeUpdate();
			
			if(i==1){
				
			System.out.println("Sucess" + i);
			String msg = "Answer Updated";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("DisplayQueryA.jsp").forward(request,response);
			}
			else
			{
				
				String msg = "There is error.......";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("DisplayQueryA.jsp").forward(request,response);
				
			}
			
		} catch (Exception e) {
			
			String msg = "There is error.......";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("DisplayQueryA.jsp").forward(request,response);
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
