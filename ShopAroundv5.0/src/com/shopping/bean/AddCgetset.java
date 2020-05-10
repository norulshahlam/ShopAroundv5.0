package com.shopping.bean;

import com.shopping.jdbc.AddCategoryjdbc;
import com.shopping.jdbc.AddProductjdbc;

public class AddCgetset 
{
	private int itemid;
	private String cname;
	public AddCgetset(int itemid,String cname)
	{
		this.itemid=itemid;
		this.cname=cname;
	}
public AddCgetset(){}
	
	public void setItemid(int itemid)
	{
		this.itemid=itemid;
	}
	public int getItemid()
	{
		return itemid;
	}
	public void setCname(String cname)
	{
		this.cname=cname;
	}
	public String getCname()
	{
		return cname;
	}
	public int getSet(int itemid,String cname)
	{
		AddCategoryjdbc aobj=new AddCategoryjdbc();
		int i=aobj.addCategory(itemid,cname);
		return i;
	}
}
