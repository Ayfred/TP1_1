package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import model.Application;
import model.Todo;

public class ApplicationTest {
	
	//S'exécute une fois avant tous les tests
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		//System.out.println( "setUpBeforeClass" );
	}

	//S'exécute une fois après tous les tests
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		//System.out.println( "tearDownAfterClass" );
	}

	//S'exécute une fois avant chaque test
	@Before
	public void setUp() throws Exception {
		Application.getInstance().getLesTodos().clear();
		//System.out.println( "setUp" );
	}

	//S'exécute une fois après chaque test
	@After
	public void tearDown() throws Exception {
		System.out.println( "teardDown" );
	}

	@Test
	public void test() {
	}
	
	@Test
	public void notNullSingleton() {
		Application application1 = Application.getInstance();
		assertNotNull( application1 );
	}
	
	@Test
	public void testEqualsApplications() {
		Application application1 = Application.getInstance();
		Application application2 = Application.getInstance();
		assertEquals (application1 , application2);
	}
	
	@Test
	public void todoNull() {
		Application application1 = Application.getInstance();
		assertTrue( application1.getLesTodos().isEmpty());
	}
	
	@Test
	public void testAddTodo() {
		Application.getInstance().addTodo("Buy groceries");
        assertTrue(Application.getInstance().getLesTodos().contains( new Todo("Buy groceries")));
    }

    @Test
    public void testAddTodoSameText() {
		Application application1 = Application.getInstance();
        application1.addTodo("Buy groceries");
        application1.addTodo("Buy groceries");
        assertEquals(1, application1.getLesTodos().size());
    }

    @Test
    public void testAddTodoEndOfList() {
		Application application1 = Application.getInstance();
        application1.addTodo("Buy groceries");
        application1.addTodo("Walk the dog");
        assertEquals(new Todo("Walk the dog"), application1.getLesTodos().get(1));
    }

    @Test
    public void testDeleteTodo() {
		Application application1 = Application.getInstance();
        application1.addTodo("Buy groceries");
        application1.deleteTodo("Buy groceries");
        assertFalse(application1.getLesTodos().contains("Buy groceries"));
    }
	

}
