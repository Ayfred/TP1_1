<%@ page import="model.*" %><%@ page language="java" contentType="application/json;" %>{
 "todos":
 [
 <%int i = 0;
 for(Todo todo : Application1.getInstance().getLesTodos()){%>
    {
      "id": "<%=todo.getId()%>",
      "texte": "<%=todo.getTexte()%>",
      "actif": "<%=todo.isActif()%>"
    }
<%i++;
	if ( i == Application1.getInstance().getLesTodos().size() -1){%>,<%
	}
} 
%>
  ]
}