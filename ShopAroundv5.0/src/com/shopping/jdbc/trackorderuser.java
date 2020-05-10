package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class trackorderuser {
	public int flag;

	public String gettrackorder(int orderid,int cid) throws SQLException {

		String s = "";
		Connection con = Connect.getConnect();

		try {

			
			PreparedStatement stmt = con
					.prepareStatement("select * from SHIPMENT where oid=? and cid=?");
			stmt.setInt(1, orderid);
			stmt.setInt(2, cid);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{	 s="<table align='center' border=1><tr><th>ORDER ID</th>" +
		       		"<th>SHIPMENT STATUS</th></tr>";

					s+= "<tr><th>" + rs.getInt(2) + "</th>" +

					"<th>" + rs.getString("shipstatus") + "</th></tr>";

						//return s;
				  s+="</table align='center'>";
			}
			else
			{
				s="<br/><br/><center>Sorry no details found for this order id</center>";
			}

		} catch (Exception e) {
			System.out.print(e);
			// e.printStackTrace();

		}
		finally{
			con.close();
			return s;
		}
		
	}

}
