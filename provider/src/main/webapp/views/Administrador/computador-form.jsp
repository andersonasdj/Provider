<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Formulario de Computador</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="salvarComputador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Cadastro de Máquina</legend>
			<p class="pull-right">
				<a href="computadorList"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
			<br/><br/>
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
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Função</label>
				<div class="controls">
					<select class="selectpicker" id="funcao"
						name="funcao">
						<option>Estação</option>
						<option>Notebook</option>
						<option>Servidor</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Computador</label>
				<div class="controls">
					<input id="nomeComputador" name="nomeComputador" type="text" placeholder="Nome do Computador"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Nome do Usuário</label>
				<div class="controls">
					<input id="nomeDoUsuario" name="nomeDoUsuario" type="text" placeholder="Nome do Usuario"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Marca</label>
				<div class="controls">
					<select class="selectpicker" id="marca"
						name="marca">
						<option></option>
						<option>Dell</option>
						<option>Lenovo</option>
						<option>HP</option>
						<option>Sony</option>
						<option>Samsumg</option>
						<option>Asus</option>
						<option>Toshiba</option>
						<option>IBM</option>
						<option>VMWare</option>
						<option>Generico</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Modelo do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="modeloProcessador"
						name="modeloProcessador">
						<option></option>
						<option>Intel</option>
						<option>AMD</option>
						<option>Atom</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Família do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="familia"
						name="familia">
						<option></option>
						<option>Core</option>
						<option>Xeon</option>
						<option>Pentium</option>
						<option>Semprom</option>
						<option>Athlon</option>
						<option>Celeron</option>
						<option>Phenom ii</option>
						<option>A8</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tipo do Processador</label>
				<div class="controls">
					<select class="selectpicker" id="tipoProcessador"
						name="tipoProcessador">
						<option></option>
						<option>4</option>
						<option>i3</option>
						<option>i5</option>
						<option>i7</option>
						<option>E5506</option>
						<option>E3-1220</option>
						<option>E5-2420</option>
						<option>G6950</option>
						<option>2 Duo</option>
						<option>2 Quad</option>
						<option>Dual Core</option>
						<option>Dual</option>
						<option>X2</option>
						<option>N850</option>
						<option>3500M</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Frequencia do Processador</label>
				<div class="controls">
					<input id="frequenciaProcessador" name="frequenciaProcessador" placeholder="Frequencia do Processador" type="Text" size="3" onKeyUp="mascaraFrequencia(this, event)" class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Memória</label>
				<div class="controls">
					<select class="selectpicker" id="qtdMemoria"
						name="qtdMemoria">
						<option></option>
						<option>1024</option>
						<option>2048</option>
						<option>3072</option>
						<option>4096</option>
						<option>6144</option>
						<option>8192</option>
						<option>12288</option>
						<option>16388</option>
						<option>32776</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Tamanho do HD</label>
				<div class="controls">
					<select class="selectpicker" id="qtdHd"
						name="qtdHd">
						<option></option>
						<option>80</option>
						<option>120</option>
						<option>240</option>
						<option>320</option>
						<option>480</option>
						<option>500</option>
						<option>700</option>
						<option>1000</option>
						<option>1500</option>
						<option>2000</option>
						<option>4000</option>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">SSD</label>
				<div class="controls">
			      <input id="ssd" name="ssd" type="checkbox" class="form-check-input">
				</div>	
			</div>
			
			<div class="control-group">
				<label class="control-label">Sistema Operacional</label>
				<div class="controls">
					<select class="selectpicker" id="sistemaOperacionalInstalado"
						name="sistemaOperacionalInstalado">
						<option></option>
						<option>Windows XP Professional</option>
						<option>Windows Vista Business</option>
						<option>Windows Vista Home (x64)</option>
						<option>Windows 7 Home (x86)</option>
						<option>Windows 7 Home (x64)</option>
						<option>Windows 7 Professional (x86)</option>
						<option>Windows 7 Professional (x64)</option>
						<option>Windows 7 Ultimate (x64)</option>
						<option>Windows 8 Home (x86)</option>
						<option>Windows 8 Home (x64)</option>
						<option>Windows 8 Professional (x64)</option>
						<option>Windows 8.1 Home (x86)</option>
						<option>Windows 8.1 Home (x64)</option>
						<option>Windows 8.1 Professional (x86)</option>
						<option>Windows 8.1 Professional (x64)</option>
						<option>Windows 10 Single Language (x64)</option>
						<option>Windows 10 Professional (x64)</option>
						<option>Windows 10 Enterprise (x64)</option>
						<option>Windows Server 2003 Standard Edition (x64)</option>
						<option>Windows Server 2008 Essentials (x64)</option>
						<option>Windows Server 2008 Standard (x64)</option>
						<option>Windows Server 2008 R2 Standard (x64)</option>
						<option>Windows Server 2012 Foundation (x64)</option>
						<option>Windows Server 2012 Essentials (x64)</option>
						<option>Windows Server 2012 Standard (x64)</option>
						<option>Windows Server 2012 R2 Standard (x64)</option>
						<option>Windows Server 2012 Datacenter (x64)</option>
						<option>Windows Server 2016 Essentials (x64)</option>
						<option>Windows Server 2016 Standard (x64)</option>
						<option>Windows Server 2016 R2 Standard (x64)</option>
						<option>Windows Server 2016 Datacenter (x64)</option>
						<option>Windows Server 2019 Essentials (x64)</option>
						<option>Windows Server 2019 Standard (x64)</option>
						<option>Windows Server 2019 Datacenter (x64)</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Office Instalado</label>
				<div class="controls">
					<select class="selectpicker" id="officeInstalado"
						name="officeInstalado">
						<option></option>
						<option>Microsoft Office 2007 Home and Bussiness</option>
						<option>Microsoft Office 2007 Enterprise</option>
						<option>Microsoft Office 2007 Small Business</option>
						<option>Microsoft Office 2007 ProPlus</option>
						<option>Microsoft Office 2010 Starter</option>
						<option>Microsoft Office 2010 Home and Bussiness</option>
						<option>Microsoft Office 2010 Professional</option>
						<option>Microsoft Office 2010 ProPlus</option>
						<option>Microsoft Office 2013 Home and Student</option>
						<option>Microsoft Office 2013 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2013</option>
						<option>Microsoft Office 2016 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2016</option>
						<option>Microsoft Office 2019 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2019</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Sistema Operacional Licenciado</label>
				<div class="controls">
					<select class="selectpicker" id="sistemaOperacionalLicenciado"
						name="sistemaOperacionalLicenciado">
						<option></option>
						<option>Windows XP Professional</option>
						<option>Windows Vista Business</option>
						<option>Windows Vista Home (x64)</option>
						<option>Windows 7 Home (x86)</option>
						<option>Windows 7 Home (x64)</option>
						<option>Windows 7 Professional (x86)</option>
						<option>Windows 7 Professional (x64)</option>
						<option>Windows 7 Ultimate (x64)</option>
						<option>Windows 8 Home (x86)</option>
						<option>Windows 8 Home (x64)</option>
						<option>Windows 8 Professional (x64)</option>
						<option>Windows 8.1 Home (x86)</option>
						<option>Windows 8.1 Home (x64)</option>
						<option>Windows 8.1 Professional (x86)</option>
						<option>Windows 8.1 Professional (x64)</option>
						<option>Windows 10 Single Language (x64)</option>
						<option>Windows 10 Professional (x64)</option>
						<option>Windows 10 Enterprise (x64)</option>
						<option>Windows Server 2003 Standard Edition (x64)</option>
						<option>Windows Server 2008 Essentials (x64)</option>
						<option>Windows Server 2008 Standard (x64)</option>
						<option>Windows Server 2008 R2 Standard (x64)</option>
						<option>Windows Server 2012 Foundation (x64)</option>
						<option>Windows Server 2012 Essentials (x64)</option>
						<option>Windows Server 2012 Standard (x64)</option>
						<option>Windows Server 2012 R2 Standard (x64)</option>
						<option>Windows Server 2012 Datacenter (x64)</option>
						<option>Windows Server 2016 Essentials (x64)</option>
						<option>Windows Server 2016 Standard (x64)</option>
						<option>Windows Server 2016 R2 Standard (x64)</option>
						<option>Windows Server 2016 Datacenter (x64)</option>
						<option>Windows Server 2019 Essentials (x64)</option>
						<option>Windows Server 2019 Standard (x64)</option>
						<option>Windows Server 2019 Datacenter (x64)</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Serial Sistema Operacional</label>
				<div class="controls">
					<input id="serialWindows" name="serialWindows" type="text" placeholder="Serial do Windows"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Office Licenciado</label>
				<div class="controls">
					<select class="selectpicker" id="officeLicenciado"
						name="officeLicenciado">
						<option></option>
						<option>Microsoft Office 2007 Home and Bussiness</option>
						<option>Microsoft Office 2007 Enterprise</option>
						<option>Microsoft Office 2007 Small Business</option>
						<option>Microsoft Office 2007 ProPlus</option>
						<option>Microsoft Office 2010 Starter</option>
						<option>Microsoft Office 2010 Home and Bussiness</option>
						<option>Microsoft Office 2010 Professional</option>
						<option>Microsoft Office 2010 ProPlus</option>
						<option>Microsoft Office 2013 Home and Student</option>
						<option>Microsoft Office 2013 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2013</option>
						<option>Microsoft Office 2016 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2016</option>
						<option>Microsoft Office 2019 Home and Bussiness</option>
						<option>Microsoft Office 365 Business 2019</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Serial Office</label>
				<div class="controls">
					<input id="serialOffice" name="serialOffice" type="text" placeholder="Serial do Office"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Anti Vírus</label>
				<div class="controls">
					<select class="selectpicker" id="antiVirus"
						name="antiVirus">
						<option></option>
						<option>Panda Security</option>
						<option>Panda 360</option>
						<option>Panda Free</option>
						<option>Trend Micro</option>
						<option>Macfee</option>
						<option>Kaspersky</option>
						<option>Eset</option>
						<option>Avast</option>
						<option>Avira</option>
						<option>AVG</option> 
						<option>Microsoft Essentials</option>
						<option>Bit Defender</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de expiração do Anti Vírus</label>
				<div class="controls">
					<input id="datepicker" name="expiracaoAV" type="text" placeholder="Expiração Anti Vírus" maxlength="10"
						value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.expiracaoAV.time}" />" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Service Tag</label>
				<div class="controls">
					<input id="serviceTag" name="serviceTag" type="text" placeholder="Service Tag"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observações</label>
				<div class="controls">
					<input id="obs" name="obs" type="text" placeholder="Observações"
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker" id="status"
						name="status">
						<option>Ativo</option>
						<option>Vago</option>
						<option>Defeito</option>
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
    <script>
    	String.prototype.reverse = function(){
    	  return this.split('').reverse().join(''); 
    	};
    
	    function mascaraFrequencia(campo,evento){
	    	  var tecla = (!evento) ? window.event.keyCode : evento.which;
	    	  var valor  =  campo.value.replace(/[^\d]+/gi,'').reverse();
	    	  var resultado  = "";
	    	  var mascara = "#.##".reverse();
	    	  for (var x=0, y=0; x<mascara.length && y<valor.length;) {
	    	    if (mascara.charAt(x) != '#') {
	    	      resultado += mascara.charAt(x);
	    	      x++;
	    	    } else {
	    	      resultado += valor.charAt(y);
	    	      y++;
	    	      x++;
	    	    }
	    	  }
	    	  campo.value = resultado.reverse();
	    }
    </script>
</html>