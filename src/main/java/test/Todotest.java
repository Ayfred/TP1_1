package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import model.Todo;

public class Todotest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testHashCode() {
		fail("Not yet implemented");
	}

	@Test
	public void testTodoStringBoolean() {
		fail("Not yet implemented");
	}

	@Test
	public void testTodoString() {
		fail("Not yet implemented");
	}

	@Test
	public final void testTodo() {
		Todo todo = new Todo("du lait" , false);
	     assertNotNull( todo );
	}

	@Test
	public final void testGetTexte() {
		Todo todo = new Todo("du lait" , false);
		assertEquals ( todo.getTexte() , "du lait");
	}

	@Test
	public void testSetTexte() {
		fail("Not yet implemented");
	}

	@Test
	public final void testIsActif() {
		Todo todo = new Todo("du lait" , false);
		assertFalse( todo.isActif());
	}

	@Test
	public void testSetActif() {
		fail("Not yet implemented");
	}

	@Test
	public void testEqualsObject() {
		fail("Not yet implemented");
	}
	

}
