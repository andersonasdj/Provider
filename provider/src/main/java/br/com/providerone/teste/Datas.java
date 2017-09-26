package br.com.providerone.teste;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;

public class Datas {
	public static void main(String[] args) throws ParseException {
		
		Calendar hoje = Calendar.getInstance();
		hoje.set(Calendar.HOUR_OF_DAY, 0);
		hoje.set(Calendar.MINUTE, 0);
		hoje.set(Calendar.SECOND, 0);
		
		//DateFormat dataFormatada = new SimpleDateFormat("dd-MM-yyyy");
		
		
		Solicitacao solicitacao = new Solicitacao();
		
		SolicitacaoDao dao = new SolicitacaoDao();
		SolicitacaoDao dao2 = new SolicitacaoDao();
		
		solicitacao = dao.buscaSolicitacaoId(4928l);
		
		//String dataPronta = dataFormatada.format(solicitacao.getDataAbertura().getTime());
		
		
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		
		
		solicitacaos = dao2.listaSolicitacoesPorData(hoje);
		
		System.out.println(hoje.getTime());
		System.out.println(solicitacao.getDataAbertura().getTime());
		

		System.out.println(solicitacaos.size());
		
		System.out.println(solicitacaos.get(0).getId());
		System.out.println(solicitacaos.get(1).getId());
	}

}
