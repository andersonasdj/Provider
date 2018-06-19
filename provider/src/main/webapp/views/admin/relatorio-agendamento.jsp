<%@page import="java.util.Calendar"%>
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
<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br />
	<br />
	<br />
	<form action="gerarRelatorioAgendamento" method="post" class="form-horizontal container">
		<fieldset></fieldset>
			<legend>Relatório de Agendamento</legend>
				<div class="control-group">
					<label class="control-label">Data de Agendamento</label>
					<div class="controls">
						<input id="datepicker" name="data" type="text" placeholder="Data" maxlength="10" /> <i class="fa fa-calendar fa-lg"> </i>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<button id="buscar" class="btn btn-success">
							Gerar <i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				</form>
				<br />
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
<script>
$(function(){

    jQuery('#timepicker').timepicker();
    jQuery('#datepickert').datepicker();

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