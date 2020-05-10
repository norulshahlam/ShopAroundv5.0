package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.shopping.bean.Address;
import com.shopping.bean.Customer;

public class Customerjdbc {
	
	public int addreview(int cid,String pname,String review)
	{
		int i=0;
		Connection con = con=Connect.getConnect();
		try
		{
			
			PreparedStatement pstmt = con.prepareStatement("select pid  from PRODUCT where pname=?");
			pstmt.setString(1, pname);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				PreparedStatement pstmt1 = con.prepareStatement("insert into review values(?,?,?,sysdate)");
				pstmt1.setInt(1,cid);
				pstmt1.setInt(2,rs.getInt(1));
				pstmt1.setString(3,review);
				i=pstmt1.executeUpdate();
			}
			
		}
		 catch (SQLException e) {
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
			if(i!=0)
				return 1;
			else 
				return 0;
		}
	}
	public LinkedList<Customer> getCustomer(int cid) {
		Connection con=Connect.getConnect();
		LinkedList<Customer> list= new LinkedList<Customer>();
		PreparedStatement pstmt;
		Customer a = new Customer();
		try {
			pstmt = con.prepareStatement("select *  from CUSTOMER where Cid=?");
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("cname");
				String emailId = rs.getString("uemailid");
				long mobno = rs.getLong("ccontact_number");
				String gender= rs.getString("cgender");
				a.setName(name);
				a.setEmail(emailId);
				a.setCont_no(mobno);
				a.setGender(gender);
				list.add(a);

			}
			//con.close();
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
			
		}
		return list;
	}
	public LinkedList<Customer> getAddress(int cid) {
		Connection con=Connect.getConnect();
		LinkedList<Customer> list= new LinkedList<Customer>();
		PreparedStatement pstmt;
		Customer a = new Customer();
		try {
			pstmt = con.prepareStatement("select *  from CUSTOMER where Cid=?");
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String address= rs.getString("caddress");
				String street= rs.getString("cstreet");
				
				String city = rs.getString("city");
				String state = rs.getString("state");
				String country = rs.getString("country");
				int zip = rs.getInt("zip");
				
				a.setAddress(address);
				a.setStreet(street);
				a.setCity(city);
				a.setState(state);
				a.setCountry(country);
				a.setPincode(zip);
			
				list.add(a);

			}
			//con.close();
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
		}
		return list;
	}
	
	public int forgotpass(String emailid,String ques,String ans)
	{
		Connection con=Connect.getConnect();
		int flag=0;
		PreparedStatement pstmt;
		try {
			System.out.println(emailid+" "+ques+" "+" "+ans);
			pstmt = con.prepareStatement("SELECT security_quest,answer from customer where uemailid=?");
			pstmt.setString(1, emailid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())	
			{					
				if(rs.getString(1).equals(ques))
					{
						if(rs.getString(2).equals(ans))
						{
							flag=1;
					//break;
						}
						else
						{
							
							flag=2;
						}
					}
				else
				{	flag=0;
			
				}
			} 
			else
				flag=0;
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return 0;
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
	public boolean setAddress(LinkedList<Address> lst,int cid) {
		Connection con=Connect.getConnect();
		Address a=(Address)lst.get(0);
		int i=0;
		
		/*LinkedList<Customer> list= new LinkedList<Customer>();
		
		Customer a = new Customer();*/
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement("update CUSTOMER set caddress=?,cstreet=?,city=?,state=?,country=?,zip=? where Cid=?");
			pstmt.setString(1, a.getAddress());
			pstmt.setString(2, a.getStreet());
			System.out.println(a.getStreet());
			pstmt.setString(3, a.getCity());
			pstmt.setString(4, a.getState());
			pstmt.setString(5, a.getCountry());
			pstmt.setInt(6, a.getZip());
			pstmt.setInt(7, cid);
			i=pstmt.executeUpdate();
			System.out.println("record updated");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				
			}
			if(i!=0)
				return true;
			else
				return false;
			
		}
		
	}


}
