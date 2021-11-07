package user;

import java.sql.*;
import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) {

        User user = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            DBConnection.getDBConnection(getServletContext());
            connection = DBConnection.getConnection();
            
            String selectSQL = "SELECT * FROM users WHERE USERNAME = ? and PASSWORD = ?";

            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setType(rs.getString("USERTYPE"));
                user.setUsername(rs.getString("USERNAME"));
                user.setPassword(rs.getString("PASSWORD"));
                user.setFirstname(rs.getString("FIRSTNAME"));
                user.setLastname(rs.getString("LASTNAME"));
                user.setEmail(rs.getString("EMAIL"));
                user.setPhone(rs.getString("PHONE"));
            }

            rs.close();
            preparedStatement.close();
            connection.close();      
        } catch (SQLException se) {
        	se.printStackTrace();	
        } catch (Exception e) {
        	e.printStackTrace();	
        } finally {
        	try {
        		if (preparedStatement != null)
        			preparedStatement.close();	
        	} catch (SQLException se2) {
        		
        	}
        	try {
        		if (connection != null)
        			connection.close();	
        	} catch (SQLException se) {
        		se.printStackTrace();
        	}  	
        }

        try {
            String destPage = "login.jsp";
            
            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                destPage = "index.jsp";
            } else {
                request.setAttribute("errorMessage", "Invalid username/password"); 
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}