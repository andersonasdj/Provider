<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Computadores</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br/><br/><br/>
		<legend>Lista de Computadores</legend>
		<h4>Exportar Relatório</h4>
	        <div id="toolbar">
	            <select class="form-control">
	                <option value="">Export Basic</option>
	                <option value="all">Export All</option>
	                <option value="selected">Export Selected</option>
	            </select>
	        </div>
		<table id="table"
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-show-refresh="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
	        <thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th data-field="funcao" data-sortable="true">Função</th>
				<th data-field="nomeComputador" data-sortable="true">Nome do Computador</th>
				<th data-field="nomeUsuario" data-sortable="true">Nome do Usuário</th>
				<th data-field="software" data-sortable="true">Software</th>
				<th data-field="marca" data-sortable="true">Marca</th>
				<th data-field="processador" data-sortable="true">Processador</th>
				<th data-field="memoria" data-sortable="true">Memória</th>
				<th>Funções</th>
			</tr>
			</thead>
			<c:forEach var="computador" items="${computadores}">
				<tr>
					<td data-field="state" data-checkbox="true"></td>
					<td>${computador.cliente.nome}</td>
					<td>${computador.funcao}</td>
					<td>${computador.nomeComputador}</td>
					<td>${computador.nomeDoUsuario}</td>
					<td>
						<a class="dcontexto"> ${computador.sistemaOperacionalInstalado}
							<span>Windows Licenciado:  ${computador.sistemaOperacionalLicenciado}<br/><br/>
								Office Instalado: ${computador.officeInstalado} <br/> <br/>
								Office Licenciado: ${computador.officeLicenciado}</span></a>
					</td>
					<td>
						<a class="dcontexto"> ${computador.marca}
							<span>Service Tag: ${computador.serviceTag}</span></a>
					</td>
					<td>
						<a class="dcontexto">${computador.modeloProcessador}
							<span>Família: ${computador.familia} <br/>
								Tipo: ${computador.tipoProcessador} <br/>
								Freqência: ${computador.frequenciaProcessador}
							</span></a>
					</td>
					<td>${computador.qtdMemoria}</td>
					<td><a href="computadorEdit?id=${computador.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> <!-- <a
						href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/><br/><br/><br/>
	<legend></legend>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script src="assets/js/ga.js"></script>
	<script type="text/javascript">
        // Este evendo é acionado após o carregamento da página
        jQuery(window).load(function() {
            //Após a leitura da pagina o evento fadeOut do loader é acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
            jQuery("#loader").delay(10).fadeOut("slow");
        });
    </script>
</html>