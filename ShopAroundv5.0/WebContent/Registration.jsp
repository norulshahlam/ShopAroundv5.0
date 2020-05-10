<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>
<script>
function validateform()
	{ 	
		var uname =document.register.uname.value;
		var password=document.register.password.value;
		var cpassword=document.register.cpassword.value;
		var email=document.register.email.value;  
		var atposition=email.indexOf("@");  
		var dotposition=email.lastIndexOf("."); 
		
		
		var cont_no=document.register.cont_no.value; 
		var pincode=document.register.pincode.value;
		var ans=document.register.ans.value; 
		
		
		var vcont_no = /^[0-9]*$/; 
		var vcont_no1=/^[789]\d{9}$/;  
		var vuname= /^[a-zA-Z\s-, ]+$/;
		var vpass=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[`$@$!%*?&#^()])[A-Za-z\d`$@$!%*?&#^()]{8,}/;
		var vemail=/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
			
		var gender = document.getElementsByName("gender");
		var ischecked_method = false;
		for ( var i = 0; i < gender.length; i++) 
		{
    		if(gender[i].checked) 
    		{
        		ischecked_method = true;
        		break;
    		}
		}
		var address=document.register.address.value;
		var street=document.register.street.value;
		var city=document.register.city.value; 
		var state=document.getElementById("state");
		var country=document.getElementById("country");
		
    	   	
    	if (((uname.length>20 )||!uname.match(vuname)==true) || (!ischecked_method==true) ||(password.length<8||password.length>20) ||(!password.match(vpass)==true)|| (password!=cpassword)||(!email.match(vemail)==true)||email.length>25|| isNaN(cont_no) || (cont_no==null || cont_no=="" )||!cont_no.match(vcont_no)||!cont_no.match(vcont_no1)|| (cont_no.length<10)|| !pincode.match(vcont_no)||pincode.length!=6 || (pincode==null || pincode=="")||pincode<=0||address.length>30||street.length>30|| (ans==null || ans=="")||ans.length>20) 
    	{
    		 if (uname==null || uname=="" ) 
			 {
       			document.getElementById("suname").innerHTML="Please enter Username";
       			document.getElementById("suname").style.color = "red";
       			document.getElementById("suname").style.display = "block"; 
       		 }	
    		 else  if (uname.length>20 ) 
			 {
       			document.getElementById("suname").innerHTML="Maximum 20 characters!!";
       			document.getElementById("suname").style.color = "red";
       			document.getElementById("suname").style.display = "block"; 
       		 }
       		else if(!uname.match(vuname) )	
       		{ 
        		document.getElementById("suname").innerHTML="Username should not be empty and contain only alphabets!!";  
        		document.getElementById("suname").style.color = "red";
       			document.getElementById("suname").style.display = "block";      
        	}	
   			else 
   			{
         	     document.getElementById("suname").innerHTML = ""; 
         	     document.getElementById("suname").style.display = "none";
        	}
        	
        	 if(!ischecked_method)   
		 	{
   				document.getElementById("sgender").innerHTML="Please Select  Gender"; 
   				document.getElementById("sgender").style.color = "red";
       			document.getElementById("sgender").style.display = "block"; 
			}
			else 
   			{
          	    document.getElementById("sgender").innerHTML = ""; 
          	    document.getElementById("sgender").style.display = "none";
       		}  
              
         
       	 if(password.length<8 || password.length>20)
       	 	{  
				document.getElementById("spassword").innerHTML="Password length should be of 8-20 characters";  
				document.getElementById("spassword").style.color = "red";
    			document.getElementById("spassword").style.display = "block"; 
				// return false;  
	  		} 
       
       	 else if(!password.match(vpass))
  			{
  				document.getElementById("spassword").innerHTML="Password should have minimum 8 characters,<br> at least 1 Uppercase Alphabet,<br> 1 Lowercase Alphabet,<br> 1 Number and 1 Special Character";
  				document.getElementById("spassword").style.color = "red";
       			document.getElementById("spassword").style.display = "block"; 
  		    	//return false;	
  			}
  			else 
   			{
            	  document.getElementById("spassword").innerHTML = ""; 
                  document.getElementById("spassword").style.display = "none";
        	}  
  		  	
  			if(cpassword==null || cpassword=="")
  			{
  				document.getElementById("scpassword").innerHTML="Enter Confirm Password"; 
  				document.getElementById("scpassword").style.color = "red";
       			document.getElementById("scpassword").style.display = "block"; 
  				
  			}
  			else if(password!=cpassword)
  		 		
  			{
	  			document.getElementById("scpassword").innerHTML="Passwords are not matching"; 
  				document.getElementById("scpassword").style.color = "red";
       			document.getElementById("scpassword").style.display = "block"; 
				//return false;  
			}
			else 
   			{
            	document.getElementById("scpassword").innerHTML = ""; 
              	document.getElementById("scpassword").style.display = "none";
        	}  
			
			if(!email.match(vemail))	
			{
			 	document.getElementById("semail").innerHTML="Enter correct email id";  
			 	document.getElementById("semail").style.color = "red";
       	     	document.getElementById("semail").style.display = "block"; 
 				// return false; 
					
			}
			else if(email.length>25)
			{
				document.getElementById("semail").innerHTML="Maximum length exceeded!!";  
			 	document.getElementById("semail").style.color = "red";
       	     	document.getElementById("semail").style.display = "block"; 
			}
			else 
   			{
              	document.getElementById("semail").innerHTML =""; 
              	document.getElementById("semail").style.display = "none";
        	} 
			
			
	     	
			if(cont_no==null || cont_no=="")
			{
				document.getElementById("scont_no").innerHTML="Enter Contact NO.";
  				document.getElementById("scont_no").style.color = "red";
       			document.getElementById("scont_no").style.display = "block";
			}
			else if(isNaN(cont_no) )
			{
				document.getElementById("scont_no").innerHTML="Enter Numeric Value ONly";
  				document.getElementById("scont_no").style.color = "red";
       			document.getElementById("scont_no").style.display = "block";
			}
			else if(cont_no.length!=10)
			{
				document.getElementById("scont_no").innerHTML="Contact no. should be of 10 digits";
				document.getElementById("scont_no").style.color = "red";
       			document.getElementById("scont_no").style.display = "block";
			}
			else if(!cont_no.match(vcont_no))
				{

				document.getElementById("scont_no").innerHTML="Enter correct Contact No.!!";
				document.getElementById("scont_no").style.color = "red";
       			document.getElementById("scont_no").style.display = "block";
				}
			else if(!cont_no.match(vcont_no1))
			{

			document.getElementById("scont_no").innerHTML="Contact No. should start with 7/8/9!!";
			document.getElementById("scont_no").style.color = "red";
   			document.getElementById("scont_no").style.display = "block";
			}
			else
			{
				document.getElementById("scont_no").innerHTML = ""; 
              	document.getElementById("scont_no").style.display = "none";
			}
	     	
			
			if(pincode==null || pincode=="")
			{
				document.getElementById("spincode").innerHTML="Enter Pincode";
  				document.getElementById("spincode").style.color = "red";
       			document.getElementById("spincode").style.display = "block";
			}
			else if(!pincode.match(vcont_no))
			{
				document.getElementById("spincode").innerHTML="Enter correct Pincode";
  				document.getElementById("spincode").style.color = "red";
       			document.getElementById("spincode").style.display = "block";
			}
			  
			else if(pincode.length!=6)
			{

        		document.getElementById("spincode").innerHTML="Pincode should be of 6 digits only!";
  				document.getElementById("spincode").style.color = "red";
       			document.getElementById("spincode").style.display = "block";
			}
			else if(pincode<=0)
			{
			

	        		document.getElementById("spincode").innerHTML="Enter Correct pincode";
	  				document.getElementById("spincode").style.color = "red";
	       			document.getElementById("spincode").style.display = "block";
			}
			else
			{
				document.getElementById("spincode").innerHTML = ""; 
              	document.getElementById("spincode").style.display = "none";				
			}
			if(address.length>30)
			{
				document.getElementById("saddress").innerHTML="Maximum 30 characters!!";
  				document.getElementById("saddress").style.color = "red";
       			document.getElementById("saddress").style.display = "block";
			}
			else
			{
				document.getElementById("saddress").innerHTML="";
			}
			if(street.length>30)
			{
				document.getElementById("sstreet").innerHTML="Maximum 30 characters!!";
  				document.getElementById("sstreet").style.color = "red";
       			document.getElementById("sstreet").style.display = "block";
			}
			else
			{
				document.getElementById("sstreet").innerHTML="";
			}
			if(city.length>30)
			{
				document.getElementById("scity").innerHTML="Maximum 30 characters!!";
  				document.getElementById("scity").style.color = "red";
       			document.getElementById("scity").style.display = "block";
			}
			else
			{
				document.getElementById("scity").innerHTML="";
			}
			
     		if (state.value=="")
    		{
     			
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
     		if (ans==null || ans=="") 
			{
	       		document.getElementById("sans").innerHTML="Answer is compulsory";
       			document.getElementById("sans").style.color = "red";
       			document.getElementById("sans").style.display = "block";
       			//return false;
    		}
    		else if(ans.length>20)
    		{
    			document.getElementById("sans").innerHTML="Maximum 20 characters!!";
    			document.getElementById("sans").style.color = "red";
       			document.getElementById("sans").style.display = "block";
    		}
    		else 
   			{
              	document.getElementById("sans").innerHTML = ""; 
              
	              
        	} 
			
			
        	return false;
        }
      }
      
    

</script>

<body>
	<div class="shell">

		<%@ include file="Nevigation.jsp"%>



<div id="menu">
		<br/>
		
		<center>
			<h1>REGISTRATION</h1><br/>
		</center>
		<center>
			<p style="color: red; font-size: 20px">${message}</p>
			<form name="register" action="Register" method="post" onsubmit="return validateform()">  
<table> 
 <tr>
							<td></td>
							<td></td>
						</tr>
<tr>  
    <td > Username <font color="red">*</font>:</td>  
    <td><input type="text" name="uname" id="uname"  style="width:160px"/><span id="suname"></span></td>  
</tr> 
 
 <tr>  
    <td>Gender<font color="red">*</font>:</td>  
    <td>  
		<input type="radio" name="gender" id="register_gendermale" value="male"/> Male  
		<input type="radio" name="gender" id="register_genderfemale" value="female"/>Female <span id="sgender"></span>
    </td>  
</tr>

<tr>  
    <td >Password<font color="red">*</font>:</td>  
    <td><input type="password" name="password" id="password" style="width:160px"/><span id="spassword"></span></td>  
</tr>

<tr>  
    <td >Confirm password<font color="red">*</font>:</td>  
    <td><input type="password" name="cpassword" id="cpassword" style="width:160px"/><span id="scpassword"></span></td>  
</tr>
   
<tr>  
    <td>Email Id<font color="red">*</font>: </td>  
    <td><input type="email" name="email"  id="email" style="width:160px"/><span id="semail"></span></td>  
</tr> 
 
<tr>  
    <td>Contact No.<font color="red">*</font> </td>  
    <td><input type="text" name="cont_no"  id="cont_no" style="width:160px"/><span id="scont_no"></span></td>  
</tr> 
 
<tr>  
    <td>Address </td>  
    <td><input type="text" name="address"  id="address" style="width:160px"/><span id="saddress"></span></td>  
</tr> 
  
 <tr>  
    <td>Street </td>  
    <td><input type="text" name="street"  id="street" style="width:160px"/><span id="sstreet"></span></td>  
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

<tr>  
    <td>Pincode<font color="red">*</font></td>  
    <td><input type="number" name="pincode"  id="pincode" style="width:160px"/><span id="spincode"></span></td>  
</tr>

<tr>  
    <td>Secutiry Question </td>  
    <td><select name="secque" id="secque" style="width:260px">  
    <option value="first_pet">What was the name of your first pet?</option>  
    <option value="child_friend">Who was your best childhood friend?</option>  
    <option value="meet_spouse">Where did you meet your spouse?</option>  
    <option value="fav_city">Which is your favourite city?</option>  
    </select>  
    </td>  
</tr>

<tr>  
    <td>Answer<font color="red">*</font></td>  
    <td><input type="text" name="ans"  id="ans" style="width:260px"/><span id="sans"></td>  
</tr>


 
<tr>  
    <td colspan="2"><br><div align="center"><input type="submit" id="register_0" value="Register" onsubmit="alert("error");"/>  
	</div></td>  
</tr>  
</table>  
</form>
</center>
		
		</div>
<%@ include file="Textcol.jsp"%>
<%@ include file="Footer.jsp"%>
</div>
</body>
</html>