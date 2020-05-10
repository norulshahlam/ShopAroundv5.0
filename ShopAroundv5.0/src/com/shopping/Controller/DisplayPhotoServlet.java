package com.shopping.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class DisplayPhotoServlet
 */
public class DisplayPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayPhotoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   /* protected void processRequest(HttpServletRequest request, HttpServletResponse response,int pid)
    	    throws ServletException, IOException {
    	//PrintWriter out = response.getWriter();
    	        try {
    	        	
    	        	int id=Integer.parseInt(request.getParameter("pid"));
    	            Class.forName("oracle.jdbc.driver.OracleDriver");
    	            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Govind", "Newuser123");
    	            PreparedStatement ps = con.prepareStatement("select Photo from Productimg where pid=?");
    	            //out.println("<h1>Photos</h1>");
    	            ps.setInt(1,id);
    	            ResultSet rs = ps.executeQuery();
    	            
    	            while( rs.next())
    	            {
    	            	
    	           
    	            Blob  b = rs.getBlob("photo");
    	            response.setContentType("image/jpg");
    	           
    	            response.setContentLength( (int) b.length());
    	            InputStream is = b.getBinaryStream();
    	            OutputStream os = response.getOutputStream();
    	            byte buf[] = new byte[(int) b.length()];
    	            is.read(buf);
    	          
    	            os.write(buf);
    	            os.close();
    	            }
    	        }
    	        catch(Exception ex) {
    	             System.out.println(ex.getMessage());
    	        }
    	    } */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	       int id=Integer.parseInt(request.getParameter("pid"));
    	       Connection con=Connect.getConnect();
    	        try {
    	        	
    	        	
    	        	PreparedStatement ps = con.prepareStatement("select photo from productimg where pid =?");
    	            ps.setInt(1,id);
    	            ResultSet rs = ps.executeQuery();
    	            rs.next();
    	            Blob  b = rs.getBlob("photo");
    	            response.setContentType("image/jpeg");
    	            
    	            response.setContentLength( (int) b.length());
    	            InputStream is = b.getBinaryStream();
    	            OutputStream os = response.getOutputStream();
    	            byte buf[] = new byte[(int) b.length()];
    	            is.read(buf);
    	          
    	           
    	            os.write(buf);
    	            
    	            os.close();
    	        }
    	        catch(Exception ex) {
    	        	
    	        	String msg="Sorry Error Occurred in placing Order try later..";
    				request.setAttribute("message", msg);
    				request.getRequestDispatcher("AdminAddImage.jsp").forward(request, response);
    			
    	             System.out.println(ex.getMessage());
    	        }
    	        finally
    	        {
    	        	try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
    	        }
    	    } 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}*/

}
