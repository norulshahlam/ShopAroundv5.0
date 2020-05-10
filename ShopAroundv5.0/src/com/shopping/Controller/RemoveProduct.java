package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.bean.AddPgetset;
import com.shopping.jdbc.RemoveProductjdbc;

/**
 * Servlet implementation class RemoveProduct
 */
public class RemoveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProduct() {
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

		String pname=request.getParameter("pname");
		RemoveProductjdbc rpj=new RemoveProductjdbc();
		int w=rpj.removeProduct(pname);
		if(w==1)
		{
		
			String msg="Sucessfully Removed....";
			request.setAttribute("message", msg);
			//response.sendRedirect("Addcategory.jsp");
			request.getRequestDispatcher("RemoveProduct.jsp").forward(request, response);
			}
		else
		{
			
			String msg="Product can not be removed,because it is in cart";
			request.setAttribute("message", msg);	
			request.getRequestDispatcher("RemoveProduct.jsp").forward(request, response);
		
		}
	}

}
