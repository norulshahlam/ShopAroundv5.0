package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.ChangePassword;

/**
 * Servlet implementation class ChangePasswordServ
 */
public class ChangePasswordServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServ() {
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
		HttpSession session=request.getSession(false);
		int cid=Integer.parseInt(session.getAttribute("cid").toString());
		
		System.out.println(cid+"");
		response.setContentType("text/html");
		int i=0;
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		
		ChangePassword cp=new ChangePassword();
		i=cp.changePassword(oldpass,newpass,cid);
		PrintWriter out = response.getWriter();
		
		
		if (i==1)
		{
		   
		   String msg="Password Updated Successfully..";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Myaccount.jsp").forward(request, response);
	
           //out.println("<script>window.alert('Password Updated Successfully.. ')</script>");
		}
		else if(i==0)
		{
		    String msg="Old Password entered is incorrect!! ";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Myaccount.jsp").forward(request, response);
	
		}
		else if(i==2)
		{
			String msg="You are not a registered User!!";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Myaccount.jsp").forward(request, response);
	
		}
		
	}

}
