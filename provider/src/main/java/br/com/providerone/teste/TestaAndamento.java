package br.com.providerone.teste;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Solicitacao;

public class TestaAndamento {
	public static void main(String[] args) {
		Solicitacao solicitacao = new Solicitacao();
		
		SolicitacaoDao dao = new SolicitacaoDao();
		
		solicitacao = dao.buscaSolicitacaoId(10l);
		
		System.out.println("ID: " + solicitacao.getId());
		System.out.println("DataAbertura: " + solicitacao.getDataAbertura().getTime());
		System.out.println((solicitacao.getDataAndamento() != null) ? ("DataAndamento: " + solicitacao.getDataAndamento().getTime()): "DataAndamento: Não iniciado");
		System.out.println((solicitacao.getDataFechamento() != null) ? ("DataFechamento: " + solicitacao.getDataFechamento().getTime()) : "DataFechamento: Não Finalizado" );
		System.out.println("Agendado: " + solicitacao.getAgendado().getTime());
		System.out.println("AgendadoHora: " + solicitacao.getAgendadoHora().getTime());
		System.out.println("Cliente: " + solicitacao.getCliente().getNome());
		System.out.println("Funcionario: " + solicitacao.getFuncionario().getNome());
		System.out.println("FormaAbertura: " + solicitacao.getFormaAbertura());
		System.out.println("Usuario: " + solicitacao.getUsuario());
		System.out.println("Prioridade: " + solicitacao.getPrioridade());
		System.out.println("DescricaoProblema: " + solicitacao.getDescricaoProblema());
		System.out.println("Resolucao: " + solicitacao.getResolucao());
		System.out.println("Status: " + solicitacao.getStatus());
		System.out.println("OBS: " + solicitacao.getObs());
		System.out.println("NIvelDeIncidencia: " + solicitacao.getNivelDeIncidencia());
		System.out.println("OnsiteOffsite: " + solicitacao.getOnsiteOffsite());
		System.out.println("Classificacao: " + solicitacao.getClassificacao());
		System.out.println("StatusEmail: " + solicitacao.getStatusEmail());
		System.out.println("DiasDur: " + solicitacao.getDiasDur());
		System.out.println("HorasDur: " + solicitacao.getHorasDur());
		System.out.println("MinutosDur: " + solicitacao.getMinutosDur());
		System.out.println("AbriuChamado: " + solicitacao.getAbriuChamado());
		System.out.println("TempoDeAndamento: " + solicitacao.getTempoDeAndamento());
		
		System.out.println("");
		System.out.println("#######################################################################");
		System.out.println("");
		
		
	}
}
