package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.shopping.bean.Customer;
import com.shopping.bean.Product;
//import com.shopping.bean.Productreview;

public class Productjdbc {
	
	public LinkedList<Product> getProduct(int pid) {
		
		Connection con=Connect.getConnect();
		LinkedList<Product> list= new LinkedList<Product>();
		PreparedStatement pstmt;
		Product a = new Product();
		try {
			pstmt = con.prepareStatement("select *  from Product where pid=?");
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				String pname = rs.getString("pname");
				double pprice = Double.parseDouble(rs.getString("pprice"));
				double pweight = Double.parseDouble(rs.getString("pweight"));
				String pdes= rs.getString("pdes");
				int pqty= Integer.parseInt(rs.getString("pqty"));
				
				a.setPname(pname);
				a.setPprice(pprice);
				a.setPweight(pweight);
				a.setPdes(pdes);
				a.setPqty(pqty);
				
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
	public String searchprodReview(int pId) {
		Connection con=Connect.getConnect();
		PreparedStatement pstmt;
		String str="";
		try {
			
			pstmt = con.prepareStatement("select *  from review where pid=?");
			pstmt.setInt(1, pId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
			str+="<tr><th width=30%>Customer</th>" +
					"<th width=30%>Review</th>" +
					"<th width=30%>Review date</th></tr>";
					
		do {
				
				int cid = rs.getInt("Cid");
				String review= rs.getString("review");
				Date rdate= rs.getDate("rdate");
				
				str+="<tr><th width=30%>"+cid+"</th><th width=30%>"+review+"</th><th width=30%>"+rdate+"</th></tr>";

			}while (rs.next());
			}
			
			else{
				
				str+=" <h2 style='color:red'>No Review<h2>";
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
		return str;
		
	}
	
}
