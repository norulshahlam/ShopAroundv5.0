package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Orderjdbc;

/**
 * Servlet implementation class Cancelorder
 */
public class Cancelorder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cancelorder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		int oid=Integer.parseInt(session.getAttribute("oid").toString());

		Orderjdbc or=new Orderjdbc();
		PrintWriter pw=response.getWriter();
		int i;
		try {
			i=or.cancelOrder(cid,oid);
			if(i!=0)
			{
				String msg="Order Cancelled..";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
			}
			else
			{
				String msg="Sorry Error Occurred in Cancelling Order try later..";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Buy.jsp").forward(request, response);
				//e.printStackTrace();
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			String msg="Sorry Error Occurred in Cancelling Order try later..";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Buy.jsp").forward(request, response);
			//e.printStackTrace();
		}
	}

}

