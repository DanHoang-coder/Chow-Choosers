<!-- Dan Hoang
     review.jsp
     10/15/2021
-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="review.Restaurant" %>
<%@ page import="review.Review" %>
<%@page import="java.text.DecimalFormat" %>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
DecimalFormat format = new DecimalFormat("0.0");
int oneStarPercent = restaurant.getNumOneStar() * 100 / restaurant.getNumStars();
int twoStarPercent = restaurant.getNumTwoStar() * 100 / restaurant.getNumStars();
int threeStarPercent = restaurant.getNumThreeStar() * 100 / restaurant.getNumStars();
int fourStarPercent =  restaurant.getNumFourStar() * 100 / restaurant.getNumStars();
int fiveStarPercent = restaurant.getNumFiveStar() * 100 / restaurant.getNumStars();

// Creating the review button
String reviewButton = "<a href=\"WriteReview?restaurantID=" + restaurant.getRestaurantID() 
+ "\"><button class=\"button\">Write a review <i class=\"fa fa-pencil\"></i></button></a>";
if (session == null || session.getAttribute("user") == null) {
    reviewButton = "<button class=\"button disabled\">Write a review <i class=\"fa fa-pencil\"></i></button></a>";
}
%>

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="review" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/review.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
<style>
.progress-1:after {
    width: <%=fiveStarPercent%>% !important;
}
.progress-2:after {
    width: <%=fourStarPercent%>% !important;
}
.progress-3:after {
    width: <%=threeStarPercent%>% !important;
}
.progress-4:after {
    width: <%=twoStarPercent%>% !important;
}
.progress-5:after {
    width: <%=oneStarPercent%>% !important;
}
</style>
</head>
<body>

<div id="wrapper">
    <header>
        <img src="images/logo.jpg" width="361" height="53" alt="Chow Choosers"><h2>Chow Choosers</h2>
    </header>
    <nav>
	<ul>
		<li><a href="index.jsp" class="home"><img src="images/home.png" alt="Home"><span>Home</span></a></li>
        <li><a href="search">Search</a></li>
		<li><a href="history.jsp">Our History</a></li>
		<li><a href="specials.jsp">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>
        <div class="main-section">
            <div class="reviewee">
                <div class="reviewee-thumbnail">
                    <img src="<%=restaurant.getAvatar()%>">
                </div>
                <div class="reviewee-information">
                    <h2><%=restaurant.getRestaurantName()%></h2>
                    <p><%=restaurant.getStreetAddress()%></p>
                    <p><%=restaurant.getCity()%>, <%=restaurant.getState()%> <%=restaurant.getZipCode()%></p>
                    <%=reviewButton%>
                </div>
            </div>

            <div class="average-rating">
                <h2><%=format.format(restaurant.getAverageRating())%></h2>
                
<%
float num = restaurant.getAverageRating();
int intPart = (int)num;
float decPart = num - (int) num;

for (int i = 0; i < intPart; i++) {
	out.print("<i aria-hidden=\"true\" class=\"fa fa-star\"></i>");	
}
if (decPart > 0) {
	out.print("<i class=\"fa fa-star-half-o\" aria-hidden=\"true\"></i>");
	for (int i = 1; i < (5 - intPart); i++) {
		out.print("<i aria-hidden=\"true\" class=\"fa fa-star-o\"></i>");	
	}
}
else {
	for (int i = 0; i < (5 - intPart); i++) {
		out.print("<i aria-hidden=\"true\" class=\"fa fa-star-o\"></i>");	
	}	
}
%>
                
                <p>Average Rating</p>
            </div>

            <div class="bar-chart">
                <table class="rating-table">
                    <tr>
                        <td class="rating-label">5 star</td>
                        <td class="rating-bar"><div class="progress-1"></div></td>
                        <td class="rating-label"><%=fiveStarPercent%>%</td>
                    </tr>
                    <tr>
                        <td class="rating-label">4 star</td>
                        <td class="rating-bar"><div class="progress-2"></div></td>
                        <td class="rating-label"><%=fourStarPercent%>%</td>
                    </tr>
                    <tr>
                        <td class="rating-label">3 star</td>
                        <td class="rating-bar"><div class="progress-3"></div></td>
                        <td class="rating-label"><%=threeStarPercent%>%</td>
                    </tr>
                    <tr>
                        <td class="rating-label">2 star</td>
                        <td class="rating-bar"><div class="progress-4"></div></td>
                        <td class="rating-label"><%=twoStarPercent%>%</td>
                    </tr>
                    <tr>
                        <td class="rating-label">1 star</td>
                        <td class="rating-bar"><div class="progress-5"></div></td>
                        <td class="rating-label"><%=oneStarPercent%>%</td>
                    </tr>
                </table>
            </div>

            <div style="clear: both;"></div>

            <div class="reviews">
                <h3>Reviews</h3>
            </div>

<%
List<Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");

for(Review review : reviews) {
	out.print("<div class=\"review\">");	
	out.print("<div class=\"reviewer\">");
	out.print("<div class=\"reviewer-thumbnail\">");
	out.print("<img src=\"" + review.getReviewerAvatar() + "\">");
	out.print("</div>");
	out.print("<div class=\"reviewer-information\">");
	out.print("<h4>" + review.getReviewDate() + "</h4>");
	out.print("<p>" + review.getReviewerName() + "</p>");
	out.print("<span>Report</span>");
	out.print("</div>");
	out.print("<div style=\"clear: both;\"></div>");
	out.print("</div>");
	out.print("<div class=\"reviewer-comment\">");

	int rating = review.getRating();
	for (int i = 0; i < rating; i ++) {
	    out.print("<i aria-hidden=\"true\" class=\"fa fa-star\"></i>");
	}
	for (int i = 0; i < (5 - rating); i++) {
		out.print("<i aria-hidden=\"true\" class=\"fa fa-star-o\"></i>");
	}
	
	out.print("<p>" + review.getReviewDescription() + "</p>");
	out.print("</div>");
	out.print("<div style=\"clear: both;\"></div>");
	out.print("</div>");
}
%>   
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
</body>
</html>