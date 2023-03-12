<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<style>
#myDIV {
  color: red;
}
</style>

<h1>Welcome to the todo list application</h1>

<embed type="image/png" src="https://www.imt-mines-ales.fr/themes/custom/boots/assets/images/logo.svg" width="200" height="100">

<p><b>Todo contents :</b></p>
<%
for(Todo todo : Application.getInstance().getLesTodos() ){
%>
<p>
   <%=todo.getTexte() %> <div id = "myDIV"><%=todo.isActif() %></div>
</p>
<%
}
%>

<html><body>
<head>
  <title>Keep Todo</title>
</head>
<form method= "get" action= "./Controlleur">
	<ul>
	<%
	for(Todo todo : Application.getInstance().getLesTodos() ){
	%>	
		
		<p>
   			<%if ( todo.isActif()) { %>
      		<li><input type="checkbox" name= "checkbox_<%=todo.getTexte()%>" checked /><%=todo.getTexte() %></li>
    		<% } 
   			else { %>
       		<li><input type="checkbox" name= "checkbox_<%=todo.getTexte()%>" /> <%=todo.getTexte() %></li>
    		<% } %>
		</p>
	<%	
	}
	%>
	<input type="submit" name="action" value = Submit />
	</ul>
</form>

<p><b>Options :</b></p>

<form>
	<form method= "get" action= "./Controlleur">
	Enter a todo to add: <input type="text" name = "todo_texte">
	<input type="Submit" name="action" value = addTodo />
</form>
<form>
	<form method= "get" action= "./Controlleur">
	Select a todo to delete: 
	<select name="todo_delete" id="todo-select">
    <option value="">--Please choose an option--</option>
    <%for(Todo todo : Application.getInstance().getLesTodos() ){  %>
    	<option value="<%=todo.getTexte()%>"><%=todo.getTexte()%></option>
    <%} %>
	<input type="Submit" name="action" value = Delete />
</form>
<form>
	<form method= "get" action= "./Controlleur">
	<input type="Submit" name="action" value = XML />
</form>
<form>
	<form method= "get" action= "./Controlleur">
	<input type="Submit" name="action" value = JSON />
</form>


</body></html>








