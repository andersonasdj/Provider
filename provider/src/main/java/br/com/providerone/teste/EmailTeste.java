package br.com.providerone.teste;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.mail.JavaMailApp;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Email;
import br.com.providerone.modelo.Solicitacao;

public class EmailTeste {

	public static void main(String[] args) {

		//Configura o envio
		Email email = new Email();
		email.setAssunto("Email Teste");
		email.setAutenticacao(true);
		email.setPortaSmtp(587);
		email.setSenha("xxxxx");
		email.setEmail("xxxxx@xxxxx.com.br");
		email.setSmtp("outlook.office365.com");
		email.setSslStatus(true);
		email.setMensagem("Email de abertura");
		
		//Carrega o cliente abeam
		ClienteDao daoCliente = new ClienteDao();
		Cliente abeam = daoCliente.buscarPorId(34l);
		
		//Carrega a solicitação
		SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
		Solicitacao solicitacao = daoSolicitacao.buscaSolicitacaoId(4937l);
		
		//Carrega a configuração
		JavaMailApp mail = new JavaMailApp(email);
		
		//Envia o E-mail
		mail.enviaEmail(abeam, solicitacao, "xxxxx@gmail.com");
		
		
	}
}
