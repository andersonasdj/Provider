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
	<form action="atualizarSolicitacao" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Classificação de solicitação 
			<a  onClick="history.go(-1)" ><i class="fa fa-reply-all" aria-hidden="true"></i></a>
			<span class="pull-right">
				<h6>
					<a href="${email}/provider/verProtocolo?id=${solicitacao.id}&senha=${solicitacao.senha}">
						Modificado em: <f:formatDate pattern="dd-MM-yyyy HH:mm" value="${solicitacao.dataAtualizacao.time}"  />
					</a>
				</h6>
			</span>
				<c:if test="${solicitacao.status == 'Finalizado'}"> 
					<a class="btn" href="solicitacaoEditFull?id=${solicitacao.id}" role="button"> Edição Completa</a>
				</c:if>
			</legend>
			<input id="solicitacao" name="id" type="hidden" value="${solicitacao.id}">
			<input id="cliente" name="cliente.id" type="hidden" value="${solicitacao.cliente.id}">
			<input type="hidden" id="abriuChamado" name="abriuChamado" value="${solicitacao.abriuChamado}"> 
			<input type="hidden" id="funcionarioLogado" name="funcionarioLogado" value="${funcionarioLogado.nome}">
			<div class="control-group">
				<label class="control-label">Data Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.dataAbertura.time}"  />"
						disabled="disabled">
					<a class="btn" href="dataEditSolicitacao?id=${solicitacao.id}" role="button"> Editar</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Hora Abertura</label>
				<div class="controls">
					<input  type="text" placeholder="<f:formatDate pattern="HH:mm" value="${solicitacao.dataAbertura.time}"/>" 
						disabled="disabled" />
				</div>
			</div>
		

		<c:if test="${solicitacao.cliente.nome != null}">
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente" disabled="disabled">
						<option>${solicitacao.cliente.nome}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
					<span id="flag" style="font-size: 20px ;color:red ; font-weight:bold"></span>
					<span id="vip" style="font-size: 18px ;color:#04B404 ; font-weight:bold"></span>
				</div>
			</div>
		</c:if>
		<c:if test="${solicitacao.cliente.nome == null}">
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option>${solicitacao.cliente.nome}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</c:if>

			<div class="control-group">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input id="senha" name="senha" type="text" value="${solicitacao.senha}" class="input-xlarge" disabled="disabled">
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
	                	<option>
	                		${solicitacao.solicitante}
	                	</option>
	                </select>
	                <span id="cargoSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	                <span id="celularSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	            </div>
        	</div>
        	<br/>
        	<div class="form-group">
				<label class="control-label">Usuário Afetado</label>
	            <div class="controls">
	                <select class="form-control usuario" name="usuario" id="usuario">
	                	<option>
	                		${solicitacao.usuario}
	                	</option>
	                </select>
	                <span id="cargoUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	                <span id="celularUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	            </div>
        	</div>
			<br/>
			<div class="control-group">
				<label class="control-label">Descrição do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" 
					placeholder="Descrição do Problema" onkeyup="limite_textarea_prob(this.value)"
						class="input-xlarge">${solicitacao.descricaoProblema}</textarea>
					<span id="contProb">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Resolução do problema</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="resolucao" name="resolucao" type="text" 
					placeholder="Resolução do Problema" onkeyup="limite_textarea_resolu(this.value)"
						class="input-xlarge">${solicitacao.resolucao}</textarea>
					<span id="contResolu">255</span> Restantes <br>
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
					<span>Crítico - 2 Horas. <br> Alta - 4 Horas. <br> Média - 24 Horas. <br> Baixa - 48 Horas. <br> Planejada - Evento Planejado.</span>
				</a></label> 
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
						<option>${solicitacao.prioridade}</option>
						<option></option>
						<option>Crítico</option>
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
				<label class="control-label">Técino Responsável</label>
				<div class="controls">
					<select class="selectpicker alertaFuncionario" id="nomeDoFuncionario"
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
					<select class="selectpicker alertaFuncionario" id="status"
						name="status">
						<option>${solicitacao.status}</option>
						<c:if test="${solicitacao.status != 'Agendado'}">
							<option>Agendado</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Aberto</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Em andamento'}">
							<option>Em andamento</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aguardando'}">
							<option>Aguardando</option>
						</c:if>
						<c:if test="${solicitacao.status != 'Aberto'}">
							<option>Finalizar</option>
						</c:if>
					</select>
				<!--  <button id="bntPlay" name="bntPlay" class="btn btn-dark"> <i class="fa fa-play" aria-hidden="true"></i></button> -->
				
				<span id="divPlay">
					<a href="javascript:func()" id="bntPlay"> <i class="fa fa-play fa-lg" aria-hidden="true"> </i></a>
				</span>
				<span id="divPause">
					<a href="javascript:func()" id="bntPause"> <i class="fa fa-pause fa-lg" aria-hidden="true"> </i></a>
				</span>
				
				</div>
			</div>
			
			<input type="hidden" name="play" id="play" value="${solicitacao.play}">
			
			<c:if test="${solicitacao.idChamadoLigacao != null}">
				<div class="form-group">
					<label class="control-label">Associado ao Id: ${solicitacao.idChamadoLigacao} </label>
		            <div class="controls">
		            	<input type="hidden" id="buscaId" value="${solicitacao.idChamadoLigacao}">
						<span id="statusId" style="font-size: 15px ;color:#0101DF ; font-weight:bold"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
		            </div>
	        	</div>
        	</c:if>
        	<c:if test="${solicitacao.idChamadoLigacao == null}">
	        	<div class="form-check">
				    <label class="form-check-label">
				    	Associar chamado a
				      <input id="boxIdChamado" name="boxIdChamado" type="checkbox" class="form-check-input">
				    </label>
				    <div class="form-group" id="enviaEmail">
						<label class="control-label">ID do Chamado</label>
			            <div class="controls">
			            	<div id="idChamado" style="display: none">
			             	   	<input class="form-control" name="idChamadoLigacao" id="idChamadoLigacao" />
			                	<a href="javascript:func()" id="buscaId"><i class="fa fa-refresh fa-lg" aria-hidden="true"></i></a>
			                	<span id="statusId" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
			                </div>
			            </div>
	        		</div>
	        		<br/>
				</div>
        	</c:if>
        	<br/><br/>
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
	<script src="assets/js/controla-calendario-agendamento.js"></script>
	<script src="assets/js/controla-campos-texto.js"></script>
	
	<script>
   		var divCliente = $(".alertaFuncionario");
   		divCliente.on("change", function(){
   			var funcionario = $("#nomeDoFuncionario").val();
   			var status = $("#status").val();
   			if(funcionario == "" && status == 'Agendado'){
   				if(confirm("Deseja agendar sem selecionar um tecnico?")){
   					$('#enviar').attr('disabled',false);
   				} else{
	   				$('#enviar').attr('disabled','disabled');
   				}
   			}else if(funcionario == "" && status == 'Em andamento'){
   				alert("Você não pode iniciar um chamado sem um técnico!");
   				$('#enviar').attr('disabled','disabled');
   			}else if(funcionario == "" && status == 'Aguardando'){
   				alert("Você não pode deixar um chamado aguardano sem um técnico!");
   				$('#enviar').attr('disabled','disabled');
   			} else{
   				$('#enviar').attr('disabled',false);
   			}
   		}); 
	</script>
	<script>
		var divEmail = $("#boxIdChamado");
		var email = $("#idChamadoLigacao").val();
		divEmail.on("change", function(){
			var email = $("#idChamadoLigacao").val();
				$("#idChamado").stop().slideToggle(500);
				document.getElementById('idChamado').style.display = 'block';
		} );
	</script>
	<script>
		var divStatus = $("#status");
		var status = $("#status").val();
		divStatus.on("change", function(){
			var status =$("#status").val();
			if(status != 'Em andamento'){
				$('#divPause').hide();
				$('#divPlay').hide();
				$('#play').attr('value', false);
			}else{
				var play = $("#play").val();
				if(play == 'true'){
					$('#divPause').hide();
					$('#divPlay').show();
					
				} else{
					
					$('#divPlay').hide();
					$('#divPause').show();
					$('#play').attr('value', true);
					
				}
			}
		} );
	</script>
	<script>
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
	</script>
	<script>
    	$(document).ready(function () {
    		var divPause = $("#bntPause");
    		var divPlay = $("#bntPlay");
    		divPause.on("click", function(){
	    		alert("Seu atendimento será pausado!");
	    		$('#play').attr('value', false);
				$('#divPlay').show();
				$('#divPause').hide();
				//$('#enviar').attr('disabled','disabled');
    		}); 
    		divPlay.on("click", function(){
	    		alert("Seu atendimento será retomado!");
	    		$('#play').attr('value', true);
				$('#divPlay').hide();
				$('#divPause').show();
				$('#enviar').attr('disabled',false);
    		}); 
    	});
	</script>
	
	<script>
		window.onload = function() {
    		var divCliente = $("#nomeDoCliente");
    		var json = {"nomeCliente" : $("#nomeDoCliente").val()};
	        $.ajax({
	            url: "/provider/listarColaboradoresForm",
	            type: "GET",
	            data: json,
	            success: function (object) {
	                if (object != null) {
	                    $.each(object, function (i, item) {
	                    	 $('.usuario').append('<option value="' + item + '" slected="selected">' + item + '</option>');
	                    });
		                    ;$('.usuario').append('<option value="ProviderOne" slected="selected">ProviderOne</option>');
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
	        $.ajax({
	            url: "/provider/getCargo",
	            type: "GET",
	            data: {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()},
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
	        $.ajax({
	            url: "/provider/getCargo",
	            type: "GET",
	            data: {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()},
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
	        $.ajax({
	            url: "/provider/getCel",
	            type: "GET",
	            data: {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()},
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
	        
	        if($("#nomeDoCliente").val() != "" ){
	        $.ajax({
	            url: "/provider/getFlag",
	            type: "GET",
	            data: {"nomeCliente" : divCliente.val()},
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
	            data: {"nomeCliente" : divCliente.val()},
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
	        }
	        
	        var idLigacao = $("#buscaId").val();
	    	var jsonId = {"idLigacao" : idLigacao};
	    	var link = "<a href='solicitacaoEdit?id="+idLigacao+"'><i class='fa fa-pencil-square-o fa-lg'></i></a>";
	        $.ajax({
		            url: "/provider/getIdLigacao",
		            type: "GET",
		            data: jsonId,
		            success: function (object) {
		            	if (object) {
		                    document.getElementById("statusId").innerHTML=""; 
		                    $('#statusId').append(object+ "  " +link);
		                    if(object != "Finalizado"){
		                    	$('#enviar').attr('disabled','disabled');
		                    }
		                }else{
		                	$('#idLigacao').attr('disabled',false);
		                	document.getElementById("statusId").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
			})
			
			var divStatus = $("#status").val();
			if(divStatus == 'Aberto'){
				$('#play').attr('value', false);
				$('#divPause').hide();
				$('#divPlay').hide();
			} 
			else if(divStatus == 'Agendado'){
				$('#divPause').hide();
				$('#divPlay').hide();
				$('#play').attr('value', false);
			} 
			else if(divStatus == 'Aguardando'){
				$('#divPause').hide();
				$('#divPlay').hide();
				$('#play').attr('value', false);
			}
			else if(divStatus == 'Em andamento'){
				var btPlay = $("#play").val();
				if(btPlay == 'true'){
					$('#play').attr('value', true);
					$('#divPause').show();
					$('#divPlay').hide();
				}else{
					$('#play').attr('value', false);
					$('#divPlay').show();
					$('#divPause').hide();
					$('#enviar').attr('disabled','disabled');
				}
			}
    	};
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
	</script>
	<script>
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
	</script>
</html>