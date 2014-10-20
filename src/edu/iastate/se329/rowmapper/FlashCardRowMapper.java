package edu.iastate.se329.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.iastate.se329.domain.FlashCard;

/**
 * Row mapper class for the flash card class
 * @author Brian Suther
 *
 */
public class FlashCardRowMapper implements RowMapper {

	@Override
	public FlashCard mapRow(ResultSet rs, int rowNum) throws SQLException {
		FlashCard flashCard = new FlashCard();
		flashCard.setDeckId(rs.getLong("deck_id"));
		flashCard.setFlashCardId(rs.getLong("flash_card_id"));
		flashCard.setFront(rs.getString("front"));
		flashCard.setBack(rs.getString("back"));
		return flashCard;
	}

}
