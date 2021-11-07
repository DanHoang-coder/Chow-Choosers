<!-- Dan Hoang
     admin.jsp
     10/15/2021
-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="user.User" %>

<jsp:include page="tabbarcontroller.jsp">
    <jsp:param name="page" value="admin" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Chow Choosers: Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/main.css" media="screen">
<link rel="stylesheet" type="text/css" href="styles/print.css" media="print">
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
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
		<li><a href="history.jsp">Our History</a></li>
		<li><a href="specials.jsp">Specials</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<%= request.getAttribute("navlist")%>
	</ul>
    </nav>

    <main>
        <h1><span>Admin Panel</span></h1>

        <table>
            <tr>
                <th>User Type</th>
                <th>User Name</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th> </th>
            </tr>    
    
<% 
    List<User> users = (ArrayList<User>) request.getAttribute("users");

    for(User user : users)
    {
    	out.print("<tr>");
    	out.print("<td>" + user.getType() + "</td>");
    	out.print("<td>" + user.getUsername() + "</td>");
    	out.print("<td>" + user.getFirstname() + "</td>");
    	out.print("<td>" + user.getLastname() + "</td>");
    	out.print("<td>" + user.getEmail() + "</td>");
    	out.print("<td>" + user.getPhone() + "</td>");
    	out.print("<td>");
    	if(user.getType().equals("NORMAL")) {
    	    out.print("<form action=\"admin\" method=\"post\"><input type=\"hidden\" name=\"username\" value=\"" + user.getUsername() + "\"><input type=\"submit\" value=\"Delete\"></form>");
    	}
    	out.print("</td>");
    	out.print("</tr>");
    }
%>    
        </table>
            
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