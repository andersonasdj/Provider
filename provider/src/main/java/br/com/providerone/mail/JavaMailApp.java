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
		
	public void enviaEmail(Cliente cliente, Solicitacao solicitacao, String destinatario){
		try {
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(email.getEmail())); //Remetente
		      
		      //Caso usu�rio n�o digite nenhum email ser� enviado ao cadastrado no usuario do cliente
		      if(destinatario == ""){
		    	  destinatario = cliente.getEmail();
		      }

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
		      message.setSubject(email.getAssunto() + " - " + cliente.getNome());//Assunto
		      
		      String mensagemEmail =
		    		  "<html>"
		      			+ "<head>"
		    		  		+ "<meta http-equiv='Content-Type' content='text/html'; charset=utf-8/>"
		      			+ "</head>"
		    		  	+ "<body>"
		    		  		+ "<h2>Solicita��o cadastrada com sucesso!</h2>"
		      				+ "<br/>"
		      				+ "<hr>"
		      					+ "<p><b>Id da solicita��oo: </b>" + solicitacao.getId() + "</p>"
		      					+ "<p><b>Data da abertura: </b>" + df.format(solicitacao.getDataAbertura().getTime()) + "</p>"
		      					+ "<p><b>Aberto por: </b>" + solicitacao.getAbriuChamado() + "</p>"
		      					+ "<p><b>Usuario afetado: </b>" + solicitacao.getUsuario() + "</p>"
		      					+ "<p><b>Descri��oo da solicita��o: </b>" + solicitacao.getDescricaoProblema() + "</p>"
		      					+ "<p><b>Site: </b>" + solicitacao.getOnsiteOffsite() + "</p>"
		      					+ "<p><b>Prioridade: </b>" + solicitacao.getPrioridade() + "</p>"
		      					+ "<p><b>Status: <b/>" + solicitacao.getStatus() + "</p>"
		      				+ "<hr>"
		      				+ "<br>"
		      					+ "<p><b><u><font color=blue>Suporte ProviderOne </font></u></b></p>"
		      					+ "<p><b>ServiceDesk | (21) 2262-4275 </b></p>"
		      					+ "<p><b>suporte@providerone.com.br </b></p>"
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
		    		  		+ "<meta http-equiv='Content-Type' content='text/html'; charset=utf-8/>"
		      			+ "</head>"
		    		  	+ "<body>"
		    		  		+ "<h2>Solicita��o cadastrada com sucesso!</h2>"
		      				+ "<br/>"
		      				+ "<hr>"      					 
		      					+ "<p><b>Data da abertura: </b>" + df.format(solicitacao.getDataAbertura().getTime()) + "</p>"
		      					+ "<p><b>Aberto por: </b>" + solicitacao.getAbriuChamado() + "</p>"
		      					+ "<p><b>Usuario afetado: </b>" + solicitacao.getUsuario() + "</p>"
		      					+ "<p><b>Descri��oo da solicita��o: </b>" + solicitacao.getDescricaoProblema() + "</p>"
		      					+ "<p><b>Site: </b>" + solicitacao.getOnsiteOffsite() + "</p>"
		      					+ "<p><b>Prioridade: </b>" + solicitacao.getPrioridade() + "</p>"
		      					+ "<p><b>Status: <b/>" + solicitacao.getStatus() + "</p>"
		      				+ "<hr>"
		      				+ "<br>"
		      					+ "<p><b><u><font color=blue>Suporte ProviderOne </font></u></b></p>"
		      					+ "<p><b>ServiceDesk | (21) 2262-4275 </b></p>"
		      					+ "<p><b>suporte@providerone.com.br </b></p>"
		      			+ "</body>"
		      		+ "</html>";
		      
		      message.setContent(mensagemEmail, "text/html;charset=utf-8");
		      /**M�todo para enviar a mensagem criada*/
		      Transport.send(message);
		 } catch (MessagingException e) {
		      throw new RuntimeException(e);
		}	
	}
	
	private static Session configuraEmail(final Email email) {
		Properties props = new Properties();
		/** Par�metros de conex�o com servidor Microsoft / Google */
		props.put("mail.smtp.host", email.getSmtp());
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
		/** Ativa Debug para sessão */
		session.setDebug(true);
		return session;
	}
}