package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conn {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Can't load database driver");
			//e.printStackTrace();
			String strClassPath = System.getProperty("java.class.path");
            
            System.out.println("Classpath is " + strClassPath);
			return;
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/picturesquirrel", "root", "sasasa1122");
		} catch (SQLException e) {
			System.out.println("Can't connect to database.");
			return;
		}

		System.out.println("Connected to database.");

		try {
			conn.close();
		} catch (SQLException e) {

		}
	


	}

}
