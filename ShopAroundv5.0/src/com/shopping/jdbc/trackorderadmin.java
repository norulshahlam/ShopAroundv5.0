package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class trackorderadmin {
	
	
	public int gettrackorder(int orderid,String shipstatus) throws SQLException{
		
		
		int i=0;
		 Connection con =con=Connect.getConnect();
	
	try {
		 
			PreparedStatement pstmt = con.prepareStatement("UPDATE SHIPMENT SET SHIPSTATUS =? WHERE OID =?");
			pstmt.setString(1,shipstatus ); 
			pstmt.setInt(2,orderid);
            i=pstmt.executeUpdate();
          System.out.println("Order shipment status is changed  sucessfully!"); 
      }
     
	catch(Exception e){ 
		System.out.print(e); 
		e.printStackTrace(); 
		}
	finally
	{
		con.close();
		if(i!=0)
			return 1;
		else 
			return 0;
	
	}
	}
}
