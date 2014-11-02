package edu.iastate.se329.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import static org.apache.commons.lang.StringEscapeUtils.escapeHtml;

import edu.iastate.se329.domain.FlashCard;
import edu.iastate.se329.rowmapper.FlashCardRowMapper;

/**
 * Database Access Object for the flash card object
 * @author Brian Suther
 *
 */
@Repository
public class FlashCardDaoImpl implements FlashCardDao {

	@Autowired
	NamedParameterJdbcTemplate namedParameterTemplate;
	
	private static final String getFlashCardsByUserId = "SELECT f.flash_card_id, f.deck_id, f.front, f.back, d.user_id FROM flash_cards f INNER JOIN decks d ON d.id = f.deck_id WHERE d.user_id = :userId";
	private static final String getFlashCardsByDeckId = "SELECT f.flash_card_id, f.deck_id, f.front, f.back FROM flash_cards f WHERE f.deck_id = :deckId";
	private static final String createFlashCard = "INSERT INTO flash_cards (deck_id, front, back) VALUES (:deckId, :front, :back)";
	private static final String updateFlashCard = "UPDATE flash_cards SET front=:front, back=:back, deck_id=:deckId WHERE flash_card_id=:id";
	private static final String deleteFlashCard = "DELETE FROM flash_cards WHERE flash_card_id=:flashCardId";

	
	public List<FlashCard> getFlashCardsByUserId(Long userId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userId", userId);
		return namedParameterTemplate.query(getFlashCardsByUserId, params, new FlashCardRowMapper());
	}
	
	public List<FlashCard> getFlashCardsByDeckId(Long deckId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("deckId", deckId);
		return namedParameterTemplate.query(getFlashCardsByDeckId, params, new FlashCardRowMapper());
	}

	/**
	 * Create a new flash card with the properties given. 
	 * 
	 * @throws IllegalArgumentException if the card already has an id (cards with ids are
	 * assumed to be persisted already)
	 * 
	 * @return FlashCard the card that was given, with an updated id property
	 */
	@Override
	public FlashCard createFlashCard(FlashCard flashCard) {
		if (flashCard.getFlashCardId() != null && flashCard.getFlashCardId() != 0)
		{
			throw new IllegalArgumentException("flash card id must be null/0 when creating");
		}
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("deckId", flashCard.getDeckId());
		params.addValue("front", escapeHtml(flashCard.getFront()));
		params.addValue("back", escapeHtml(flashCard.getBack()));
		KeyHolder kh = new GeneratedKeyHolder();
		namedParameterTemplate.update(createFlashCard, params, kh, new String[] {"id"});
		flashCard.setFlashCardId(kh.getKey().longValue());
		return flashCard;
	}

	@Override
	public FlashCard updateFlashCard(FlashCard flashCard) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("deckId", flashCard.getDeckId());
		params.addValue("front", escapeHtml(flashCard.getFront()));
		params.addValue("back", escapeHtml(flashCard.getBack()));
		params.addValue("id", flashCard.getFlashCardId());
		int rows = namedParameterTemplate.update(updateFlashCard, params);
		return flashCard;
	}
	
	@Override
	public boolean deleteFlashCard(long flashCardId)
	{
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("flashCardId", flashCardId);
		int rows = namedParameterTemplate.update(this.deleteFlashCard, params);
		if (rows == 0) return false;
		return true;
	}
}
