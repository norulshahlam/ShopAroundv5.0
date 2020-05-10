
<%@page import="com.shopping.jdbc.Connect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>

<!--
	HttpSession sessionid=request.getSession();
    sessionid.setAttribute("userid", sessionid.getId()); -->
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  
  <div id="header">
    <h1 id="logo"><a href="page.jsp">shoparound</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="ViewCart.jsp" class="cart-link">Your Shopping Cart</a>
      <div class="cl">&nbsp;</div>
      <span> <strong></strong></span> &nbsp;&nbsp; <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="page.jsp">Home</a></li>
         <li><a href="Myaccount.jsp">My Account</a></li>
        <li><a href="SupportCust.jsp">Support</a></li>       
        <li><a href="Registration.jsp">Register</a></li>
        <li><a href="Login.jsp">login</a></li>
        <li><a href="Contactus.jsp">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="Productview.jsp?pid=12"><img src="css/images/slide2.jpg" alt="" /></a></li>
            <li><a href="Productview.jsp?pid=82"><img src="css/images/slide3.jpg" alt="" /></a></li>
            <li><a href="Productview.jsp?pid=12"><img src="css/images/slide2.jpg" alt="" /></a></li>
            <li><a href="Productview.jsp?pid=82"><img src="css/images/slide3.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
      <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
          <li> <a href="Productview.jsp?pid=71"><img src="css/images/big1.jpg" alt="" /></a>
            <div class="product-info">
              <h3>SHOP AROUND</h3>
              <div class="product-desc">
                <h4>Cotton Saree</h4>
                <p></p>
                <strong class="price">Rs 2100</strong> </div>
            </div>
          </li>
          <li> <a href="Productview.jsp?pid=32"><img src="css/images/big4.png" alt="" /></a>
            <div class="product-info">
              <h3>SHOP AROUND</h3>
              <div class="product-desc">
                <h4>HTC</h4>
                <p></p>
                <strong class="price">RS 7500</strong> </div>
            </div>
          </li>
          <li class="last"> <a href="Productview.jsp?pid=41"><img src="css/images/big5.jpg" alt="" /></a>
            <div class="product-info">
              <h3>SHOP AROUND</h3>
              <div class="product-desc">
                <h4>Catching Fire</h4>
                <p></p>
                <strong class="price">Rs 500</strong> </div>
            </div>
          </li>
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
    <!-- Sidebar -->
    <div id="sidebar">
      <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
           <form action="Productview.jsp">
            <label>PRODUCT NAME :</label>
            
            <!-- <label>Category</label>
            <select class="field">
              <option value="">-- Select Category --</option>
            </select>
            <div class="inline-field">
              <label>Price</label>
              <select class="field small-field">
                <option value="">$10</option>
              </select>
              <label>to:</label>
              <select class="field small-field">
                <option value="">$50</option>
              </select>
            </div>
            <input type="submit" class="search-submit" value="Search" />
            <p> <a href="#" class="bul">Advanced search</a><br />
              <a href="#" class="bul">Contact Customer Support</a> </p>
          </form>-->
         
          <select name="pid" id="pid" style="width: 120px">
									<%
										Connection con = Connect.getConnect();
										PreparedStatement pstmt;
										try {
											pstmt = con.prepareStatement("select pname,pid from product");
											ResultSet rs = pstmt.executeQuery();
											while (rs.next()) {
												
									%>
									<option value="<%=rs.getInt(2)%>"><%=rs.getString(1)%></option>
									<%
										}
											con.close();
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										finally
										{
											con.close();
										}
									%>
							</select> 
				 <input type="submit" class="search-submit" name="submit" value="Search" />
				</form>
        </div>
      </div>
      <!-- End Search -->
      <!-- Categories -->
      <div class="box categories">
        <h2>Items <span></span></h2>
        <div class="box-content">
          <ul>
            <li><a href="Electronics.jsp">Electronics</a></li>
            <li><a href="Books.jsp">Books</a></li>
            <li><a href="Clothing.jsp">Clothing</a></li>
            <li><a href="Footwear.jsp">Footwear</a></li>
           
          </ul>
        </div>
      </div>
      <!-- End Categories -->
    </div>
    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <!-- Side Full -->
  <div class="side-full">
    <!-- More Products -->
    <div class="more-products">
      <div class="more-products-holder">
        <ul>
          <li><a href="Productview.jsp?pid=41"><img src="css/images/Catching Fire.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=42"><img src="css/images/The Calcutta Chromosome.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=61"><img src="css/images/Rogue Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=62"><img src="css/images/Chino Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=63"><img src="css/images/Formal Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=31"><img src="css/images/Nokia.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=32"><img src="css/images/HTC.png" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=41"><img src="css/images/Catching Fire.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=42"><img src="css/images/The Calcutta Chromosome.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=61"><img src="css/images/Rogue Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=62"><img src="css/images/Chino Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=63"><img src="css/images/Formal Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=31"><img src="css/images/Nokia.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=32"><img src="css/images/HTC.png" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=41"><img src="css/images/Catching Fire.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=42"><img src="css/images/The Calcutta Chromosome.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=61"><img src="css/images/Rogue Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=62"><img src="css/images/Chino Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=63"><img src="css/images/Formal Pant.jpg" alt="" /></a></li>
          <li><a href="Productview.jsp?pid=31"><img src="css/images/Nokia.jpg" alt="" /></a></li>
          <li class="last"><a href="Productview.jsp?pid=32"><img src="css/images/HTC.png" alt="" /></a></li>
        </ul>
      </div>
      <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
    </div>
    <!-- End More Products -->
    <!-- Text Cols -->
    <div class="cols">
      <div class="cl">&nbsp;</div>
      <div class="col">
        <h3 class="ico ico1">Shipping</h3>
        <p>ShopAround Shipping Details</p>
        <p class="more"><a href="shipping.jsp" class="bul">Shipping Details</a></p>
      </div>
      <div class="col">
        <h3 class="ico ico2">Contact Us</h3>
        <p> ShopAround Contact Details</p>
        <p class="more"><a href="Contactus.jsp" class="bul">Contactus</a></p>
      </div>
      <div class="col">
        <h3 class="ico ico3">Offers</h3>
        <p>Your Offers</p>
        <p class="more"><a href="Offers.jsp" class="bul">Offers</a></p>
      </div>
      <div class="col col-last">
        <h3 class="ico ico4">Shop Arround</h3>
        <p>ALL About Shop Around</p>
        <p class="more"><a href="Aboutus.jsp" class="bul">ShopArround</a></p>
      </div>
      <div class="cl">&nbsp;</div>
    </div>
    <!-- End Text Cols -->
  </div>
  <!-- End Side Full -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="page.jsp">Home</a> <span>|</span> <a href="SupportCust.jsp">Support</a> <span>|</span> <a href="Myaccount.jsp">My Account</a> <span>|</span> <a href="#"></a> <span>|</span> <a href="#">Contact</a> </p>
    <p class="right"> &copy; 2010 Shop Around. Design by <a href="http://lntinfotech.com">lntinfotech.com</a> </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
<div align=center>Lntinfotech.com</div></body>
</html>
