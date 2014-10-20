package edu.iastate.se329.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.iastate.se329.domain.Deck;

@Repository
public interface DeckDao {
	public List<Deck> getAllDecks();
	public List<Deck> getDeckByDeckId(Long deckId);
	public List<Deck> getDeckByEditId(String editId);
	public Deck createDeck(Deck deck);
	public Deck updateDeck(Deck deck);
	public String editKeyFromPublicKey(long id);
	public long publicKeyFromEditKey(String editId);
}
