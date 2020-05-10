package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.bean.AESencrp;

public class Loginjdbc {
	public int flag;
	
	public int check(String emailid,String password)
	{
		Connection con=Connect.getConnect();

		PreparedStatement pstmt;
		try {
			String q="SELECT * from Login where uemailid=?";
			pstmt = con.prepareStatement(q);
			pstmt.setString(1, emailid);
			//pstmt.setString(, password);
			ResultSet rs=pstmt.executeQuery();
			System.out.println("tested");
			while(rs.next())
			{
				String pass = AESencrp.decrypt(rs.getString(3));
				System.out.println("decs----"+pass);
				if(rs.getString(1).equals(emailid) && pass.equals(password))
				{ 
					if(rs.getString("urole").equalsIgnoreCase("admin"))
						flag=2;
					else
						flag=1;
					break;
				}
				else
					flag=0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			return flag;
		}
		
	}

}
