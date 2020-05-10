package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.lang.model.type.PrimitiveType;

import com.shopping.bean.AESencrp;

public class ChangePassword {
	
	public int changePassword(String oldpass,String newpass,int cid)
	{
		Connection con=Connect.getConnect();
		int i=0;
		try
		{
			
			
			String email = null;
			PreparedStatement pstmt=null,pstmt2;
			pstmt2=con.prepareStatement("SELECT uemailid from customer where cid=?");
			pstmt2.setInt(1,cid);
			ResultSet rs1=pstmt2.executeQuery();
			if(rs1.next())
			{
				email=rs1.getString(1);
			}
			
			pstmt=con.prepareStatement("SELECT  Password from Login where uemailid=?");
			pstmt.setString(1,email);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				
				if(oldpass.equals(AESencrp.decrypt(rs.getString(1))))
				{
					
					PreparedStatement pstmt1=null;
					 String passwordEnc = AESencrp.encrypt(newpass);
					pstmt1=con.prepareStatement("UPDATE Login SET Password=? where uemailid=?");
					pstmt1.setString(1,passwordEnc);
					pstmt1.setString(2,email);
					pstmt1.executeUpdate();
					i=1;
				}
				else
				{
					i=0;
				}
			}
			else
			{
				i=2;
			}
			//con.close();
		return i;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return i;
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
		
	}
	public int changePass(String newpass,String email)
	{
		int i=0;
		Connection con=Connect.getConnect();
		try
		{
			
			
			PreparedStatement pstmt1=null;
			String passwordEnc = AESencrp.encrypt( newpass);
			pstmt1=con.prepareStatement("UPDATE Login SET Password=? where uemailid=?");
			pstmt1.setString(1,passwordEnc);
			pstmt1.setString(2,email);
			i=pstmt1.executeUpdate();
			con.close();
		return i;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return i;
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
		
	}


}


