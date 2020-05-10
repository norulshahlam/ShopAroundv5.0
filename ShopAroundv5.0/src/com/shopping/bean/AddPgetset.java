package com.shopping.bean;

import com.shopping.jdbc.AddProductjdbc;

public class AddPgetset
{
	private int catid;
	private String pname;
	private double wt;
	private int qty;
	private int prc;
	private String prdes;
	public AddPgetset(int catid,String pname,int wt,int qty,int prc,String prdes)
	{
		this.catid=catid;
		this.pname=pname;
		this.wt=wt;
		this.qty=qty;
		this.prc=prc;
		this.prdes=prdes;
	}
	public AddPgetset(){}
	
	public void setCatid(int catid)
	{
		this.catid=catid;
	}
	public int getCatid()
	{
		return catid;
	}
	public void setPname(String pname)
	{
		this.pname=pname;
	}
	public String getPname()
	{
		return pname;
	}
	public void setWt(int wt)
	{
		this.wt=wt;
	}
	public double getWt()
	{
		return wt;
	}
	public void setQty(int qty)
	{
		this.qty=qty;
	}
	public int getQty()
	{
		return qty;
	}
	public void setPrc(int prc)
	{
		this.prc=prc;
	}
	public int getPrc()
	{
		return prc;
	}
	public void setPrdes(String prdes)
	{
		this.prdes=prdes;
	}
	public String getPrdes()
	{
		return prdes;
	}
	public int getSet(String catname,String pname,double wt,double prc,int qty,String prdes)
	{
		AddProductjdbc aobj=new AddProductjdbc();
		int i=aobj.addProduct(catname,pname,wt,prc,qty,prdes);
		return i;
	}

}
