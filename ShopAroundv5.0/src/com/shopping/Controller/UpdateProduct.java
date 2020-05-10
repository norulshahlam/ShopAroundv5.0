package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.RemoveProductjdbc;
import com.shopping.jdbc.UpdateProductjdbc;

/**
 * Servlet implementation class UpdateProduct
 */
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
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
		int qty=Integer.parseInt(request.getParameter("qty"));
		double prc=Double.parseDouble(request.getParameter("prc"));
		UpdateProductjdbc upj=new UpdateProductjdbc();
		int w=upj.updateProduct(pname,qty,prc);
		if(w==1)
		{
			String msg="Sucessfully Updated....";
			request.setAttribute("message", msg);
			//response.sendRedirect("Addcategory.jsp");
			request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
			
		}
		else
		{
			String msg="Can not be updated....";
			request.setAttribute("message", msg);
			//response.sendRedirect("Addcategory.jsp");
			request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
			
		}
	
	}

}
