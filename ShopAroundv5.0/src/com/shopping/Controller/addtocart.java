package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Calunitpricejdbc;

/**
 * Servlet implementation class addtocart
 */
public class addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtocart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		PrintWriter pw=response.getWriter();
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		
		//HttpSession sessionid=request.getSession(false);
	   // long userid=(long) sessionid.getAttribute("userid");
		
		HttpSession session=request.getSession(false);
		
		
		System.out.println(pid);
		System.out.println(qty);
	
		if (session.getAttribute("uname")==null) {
			
			response.sendRedirect("Login.jsp"); 
				
		}
		else
		{
			int cid=Integer.parseInt(session.getAttribute("cid").toString());
			Calunitpricejdbc cal=new Calunitpricejdbc();
			boolean i=cal.calculate(cid,pid,qty);
			if(i)
			{	
				//String msg="Item Added to Cart....";
				//request.setAttribute("message", msg);
				response.sendRedirect("Home.jsp");
				//request.getRequestDispatcher("Home.jsp").forward(request, response);
			}
			else
			{
				String msg="Not able to add Item to Cart....";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Productview.jsp").forward(request, response);
			}	
		}
		
		
		
	}

}
