package pw2;

public class Curso {
	String nombre;
	String profesor;
	int creditos;
	int horas;
	double nota;
	
	public Curso(String n,String p,int c, int h){
		this.nombre=n;	
		this.profesor=p;
		this.creditos=c;
		this.horas=h;
	}
	public String getNombre(){
		return nombre;
	}
	public String getProfesor(){
		return profesor;
	}
	public int getCreditos(){
		return creditos;
	}
	public int getHoras(){
		return horas;
	}
}
