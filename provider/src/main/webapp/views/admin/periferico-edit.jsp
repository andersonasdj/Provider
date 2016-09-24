<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/><br/>
	<form action="atualizarPeriferico" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualização de Periférico</legend>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${periferico.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Modelo de Processador</label>
				<div class="controls">
					<input id="modeloProcessador" name="modeloProcessador" type="text"
						value="${periferico.modeloProcessador}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Família Processador</label>
				<div class="controls">
					<input id="familia" name="familia" type="text"
						value="${periferico.familia}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tipo de Processador</label>
				<div class="controls">
					<input id="tipoProcessador" name="tipoProcessador" type="text"
						value="${periferico.tipoProcessador}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Marca de Computador</label>
				<div class="controls">
					<input id="marcaComputador" name="marcaComputador" type="text"
						value="${periferico.marcaComputador}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanhos de Memória</label>
				<div class="controls">
					<input id="qtdMemoria" name="qtdMemoria" type="text"
						value="${periferico.qtdMemoria}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanhos de HD</label>
				<div class="controls">
					<input id="qtdHd" name="qtdHd" type="text"
						value="${periferico.qtdHd}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Sistema Operacional</label>
				<div class="controls">
					<input id="sistemaOperacionalInstalado" name="sistemaOperacionalInstalado" type="text"
						value="${periferico.sistemaOperacionalInstalado}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Microsoft Office</label>
				<div class="controls">
					<input id="officeInstalado" name="officeInstalado" type="text"
						value="${periferico.officeInstalado}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Anti Vírus</label>
				<div class="controls">
					<input id="antiVirus" name="antiVirus" type="text"
						value="${periferico.antiVirus}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-primary" href="perifericosList" role="button">Voltar</a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>	
	<c:import url="rodape.jsp"></c:import>
</body>
</html>