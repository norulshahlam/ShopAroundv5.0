package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Cartjdbc;

/**
 * Servlet implementation class Removeserv
 */
public class Removeserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Removeserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		PrintWriter pw=response.getWriter();
		int pId=Integer.parseInt(request.getParameter("pid"));
		System.out.println(pId);
		Cartjdbc cd=new Cartjdbc();
		boolean i=cd.cancelProduct(pId,cid);
		if(i)
		{
			String msg="Product Removed Successfully...";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
	    }
		else
		{
			String msg="Not Able To Remove Product";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
			
		}
		// TODO Auto-generated method stub
	}

}
