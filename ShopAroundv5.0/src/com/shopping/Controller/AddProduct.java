package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.bean.AddPgetset;
import com.shopping.jdbc.AddProductjdbc;

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		//int Pid=Integer.parseInt(request.getParameter("pid"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		double wt=Double.parseDouble(request.getParameter("wt"));
		double prc=Double.parseDouble(request.getParameter("prc"));
		String pname=request.getParameter("pname");
		String prdes=request.getParameter("prdes");
		AddPgetset ags=new AddPgetset();
		int i=ags.getSet(catname,pname,wt,prc,qty,prdes);
		if(i!=0)
		{
				String msg="Sucessfully Added....";
				request.setAttribute("message", msg);
				
				request.getRequestDispatcher("AddProduct.jsp").forward(request, response);	
		}
		else
		{
				String msg="Not Able to Add Item....";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
			
		}
	}

}
