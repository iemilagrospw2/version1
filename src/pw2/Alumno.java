package pw2;

import java.util.ArrayList;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class Alumno {
	@Persistent
	String nombre;
	
	@Persistent
	String apellido;
	
	@Persistent
	int cui;
	
	@PrimaryKey
	String correo;
	
	@Persistent
	ArrayList <Curso > curso = new ArrayList<Curso>();
	
	@Persistent
	int nota1;
	
	@Persistent
	int nota2;
	
	@Persistent
	int nota3;
	
	public Alumno(String n,String a, int c, ArrayList<Curso> cu, String correo){
		this.nombre=n;
		this.apellido=a;
		this.cui=c;
		for(Curso cur:cu)
			curso.add(cur);
		this.correo=correo;
	}
	public Alumno(String correo){
		this.correo=correo;
	}
	public String getNombre(){
		return nombre;
	}
	public String getApellido(){
		return apellido;
	}
	public String getCorreo(){
		return correo;
	}
	public int getCui(){
		return cui;
	}
	public ArrayList<Curso> getCurso(){
		return curso;
	}
	public void setNotas(int n1, int n2, int n3){
		nota1 = n1;
		nota2 = n2;
		nota3 = n3;
	}
	public int getNota1(){
		return nota1;
	}
	public int getNota2(){
		return nota2;
	}
	public int getNota3(){
		return nota3;
	}
}
