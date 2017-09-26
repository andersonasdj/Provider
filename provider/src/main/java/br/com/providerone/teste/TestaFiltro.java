package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;


public class TestaFiltro {
	
	public static void main(String[] args) {
		
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		SolicitacaoDao solicitacaoDao = new SolicitacaoDao();
		
		Date dataInicio = new Date();
		Date dataFim = new Date();
		
		System.out.println(dataInicio);
		System.out.println(dataFim);
		
		solicitacaos = solicitacaoDao.listaSolicitacoesPorDataMedia(dataInicio, dataFim);
		System.out.println(solicitacaos);
		
		
		
	}

}
