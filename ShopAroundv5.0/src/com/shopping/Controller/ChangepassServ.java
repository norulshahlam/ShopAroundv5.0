package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.bean.AESencrp;
import com.shopping.jdbc.ChangePassword;
import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class ChangepassServ
 */
public class ChangepassServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangepassServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		int i=0;
		String newpass=request.getParameter("newpass");
		ChangePassword cp=new ChangePassword();
		HttpSession sess=request.getSession(false);
		
		String email=sess.getAttribute("email").toString();
		i=cp.changePass(newpass,email);
		PrintWriter out = response.getWriter();
		
		if (i!=0)
		{

		   String msg="Password Updated Successfully..";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		
           //out.println("<script>window.alert('Password Updated Successfully.. ')</script>");
		}
		else
		{
			String msg="Not Able To Change Password";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("changepass.jsp").forward(request, response);
			
		}
		
	
		// TODO Auto-generated method stub
	}

}
