// Méthode appelé par le bouton du formulaire
function checkTodo(){
   // Création d'une variable référençant le champ dont l'ID est todo_text
   var todo_text = document.getElementById("todo_text");

   // Récupération du contenu de ce champ (de la valeur saisie contenu) 
   var todo_textValue = todo_text.value;

   // La fonction trim retire les espaces en début et fin de string
   todo_textValue = todo_textValue.trim();
   
   // Si la variable est vide, le champs de formulaire todo_text affiche un message d'erreur:
   if ( todo_textValue === "" ){
       //todo_text.value = "Mandatory!";
       
       // Affichage d'une bulle d'erreur si le champ est vide
       var tooltip = document.createElement("span");
       tooltip.className = "tooltiptext";
       tooltip.innerHTML = "Mandatory!";

       var tooltipContainer = document.createElement("div");
       tooltipContainer.className = "tooltip";
       tooltipContainer.appendChild(tooltip);

       todo_text.parentNode.insertBefore(tooltipContainer, todo_text.nextSibling);

         // Empêcher la soumission du formulaire
       event.preventDefault();
    }else{

       // Création d'une variable référençant le formulaire HTML 
       var form = document.getElementById("formulaire");
       // Déclenche le submit de ce formulaire comme aurait fait le formulaire submit
       form.submit();
   }
}