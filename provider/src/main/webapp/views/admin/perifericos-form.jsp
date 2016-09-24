<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>ProviderOne | Periférico</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/><br/>
	<form action="gravaPeriferico" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Criação de Periféricos</legend>
			<div class="control-group">
				<label class="control-label">Modelo de Processador</label>
				<div class="controls">
					<input id="modeloProcessador" name="modeloProcessador" type="text" placeholder="Modelo de Processador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Familia Processador</label>
				<div class="controls">
					<input id="familia" name="familia" type="text" placeholder="Família Processador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tipo de Processador</label>
				<div class="controls">
					<input id="tipoProcessador" name="tipoProcessador" type="text" placeholder="Tipo de Processador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Marca de Computador</label>
				<div class="controls">
					<input id="marcaComputador" name="marcaComputador" type="text" placeholder="Marca de Computador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanhos de Memória</label>
				<div class="controls">
					<input id="qtdMemoria" name="qtdMemoria" type="text" placeholder="Tamanhos de memória"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanhos de HD</label>
				<div class="controls">
					<input id="qtdHd" name="qtdHd" type="text" placeholder="Tamanhos de HD"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Sistema Operacional</label>
				<div class="controls">
					<input id="sistemaOperacionalInstalado" name="sistemaOperacionalInstalado" type="text" placeholder="Sistema Operacional"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Microsoft Office</label>
				<div class="controls">
					<input id="officeInstalado" name="officeInstalado" type="text" placeholder="Microsoft Office"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Anti Vírus</label>
				<div class="controls">
					<input id="antiVirus" name="antiVirus" type="text" placeholder="Anti Vírus"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar</a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</html>