package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.jdbc.Customerjdbc;

/**
 * Servlet implementation class Securityques
 */
public class Securityques extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Securityques() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String Emailid=request.getParameter("emailid").toLowerCase();
		String question=request.getParameter("ques");
		String ans=request.getParameter("ans");
		Customerjdbc cd=new Customerjdbc();
		System.out.println(Emailid+" "+question+" "+" "+ans);
		int t=cd.forgotpass(Emailid,question, ans);
		if(t==1)
		{
			/*String msg="";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("changepass.jsp").forward(request, response);*/
		
			HttpSession sess=request.getSession();
			sess.setAttribute("email", Emailid);
			response.sendRedirect("changepass.jsp");
			
		}
		else if(t==2)
		{
			
			String msg="Security Answer is Wrong";
			request.setAttribute("message", msg);			
			request.getRequestDispatcher("Forgot.jsp").forward(request, response);
			
		}
		
		else
		{
			
			String msg="Wrong information try again......";
			request.setAttribute("message", msg);			
			request.getRequestDispatcher("Forgot.jsp").forward(request, response);
			
			
		}
	}

}
