<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/jumbotron/">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">

    <title>LIST TODO JUMBOTRON</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>
    <script>
  	$( function() {
    	$( "#datepicker" ).datepicker();
  	} );
  	</script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
      
      
      
      
      
      
      
      
        <h1>Welcome to Todo List!</h1>
        <form method= "get" action= "./Controller">
        <ul>
	<%
	for(Todo todo : Application1.getInstance().getLesTodos() ){
			pageContext.setAttribute("currentTodo", todo , PageContext.PAGE_SCOPE);
	%>	
		
		<p>
   			<%
   			if ( todo.isActif()) {
   			%>
      		<li><input type="checkbox" name= "checkbox_<%=todo.getTexte()%>" checked />
      			<span id="checkbox_<%=todo.getTexte()%>"><%=todo.getTexte()%></span>
      			</li>
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
       			<li><input type="checkbox" name="checkbox_<%=todo.getTexte()%>" />
      			<span id="checkbox_<%=todo.getTexte()%>" class="barre" style="text-decoration: line-through;"><%=todo.getTexte()%></span>
      			</li>
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









      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Add a todo</h2>
          <form>
			<form method="get" id="formulaire" action= "./Controller">
			Enter a todo to add: <input type="text" id="todo_text" name="todo_texte">
			<input type="Submit" name="action" value="addTodo" onclick="checkTodo()"/>
			</form>
        </div>
        <div class="col-md-4">
        
        
        
        
          <h2>Delete a todo</h2>
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
       </div>
        <div class="col-md-4">
        
        
        
        
        
          <h2>Extras</h2>
          <form>
	<form method= "get" action= "./Controller">
		<input type="Submit" name="action" value = XML />
	</form>
	<form>
	<form method= "get" action= "./Controller">
		<input type="Submit" name="action" value = JSON />
	</form>
        </div>
        
        
        
        
        
        
        
        
      </div>
      <hr>
      <footer>
        <p>&copy; 2023 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
    
    


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="js/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="js/script.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>
	<script src="js/todo.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script language="javascript">

 	$(document).ready(function() {
    	$("input[type=checkbox]").click(
         	function(event) { 
            	var name = $(this).attr("name");
            	var checked = $(this).prop('checked');;
            	console.log( $(this).attr("name") );
           	// ... continuer en javascript
         	});
   
 	});
// 
</script>
  </body>
</html>
