

<%@ page language="java" import="com.shopping.jdbc.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp" %>
<body >
<div class="shell">
<script>

function ShippingAddressFunc()
{
		var address =document.ShippingAddress.address.value;
		var street =document.ShippingAddress.street.value;
		var city =document.ShippingAddress.city.value;
		var pin=document.ShippingAddress.pin.value;
		var state=document.getElementById("state");
		var country=document.getElementById("country");
		
		var vcity = /^[a-zA-Z ]*$/;
		var vpin=/^[0-9]*$/;
		if((address==null || address=="" ) ||address.length>30||(street==null || street=="" )||street.length>30||(city==null || city=="" )||!city.match(vcity)||city.length>30||(pin==null || pin=="")||!pin.match(vpin)||pin.length!=6||state.value==""||country.value=="")
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
        	
        	if(pin==null || pin=="")
			{
				document.getElementById("spin").innerHTML="Enter Pincode";
  				document.getElementById("spin").style.color = "red";
       			document.getElementById("spin").style.display = "block";
			}
			
			  
			else if(pin.length!=6)
			{

        		document.getElementById("spin").innerHTML="Pincode should be of 6 digits only!";
  				document.getElementById("spin").style.color = "red";
       			document.getElementById("spin").style.display = "block";
			}
			else if(!pin.match(vpin))
			{
				document.getElementById("spin").innerHTML="Enter Correct pincode!!";
  				document.getElementById("spin").style.color = "red";
       			document.getElementById("spin").style.display = "block";
			}
			else if(pin<=0)
			{
			

	        		document.getElementById("spin").innerHTML="Enter Correct pincode";
	  				document.getElementById("spin").style.color = "red";
	       			document.getElementById("spin").style.display = "block";
			}
			else
			{
				document.getElementById("spin").innerHTML = ""; 
              	document.getElementById("spin").style.display = "none";				
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
		<%@ include file="Nevigation.jsp"%>
		<br/><br/>
		<center><h1>REGISTERED ADDRESS</h1></center><br/>
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
				String s="<center><form action='UpdateShipServ' method='post'><center><table align='center' style='font-size: 15px'>";
				Shippingadd add=new Shippingadd();
				s+= add.getAddr(cid);
				
				s+="<tr><td><input type='hidden' name='shipadd' value='oldadd'> </td><td><input type='submit' name='submit' value ='SHIP TO THIS ADDRESS'/></td></tr></table></form></center>";
				
				out.print(s);
				
		%>
		<br/>
		<br/>
				<CENTER><h1> ENTER NEW ADDRESS</h1></CENTER><br/>
			<form name="ShippingAddress" action="UpdateShipServ" method="post" onsubmit="return ShippingAddressFunc()">
		<table ALIGN="center" style="font-size: 15px">
			<tr>  
    <td>Address <font color="red">*</font></td>  
    <td><input type="text" name="address"  id="address" style="width:160px"/><span id="saddress"></span> </td>  
</tr> 
  
 <tr>  
    <td>Street <font color="red">*</font></td>  
    <td><input type="text" name="street"  id="street" style="width:160px"/><span id="sstreet"></span> </td>  
</tr>

<!-- 
<tr>  
    <td>City<font color="red">*</font> </td>  
    <td><input type="text" name="city"  id="city" style="width:160px"/><span id="scity"></span> </td>  
</tr> -->

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


<!-- <tr>  
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


<tr>  
    <td>Pincode<font color="red">*</font></td>  
    <td><input type="number" name="pin"  id="pincode" style="width:160px"/><span id="spin"></span></td>  
</tr>


			<tr>
			<td>
					<input type="hidden" name="shipadd" value="newadd"> 
				</td>
				<td>
					<input type="submit" name="submit" value="SHIP TO THIS ADRESS">
				</td>
				</tr>
		</table>
		</form>
			
		<%@ include file="Slide.jsp"%>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>