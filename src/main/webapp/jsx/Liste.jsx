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
}