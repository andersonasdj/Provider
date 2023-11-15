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
			<legend>Versão 1.9.2</legend>
			<ul>
				<li>Alterado o tipo de criptografia	</li>
				<li>Acrescentado 2 dígitos no código MFA </li>
			</ul>
			<legend>Versão 1.9.1</legend>
			<ul>
				<li>Correção de carregamento de Json com unicode windows-1252
					<ul>
						<li>Correção do charset para carregamento de solicitante.</li>
						<li>Correção do charset para carregamento de usuário afetado.</li>
						<li>Correção do charset para carregamento de cardo de usuário</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.9</legend>
			<ul>
				<li>Inclusão de Login com MFA
					<ul>
						<li>Incluída opção de adição de configuração de email para envio do código MFA.</li>
						<li>Opção de ativar ou desativar MFA por usuário.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.8</legend>
			<ul>
				<li>Controle de pause e play em solicitações em andamento.
					<ul>
						<li>A solicitação em andamento pode ser pausada, deixando de contabilizar tempo de atendimento.</li>
						<li>Uma solicitação em estado "Aguardando" somente contabiliza ao voltar para "Em andamento", será somado com o tempo gasto antes do "Aguardando".</li>
					</ul>
				</li>
				<li>Opção de exportação de lista de colaboradores de clientes.</li>
			</ul><br/>
			<legend>Versão 1.7</legend>
			<ul>
				<li>Associação de chamado.
					<ul>
						<li>Um chamado associado outro chamado, somente poderár ser iniciado ao finalizar o anterior.</li>
					</ul>
				</li>
				<li>Status de "Aguardando usuário" foi alterado para "Aguardando."</li>
				<li>Inserido nível de prioridade "Crítico" para abertura de chamado.</li>
				<li>Limitações de alterações de status e técino responsável.
					<ul>
						<li>O chamado somente poderá ficar sem técino no status "Aberto" e "Agendado"</li>
					</ul>
				</li>
				<li>Novos ícones na listagem dos chamados.
					<ul>
						<li>Inserido ícone de criticidade na listagem dos chamados.</li>
						<li>Inserido ícone de cliente vip na listagem dos chamados.</li>
						<li>Inserido ícone de RedFlag na listagem dos chamados.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Versão 1.6</legend>
			<ul>
				<li>Auto preenchimento ao solicitante e usuário afetado ao selecionar o cliente.
					<ul>
						<li>Exibição do cargo do solicitante.</li>
						<li>Exibição do cargo do usuário afetado.</li>
					</ul>
				</li>
				<li>Auto preenchimento da lista de e-mails dos destinatários ao selecionar o cliente.
					<ul>
						<li>Cadastro do cargo do funcionário.</li>
					</ul>
				</li>
				<li>Opção de informar Red Flag e cliente Vip na edição do cliente</li>
				<li>Criação, edição e exclusão de colaboraderes para os clientes.</li>
				<li>Classificação de solicitação pelo cliente após finalização</li>
				<li>Link de acompanhamento de protocolo na pagina de edição de chamado.</li>
			</ul>
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
						<li>Versão impressa de checklist.</li>
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