package edu.iastate.se329.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.iastate.se329.dao.DeckDao;
import edu.iastate.se329.domain.Deck;

@Controller
@RequestMapping(value = "/api")
public class DeckApiController {

	@Autowired
	private DeckDao deckDao;
	
	@RequestMapping(value = "/decks", method = RequestMethod.POST)
	public @ResponseBody Deck post(@RequestBody Deck deck)
	{
		Deck newDeck = deckDao.createDeck(deck);
		return newDeck;
	}
	
	@RequestMapping(value = "/decks/{id}", method = RequestMethod.GET)
	public @ResponseBody Deck get(@PathVariable long id)
	{
		List<Deck> decks = deckDao.getDeckByDeckId(id);
		return decks.get(0);
	}
}
