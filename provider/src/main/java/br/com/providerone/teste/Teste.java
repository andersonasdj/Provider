package br.com.providerone.teste;

import java.util.Calendar;

import br.com.providerone.dao.EmailDao;
import br.com.providerone.mail.JavaMailApp;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Email;
import br.com.providerone.modelo.Solicitacao;

public class Teste {

		public static void main(String[] args) {
			
			Cliente anderson = new Cliente();
			anderson.setEmail("andersonasdj@gmail.com");
			
			Solicitacao solicitacaoAnderson = new Solicitacao();
			solicitacaoAnderson.setId(1l);
			solicitacaoAnderson.setUsuario("Anderson");
			solicitacaoAnderson.setOnsiteOffsite("onsite");
			solicitacaoAnderson.setDescricaoProblema("Teste de chamado");
			solicitacaoAnderson.setDataAbertura(Calendar.getInstance());
			
			EmailDao dao = new EmailDao();
			Email emailConfig = new Email();
			emailConfig = dao.listaEmailConfigAbertura();
			
			
			System.out.println(emailConfig.getEmail());
			System.out.println(emailConfig.isSslStatus());
			
			
			JavaMailApp mailSend = new JavaMailApp(emailConfig);
			
			mailSend.enviaEmail(anderson, solicitacaoAnderson);
			
			
			
			
			
			
		}
}
