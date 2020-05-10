package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.bean.Address;
import com.shopping.bean.Customer;
import com.shopping.jdbc.Customerjdbc;
import com.shopping.jdbc.Registerjdbc;

/**
 * Servlet implementation class ChangeAddress
 */
public class ChangeAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		response.setContentType("text/html");
		String address=request.getParameter("address");
		String street=request.getParameter("street");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		int zip=Integer.parseInt(request.getParameter("zip"));
		
		System.out.println("test1");
		
		Customerjdbc cd=new Customerjdbc();
		
		Address a=new Address();
		a.setAddress(address);
		a.setStreet(street);
		a.setCity(city);
		a.setState(state);
		a.setCountry(country);
		a.setZip(zip);
       
		LinkedList<Address> lst=new LinkedList<Address>();
		lst.add(a);
		PrintWriter pw=response.getWriter();
		try{
			boolean  i=cd.setAddress(lst,cid);
			if(i)
			{
				String msg="Address Changed...";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Myaccount.jsp").forward(request, response);
		
			}
			else
			{
				String msg="Sorry Updation failed...";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("ChangeAddress.jsp").forward(request, response);
			}
		
	}
	catch(Exception ex){
		
		String msg="Sorry Updation failed...";
		request.setAttribute("message", msg);
		request.getRequestDispatcher("ChangeAddress.jsp").forward(request, response);
	}
		
		
	}

}
