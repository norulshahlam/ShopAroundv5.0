package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	//static
	public static Connection getConnect()
	{
		 Connection conn=null;
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashmita","ashmita");
			//System.out.println("Connection Done");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			return conn;
		}
		
		
	}

}
