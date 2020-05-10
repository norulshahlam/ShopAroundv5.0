package com.shopping.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Shippingadd;

/**
 * Servlet implementation class UpdateShipAddServ
 */
public class UpdateShipServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateShipServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		int oid=Integer.parseInt(session.getAttribute("oid").toString());
		
		String add=request.getParameter("shipadd");
		System.out.println(add);
		if(add.equals("oldadd"))
		{
			
			Shippingadd add1 =new Shippingadd();
			
			 int i=add1.oldAdd(cid,oid);
               if(i==1){
					
					request.getRequestDispatcher("Buy.jsp").include(request,response);
               }
               else
               {
            	  String msg = "Error in Setting Shipping Address...";
       			request.setAttribute("message", msg);
       			request.getRequestDispatcher("ShippingAdress.jsp").forward(request,response);
               }
		}
		if(add.equals("newadd")){
			
			String addr= request.getParameter("address");
			
			String street= request.getParameter("street");
			String city= request.getParameter("city");
			int pin= Integer.parseInt(request.getParameter("pin"));
			String state= request.getParameter("state");
			String country= request.getParameter("country");
			
			Shippingadd add1 =new Shippingadd();
			
				int i=add1.NewAddr(addr, street, city, pin, state, country,cid,oid);
				
				if(i==1){
					
					request.getRequestDispatcher("Buy.jsp").include(request,response);
				}
				else
	               {
					 String msg = "Error in Setting Shipping Address...";
		       			request.setAttribute("message", msg);
		       			request.getRequestDispatcher("ShippingAdress.jsp").forward(request,response);
	               }
				
		}
		
		
		
	}

}
