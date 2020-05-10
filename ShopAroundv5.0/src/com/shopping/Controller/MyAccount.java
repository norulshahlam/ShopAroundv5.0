package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.OrderDetail;

/**
 * Servlet implementation class MyAccount
 */
public class MyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String option=request.getParameter("submit");
		
		PrintWriter pw = response.getWriter();
		if(option.equals("Personalinfo"))
		{
			response.sendRedirect("Personalinfo.jsp");
		}
		else if(option.equals("Address"))
		{
			response.sendRedirect("Address.jsp");
		}
		else if(option.equals("ChangePassword"))
		{
			response.sendRedirect("ChangePassword.jsp");
			
		}
		else if(option.equals("Order Details"))
		{
			response.sendRedirect("OrderDetails.jsp");
		}
		else if(option.equals("Tracking"))
		{
			response.sendRedirect("TrackUser.jsp");
		}
		else if(option.equals("Add Review"))
		{
			response.sendRedirect("review.jsp");
		}
		
	}

}
