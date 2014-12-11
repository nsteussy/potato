package edu.iastate.se329.domain;

import java.util.ArrayList;

public class FreeResponseQuestion {
	private String clue; 
	private String answer; 
	
	public FreeResponseQuestion(String c, String a) {
		answer = a;
		clue = c;
	}
	
	public String getClue() {
		return clue;
	}
	
	public String getAnswer() {
		return answer;
	}
	
	/**
	 * Check if the input given by the user is correct. Returns true if
	 * the guess matches the answer (ignoring case). Otherwise false is returned.
	 * @param guess 
	 */
	public boolean isCorrect(String guess) {
		return answer.equalsIgnoreCase(guess);
	}
	
	/**
	 * Returns a unique ID for the html to use. It assumes no flashcards 
	 * will have the exact same front & back.
	 * @return
	 */
	public String getUID() {
		// combine two sides of the flash card into 1 string and remove all white space.
		return (clue + answer).replaceAll("\\s+", ""); 
	}
	
}
