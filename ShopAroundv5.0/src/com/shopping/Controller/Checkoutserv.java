package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Orderjdbc;

/**
 * Servlet implementation class Checkoutserv
 */
public class Checkoutserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkoutserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in check serv");
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		System.out.println("in check serv"+cid);
		Orderjdbc or=new Orderjdbc();
		PrintWriter pw=response.getWriter();
		boolean i;
		try {
			if(cid!=0)
			{
					int oid= or.placeorder(cid);
					System.out.println("in check serv"+cid);
					if(oid!=0)
					{
							session.setAttribute("oid",oid);
							request.getRequestDispatcher("ShippingAdress.jsp").include(request,response);		
					}	
					else
					{
						String msg="Sorry Error Occurred in placing Order try later..";
						request.setAttribute("message", msg);
						request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
					}
			}
			else
			{
				request.getRequestDispatcher("Login.jsp").include(request,response);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String msg="Sorry Error Occurred in placing Order try later..";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
	//e.printStackTrace();
			}
		
	}

}
