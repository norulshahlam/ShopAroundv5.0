<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.shopping.bean.Customer"%>
   <%@page import="com.shopping.jdbc.Customerjdbc"%>
   <%@page import="java.util.LinkedList"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>   
<%@ include file="Head.jsp" %>
	
	
<script>

function ChangeAddressFunc()
{
		var address =document.ChangeAddress.address.value;
		var street =document.ChangeAddress.street.value;
		var city =document.ChangeAddress.city.value;
		var zip=document.ChangeAddress.zip.value;
		var state=document.getElementById("state");
		var country=document.getElementById("country");
		
		var vcity = /^[a-zA-Z ]*$/;
		var vzip=/^[0-9]*$/;
		if((address==null || address=="" ) ||(street==null || street=="" )||(city==null || city=="" )||!city.match(vcity)||(zip==null || zip=="")||!zip.match(vzip)||zip.length!=6||state.value==""||country.value=="")
		{	if (address==null || address=="" ) 
			{
       			document.getElementById("saddress").innerHTML="Please enter Address";
       			document.getElementById("saddress").style.color = "red";
       			document.getElementById("saddress").style.display = "block"; 
       		}
       		else if(address.length>30)
			{
				document.getElementById("saddress").innerHTML="Maximum 30 characters!!";
  				document.getElementById("saddress").style.color = "red";
       			document.getElementById("saddress").style.display = "block";
			}
       		else 
   			{
         	     document.getElementById("saddress").innerHTML = ""; 
         	     document.getElementById("saddress").style.display = "none";
        	}	
        	
        	if (street==null || street=="" ) 
			{
       			document.getElementById("sstreet").innerHTML="Please enter Street";
       			document.getElementById("sstreet").style.color = "red";
       			document.getElementById("sstreet").style.display = "block"; 
       		}
       		else if(street.length>30)
			{
				document.getElementById("sstreet").innerHTML="Maximum 30 characters!!";
  				document.getElementById("sstreet").style.color = "red";
       			document.getElementById("sstreet").style.display = "block";
			}
       		else 
   			{
         	     document.getElementById("sstreet").innerHTML = ""; 
         	     document.getElementById("sstreet").style.display = "none";
        	}	
        	
        	if (city==null || city=="" ) 
			{
       			document.getElementById("scity").innerHTML="Please enter City";
       			document.getElementById("scity").style.color = "red";
       			document.getElementById("scity").style.display = "block"; 
       		}
       		else if(!city.match(vcity))
       		{
       			document.getElementById("scity").innerHTML="Enter Alphabets Only";
       			document.getElementById("scity").style.color = "red";
       			document.getElementById("scity").style.display = "block"; 
       		}
       		else if(city.length>30)
			{
				document.getElementById("scity").innerHTML="Maximum 30 characters!!";
  				document.getElementById("scity").style.color = "red";
       			document.getElementById("scity").style.display = "block";
			}
       		else 
   			{
         	     document.getElementById("scity").innerHTML = ""; 
         	     document.getElementById("scity").style.display = "none";
        	}
        	
        	if(zip==null || zip=="")
			{
				document.getElementById("szip").innerHTML="Enter Pincode";
  				document.getElementById("szip").style.color = "red";
       			document.getElementById("szip").style.display = "block";
			}
			else if(!zip.match(vzip))
			{
				document.getElementById("szip").innerHTML="Enter Numeric value only";
  				document.getElementById("szip").style.color = "red";
       			document.getElementById("szip").style.display = "block";
			}
			  
			else if(zip.length!=6)
			{

        		document.getElementById("szip").innerHTML="Pincode should be of 6 digits only!";
  				document.getElementById("szip").style.color = "red";
       			document.getElementById("szip").style.display = "block";
			}
			else if(zip<=0)
			{
			     	document.getElementById("szip").innerHTML="Enter Correct pincode";
	  				document.getElementById("szip").style.color = "red";
	       			document.getElementById("szip").style.display = "block";
			}
			else
			{
				document.getElementById("szip").innerHTML = ""; 
              	document.getElementById("szip").style.display = "none";				
			}	
			
			if (state.value=="")
    		{
     			//alert('Select State');
     			document.getElementById("sstate").innerHTML="Select State";
       			document.getElementById("sstate").style.color = "red";
       			document.getElementById("sstate").style.display = "block";
     			
    		}
     		else 
     		{
     			document.getElementById("sstate").innerHTML = ""; 
              	document.getElementById("sstate").style.display = "none";
     		}
    		
    		if (country.value=="")
    		{
     			
     			document.getElementById("scountry").innerHTML="Select Country";
       			document.getElementById("scountry").style.color = "red";
       			document.getElementById("scountry").style.display = "block";
     			
    		}
    		else 
     		{
     			document.getElementById("scountry").innerHTML = ""; 
              	document.getElementById("scountry").style.display = "none";
     		}
     		return false;
     	}
     	else
     	return true;
        	
        	
		
} 	
		
