<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Login</title>
	<link rel="shortcut icon" href="assets/img/ico.png">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<br/><br/><br/><br/><br/>
	<h2 align="center"><img src="assets/img/logo_provider.png" ></h2>
	<div class="container">	
	  <div class="row">
	    <div class="Absolute-Center is-Responsive">
	      <div class="col-sm-12 col-md-4 col-md-offset-4">
	        <form action="logar" method="post" id="loginForm"> 
	          <div class="form-group input-group">
	            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	            <input class="form-control" type="text" name='usuario' placeholder="Usuário" required autofocus/>          
	          </div>
	          <div class="form-group input-group">
	            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	            <input class="form-control" type="password" name='senha' placeholder="Senha" required="required"/>     
	          </div>
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Eu aceito o termo <a href="#">Termos e Condições</a>
	            </label>
	          </div>
	          <div class="form-group">
	            <button type="submit" class="btn btn-lg btn-primary btn-block">Entrar</button>
	          </div>
	          <div class="form-group text-center">
	            <a href="mailto:suporte@providerone.com.br">Esqueci a Senha</a>&nbsp;|&nbsp;<a href="mailto:suporte@providerone.com.br">Suporte</a>
	            &nbsp;|&nbsp;<a href="assets/apk/ProviderOne.apk">APK</a>
	          </div>
	        </form>        
	      </div>  
	    </div>    
	  </div>
	</div>
</body>
	<script type="text/javascript" src="assets/js/jquery.js"></script>
</html>