package review;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import jdbc.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/review")
public class ReadReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReadReviewServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    	
        int restaurantID = Integer.parseInt(request.getParameter("restaurantID"));
        Restaurant restaurant = null;
        Review review = null;

        Connection connection = null;
    	PreparedStatement psRestaurant = null;
        PreparedStatement psReview = null;
        PreparedStatement psUser = null;
    	try {
    	    DBConnection.getDBConnection(getServletContext());
    	    connection = DBConnection.getConnection();
    	            
    	    String find1SQL = "SELECT * FROM Restaurants WHERE RestaurantID = ?";
    	    psRestaurant = connection.prepareStatement(find1SQL);
            psRestaurant.setInt(1, restaurantID);
    	    ResultSet rs1 = psRestaurant.executeQuery();
            if (rs1.next()) {
                restaurant = new Restaurant();
                restaurant.setRestaurantID(restaurantID);
                restaurant.setRestaurantType(rs1.getString("RestaurantType"));
                restaurant.setRestaurantName(rs1.getString("RestaurantName"));
                restaurant.setRestaurantDescription(rs1.getString("RestaurantDescription"));
                restaurant.setStreetAddress(rs1.getString("StreetAddress"));
                restaurant.setCity(rs1.getString("City"));
                restaurant.setState(rs1.getString("State"));
                restaurant.setZipCode(rs1.getInt("ZipCode"));
                restaurant.setAvatar(rs1.getString("Avatar"));
            }

    	    String find2SQL = "SELECT * FROM Reviews WHERE RestaurantID = ?";
    	    psReview = connection.prepareStatement(find2SQL);
            psReview.setInt(1, restaurantID);
    	    ResultSet rs2 = psReview.executeQuery();
    	            
            String find3SQL = "SELECT * FROM Users WHERE UserID = ?";
    	    psUser = connection.prepareStatement(find3SQL);

    	    List<Review> reviews = new ArrayList<Review>();
            int numOneStar = 0;
            int numTwoStar = 0;
            int numThreeStar = 0;
            int numFourStar = 0;
            int numFiveStar = 0;

    	    while(rs2.next()) {
    	        review = new Review();
    	        review.setReviewDate(rs2.getTimestamp("ReviewDate"));
    	        review.setReviewDescription(rs2.getString("ReviewDescription"));
    	        int rating = rs2.getInt("Rating");
                review.setRating(rating);

                if (rating == 1)
                    numOneStar++;
                else if (rating == 2)
                    numTwoStar++;
                else if (rating == 3)
                    numThreeStar++;
                else if (rating == 4)
                    numFourStar++;
                else if (rating == 5)
                    numFiveStar++;

                psUser.setInt(1, rs2.getInt("UserID"));
    	        ResultSet rs3 = psUser.executeQuery();
                if (rs3.next()) {
                    String reviewerName = rs3.getString("FirstName") + " " + rs3.getString("LastName");
    	            review.setReviewerName(reviewerName);
    	            review.setReviewerAvatar(rs3.getString("Avatar"));
                }

                rs3.close();
    	        reviews.add(review);
    	    }

            if (restaurant != null) {
                restaurant.setNumOneStar(numOneStar);
                restaurant.setNumTwoStar(numTwoStar);
                restaurant.setNumThreeStar(numThreeStar);
                restaurant.setNumFourStar(numFourStar);
                restaurant.setNumFiveStar(numFiveStar);
            }

            rs1.close();
            rs2.close();
            psRestaurant.close();
            psReview.close();
            psUser.close();
            connection.close();            
            
            request.setAttribute("restaurant", restaurant);
    	    request.setAttribute("reviews", reviews);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
    	    dispatcher.forward(request, response);
        } catch (SQLException se) {
            se.printStackTrace();	
    	} catch (Exception e) {
            e.printStackTrace();	
        } finally {
            try {
                if (psRestaurant != null)
                    psRestaurant.close();
                if (psReview != null)
                    psReview.close();
                if (psUser != null)
                    psUser.close();
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
    }
}