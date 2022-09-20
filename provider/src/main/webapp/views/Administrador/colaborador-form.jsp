<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Formulario de Usuário</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br />
	<br />
	<br />
	<form action="gravaColaborador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Criação de Colaborador - ${clienteId}</legend>
			<p class="pull-right">
				<a href="funcionariosList"><i class="fa fa-reply-all fa-2x"
					aria-hidden="true"></i></a>
			</p>
			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text"
						placeholder="Nome do Colaborador" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Cargo</label>
				<div class="controls">
					<input id="cargo" name="cargo" type="text"
						placeholder="Cargo do Colaborador" class="input-xlarge">
				</div>
			</div>
			<input type="hidden" name="clienteId" id="clienteId"
				value="${clienteId}">
			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="email" name="email" type="text"
						placeholder="E-mail do Colaborador" class="input-xlarge" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Celular</label>
				<div class="controls">
					<input type="text" id="celular" name="celular"
						placeholder="Celular" onkeypress="mask(this, mphone);"
						onblur="mask(this, mphone);" class="input-xlarge"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">
						Salvar <i class="fa fa-floppy-o fa-lg"></i>
					</button>
					<a class="btn btn-primary" href="#" onClick="history.go(-1)"
						role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
	function mask(o, f) {
	    setTimeout(function () {
	        var v = mphone(o.value);
	        if (v != o.value) {
	            o.value = v;
	        }
	    }, 1);
	}
	
	function mphone(v) {
	    var r = v.replace(/\D/g,"");
	    r = r.replace(/^0/,"");
	    if (r.length > 10) {
	        // 11+ digits. Format as 5+4.
	        r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/,"($1) $2-$3");
	    }
	    else if (r.length > 5) {
	        // 6..10 digits. Format as 4+4
	        r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/,"($1) $2-$3");
	    }
	    else if (r.length > 2) {
	        // 3..5 digits. Add (0XX..)
	        r = r.replace(/^(\d\d)(\d{0,5})/,"($1) $2");
	    }
	    else {
	   
	        // 0..2 digits. Just add (0XX
	        r = r.replace(/^(\d*)/, "($1");
	    }
	    return r;
	}
</script>
</html>