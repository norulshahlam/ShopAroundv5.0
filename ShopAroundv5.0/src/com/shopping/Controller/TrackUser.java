package com.shopping.Controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.trackorderuser;





/**
 * Servlet implementation class TrackUser
 */
public class TrackUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	      PrintWriter pw = response.getWriter();
	      HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
			
			
	     int orderid=Integer.parseInt (request.getParameter("oid"));
	     String s="";
	       trackorderuser ord=new trackorderuser();
	      try {
	    	  
			s+= ord.gettrackorder(orderid,cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
	    
	       			request.setAttribute("s", s);
	      			RequestDispatcher rd = request.getRequestDispatcher("TrackUser.jsp");
	                 rd.forward(request, response);
	                
	                  
	}   
	         
	         
	     
	 }
	          

	



	


