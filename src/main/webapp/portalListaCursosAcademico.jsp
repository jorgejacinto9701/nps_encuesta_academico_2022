<%@ page contentType="text/html; charset=UTF-8" %>
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
<style type="text/css">
.table-striped>tbody>tr:nth-of-type(odd) {
	background-color: #004164;
}

.radio-inline {
	font-weight: bold;
	color: #28908f;
}
</style>
</head>
   
<body style="background-color: #003660; color: white;">

	<div class="container" style="margin-top: 2%" >
		<!-- <form id="id_frm_finalizado" action="finalizadoAcademico">  -->
		<form id="id_frm_finalizado" action="actualizaDatosAcademico">
			<img alt="" src="images/cibertec1.png" width="10%" >
    		<button type="submit"   class="btn btn-success btn-md" style="float:right; left:100px; width: 150px">SALIR</button>
    	</form>
    </div>
	<div class="container" style="margin-top: 2%">
		<div style="background-color: #003660; color: white;">
			<form id="id_frm_enviado" action="actualizaDatosAcademico"></form> 
			<!-- <form id="id_frm_enviado" action="finalizadoAcademico"></form> -->
			<input type="hidden" value="${sessionScope.objAlumno.idAlumno}" id="id_alumno">
			<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 5%">Ver</th>
							<th style="width: 5%">Código</th>
							<th style="width: 35%">Curso</th>
							<th style="width: 35%">Docente</th>
							<th style="width: 7%">Sección</th>
							<th style="width: 5%">Grupo</th>
							<th style="width: 8%">Tipo</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
		</div>

		<c:forEach items="${sessionScope.objTotalPreguntas}" var="varPregunta"	varStatus="i">
		
			<input type="hidden" value="${varPregunta.size()}" id="id_num_preguntas_${i.index}">
		
			<div class="modal fade ModalGuardaEncuesta"	id="idModalEncuesta_${i.index}">
				<div class="modal-dialog" style="width: 70%">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span>
							</button>
							<h4>${sessionScope.objMatriculas[i.index].horario.curso.nombre}</h4>
						</div>
						<div class="modal-body">
							<div style="color: black;">
								<form method="post" id="idRegistra_${i.index}"	accept-charset="UTF-8" action="" class="form-horizontal" method="post" data-toggle="validator" role="form">
									<input type='hidden' value="" id='id_horario'>

									<table class="id_table2 table table-bordered">
										<thead>
											<tr>
												<th>Código</th>
												<th>El docente del curso: ${sessionScope.objMatriculas[i.index].horario.docente.nombres}</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									<c:if test="${sessionScope.objMatriculas[i.index].horario.encuesta.idEncuesta > 1}">
									<table class="id_table3 table table-bordered">
										<thead>
											<tr>
												<th>Código</th>
												<th>Preguntas generales</th>
											</tr>
										</thead>
										<tbody>
											<tr>
													<td>1</td>
													<td>El docente maneja adecuadamente la plataforma y sus herramientas para el desarrollo de la clase no presencial.
														<table>
														<tbody>
															<tr>
																<td>
																	<label class="radio-inline pregunta_p01">
																		<input required="required" type="radio" value="5" name="id_pregunta_p01_${i.index}" id="id_pregunta_p01_${i.index}">Siempre
																	</label>
																	<label class="radio-inline pregunta_p01">
																		<input required="required" type="radio" value="4" name="id_pregunta_p01_${i.index}" id="id_pregunta_p01_${i.index}">A menudo
																	</label>
																	<label class="radio-inline pregunta_p01">
																		<input required="required" type="radio" value="3" name="id_pregunta_p01_${i.index}" id="id_pregunta_p01_${i.index}">A veces
																	</label>
																	<label class="radio-inline pregunta_p01">
																		<input required="required" type="radio" value="2" name="id_pregunta_p01_${i.index}" id="id_pregunta_p01_${i.index}">Raramente
																	</label>
																	<label class="radio-inline pregunta_p01">
																		<input required="required" type="radio" value="1" name="id_pregunta_p01_${i.index}" id="id_pregunta_p01_${i.index}">Nunca
																	</label>
																</td>
															</tr>
															</tbody>
														</table>
													</td>
											</tr>	
											<tr>
											        <td>2</td>
													<td>¿Cuán satisfecho estás con el funcionamiento de las clases no presenciales y las herramientas utilizadas para abordar los aprendizajes?
														<table>
														<tbody>
															<tr>
																<td>
																	<label class="radio-inline pregunta_p02">
																		<input required="required" type="radio" value="5" name="id_pregunta_p02_${i.index}" id="id_pregunta_p02_${i.index}">Muy satisfecho
																	</label>
																	<label class="radio-inline pregunta_p02">
																		<input required="required" type="radio" value="4" name="id_pregunta_p02_${i.index}" id="id_pregunta_p02_${i.index}">Satisfecho
																	</label>
																	<label class="radio-inline pregunta_p02">
																		<input required="required" type="radio" value="3" name="id_pregunta_p02_${i.index}" id="id_pregunta_p02_${i.index}">Ni satisfecho ni insatisfecho
																	</label>
																	<label class="radio-inline pregunta_p02">
																		<input required="required" type="radio" value="2" name="id_pregunta_p02_${i.index}" id="id_pregunta_p02_${i.index}">Insatisfecho
																	</label>
																	<label class="radio-inline pregunta_p02">
																		<input required="required" type="radio" value="1" name="id_pregunta_p02_${i.index}" id="id_pregunta_p02_${i.index}">Muy insatisfecho
																	</label>
																</td>
															</tr>
															</tbody>
														</table>
													</td>
											</tr>	
											<tr>
													<td>3</td>
													<td>¿Cuán satisfecho estás con el contenido del curso y el material de estudio disponible para el aprendizaje?
														<table>
														<tbody>
															<tr>
																<td>
																	<label class="radio-inline pregunta_p03">
																		<input required="required" type="radio" value="5" name="id_pregunta_p03_${i.index}" id="id_pregunta_p03_${i.index}">Muy satisfecho
																	</label>
																	<label class="radio-inline pregunta_p03">
																		<input required="required" type="radio" value="4" name="id_pregunta_p03_${i.index}" id="id_pregunta_p03_${i.index}">Satisfecho
																	</label>
																	<label class="radio-inline pregunta_p03">
																		<input required="required" type="radio" value="3" name="id_pregunta_p03_${i.index}" id="id_pregunta_p03_${i.index}">Ni satisfecho ni insatisfecho
																	</label>
																	<label class="radio-inline pregunta_p03">
																		<input required="required" type="radio" value="2" name="id_pregunta_p03_${i.index}" id="id_pregunta_p03_${i.index}">Insatisfecho
																	</label>
																	<label class="radio-inline pregunta_p03">
																		<input required="required" type="radio" value="1" name="id_pregunta_p03_${i.index}" id="id_pregunta_p03_${i.index}">Muy insatisfecho
																	</label>
																</td>
															</tr>
															</tbody>
														</table>
													</td>
											</tr>	
										</tbody>
									</table>
									
									
									</c:if>
									<table class="id_table4 table table-bordered">
										<thead>
											<tr>
												<th>Código</th>
												<th>Comentarios para el docente: ${sessionScope.objMatriculas[i.index].horario.docente.nombres} </th>
											</tr>
										</thead>
										<tbody>
											<tr>
													<td>1</td>
													<td> 
														<table>
														<tbody>
															<tr>
																<td>
																	<textarea id="id_comentario_${i.index}" rows="3" cols="100" placeholder="Ingrese aquí un comentario sobre el docente" maxlength="300"></textarea>
																</td>
															</tr>
															</tbody>
														</table>
													</td>
											</tr>															
										</tbody>
									</table>

									<div style="text-align: center;">
										<button type="submit" class="btnGuardar btn btn-success" onclick="ValidarForm(${i.index}); return false;">
											GUARDAR
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

	<script type="text/javascript">
		listarAllCursos();
	
		function listarAllCursos(){
			$("#id_table tbody").empty(); 

			$.getJSON("listAllMatricula",{idAlumno:$("#id_alumno").val()}, function (response){
				if(numPendientes(response.listaMatricula) == 0){
					document.getElementById("id_frm_enviado").submit();
				}
				$.each(response.listaMatricula, function(index, item){
					if(item.estado == 'PENDIENTE'){
						mostrarFila(index,item)	
					}
				});
			});
			
		}
		
		function numPendientes(listaMatricula){
			var c = 0;
			$.each(listaMatricula, function(index, item){
				if(item.estado == 'PENDIENTE'){
					c++;	
				}
			});
			return c;
		}
		
		function mostrarFila(index,item){
			var editar='<button type="button" class="btn btn-warning" onclick="verEncuesta('+"'" + index + "'" + ',' + "'" + item.horario.idHorario + "'"+')">RESPONDER</button>';
				
			$("#id_table").append("<tr><td>"+editar+"</td>"+
						"<td>"+item.horario.curso.idCurso+"</td>"+
						"<td>"+item.horario.curso.nombre+"</td>"+
						"<td>"+item.horario.docente.nombres+"</td>"+
						"<td>"+item.horario.seccion+"</td>"+
						"<td>"+item.horario.grupo+"</td>"+
						"<td>"+item.horario.tipoclase+"</td>");
		}
		
		function verEncuesta(i,idHorario){
			$("#id_horario").val(idHorario);
					
			var formModal= '#idModalEncuesta_'+i;
			$(formModal).modal("show");
			
			$(".id_table2 tbody").empty(); 
			$.getJSON("listAllPreguntas",{}, function (response){
				$.each(response.listaPregunta[parseInt(i)], function(index, item){
					var longui=response.listaPregunta.length;
						var NPreguntas=item.tipoPregunta.alternativas;
						var arrayAlter=NPreguntas.split("-");
						var arraypreguntas="";
						for(a = 0; a < arrayAlter.length; a++){
							arraypreguntas+=
							"<label class='radio-inline "+"curso_"+index+"'"+">"
								+"<input required='required' type='radio' value=" + "'" + (20-a*5) + "'" + " name='curso_" + index+ "'" + ">" +arrayAlter[a]
							+"</label>";
						}
						$(".id_table2").append("<tr><td>" + (index+1) + "</td><td>"+item.descripcion+"<table><tr><td>" + arraypreguntas + "</td></tr></table></td>");
				});
			});		
			
			 $("#id_comentario_"+i).val('');
			 $('input[name=id_pregunta_p01_'+i+']').attr('checked',false);
			 $('input[name=id_pregunta_p02_'+i+']').attr('checked',false);
			 $('input[name=id_pregunta_p03_'+i+']').attr('checked',false);
		}

		function ValidarForm(w){
			 var valido = document.getElementById('idRegistra_'+w).checkValidity();
			 if (valido) {
			    grabarPregunta(w);
			 }else{
				var validator = $('#idRegistra_'+w).data('bootstrapValidator');
			   	validator.validate();
			 }	    
		}

		function grabarPregunta(w){
				var json,id_num_preg, id_horario, id_alumno, id_respuesta, id_comentario, id_pro_final, id_pregunta01, id_pregunta02, id_pregunta03;
				arrarRes= [];
				id_num_preg = $("#id_num_preguntas_" + w).val();
				id_pro_final = 0.0;
				
				for(b = 0; b < id_num_preg; b++){
					var ele = document.getElementsByName('curso_'+b); 
			        for(i = 0; i < ele.length; i++) { 
			            if(ele[i].checked){  
			               	arrarRes[b]= ele[i].value; 
			               	id_pro_final += parseFloat(ele[i].value);
			            }    	
			         } 
				}

				id_horario = $("#id_horario").val();
				id_alumno = $("#id_alumno").val();
				id_respuesta = arrarRes.toString();
				id_pro_final = (parseFloat(id_pro_final)/parseFloat(id_num_preg)).toFixed(2);
				id_comentario = $("#id_comentario_"+w).val();
				id_pregunta01 = $("#id_pregunta_p01_"+w+":checked").val();
				id_pregunta02 = $("#id_pregunta_p02_"+w+":checked").val();
				id_pregunta03 = $("#id_pregunta_p03_"+w+":checked").val();
				
				json = JSON.stringify({"horario":{"idHorario":id_horario},"alumno":{"idAlumno":id_alumno},"respuesta":id_respuesta,"pfinal":id_pro_final,"comentario":id_comentario,"pregunta01":id_pregunta01,"pregunta02":id_pregunta02,"pregunta03":id_pregunta03});
	  
				$.ajax({
					url:  'saveRespuesta',
					type: 'POST',
					dataType:'json',
					data: {"JSONRespuesta":json},
					success:function(data){
						if(data.dataMensaje==1){
							$("#id_table").DataTable().destroy();
							$("#id_table tbody").empty(); 
							listarAllCursos();
							$(".ModalGuardaEncuesta").modal("hide");
						}else
							swal("Error al guardar el registro, salga del sistema y vuelva a intentar","","error");
							return false;
						},
					error: function (jqXhr) { 
						swal("Error en la conexión","","error");
					}
			   });	
		}
</script>

</body>
</html>