package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String Itemid=request.getParameter("id");
		
		if("a".equals(Itemid))
		{
			request.getRequestDispatcher("ItemSearch.jsp").include(request, response);
		}
		else if ("b".equals(Itemid))
		{
			request.getRequestDispatcher("ProductSearch.jsp").include(request, response);
		}
		else
		{
			String msg="Please Select one button....";
			request.setAttribute("message", msg);
			//pw.write("<script>window.alert('Please Select one button')</script>");
			request.getRequestDispatcher("Search.jsp").forward(request, response);
			
		}
	}

}
