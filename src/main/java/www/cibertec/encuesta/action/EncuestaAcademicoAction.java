package www.cibertec.encuesta.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.apachecommons.CommonsLog;
import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.entidad.Informacion;
import www.cibertec.encuesta.entidad.Matricula;
import www.cibertec.encuesta.entidad.Pregunta;
import www.cibertec.encuesta.entidad.Respuesta;
import www.cibertec.encuesta.model.GeneralModel;
import www.cibertec.encuesta.util.Constantes;
@Getter 
@Setter
@ParentPackage("paquete_cibertec")
@CommonsLog
public class EncuestaAcademicoAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Alumno alumno = new Alumno();
	private List<Matricula> listaMatricula;
	private List<Pregunta> listaPregunta;
	private String idAlumno;
	private String JSONRespuesta;
	private int dataMensaje;
	private Informacion informacion = new Informacion();
	private GeneralModel model = new GeneralModel();
	private Map<String, Object> session = ActionContext.getContext().getSession();

	
	@Action(value = "/loginAlumnoAcademico", results = {
			@Result(name = "LOGIN", location = "/portalLoginAcademico.jsp", type = "redirect"),
			@Result(name = "NPS", location = "/portalNpsAcademico.jsp", type = "redirect"),
			@Result(name = "ENCUESTA", location = "/portalListaCursosAcademico.jsp", type = "redirect")
	})
	public String loginAcademico() {
		log.info("En metodo: loginAcademico");
		int salidaAcademico = model.buscaAlumnoAcademico(alumno);
		
		if (salidaAcademico == -1) {
			session.put("objMensaje", "Error, Envíe un correo al administrador: pjjacint@cibertec.edu.pe");
			return "LOGIN";
		}else if (salidaAcademico == 0) {
			session.put("objMensaje", "Verifica el Código de alumno o la Fecha de nacimiento");
			return "LOGIN";					
		}else {
			int nps = model.buscaAlumnoAcademicoPorEstadoNPS(alumno.getIdAlumno());
			if(nps == -1) {
				session.put("objAlumno", alumno);
				return "NPS";
			}else {
				int academico = model.cantidadMatriculasPendientes(alumno.getIdAlumno());
				
				if(academico == 0) {
					session.remove("objAlumno", alumno);
					session.put("objMensaje", "Ya finalizó las dos encuestas:de experiencia del estudiante y académica");
					//session.put("objMensaje", "Ya finalizó la encuesta académica");
					return "LOGIN";
				}else {
					List<Matricula> objMatriculas = model.listaMatriculasPorAlumno(alumno.getIdAlumno());
					ArrayList<ArrayList<Pregunta>> objTotalPreguntas = new ArrayList<ArrayList<Pregunta>>();

					for (Matricula obj : objMatriculas) {
						ArrayList<Pregunta> objPreguntas = model.listaPreguntasPorEncuestas(obj.getHorario().getEncuesta().getIdEncuesta());
						objTotalPreguntas.add(objPreguntas);
					}
					session.put("objMatriculas", objMatriculas);
					session.put("objTotalPreguntas", objTotalPreguntas);
					session.put("objAlumno", alumno);
					return "ENCUESTA";
				}
					
			}
		}
	}
	
	
	@Action(value = "/saveNpsAcademico", results = {
			@Result(name = "LOGIN", location = "/portalLoginAcademico.jsp", type = "redirect"),
			@Result(name = "ENCUESTA", location = "/portalListaCursosAcademico.jsp", type = "redirect")})
	public String saveNPS() {
		log.info("En metodo: saveNPS");
		Alumno objAlumno =  (Alumno)session.get("objAlumno");
		if (objAlumno == null) {
			session.put("objMensaje", "Error, Envíe un correo al administrador: pjjacint@cibertec.edu.pe");
			return "LOGIN";
		}else {
			objAlumno.setComentario(alumno.getComentario());
			objAlumno.setNps(alumno.getNps());
			int salida =  model.insertaAcademicoNPS(objAlumno);

			if(salida == -1) {
				session.put("objMensaje", "Error, Envíe un correo al administrador: pjjacint@cibertec.edu.pe");
				return "LOGIN";
			}else {
				
				int academico = model.cantidadMatriculasPendientes(objAlumno.getIdAlumno());
				
				if(academico == 0) {
					session.remove("objAlumno");
					//session.put("objMensaje", "Ya finalizó las dos encuestas:de experiencia del estudiante y académica");
					session.put("objMensaje", "Ya finalizó la encuesta académica");
					return "LOGIN";
				}else {
					List<Matricula> objMatriculas = model.listaMatriculasPorAlumno(objAlumno.getIdAlumno());
					ArrayList<ArrayList<Pregunta>> objTotalPreguntas = new ArrayList<ArrayList<Pregunta>>();

					for (Matricula obj : objMatriculas) {
						ArrayList<Pregunta> objPreguntas = model.listaPreguntasPorEncuestas(obj.getHorario().getEncuesta().getIdEncuesta());
						objTotalPreguntas.add(objPreguntas);
					}
					session.put("objMatriculas", objMatriculas);
					session.put("objTotalPreguntas", objTotalPreguntas);
					return "ENCUESTA";
				}
			}
		}
	}
	
	
	@Action(value = "/saveActualizaAcademico", results = {
			@Result(name = "LOGIN", location = "/portalLoginAcademico.jsp", type = "redirect"),
			@Result(name = "FINALIZADO", location = "/portalFinalizadoAcademico.jsp", type = "redirect") })
	public String saveActualizacion() {
		log.info("En metodo: saveActualizacion");
		Alumno objAlumno =  (Alumno)session.get("objAlumno");
		if (objAlumno == null) {
			session.put("objMensaje", "Error, Envíe un correo al administrador: pjjacint@cibertec.edu.pe");
			return "LOGIN";
		}else {
			informacion.setIdAlumno(objAlumno.getIdAlumno());
			informacion.setTipo(Constantes.ACADEMICO);
			
			if(informacion.existeDatos()) {
				int salida =  model.insertaInformacion(informacion);
				if(salida == -1) {
					session.put("objMensaje", "Error, Envíe un correo al administrador: pjjacint@cibertec.edu.pe");
					session.remove("objAlumno");
					return "LOGIN";
				}else {
					return "FINALIZADO";
				}
			}else {
				return "FINALIZADO";
			}
			
		}
	}
	
	@Action(value = "/actualizaDatosAcademico", results = { 
			@Result(name = SUCCESS, location = "/portalDatosAdicionalesAcademico.jsp", type = "redirect") })
	public String actualizaDatosAcademico() {
		log.info("En metodo:  actualizaDatosAcademico");
		return SUCCESS;
	}
	
	@Action(value = "/finalizadoAcademico", results = { 
			@Result(name = SUCCESS, location = "/portalFinalizadoAcademico.jsp", type = "redirect") })
	public String finalizado() {
		log.info("En metodo:  finalizado");
		session.clear();
		return SUCCESS;
	}
	
	@Action(value = "/listAllMatricula", results = {
			@Result(name = SUCCESS, type = "json")})
	public String listAllMatricula() {
		Alumno objAlumno =  (Alumno)session.get("objAlumno");
			listaMatricula = model.listaMatriculasPorAlumno(objAlumno.getIdAlumno());
			log.info("En metodo:  listAllMatricula " + idAlumno);
			session.put("objMatriculas", listaMatricula);
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	@Action(value = "/listAllPreguntas", results = {
			@Result(name = SUCCESS, type = "json")})
	public String listAllPreguntas() {
		log.info("En metodo:  listAllPreguntas");
		listaPregunta = (List<Pregunta>) session.get("objTotalPreguntas");
		return SUCCESS;
	}

	@Action(value = "/saveRespuesta", results = { 
			@Result(name = SUCCESS, type = "json") })
	public String saveRespuesta()  {
		log.info("En metodo:  saveRespuesta");
		Gson gson = new Gson();
		Respuesta bean = (Respuesta) gson.fromJson(JSONRespuesta, Respuesta.class);

		if (JSONRespuesta != null && bean.getRespuesta().trim().length() > 0 ) {
			int estInsertado = model.insertaRespuesta(bean);

			Matricula matricula = new Matricula();
			matricula.setHorario(bean.getHorario());
			matricula.setAlumno(bean.getAlumno());
			matricula.setEstado(Constantes.ENVIADO);

			int estActualizado = model.actualizaMatricula(matricula);
			if (estInsertado != -1 && estActualizado != -1)
				dataMensaje = 1;
			else
				dataMensaje = -1;
		}else {
			dataMensaje = -1;
		}
		return SUCCESS;
	}

	
	
}
