package com.shopping.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.LinkedList;

import com.shopping.bean.AESencrp;

import com.shopping.bean.Customer;

public class Registerjdbc {
	public static final int UNIQUE_CONSTRAINT_VIOLATION = 1; 
	public int Register(LinkedList<Customer> lst) throws Exception {
		// TODO Auto-generated method stub
		Customer a=(Customer)lst.get(0);
		
		Connection conn=Connect.getConnect();
		int i=0,j=0,m=0;
		try {
			 conn.setAutoCommit(false);
			 PreparedStatement stmt=conn.prepareStatement("INSERT INTO Login VALUES(?,?,?)");
			 stmt.setString(1, a.getEmail());
			 stmt.setString(2, "Customer");
			 String passwordEnc = AESencrp.encrypt( a.getPassword());
			 stmt.setString(3,passwordEnc);
			 i=stmt.executeUpdate();
			 System.out.println("record updated");
			 //(Cid,Cname,Uemailid,Ccontact_Number,Cgender,caddress,cstreet,,City,State,Country,Zip,Security_quest,answer)
			 PreparedStatement stmt1=conn.prepareStatement("INSERT INTO CUSTOMER VALUES(Cid.nextval,?,?,?,?,?,?,?,?,?,?,?,?)");
			 stmt1.setString(1,a.getName() );
			 stmt1.setString(2,a.getEmail());
			 stmt1.setLong(3,a.getCont_no());
			 stmt1.setString(4, a.getGender());
			 stmt1.setString(5, a.getAddress());
			 stmt1.setString(6, a.getStreet());
			 stmt1.setString(7, a.getCity());
			 stmt1.setString(8, a.getState());
			 stmt1.setString(9,a.getCountry());
			 stmt1.setInt(10,a.getPincode());
			 stmt1.setString(11, a.getSecque());
			 stmt1.setString(12,a.getAns());
			 j=stmt1.executeUpdate();
			 System.out.println("record updated");
			 conn.commit();
			 
			 
		 }
		/*catch(SQLIntegrityConstraintViolationException ex)
		{
			 m=1;
			 conn.rollback();
			 System.out.println(m);
			 ex.printStackTrace();
			
		}*/
		catch (SQLException e) {
			// TODO Auto-generated catch block
			 conn.rollback();
			 e.printStackTrace();
			 if(UNIQUE_CONSTRAINT_VIOLATION == e.getErrorCode()) 
			 { 
				 m=1;
			 } 
			
			 return 0;
			 
		}
		finally
		{
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(i!=0 && j!=0 && m==0)
				return 1;
			else if(m==1)
				return 2;
			else
				return 0;
			
		}
	}
	

}
