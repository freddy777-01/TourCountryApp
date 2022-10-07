package tTour.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	protected Connection getConnection() throws SQLException {
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return DriverManager.getConnection("jdbc:sqlite:F:\\eclipse-workplace\\TtourApp\\database\\tTour.db");
	}
	
	protected void closeCon (Connection con) throws SQLException{
				con.close();
	}
}
