<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <head>
    
    	<Style>.box { padding:1px; border:solid 1px #dedede; margin-bottom:10px; width:700px; height:150px;float:right;}
			.box h2{ background:#7f7f7f; color:#fff; font-weight: normal; padding:0 5px; position:relative; height:27px; line-height:27px; }
				.box h2 span{ position:absolute; width:10px; height:5px; background:url(images/h2-arr.gif); top:27px; right:10px; font-size:0; line-height:0;}
				.box-content { padding:5px; width:250px; height:150px;}
				
				#slider { height:252px; position:relative; overflow:hidden; }
				#slider-holder { width:700px; height:252px; position:relative; overflow:hidden; }
				#slider-holder .jcarousel-clip{ width:700px; height:252px; position:relative; overflow:hidden; }
				#slider-holder ul{ width:700px; height:252px; position:relative; overflow:hidden; list-style-type: none;}
				#slider-holder ul li{ width:700px; height:252px; position:relative; overflow:hidden; float:left; }
				
    	</style>
    
    </head>

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