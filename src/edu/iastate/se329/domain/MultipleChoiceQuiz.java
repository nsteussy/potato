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
			
			int[] possibleIndices = new int[cards.size()];
			for(int j = 0; j < cards.size(); j++) {
				possibleIndices[j] = j;
			}
			
			swap(possibleIndices, i, cards.size() - 1);
			Random rand = new Random();
			
			for(int j = 1; j < numAnswers && j < cards.size(); j++) {
				int index = rand.nextInt(numAnswers - j - 1);
				String curAnswer = cards.get(possibleIndices[index]).getBack();
				
				answers.add(curAnswer);
				
				swap(possibleIndices, index, cards.size()-j-1);
			}
			
			answers.add(rand.nextInt((int) Math.min(numAnswers, cards.size())), answer);
			questions.add(new MultipleChoiceQuestion(clue, answer, answers));
		}
		
	}

	public ArrayList<MultipleChoiceQuestion> getQuestions() {
		return questions;
	}
	
	private void swap(int[] arr, int i, int j) {
		int temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}

}
