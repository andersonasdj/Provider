package br.com.providerone.teste;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.data.Data;
import br.com.providerone.modelo.Solicitacao;

public class TesteDifData {

	
	public static void main(String[] args) {
		
		SolicitacaoDao dao = new SolicitacaoDao();
		Solicitacao solicitacao =  dao.buscaSolicitacaoId(17L);
		Data data = new Data();
		
		System.out.println("ID: " + solicitacao.getId());
		System.out.println("Cliente: " + solicitacao.getCliente().getNome());
		System.out.println("Data Abertura: " + solicitacao.getDataAbertura().getTime());
		System.out.println("Data Andamento: " + solicitacao.getDataAndamento().getTime());
		System.out.println("Data Fechamenot: " + solicitacao.getDataFechamento().getTime());
		System.out.println("Tempo de Atendimento: " + solicitacao.getTempoDeAndamento());
		System.out.println("Tecnico respondavel: " + solicitacao.getFuncionario().getNome());
		
		System.out.println("################################################################");
		
		/*
		System.out.println(data.geraTempoTotal(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));
		if(solicitacao.getDataAndamento().get(Calendar.HOUR_OF_DAY) > 18){
			System.out.println("Apos as 18:00");
			System.out.print("Hora do andamento: " + solicitacao.getDataAndamento().get(Calendar.HOUR_OF_DAY) +":");
			System.out.println(solicitacao.getDataAndamento().get(Calendar.MINUTE));
			int min = solicitacao.getDataAndamento().get(Calendar.MINUTE);
			int hor = solicitacao.getDataAndamento().get(Calendar.HOUR_OF_DAY) - 18;
			System.out.println("Horas trabalhadas apos as 18:00 ");
			System.out.println("Horas: " + hor + ":" + min);
			
		}
		long diaAnd = solicitacao.getDataAndamento().get(Calendar.DAY_OF_MONTH);
		long diaFin = solicitacao.getDataFechamento().get(Calendar.DAY_OF_MONTH);
		
		long difDias = diaFin - diaAnd;
		
		System.out.println("Diferenca de dias: " + difDias);
		System.out.println("Dia do andamento: " + diaAnd);
		System.out.println("Dia do fechamento: " + diaFin);
		System.out.println("Senha gerada: " + solicitacao.geraSenha());
		*/
		
		data.GeraTempoAtendimento(solicitacao.getDataFechamento(), solicitacao.getDataAndamento());
		
	}
}
