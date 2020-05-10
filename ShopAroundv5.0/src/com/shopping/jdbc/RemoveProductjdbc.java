package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RemoveProductjdbc
{
	int i=0;
	public int removeProduct(String pname)
	{
		Connection con=Connect.getConnect();
	try
    {
		
		PreparedStatement pstmt=null;
		//pstmt.executeUpdate("SELECT Pid.NEXTVAL FROM Product");
		pstmt=con.prepareStatement("DELETE Product WHERE pname=?");
		pstmt.setString(1, pname);
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