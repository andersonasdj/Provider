package br.com.providerone.mail;

import java.text.DateFormat;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Email;
import br.com.providerone.modelo.Solicitacao;

public class JavaMailApp
{
	private Email email;
	Session session;
	
	public JavaMailApp(Email email){
		this.email = email;
		session = configuraEmail(this.email);
	}
	
	public void enviaMFA(String destinatarioMFA, String mfa){
		try {						
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email.getEmail()));
			Address[] toUser = InternetAddress.parse(destinatarioMFA);
		    message.setRecipients(Message.RecipientType.TO, toUser);
		    String mensagemEmail = mfa;
		    message.setSubject(email.getAssunto());//Assunto
		    message.setContent(mensagemEmail, "text/html;charset=utf-8");	    
		    Transport.send(message);		    		   			
		}catch (MessagingException e) {
		      throw new RuntimeException(e);
		}			
	}
	
	public void enviaEmail(Cliente cliente, Solicitacao solicitacao, String destinatario){
		try {
			String link = email.getLinkDominio()+"/provider/protocolo?id="+solicitacao.getId()+"&senha="+solicitacao.getSenha()+"\""; //SOLU��O TEMPORARIA
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(email.getEmail())); //Remetente
		      
		      //Caso usu�rio n�o digite nenhum email ser� enviado ao cadastrado no usuario do cliente
		      if(destinatario == ""){
		    	  destinatario = cliente.getEmail();
		      }
		      Address[] toUser = InternetAddress //Destinat�rio(s)
		                 .parse(destinatario);
		      
		      /*
		      if(email.getCc() != null || email.getCc().equals("")){
		    	  Address[] toCc = InternetAddress //Destinat�io Com c�pia
		    			  .parse(email.getCc());
		    	  message.setRecipients(Message.RecipientType.CC, toCc); //Copia
		      }*/
		      
		      
		      Locale locBR = new Locale("pt","BR");
		      DateFormat df = DateFormat.getDateInstance(DateFormat.FULL,locBR);
		      message.setRecipients(Message.RecipientType.TO, toUser);
		      message.setSubject(email.getAssunto() + " - " + cliente.getNome());//Assunto
		      
		      String mensagemEmail =
		    		  "<html>"
				      			+ "<head>"
				    		  		+ "<meta http-equiv='Content-Type' content=\"text/html; charset=utf-8\"/>"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap.css\">"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap.min.css\">"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap-responsive.css\">"
				    		  		+ "<style type=\"text/css\">"
				    		  			+ ".fonte-letras {font-size: 20px;} .espacamento {line-height: 2.2;}"
				    		  			+ ".fundo { background: #E6E6E6; } .base { background: #FFFFFF; }"
				    		  		+ "</style>"
				      			+ "</head>"
				    		  	+ "<body>"
				      			+	"<div class=\"container base\">"
				    		  		+ "<div class=\"text-center\"><h2>Solicita��o cadastrada com sucesso!</h2></div>"
				    		  		+ "<div class=\"text-left fonte-letras\">"
					    		  		+ "<br/>"
					    		  		+ "<ul>"
					    		  			+ "<li class=\"espacamento\"><b>Data da abertura: </b>" + df.format(solicitacao.getDataAbertura().getTime()) +"</li>"
						      				+ "<li class=\"espacamento\"><b>Aberto por:  </b>" + solicitacao.getAbriuChamado() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Usuario afetado:  </b>" + solicitacao.getUsuario() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Descri��o da solicita��o: </b>" + solicitacao.getDescricaoProblema() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Site:  </b>" + solicitacao.getOnsiteOffsite() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Prioridade:  </b>" + solicitacao.getPrioridade() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Status:  </b>" + solicitacao.getStatus() + "</li>"
						      			+ "</ul>"
				      					+ "<p>#####################################################################################</p>"
				      					
				      					/*+ "<p><b>Acompanhamento do chamado: <b/>" + email.getLinkDominio() +"/protocolo?id="+solicitacao.getId() +"&senha="+solicitacao.getSenha()+"</p>"*/
				      					+ "<p><b>Acompanhamento do chamado: <b/> <a href=\"" + link + ">Clique aqui</a> </p>"
										+ "<p><b>Protocolo: <b/>" + solicitacao.getId() + "</p>"
				      					+ "<b>Senha: <b/>" + solicitacao.getSenha() + "</p>"
					      				+ "<br>"
				      				+ "</div>"
					      			+ "<div class=\"text-center\">"
					      				/*+"<img src=\"" + email.getLinkDominio() + "/assets/img/logo_provider.png\" alt=\"providerone\" class=\"img-rounded\">"*/
					      				+ "<p>" + email.getNomeAssinatura() + "</p>"
				      					+ "<p>" + email.getNumeroAssinatura() + "</p>"
				      					+ "<p>" + email.getEmailAssinatura() + "</p>"
				      				+ "</div>"
				      			+ "</div>"
				      		+ "</body>"
				      	+ "</html>";
		      
		      message.setContent(mensagemEmail, "text/html;charset=utf-8");
		      /**M�todo para enviar a mensagem criada*/
		      Transport.send(message);
		 } catch (MessagingException e) {
		      throw new RuntimeException(e);
		}	
	}
	
	public void enviaEmailAbertura(String  cliente, Solicitacao solicitacao, String destinatario){
		try {
			String link = email.getLinkDominio()+"/provider/protocolo?id="+solicitacao.getId()+"&senha="+solicitacao.getSenha()+"\""; //SOLU��O TEMPORARIA
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(email.getEmail())); //Remetente
		
		      Address[] toUser = InternetAddress //Destinat�rio(s)
		                 .parse(destinatario);
		      
		      if(email.getCc() != null || email.getCc().equals("")){
		    	  Address[] toCc = InternetAddress //Destinat�io Com c�pia
		    			  .parse(email.getCc());
		    	  message.setRecipients(Message.RecipientType.CC, toCc); //Copia
		      }
		      	     
		      Locale locBR = new Locale("pt","BR");
		      DateFormat df = DateFormat.getDateInstance(DateFormat.FULL,locBR);
		      message.setRecipients(Message.RecipientType.TO, toUser);
		      message.setSubject(email.getAssunto() + " - " + cliente);//Assunto
		      
		      String mensagemEmail =
		    		  "<html>"
				      			+ "<head>"
				    		  		+ "<meta http-equiv='Content-Type' content=\"text/html; charset=utf-8\"/>"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap.css\">"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap.min.css\">"
				    		  		+ "<link rel=\"stylesheet\" href=\"http://techgold.com.br/provider/assets/css/bootstrap-responsive.css\">"
				    		  		+ "<style type=\"text/css\">"
				    		  			+ ".fonte-letras {font-size: 20px;} .espacamento {line-height: 2.2;}"
				    		  			+ ".fundo { background: #E6E6E6; } .base { background: #FFFFFF; }"
				    		  		+ "</style>"
				      			+ "</head>"
				    		  	+ "<body>"
				      			+	"<div class=\"container base\">"
				    		  		+ "<div class=\"text-center\"><h2>Solicita��o cadastrada com sucesso!</h2></div>"
				    		  		+ "<div class=\"text-left fonte-letras\">"
					    		  		+ "<br/>"
					    		  		+ "<ul>"
					    		  			+ "<li class=\"espacamento\"><b>Data da abertura: </b>" + df.format(solicitacao.getDataAbertura().getTime()) +"</li>"
						      				+ "<li class=\"espacamento\"><b>Aberto por:  </b>" + solicitacao.getAbriuChamado() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Usuario afetado:  </b>" + solicitacao.getUsuario() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Descri��o da solicita��o: </b>" + solicitacao.getDescricaoProblema() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Site:  </b>" + solicitacao.getOnsiteOffsite() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Prioridade:  </b>" + solicitacao.getPrioridade() + "</li>"
						      				+ "<li class=\"espacamento\"><b>Status:  </b>" + solicitacao.getStatus() + "</li>"
						      			+ "</ul>"
				      					+ "<p>#####################################################################################</p>"
				      					
										+ "<p><b>Acompanhamento do chamado: <b/> <a href=\"" + link + ">Clique aqui</a> </p>" //SOLU��O TEMPORARIA
				      					+ "<p><b>Protocolo: <b/>" + solicitacao.getId() + "</p>"
				      					+ "<b>Senha: <b/>" + solicitacao.getSenha() + "</p>"
					      				+ "<br>"
				      				+ "</div>"
					      			+ "<div class=\"text-center\">"
					      				/*+"<img src=\"" + email.getLinkDominio() + "/assets/img/logo_provider.png\" alt=\"providerone\" class=\"img-rounded\">"*/
					      				+ "<p>" + email.getNomeAssinatura() + "</p>"
				      					+ "<p>" + email.getNumeroAssinatura() + "</p>"
				      					+ "<p>" + email.getEmailAssinatura() + "</p>"
				      				+ "</div>"
				      			+ "</div>"
				      		+ "</body>"
				      	+ "</html>";
		      
		      message.setContent(mensagemEmail, "text/html;charset=utf-8");
		      /**M�todo para enviar a mensagem criada*/
		      Transport.send(message);
		 } catch (MessagingException e) {
		      throw new RuntimeException(e);
		}	
	}
	
	private static Session configuraEmail(/*final*/ final Email email) {
		Properties props = new Properties();
		/** Par�metros de conex�o com servidor Microsoft / Google */
		props.put("mail.smtp.host", email.getSmtp());
		//props.put("mail.smtp.ssl.trust", email.getSmtp());
		props.put("mail.smtp.socketFactory.port", email.getPortaSmtp());
		props.put("mail.smtp.starttls.enable", email.isSslStatus());
		props.put("mail.smtp.auth", email.isAutenticacao());
		props.put("mail.smtp.port", email.getPortaSmtp());
		

		Session session = Session.getDefaultInstance(props,
		            new javax.mail.Authenticator() {
		                 protected PasswordAuthentication getPasswordAuthentication() 
		                 {
		                       return new PasswordAuthentication(email.getEmail(), email.getSenha());
		                 }
		            });
		/** Ativa Debug para sess�o */
		//session.setDebug(true);
		return session;
	}
}