</script>
<body>
<div class="shell">

		<%@ include file="Nevigation.jsp"%>

<br/>
	<center><h1 style="font-size:50px"><strong>My Account</strong></h1></center>
	<br/>
	<br/>
	<form action="MyAccount" method="post" style="height: 71px; ">
<table align="Center">

<tr>
<td><input type="submit" name="submit" value="Personalinfo"></td>
<td><input type="submit" name="submit" value="Address"></td>
<td><input type="submit" name="submit" value="ChangePassword"></td>
<td><input type="submit" name="submit" value="Order Details"></td>
<td><input type="submit" name="submit" value="Tracking"></td>
</tr>
</table>	                    			
</form>
<CENTER><h1> ENTER NEW ADDRESS</h1></CENTER><br/>
<form name="ChangeAddress" action="ChangeAddress"  method="post" onsubmit="return ChangeAddressFunc()">
                       <%
                       		int cid=0;	
							if (session.getAttribute("uname")==null) {
   									response.sendRedirect("Login.jsp"); 
							}
							else
							 {
  									String uname=session.getAttribute("uname").toString();
      								cid=Integer.parseInt(session.getAttribute("cid").toString());
							 }
	
						%>
						
						<center><table ALIGN="center" style="font-size: 15px">
			<tr>  
    <td>Address <font color="red">*</font></td>  
    <td><input type="text" name="address"  id="address" style="width:160px"/><span id="saddress"></span> </td>  
</tr> 
  
 <tr>  
    <td>Street <font color="red">*</font></td>  
    <td><input type="text" name="street"  id="street" style="width:160px"/><span id="sstreet"></span> </td>  
</tr>
<tr>  
    <td >Select Country<font color="red">*</font></td>  
    <td><select name="country" id="country"
									onchange="setStates();" onchange='countryselect(country);' required style="width:160px">
									<!--  <option selected="" value="Default">(Please select a country)</option>-->
									 <option value=""></option>
										<option value="India">India</option>
										<option value="Canada">Canada</option>
										<option value="Mexico">Mexico</option>
										<option value="United States">United States</option>
								</select>
    
		   <span id="scountry"></span>
	</td>  
</tr> 

<tr>  
    <td>Select State<font color="red">*</font></td> 
    <td>
    <select name="state" id="state" onchange="setCities();" onchange='stateselect(state) ;' required style="width:160px">
										<!--  <option selected="" value="Default">Please select respective state</option>-->
								</select>

 <span id="sstate"></span>  
</td>
</tr>

<tr>  
    <td>City </td>  
    <td>
    <select name="city" id="city"  onchange='cityselect(city) ;' required style="width:160px">
										<!-- <option selected="" value="Default">Please select respective city</option> -->
								</select><span id="scity"></span></td>  
</tr>

<!-- 
<tr>  
    <td>City <font color="red">*</font></td>  
    <td><input type="text" name="city"  id="city" style="width:160px"/><span id="scity"></span> </td>  
</tr> -->

<tr>  
    <td>Pincode<font color="red">*</font></td>  
    <td><input type="number" name="zip"  id="zip" style="width:160px"/><span id="szip"></span></td>  
</tr>
<!-- 
<tr>  
    <td>Select State<font color="red">*</font></td> 
    <td><select name="state" id="state" style="width:160px">
<option value=""></option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Orissa">Orissa</option>
<option value="Pondicherry">Pondicherry</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Tripura">Tripura</option>
<option value="Uttaranchal">Uttaranchal</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="West Bengal">West Bengal</option>
</select>  <span id="sstate"></span>  
</td>
</tr>


<tr>  
    <td >Select Country<font color="red">*</font></td>  
    <td><select name="country" id="country" style="width:160px">
    <option value=""></option>  
    <option value="India">India</option>  
    <!-- <option value="Pakistan">Pakistan</option>  
    <option value="Africa">Africa</option>  
    <option value="China">China</option>  
    <option value="Other">Other</option>
		</select>   <span id="scountry"></span>
	</td>  
</tr>  -->
</table> </center>					
					
					<center>
					<input type="submit" name="submit" value="CHANGE ADDRESS">
					</center>
						
</form>

	<%@ include file="Textcol.jsp"%>
	<%@ include file="Footer.jsp"%>
	</div>
			</body>