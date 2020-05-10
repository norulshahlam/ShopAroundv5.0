package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import com.shopping.bean.Cart;
import com.shopping.bean.Customer;
import com.shopping.bean.Product;

public class Orderjdbc {
	public int cancelOrder(int cid,int oid) throws Exception {
		Connection conn=Connect.getConnect();
		PreparedStatement pstmt1,pstmt2,pstmt3,pstmt4;
		int i=0,j=0,m=0,n=0;
		try
		{
			conn.setAutoCommit(false);
			pstmt4=conn.prepareStatement("DELETE FROM transaction WHERE cid=? and oid=?");
			pstmt4.setInt(1, cid);
			pstmt4.setInt(2, oid);
			n=pstmt4.executeUpdate();
			
			pstmt1=conn.prepareStatement("DELETE FROM SHIPMENT WHERE cid=? and oid=?");
			pstmt1.setInt(1, cid);
			pstmt1.setInt(2, oid);
			i=pstmt1.executeUpdate();
			
			pstmt2=conn.prepareStatement("DELETE FROM orderdetails WHERE oid=?");
			
			pstmt2.setInt(1, oid);
			j=pstmt2.executeUpdate();
			
			pstmt3=conn.prepareStatement("DELETE FROM ordr WHERE cid=? and oid=?");
			pstmt3.setInt(1, cid);
			pstmt3.setInt(2, oid);
			m=pstmt3.executeUpdate();
			
			
			
			conn.commit();

		 } catch (SQLException e) {
				// TODO Auto-generated catch block
				 conn.rollback();
				 e.printStackTrace();
				 return 0;
				 //e.printStackTrace();
				
			}
			finally
			{
				try {
					conn.close();
					conn.setAutoCommit(true);
					//conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(i!=0 && j!=0 && m!=0 && n!=0)
					return 1;
				else
					return 0;
				
			}
		
	}
	public int placeorder(int cid) throws Exception {
		
		
		Connection conn=Connect.getConnect();
		LinkedList<Cart> list= new LinkedList<Cart>();
		int i=0,j=0,m=0,n=0,o=0;
		 System.out.println("0");
		PreparedStatement pstmt,stmt1,stmt2,stmt3,stmt4,stmtt,stmt5,stmt,stmt6;
		ResultSet rs,rs1,rs2,rs3,rs4,rst,resl,rs5;
		Double totalprice=0.0;
		int qty=0,pqty = 0;
		int oid=0;
		String mydate=null,pname = null;
		int rowcount=0;
		try {
			
			 Cart p=new Cart();
			 conn.setAutoCommit(false);
			 System.out.println("1");
			 stmtt=conn.prepareStatement("SELECT count(*) FROM CART WHERE cid=?");
			 stmtt.setInt(1,cid);
			 rst=stmtt.executeQuery();
			 if( rst.next())
			 {
				 rowcount=rst.getInt(1);
			 }
			
			 
			 
			 stmt1=conn.prepareStatement("SELECT * FROM CART WHERE cid=?");
			 stmt1.setInt(1,cid);
			 Cart a1[] = new Cart[rowcount];
			 rs1=stmt1.executeQuery();
			
			
			 
			 pstmt = conn.prepareStatement("SELECT *  FROM PRODUCT where pid=?");
			 while(rs1.next())
			 {
				totalprice+=rs1.getDouble("ctotal");
				qty=qty+rs1.getInt("cqty");
				
				int k = 0;
				Cart a = new Cart();
				a1[k] = new Cart();
				int pid = rs1.getInt("pid");
				pstmt.setInt(1, rs1.getInt("pid"));
			    rs = pstmt.executeQuery();
				if(rs.next())
				{	
					
			     pname=rs.getString("pname");
				}
				int cqty = rs1.getInt("cqty");
				double cprice=rs1.getDouble("cprize");
				
				a1[k].setPid(pid);
				a1[k].setPname(pname);
				a1[k].setCprice(cprice);
				a1[k].setCqty(cqty);
				
				list.add(a1[k]);
				
				k++;
			 }
			/* 
			 stmt2=conn.prepareStatement("SELECT SYSDATE FROM DUAL");
			 rs2=stmt2.executeQuery();
			 if(rs2.next())
			 {
				 mydate=rs2.getString(1);
			 }*/
			
			 stmt3=conn.prepareStatement("INSERT INTO ordr VALUES(oid.nextval,sysdate,?,?,?,?)");
			 stmt3.setInt(1,cid);
		     stmt3.setDouble(2,totalprice);
			 stmt3.setInt(3,qty);
			 String str="Order Proceeded";
			 stmt3.setString(4,str);
			 i=stmt3.executeUpdate();
			 System.out.println("record updated");
			 
			 
			Cartjdbc aj = new Cartjdbc();
			LinkedList<Cart> list1 = new LinkedList<Cart>();
			list1 = aj.getCart(cid);
			Cart a[] = new Cart[list.size()];
			 
			 
			 for (int l = 0; l < list.size(); l++) {
					a[l] = (Cart) list.get(l);
				}
			 
			 
			 stmt4=conn.prepareStatement("INSERT INTO orderdetails VALUES(oid.currval,?,?,?,?)");
			 for (int l = 0; l < list.size(); l++) {
				 stmt4.setInt(1,a[l].getPid());
				 stmt4.setString(2,a[l].getPname());
			     stmt4.setDouble(3,a[l].getCprice());
				 stmt4.setInt(4,a[l].getCqty());
				/* stmt=conn.prepareStatement("select * from product where pid="+a[l].getPid());
				 resl=stmt.executeQuery();
				 if(resl.next())
				 {
					 pqty=resl.getInt(1);
				 }*/
				 stmt5=conn.prepareStatement("Update product SET pqty=pqty-"+a[l].getCqty()+" where pid=?");
				// pqty=pqty-a[l].getCqty();
				// stmt5.setInt(1,pqty);
				 stmt5.setInt(1,a[l].getPid());
				 m=stmt5.executeUpdate();
				 System.out.println("m="+m);
				 j=stmt4.executeUpdate();
			 }
			 
			 
			 System.out.println("record updated");
			 
			/* stmt2=conn.prepareStatement("DELETE FROM CART WHERE cid=?");
			 stmt2.setInt(1,cid);
			 n=stmt2.executeUpdate();
			 */
			 
			 stmt6=conn.prepareStatement("select oid.currval from dual");
			 rs5=stmt6.executeQuery();
			 if(rs5.next())
			 {
				 oid=rs5.getInt(1);
			 }
			 conn.commit();

		 } catch (SQLException e) {
				// TODO Auto-generated catch block
				 conn.rollback();
				 e.printStackTrace();
				 return 0;
				 //e.printStackTrace();
				
			}
			finally
			{
				try {
					conn.close();
					conn.setAutoCommit(true);
					//conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(i!=0 && j!=0 && m!=0)// && n!=0)
					return oid;
				else
					return 0;
				
			}
	}


}
