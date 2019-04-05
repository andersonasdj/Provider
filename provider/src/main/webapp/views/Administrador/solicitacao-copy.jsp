<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<br/><br/>
	<form action="salvarSolicitacao" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Classificação de solicitação - Cópia de Solicitação
				<a  onClick="history.go(-1)" ><i class="fa fa-reply-all" aria-hidden="true"></i></a>
			</legend>
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option></option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
					<span id="flag" style="font-size: 20px ;color:red ; font-weight:bold"></span>
					<span id="vip" style="font-size: 18px ;color:#04B404 ; font-weight:bold"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="selectpicker" id="formaAbertura"
						name="formaAbertura">
						<option>${solicitacao.formaAbertura}</option>
						<option></option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">Solicitante</label>
	            <div class="controls">
	                <select class="form-control solicitante" name="solicitante" id="solicitante">
	                	<option></option>
	                	<option>
	                		${solicitacao.solicitante}
	                	</option>
	                </select>
	                <span id="cargoSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	            </div>
        	</div>
        	<br/>
        	<div class="form-group">
				<label class="control-label">Usuário Afetado</label>
	            <div class="controls">
	                <select class="form-control usuario" name="usuario" id="usuario">
	                	<option></option>
	                	<option>
	                		${solicitacao.usuario}
	                	</option>
	                </select>
	                <span id="cargoUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <p class="help-block">* Campo Obrigatório</p>
	            </div>
        	</div>
			<br/>			
			<div class="control-group">
				<label class="control-label">Problema Relatado</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" 
					placeholder="Descrição do Problema" onkeyup="limite_textarea_prob(this.value)"
						class="input-xlarge">${solicitacao.descricaoProblema}</textarea>
					<span id="contProb">255</span> Restantes
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" 
					placeholder="Observações" onkeyup="limite_textarea_obs(this.value)"
						class="input-xlarge">${solicitacao.obs}</textarea>
					<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema físico no equipamento. <br><br> 
						Software - Problema lógico no equipamento. <br><br> 
						Rede - Problemas de conexão. <br><br>
						Cabeamento - Serviços de cabeamento estruturado
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
						<option>${solicitacao.classificacao}</option>
						<option></option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
						<option>Projeto</option>
						<option>Backup</option>
						<option>Outros</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Classificação
					<a class="dcontexto"> (?)
					<span>Problema - Algo que é recorrente <br> Incidente - Algo não recorrente <br> Evento - Planejado</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia">
						<option>${solicitacao.nivelDeIncidencia}</option>
						<option></option>
						<option>Problema</option>
						<option>Incidente</option>
						<option>Solicitação</option>
						<option>Backup</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Alta - 2 Horas <br> Média - 24 Horas <br> Baixa - 72 Horas <br> Planejada - Evento Plavejado</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
						<option>${solicitacao.prioridade}</option>
						<option></option>
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
						name="onsiteOffsite">
						<option>${solicitacao.onsiteOffsite}</option>
						<option></option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			<div id="agendamentos">
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
			</div>
			<div class="control-group">
				<label class="control-label">Funcionário Responsável</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
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
						name="status">
						<option>${solicitacao.status}</option>
						
						<c:if test="${solicitacao.status != 'Agendar'}">
							<option>Agendar</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Abrir'}">
							<option>Abrir</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-check">
			    <label class="form-check-label">
			    	Enviar E-mail na abertura
			      <input id="boxEmail" name="boxEmail" type="checkbox" class="form-check-input">
			    </label>
			    
			    <div class="form-group" id="enviaEmail">
					<label class="control-label">Destinatario</label>
		            <div class="controls">
		                <select class="form-control destinatario" name="destinatario" id="destinatario" style="display: none"></select>
		            </div>
        		</div>
        		<br/>
			    
			    <!-- 
			    <div id="enviaEmail">
					<input id="destinatario" name="destinatario" type="text" placeholder="E-mail do Cliente" class="input-xlarge" style="display: none">
					<p class="help-block"></p>
				</div>
				-->
			</div>
			<br/>
			<input type="hidden" name="abriuChamado" id="abriuChamado" value="${funcionarioLogado.nome}">
			<input type="hidden" id="funcionarioLogado" name="funcionarioLogado" value="${funcionarioLogado.nome}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" onClick="history.go(-1)" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
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
	<script src="assets/js/calendario.js"></script>
	<script src="assets/js/controla-campos-texto.js"></script>
	
	<script>
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
	</script>
	<script>
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
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#nomeDoCliente");
    		divCliente.on("change", function(){
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
    		}); 
    	});
	</script>
	<script>
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
	</script>
	<script>
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
	</script>
	<script>
		function copiaSolicitante(){
			var solicitante = $('#solicitante').val();
			$('#usuario').val(solicitante);
		}
	</script>
	<script>
		var divStatus = $("#status");
		var status = $("#status").val();
		if(status === 'Agendado'){
			document.getElementById('agendamentos').style.display = 'block';
		}
	
		divStatus.on("change", function(){
			var status = $("#status").val();
			if(status === 'Agendar'){
				//document.getElementById('agendamentos').style.display = 'none';
				$("#agendamentos").stop().slideToggle(1000);
			} else {
				//document.getElementById('agendamentos').style.display = 'block';
				$("#agendamentos").stop().slideUp(1000);
			}
		} );
	</script>
	    <script>
		var divEmail = $("#boxEmail");
		var email = $("#destinatario").val();
		divEmail.on("change", function(){
			var email = $("#destinatario").val();
				$("#destinatario").stop().slideToggle(500);
				document.getElementById('destinatario').style.display = 'block';
		} );
	</script>
</html>