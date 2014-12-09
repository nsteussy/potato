package edu.iastate.se329.domain;

import java.util.ArrayList;

public class MultipleChoiceQuestion {
	private String clue;
	private ArrayList<String> answers; 
	private String answer; 
	
	public MultipleChoiceQuestion(String c, String a, ArrayList<String> as) {
		answer = a;
		clue = c;
		answers = as;
	}
	
	public String getClue() {
		return clue;
	}
	
	public String getAnswer() {
		return answer;
	}
	
	public ArrayList<String> getChoices() {
		return answers;
	}
	
	
	public String getUID(int i) {
		return clue + answers.get(i);
	}
}
