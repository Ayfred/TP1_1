<?json version="1.0" encoding="utf-8"?>
<%@ page import="model.*" %>
{
 "todos":
 [
 <% 
 int i = 0;
 for(Todo todo : Application.getInstance().getLesTodos()){ 
 %>
    {
      "id": "<%= i %>",
      "texte": "<%=todo.getTexte() %>",
      "actif": "<%= todo.isActif() %>"
    },
	<% i++; %>
<%
} 
%>
  ]
}