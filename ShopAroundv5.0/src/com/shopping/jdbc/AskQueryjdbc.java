package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AskQueryjdbc {
	public int askQuery(int Cid, String ques) {
		int i=0;
		Connection con = Connect.getConnect();
		try {

			
			PreparedStatement pstmt = null;
			pstmt = con
					.prepareStatement("INSERT INTO Support (Qid,Cid,Question,Answer)VALUES(Qid.nextval,?,?,null)");
			pstmt.setInt(1, Cid);

			pstmt.setString(2, ques);
			i = pstmt.executeUpdate();
			System.out.println(i + " Rows Inserted Successfully");
		} catch (Exception e) {
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
			if(i!=0)
				return 1;
			else
				return 0;
		}
	}

}
