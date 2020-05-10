package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

//import org.apache.catalina.connector.Request;

public class Transaction {
	
public int getOtotal(int oid) {
		int ototal=0;
		Connection con=Connect.getConnect();
		try
		{
			
			
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement("SELECT  ototal from ordr where oid=?");
			pstmt.setInt(1, oid);
			ResultSet rs= pstmt.executeQuery();		
			if(rs.next())
			{
				ototal=rs.getInt(1);
			}
			
			System.out.print(ototal);
			return ototal;
			

		}
		catch(Exception e)
		{
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
		return ototal;
	}


public String getTransshop(int oid,int cid) {
	String pkey="";
	Connection con=Connect.getConnect();
	try
	{
		
		
		PreparedStatement pstmt1=null;
		pstmt1=con.prepareStatement("insert into  transaction(transshop,cid,oid) values(('Sho'||to_char(sec.nextval)),?,?)");
		pstmt1.setInt(1, cid);
		pstmt1.setInt(2, oid);
		
		
		int i=pstmt1.executeUpdate();
		
		PreparedStatement pstmt=null;
		pstmt=con.prepareStatement("SELECT transshop from  transaction where oid="+oid);
		
		
		ResultSet rs= pstmt.executeQuery();
		
		if(rs.next())
		{
			pkey=rs.getString(1);
		}
		System.out.print(pkey);
		
		return pkey;

	}
	catch(Exception e)
	{
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
	return pkey;
}

public String getTransactionDetails() {

	Connection con=Connect.getConnect();
	String s="";
	try
	{
		
		PreparedStatement pstmt1=null;		
		pstmt1=con.prepareStatement("SELECT * FROM TRANSACTION ORDER BY oid");
		ResultSet rs=pstmt1.executeQuery();
		int i=0;
		s="<center><br/><b>TRANSACTION DETAILS</b><br/><br/><table border='1'><tr><th>TRANSACTION SHOP</th><th>TRANSACTION BANK</th><th>AMOUNT</th><th>CUSTOMER ID</th><th>ORDER ID</th><th>STATUS</th></tr>";
		while(rs.next())
		{
			
			if(i<5)
		{
			s+="<tr><td>"+rs.getString("transshop")+"</td>";
			s+="<td>"+rs.getString("transbank")+"</td>";
			s+="<td>"+rs.getDouble("transamt")+"</td>";
			s+="<td>"+rs.getInt("cid")+"</td>";
			s+="<td>"+rs.getInt("oid")+"</td>";
			s+="<td>"+rs.getString("status")+"</td></tr>";
			}
			else
				break;
		i++;
		}
		s+="</table></center>";
		return s;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		try {
			con.setAutoCommit(true);
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	
}

public int updatetrans(Double amt,String transid,String status,String pkey ) {
	
	int i=0,n=0,j=0,k=0;
	Connection con=Connect.getConnect();
	try
	{
		if(status.equalsIgnoreCase("done"))
		{
			con.setAutoCommit(false);
			int cid = 0,oid = 0;
			PreparedStatement pstmt1=null,stmt2,pstmt2,pstmt3,pstmt4;
			
			pstmt1=con.prepareStatement("update transaction set transbank=?,transamt=?,status=? where transshop=?");
			pstmt1.setString(1, transid);
			pstmt1.setDouble(2, amt);
			pstmt1.setString(3,status);
			pstmt1.setString(4, pkey);
			i=pstmt1.executeUpdate();
			
			pstmt4=con.prepareStatement("select cid,oid from transaction where transshop=?");
			pstmt4.setString(1, pkey);
			ResultSet rs=pstmt4.executeQuery();
			if(rs.next())
			{
				cid=rs.getInt(1);
			    oid=rs.getInt(2);
			}
			
			pstmt2=con.prepareStatement("update ordr set orderstatus='Order Placed' where cid=? and oid=?");
			pstmt2.setInt(1, cid);
			pstmt2.setInt(2, oid);
			j=pstmt2.executeUpdate();
			
			pstmt3=con.prepareStatement("update shipment set shipstatus='Processed' where cid=? and oid=?");
			pstmt3.setInt(1, cid);
			pstmt3.setInt(2, oid);
			k=pstmt3.executeUpdate();
			
			stmt2=con.prepareStatement("DELETE FROM CART WHERE cid=?");
			stmt2.setInt(1,cid);
			n=stmt2.executeUpdate();
		    con.commit();
		}
		else
		{

			con.setAutoCommit(false);
			PreparedStatement pstmt1=null,stmt2;
			
			pstmt1=con.prepareStatement("update transaction set transbank=?,transamt=?,status=? where transshop=?");
			pstmt1.setString(1, transid);
			pstmt1.setDouble(2, amt);
			pstmt1.setString(3,status);
			pstmt1.setString(4, pkey);
			i=pstmt1.executeUpdate();
			j=n=k=1;
		    con.commit();
		}
		
	}
	catch(Exception e)
	{
		con.rollback();
		e.printStackTrace();
	}
	finally
	{
		try {
			con.setAutoCommit(true);
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=0 && n!=0 && j!=0)
		{
			return 1;
		}
		else 
			return 0;
		
	}
	
}

}