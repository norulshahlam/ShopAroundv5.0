package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.RemoveCategoryjdbc;
import com.shopping.jdbc.RemoveProductjdbc;

/**
 * Servlet implementation class RemoveCategory
 */
public class RemoveCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCategory() {
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

		String catname=request.getParameter("catname");
		
		RemoveCategoryjdbc rpj=new RemoveCategoryjdbc();
		int w=rpj.removeCategory(catname);
		if(w==1)
		{
			String msg="Sucessfully Removed....";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Removecategory.jsp").forward(request, response);
			
		}
		else
		{
			/*pw.println("<html><body><script>");
			pw.println("alert('No such Category ID !')");
			pw.println("</script>");
			pw.println("</body></html>");
			request.getRequestDispatcher("Removecategory.jsp").include(request, response);*/
			
			String msg="Not able to Remove category, first remove product from this category....";
			request.setAttribute("message", msg);
			//response.sendRedirect("Addcategory.jsp");
			request.getRequestDispatcher("Removecategory.jsp").forward(request, response);
		}
		}

}
