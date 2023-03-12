package model;

import java.util.ArrayList;
import java.util.List;

public class Application {
	
	private List<Todo> lesTodos = null;
	private static Application instance = null;
	
	//Constructor
	private Application() {
		   lesTodos = new ArrayList<Todo>();
		   create4TestTodos();
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
	public void addTodo(String texte, boolean actif) {
		if(!lesTodos.contains(new Todo(texte))){
			lesTodos.add(new Todo(texte, actif));
		}
	}
	
	public void addTodo(String texte) {
		if(!lesTodos.contains(new Todo(texte))){
			lesTodos.add(new Todo(texte));
		}
	}
  
	public void deleteTodo(String texte) {
		lesTodos.remove(getTodo(findTodo(texte)));
	}
  
	public List<Todo> getLesTodos() {
		return lesTodos;
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
	}
  
	public static void main(String[] args) {
	  Todo todo1 = new Todo( "lait", false );
	  Todo todo2 = new Todo( "beurre", true );

	  if ( todo1.equals( todo2 )){
	      System.out.println(" lait equals beurre ");
	  }

	  todo2.setTexte( "lait" );
	  if ( todo1.equals( todo2 )) { 
	      System.out.println(" lait equals lait ");
	  }
	  
	  Application.getInstance().addTodo("lait");
	  Application.getInstance().addTodo("beurre");
  }

	public void uncheckAll() {
		for(Todo todo : Application.getInstance().getLesTodos()) {
			todo.setActif(false);
		}
		
	}

}