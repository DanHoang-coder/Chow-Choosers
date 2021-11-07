<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<link rel="stylesheet" type="text/css" href="styles/form.css" media="screen">
</head>
<body>

<!-- Dan Hoang
     registration.jsp
     10/15/2021
-->

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
		<li class="current"><a href="registration.jsp">Sign Up</a></li>
		<li><a href="login.jsp">Login</a></li>
	</ul>
    </nav>

    <main>
        <h1><span>Registration</span></h1>
        <p class="focus-text">Create a user account.</p>
        <div class="my-form">
            <form action="registration" method="post">
                <ul>
                    <li>
                        <fieldset>
                            <legend><span class="number">1</span> Your Name</legend>
                            <input type="text" name="firstname" placeholder="First name">
                            <input type="text" name="lastname" placeholder="Last name">
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend><span class="number">2</span> Contact Information</legend>
                                <input type="email" name="email" placeholder="Email *" required>
                                <input type="text" name="phone" placeholder="Phone">
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            <legend><span class="number">3</span> Login Information</legend>
                            <input type="text" name="username" placeholder="Username *" required>
                            <input type="text" name="password" placeholder="Password *" required>
                        </fieldset>
                    </li> 
                    <li>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Clear Form">
                    </li>
                </ul>
            </form>
            
<%
    if(request.getAttribute("errorMessage") != null)
    {
        out.print("<p style=\"color:red; margin:0; padding:0;\">" + request.getAttribute("errorMessage") + "</p>");
        request.removeAttribute("errorMessage");
    }
%>            
            
        </div>
        <div class="clear"></div>
    </main>
    <footer>
        <ul>
            <li><a href="history.html" class="blue">History</a></li>
            <li><a href="specials.html" class="blue">Specials</a></li>
            <li><a href="contact.html" class="blue">Contact</a></li>
        </ul>
        <p>Copyright &copy; 2021 Chow Choosers</p>
        <p>Created by: <a href="mailto:dhoang2@mail.mccneb.edu" class="black">Dan Hoang</a></p>
    </footer>
</div>
</body>
</html>