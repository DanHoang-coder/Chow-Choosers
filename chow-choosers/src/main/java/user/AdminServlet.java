package user;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    	
	
    	HttpSession session = request.getSession(false);
    	if(session != null) {
        	User user = (User)session.getAttribute("user");    		
    		if(user.getType().equals("ADMIN")) {

    			Connection connection = null;
    	        PreparedStatement preparedStatement = null;
    	        try {
    	            DBConnection.getDBConnection(getServletContext());
    	            connection = DBConnection.getConnection();
    	            
    	            String selectSQL = "SELECT * FROM Users";

    	            preparedStatement = connection.prepareStatement(selectSQL);
    	            ResultSet rs = preparedStatement.executeQuery();
    	            
    	            List<User> users = new ArrayList<User>();
    	            while(rs.next()) {
    	                user = new User();
    	                user.setType(rs.getString("UserType"));
    	                user.setUsername(rs.getString("UserName"));
    	                user.setPassword(rs.getString("PassWord"));
    	                user.setFirstname(rs.getString("FirstName"));
    	                user.setLastname(rs.getString("LastName"));
    	                user.setEmail(rs.getString("Email"));
    	                user.setPhone(rs.getString("Phone"));
    	                users.add(user);
    	            }
    	            
    	            request.setAttribute("users", users);
    	            RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
    	            dispatcher.forward(request, response);
          
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
    		}
    	}  
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String username = request.getParameter("username");
    	
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            DBConnection.getDBConnection(getServletContext());
            connection = DBConnection.getConnection();
            
            String deleteSQL = "DELETE FROM Users WHERE UserName = ? and UserType = 'NORMAL'";

            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();
  
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
    	
    	doGet(request, response);
    }
}