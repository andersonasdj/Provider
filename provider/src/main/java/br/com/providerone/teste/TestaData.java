package br.com.providerone.teste;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Solicitacao;

public class TestaData {
	public static void main(String[] args) {
		
		//Solicitacao solicitacao = new Solicitacao();
		Funcionario funcionario = new Funcionario();
		Cliente cliente = new Cliente();
		
		funcionario.setNome("Anderson de Araujo");
		cliente.setNome("FTLT");
		/*
		solicitacao.setAbriuChamado(funcionario.getNome());
		solicitacao.setClassificacao("Alta");
		solicitacao.setDataAbertura(Calendar.getInstance());
		solicitacao.setStatus("Aberto");
		solicitacao.setPrioridade("Alta");
		solicitacao.setOnsiteOffsite("Onsite");
		solicitacao.setFormaAbertura("Email");
		solicitacao.setDescricaoProblema("Sem rede");
		
		String log;
		
		log = solicitacao.geraLogSolicitacao(funcionario, cliente);
		
		System.out.println(log);
		*/
		
		SolicitacaoDao dao = new SolicitacaoDao();
		Solicitacao solicitacao2 = new Solicitacao();
		
		solicitacao2 = dao.buscaSolicitacaoId(4894l);
		
		String log = solicitacao2.geraLogSolicitacao(funcionario, cliente);
		System.out.println(log);
		
		log = solicitacao2.atualizaLogSolicitacao(funcionario, funcionario.getNome());
		System.out.println(log);
	}
}
