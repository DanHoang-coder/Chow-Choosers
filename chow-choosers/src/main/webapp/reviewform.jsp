<!-- Dan Hoang
     reviewform.jsp
     10/15/2021
-->

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="reviewform" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: Write a Review</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" type="text/css" href="styles/rating.css" media="screen">
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
		<li class="current"><a href="contact.jsp">Review</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>
        <h1><span>Write a Review</span></h1>
        <p class="focus-text">Help the community decide.</p>
  
        <div class="my-form">
            <form action="" method="post">
                <ul>
                    <li>  
                        <fieldset>
                            <legend><span class="number">1</span> Rating</legend>
                            <div class="star-plugin">
                                <div class="css3-rating-stars">
                                    <input type="radio" name="star-rating-1" id="star-rating-1-0" value="5" />
                                    <label for="star-rating-1-0"></label>
                                    <input type="radio" name="star-rating-1" id="star-rating-1-1" value="4" />
                                    <label for="star-rating-1-1"></label>
                                    <input type="radio" name="star-rating-1" id="star-rating-1-2" value="3" />
                                    <label for="star-rating-1-2"></label>
                                    <input type="radio" name="star-rating-1" id="star-rating-1-3" value="2" />
                                    <label for="star-rating-1-3"></label>
                                    <input type="radio" name="star-rating-1" id="star-rating-1-4"  value="1" />
                                    <label for="star-rating-1-4"></label>
                                </div>
                            </div> 
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend><span class="number">2</span> Your Review</legend>
                            <textarea name="message" rows="7" cols="56" placeholder="Message *"></textarea>
                        </fieldset>
                    </li> 
                    <li>
                        <input type="submit" value="Send">
                        <input type="reset" value="Clear Form">
                    </li>
                </ul>
            </form>
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