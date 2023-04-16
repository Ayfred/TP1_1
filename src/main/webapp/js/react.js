
const rootElement = document.getElementById('main');
class Liste extends React.Component {
        // La variable state gère le refresh de ce composant Reac
        // 
	constructor(props) {
		super(props);
		this.state = {
			error: null,
			isLoaded: false,
			todos:[{"key":15,"texte":"Beurre","actif":"" },{ "key":16,"texte":"Lait","actif":"checked" },{ "key":17,"texte":"Yaourt","actif":""}]
		};
	}
    // Appeler quand le composant est prêt à l'affichage dans le DOM
    componentDidMount() {
      this.setState({
          isLoaded: true
        });
    }
   // Appler quand l'affichage du composant est déclenché
   render() {
	const { error, isLoaded, todos} = this.state;
	if (error) {
	  return <div>Error: {error.message}</div>;
	} else if (!isLoaded) {
	   return <div>Loading...</div>;
	} else {
	   return (
		<div className="list">
		<h1>List for {this.props.name}</h1>
		<ul>
		{todos.map(todo => (
		  <TodoItem key={todo.key} name={todo.texte} actif={todo.actif} />
          	))}	
		</ul>
		</div>
		);
	  }
	}
}class TodoItem extends React.Component {
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

 
}function App(){
   return( <div> <Liste name="liste1" /> </div> )
}

ReactDOM.render( <App />, rootElement )