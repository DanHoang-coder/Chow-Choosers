<!-- Dan Hoang
     specials.jsp
     10/15/2021
-->

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="specials" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: Specials</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" type="text/css" href="styles/specials.css" media="screen">
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
		<li class="current"><a href="specials.html">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>
    <main>
        <div class="specials">
            <h1>The Downtown Diner <span>7-Day SUPERFOOD PLAN</span></h1>
            <p class="focus-text">We offer the following specials each day of the week:</p>
            <ul>
                <li>
                    <!-- Creative Commons image from: https://commons.wikimedia.org/wiki/File:FriedDumplings.JPG -->
                    <img src="images/specials/Chicken_an_Dumplings.jpg" alt="Chicken an Dumplings" />
                    <h3>Monday</h3>
                    <p>Chicken an Dumplings</p>
                </li>
                <li>
                    <!-- Creative Commons image from: http://3.bp.blogspot.com/_ka84363yKyw/S0_WpVjs58I/AAAAAAAABi0/b8Ju7PPjE9I/s400/blog+pics+2434.jpg -->
                    <img src="images/specials/Meatloaf.jpg" alt="Meat Loaf" />
                    <h3>Tuesday</h3>
                    <p>Meatloaf</p>
                </li>
                <li>
                    <!-- Creative Commons image from: http://2.bp.blogspot.com/_qGWz7Rpqevc/S_hHL3tQNeI/AAAAAAAACOE/ieZjQxbU1a8/s400/inner+martha+7+159.jpg -->
                    <img src="images/specials/Chicken_fried_Steak.jpg" alt="Chicken Fried Steak" />
                    <h3>Wednesday</h3>
                    <p>Chicken fried Steak</p>
                </li>
                <li>
                    <!-- Creative Commons image from: https://i2.wp.com/utahdealdiva.com//wp-content/uploads/2009/08/0092.jpg?zoom=1.25&w=1000 -->
                    <img src="images/specials/Chip_Casserole.jpg" alt="Chip Casserole" />
                    <h3>Thursday</h3>
                    <p>Chip's Casserole</p>
                </li>
                <li>
                    <!-- Creative Commons image from: http://elmaestro.wikis.birmingham.k12.mi.us/file/view/breakfast-burrito.jpg/202952406/breakfast-burrito.jpg -->
                    <img src="images/specials/Fiesta_Burrito.jpg" alt="Fiesta Burrito" />
                    <h3>Friday</h3>
                    <p>Fiesta Burrito</p>
                </li>
                <li>
                    <!-- Creative Commons image from: http://3.bp.blogspot.com/-Fd7TVwb4M_0/TyLa1oZVk1I/AAAAAAAAAAM/VGPZ1U86v34/s320/pollo-fritto.jpg -->
                    <img src="images/specials/Fried_Chicken.jpg" alt="Fried Chicken" />
                    <h3>Saturday</h3>
                    <p>Fried Chicken</p>
                </li>
                <li>
                    <!-- Creative Commons image from: http://4.bp.blogspot.com/-JHXiuLggvzc/TYF8Fv6SujI/AAAAAAAADZk/mN-qWfrFFYY/s400/irish_beef_stew_1.jpg -->
                    <img src="images/specials/Beef_Stew.jpg" alt="Beaf Stew" />
                    <h3>Sunday</h3>
                    <p>Drive's Special Beef Stew</p>
                </li>
            </ul>
        </div>

        <div class="video-laptop" > 
            <div>
                <video width="320" height="240" controls poster="images/downtown_diner_video_thumbnail.jpg">
                    <source src="videos/downtown_diner.mp4" type="video/mp4">
                    <source src="videos/downtown_diner.ogv" type="video/ogv">
                    <!-- fallback to Flash: -->
                    <object type="video/x-ms-wmv" data="videos/downtown_diner.wmv" width="320" height="240">
	                <embed type="video/x-ms-wmv" src="videos/downtown_diner.wmv" width="320" height="240" />
	            </object>
                </video>
            </div>
        </div>
        <h2 style="text-align: center">We hope you will join us at The Downtown Diner for a meal.</h2>
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