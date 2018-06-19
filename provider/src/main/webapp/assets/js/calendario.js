$(function(){

    jQuery('#timepicker').timepicker();
    jQuery('#datepicker').datepicker();

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
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
        dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
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
            timeOnlyTitle: 'Escolha o horario',
            timeText: 'Horario',
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