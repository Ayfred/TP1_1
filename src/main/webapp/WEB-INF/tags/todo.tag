<%@tag language="java" pageEncoding="ISO-8859-1"%>
<%@tag import="model.Todo" %>
<%@attribute name="todo" required="true" type="model.Todo"  %>

<li>
	<input type="checkbox" name="todo_${todo.texte}" value="${todo.texte}"/> 
${todo.texte}   
		
</li>

