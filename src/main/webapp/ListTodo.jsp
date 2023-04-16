<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@taglib prefix="projetDevWeb" tagdir="/WEB-INF/tags" %>
<!--  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  -->


<style>
#myDIV {
  color: red;
}
</style>
<head> <link rel="stylesheet" type="text/css" href="css/style.css"> </head>


<div id="central">
 <div id="menu">
      <!-- Zone pour le menu -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Sono:wght@500&display=swap" rel="stylesheet">
      <h1>Welcome to the todo list application</h1>
      <embed type="image/png" src="https://www.imt-mines-ales.fr/themes/custom/boots/assets/images/logo.svg" width="200" height="100" class ="center">
      
      <ul id="navigation"><li><a href="./Controller?action=JSON">JSON </a></li><li><a href="./Controller?action=XML">XML</a></li></ul>
      
      
 </div>

    <!-- Zone pour le contenu -->
    <p><b>Todo contents :</b></p>
	<%
	for(Todo todo : Application1.getInstance().getLesTodos() ){
	%>
	<p>
   	<%=todo.getTexte()%> <div id = "myDIV"><%=todo.isActif()%></div>
	</p>
	<%
	}
	%>

<html><body>
<head>
  	<title>Keep Todo</title>

</head>
<form method= "get" action= "./Controller">
	<div class="col-md-4">
		<h1> The content of the todo list</h1>
	</div>
	<ul>
	<%
	for(Todo todo : Application1.getInstance().getLesTodos() ){
			pageContext.setAttribute("currentTodo", todo , PageContext.PAGE_SCOPE);
	%>	
		
		<p>
   			<%
   			if ( todo.isActif()) {
   			%>
      		<li><input type="checkbox" name= "checkbox_<%=todo.getTexte()%>" checked /><%=todo.getTexte()%></li>
      			<!-- <projetDevWeb:todo todo="${currentTodo}" > </projetDevWeb:todo> -->
      		<!--	<c:forEach 
					items="${Application.getInstance().getLesTodos()}" 
					var="todo" >  	
    			<projetDevWeb:todo todo="${currentTodo}" > </projetDevWeb:todo>    
				</c:forEach> 
				-->
    		<%
    		} 
    		   			else {
    		%>
       			<li><input type="checkbox" name= "checkbox_<%=todo.getTexte()%>" /> <%=todo.getTexte()%></li>
       			<!-- <projetDevWeb:todo todo="${currentTodo}" > </projetDevWeb:todo> -->
    		<%
    		}
    		%>
		</p>
	<%
	}
	%>
	<input type="submit" name="action" value = Submit />
	</ul>
</form>

<p><b>Options :</b></p>

<form>
	<form method= "get" action= "./Controller">
	Enter a todo to add: <input type="text" name = "todo_texte">
	<input type="Submit" name="action" value = addTodo />
</form>
<form>
	<form method= "get" action= "./Controller">
	Select a todo to delete: 
	<select name="todo_delete" id="todo-select">
    <option value="">--Please choose an option--</option>
    <%
    for(Todo todo : Application1.getInstance().getLesTodos() ){
    %>
    	<option value="<%=todo.getTexte()%>"><%=todo.getTexte()%></option>
    <%} %>
	<input type="Submit" name="action" value = Delete />
</form>
<form>
	<form method= "get" action= "./Controller">
	<input type="Submit" name="action" value = XML />
</form>
<form>
	<form method= "get" action= "./Controller">
	<input type="Submit" name="action" value = JSON />
</form>


</body></html>

    
</div>








