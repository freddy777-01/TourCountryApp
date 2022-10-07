package tTour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tTour.model.Council;
import tTour.model.Region;
import tTour.model.User;

public class CouncilDAO extends DbConnect implements CrudInterface {

	
	@Overload
	public boolean create(Council council) throws SQLException {
		// TODO Auto-generated method stub
		boolean success = false;
		Connection con = null;
		String sql = "INSERT INTO council(name,region,about) VALUES(?,?,?)";
		
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,council.getName());
			stmt.setLong(2, council.getRegion());
//			stmt.setString(3,region.getImage());
			stmt.setString(3,council.getAbout());
			int result = stmt.executeUpdate();
			System.out.println("Result: "+result);
			if(result>0) {
				success = true;
			}
			stmt.close();

			closeCon(con);
		
		return success;
	}
	
	public List<Council> getRegionCouncils(Integer regionId)throws SQLException{
		List<Council> results = new ArrayList<>();
		
		Connection con = null;
		String sql = "SELECT name,about FROM council WHERE	region='"+regionId+"'";
		
		con = getConnection();
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet result = stmt.executeQuery();
		while(result.next()) {
			Council council = new Council();
			council.setName(result.getString("name"));
			council.setAbout(result.getString("about"));
			
			results.add(council);
		}
		stmt.close();
		closeCon(con);
		
		return results;
	}

	@Overload
	public boolean delete(Council council) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Overload
	public boolean update(Council council) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	@Override
	public boolean create(User user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(User user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(User user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
