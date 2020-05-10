package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Shippingadd {


	public String getAddr(int cid){

		String s="";
		Connection conn=Connect.getConnect();
		try
		{
			
			PreparedStatement stmt=conn.prepareStatement("select caddress,cstreet,city,zip,state,country from customer where cid=?");
			//System.out.println("ADD TO THE DATABASE");
			stmt.setInt(1, cid);
			ResultSet rs= stmt.executeQuery();

			while(rs.next())
			{
				s="<tr><td>ADDRESS:</td><td>"+rs.getString(1)+"</td></tr>"+
						"<tr><td>STREET:</td><td>"+rs.getString(2)+"</td></tr>"+
						"<tr><td>CITY:</td><td>"+rs.getString(3)+"</td></tr>"+
						"<tr><td>PIN:</td><td>"+rs.getInt(4)+"</td></tr>"+
						"<tr><td>STATE:</td><td>"+rs.getString(5)+"</td></tr>"+
						"<tr><td>COUNTRY:</td><td>"+rs.getString(6)+"</td></tr>";

				return s;
			}


			//conn.close();

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return s;
	}
	public int oldAdd(int cid,int oid){
		int i=0;
		double totalweight=0;
		double shipcost=0;
		//int oid=1;
		//int cid=1;
		Connection conn=Connect.getConnect();

		try
		{
			
			PreparedStatement stmt=conn.prepareStatement("select caddress,cstreet,city,zip,state,country from customer where cid=?");
			stmt.setInt(1,cid);
			//System.out.println("ADD TO THE DATABASE");
			ResultSet rs= stmt.executeQuery();

			while(rs.next())
			{
				String add=rs.getString(1);
				String street=rs.getString(2);
				String city=rs.getString(3);
				int pin=rs.getInt(4);
				String state=rs.getString(5);
				String country=rs.getString(6);

				PreparedStatement stmt2=conn.prepareStatement("Select * from Shipment where cid=? AND oid=?");
				stmt2.setInt(1, cid);
				stmt2.setInt(2, oid);
				ResultSet rs2=stmt2.executeQuery();
				if(rs2.next())
				{
					PreparedStatement stmt1=conn.prepareStatement("Update Shipment set shipaddress=?,shipstreet=?,shipcity=?,shipstate=?,shipcountry=? ,shipzip=? where cid=? and oid=?");

					stmt1.setString(1, add);
					stmt1.setString(2, street);
					stmt1.setString(3, city);
					stmt1.setString(4, state);
					stmt1.setString(5,country);
					stmt1.setInt(6, pin);
					stmt1.setInt(7, cid);
					stmt1.setInt(8, oid);
					i=stmt1.executeUpdate();
				}
				else
				{		
					
					PreparedStatement stmt3=conn.prepareStatement("SELECT pid FROM ORDERDETAILS WHERE OID=?");
					stmt3.setInt(1,oid);
					ResultSet rs3=stmt3.executeQuery();
					while(rs3.next())
					{
						PreparedStatement stmt4=conn.prepareStatement("SELECT pweight FROM product WHERE pid=?");
						stmt4.setInt(1,rs3.getInt(1));
						ResultSet rs4=stmt4.executeQuery();
						if(rs4.next())
						{
							totalweight+=rs4.getDouble(1);
						}
					}
					
					
					if(totalweight<=2)
					{
						
						shipcost=0;
						
					}
					
					else if(totalweight>2 && totalweight<7){
						
						shipcost=200;
						
					}
					else if(totalweight>7 && totalweight<14){
						
						shipcost=1000;
						
					}
					
					else{
						
						shipcost=2000;
					}
					PreparedStatement stmt1=conn.prepareStatement("insert into shipment values(Shipid.nextval,?,?,?,?,?,?,?,?,?,?)");

					stmt1.setInt(1,oid);
					stmt1.setInt(2,cid);
					stmt1.setString(3,add);
					stmt1.setString(4,street);
					stmt1.setString(5,city);

					stmt1.setString(6,state);
					stmt1.setString(7,country);
					stmt1.setInt(8, pin);
					stmt1.setString(9,"proceed");
					stmt1.setDouble(10,shipcost);

					i=stmt1.executeUpdate();
				}
				System.out.print(i);
				return i;
			}


			//conn.close();
			return i;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}
	public int NewAddr(String add,String street,String city,int pin ,String state,String country,int cid,int oid){
		int i=0;
		double shipcost=0;
		double totalweight=0;
		//int oid=1;
		//int cid=1;
		Connection conn=Connect.getConnect();
		try
		{

			

			PreparedStatement stmt2=conn.prepareStatement("Select * from Shipment where cid=? AND oid=?");
			stmt2.setInt(1, cid);
			stmt2.setInt(2, oid);
			ResultSet rs=stmt2.executeQuery();
			if(rs.next())
			{
				PreparedStatement stmt1=conn.prepareStatement("Update Shipment set shipaddress=?,shipstreet=?,shipcity=?,shipstate=?,shipcountry=? ,zip=? where cid=? and oid=?");

				stmt1.setString(1, add);
				stmt1.setString(2, street);
				stmt1.setString(3, city);
				stmt1.setString(4, state);
				stmt1.setString(5,country);
				stmt1.setInt(6, pin);
				stmt1.setInt(7, cid);
				stmt1.setInt(8, oid);
				i=stmt1.executeUpdate();
			}
			else
			{
				
				PreparedStatement stmt3=conn.prepareStatement("SELECT pid FROM ORDERDETAILS WHERE OID=?");
				stmt3.setInt(1,oid);
				ResultSet rs3=stmt3.executeQuery();
				while(rs3.next())
				{
					PreparedStatement stmt4=conn.prepareStatement("SELECT pweight FROM product WHERE pid=?");
					stmt4.setInt(1,rs3.getInt(1));
					ResultSet rs4=stmt4.executeQuery();
					if(rs4.next())
					{
						totalweight+=rs4.getDouble(1);
					}
				}
				
				
				if(totalweight<=2)
				{
					
					shipcost=0;
					
				}
				
				else if(totalweight>2 && totalweight<7){
					
					shipcost=200;
					
				}
				
				else if(totalweight>7 && totalweight<14){
					
					shipcost=1000;
					
				}
				
				else{
					
					shipcost=2000;
				}

				PreparedStatement stmt1=conn.prepareStatement("Insert into Shipment values(Shipid.nextval,?,?,?,?,?,?,?,?,?,?)");
				stmt1.setInt(1, oid);
				stmt1.setInt(2, cid);
				stmt1.setString(3, add);
				stmt1.setString(4, street);
				stmt1.setString(5, city);
				stmt1.setString(6, state);
				stmt1.setString(7,country);
				stmt1.setInt(8, pin);
				stmt1.setString(9,"proceed");
				stmt1.setDouble(10,shipcost);
				i=stmt1.executeUpdate();
			}

			//conn.close();
			return i;
		}

		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}

}
