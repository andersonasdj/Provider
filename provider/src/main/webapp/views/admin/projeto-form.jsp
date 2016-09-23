<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<title>ProviderOne | Formulario de Computador</title>
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="salvarProjeto" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Criação de Projeto</legend>
			
			<div class="control-group">
				<label class="control-label">Projeto para o Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeCliente"
						name="nomeCliente">
						<option></option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Título do Projeto</label>
				<div class="controls">
					<input id="tituloProjeto" name="tituloProjeto" type="text" placeholder="Nome do Projeto"
						class="input-xlarge">
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Responsável do Projeto</label>
				<div class="controls">
					<select class="selectpicker" id="nomeResponsavel"
						name="nomeResponsavel">
						<option></option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar</button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar</a>
				</div>
			</div>
			
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>