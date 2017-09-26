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
		
	public void enviaEmail(Cliente cliente, Solicitacao solicitacao){
		try {
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(email.getEmail())); //Remetente

		      Address[] toUser = InternetAddress //Destinatário(s)
		                 .parse(cliente.getEmail());
		      Locale locBR = new Locale("pt","BR");
		      DateFormat df = DateFormat.getDateInstance(DateFormat.FULL,locBR);
		      message.setRecipients(Message.RecipientType.TO, toUser);
		      message.setSubject(email.getAssunto());//Assunto
		      message.setText(" Solicitação de chamado cadastrada com sucesso!\n\n"
		      		  + email.getMensagem() + "\n\n"
		      		  + "_____________________________________________________________ \n"
		    		  + " ID: #" + solicitacao.getId()
		    		  + "\n\n Usuário afetado: " + solicitacao.getUsuario()
		    		  + "\n\n Descrição do chamado: " + solicitacao.getDescricaoProblema()
		    		  + "\n\n Data de abertura: " + df.format(solicitacao.getDataAbertura().getTime())
		    		  + "\n\n Status da solicitação: " + solicitacao.getStatus()
		    		  + "\n _____________________________________________________________ \n"
		    		  + "\n\n\n\n Suporte ProviderOne \n"
		    		  + " Tel.: 21 2262-4275 \n"
		    		  + " Email: suporte@providerone.com.br");
		      /**Método para enviar a mensagem criada*/
		      Transport.send(message);
		 } catch (MessagingException e) {
		      throw new RuntimeException(e);
		}	
	}
	private static Session configuraEmail(final Email email) {
		Properties props = new Properties();
		/** Parâmetros de conexão com servidor Microsoft / Google */
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