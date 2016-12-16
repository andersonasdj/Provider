google.load('visualization', '1', {'packages' : ['corechart']});
google.setOnLoadCallback(desenhaGraficoPizza);

function desenhaGraficoPizza() {	
	
	if(document.getElementById("aberto").textContent != null){
		var aberto = document.getElementById("aberto").value;		
	} else{
		var aberto = 0;
	}
	
	if(document.getElementById("agendado") != null){
		var agendado = document.getElementById("agendado").value;			
	} else{
		var agendado = 0;
	}
	
	if(document.getElementById("aguardando") != null){
		var aguardando = document.getElementById("aguardando").value;			
	} else{
		var aguardando = 0;
	}
	
	if(document.getElementById("andamento") != null){
		var andamento = document.getElementById("andamento").value;		
	} else{
		var andamento = 0;
	}	
	
	console.log(aberto);
	
	var dados = new google.visualization.DataTable();

	dados.addColumn('string', 'Tipo');
	dados.addColumn('number', 'Valor');

	dados.addRows(4);

	dados.setValue(0,0,'Em andamento');
	dados.setValue(0,1,andamento);

	dados.setValue(1,0,'Aberto');
	dados.setValue(1,1,aberto);

	dados.setValue(2,0,'Agendado');
	dados.setValue(2,1,agendado);

	dados.setValue(3,0,'Aguardando Usuario');
	dados.setValue(3,1,aguardando);

	var div = document.getElementById('grafico');
	var grafico = new google.visualization.PieChart(div);

	grafico.draw(dados, {
		width: 680, 
		height: 280, 
		is3D: true		
		});

	/*google.visualization.events.addListener(grafico, 'select', avisaDoClique);  

	function avisaDoClique(event)  {
	  	var selecionados = grafico.getSelection();
	    var escolhido = selecionados[0].row;
	    var tipoDeGasto = dados.getFormattedValue(escolhido, 0);
	    var valorGasto = dados.getFormattedValue(escolhido, 1);
	    document.getElementById('msg').innerHTML = tipoDeGasto + ": " + valorGasto + "<br>";
	}
	*/		
}