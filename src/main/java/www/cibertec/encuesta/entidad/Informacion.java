package www.cibertec.encuesta.entidad;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Informacion implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer idInformacion;
	private String celular01;
	private String celular02;
	private String correo01;
	private String correo02;
	private String tipo;
	private String idAlumno;

	public boolean existeDatos() {
		boolean existe = false;
		if ((celular01 != null && !celular01.equals("")) || 
			(celular02 != null && !celular02.equals("")) || 
			(correo01 != null && !correo01.equals("")) || 
			(correo02 != null && !correo02.equals(""))) {
			existe = true;
		}
		return existe;
	}
}
