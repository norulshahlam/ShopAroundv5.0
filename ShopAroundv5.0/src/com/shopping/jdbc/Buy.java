package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Buy {
	
	String htm=null;

	public String getOrderDetails(int oid) {
		
		Transaction tc =new Transaction();
		double shipcost=0;
		int amt=tc.getOtotal(oid);
		Connection con=Connect.getConnect();
		try
		{
			
			PreparedStatement stmt2=con.prepareStatement("select shipcost from shipment where oid=?");
			stmt2.setInt(1,oid);
			//System.out.println("ADD TO THE DATABASE");
			 ResultSet rs2= stmt2.executeQuery();
			if(rs2.next())
			{
				shipcost=rs2.getDouble(1);
			}
		
		
			
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement("SELECT  * from OrderDetails where oid=?");
			pstmt.setInt(1, oid);
			
			ResultSet rs= pstmt.executeQuery();
			htm="<table align='center' border=1 style='color: #000000'; ><br/><br/>";
			htm+="<center><h2>Order Id= "+oid+"</h2></center>";
			htm+="<br><h3>ORDER DETAILS</h3><br><tr ><td style='color: #000000; font-size: 18px; width: 115px'>Product Name</td><td style='color: #000000; font-size: 18px; width: 70px'>Price</td><td style='color: #000000; font-size: 18px; width: 70px'>Quantity</td><td style='color: #000000; font-size: 18px; width: 70px'>AMOUNT</td></tr>";
			
			while(rs.next())
			{
				htm+="<tr><th>"+rs.getString(3)+"</th>"+
						"<th>"+rs.getInt(4)/rs.getInt(5)+"</th>"+
						"<th>"+rs.getInt(5)+"</th>"+
						"<th>"+rs.getInt(4)*rs.getInt(5)+"</th>";
							
			}
			
			htm+="</table>";
			htm+="<br/><center><h3>TOTAL AMOUNT :"+amt+"</h3></center><br/>";
			htm+="<center><h3>SHIPPING COST :"+shipcost+"</h3></center><br/>";
			htm+="<table align='center' border=2 style='color: #000000';><br><tr><td>Shipment Address</td>&nbsp";
			
			PreparedStatement pstmt1=null;
			pstmt1=con.prepareStatement("SELECT  * from Shipment where oid=?");
			pstmt1.setInt(1, oid);
			ResultSet rs1= pstmt1.executeQuery();
			
			while(rs1.next())
			{
				htm+="<td>"+rs1.getString(4)+", "+rs1.getString(5)+"<BR>"+rs1.getString(6)+", "+rs1.getString(7)+"<br>"+rs1.getString(8)+"<br>Pincode: "+rs1.getInt(9)+"</td></tr>";
			}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
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
		return htm;
		
	}

}

