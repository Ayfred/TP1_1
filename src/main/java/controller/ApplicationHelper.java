package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import model.Application;
import model.Todo;


public class ApplicationHelper {
	
	private static DaoManager db = DaoManager.getInstance();
	private static Application application;
	
	public ApplicationHelper(Application application) {
		ApplicationHelper.application = application;
		chargeTodo();
	}

	public static void chargeTodo() {
		for(Todo todo : db.getAllTodo()) {
			application.loadTodo(todo);
		}
	}
	
	public void addTodo(Todo todo) {
		db.addTodo(todo);
	}
	
	public void deleteTodo(Todo todo) {
		db.deleteTodo(todo);
	}
	
	public void changeActif(Todo todo, boolean actif) {
		db.setActif(todo, actif);
	}
	
	public List<Todo> getLesTodos() {
		return db.getAllTodo();
	}

	public void unCheck(Todo todo) {
		db.unCheck(todo);
		
	}

	
	
	
	
	
	
	
	
	
}