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
		
    	   	
    	if (((uname.length>20 )||!uname.match(vuname)==true) || (!ischecked_method==true) ||(password.length<8||password.length>20) ||(!password.match(vpass)==true)||(cpassword==null || cpassword=="")|| (password!=cpassword)||
    			(!email.match(vemail)==true)|| !cont_no.match(vcont_no) || (cont_no==null || cont_no=="" )|| (cont_no.length!=10)||!cont_no.match(vcont_no1)|| 
    			!pincode.match(vcont_no)||pincode.length!=6 || (pincode==null || pincode=="")||pincode<=0||address.length>30||street.length>30||city.length>30|| state.value==""||country.value==""||(ans==null || ans=="")||ans.length>20) 
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
				document.getElementById("saddress").innerHTML="Maximum 30 Characters!!";
				document.getElementById("saddress").style.color = "red";
	   			document.getElementById("saddress").style.display = "block";
			}
			else
			{
				document.getElementById("saddress").innerHTML="";
			}
			
			if(street.length>30)
			{
				document.getElementById("sstreet").innerHTML="Maximum 30 Characters!!";
				document.getElementById("street").style.color = "red";
	   			document.getElementById("street").style.display = "block";
			}
			else
			{
				document.getElementById("street").innerHTML="";
			}
			
			if(city.length>30)
			{
				document.getElementById("scity").innerHTML="Maximum 30 Characters!!";
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
              	document.getElementById("sans").style.display = "none";
	              
        	} 
    		
    		
        	return false;
        }
        else
        {
    		return true;
    	}
	}






		

	
	
	