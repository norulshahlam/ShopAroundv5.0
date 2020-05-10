package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.shopping.bean.Customer;
import com.shopping.jdbc.Connect;
import com.shopping.jdbc.Registerjdbc;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Register() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//LinkedList<com.shopping.bean.Customer> lst1=new LinkedList<com.shopping.bean.Customer>();
		System.out.println("test1");
        Registerjdbc reg=new Registerjdbc(); 
		
        response.setContentType("text/html");
		String name=request.getParameter("uname");
		String gender=request.getParameter("gender");
		String password=request.getParameter("password");
		String email=request.getParameter("email").toLowerCase();
		long cont_no=Long.parseLong(request.getParameter("cont_no"));
		String address=request.getParameter("address");
		String street=request.getParameter("street");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		String secque=request.getParameter("secque");
		String ans=request.getParameter("ans");
		PrintWriter pw=response.getWriter();
		
		Customer c=new Customer();
		c.setName(name);
		c.setGender(gender);
		c.setPassword(password);
		c.setEmail(email);
		c.setCont_no(cont_no);
		c.setAddress(address);
		c.setStreet(street);
		c.setCity(city);
		c.setState(state);
		c.setCountry(country);
		c.setPincode(pincode);
		c.setSecque(secque);
		c.setAns(ans);
		
		LinkedList<Customer> lst=new LinkedList<Customer>();
		lst.add(c);
		
		try{
			int i=reg.Register(lst);
			if(i==1)
			{
				String msg="REGISTERATION DONE SUCCESSFULLY";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			else if(i==2)
			{
				String msg="This Emailid is Already Registered";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Registration.jsp").forward(request, response);	
			}
			else
			{
				String msg="Sorry Registeration failed...Try Again";
				request.setAttribute("message", msg);
				request.getRequestDispatcher("Registration.jsp").forward(request, response);	
			}
			
		}
		catch(Exception ex){
			
			String msg="Sorry Registeration failed...Try Again";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Registration.jsp").forward(request, response);	
		}
		
		/*GuestUser g=new GuestUser();
		boolean i=g.register(name,gender,password,email,cont_no,address,street,city,state,country,pincode,secque,ans);
		 if(i)
		 {
			 pw.println("REGISTERATION DONE SUCCESSFULLY");
		 	 request.getRequestDispatcher("Registration.jsp").include(request,response);
		 }
		 else
		 {
			
			 pw.println("REGISTERATION NOT DONE PLEASE RETRY");
		 	 request.getRequestDispatcher("Registration.jsp").include(request,response);
		 } */
		
		
		
	}

}
