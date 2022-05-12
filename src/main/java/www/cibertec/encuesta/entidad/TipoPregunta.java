package www.cibertec.encuesta.entidad;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class TipoPregunta implements Serializable{

	private static final long serialVersionUID = 1L;

	private int idTipoPregunta;
	private String nombre;
	private String alternativas;
}
