package edu.iastate.se329.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.iastate.se329.dao.DeckDao;
import edu.iastate.se329.domain.Deck;

@RunWith( SpringJUnit4ClassRunner.class )
@ContextConfiguration("file:WebContent/WEB-INF/eFlashPotato-servlet.xml")
public class DbTest {
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	@InjectMocks
	protected DeckDao deckDao;
	
	@Mock
	NamedParameterJdbcTemplate namedParameterTemplate;

	@Test
	public void test() {
		// See if database works
		List<Deck> d = deckDao.getDeckByDeckId(1l);
	}

}
