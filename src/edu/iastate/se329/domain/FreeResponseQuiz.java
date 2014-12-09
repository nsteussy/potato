package edu.iastate.se329.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class FreeResponseQuiz {

private ArrayList<FreeResponseQuestion> questions;
	
	public FreeResponseQuiz(Deck deck) {
		questions = new ArrayList<FreeResponseQuestion>();
		
		List<FlashCard> cards = deck.getFlashCards();
		for(int i = 0; i < cards.size(); i++) {
			FlashCard card = cards.get(i);
			String clue = card.getFront();
			String answer = card.getBack();			
			
			questions.add(new FreeResponseQuestion(clue, answer));
		}
		
	}

	public ArrayList<FreeResponseQuestion> getQuestions() {
		return questions;
	}
	
	
}
