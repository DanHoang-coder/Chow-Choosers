<!-- Dan Hoang
     contact.jsp
     10/15/2021
-->

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="contact" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: Contact Us</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" type="text/css" href="styles/form.css" media="screen">
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
		<li class="current"><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>
        <h1>Contact <span>Chow Choosers</span></h1>
        <p class="focus-text">Send us a message and we'll respond as soon as possible.</p>
        <div class="my-form">
            <form action="https://www.mccinfo.net/webresources/cgi-bin/formmail.asp" method="post">
                <input type="hidden" name="recipient" value="danhoang@unomaha.edu">
                <input type="hidden" name="subject" value="INFO1311 Final Assignment">
                <input type="hidden" name="required" value="firstname,lastname,email,message">
                <input type="hidden" name="redirect" value="http://student.mccinfo.net/~dhoang2/module9/return.html">
                <input type="hidden" name="return_link_title" value="The Downtown Diner">
                <input type="hidden" name="bgcolor" value="#FFFF99">
                <input type="hidden" name="title" value="Thank you for taking the time to complete the form.">
                <input type="hidden" name="font_face" value="Arial,Helvetica">
                <input type="hidden" name="font_size" value="6">
                <input type="hidden" name="text_color" value="#000000">

                <ul>
                    <li>
                        <fieldset>
                            <legend><span class="number">1</span> Your Name</legend>
                            <input type="text" name="firstname" placeholder="First *">
                            <input type="text" name="lastname"  placeholder="Last *">
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend><span class="number">2</span> Contact Information</legend>
                                <input type="email" name="email" placeholder="Email *">
                                <input type="text" name="phone" placeholder="Phone">
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend><span class="number">3</span> General Inquiry</legend>
                            <textarea name="message" rows="7" cols="56" placeholder="Message *"></textarea>
                        </fieldset>
                    </li> 
                    <li>
                        <fieldset>
                            <legend><span class="number">4</span> Contact Preference</legend>
                            <input type="radio" id="by-email" name="contact-preference" value="by-email" checked>
                            <label for="by-email">Email</label>
                            <input type="radio" id="by-phone" name="contact-preference" value="by-phone">
                            <label for="by-phone">Phone</label>
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