package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.List;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;

public class Assunto {
	public static void main(String[] args) {
		List<Solicitacao> solicitacoes = new ArrayList<Solicitacao>();
		
		SolicitacaoDao dao = new SolicitacaoDao();
		
		solicitacoes = dao.listaSolicitacoesPorAssunto("Office");
		
		System.out.println(solicitacoes.size());
	}
}
