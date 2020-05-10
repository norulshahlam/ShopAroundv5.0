package com.shopping.jdbc;


	import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

	public class OrderDetail {
		
		
		public String getOrderDetail(int cid){
			
			String s="";	
			 
			Connection con=Connect.getConnect();
		      
		      
			try {
				
				
		         PreparedStatement stmt = con.prepareStatement("SELECT  * FROM ordr where cid=? AND ORDERSTATUS='Order Placed'");
		         stmt.setInt(1, cid);
		         ResultSet rs = stmt.executeQuery();
		         if(rs.next()){
		        	 
		        	 s="<table align='center' border=1><tr><th>ORDER ID</th>" +
					       		"<th>ORDER DATE</th>"+
					       		"<th>ORDER TOTAL</th>"+
					       		"<th>ORDER QUANTITY</th>"+
					       		"<th>ORDER STATUS</th></tr>";
	          do {
	            	 
	            	
		        	 
		             s+="<tr><th>"+rs.getInt(1)+"</th>"+
		            		 "<th>"+rs.getDate(2)+"</th>"+
		            		 "<th>"+rs.getInt(4)+"</th>"+
		            		 "<th>"+rs.getInt(5)+"</th>"+
		            		 "<th>"+rs.getString(6)+"</th></tr>";
		             
			            
		             }   while (rs.next());
		         
	             s+="</table align='center'>";
		         }
		         else
		         {
		        	 
		        	 s+="<center><h1>NO ORDER DETAILS</h1></center>";
		         }
	             return s;
		         
		      }
		      catch(Exception e){
		         System.out.println("SQL exception occured" + e);
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
			  return s;
		}

		}



