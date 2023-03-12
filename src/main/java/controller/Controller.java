package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Application;
import model.Todo;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = { "/Controlleur"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vueFinale = "ListTodo.jsp";
		
		vueFinale = doAction(request);
		
		request.getRequestDispatcher(vueFinale).forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String doAction(HttpServletRequest request) {

		String vueFinale = "ListTodo.jsp";

		String action = request.getParameter("action");
		//List<String> keys = Collections.list(request.getParameterNames());

		// Action1 addTodo
		if ("addTodo".equals(action)) {

		    String texte = request.getParameter("todo_texte");
		    Application.getInstance().addTodo(texte, false);

		    vueFinale = "ListTodo.jsp";
		}

		// Action2 Update list ...
		if ("Updatelist".equals(action)) {
			
			String texte = request.getParameter("todo_texte");
			
			if(Application.getInstance().getTodo(Application.getInstance().findTodo(texte)).isActif()) {
				Application.getInstance().updateTodo(texte, false);
				}
			else {
				Application.getInstance().updateTodo(texte, true);
			}
		    vueFinale = "ListTodo.jsp";
		}
		
		//Action 3 checkbox_name
		
		if ("Submit".equals(action)) {
			
			Application.getInstance().uncheckAll();
			List<String> keys = Collections.list(request.getParameterNames());
			for(String key : keys) {
				if ( key.startsWith("checkbox_")) {
					String name = key.replace("checkbox_", "");
					Todo findedTodo = Application.getInstance().findedTodo(name);
					Application.getInstance().updateTodo(findedTodo.getTexte(), true);
					
					
				}
			}
			    vueFinale = "ListTodo.jsp";
		}
		
		//Action 4 Delete
		
		if ("Delete".equals(action)) {
					
			String texte = request.getParameter("todo_delete");
		    Application.getInstance().deleteTodo(texte);
			
			vueFinale = "ListTodo.jsp";
		}
		
		if("XML".equals(action)) {
			vueFinale = "XML.jsp";
		}
			
		if("JSON".equals(action)) {
			vueFinale = "json.jsp";
		}

		
		

		// ... 
		return vueFinale;
	}

}
