<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Checklist</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarChecklist" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Edição de Checklist</legend>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${checklist.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">CheckList para o Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeCliente"
						name="nomeCliente">
							<option>${checklist.nomeCliente}</option>
							<c:forEach var="cliente" items="${clientes}">
								<option>${cliente.nome}</option>
							</c:forEach>
							<c:if test="${checklist.nomeCliente != 'Padrão'}">
								<option>Padrão</option> 
							</c:if>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de Criação</label>
				<div class="controls">
					<input id="datepicker" name="dataCriacao" type="text" placeholder="Data de Criação" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${checklist.dataCriacao.time}" />"  disabled/> <i class="fa fa-calendar fa-lg"> </i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Número do Checklist</label>
				<div class="controls">
					<input type="text" id="numeroChecklist" name="numeroChecklist"
						value="${checklist.numeroChecklist}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Título Checklist</label>
				<div class="controls">
					<input type="text" id="tituloChecklist" name="tituloChecklist"
						value="${checklist.tituloChecklist}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsável do CheckList</label>
				<div class="controls">
					<input type="text" id="nomeResponsavel" name="nomeResponsavel"
						value="${checklist.nomeResponsavel}" class="input-xlarge" disabled>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<input type="hidden" id="nomeResponsavel" name="nomeResponsavel"
						value="${checklist.nomeResponsavel}">
			<input type="hidden" id="datepicker" name="dataCriacao" type="text"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${checklist.dataCriacao.time}" />" />
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>
</html>