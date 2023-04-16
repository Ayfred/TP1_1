package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.ApplicationHelper;
import controller.DaoManager;

public class Application {
	
	private ApplicationHelper helper;
	private List<Todo> lesTodos = null;
	private static Application instance = null;
	
	//Constructor
	private Application() {
		
		lesTodos = new ArrayList<Todo>();
		helper = new ApplicationHelper(this);
		//create4TestTodos();
	  }
	
	private void create4TestTodos(){
	     addTodo( "chocolat" , false );
	     addTodo( "bonbons" , false );
	     addTodo( "kfc" , true );
	     addTodo( "biscuits" , true );
	 }
   
	//Getter
	public static Application getInstance() {
	   if (instance == null) {
           instance = new Application ();
	   }
	   return instance;
    }

	//Add method

	public void addTodo(String texte, boolean actif, int id) {
		if(!lesTodos.contains(new Todo(texte))){
			lesTodos.add(new Todo(texte, actif, id));
			helper.addTodo(new Todo(texte, actif, id));
		}
	}
	
	public void addTodo(String texte, boolean actif) {
		if(!lesTodos.contains(new Todo(texte))){
			lesTodos.add(new Todo(texte, actif));
			helper.addTodo(new Todo(texte, actif));
		}
	}
	
	public void addTodo(String texte) {
		if(!lesTodos.contains(new Todo(texte))){
			lesTodos.add(new Todo(texte));
			helper.addTodo(new Todo(texte));
		}
	}
	
	public void addTodo(Todo todo) {
		if(!lesTodos.contains(new Todo(todo.getTexte()))) {
			lesTodos.add(todo);
			helper.addTodo(todo);
		}
	}
	
	public void loadTodo(Todo todo) {
		if(!lesTodos.contains(new Todo(todo.getTexte()))) {
			lesTodos.add(todo);
		}
	}
  
	public void deleteTodo(String texte) {
		Todo todoDeleted = getTodo(findTodo(texte));
		lesTodos.remove(todoDeleted);
		helper.deleteTodo(todoDeleted);
	}
  
	public List<Todo> getLesTodos() {
		//return lesTodos;
		return helper.getLesTodos();

	}
	
	public int findTodo(String texte){		
		return lesTodos.indexOf( new Todo( texte ));
	}
	
	public Todo getTodo(int i){
		if(i == -1) {return null;}
		return (Todo) lesTodos.get(i);
	}
	
	public Todo findedTodo(String texte) {
		int i = findTodo(texte);
		return getTodo(i);
	}
  
	public void updateTodo(String texte, boolean actif) {
		getTodo(findTodo(texte)).setActif(actif);
		helper.changeActif(getLesTodos().get(findTodo(texte)), actif);
	}
	
  
	/*public static void main(String[] args) {
	  Todo todo1 = new Todo( "lait", false);
	  Todo todo2 = new Todo( "beurre", true);

	  if ( todo1.equals( todo2 )){
	      System.out.println(" lait equals beurre ");
	  }

	  todo2.setTexte( "lait" );
	  if ( todo1.equals( todo2 )) { 
	      System.out.println(" lait equals lait ");
	  }
	  
	  Application.getInstance().addTodo("lait");
	  Application.getInstance().addTodo("beurre");
  }*/

	public void uncheckAll() {
		for(Todo todo : Application.getInstance().getLesTodos()) {
			todo.setActif(false);
			helper.unCheck(todo);
		}
	}

}