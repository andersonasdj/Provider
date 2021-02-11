package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.List;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;

public class TestaHql {
	
	public static void main(String[] args) {
		
		SolicitacaoDao dao = new SolicitacaoDao();
		
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		solicitacaos = (List<Solicitacao>) dao.listaTodasSolicitacoesFiltro();
		
		System.out.println("* Quantidade que obedece o filtro: " + solicitacaos.size());
	
	}
}
