package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.shopping.bean.Customer;

public class Calunitpricejdbc {
	
	
	public boolean calculate(int cid,int pid,int qty) {
		
		Connection con=Connect.getConnect();
		
		int i=0,j=0;
		 double price=0;
		 double tprice=0;
		
		  PreparedStatement stmt1,stmt2;
			try {
				 con.setAutoCommit(false);
				 stmt1 = con.prepareStatement("SELECT * from product where pid=?");
				 stmt1.setInt(1, pid);
			 	 ResultSet rs = stmt1.executeQuery();
				 if(rs.next())
				 {
					 price=rs.getDouble("pprice");
					 tprice=qty*price;
				 }
								 
				 stmt2 = con.prepareStatement("SELECT * from cart where pid=? and cid=?");
				 stmt2.setInt(1, pid);
				 stmt2.setInt(2, cid);
			 	 ResultSet rs2 = stmt2.executeQuery();
				 if(rs2.next())
				 {
					 
					 PreparedStatement stmt=con.prepareStatement("UPDATE CART SET cqty=?,cprize=?,ctotal=? where pid=? and cid=?");
					 qty=qty+rs2.getInt("cqty");
					 stmt.setInt(1,qty);
					 price=price+rs2.getDouble("cprize");
					 stmt.setDouble(2,price);
					 tprice=tprice+rs2.getDouble("ctotal");
					 stmt.setDouble(3,tprice);
					 stmt.setInt(4, pid);
					 stmt.setInt(5, cid);
					 i=stmt.executeUpdate();
					 
				 }
				 else
				 {
					 PreparedStatement stmt=con.prepareStatement("INSERT INTO cart VALUES(?,?,?,?,?)");
					 stmt.setInt(1, cid);
					 stmt.setInt(2,pid);
					 stmt.setInt(3,qty);
					 stmt.setDouble(4,price);
					 stmt.setDouble(5,tprice);
					 i=stmt.executeUpdate();
				 }
				 System.out.println("record updated");
				 con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				con.rollback();
				e.printStackTrace();
			}
			finally{
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(i>0)
				{
					return true;
				}
				else
					return false;
				
			}
		 	
	}

}
