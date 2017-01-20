package br.com.providerone.teste;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.data.Data;
import br.com.providerone.modelo.Solicitacao;

public class TestaDataSub {
	public static void main(String[] args) {
		
		Solicitacao solicitacao = new Solicitacao();
		SolicitacaoDao dao = new SolicitacaoDao();
		solicitacao = dao.buscaSolicitacaoId(4913l);
		
		System.out.println(solicitacao.getAbriuChamado());
		System.out.println(solicitacao.getDataAbertura().getTime());
		System.out.println(solicitacao.getDataAndamento().getTime());
		System.out.println(solicitacao.getDataFechamento().getTime());
		
		
		Data data = new Data();
		
		System.out.println(data.geraTempoTotal(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));

	}
}
