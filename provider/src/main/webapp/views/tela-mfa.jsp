<!DOCTYPE html>
<html>
<head>
	<title>ProviderOne | Login</title>
	<link rel="shortcut icon" href="assets/img/ico.png">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<style>
		#fundo-externo {
   			overflow: hidden; /* para que não tenha rolagem se a imagem de fundo for maior que a tela */
    		width: 100%;
    		height: 100%;
    		position: relative; /* criamos um contexto para posicionamento */
    	}
    	#fundo {
		    position: fixed; /* posição fixa para que a possível rolagem da tela não revele espaços em branco */
		    width: 100%;
		    height: 100%;
		}
		#fundo img {
    		width: 100%;
    		height: 100%; /* com isso imagem ocupará toda a largura da tela. Se colocarmos height: 100% também, a imagem irá distorcer */
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
	<br/><br/><br/><br/><br/>
	<h2 align="center"><img id="logo"src="assets/img/logo_provider.png" ></h2>
	<div class="container">	
	  <div class="row">
	    <div class="Absolute-Center is-Responsive">
	      <div class="col-sm-12 col-md-4 col-md-offset-4">
	        <form action="logarMfa" method="post" id="logarMfa"> 
	          <div class="form-group input-group">
	            <span class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></span>
	            <input class="form-control" type="text" name='mfa' placeholder="" required autofocus/>          
	          </div>
	           <input id="gfg" type="hidden" name="ip"/>
	          <div class="form-group">
	            <button type="submit" class="btn btn-lg btn-primary btn-block">Entrar</button>
	          </div>
	        </form>        
	      </div>  
	    </div>    
	  </div>
	</div>
</body>
	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
  
    <script>
        /* Add "https://api.ipify.org?format=json" statement
           this will communicate with the ipify servers in
           order to retrieve the IP address $.getJSON will
           load JSON-encoded data from the server using a
           GET HTTP request */
  
        $.getJSON("https://api.ipify.org?format=json",
                                          function(data) {
  
            // Setting text of element P with id gfg
            $("#gfg").val(data.ip);
        })
    </script>
</html>