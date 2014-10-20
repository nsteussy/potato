package edu.iastate.se329.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.iastate.se329.domain.FlashCard;

@Repository
public interface FlashCardDao {
	public List<FlashCard> getFlashCardsByUserId(Long userId);
	public List<FlashCard> getFlashCardsByDeckId(Long deckId);
	
	public FlashCard createFlashCard(FlashCard flashCard);
	public FlashCard updateFlashCard(FlashCard flashCard);
	/**
	 * Deletes a flashcard given an id. Does not handle any authorization
	 * @param flashCardId the id of the card
	 * @return true if deletion was successful, else false if the flash card was not found.
	 */
	boolean deleteFlashCard(long flashCardId);
}
