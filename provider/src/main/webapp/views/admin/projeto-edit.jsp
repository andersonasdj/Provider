<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   	<title>ProviderOne | Projeto</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarProjeto" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Edição de Projeto</legend>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${projeto.id}">
				</div>
			</div>
			<div>
				<div>
					<input id="nomeCliente" name="nomeCliente" type="hidden"
						value="${projeto.nomeCliente}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de Criação</label>
				<div class="controls">
					<input id="datepicker" name="dataCriacao" type="text" placeholder="Data de Criação" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${projeto.dataCriacao.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Título do Projeto</label>
				<div class="controls">
					<input type="text" id="tituloProjeto" name="tituloProjeto"
						value="${projeto.tituloProjeto}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsavel do Projeto</label>
				<div class="controls">
					<input type="text" id="nomeResponsavel" name="nomeResponsavel"
						value="${projeto.nomeResponsavel}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>${projeto.status}</option>
						<option>Iniciado</option>
						<option>Finalizado</option>
						<option></option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>

 	<script type="text/javascript">
	    function limite_textarea_prob(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contProb').innerHTML = resto;
	        } else {
	            document.getElementById('descricaoProblema').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script type="text/javascript">
	    function limite_textarea_obs(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contObs').innerHTML = resto;
	        } else {
	            document.getElementById('obs').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script type="text/javascript">
	    function limite_textarea_resolu(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contResolu').innerHTML = resto;
	        } else {
	            document.getElementById('resolucao').value = valor.substr(0,quant);
	        }
	    }
    </script>
</html>