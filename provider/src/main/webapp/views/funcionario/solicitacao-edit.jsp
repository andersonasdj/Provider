<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">	
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
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
                nextText: 'Próximo&#x3E;',
                currentText: 'Hoje',
                monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho',
                'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
                'Jul','Ago','Set','Out','Nov','Dez'],
                dayNames: ['Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'],
                dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'],
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
                    timeOnlyTitle: 'Escolha o horÃ¡rio',
                    timeText: 'HorÃ¡rio',
                    hourText: 'Hora',
                    minuteText: 'Minutos',
                    secondText: 'Segundos',
                    millisecText: 'Milissegundos',
                    microsecText: 'Microssegundos',
                    timezoneText: 'Fuso horÃ¡rio',
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
	<title>ProviderOne | Solicitações</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br />
	<form action="atualizarSolicitacaoFuncionario" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Classificação de solicitação</legend>
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
			<div>
				<div>
					<input id="nomeDoFuncionario" name="nomeDoFuncionario" type="hidden"
						value="${solicitacao.funcionario.nome}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="text"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.dataAbertura.time}"  />" 
						disabled="disabled"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Hora Abertura</label>
				<div class="controls">
					<input id="dataAbertura" name="dataAbertura" type="text"
						value="<f:formatDate pattern="HH:mm" value="${solicitacao.dataAbertura.time}"/>"
						disabled="disabled"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Usuario</label>
				<div class="controls">
					<input id="usuario" name="usuario" type="text"
						value="${solicitacao.usuario}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Descrição do problema</label>
				<div class="controls">
					<input id="descricaoProblema" name="descricaoProblema" type="text"
						value="${solicitacao.descricaoProblema}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Resolução do Problema</label>
				<div class="controls">
					<input id="resolucao" name="resolucao" type="text"
						value="${solicitacao.resolucao}" onkeyup="limite_textarea_resolu(this.value)" class="input-xlarge">
						<span id="contResolu">255</span> Restantes <br>
				</div>
			</div>
			<c:if test="${not empty solicitacao.obs}">
				<div class="control-group">
					<label class="control-label">Observações</label>
					<div class="controls">
						<input id="obs" name="obs" type="text"
							value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge">
							<span id="contObs">255</span> Restantes <br>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">Observações 2</label>
					<div class="controls">
						<input id="obs2" name="obs2" type="text"
							value="${solicitacao.obs2}" class="input-xlarge">
					</div>
				</div>
			</c:if>
			<c:if test="${empty solicitacao.obs}">
				<div class="control-group">
					<label class="control-label">Observações</label>
					<div class="controls">
						<input id="obs" name="obs" type="text"
							value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge">
							<span id="contObs">255</span> Restantes <br>
					</div>
				</div>
			</c:if>
			
			<div class="control-group">
				<label class="control-label">Data de Agendamento</label>
				<div class="controls">
					<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
				</div>
			</div>	
			<div class="control-group">
				<label class="control-label">Hora de Agendamento</label>
				<div class="controls">
					<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
						value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" /> <i class="fa fa-clock-o fa-lg"> </i>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>${solicitacao.status}</option>
						<option>Finalizar</option>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<c:if test="${solicitacao.status != 'Em andamento'}">
								<c:if test="${solicitacao.status != 'Aguardando usuario'}">
									<c:if test="${solicitacao.status != 'Agendado'}">
										<option>Agendado</option>
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<c:if test="${solicitacao.status != 'Agendado'}">
								<c:if test="${solicitacao.status != 'Aguardando usuario'}">
									<c:if test="${solicitacao.status != 'Aberto'}">
										<option>Aberto</option>
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${solicitacao.status != 'Aguardando usuario'}">
							<option>Aguardando usuario</option>
						</c:if>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="solicitacoesTecnico" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>