package br.com.providerone.teste;

import java.util.Calendar;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.data.Data;
import br.com.providerone.modelo.Solicitacao;

public class TestaDataSub {
	public static void main(String[] args) {
		
		Solicitacao solicitacao = new Solicitacao();
		SolicitacaoDao dao = new SolicitacaoDao();
		solicitacao = dao.buscaSolicitacaoId(3l);
		
		System.out.println("Abertura: " + solicitacao.getDataAbertura().getTime());
		System.out.println("Andamento: " + solicitacao.getDataAndamento().getTime());
		System.out.println("Fechamento: " + solicitacao.getDataFechamento().getTime());
		
		
		int minuto = solicitacao.getDataAbertura().get(Calendar.MINUTE);
		int segundo = solicitacao.getDataAbertura().get(Calendar.SECOND);
		int hora = solicitacao.getDataAbertura().get(Calendar.HOUR_OF_DAY);
		System.out.print("Abertura: " + hora);
		System.out.print(":" + minuto);
		System.out.println(":" + segundo);
		
		
		Data data = new Data();
		
		Long min = data.difMin(solicitacao.getDataFechamento(), solicitacao.getDataAndamento());
		Long hor = data.difHoras(solicitacao.getDataFechamento(), solicitacao.getDataAndamento());
		Long seg = data.difSeg(solicitacao.getDataFechamento(), solicitacao.getDataAndamento());
		
		System.out.println("hora: "+ hor);
		System.out.println("minuto: " + min);
		System.out.println("segundo: " + seg);
		System.out.println(min % 60);
		System.out.println(hor * 60);
		Long totalMinutos = data.geraTempoParcial(solicitacao.getDataFechamento(), solicitacao.getDataAndamento());
		System.out.println("hora: " + totalMinutos / 60);
		System.out.println("tempo de minutos: " + data.geraTempoParcial(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));
		System.out.println("Tempo Total: " + data.geraTempoTotal(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));

	}
}
