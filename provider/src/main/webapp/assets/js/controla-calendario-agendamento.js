var divStatus = $("#status");
var status = $("#status").val();
if(status === 'Agendado'){
	document.getElementById('agendamentos').style.display = 'block';
}

divStatus.on("change", function(){
	var status = $("#status").val();
	if(status === 'Agendado'){
		//document.getElementById('agendamentos').style.display = 'none';
		$("#agendamentos").stop().slideToggle(1000);
	} else {
		//document.getElementById('agendamentos').style.display = 'block';
		$("#agendamentos").stop().slideUp(1000);
	}
} );