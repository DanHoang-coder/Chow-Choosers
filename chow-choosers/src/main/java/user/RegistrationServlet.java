package user;

import java.sql.*;
import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Connection connection = null;
        PreparedStatement preparedStatement1 = null;
        PreparedStatement preparedStatement2 = null;
        ResultSet rs = null;
        try {
            DBConnection.getDBConnection(getServletContext());
            connection = DBConnection.getConnection();
            
            String selectSql = "SELECT username FROM users WHERE username = ?";
            preparedStatement1 = connection.prepareStatement(selectSql);          
            preparedStatement1.setString(1, username);            
            rs = preparedStatement1.executeQuery();            
            
            if(rs.next()) {
                preparedStatement1.close();
                rs.close();
                connection.close(); 

                request.setAttribute("errorMessage", "The username: " + username + " is not available"); 
                RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
                dispatcher.forward(request, response);           
            } else {
                String insertSql = "INSERT INTO users (id, USERTYPE, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, EMAIL, PHONE) values (default, default, ?, ?, ?, ?, ?, ?)";

                preparedStatement2 = connection.prepareStatement(insertSql);
                preparedStatement2.setString(1, firstname);
                preparedStatement2.setString(2, lastname);
                preparedStatement2.setString(3, username);
                preparedStatement2.setString(4, password);
                preparedStatement2.setString(5, email);
                preparedStatement2.setString(6, phone);
                preparedStatement2.execute();

                preparedStatement2.close();
                connection.close();
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("redirect.html");
                dispatcher.forward(request, response);               	
            }            
        } catch (SQLException se) {
        	se.printStackTrace();	
        } catch (Exception e) {
        	e.printStackTrace();	
        } finally {
        	try {
        		if (preparedStatement1 != null)
        			preparedStatement1.close();
        		if (preparedStatement2 != null)
        			preparedStatement2.close();	
        	} catch (SQLException se2) {
        		
        	}
        	try {
        		if (connection != null)
        			connection.close();	
        	} catch (SQLException se) {
        		se.printStackTrace();
        	}  	
        }
    }
}