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
 * Servlet implementation class OrderSearch
 */
public class OrderSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderSearch() {
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

		int oid = Integer.parseInt(request.getParameter("oid"));
		// ProductSearchjdbc psj=new ProductSearchjdbc();
		// productsearch(pid);
		Connection con = Connect.getConnect();
		
		try {

			
			PreparedStatement stmt1 = con.prepareStatement("SELECT orderstatus from ordr WHERE Oid=?");
			ResultSet rs1 = stmt1.executeQuery();
			if (rs1.next()) {
				if(rs1.getString(1).equalsIgnoreCase("order proceeded"))
				{
					String msg="No Such Order Placed...";
					request.setAttribute("message", msg);
					request.getRequestDispatcher("OrderDetail.jsp").forward(
							request, response);
					
				}
				else
				{
					PreparedStatement stmt = con.prepareStatement("SELECT * FROM OrderDetails WHERE Oid=?");
					ResultSet rs = stmt.executeQuery();

					if (rs.next()) {
						int Oid = rs.getInt(1);
						int Pid = rs.getInt(2);
						// int Pid= rs.getInt(2);
						String pname = rs.getString(3);
						// String remarks=rs.getString(5);
						int price = rs.getInt(4);

						// int wt=rs.getInt(5);
						int qty = rs.getInt(5);
						// String pdes=rs.getString(7);
						out.println("<table border=1 width=50% height=50%>");
						out.println("<tr><th>Category_ID</th><th>Order_ID</th><th>Product_Id</th><th>Product Name</th><th>Price</th><th>Quantity</th></tr>");
						out.println("<tr><td>" + Oid + "</td><td>" + Pid + "</td><td>"
								+ pname + "</td><td>" + price + "</td><td>" + qty
								+ "</td></tr>");

						System.out.println("Success");
						out.println("</table>");
						out.println("<center><a href='OrderDetail.jsp'>Back</a></center>");
					} else {
						
						String msg="No Such Order Placed...";
						request.setAttribute("message", msg);
						request.getRequestDispatcher("OrderDetail.jsp").forward(
								request, response);
					}

					
				}
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
