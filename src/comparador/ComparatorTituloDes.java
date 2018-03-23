package comparador;

import java.util.Comparator;

import modelo.Libro;

public class ComparatorTituloDes implements Comparator<Libro>{

	@Override
	public int compare(Libro p0, Libro p1) {
		// TODO Auto-generated method stub
		
		return p1.getTitulo().compareToIgnoreCase(p0.getTitulo());
	}
	
}
