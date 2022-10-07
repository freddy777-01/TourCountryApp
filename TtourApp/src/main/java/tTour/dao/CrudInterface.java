package tTour.dao;

import java.sql.SQLException;

import tTour.model.User;

public interface CrudInterface {

	public boolean create(User user) throws SQLException;
	public boolean delete(User user)throws SQLException;
	public boolean update(User user) throws SQLException;
}
