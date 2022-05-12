package www.cibertec.encuesta.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.extern.apachecommons.CommonsLog;
import www.cibertec.encuesta.entidad.Alumno;
import www.cibertec.encuesta.entidad.Ciclo;
import www.cibertec.encuesta.entidad.Curso;
import www.cibertec.encuesta.entidad.Docente;
import www.cibertec.encuesta.entidad.Encuesta;
import www.cibertec.encuesta.entidad.Horario;
import www.cibertec.encuesta.entidad.Informacion;
import www.cibertec.encuesta.entidad.Matricula;
import www.cibertec.encuesta.entidad.Pregunta;
import www.cibertec.encuesta.entidad.Respuesta;
import www.cibertec.encuesta.entidad.TipoPregunta;
import www.cibertec.encuesta.util.ConexionDB;

@CommonsLog
public class GeneralModel {
	
	public int buscaAlumnoAcademico(Alumno obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select count(*) from alumno where (idalumno = ? and fechaNacimiento = ?) or (idalumno = ? and fechaNacimiento = '1111-11-11')";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getIdAlumno());
			pstm.setString(2, obj.getFechaNacimiento());
			pstm.setString(3, obj.getIdAlumno());
			log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				salida = rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return salida;
	}
	
	public int buscaAlumnoAcademicoPorEstadoNPS(String idAlumno) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select nps from alumno where idalumno = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idAlumno);
			log.info(pstm);
			rs = pstm.executeQuery();
			if (rs.next()) {
				salida = rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return salida;
	}
	
	
	public int cantidadMatriculasPendientes(String idAlumno) {
		Connection conn = null;
		PreparedStatement  pstm = null;
		ResultSet rs = null;
		int salida = -1;
		try {
			conn = ConexionDB.getConexion();
			String sql = "SELECT count(*) FROM matricula where idalumno =? and estado='PENDIENTE';";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idAlumno);
			log.info(pstm);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				salida =rs.getInt(1);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return salida;
	}
	
	public List<Matricula> listaMatriculasPorAlumno(String idAlumno) {
		ArrayList<Matricula> lista = new ArrayList<Matricula>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "SELECT h.idhorario, h.idcurso,h.iddocente, h.idciclo, h.idencuesta, h.idsede,h.seccion, h.grupo, fn_modalidad(h.modalidad), fn_tipo_de_clase(h.tipoclase), c.nombre,d.nombres, m.estado FROM matricula m inner join horario h on m.idhorario = h.idhorario inner join docente d on d.iddocente = h.iddocente inner join curso c on c.idcurso = h.idcurso  where m.idalumno = ? order by 11 asc;";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idAlumno);
			log.info(pstm);
			rs = pstm.executeQuery();
			Matricula matricula = null;
			Horario horario = null;
			Curso curso = null;
			Docente docente = null;
			Encuesta encuesta = null;
			Ciclo ciclo = null;
			while (rs.next()) {
				matricula = new Matricula();
				horario = new Horario();
				curso = new Curso();
				docente = new Docente();
				encuesta = new Encuesta();
				ciclo = new Ciclo();

				horario.setIdHorario(rs.getInt(1));
				horario.setSeccion(rs.getString(7));
				horario.setGrupo(rs.getString(8));
				horario.setModalidad(rs.getString(9));
				horario.setTipoclase(rs.getString(10));

				curso.setIdCurso(rs.getString(2));
				curso.setNombre(rs.getString(11));

				ciclo.setIdCiclo(rs.getInt(4));

				encuesta.setIdEncuesta(rs.getInt(5));

				docente.setIdDocente(rs.getInt(3));
				docente.setNombres(rs.getString(12));

				horario.setCurso(curso);
				horario.setEncuesta(encuesta);
				horario.setDocente(docente);
				horario.setCiclo(ciclo);

				matricula.setHorario(horario);
				matricula.setEstado(rs.getString(13));

				lista.add(matricula);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return lista;
	}
	
	public ArrayList<Pregunta> listaPreguntasPorEncuestas(int idEncuesta) {
		ArrayList<Pregunta> lista = new ArrayList<Pregunta>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "select e.*,x.alternativas  from pregunta e, preguntasxencuestas p, tipopregunta x where e.idtipo = x.idtipo and e.idpregunta = p.idpregunta and p.idencuesta = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idEncuesta);
			log.info(pstm);
			rs = pstm.executeQuery();
			Pregunta pregunta = null;
			TipoPregunta tipoPregunta = null;
			while (rs.next()) {
				pregunta = new Pregunta();
				pregunta.setIdPregunta(rs.getInt(1));
				pregunta.setDescripcion(rs.getString(2));

				tipoPregunta = new TipoPregunta();
				tipoPregunta.setIdTipoPregunta(rs.getInt(3));
				tipoPregunta.setAlternativas(rs.getString(4));

				pregunta.setTipoPregunta(tipoPregunta);
				lista.add(pregunta);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return lista;
	}
	
	public int insertaAcademicoNPS(Alumno obj) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm1 = null,pstm2 = null,pstm3 = null,pstm4 = null;
		ResultSet rs1 = null, rs2 = null;
		String campus = "-1";
		int idSede = -1;
		try {
			conn = ConexionDB.getConexion();
			conn.setAutoCommit(false);
			
			String sql1 = "update alumno set nps=?, comentario=?, fechaRegistroNPS=curtime(), estado='VERDADERO' where idalumno=?";
			String sql2 = "select campus from alumno where idalumno= ?";
			String sql3 = "select idSede from sede where nombre= ?";
			String sql4 = "insert into mensaje values(null,?,?,?,'-1','No Clasificado','No Clasificado',?)";
			
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setInt(1, obj.getNps());
			pstm1.setString(2, obj.getComentario());
			pstm1.setString(3, obj.getIdAlumno());
			log.info(pstm1);
			contador = pstm1.executeUpdate();
			
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, obj.getIdAlumno());
			log.info(pstm2);
			rs1 = pstm2.executeQuery();
			if (rs1.next()) {
				campus = rs1.getString(1);
			}
			
			if (campus.equals("-1")) {
				conn.rollback();
				contador = -1;
			}
			
			pstm3 = conn.prepareStatement(sql3);
			pstm3.setString(1, campus);
			log.info(pstm3);
			rs2 = pstm3.executeQuery();
			if (rs2.next()) {
				idSede = rs2.getInt(1);
			}
			
			if (idSede == -1) {
				conn.rollback();
				contador = -1;
			}
			
			pstm4 = conn.prepareStatement(sql4);
			pstm4.setString(1, obj.getIdAlumno());
			pstm4.setString(2, obj.getComentario());
			pstm4.setInt(3, idSede);
			pstm4.setInt(4, obj.getNps());
			log.info(pstm4);
			contador = pstm4.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (rs1 != null) rs1.close();
				if (rs2 != null) rs2.close();
				if (pstm1 != null) pstm1.close();
				if (pstm2 != null) pstm2.close();
				if (pstm3 != null) pstm3.close();
				if (pstm4 != null) pstm4.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {}
		}
		return contador;
	}
	
	public int insertaInformacion(Informacion bean) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "insert into informacion values(null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getCelular01());
			pstm.setString(2, bean.getCelular02());
			pstm.setString(3, bean.getCorreo01());
			pstm.setString(4, bean.getCorreo02());
			pstm.setString(5, bean.getTipo());
			pstm.setString(6, bean.getIdAlumno());
			log.info(pstm);
			contador = pstm.executeUpdate();
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return contador;
	}
	
	public int actualizaMatricula(Matricula bean) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "update matricula set estado=? where idalumno = ? and idhorario=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getEstado());
			pstm.setString(2, bean.getAlumno().getIdAlumno());
			pstm.setInt(3, bean.getHorario().getIdHorario());
			log.info(log);
			contador = pstm.executeUpdate();
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return contador;
	}
	
	public int insertaRespuesta(Respuesta bean) {
		int contador = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = ConexionDB.getConexion();
			String sql = "insert into respuestas values(?,?,?,?,?,?,?,?,curtime())";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bean.getHorario().getIdHorario());
			pstm.setString(2, bean.getAlumno().getIdAlumno());
			pstm.setString(3, bean.getRespuesta());
			pstm.setDouble(4, bean.getPfinal());
			pstm.setString(5, bean.getComentario());
			pstm.setInt(6, bean.getPregunta01());
			pstm.setInt(7, bean.getPregunta02());
			pstm.setInt(8, bean.getPregunta03());
			log.info(pstm);
			contador = pstm.executeUpdate();
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return contador;
	}
}
