// Création de l'application todoApp et déclaration du controleur avec le module http activé
angular.module('todoApp', []).controller('TodoListController', function( $http ) {


var todoList = this;
/*
todoList.todos = [
{ texte: 'chocolat' , actif:false},
{ texte: 'gateaux' , actif:true}
]*/
 
// Fonction pour ajouter un  todo depuis l'interface HTML
todoList.addTodo = function() {
      todoList.todos.push( {texte:todoList.todoText, actif:false});
      todoList.todoText = '';
};

// console.log(todoList.todos);

// Création de la liste des paramètres de la requête GET avec le paramètre action 
// var parametres = {action: "ajax.add_todo" };

$http({
  method : "GET",
  url : "./Controller",
  params: {action: "JSON" },
})
.then(function successCallback(response) {
        console.log( response.data );
        // Rafraichir la liste avec la reponse en Json reçue
       todoList.todos = response.data.todos
        
        
}, function errorCallback(response) {
        // En cas d'erreur par exemple 404 pour la requête GET sur le controleur
        console.log( response );
});


const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const port = 3000;
// Connect to the SQLite database
const db = new sqlite3.Database('./database.db', sqlite3.OPEN_READWRITE, (err) => {
  if (err) {
    console.error(err.message);
  } else {
    console.log('Connected to the SQLite database.');
  }
});





}); // Fin application