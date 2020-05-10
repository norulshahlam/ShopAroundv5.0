package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.trackorderadmin;



/**
 * Servlet implementation class TrackAdminStatus
 */
public class TrackAdminStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackAdminStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
	      PrintWriter pw = response.getWriter();  
	     
	      int orderid=Integer.parseInt (request.getParameter("oid"));
	      String shipstatus=request.getParameter("status"); 
	      trackorderadmin tra=new trackorderadmin();
	      try {
			int t= tra.gettrackorder(orderid, shipstatus);
			if(t==1)
			{
				 
				String msgt="Order Status updated";
				request.setAttribute("messaget", msgt);
				request.getRequestDispatcher("TrackAdmin.jsp").forward(request,response);
			
			}
			else
			{
				String msgt="Order Status not updated";
				request.setAttribute("messaget", msgt);
				request.getRequestDispatcher("TrackAdmin.jsp").forward(request,response);
				
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
