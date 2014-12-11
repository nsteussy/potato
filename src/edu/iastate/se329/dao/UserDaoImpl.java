package edu.iastate.se329.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class UserDaoImpl implements UserDao {

	@Autowired
	NamedParameterJdbcTemplate namedParameterTemplate;
	
	private static final String validate = "";
	private static final String getFlashCardsByDeckId = "";
	private static final String createUser = "";
	private static final String updateUser = "";
	private static final String deleteUser = "";

}
