<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Relatório</title>
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
			<legend>Versão 1.5</legend>
			<ul>
				<li>Nova opção para copiar uma solicitação.</li>
				<ul>
						<li>Uma nova solicitação é criada a partir do modelo de outra solicitação.</li>
				</ul>
				<li>Chamados excluidos irão para lista de Excluidos, não são deletados do banco.</li>
				<li>Lista de chamados excluídos.</li>
				<li>Lista de chamads atualizados no dia</li>
				<li>Cópia rápida de solicitante para usuário afetado.</li>
				<li>Exibição da data de modificação da solicitação.</li>
				<li>Logs de solicitação abrem em nova janela.</li>
				<li>Novas funcionalidades para inclusão de checklists e procedimentos.
					<ul>
						<li>Inclusão de checklists padrões.</li>
						<li>Inclisão de checklists personalizados por cliente.</li>
						<li>Inclusão de procedimentos separados por tarefas.</li>
					</ul>
				</li>
			</ul>
			<legend></legend>
		</div>
		<br />
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</html>