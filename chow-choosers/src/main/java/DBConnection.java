import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;

public class DBConnection {
   static Connection connection = null;
   static ServletContext servletContext;

   static void getDBConnection() {
      try {
         Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
         return;
      }

      connection = null;
      try {
         UtilProp.loadProperty(servletContext);
         connection = DriverManager.getConnection(getURL(), getUserName(), getPassword());
      } catch (Exception e) {
         e.printStackTrace();
         return;
      }

      if (connection != null) {
      } else {
         System.out.println("Failed to make connection!");
      }
   }

   static String getURL() {
      String url = UtilProp.getProp("url");
      return url;
   }

   static String getUserName() {
      String usr = UtilProp.getProp("user");
      return usr;
   }

   static String getPassword() {
      String pwd = UtilProp.getProp("password");
      return pwd;
   }

   public static void getDBConnection(ServletContext context) {
      servletContext = context;
      getDBConnection();
   }
}