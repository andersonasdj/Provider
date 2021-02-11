$(document).ready(function () {
    		var divCliente = $("#nomeDoCliente");
    		divCliente.on("change", function(){
	    		var nomeCliente = $("#nomeDoCliente").val();
	    		var json = {"nomeCliente" : nomeCliente};
		        $.ajax({
		            url: "/provider/listarColaboradoresForm",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object != null) {
		                    var selectbox = $('.usuario');
		                    selectbox.find('option').remove();
		                    var selectbox = $('.solicitante');
		                    selectbox.find('option').remove();
		                    $('.usuario').append('<option value="" slected="selected"></option>');
		                    $('.solicitante').append('<option value="" slected="selected"></option>');
		                    document.getElementById("cargoUsuario").innerHTML="";
		                    document.getElementById("cargoSolicitante").innerHTML="";
		                    $.each(object, function (i, item) {
		                    	$('.usuario').append('<option value="' + item + '" slected="selected">' + item + '</option>');
		                    });
		                    	$('.usuario').append('<option value="ProviderOne" slected="selected">ProviderOne</option>');
		                    	$('.usuario').append('<option value="Geral" slected="selected">Geral</option>');
		                    $.each(object, function (i, item) {
		                    	$('.solicitante').append('<option value="' + item + '" slected="selected">' + item + '</option>');
		                    });	
		                    	$('.solicitante').append('<option value="ProviderOne" slected="selected">ProviderOne</option>');
		                    	$('.solicitante').append('<option value="Geral" slected="selected">Geral</option>');
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});

$(document).ready(function () {
    		var divCliente = $("#usuario");
    		divCliente.on("change", function(){
	    		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
	    		$.ajax({
		            url: "/provider/getCel",
		            type: "GET",
		            data: {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()},
		            success: function (object) {
		                if (object != null) {
		                    document.getElementById("celularUsuario").innerHTML=""; 
		                    $('#celularUsuario').append(" - Celular: " + object);
		                }else{
		                	document.getElementById("celularUsuario").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});

$(document).ready(function () {
	var divCliente = $("#solicitante");
	divCliente.on("change", function(){
		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
		$.ajax({
            url: "/provider/getCel",
            type: "GET",
            data: {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()},
            success: function (object) {
                if (object != null) {
                    document.getElementById("celularSolicitante").innerHTML=""; 
                    $('#celularSolicitante').append(" - Celular: " + object);
                }else{
                	document.getElementById("celularSolicitante").innerHTML="";
                }
            },
	        erro : function(request, status, error) {},
	        complete : function(data) {}
        })

	}); 
});

$(document).ready(function () {
	var divCliente = $("#usuario");
	divCliente.on("change", function(){
		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
        $.ajax({
            url: "/provider/getCargo",
            type: "GET",
            data: json,
            success: function (object) {
                if (object != null) {
                    document.getElementById("cargoUsuario").innerHTML=""; 
                    $('#cargoUsuario').append(object);
                }else{
                	document.getElementById("cargoUsuario").innerHTML="";
                }
            },
	        erro : function(request, status, error) {},
	        complete : function(data) {}
        })
	}); 
});

$(document).ready(function () {
	var divCliente = $("#solicitante");
	divCliente.on("change", function(){
		var json = {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()};
        $.ajax({
            url: "/provider/getCargo",
            type: "GET",
            data: json,
            success: function (object) {
                if (object != null) {
                    document.getElementById("cargoSolicitante").innerHTML=""; 
                    $('#cargoSolicitante').append(object);
                }else{
                	document.getElementById("cargoSolicitante").innerHTML="";
                }
            },
	        erro : function(request, status, error) {},
	        complete : function(data) {}
        })
	}); 
});

$(document).ready(function () {
	var divCliente = $("#nomeDoCliente");
	
	divCliente.on("change", function(){
		if(divCliente.val() != ''){
    		var json = {"nomeCliente" : divCliente.val()};
	        $.ajax({
	            url: "/provider/getFlag",
	            type: "GET",
	            data: json,
	            success: function (object) {
	                if (object) {
	                    document.getElementById("flag").innerHTML=""; 
	                    $('#flag').append('Red Flag');
	                }else{
	                	document.getElementById("flag").innerHTML="";
	                }
	            },
		        erro : function(request, status, error) {},
		        complete : function(data) {}
	        })
	        $.ajax({
	            url: "/provider/getVip",
	            type: "GET",
	            data: json,
	            success: function (object) {
	                if (object) {
	                    document.getElementById("vip").innerHTML=""; 
	                    $('#vip').append('  Vip');
	                }else{
	                	document.getElementById("vip").innerHTML="";
	                }
	            },
		        erro : function(request, status, error) {},
		        complete : function(data) {}
	        })
        
		}else{
			document.getElementById("flag").innerHTML=""; 
            $('#flag').append('');
            document.getElementById("vip").innerHTML=""; 
            $('#vip').append('');
		}
	}); 
});

$(document).ready(function () {
	var divCliente = $("#nomeDoCliente");
	divCliente.on("change", function(){
		var nomeCliente = $("#nomeDoCliente").val();
		var json = {"nomeCliente" : nomeCliente};
        $.ajax({
            url: "/provider/listarEmails",
            type: "GET",
            data: json,
            success: function (object) {
                if (object != null) {
                    var selectbox = $('.destinatario');
                    selectbox.find('option').remove();
                    $.each(object, function (i, item) {
                    	$('.destinatario').append('<option value="' + item + '" slected="selected">' + item + '</option>');
                    });
                }
            },
	        erro : function(request, status, error) {},
	        complete : function(data) {}
        })
	}); 
});


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

function limite_textarea_prob(valor) {
    quant = 255;
    total = valor.length;
    if(total <= quant) {
        resto = quant - total;
        document.getElementById('contProb').innerHTML = resto;
    } else {
        document.getElementById('descricaoProblema').value = valor.substr(0,quant);
    }
}

var divStatus = $("#status");
var status = $("#status").val();
divStatus.on("change", function(){
	var status = $("#status").val();
	if(status === 'Abrir'){
		document.getElementById('agendamentos').style.display = 'none';
	}else if(status === 'Em andamento'){
		document.getElementById('agendamentos').style.display = 'none';
	}else {
		$("#agendamentos").stop().slideToggle(1000);
	}
} );

var divCliente = $(".alertaFuncionario");
	divCliente.on("change", function(){
		var funcionario = $("#nomeDoFuncionario").val();
		var status = $("#status").val();
		if(funcionario == "" && status == 'Agendar'){
			if(confirm("Deseja agendar sem selecionar um tecnico?")){
				$('#enviar').attr('disabled',false);
			} else{
				$('#enviar').attr('disabled','disabled');
			}
		} else if(funcionario == "" && status == 'Em andamento'){
			alert("Você não pode iniciar um chamado sem um tecnico!");
			$('#enviar').attr('disabled','disabled');
		} else{
			$('#enviar').attr('disabled',false);
		}
	}); 

var divEmail = $("#boxEmail");
var email = $("#destinatario").val();
divEmail.on("change", function(){
	var email = $("#destinatario").val();
		$("#destinatario").stop().slideToggle(500);
		document.getElementById('destinatario').style.display = 'block';
} );

$(document).ready(function () {
	var divCliente = $("#buscaId");
	divCliente.on("click", function(){
		var idLigacao = $("#idChamadoLigacao").val();
		var json = {"idLigacao" : idLigacao};
        $.ajax({
            url: "/provider/getIdLigacao",
            type: "GET",
            data: json,
            success: function (object) {
            	if (object) {
                    document.getElementById("statusId").innerHTML=""; 
                    $('#statusId').append(object);
                }else{
                	document.getElementById("statusId").innerHTML="";
                }
            },
	        erro : function(request, status, error) {},
	        complete : function(data) {}
        })
	}); 
});

var divEmail = $("#boxIdChamado");
var email = $("#idChamadoLigacao").val();
divEmail.on("change", function(){
	var email = $("#idChamadoLigacao").val();
		$("#idChamado").stop().slideToggle(500);
		document.getElementById('idChamado').style.display = 'block';
} );