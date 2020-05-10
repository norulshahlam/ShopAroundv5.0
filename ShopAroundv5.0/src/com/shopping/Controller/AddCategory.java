package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.bean.AddCgetset;
import com.shopping.bean.AddPgetset;

/**
 * Servlet implementation class AddCategory
 */
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
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
		int itemid=Integer.parseInt(request.getParameter("itemid"));
		String cname=request.getParameter("cname");
		AddCgetset ags=new AddCgetset();
		int i=ags.getSet(itemid,cname);
		if(i!=0)
		{
			String msg="Sucessfully Added....";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Addcategory.jsp").forward(request, response);
		}
		else
		{
			String msg="Not able to Add....";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Addcategory.jsp").forward(request, response);
		
		}	
		
	}

}
