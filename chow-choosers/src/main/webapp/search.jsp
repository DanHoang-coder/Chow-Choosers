<!-- Dan Hoang
     search.jsp
     10/15/2021
-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="review.Restaurant" %>

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="search" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/search.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">

<script>
    // Initialize and add the map
    function initMap() {
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 10,
            center: { lat: 41.239588, lng: -96.025617 },
        });
        41.307656582863935, -96.1372015735293 
        // The locations
        const locations = [
            [{ lat: 41.25950761830219, lng: -96.01078153250107 }, "UNO"],
            [{ lat: 41.2574931156044, lng: -95.93009561955655 }, "India House Restaurant"],
            [{ lat: 41.3040640, lng: -96.1347584 }, "MingHin Cuisine"],
            [{ lat: 41.29327509248348, lng: -96.14077666373554 }, "Carrabba's Italian Grill"],
            [{ lat: 41.307656582863935, lng: -96.1372015735293 }, "Dragon Wok"],
        ];
        
        // Create the markers
        var marker;
<% 
    List<Restaurant> restaurants = (ArrayList<Restaurant>) request.getAttribute("restaurants");

    for(Restaurant restaurant : restaurants) {
        out.print("marker = new google.maps.Marker({");
    	out.print("position: new google.maps.LatLng(locations[" + restaurant.getRestaurantID() + "][0]),");
    	out.print("map: map,");
    	out.print("title: \"" + restaurant.getRestaurantName() + "\",");
    	out.print("label: \"" + restaurant.getRestaurantName() + "\",");
    	out.print("});");     	
    }
%>       
    }
</script>

</head>
<body>

<div id="wrapper">
    <header>
        <img src="images/logo.jpg" width="361" height="53" alt="Chow Choosers"><h2>Chow Choosers</h2>
    </header>
    <nav>
	<ul>
		<li><a href="index.jsp" class="home"><img src="images/home.png" alt="Home"><span>Home</span></a></li>
        <li class="current"><a href="search">Search</a></li>
		<li><a href="history.jsp">Our History</a></li>
		<li><a href="specials.jsp">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>


        <div class="search-container">
            <form action="search" method="post">
                <input type="text" name="keyword" placeholder="search.." value="${param.keyword}" >
                <button type="submit"><i class="fa fa-search"></i></button>
                <select name="chosenOne" onchange="this.form.submit()">
                    <option value="0" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("0")){ %>selected<%} %>>All Stars</option>
                    <option value="1" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("1")){ %>selected<%} %>>5 Star only</option>
                    <option value="2" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("2")){ %>selected<%} %>>4 Star only</option>
                    <option value="3" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("3")){ %>selected<%} %>>4 Star and above</option>
                    <option value="4" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("4")){ %>selected<%} %>>4 Star and below</option>
                    <option value="5" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("5")){ %>selected<%} %>>3 Star only</option>
                    <option value="6" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("6")){ %>selected<%} %>>3 Star and above</option>
                    <option value="7" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("7")){ %>selected<%} %>>3 Star and below</option>
                    <option value="8" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("8")){ %>selected<%} %>>2 Star only</option>
                    <option value="9" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("9")){ %>selected<%} %>>2 Star and above</option>
                    <option value="10" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("10")){ %>selected<%} %>>2 Star and below</option>
                    <option value="11" <%if((request.getAttribute("selectedItem") != null) && request.getAttribute("selectedItem").equals("11")){ %>selected<%} %>>1 Star only</option>
                </select>
            </form>
        </div>

        <div class="content">
            <div class="content-left" id="scrollbar">
<% 
    for(Restaurant restaurant : restaurants)
    {
    	out.print("<div class=\"result-restaurant\">");
    	out.print("<div class=\"restaurant-image\">");
    	out.print("<img src=\"" + restaurant.getAvatar() + "\">");
    	out.print("</div>");
    	out.print("<div class=\"restaurant-information\">");
    	out.print("<div class=\"information\">");
    	out.print("<h4><a href=\"review?restaurantID=" + restaurant.getRestaurantID() + "\">" + restaurant.getRestaurantName() + "</a></h4>");
    	out.print("<p>" + restaurant.getStreetAddress() + ", " + restaurant.getCity() + ", " + restaurant.getState() + " " + restaurant.getZipCode() + "</p>");
    	
    	if(restaurant.getRestaurantDescription() != null && restaurant.getRestaurantDescription().length() > 85) {
            out.print("<span>" + restaurant.getRestaurantDescription().substring(0, 85) + "...</span>");
    	} else {
            out.print("<span>" + restaurant.getRestaurantDescription() + "</span>");
    	}    	
    	
        out.print("</div>");
   	    out.print("<div class=\"heart\">");
    	out.print("<i class=\"fa fa-heart-o\" style=\"font-size:18px;color:red\"></i>");
   	    out.print("</div>");
   	    out.print("</div>");
   	    out.print("</div>");
    }
%>
            </div>
            <div class="content-right"><div id="map"></div></div>
        </div>


        <div class="clear"></div>         
    </main>
    <footer>
        <ul>
            <li><a href="search" class="blue">Search</a></li>
            <li><a href="history.jsp" class="blue">History</a></li>
            <li><a href="specials.jsp" class="blue">Specials</a></li>
            <li><a href="contact.jsp" class="blue">Contact</a></li>
        </ul>
        <p>Copyright &copy; 2021 Chow Choosers</p>
        <p>Created by: <a href="mailto:dhoang2@mail.mccneb.edu" class="black">Dan Hoang</a></p>
    </footer>
</div>

<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
<script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoSkxlEMS1Zi8fwsRGdToBG5jJKQX94gA&callback=initMap&libraries=&v=weekly"
    async
></script>

</body>
</html>