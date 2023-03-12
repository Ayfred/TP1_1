package model;

import java.util.Objects;

public class Todo {
	
	private String texte;
	private boolean actif;
	
	public Todo(String texte, boolean actif) {
		this.texte = texte;
		this.actif = actif;
	}

	public Todo(String texte) {
		this.texte = texte;
		this.actif = false;
	}
	
	public Todo() {
		this.texte = "<Todo>";
		this.actif = false;
	}
	
	public String getTexte() {
		return texte;
	}

	public void setTexte(String texte) {
		this.texte = texte;
	}

	public boolean isActif() {
		return actif;
	}

	public void setActif(boolean actif) {
		this.actif = actif;
	}

	@Override
	public int hashCode() {
		return Objects.hash(texte);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Todo other = (Todo) obj;
		return Objects.equals(texte, other.texte);
	}


	
	
	
}
