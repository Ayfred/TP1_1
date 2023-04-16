class TodoItem extends React.Component {
// gestion de la variable actif et abonnement de la méthode checkboxHandler au bouton
constructor(props){
   super(props);
   this.state = { actif: props.actif };
   this.checkboxHandler = this.checkboxHandler.bind(this);
}

// Appel par le click sur la checkbox
checkboxHandler(){
    // La console du navigateur va vous afficher de l'information
    console.log("Event");
    // Votre debugger javascript va s'arréter ici...
    debugger;
    if ( this.state.actif == "checked"){
       this.setState( {actif: ""} );
    }else{
       this.setState( {actif: "checked"} );
    }
}

 // Appel au rendu du composant avec les propriétés fournies
 render() { 
  return (
   <li>
     <input type="checkbox" name={this.props.name} checked={this.state.actif} 
onChange={this.checkboxHandler} />
         {this.props.name}
   </li>
   );
  }

 
}