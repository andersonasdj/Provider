package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.List;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;

public class TestaAuto {
	
	
	public static void main(String[] args) {
		Solicitacao solicitacao = new Solicitacao();
		List<Solicitacao> soliList = new ArrayList<Solicitacao>();
		SolicitacaoDao dao = new SolicitacaoDao();
		
	
		
		soliList = dao.listaTodasSolicitacoes();
		
		System.out.println(soliList.size());
	}
	
	

}
