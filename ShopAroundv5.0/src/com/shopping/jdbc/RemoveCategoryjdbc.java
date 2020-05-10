package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RemoveCategoryjdbc
{
	int i=0;
	public int removeCategory(String catname)
	{
		Connection con=Connect.getConnect();
	try
    {
		
		PreparedStatement pstmt=null;
//pstmt.executeUpdate("SELECT Pid.NEXTVAL FROM Product");
pstmt=con.prepareStatement("DELETE Category WHERE Catname=?");
pstmt.setString(1, catname);
 i=pstmt.executeUpdate();
System.out.println("Sucess"+i);
    }
	catch(Exception e)
	{
		System.out.println(e);
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
	return i;
	}
	


}
