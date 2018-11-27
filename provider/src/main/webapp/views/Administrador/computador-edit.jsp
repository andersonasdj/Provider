<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<br /><br /><br /><br />
	<form action="atualizarComputador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Atualização de Computador</legend>
			<a href="computadorForm"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
			<p class="pull-right">
				<a href="computadorList"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<br/><br/>
			<div>
				<div>
					<input id="id" name="id" type="hidden"
						value="${computador.id}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Ultima Atualização</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="dd-MM-yyyy" value="${computador.dataAtualizacao.time}"  />"
						disabled="disabled">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<input id="nomeCliente" name="nomeCliente" type="text"
						value="${computador.cliente.nome}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Função</label>
				<div class="controls">
					<input id="funcao" name="funcao" type="text"
						value="${computador.funcao}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Computador</label>
				<div class="controls">
					<input id="nomeComputador" name="nomeComputador" type="text" placeholder="Nome do Computador"
						value="${computador.nomeComputador}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Usuário</label>
				<div class="controls">
					<input id="nomeDoUsuario" name="nomeDoUsuario" type="text" placeholder="Nome do Usuario"
						value="${computador.nomeDoUsuario}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Marca</label>
				<div class="controls">
					<select class="selectpicker" id="marca"
						name="marca">
						<option>${computador.marca}</option>
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
						<option>${computador.modeloProcessador}</option>
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
						<option>${computador.familia}</option>
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
						<option>${computador.tipoProcessador}</option>
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
						value="${computador.frequenciaProcessador}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Memória</label>
				<div class="controls">
					<select class="selectpicker" id="qtdMemoria"
						name="qtdMemoria">
						<option>${computador.qtdMemoria}</option>
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
						<option>${computador.qtdHd}</option>
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
						<option>${computador.sistemaOperacionalInstalado}</option>
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
						<option>${computador.officeInstalado}</option>
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
						<option>${computador.sistemaOperacionalLicenciado}</option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.sistemaOperacionalInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Serial Sistema Operacional</label>
				<div class="controls">
					<input id="serialWindows" name="serialWindows" type="text" placeholder="Serial do Windows"
						value="${computador.serialWindows}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Office Licenciado</label>
				<div class="controls">
					<select class="selectpicker" id="officeLicenciado"
						name="officeLicenciado">
						<option>${computador.officeLicenciado}</option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.officeInstalado}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Serial Office</label>
				<div class="controls">
					<input id="serialOffice" name="serialOffice" type="text" placeholder="Serial do Office"
						value="${computador.serialOffice}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Anti Vírus</label>
				<div class="controls">
					<select class="selectpicker" id="antiVirus"
						name="antiVirus">
						<option>${computador.antiVirus}</option>
						<c:forEach var="periferico" items="${perifericos}">
							<option>${periferico.antiVirus}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de expiração do Anti Vírus</label>
				<div class="controls">
					<input id="datepicker" name="expiracaoAV" type="text" placeholder="Expiração Anti Vírus" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${computador.expiracaoAV.time}" />" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Service Tag</label>
				<div class="controls">
					<input id="serviceTag" name="serviceTag" type="text" placeholder="Service Tag"
						value="${computador.serviceTag}" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<input id="obs" name="obs" type="text" placeholder="Observações"
						value="${computador.obs}" class="input-xlarge">
				</div>
			</div>			
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>${computador.status}</option>
						<option>Ativo</option>
						<option>Vago</option>
						<option>Defeito</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="computadorList" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
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
	<script>
        $(function(){

            jQuery('#timepicker').timepicker();
            jQuery('#datepicker').datepicker();

            (function( factory ) {
                if ( typeof define === "function" && define.amd ) {
                    define([ "../datepicker" ], factory );
                } else {
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
</html>