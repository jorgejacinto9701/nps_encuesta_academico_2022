package www.cibertec.encuesta.entidad;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Ciclo implements Serializable{

	private static final long serialVersionUID = 1L;

	private int idCiclo;
	private String descripcion;
	private Sede sede;
	private String estado;
}
