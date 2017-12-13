<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de Computador</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="salvarComputador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Cadastro de Máquina</legend>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option></option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Função</label>
				<div class="controls">
					<select class="selectpicker" id="funcao"
						name="funcao">
						<option>Estação</option>
						<option>Notebook</option>
						<option>Servidor</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Computador</label>
				<div class="controls">
					<input id="nomeComputador" name="nomeComputador" type="text" placeholder="Nome do Computador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Usuário</label>
				<div class="controls">
					<input id="nomeDoUsuario" name="nomeDoUsuario" type="text" placeholder="Nome do Usuario"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Marca</label>
				<div class="controls">
					<select class="selectpicker" id="marca"
						name="marca">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.marcaComputador}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Modelo do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="modeloProcessador"
						name="modeloProcessador">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.modeloProcessador}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Família do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="familia"
						name="familia">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.familia}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tipo do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="tipoProcessador"
						name="tipoProcessador">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.tipoProcessador}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Frequencia do Processador</label>
				<div class="controls">
					<input id="frequenciaProcessador" name="frequenciaProcessador" type="text" placeholder="Frequencia do Processador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Memória</label>
				<div class="controls">
					<select class="selectpicker" id="qtdMemoria"
						name="qtdMemoria">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.qtdMemoria}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanho do HD</label>
				<div class="controls">
					<select class="selectpicker" id="qtdHd"
						name="qtdHd">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.qtdHd}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Sistema Operacional</label>
				<div class="controls">
					<select class="selectpicker" id="sistemaOperacionalInstalado"
						name="sistemaOperacionalInstalado">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.sistemaOperacionalInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Office Instalado</label>
				<div class="controls">
					<select class="selectpicker" id="officeInstalado"
						name="officeInstalado">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.officeInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label">Sistema Operacional Licenciado</label>
				<div class="controls">
					<select class="selectpicker" id="sistemaOperacionalLicenciado"
						name="sistemaOperacionalLicenciado">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.sistemaOperacionalInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Office Licenciado</label>
				<div class="controls">
					<select class="selectpicker" id="officeLicenciado"
						name="officeLicenciado">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.officeInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Anti Vírus</label>
				<div class="controls">
					<select class="selectpicker" id="antiVirus"
						name="antiVirus">
						<option></option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.antiVirus}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Service Tag</label>
				<div class="controls">
					<input id="serviceTag" name="serviceTag" type="text" placeholder="Service Tag"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<input id="obs" name="obs" type="text" placeholder="Observações"
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