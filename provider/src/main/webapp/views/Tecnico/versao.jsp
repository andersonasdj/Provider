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
			<legend>Vers�o 1.9.2</legend>
			<ul>
				<li>Alterado o tipo de criptografia	</li>
				<li>Acrescentado 2 d�gitos no c�digo MFA </li>
			</ul>
			<legend>Vers�o 1.9.1</legend>
			<ul>
				<li>Corre��o de carregamento de Json com unicode windows-1252
					<ul>
						<li>Corre��o do charset para carregamento de solicitante.</li>
						<li>Corre��o do charset para carregamento de usu�rio afetado.</li>
						<li>Corre��o do charset para carregamento de cardo de usu�rio</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Vers�o 1.9</legend>
			<ul>
				<li>Inclus�o de Login com MFA
					<ul>
						<li>Inclu�da op��o de adi��o de configura��o de email para envio do c�digo MFA.</li>
						<li>Op��o de ativar ou desativar MFA por usu�rio.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Vers�o 1.8</legend>
			<ul>
				<li>Controle de pause e play em solicita��es em andamento.
					<ul>
						<li>A solicita��o em andamento pode ser pausada, deixando de contabilizar tempo de atendimento.</li>
						<li>Uma solicita��o em estado "Aguardando" somente contabiliza ao voltar para "Em andamento", ser� somado com o tempo gasto antes do "Aguardando".</li>
					</ul>
				</li>
				<li>Op��o de exporta��o de lista de colaboradores de clientes.</li>
			</ul><br/>
			<legend>Vers�o 1.7</legend>
			<ul>
				<li>Associa��o de chamado.
					<ul>
						<li>Um chamado associado outro chamado, somente poder�r ser iniciado ao finalizar o anterior.</li>
					</ul>
				</li>
				<li>Status de "Aguardando usu�rio" foi alterado para "Aguardando."</li>
				<li>Inserido n�vel de prioridade "Cr�tico" para abertura de chamado.</li>
				<li>Limita��es de altera��es de status e t�cino respons�vel.
					<ul>
						<li>O chamado somente poder� ficar sem t�cino no status "Aberto" e "Agendado"</li>
					</ul>
				</li>
				<li>Novos �cones na listagem dos chamados.
					<ul>
						<li>Inserido �cone de criticidade na listagem dos chamados.</li>
						<li>Inserido �cone de cliente vip na listagem dos chamados.</li>
						<li>Inserido �cone de RedFlag na listagem dos chamados.</li>
					</ul>
				</li>
			</ul><br/>
			<legend>Vers�o 1.6</legend>
			<ul>
				<li>Auto preenchimento ao solicitante e usu�rio afetado ao selecionar o cliente.
					<ul>
						<li>Exibi��o do cargo do solicitante.</li>
						<li>Exibi��o do cargo do usu�rio afetado.</li>
					</ul>
				</li>
				<li>Auto preenchimento da lista de e-mails dos destinat�rios ao selecionar o cliente.
					<ul>
						<li>Cadastro do cargo do funcion�rio.</li>
					</ul>
				</li>
				<li>Op��o de informar Red Flag e cliente Vip na edi��o do cliente</li>
				<li>Cria��o, edi��o e exclus�o de colaboraderes para os clientes.</li>
				<li>Classifica��o de solicita��o pelo cliente ap�s finaliza��o</li>
				<li>Link de acompanhamento de protocolo na pagina de edi��o de chamado.</li>
			</ul>
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
			<legend></legend>
		</div>
		<br />
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</html>