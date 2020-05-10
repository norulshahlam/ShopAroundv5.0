package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.bean.AESencrp;

import com.shopping.jdbc.Connect;
import com.shopping.jdbc.Customerjdbc;
import com.shopping.jdbc.Loginjdbc;

/**
 * Servlet implementation class LoginValidate
 */
public class LoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		String Emailid=request.getParameter("emailid").toLowerCase();
		String Password=request.getParameter("password");
		String username = null;
		int cid=0;
		String url=request.getHeader("referer");
		System.out.println("url :"+url);
		PreparedStatement pstmt;
		Connection con=Connect.getConnect();
		System.out.println("email"+Emailid +"pass" +Password);
		Loginjdbc cd=new Loginjdbc();
		int flag=cd.check(Emailid,Password);
		if(flag==2)
		{
			try 
			{
				pstmt = con.prepareStatement("SELECT * from admin where uemailid=?");
				pstmt.setString(1, Emailid);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					username=rs.getString("aname");
					cid=rs.getInt("aid");
				}
				HttpSession session=request.getSession();
				session.setAttribute("uname",username);
				session.setAttribute("cid",cid);
				
				Cookie ck=new Cookie("cid",""+cid);//creating cookie object  
				response.addCookie(ck);
				//Cookie ck=new Cookie("cid",cid);
				response.addCookie(ck);
				request.getRequestDispatcher("Admin.jsp").include(request,response);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		else if(flag==1)
		{
			try 
			{
				pstmt = con.prepareStatement("SELECT * from Customer where uemailid=?");
				pstmt.setString(1, Emailid);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next())
				{
					username=rs.getString("cname");
					cid=rs.getInt("cid");
				}
				HttpSession session=request.getSession();
				session.setAttribute("uname",username);
				session.setAttribute("cid",cid);
				
				Cookie ck=new Cookie("cid",""+cid);//creating cookie object  
				response.addCookie(ck);
				
				//session.setAttribute("qty", );
				request.getRequestDispatcher("Home.jsp").include(request,response);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		else
		{
			String msg="Invalid login credential try again....";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("Login.jsp").forward(request,response);
			//pw.println("<script>window.alert('Invalid login credential try again.. ')</script>");
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	}


