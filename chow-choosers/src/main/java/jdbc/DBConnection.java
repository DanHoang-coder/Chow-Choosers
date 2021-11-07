package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;

public class DBConnection {
   private static Connection connection = null;
   static ServletContext servletContext;

   static void getDBConnection() {
      try {
         Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
         return;
      }

      setConnection(null);
      try {
         UtilProp.loadProperty(servletContext);
         setConnection(DriverManager.getConnection(getURL(), getUserName(), getPassword()));
      } catch (Exception e) {
         e.printStackTrace();
         return;
      }

      if (getConnection() != null) {
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
   
   public static Connection getConnection() {
	   return connection;   
   }
   
   public static void setConnection(Connection connection) {
	   DBConnection.connection = connection;
   }
}