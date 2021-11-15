<!-- Dan Hoang
     index.jsp
     10/15/2021
-->

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="index" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
</head>
<body>

<div id="wrapper">
    <header>
        <img src="images/logo.jpg" width="361" height="53" alt="Chow Choosers"><h2>Chow Choosers</h2>
    </header>
    <nav>
	<ul>
		<li><a href="index.jsp" class="home"><img src="images/home.png" alt="Home"><span>Home</span></a></li>
		<li><a href="history.jsp">Our History</a></li>
		<li><a href="specials.jsp">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>
        <div class="pic-frame">
            <img src="images/diner-view1.jpg" alt="Chow Choosers" width="1334" height="397">
            <div class="pic-description">
                <h1>Local Restaurant Finder<span>FINDING NEW PLACES TO EAT</span></h1>
                <span><b>Review/Rating system progress (for testing purpose):</b><br>http://ec2-18-219-122-60.us-east-2.compute.amazonaws.com:8080/chow-choosers/review?restaurantID?=1<br>http://ec2-18-219-122-60.us-east-2.compute.amazonaws.com:8080/chow-choosers/review?restaurantID?=1<br>http://ec2-18-219-122-60.us-east-2.compute.amazonaws.com:8080/chow-choosers/reviewform.jsp<br><br></span>
                <span>Finding new places to eat can be an overwhelming task, especially in cities with dense restaurant populations like Omaha. To find new restaurants, people are forced to sift through Google recommendations, Yelp reviews, or other limited services that aren't designed specifically with restaurant selection in mind. Our team's project idea is to create an application that recommends a restaurant to the user based on their current preferences. To input their eating preferences, the user will be able to toggle a series of buttons, including their current location, distance they're willing to travel, the type of food they want to eat (i.e. Mexican, Indian, Chinese), a price range, whether or not the restaurant does delivery, as well as a Surprise Me button that recommends something random. To keep the project reasonable for a small group project, we will populate our database using a cherry-picked list of restaurants in the Omaha area. This application will allow the user to easily browse a list of restaurants based on their selection, eliminating the hectic process of choosing a restaurant without advice.</span>
            </div>
        </div>

        <div class="clear"></div>
    </main>
    <footer>
        <ul>
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