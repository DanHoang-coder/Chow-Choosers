package review;

public class Restaurant {
    private String restaurantType;
    private String restaurantName;
    private String restaurantDescription;
    private String streetAddress;
    private String city;
    private String state;
    private int zipCode;
    private String avatar;
    private int numOneStar, numTwoStar, numThreeStar, numFourStar, numFiveStar;

    public String getRestaurantType() {
        return restaurantType;
    }
    public void setRestaurantType(String restaurantType) {
        this.restaurantType = restaurantType;
    }
    public String getRestaurantName() {
        return restaurantName;
    }
    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
    public String getRestaurantDescription() {
        return restaurantDescription;
    }
    public void setRestaurantDescription(String restaurantDescription) {
        this.restaurantDescription = restaurantDescription;
    }
    public String getStreetAddress() {
        return streetAddress;
    }
    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public int getZipCode() {
        return zipCode;
    }
    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public int getNumOneStar() {
        return numOneStar;
    }
    public void setNumOneStar(int numOneStar) {
        this.numOneStar = numOneStar;
    }
    public int getNumTwoStar() {
        return numTwoStar;
    }
    public void setNumTwoStar(int numTwoStar) {
        this.numTwoStar = numTwoStar;
    }
    public int getNumThreeStar() {
        return numThreeStar;
    }
    public void setNumThreeStar(int numThreeStar) {
        this.numThreeStar = numThreeStar;
    }
    public int getNumFourStar() {
        return numFourStar;
    }
    public void setNumFourStar(int numFourStar) {
        this.numFourStar = numFourStar;
    }
    public int getNumFiveStar() {
        return numFiveStar;
    }
    public void setNumFiveStar(int numFiveStar) {
        this.numFiveStar = numFiveStar;
    }
    public int getNumStars() {
        return (numOneStar + numTwoStar + numThreeStar + numFourStar + numFiveStar);
    }
    public float getAverageRating() {
        float average = 0f;
        int total = 0;
        total = (numOneStar * 1) + (numTwoStar * 2) + (numThreeStar * 3) + (numFourStar * 4) + (numFiveStar * 5);
        average = (float) total / getNumStars();
        return average;
    }
}