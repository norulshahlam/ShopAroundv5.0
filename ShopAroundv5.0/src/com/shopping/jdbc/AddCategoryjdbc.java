package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddCategoryjdbc {
	public int addCategory(int itemid, String cname) {
		int i=0;
		Connection con=Connect.getConnect();
		try {
			
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement("INSERT INTO Category (Itemid,Catid,Catname)VALUES(?,Cid.nextval,?)");
			pstmt.setInt(1, itemid);
			pstmt.setString(2, cname);
			i = pstmt.executeUpdate();
			System.out.println(i + " Rows Inserted Successfully");
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
		finally
		{try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(i!=0)
				return 1;
			else
				return 0;
			
		}
	}
}
