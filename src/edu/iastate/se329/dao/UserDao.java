package edu.iastate.se329.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.iastate.se329.domain.Deck;
import edu.iastate.se329.domain.FlashCard;

public interface UserDao {
	
	@Repository
	public interface FlashCardDao {
		public List<Deck> getDecksByUsername(String username);
		
	}

}
