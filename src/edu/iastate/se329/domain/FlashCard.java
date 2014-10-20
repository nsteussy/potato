package edu.iastate.se329.domain;

/**
 * A Flash Potato card.
 * @author SaldinBajric
 *
 */
public class FlashCard {
	private Long flashCardId;
	private Long deckId;
	private String front;
	private String back;
	
	public FlashCard() {}
	
	public Long getFlashCardId() {
		return flashCardId;
	}
	public void setFlashCardId(Long flashCardId) {
		this.flashCardId = flashCardId;
	}
	public Long getDeckId() {
		return deckId;
	}
	public void setDeckId(Long deckId) {
		this.deckId = deckId;
	}
	public String getFront() {
		return front;
	}
	public void setFront(String front) {
		this.front = front;
	}
	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
}
