<%@ page import="java.lang.*" %>
<%@ page import="user.User" %>

<%
    User user = (User)session.getAttribute("user");
    StringBuilder strBuilder = new StringBuilder();     
    if(user != null) {
        String firstname = user.getFirstname();
        String lastname = user.getLastname();
        String usertype = user.getType();
        
        String strPage = (String) request.getParameter("page");
        switch(strPage)
        {
            case "index":
            case "history":
            case "specials":
            case "contact":
                strBuilder.append("<li><a href=\"setting.jsp\">Setting</a></li>");
                strBuilder.append("<li><a href=\"logout\">" + firstname + lastname + "Logout</a></li>");    
                if(usertype.equals("ADMIN")) {
                    strBuilder.append("<li><a href=\"admin\">Admin</a></li>");
                }
                break;
            case "admin":
                strBuilder.append("<li><a href=\"setting.jsp\">Setting</a></li>");
                strBuilder.append("<li><a href=\"logout\">" + firstname + lastname + "Logout</a></li>");    
                if(usertype.equals("ADMIN")) {
                    strBuilder.append("<li class=\"current\"><a href=\"admin\">Admin</a></li>");
                }
                break;    
            default:
                strBuilder.append("");
        }
    } else {
        strBuilder.append("<li><a href=\"registration.jsp\">Sign Up</a></li>");
        strBuilder.append("<li><a href=\"login.jsp\">Login</a></li>");
    }

    request.setAttribute("navlist", strBuilder.toString()); 
%>