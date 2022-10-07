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

public class RegionDAO extends DbConnect implements CrudInterface  {
	
	@Overload
	public boolean create(Region region) throws SQLException {
		// TODO Auto-generated method stub
		boolean success = false;
		Connection con = null;
		String sql = "INSERT INTO region(name,about,mayer_name) VALUES(?,?,?)";
		
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,region.getName());
			stmt.setString(2, region.getAbout());
//			stmt.setString(3,region.getImage());
			stmt.setString(3,region.getMayer());
			int result = stmt.executeUpdate();
			System.out.println("Result: "+result);
			if(result>0) {
				success = true;
			}
			stmt.close();

			closeCon(con);
		
		return success;
	}
	public List<Region> getRegions() throws SQLException{
		List<Region> results = new ArrayList<>();
		
		Connection con = null;
		String sql = "SELECT id,name FROM region";
		
		con = getConnection();
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet result = stmt.executeQuery();
		while(result.next()) {
			Region region = new Region();
			region.setId(result.getLong("id"));
			region.setName(result.getString("name"));
			
			results.add(region);
		}
		stmt.close();
		closeCon(con);
		return results;
	}
	
	public Region getRegion(Integer regionId) throws SQLException{
		
		Region region = new Region();
		Connection con = null;
		String sql = "SELECT name,about,image,mayer_name FROM region WHERE id ='"+regionId+"'";
		
		con = getConnection();
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet result = stmt.executeQuery();
		while(result.next()) {
			region.setName(result.getString("name"));
			region.setAbout(result.getString("about"));
			region.setMayer(result.getString("mayer_name"));
			region.setImage(result.getString("image"));
		}
		List<Council> regionCouncils = new CouncilDAO().getRegionCouncils(regionId);
		for(Council council: regionCouncils) {
			region.setCouncilList(council);
		}
		stmt.close();
		closeCon(con);
		return region;
	}

	@Overload
	public boolean delete(Region region) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Overload
	public boolean update(Region region) throws SQLException {
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
