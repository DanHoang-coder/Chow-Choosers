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
                <h1>Local Restaurant <span>SERVING FRESH FOODS</span></h1>
                <span>The Downtown Diner is located in the heart of Techieville! We specialize in good-ole home cooking. Our menu ranges from chicken dumplings to our famous fiesta burrito. Our breakfast menu is available all day. Please come by and share a meal with us. We are conveniently located on the corner of 5th and Hypertext Avenue.</span>
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