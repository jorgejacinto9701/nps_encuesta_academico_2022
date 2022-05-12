<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:if test="${sessionScope.objAlumno == null}">
	<c:set var="objMensaje" value="Debe autenticarse para ingresar al sistema" scope="session"/>
	<jsp:forward page="portalLoginAcademico.jsp" />
</c:if>

