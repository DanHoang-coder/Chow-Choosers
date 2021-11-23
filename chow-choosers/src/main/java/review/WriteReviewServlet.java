package review;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import user.User;

import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/WriteReview")
public class WriteReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public WriteReviewServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int restaurantID = Integer.parseInt(request.getParameter("restaurantID"));
        Restaurant restaurant = null;

        Connection connection = null;
    	PreparedStatement preparedStatement = null;
    	try {
    	    DBConnection.getDBConnection(getServletContext());
    	    connection = DBConnection.getConnection();
    	            
    	    String find1SQL = "SELECT * FROM Restaurants WHERE RestaurantID = ?";
    	    preparedStatement = connection.prepareStatement(find1SQL);
            preparedStatement.setInt(1, restaurantID);
    	    ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setRestaurantID(restaurantID);
                restaurant.setRestaurantType(rs.getString("RestaurantType"));
                restaurant.setRestaurantName(rs.getString("RestaurantName"));
                restaurant.setRestaurantDescription(rs.getString("RestaurantDescription"));
                restaurant.setStreetAddress(rs.getString("StreetAddress"));
                restaurant.setCity(rs.getString("City"));
                restaurant.setState(rs.getString("State"));
                restaurant.setZipCode(rs.getInt("ZipCode"));
                restaurant.setAvatar(rs.getString("Avatar"));
            }

            rs.close();
            preparedStatement.close();
            connection.close();           

            request.setAttribute("restaurant", restaurant);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("reviewform.jsp");
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int restaurantID = Integer.parseInt(request.getParameter("restaurantID"));
    	String reviewDescription = request.getParameter("reviewDescription");
        int rating = Integer.parseInt(request.getParameter("rating")); 

        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("user") != null) {
            User user = (User)session.getAttribute("user");

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            try {
                DBConnection.getDBConnection(getServletContext());
                connection = DBConnection.getConnection();
            
                String insertSQL = "INSERT INTO Reviews (ReviewDescription, Rating, UserID, RestaurantID) VALUES (?,?,?,?)";

                preparedStatement = connection.prepareStatement(insertSQL);
                preparedStatement.setString(1, reviewDescription);
                preparedStatement.setInt(2, rating);
                preparedStatement.setInt(3, user.getUserID());
                preparedStatement.setInt(4, restaurantID);
                preparedStatement.executeUpdate();

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
            
            response.sendRedirect("review?restaurantID="+restaurantID);           
        }
    	
    }
}