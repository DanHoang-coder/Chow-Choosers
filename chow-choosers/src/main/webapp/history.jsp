<!-- Dan Hoang
     history.jsp
     10/15/2021
-->

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="history" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: History</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" type="text/css" href="styles/timeline.css" media="screen">
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
		<li class="current"><a href="history.html">Our History</a></li>
		<li><a href="specials.jsp">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>
    <main>
        <h1>Discover <span>OUR STORY</span></h1>
        <p class="focus-text">The Downtown Diner is a generational family owned and operated business!</p>
        <div class="timeline">
            <div class="time-period">
                <div class="content left">
                    <img src="images/history/bit_and_byte.jpg" alt="Downtown Diner" width="492" height="248">
                </div>
                <div class="content right">
                    <h2>1972</h2>
                    <p>The Downtown Diner first opened its doors in November of 1972! Bit and Byte Smith were new to Techieville and discovered an empty building on the corner of 5th and Hypertext Avenue. They always dreamed of opening up their own restaurant. That dream came true in the Fall of 1972 when they purchased the building and began construction on the Downtown Diner. They decided to have a grand opening on Thanksgiving Day and offered a free turkey dinner to all who attended. This became a tradition that is still being followed to this day. Every Thanksgiving Day, the Downtown Diner opens its doors and serves a free turkey dinner.</p>
                </div>
            </div>
            <div class="time-period">
                <div class="content left">
                    <img src="images/history/chip_and_drive.jpg" alt="Downtown Diner" width="492" height="248">
                </div>
                <div class="content right">
                    <h2>1994</h2>
                    <p>In 1994, Bit and Byte decided it was time to retire. They turned over the reins of the Diner to their son, Chip. Chip continues to manage the Diner today with the help of his wife, Drive. Chip and Drive have added a few of their own special recipes to the menu. But for the most part, the menu hasn't change too much from the original one.</p>
                </div>
            </div>
            <div class="time-period">
                <div class="content left">
                    <img src="images/history/downtowndiner_remodel.jpg" alt="Downtown Diner" width="492" height="248">
                </div>
                <div class="content right">
                    <h2>2002</h2>
                    <p>The Downtown Diner went through a major remodel in 2002. A private party room was added which can handle groups up to 40 people. If you would like to plan a private party at the Downtown Diner, please contact Chip or Drive at the restaurant.</p>
                </div>
            </div>
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