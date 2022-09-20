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
	<form action="atualizaColaborador" method="post"
		class="form-horizontal container">
		<fieldset>
			<legend>Edição de Colaborador</legend>

			<p class="pull-right">
				<a href="#" onClick="history.go(-1)"><i
					class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>

			<input id="idFuncionario" name="idFuncionario" type="hidden"
				value="${funcionario.idFuncionario}"> <input id="cliente.id"
				name="cliente.id" type="hidden" value="${funcionario.cliente.id}">
			<input id="clienteId" name="clienteId" type="hidden"
				value="${funcionario.cliente.id}">

			<div class="control-group">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input id="nome" name="nome" type="text"
						value="${funcionario.nome}" class="input-xlarge" required>
					<p class="help-block">* Campo Obrigatório</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Cargo</label>
				<div class="controls">
					<input id="cargo" name="cargo" type="text"
						value="${funcionario.cargo}" class="input-xlarge">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<input id="email" name="email" type="text"
						value="${funcionario.email}" class="input-xlarge" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Celular</label>
				<div class="controls">
					<input id="celular" name="celular" type="text"
						onkeypress="mask(this, mphone);" value="${funcionario.celular}"
						onblur="mask(this, mphone);" class="input-xlarge">
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">
						Salvar <i class="fa fa-floppy-o fa-lg"></i>
					</button>
					<a class="btn btn-primary" href="#" onClick="history.go(-1)"
						role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a> <a
						href="javascript:func()"
						onclick="confirmacao('${funcionario.idFuncionario}')"
						class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
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
	function confirmacao(id) {
		var resposta = confirm("Deseja remover esse Colaborador: " + id + " ?");
		if (resposta == true) {
			window.location.href = "removeFuncionarioCliente?id=" + id;
		}
	}
</script>
<script>
	function mask(o, f) {
		setTimeout(function() {
			var v = mphone(o.value);
			if (v != o.value) {
				o.value = v;
			}
		}, 1);
	}

	function mphone(v) {
		var r = v.replace(/\D/g, "");
		r = r.replace(/^0/, "");
		if (r.length > 10) {
			// 11+ digits. Format as 5+4.
			r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
		} else if (r.length > 5) {
			// 6..10 digits. Format as 4+4
			r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
		} else if (r.length > 2) {
			// 3..5 digits. Add (0XX..)
			r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
		} else {

			// 0..2 digits. Just add (0XX
			r = r.replace(/^(\d*)/, "($1");
		}
		return r;
	}
</script>
</html>