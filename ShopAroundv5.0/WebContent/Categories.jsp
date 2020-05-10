<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <head>
    <style>
    .categories { min-height:250px; }
	.categories ul { list-style-type: none; font-size:13px;}
	.categories ul li{ border-bottom:dashed 1px #ccc; padding:5px 0;}
	.categories ul li.last{ border-bottom:0; padding-bottom:0;}
	.categories ul li a{ color:#5f5f5f; text-decoration: none; background:url(images/cat.gif) no-repeat 0 4px; padding-left:17px;}
		.categories ul li a:hover{ color:#8b0000; }
    
    </style>
    
    
    </head>
<div class="box categories" Style="width:250px; height:50px;">
        <h2>Categories <span></span></h2>
        <div class="box-content">
          <ul>
            <li><a href="AddProduct.jsp">PRODUCT</a></li>
            <li><a href="Addcategory.jsp">CATEGORY</a></li>
            <li><a href="transaction.jsp">TRANSACTION</a></li>
            <li><a href="DisplayQuery.jsp">SUPPORT QUERY</a></li>
            <li><a href="AdminAddImage.jsp">ADD IMAGES</a></li>          
            
           </ul>
        </div>
      </div>
     