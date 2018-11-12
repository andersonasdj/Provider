<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Tarefa</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="salvarTarefa" method="post" class="form-horizontal container">
		<fieldset>
			<legend>${checklist.nomeCliente}</legend>			
			<h4 align="right">Nova tarefa - ${checklist.tituloChecklist}</h4>
			<div class="control-group">
				<label class="control-label">Numero da Tarefa</label>
				<div class="controls">
					<input id="numero" name="numero" type="text" placeholder="Numero Tarefa" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descrição da Tarefa</label>
				<div class="controls">
					<input id="descricaoTarefa" name="descricaoTarefa" type="text" placeholder="Descrição da Nova Tarefa" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Responsável pela tarefa</label>
				<div class="controls">
					<select class="selectpicker" id="responsavelTarefa"
						name="responsavelTarefa">
						<option></option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações da Tarefa</label>
				<div class="controls">
					<textarea class="form-control" rows="6" id="obs" name="obs" type="text" placeholder="Observações da tarefa"
						value="${tarefa.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge"></textarea>
						<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Observações Complementares</label>
				<div class="controls">
					<div class="col-xs-12 col-md-6">
						<textarea class="form-control" id="obsComplementares" name="obsComplementares" type="text" placeholder="Observações complementares"
							value="${tarefa.obsComplementares}" rows="20" style="width: 640px; height: 417px;" class="input-xlarge"></textarea>
					</div>
				</div>
			</div>
			<input type="hidden" name="id" id="id" value="${checklist.id}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="listarTarefas" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
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
</html>