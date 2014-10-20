package edu.iastate.se329.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import edu.iastate.se329.domain.Deck;
import edu.iastate.se329.rowmapper.DeckRowMapper;

/**
 * Database Access Object for the deck object
 * @author Brian Suther
 *
 */
@Repository
public class DeckDaoImpl implements DeckDao {

	@Autowired
	FlashCardDao flashCardDao;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterTemplate;
	
	private static final String getDecksByUserId = "SELECT d.id, d.edit_id, d.nickname FROM decks d WHERE d.edit_id = :editId";
	private static final String getDeckById = "SELECT d.id, d.edit_id, d.nickname FROM decks d WHERE d.id = :id";
	private static final String createDeck = "INSERT INTO decks (edit_id, nickname) VALUES (:editId, :nickname)";
	private static final String updateDeck = "UPDATE decks SET nickname=:nickname WHERE edit_id=:editId";
	private static final String publicFromEdit = "SELECT id FROM decks WHERE edit_id=:editId";
	private static final String editFromPublic = "SELECT edit_id FROM decks WHERE id=:id";
	private static final String getAllDecks = "select * from decks";

	@Override
	public List<Deck> getAllDecks() {
		List<Deck> list = namedParameterTemplate.query(getAllDecks, new DeckRowMapper());
		list = this.populateRelations(list);
		return list;
	}
	
	@Override
	public List<Deck> getDeckByEditId(String editId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("editId", editId);
		List<Deck> list = namedParameterTemplate.query(getDecksByUserId, params, new DeckRowMapper());
		list = this.populateRelations(list);
		return list;
	}
	
	@Override
	public long publicKeyFromEditKey(String editId)
	{
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("editId", editId);
		return namedParameterTemplate.queryForLong(publicFromEdit, params);
	}
	@Override
	public String editKeyFromPublicKey(long id)
	{
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);
		List<Deck> decks = getDeckByDeckId(id);
		if (decks == null || decks.size() == 0)
		{
			return null;
		}
		return decks.get(0).getEditId();
	}

	@Override
	public List<Deck> getDeckByDeckId(Long deckId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", deckId);
		List<Deck> list = namedParameterTemplate.query(getDeckById, params, new DeckRowMapper());
		list = this.populateRelations(list);
		return list;
	}
	
	private List<Deck> populateRelations(List<Deck> decks)
	{
		for (Deck d : decks)
		{
			d.setFlashCards(flashCardDao.getFlashCardsByDeckId(d.getDeckId()));
		}
		return decks;
	}
	
	/**
	 * Create a new deck. Expects the deck to only have a nickname and userId set, or
	 * else it will throw an exception. Upon success the deck gets it's id set.
	 * 
	 * @throws IllegalArgumentException if the deck already has an id (decks with ids are
	 * assumed to be persisted already)
	 * 
	 * @return Deck the deck that was given, with an updated id property
	 */
	@Override
	public Deck createDeck(Deck deck)
	{
		if (deck.getDeckId() != null && deck.getDeckId() != 0l)
		{
			throw new IllegalArgumentException("Deck may not have an Id already");
		}
		
		MapSqlParameterSource params = new MapSqlParameterSource();
		String uid = UUID.randomUUID().toString();
		deck.setEditId(uid);
		params.addValue("editId", uid);
		params.addValue("nickname", deck.getNickname());
		KeyHolder kh = new GeneratedKeyHolder();
		namedParameterTemplate.update(createDeck, params, kh, new String[] {"id"});
		deck.setDeckId(kh.getKey().longValue());
		return deck;
	}
	
	@Override
	public Deck updateDeck(Deck deck)
	{
		if (deck.getDeckId() == null || deck.getDeckId() == 0l)
		{
			throw new IllegalArgumentException("Deck must have an id");
		}

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", deck.getDeckId());
		params.addValue("editId", deck.getEditId());
		params.addValue("nickname", deck.getNickname());
		namedParameterTemplate.update(updateDeck, params);

        return deck;
	}
	
}
