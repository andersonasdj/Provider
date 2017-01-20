//<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

google.charts.load('upcoming', {'packages': ['map']});
google.charts.setOnLoadCallback(montaMapaClientes);
var dados = buscaCoordenadasClientes();

console.log("teste: " + dados);

function buscaCoordenadasClientes(){
	var trsClientes = $(".clientesTr");
	var qtdClientes = trsClientes.length-1;
	var linhas = $(".clientesTr");
	
	var clientes = [];
	
	linhas.each(function(){
		var nome = $(this).find("td:nth-child(2)").text();
		var latitude = $(this).find("td:nth-child(5)").find("#idLatitude").text();
		var longitude = $(this).find("td:nth-child(5)").find("#idLongitude").text();
		
		var cliente = {
				latitude: latitude,
				longitude: longitude,
				nome: nome
		};
		
		clientes.push(cliente);
		
		console.log(cliente.nome);
		console.log(cliente.latitude);
		console.log(cliente.longitude);
		console.log("");
		
	});
	console.log(clientes.length);
	
	var dados = {
		clientes: clientes	
	};
	return clientes;
}

function montaMapaClientes() {
	
	var data = google.visualization.arrayToDataTable([
			['Lat', 'Long', 'Name'],
			[-22.908231, -43.176987, 'ProviderOne'],
		   	[-22.906939, -43.176609, 'Tocantins Advogados'],
		    [-22.906840, -43.176845, 'Fux Advogados'],
		    [-22.904658, -43.177834, 'Hugo Silva'],
		    [-22.906205, -43.173775, 'Barreto Advogados'],
		    [-22.982595, -43.217943, 'Freitas Leite'],
		    [-22.983711, -43.218263, 'Terrinha / Tenorio'],
		    [-22.984527, -43.199266, 'CP4'],
		    [-22.956690, -43.176285, 'MD / OFADV'],
		    [-22.897486, -43.180468, 'Biar Advogados'],
		    [-22.985874, -43.227407, 'Couto Silva'],
		    [-22.965299, -43.227457, 'Varella Advogados']		    		    	    		    	    
		]);

	var opcoes = {
		showTooltip : true,
		showInfoWindow: true,
		useMapTypeControl: true

	};

	var map = new google.visualization.Map(document.getElementById('div_mapa'));

	map.draw(data, opcoes);
	

};