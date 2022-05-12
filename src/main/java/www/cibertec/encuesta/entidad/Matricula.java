package www.cibertec.encuesta.entidad;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Matricula implements Serializable{

	private static final long serialVersionUID = 1L;

	private Horario horario;
	private Alumno alumno;
	private String estado;

}
