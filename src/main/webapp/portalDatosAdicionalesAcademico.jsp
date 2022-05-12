<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="portalValidaAcademico.jsp" />
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="shortcut icon" href="images/cibertec1.png" />
<link href="css/bootstrap4.1.1.css" rel="stylesheet" id="bootstrap-css">
<link href="css/bootstrapValidator.css" rel="stylesheet" >
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap4.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript">
window.history.forward();
document.oncontextmenu = function(){return false;}
</script>
<title>CIBERTEC</title>
</head>
<body style="background-color: #003660;">
		
		<div class="container" style="margin-top: 2%">
			<form id="id_frm_finalizado" action="finalizadoAcademico">
				<img alt="" src="images/cibertec1.png" width="10%">
				<button type="submit" class="btn btn-success" style="float: right; left: 100px; width: 150px">SALIR</button>
			</form>
		</div>
		<div class="container" style="color: white; width: 100%;text-align: center">
			<label class="text-white">¡Ya estás participando del sorteo! Ahora actualiza tus datos para comunicarnos contigo</label>
		</div>
		<div class="container" style="color: white; width: 100%;text-align: center">
			<label class="text-white">Tus respuestas nos ayudarán a mejorar y darte un mejor servicio</label>
		</div>
		<div class="container" style="color: white; width: 40%">
			<form class="form" action="saveActualizaAcademico" id="id_form" method="post">
				<div class="panel-body"  >
					<div class="form-group">
						<label for="id_celular01" class="text-white">Celular Personal (Empieza con 9)</label>
						<input type="text" name="informacion.celular01" id="id_celular01" class="form-control" maxlength="9">
					</div>
					<div class="form-group">
						<label for="id_celular02" class="text-white">Otro Celular(Empieza con 9)</label>
						<input type="text" name="informacion.celular02" id="id_celular02" class="form-control" maxlength="9">
					</div>
					<div class="form-group">
						<label for="id_correo01" class="text-white">Correo Personal</label>
						<input type="text" name="informacion.correo01" id="id_correo01" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label for="id_correo02" class="text-white">Otro Correo</label>
						<input type="text"	name="informacion.correo02" id="id_correo02" class="form-control" maxlength="50">
					</div>
					<div class="form-group" style=";text-align: center">
						<label for="id_celular01" class="text-white">¡Gracias por tus respuestas!</label>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block" >ACTUALIZAR DATOS</button>
					</div>
			</div>	
			</form>
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
					"informacion.celular01" : {
						selector : "#id_celular01",
						validators : {
							regexp : {
								regexp : /^[9][0-9]{8}$/,
								message : 'El celular tiene 9 dígitos y empieza con 9'
							}
						}
					},
					"informacion.celular02" : {
						selector : "#id_celular02",
						validators : {
							regexp : {
								regexp : /^[9][0-9]{8}$/,
								message : 'El celular tiene 9 dígitos y empieza con 9'
							}
						}
					},
					"informacion.correo01" : {
						selector : "#id_correo01",
						validators : {
							emailAddress: {
		                        message: 'No tiene el formato de correo'
		                    }
						}
					},
					"informacion.correo02" : {
						selector : "#id_correo02",
						validators : {
							emailAddress: {
		                        message: 'No tiene el formato de correo'
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
	</script>
</body>
</html>

