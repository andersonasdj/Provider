<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne - Upload</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<br/><br/><br/>
	<div class="container">
	<legend></legend>
		<div align="center">
		<br/>
			<form:form modelAttribute="itemForm" enctype="multipart/form-data">
				<form:input path="files" id="1" type="file"/><br/><br/>
				<!--<form:input path="tags" type="text" title="######,###"/> -->
				<input type="hidden" name="idTarefa" id=idTarefa value="${idTarefa}">
				<input type="hidden" name="idChecklist" id="idChecklist" value="${idChecklist}">
				<form:button>Enviar</form:button>
			</form:form>
		</div>	
	<br/><br/><br/><br/><br/><br/>
	<legend></legend>
	</div>
	<c:import url="rodape.jsp"></c:import>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>