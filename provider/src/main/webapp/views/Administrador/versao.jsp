<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Relat�rio</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
</head>
<body>
	<br />
		<fieldset></fieldset>
		<div class="container">
			<legend>Vers�o 1.5</legend>
			<ul>
				<li>Nova op��o para copiar uma solicita��o.</li>
				<ul>
						<li>Uma nova solicita��o � criada a partir do modelo de outra solicita��o.</li>
				</ul>
				<li>Chamados excluidos ir�o para lista de Excluidos, n�o s�o deletados do banco.</li>
				<li>Lista de chamados exclu�dos.</li>
				<li>Lista de chamads atualizados no dia</li>
				<li>C�pia r�pida de solicitante para usu�rio afetado.</li>
				<li>Exibi��o da data de modifica��o da solicita��o.</li>
				<li>Logs de solicita��o abrem em nova janela.</li>
				<li>Novas funcionalidades para inclus�o de checklists e procedimentos.
					<ul>
						<li>Inclus�o de checklists padr�es.</li>
						<li>Inclis�o de checklists personalizados por cliente.</li>
						<li>Inclus�o de procedimentos separados por tarefas.</li>
						<li>Vers�o impressa de checklist.</li>
					</ul>
				</li>
			</ul>
			<legend>Vers�o 1.6</legend>
			<ul>
				<li>Auto preenchimento ao solicitante e usu�rio afetado ao selecionar o cliente.</li>
				<li>Auto preenchimento de email de destinat�rio ao selecionar o cliente.</li>
				<li>Cria��o, edi��o e exclus�o de colaboraderes para os clientes.</li>
				<li>Classifica��o de solicita��o pelo cliente ap�s finaliza��o</li>
				<li>Link de acompanhamento de protocolo na pagina de edi��o de chamado.</li>
			</ul>
			<legend></legend>
		</div>
		<br />
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</html>