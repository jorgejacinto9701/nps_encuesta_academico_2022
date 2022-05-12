package www.cibertec.encuesta.entidad;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Sede implements Serializable{

	private static final long serialVersionUID = 1L;

	private int idSede;
	private String nombre;
}
