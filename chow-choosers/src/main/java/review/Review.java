package review;

import java.sql.Timestamp;

public class Review {
    private Timestamp reviewDate;
    private String reviewDescription;
    private int rating;
    private String reviewerName;
    private String reviewerAvatar;

    public String getReviewDate() {
        Timestamp currentDate = new Timestamp(System.currentTimeMillis());

        // get time difference in seconds
        long milliseconds = currentDate.getTime() - reviewDate.getTime();
 
        return TimeAgo.toRelative(milliseconds, 1);
    }
    
    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }
    
    public String getReviewDescription() {
        return reviewDescription;
    }
    
    public void setReviewDescription(String reviewDescription) {
        this.reviewDescription = reviewDescription;
    }
    
    public int getRating() {
        return rating;
    }
    
    public void setRating(int rating) {
        this.rating = rating;
    }
    
    public String getReviewerName() {
        return reviewerName;
    }
    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }
    
    public String getReviewerAvatar() {
        return reviewerAvatar;
    }
    
    public void setReviewerAvatar(String reviewerAvatar) {
        this.reviewerAvatar = reviewerAvatar;
    }
}