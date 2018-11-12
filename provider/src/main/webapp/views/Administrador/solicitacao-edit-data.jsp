<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
   	<title>ProviderOne | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarSolicitacaoData" method="get"
		class="form-horizontal container">
		<fieldset>
			<legend>Edição data e hora</legend>
			<input id="solicitacao" name="id" type="hidden" value="${solicitacao.id}">
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="text" onKeyPress="DataHoraAbertura(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataAbertura.time}" />">	
				</div>
			</div>
			<c:if test="${not empty solicitacao.dataAndamento.time}">
				<div class="control-group">
					<label class="control-label">Data Andamento</label>
					<div class="controls">
						<input id="dataAndamento" name="dataAndamento" type="text" onKeyPress="DataHoraAndamento(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataAndamento.time}" />">
					</div>
				</div>
			</c:if>
			<c:if test="${empty solicitacao.dataAndamento.time}">
				<div class="control-group">
					<label class="control-label">Data Andamento</label>
					<div class="controls">
						<input id="dataAndamento" name="dataAndamento" type="hidden" onKeyPress="DataHoraAndamento(event, this)" value="<f:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${solicitacao.dataAndamento.time}" />">
					</div>
				</div>
			</c:if>
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
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>
	<script src="assets/js/controla-calendario-agendamento.js"></script>
	<script src="assets/js/controla-campos-texto.js"></script>

	<script>
		/*-----------------------------------------------------------------------
		Máscara para o campo data dd/mm/aaaa hh:mm:ss
		Exemplo: <input maxlength="16" name="datahora" onKeyPress="DataHora(event, this)">
		-----------------------------------------------------------------------*/
		function DataHoraAbertura(evento, objeto){
			var keypress=(window.event)?event.keyCode:evento.which;
			campo = eval (objeto);
			if (campo.value == '00-00-0000 00:00:00')
			{
				campo.value=""
			}
		
			caracteres = '0123456789';
			separacao1 = '-';
			separacao2 = ' ';
			separacao3 = ':';
			conjunto1 = 2;
			conjunto2 = 5;
			conjunto3 = 10;
			conjunto4 = 13;
			conjunto5 = 16;
			if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19))
			{
				if (campo.value.length == conjunto1 )
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto2)
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto3)
				campo.value = campo.value + separacao2;
				else if (campo.value.length == conjunto4)
				campo.value = campo.value + separacao3;
				else if (campo.value.length == conjunto5)
				campo.value = campo.value + separacao3;
			}
			else
				event.returnValue = false;
		}
	</script>
	<script>
		/*-----------------------------------------------------------------------
		Máscara para o campo data dd/mm/aaaa hh:mm:ss
		Exemplo: <input maxlength="16" name="datahora" onKeyPress="DataHora(event, this)">
		-----------------------------------------------------------------------*/
		function DataHoraAndamento(evento, objeto){
			var keypress=(window.event)?event.keyCode:evento.which;
			campo = eval (objeto);
			if (campo.value == '00-00-0000 00:00:00')
			{
				campo.value=""
			}
		
			caracteres = '0123456789';
			separacao1 = '-';
			separacao2 = ' ';
			separacao3 = ':';
			conjunto1 = 2;
			conjunto2 = 5;
			conjunto3 = 10;
			conjunto4 = 13;
			conjunto5 = 16;
			if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19))
			{
				if (campo.value.length == conjunto1 )
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto2)
				campo.value = campo.value + separacao1;
				else if (campo.value.length == conjunto3)
				campo.value = campo.value + separacao2;
				else if (campo.value.length == conjunto4)
				campo.value = campo.value + separacao3;
				else if (campo.value.length == conjunto5)
				campo.value = campo.value + separacao3;
			}
			else
				event.returnValue = false;
		}
	</script>
</html>