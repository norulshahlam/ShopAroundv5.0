package com.shopping.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Customerjdbc;

/**
 * Servlet implementation class reviewServ
 */
public class reviewServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		response.setContentType("text/html");
		String pname=request.getParameter("pname");
		String review=request.getParameter("review");
		Customerjdbc cd=new Customerjdbc();
		int i=cd.addreview(cid, pname, review);
		if(i!=0)
		{
			String msg="Review Added";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("review.jsp").forward(request, response);
	
		}
		else
		{
			String msg="Not able to add review";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("review.jsp").forward(request, response);
		}
	}

}
