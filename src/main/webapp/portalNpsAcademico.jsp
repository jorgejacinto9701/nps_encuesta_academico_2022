<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="portalValidaAcademico.jsp" />
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="shortcut icon" href="images/cibertec1.png" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
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

	<form class="form" action="saveNpsAcademico" id="id_form" method="post">
	<div class="container" style="margin-top: 2%">
		<table class="id_table4 table table-bordered" style="text-align: center;background-color: white; ">
			<thead>
				<tr >
					<th style="text-align: center;">Basado en la experiencia que has vivido en CIBERTEC, ¿qué tan dispuesto estás a recomendarlo a un familiar o amigo?</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_0"><input type="radio" name="alumno.nps" id="opcion_0" value="0">0</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_1"><input type="radio" name="alumno.nps" id="opcion_1" value="1">1</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_2"><input type="radio" name="alumno.nps" id="opcion_2" value="2">2</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_3"><input type="radio" name="alumno.nps" id="opcion_3" value="3">3</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_4"><input type="radio" name="alumno.nps" id="opcion_4" value="4">4</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_5"><input type="radio" name="alumno.nps" id="opcion_5" value="5">5</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_6"><input type="radio" name="alumno.nps" id="opcion_6" value="6">6</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_7"><input type="radio" name="alumno.nps" id="opcion_7" value="7">7</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_8"><input type="radio" name="alumno.nps" id="opcion_8" value="8">8</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_9"><input type="radio" name="alumno.nps" id="opcion_9" value="9">9</label>
							<label class="btn btn-warning" style="width: 60px;margin: 15px" id="btn_10"><input type="radio" name="alumno.nps" id="opcion_10" value="10">10</label>
						</div>
						<div style="background-color: red;">
							<label style="float: left;font-style: italic;font-weight:normal; color: #003660">
							 	0 = Para nada lo recomendaría
							</label>
							<label style="float: right;font-style: italic;font-weight:normal; color: #003660">
								10 = Totalmente lo recomendaría
							</label>			
						</div>
					</td>
				</tr>
				<tr>
					<td >
						<table style="width: 100%">
							<thead>  
								<tr>
									<th style="text-align: center">
										<label id="id_texto" style=";font-style: italic;font-weight:normal; color: #003660">Presiona un opción de entre el 0 y el 10</label>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>	
									<td >
										<textarea id="id_comentario" name="alumno.comentario" rows="3" cols="150" placeholder="Ingrese aquí el comentario" maxlength="1000"></textarea>		
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<button id="id_button" type="button" class="btn btn-success" style="width: 150px">RESPONDER</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>

	<div class="modal fade" id="idModalMensaje" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<span class="glyphicon glyphicon-ok-sign"></span>Seleccione una opción de 0 a 10
						</div>
				
						  <div class="modal-footer">
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
			</div>
	</div>
	
<script type="text/javascript">
	$("#opcion_0").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");});
	$("#opcion_1").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});
	$("#opcion_2").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});
	$("#opcion_3").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});
	$("#opcion_4").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});
	$("#opcion_5").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});
	$("#opcion_6").change(function(){ $("#id_texto").html("¿En qué te hemos fallado?");	});

	$("#opcion_7").change(function(){ $("#id_texto").html("¿Qué debemos mejorar?");	});
	$("#opcion_8").change(function(){ $("#id_texto").html("¿Qué debemos mejorar?");	});

	$("#opcion_9").change(function(){ $("#id_texto").html("¿Qué hemos hecho para merecer tu recomendación?");	});
	$("#opcion_10").change(function(){ $("#id_texto").html("¿Qué hemos hecho para merecer tu recomendación?");	});


	$("#id_button").click(function () {	 
		if( $("#id_form input[name='alumno.nps']:radio").is(':checked')) {  
			$("#id_form").submit();  
		} else {  
			$('#idModalMensaje').modal("show");
		}  
	});
	
	$('#id_form').on("keyup keypress", function(e) {
		  var code = e.keyCode || e.which;

		  if (code == 32 ||code == 44 ||code == 46 ){
			  return true;
		  }
		  if (code == 13) {               
			  e.preventDefault();
			  return false;
		  }
		  if ( code > 31 && (code < 48 || code > 90) && (code < 97 || code > 122) ) {               
		    e.preventDefault();
		    return false;
		  }
	});
</script>
	  
</body>
</html>