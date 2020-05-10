package com.shopping.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shopping.jdbc.Connect;

/**
 * Servlet implementation class AdminAddImageServ
 */
public class AdminAddImageServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddImageServ() {
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
		 Connection con=Connect.getConnect();
		response.setContentType("text/html;charset=UTF-8");
		//int cid=Integer.parseInt(request.getParameter("cid"));
        PrintWriter out = response.getWriter();
        int i=0;
        try {
            // Apache Commons-Fileupload library classes
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);

            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
            
            // parse request
            List items = sfu.parseRequest(request);
            FileItem  pid = (FileItem) items.get(0);
            String photoid =  pid.getString();
            
            FileItem  cid = (FileItem) items.get(1);
            String caid =  cid.getString();
            
            FileItem title = (FileItem) items.get(2);
            String   phototitle =  title.getString();

            // get uploaded file
            FileItem file = (FileItem) items.get(3);
       
            // Connect to Oracle
          
            con.setAutoCommit(false);
            String url=request.getParameter("photo");
            String url1=file.toString();
            PreparedStatement ps1 = con.prepareStatement("select * from productimg where pid=?");
            ps1.setInt(1, Integer.parseInt(photoid));
            ResultSet rs1=ps1.executeQuery();
            if(rs1.next())
            {
            	PreparedStatement ps2 = con.prepareStatement("delete from Productimg where pid=?");
                ps2.setInt(1, Integer.parseInt(photoid));
                i=ps2.executeUpdate();
            	
            	
            	PreparedStatement ps = con.prepareStatement("insert into Productimg values(?,?,?,?)");
            ps.setInt(1, Integer.parseInt(photoid));
            ps.setInt(2, Integer.parseInt(caid));
            ps.setString(3, phototitle);
            
            // size must be converted to int otherwise it results in error
            ps.setBinaryStream(4, file.getInputStream(), (int) file.getSize());
            i=ps.executeUpdate();
            // size must be converted to int otherwise it results in error
            }
            else
            {
            PreparedStatement ps = con.prepareStatement("insert into Productimg values(?,?,?,?)");
            ps.setInt(1, Integer.parseInt(photoid));
            ps.setInt(2, Integer.parseInt(caid));
            ps.setString(3, phototitle);
            
            // size must be converted to int otherwise it results in error
            ps.setBinaryStream(4, file.getInputStream(), (int) file.getSize());
            i=ps.executeUpdate();
            }
            con.commit();
           // con.close();
           // out.print(url1);
		
            String msg="Photo Added Successfully.. ";
			request.setAttribute("message", msg);
			request.getRequestDispatcher("AdminAddImage.jsp").forward(request, response);
        }
        catch(Exception ex) {
        	
        	 String msg="Photo Not Added Successfully.. ";
 			request.setAttribute("message", msg);
            request.getRequestDispatcher("AdminAddImage.jsp").include(request, response);
            System.out.println(ex);
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

	
	}


