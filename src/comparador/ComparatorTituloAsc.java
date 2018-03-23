package comparador;

import java.util.Comparator;

import modelo.Libro;

public class ComparatorTituloAsc implements Comparator<Libro>{

	@Override
	public int compare(Libro p0, Libro p1) {
		// TODO Auto-generated method stub
		
		return p0.getTitulo().compareToIgnoreCase(p1.getTitulo());
	}
	
}
