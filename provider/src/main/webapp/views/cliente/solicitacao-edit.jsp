<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
        $(function(){

            jQuery('#timepicker').timepicker();
            jQuery('#datepicker').datepicker();

            /* Brazilian initialisation for the jQuery UI date picker plugin. */
            /* Written by Leonildo Costa Silva (leocsilva@gmail.com). */
            (function( factory ) {
                if ( typeof define === "function" && define.amd ) {

                    // AMD. Register as an anonymous module.
                    define([ "../datepicker" ], factory );
                } else {

                    // Browser globals
                    factory( jQuery.datepicker );
                }
            }(function( datepicker ) {

            datepicker.regional['pt-BR'] = {
                changeMonth: true,
                changeYear: true,
                closeText: 'Fechar',
                prevText: '&#x3C;Anterior',
                nextText: 'Pr�ximo&#x3E;',
                currentText: 'Hoje',
                monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho',
                'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
                'Jul','Ago','Set','Out','Nov','Dez'],
                dayNames: ['Domingo','Segunda-feira','Ter�a-feira','Quarta-feira','Quinta-feira','Sexta-feira','S�bado'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b'],
                dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b'],
                weekHeader: 'Sm',
                dateFormat: 'dd-mm-yy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''};
            datepicker.setDefaults(datepicker.regional['pt-BR']);

            return datepicker.regional['pt-BR'];

            }));
            /* Brazilian Portuguese translation for the jQuery Timepicker Addon */
            /* Written by Diogo Damiani (diogodamiani@gmail.com) */
            (function ($) {
                $.timepicker.regional['pt-BR'] = {
                    timeOnlyTitle: 'Escolha o horário',
                    timeText: 'Horário',
                    hourText: 'Hora',
                    minuteText: 'Minutos',
                    secondText: 'Segundos',
                    millisecText: 'Milissegundos',
                    microsecText: 'Microssegundos',
                    timezoneText: 'Fuso horário',
                    currentText: 'Agora',
                    closeText: 'Fechar',
                    timeFormat: 'HH:mm',
                    amNames: ['a.m.', 'AM', 'A'],
                    pmNames: ['p.m.', 'PM', 'P'],
                    isRTL: false
                };
                $.timepicker.setDefaults($.timepicker.regional['pt-BR']);
            })(jQuery);
        });
    </script>
   	<title>ProviderOne | Funcionario</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br/><br/>
	<form action="atualizarSolicitacao" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Classifica��o de solicita��o</legend>
			<div>
				<div>
					<input id="solicitacao" name="id" type="hidden"
						value="${solicitacao.id}">
				</div>
			</div>
			<div>
				<div>
					<input id="cliente" name="cliente.id" type="hidden"
						value="${solicitacao.cliente.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.dataAbertura.time}"  />"
						disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Hora Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="HH:mm" value="${solicitacao.dataAbertura.time}"/>" 
						disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Cliente</label>
				<div class="controls">
					<input type="text"
						value="${solicitacao.cliente.nome}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario Afetado</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text"
						value="${solicitacao.usuario}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descri��o do problema</label>
				<div class="controls">
					<input id="descricaoProblema" name="descricaoProblema" type="text"
						value="${solicitacao.descricaoProblema}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Resolu��o do problema</label>
				<div class="controls">
					<input id="resolucao" name="resolucao" type="text"
						value="${solicitacao.resolucao}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observa��es</label>
				<div class="controls">
					<input id="obs" name="obs" type="text"
						value="${solicitacao.obs}" class="input-xlarge" disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema f�sico no equipamento. <br><br> 
						Software - Problema l�gico no equipamento. <br><br> 
						Rede - Problemas de conex�o. <br><br>
						Cabeamento - Servi�os de cabeamento estruturado
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao" disabled="disabled">
						<option>${solicitacao.classificacao}</option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
						<option>Outros</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Classifica��o
					<a class="dcontexto"> (?)
					<span>Problema - Algo que � recorrente <br> Incidente - Algo n�o recorrente <br> Evento - Planejado</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia" disabled="disabled">
						<option>${solicitacao.nivelDeIncidencia}</option>
						<option>Incidente</option>
						<option>Problema</option>
						<option>Evento</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Alta - 2 Horas <br> M�dia - 24 Horas <br> Baixa - 72 Horas <br> Planejada - Evento Plavejado</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade" disabled="disabled">
						<option>${solicitacao.prioridade}</option>
						<option>Alta</option>
						<option>Media</option>
						<option>Baixa</option>
						<option>Planejada</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Onsite / Offsite
					<a class="dcontexto"> (?)
					<span>Onsite - Atendimento no local <br> Offsite - Atendimento remoto</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="onsiteOffisite"
						name="onsiteOffsite" disabled="disabled">
						<option>${solicitacao.onsiteOffsite}</option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de Agendamento</label>
				<div class="controls">
					<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" disabled="disabled"/>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label">Hora de Agendamento</label>
				<div class="controls">
					<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
						value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" disabled="disabled"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Funcion�rio Respons�vel</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario" disabled="disabled">
						<option>${solicitacao.funcionario.nome}</option>
						<c:forEach var="funcionario" items="${funcionario}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
						<option></option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status" disabled="disabled">
						<option>${solicitacao.status}</option>
						<option>Finalizar</option>
						<c:if test="${solicitacao.status != 'Agendado'}">
							<option>Agendado</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Aberto</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>	
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar</a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>