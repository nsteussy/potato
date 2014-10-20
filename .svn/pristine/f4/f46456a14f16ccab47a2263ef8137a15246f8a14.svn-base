package edu.iastate.se329.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.iastate.se329.domain.Deck;

/**
 * Row mapper class for the deck object
 * @author Jacob Bertram
 *
 */
public class DeckRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Deck deck = new Deck();
		deck.setDeckId(rs.getLong("id"));
		deck.setEditId(rs.getString("edit_id"));
		deck.setNickname(rs.getString("nickname"));
		return deck;
	}

	
}
