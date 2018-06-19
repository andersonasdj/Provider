package br.com.providerone.teste;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.data.Data;
import br.com.providerone.modelo.Solicitacao;

public class TesteDifData {

	
	public static void main(String[] args) {
		
		SolicitacaoDao dao = new SolicitacaoDao();
		Solicitacao solicitacao =  dao.buscaSolicitacaoId(1L);
		Data data = new Data();
		
		System.out.println("ID: " + solicitacao.getId());
		System.out.println("Cliente: " + solicitacao.getCliente().getNome());
		System.out.println("Data Abertura: " + solicitacao.getDataAbertura().getTime());
		System.out.println("Data Andamento: " + solicitacao.getDataAndamento().getTime());
		System.out.println("Data Fechamenot: " + solicitacao.getDataFechamento().getTime());
		System.out.println("Tempo de Atendimento: " + solicitacao.getTempoDeAndamento());
		System.out.println("Tecnico respondavel: " + solicitacao.getFuncionario().getNome());
		
		System.out.println("################################################################");
		
		System.out.println(data.geraTempoTotal(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));
		
		System.out.println("Senha gerada: " + solicitacao.geraSenha());
		
	}
}
