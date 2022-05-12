<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head> 
<link rel="shortcut icon" href="images/cibertec1.png" />
<link href="css/bootstrap4.1.1.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap4.1.1.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script type="text/javascript">
window.history.forward();
document.oncontextmenu = function(){return false;}
</script>
<title>CIBERTEC</title>
</head>

<body style="background-color: #003660; color: white;">

	<div class="container" style="margin-top: 2%">
		<img alt="" src="images/cibertec1.png" width="10%">
	</div>
	

	<div style="margin-left: 20%; margin-top: 10%" >
		<form action="portalLoginAcademico.jsp"  method="post">
			<table style="width: 80%;border: 1px solid white " border="1">
				<tr style="color: white; font-size: 20px">
					<td colspan="2" style="text-align: center;" >
							Mensaje
					</td>
				</tr>
				<tr>
					<td>
						<label class="container"> 
							¡Muchas gracias por su participación!
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-success btn-block login-button">SALIR</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>