package edu.iastate.se329.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iastate.se329.dao.DeckDao;
import edu.iastate.se329.domain.Deck;
import edu.iastate.se329.domain.MultipleChoiceQuiz;

@Controller
@RequestMapping(value="/main")
public class MainController {
	@Autowired DeckDao deckDao;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest req, HttpServletResponse resp, Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/deckCreator", method = RequestMethod.GET)
	public String deckCreator(HttpServletRequest req, HttpServletResponse resp, Model model) {
		return "deckCreator";
	}
	
	@RequestMapping(value = "/deckEditor/{id}", method = RequestMethod.GET)
	public String deckEditor(@PathVariable int id, HttpServletRequest req, HttpServletResponse resp, Model model) {
		model.addAttribute("deckID", id);
		return "deckEditor";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(HttpServletRequest req, HttpServletResponse resp, Model model) {
		return "about";
	}
	
	@RequestMapping(value = "/myDecks", method = RequestMethod.GET)
	public String myDecks(HttpServletRequest req, HttpServletResponse resp, Model model) {
		return "myDecks";
	}
	
	@RequestMapping(value="/browseDecks", method = RequestMethod.GET)
	public String deckBrowser(HttpServletRequest req, HttpServletResponse resp, Model model) {
		model.addAttribute("decks", this.deckDao.getAllDecks());
		return "browseDecks";
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.GET)
	public String newUser(HttpServletRequest req, HttpServletResponse resp, Model model) {
		return "signUp";
	}
	
	/**
	 * Everytime this URL is hit we probably want to go to the View/study deck page. If you need to get a deck for another reason
	 * besides going to the study page then you can just call the 2 lines in this method in one of the methods already made in 
	 * main controller.
	 */
	@RequestMapping(value = "/decks/{id}", method = RequestMethod.GET)
	public String getStudyPage(@PathVariable long id, Model model)
	{
		List<Deck> decks = deckDao.getDeckByDeckId(id);
		model.addAttribute("deck", decks.get(0));
		return "studyDeck";
	}
	
	@RequestMapping(value = "/multChoice/decks/{id}", method = RequestMethod.GET)
	public String getMultipleChoicePage(@PathVariable long id, Model model)
	{
		List<Deck> decks = deckDao.getDeckByDeckId(id);
		model.addAttribute("deck", decks.get(0));
		model.addAttribute("quiz", new MultipleChoiceQuiz(decks.get(0)));
		return "multipleChoice";
	}
}
