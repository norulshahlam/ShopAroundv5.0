package com.shopping.jdbc;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.shopping.bean.Cart;

public class Cartjdbc {
	
	public LinkedList<Cart> getCart(int cid) {
		Connection con=Connect.getConnect();
		LinkedList<Cart> list= new LinkedList<Cart>();
		PreparedStatement st,pstmt1;
		int i = 0;
		System.out.println("CUST id--->" + cid);
		//Order_bean o=new Order_bean();
		try {
			//st = (Statement) con.createStatement();
			st=con.prepareStatement("select count(pid)  from CART GROUP BY cid HAVING cid=?");
			st.setInt(1, cid);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				i = rs.getInt(1);
				System.out.println("Customer--- " + i);
				System.out.println(rs.getInt(1));
			}
			st = con.prepareStatement("select * from CART where cid=?");
			st.setInt(1, cid);
			Cart a1[] = new Cart[i];
			ResultSet rs1 = st.executeQuery();
			pstmt1 = con.prepareStatement("SELECT *  FROM PRODUCT where pid=?");
			while (rs1.next()) {
				int j = 0;
				Cart a = new Cart();
				a1[j] = new Cart();
				int pid = rs1.getInt("pid");
				pstmt1.setInt(1, rs1.getInt("pid"));
				ResultSet rs2 = pstmt1.executeQuery();
				rs2.next();
				String pname=rs2.getString("pname");
				int cqty = rs1.getInt("cqty");
				double cprice=rs1.getDouble("cprize");
				double ctotal= rs1.getDouble("ctotal");
				
				a1[j].setPid(pid);
				a1[j].setPname(pname);
				a1[j].setCprice(cprice);
				a1[j].setCqty(cqty);
				a1[j].setCtotal(ctotal);
				list.add(a1[j]);
				j++;
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
	
	public boolean cancelProduct(int pid, int cid){
		Connection con=Connect.getConnect();
		//LinkedList<Cart> list= new LinkedList<Cart>();
		int i=0;
		try {
			
			PreparedStatement pre=con.prepareStatement("DELETE FROM CART WHERE CID=? AND PID=?");
			pre.setInt(1, cid);
			pre.setInt(2, pid);
			i=pre.executeUpdate();
			con.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			
			if(i==0)
				return false;
			else
				return true;
			
			
		}

	}
	
	/*
	public LinkedList<Cart> getCart(int cid) {
		Connection con=Connect.getConnect();
		LinkedList<Cart> list= new LinkedList<Cart>();
		PreparedStatement pstmt,pstmt1;
		Cart a = new Cart();
		try {
			pstmt = con.prepareStatement("SELECT *  FROM CART where Cid=?");
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			pstmt1 = con.prepareStatement("SELECT *  FROM PRODUCT where pid=?");
			
			while (rs.next()) 
			{
				int pid = rs.getInt("pid");
				pstmt1.setInt(1, rs.getInt("pid"));
				ResultSet rs1 = pstmt1.executeQuery();
				int cqty = rs.getInt("cqty");
				double cprice=rs.getDouble("cprize");
				double ctotal= rs.getDouble("ctotal");
				String pname=rs1.getString("pname");
				a.setPid(pid);
				a.setCqty(cqty);
				a.setCprice(cprice);
				a.setCtotal(ctotal);
				a.setPname(pname);
				list.add(a);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	*/
	

}
