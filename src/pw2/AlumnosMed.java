package pw2;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
@PersistenceCapable
public class AlumnosMed {
	
	@Persistent
	String tipo;
	@Persistent
	String correo;
	@Persistent
	 int contador=0;
	@Persistent
	 String acceso;


	public AlumnosMed(){}
	public AlumnosMed(String correo,String tipo,int i){
		super();
		this.tipo=tipo;
		this.correo=correo;
		contador = i;
		this.acceso="concedido";
	}
	public int getContador(){
		return contador;
	}
	public void setContador(){
		contador++;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getAcceso() {
		return acceso;
	}
	public void setAcceso(String acceso) {
		this.acceso = acceso;
	}
}