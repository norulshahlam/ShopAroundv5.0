package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddProductjdbc
{

	public int addProduct(String catname,String pname,double wt,double prc,int qty,String prdes)
	{int catid=0;
	int i=0;
	Connection con=Connect.getConnect();
	try
	{
		
		PreparedStatement pstmt=null,pstmt1;
		pstmt = con.prepareStatement("select catid  from category where catname=?");
		pstmt.setString(1, catname);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			pstmt1=con.prepareStatement("INSERT INTO Product (Catid,Pid,Pname,Pprice,Pweight,Pqty,Pdes)VALUES(?,Pid.nextval,?,?,?,?,?)");
			pstmt1.setInt(1,rs.getInt(1));
			//pstmt.setInt(2,Pid.nextval);
			pstmt1.setString(2,pname);
			pstmt1.setDouble(3,prc); 
			pstmt1.setDouble(4,wt); 
			pstmt1.setInt(5,qty);
			pstmt1.setString(6,prdes);
			i=pstmt1.executeUpdate();
			System.out.println(i+" Rows Inserted Successfully");
		   }
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	finally{
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i!=0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		
	}	
	}
	}
