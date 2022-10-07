package tTour.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import tTour.model.User;

public class TtourDAO_db extends DbConnect implements CrudInterface {
	
	public boolean userAuth(User user) throws SQLException {
		boolean exists = false;
		Connection con = null;
		String sql = "SELECT * FROM users WHERE email = ? and paswd = ?";
	
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getEmail());
	        stmt.setString(2, user.getPassword());
			ResultSet result = stmt.executeQuery();
			if(result.next()) {
				exists = true;
			}
			stmt.close();
			closeCon(con);
		return exists;
	}
	public User getUser(User user) throws SQLException {
		Connection con = null;
		String sql = "SELECT * FROM users WHERE email = ? and paswd = ?";
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getEmail());
	        stmt.setString(2, user.getPassword());
			ResultSet result = stmt.executeQuery();
			user.setName(result.getString("name"));
			user.setUserType(result.getString("user_type"));
			user.setEmail(result.getString("email"));
			stmt.close();
			closeCon(con);
		return user;
	}

	@Override
	public boolean create(User user) throws SQLException {
		// TODO Auto-generated method stub
		boolean success = false;
		Connection con = null;
		String sql = "INSERT INTO users(name,email,user_type,paswd) VALUES(?,?,?,?)";
		
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3,user.getUserType());
			stmt.setString(4,user.getPassword());
			int result = stmt.executeUpdate();
			System.out.println("Result: "+result);
			if(result>0) {
				success = true;
			}
			stmt.close();

			closeCon(con);
		
		return success;
	}

	@Override
	public boolean delete(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return false;
	}

}
