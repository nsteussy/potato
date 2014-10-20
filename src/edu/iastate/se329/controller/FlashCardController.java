package edu.iastate.se329.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iastate.se329.dao.DeckDao;
import edu.iastate.se329.dao.FlashCardDao;
import edu.iastate.se329.domain.FlashCard;

@Controller
@RequestMapping(value="/api/decks/edit/{editId}/flash-cards")
public class FlashCardController {
	@Autowired
	private FlashCardDao flashCardDao;
	@Autowired
	private DeckDao deckDao;
	
	/**
	 * Add a flash card to a deck
	 * @param editId the private identifier for this deck
	 * @param card The data to create this card with.
	 * @return a card object with additional fields filled out
	 */
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<FlashCard> post(@PathVariable String editId, @RequestBody FlashCard card)
	{
		long publicId = deckDao.publicKeyFromEditKey(editId);
		if (publicId == 0) return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		card.setDeckId(publicId);
		FlashCard result = flashCardDao.createFlashCard(card);
		return new ResponseEntity<FlashCard>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{flashCardId}", method = RequestMethod.PUT)
	public ResponseEntity<FlashCard> put(@PathVariable String editId, @PathVariable long flashCardId, @RequestBody FlashCard updatedFlashCard)
	{
		long publicId = deckDao.publicKeyFromEditKey(editId);
		// Verify the edit id is valid
		if (publicId == 0) return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		// Verify ids match from the route and the model being send
		if (updatedFlashCard.getDeckId() != publicId)
		{
			return new ResponseEntity<FlashCard>(HttpStatus.FORBIDDEN);
		}
		// Verify the card belongs to this deck
		List<FlashCard> list = flashCardDao.getFlashCardsByDeckId(publicId);
		FlashCard flashCard = null;
		for (FlashCard fc : list)
		{
			if (fc.getFlashCardId() == flashCardId)
			{
				flashCard = fc;
				break;
			}
		}
		if (flashCard == null) return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		FlashCard result = flashCardDao.updateFlashCard(updatedFlashCard);
		if (result == null)
		{
			return new ResponseEntity<FlashCard>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<FlashCard>(result, HttpStatus.OK);
	}
	
	/**
	 * Delete a flash card from a deck. Requires a valid editId for the owning deck, as well
	 * as the id of the flash card that should be deleted.
	 * @param editId
	 * @param flashCardId
	 * @return Status code 200 upon success, 404 if the editId is invalid, 404 if flash card doesn't exist
	 */
	@RequestMapping(value="/{flashCardId}", method=RequestMethod.DELETE)
	public ResponseEntity<FlashCard> delete(@PathVariable String editId, @PathVariable long flashCardId)
	{
		long publicId = deckDao.publicKeyFromEditKey(editId);
		// Verify the edit id is valid
		if (publicId == 0) return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		// Verify the card belongs to this deck
		List<FlashCard> list = flashCardDao.getFlashCardsByDeckId(publicId);
		boolean found = false;
		for (FlashCard fc : list)
		{
			if (fc.getFlashCardId() == flashCardId)
			{
				found = true;
				break;
			}
		}
		if (!found) return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		// Attempt deletion
		if (!flashCardDao.deleteFlashCard(flashCardId))
		{
			// Card doesn't exist in this deck
			return new ResponseEntity<FlashCard>(HttpStatus.NOT_FOUND);
		}
		// Success
		return new ResponseEntity<FlashCard>(HttpStatus.OK);
	}
	
}
