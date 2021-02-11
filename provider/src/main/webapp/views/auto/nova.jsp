<!DOCTYPE html>
<html>
<head>
<title>ProviderOne | Auto Atendimento</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<style>
#fundo-externo {
	overflow: hidden;
	/* para que não tenha rolagem se a imagem de fundo for maior que a tela */
	width: 100%;
	height: 100%;
	position: relative; /* criamos um contexto para posicionamento */
}

#fundo {
	position: fixed;
	/* posição fixa para que a possível rolagem da tela não revele espaços em branco */
	width: 100%;
	height: 100%;
}

#fundo img {
	width: 100%;
	height: 100%;
	/* com isso imagem ocupará toda a largura da tela. Se colocarmos height: 100% também, a imagem irá distorcer */
	position: absolute;
}

#logo {
	position: relative;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div id="fundo-externo">
		<div id="fundo">
			<img src="assets/img/P1-embassado.jpg" alt="" />
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<h2 align="center">
		<img id="logo" src="assets/img/logo_provider.png">
	</h2>
	<div class="container">
		<div class="row">
			<div class="Absolute-Center is-Responsive">
				<div class="col-sm-12 col-md-4 col-md-offset-4">
					<form action="logarAuto" method="post" id="loginForm">
						<div class="form-group input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input
								class="form-control" type="text" name='email'
								placeholder="E-mail" required autofocus />
						</div>
						<div class="form-group input-group">
							<span class="input-group-addon"><i
								class="	glyphicon glyphicon-phone"></i></span> <input
								class="form-control" type="text" name='celular'
								placeholder="celular" onkeypress="mask(this, mphone);"
								onblur="mask(this, mphone);" required="required" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-lg btn-primary btn-block">Avançar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="assets/js/jquery.js"></script>
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