package search;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import review.Restaurant;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    	

        Restaurant restaurant = null;
        Connection connection = null;
    	PreparedStatement preparedStatement = null;
    	try {
    	    DBConnection.getDBConnection(getServletContext());
    	    connection = DBConnection.getConnection();
    	            
    	    String find1SQL = "SELECT * FROM Restaurants";
    	    preparedStatement = connection.prepareStatement(find1SQL);
    	    
    	    List<Restaurant> restaurants = new ArrayList<Restaurant>();
    	    ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setRestaurantID(rs.getInt("RestaurantID"));
                restaurant.setRestaurantType(rs.getString("RestaurantType"));
                restaurant.setRestaurantName(rs.getString("RestaurantName"));
                restaurant.setRestaurantDescription(rs.getString("RestaurantDescription"));
                restaurant.setStreetAddress(rs.getString("StreetAddress"));
                restaurant.setCity(rs.getString("City"));
                restaurant.setState(rs.getString("State"));
                restaurant.setZipCode(rs.getInt("ZipCode"));
                restaurant.setAvatar(rs.getString("Avatar"));
                restaurants.add(restaurant);
            }

            rs.close();
            preparedStatement.close();
            connection.close();            
            
            request.setAttribute("restaurants", restaurants);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
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
    	String keyword = request.getParameter("keyword");
    	String chosenOne = request.getParameter("chosenOne");

        Restaurant restaurant = null;
        Connection connection = null;
    	PreparedStatement preparedStatement = null;
    	try {
    	    DBConnection.getDBConnection(getServletContext());
    	    connection = DBConnection.getConnection();
 
            String findSQL = "";      
            switch(chosenOne) {
                case "1":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) = 5) "
                            + "ORDER BY RestaurantID";
                    break;
                case "2":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) = 4) "
                            + "ORDER BY RestaurantID";
                    break;
                case "3":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) >= 4) "
                            + "ORDER BY RestaurantID";
                    break;
                case "4":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT CEILING(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) <= 4) "
                            + "ORDER BY RestaurantID";
                    break;
                case "5":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) = 3) "
                            + "ORDER BY RestaurantID";
                    break;
                case "6":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) >= 3) "
                            + "ORDER BY RestaurantID";
                    break;
                case "7":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT CEILING(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) <= 3) "
                            + "ORDER BY RestaurantID";
                    break;
                case "8":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) = 2) "
                            + "ORDER BY RestaurantID";
                    break;
                case "9":
                    findSQL = "SELECT * FROM Restaurants WHERE (RestaurantName like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) >= 2) "
                            + "ORDER BY RestaurantID";
                    break;
                case "10":
                    findSQL = "SELECT * FROM Restaurants WHERE (RestaurantName like ?) and "
                            + "((SELECT CEILING(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) <= 2) "
                            + "ORDER BY RestaurantID";
                    break;
                case "11":
                    findSQL = "SELECT * FROM Restaurants WHERE (Tags like ?) and "
                            + "((SELECT FLOOR(AVG(Rating)) FROM Reviews WHERE Reviews.RestaurantID = Restaurants.RestaurantID) = 1) "
                            + "ORDER BY RestaurantID";
                    break;                
                default:
                    findSQL = "SELECT * FROM Restaurants WHERE Tags like ? ORDER BY RestaurantID";
            }
            
            preparedStatement = connection.prepareStatement(findSQL);
            preparedStatement.setString(1, "%" + keyword + "%");
    	    
    	    List<Restaurant> restaurants = new ArrayList<Restaurant>();
    	    ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setRestaurantID(rs.getInt("RestaurantID"));
                restaurant.setRestaurantType(rs.getString("RestaurantType"));
                restaurant.setRestaurantName(rs.getString("RestaurantName"));
                restaurant.setRestaurantDescription(rs.getString("RestaurantDescription"));
                restaurant.setStreetAddress(rs.getString("StreetAddress"));
                restaurant.setCity(rs.getString("City"));
                restaurant.setState(rs.getString("State"));
                restaurant.setZipCode(rs.getInt("ZipCode"));
                restaurant.setAvatar(rs.getString("Avatar"));
                restaurants.add(restaurant);
            }

            rs.close();
            preparedStatement.close();
            connection.close();     
            
            request.setAttribute("selectedItem", chosenOne);
            request.setAttribute("restaurants", restaurants);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
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