package edu.iastate.se329.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/**
 * Nice to have...maybe
 */
public class MultipleChoiceQuiz {
	public static final int numAnswers = 4;
	
	private ArrayList<MultipleChoiceQuestion> questions;
	
	public MultipleChoiceQuiz(Deck deck) {
		questions = new ArrayList<MultipleChoiceQuestion>();
		
		List<FlashCard> cards = deck.getFlashCards();
		for(int i = 0; i < cards.size(); i++) {
			FlashCard card = cards.get(i);
			String clue = card.getFront();
			String answer = card.getBack();
			ArrayList<String> answers = new ArrayList<String>();
			
			String[] possibleIndices = new String[cards.size()];
			for(int j = 0; j < cards.size(); j++) {
				possibleIndices[j] = cards.get(j).getBack();
			}
			
			swap(possibleIndices, i, cards.size() - 1);
			Random rand = new Random();
			
			for(int j = 1; j < numAnswers && j < cards.size(); j++) {
				int index = rand.nextInt(cards.size() - j);
				String curAnswer = possibleIndices[index];
				answers.add(curAnswer);
				swap(possibleIndices, index, cards.size()-j-1);
			}
			
			answers.add(rand.nextInt(answers.size()+1), answer);
			questions.add(new MultipleChoiceQuestion(clue, answer, answers));
		}
		
	}

	public ArrayList<MultipleChoiceQuestion> getQuestions() {
		return questions;
	}
	
	private void swap(String[] arr, int i, int j) {
		String temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}

}
