<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="shortcut icon" href="images/cibertec1.png" />
<link href="css/bootstrap4.1.1.css" rel="stylesheet" id="bootstrap-css">
<link href="css/bootstrapValidator.portal.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap4.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript">
window.history.forward();
document.oncontextmenu = function(){return false;}
</script>
<title>CIBERTEC</title>
</head>
<body style="background-color: #003660;">

	<div class="container" style="margin-top: 2%">
		<img alt="LOGO CIBERTEC" src="images/cibertec1.png" >
	</div>
	<div class="container" style="height: 50px">
		<c:if test="${sessionScope.objMensaje != null}">
				<div class="alert fade in" id="success-alert" style="background-color: #003660; color: white; font-size: 15px; font-weight: 100;text-align: center">
					${sessionScope.objMensaje}
				</div>
		</c:if>
		<c:remove var="objMensaje" scope="session"/>
	</div>
	<div class="container" style="color: white; width: 35%">
			<form class="form" action="loginAlumnoAcademico" id="id_form" method="post">
				<div class="panel-body"  >
					<div class="form-group" style="text-align: center">
							<label class="text-white">INGRESO A LA ENCUESTA - ACADÉMICO</label>
					</div>
					<div class="form-group">
						  <label for="id_codigo" class="text-white">Código de Alumno (Sin la letra i). Ejemplo: <b>200920386</b>.</label>
							<input type="text" name="alumno.idAlumno" id="id_codigo" class="form-control" maxlength="9" onkeypress="return valida_codigo_academico();" onkeyup="valida_mayuscula(this);" >
					 </div>
					<div class="form-group">
							<label for="id_fec_nac" class="text-white">Fecha de Nacimiento (yyyy-MM-dd). Ejemplo: <b>2010-10-10</b>.</label>
							<input type="text"	name="alumno.fechaNacimiento" id="id_fec_nac" class="form-control" maxlength="10"  onkeypress="return valida_fecha_numero_guion();" >
					</div>
					<div class="form-group">
							<button type="submit" class="btn btn-success btn-block" >ENTRAR</button>
					</div>
				</div>	
			</form>
	</div>
	<div class="container" style="color: white; width: 100%; margin-top: 4%">
		<div>
				<label>Cualquier consulta enviar un correo al administrador: pjjacint@cibertec.edu.pe</label>
		</div>
	</div>
	<script type="text/javascript">
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});

		$(document).ready(function() {
			$('#id_form').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					"alumno.idAlumno" : {
						selector : "#id_codigo",
						validators : {
							notEmpty : {
								message : 'El Código es un campo obligatorio'
							},
							regexp : {
								regexp : /^[0-9A]{9}$/,
								message : 'El Código tiene 9 dígitos'
							}
						}
					},
					"alumno.fechaNacimiento" : {
						selector : "#id_fec_nac",
						validators : {
							notEmpty : {
								message : 'La fecha es un campo obligatorio'
							},
							date : {
								format : 'YYYY-MM-DD',
								message : 'La fecha tiene formato YYYY-MM-DD'
							}
						}
					},
				}
			});

			// Validate the form manually
			$('#validateBtn').click(function() {
				$('#id_form').bootstrapValidator('validate');
			});
		});
		
		$(document).ready(function() {
			$("#id_codigo").focus();
		});
	</script>
</body>
</html>

