package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateProductjdbc
{
	int i=0;
	public int updateProduct(String pname,int qty,double prc)
	{

		Connection con=Connect.getConnect();
		try
		{
			
			PreparedStatement pstmt=null,pstmt1;
			pstmt = con.prepareStatement("select pid  from product where pname=?");
			pstmt.setString(1, pname);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {


				pstmt1=con.prepareStatement("UPDATE Product SET Pqty=pqty+?,Pprice=? WHERE Pid=?");
				pstmt1.setInt(1, qty);
				pstmt1.setDouble(2, prc);
				pstmt1.setInt(3,rs.getInt(1) );
				i=pstmt1.executeUpdate();
				System.out.println("Sucess"+i);
			}
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
