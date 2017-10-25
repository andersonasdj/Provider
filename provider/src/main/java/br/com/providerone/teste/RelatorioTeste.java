package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.List;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Funcionario;


public class RelatorioTeste {

	public static void main(String[] args) {
		
		FuncionarioDao daoFun = new FuncionarioDao();
		
		List<Funcionario> funcionarios = daoFun.listaFuncionarioAtivo();
		
		System.out.println(funcionarios.size());
		
		
		List<relatorioTemp> relatorios = new ArrayList<relatorioTemp>();
		
		for(int i=0; i < funcionarios.size(); i++){
			SolicitacaoDao daoSolAberto = new SolicitacaoDao();
			SolicitacaoDao daoSolAndamento = new SolicitacaoDao();
			SolicitacaoDao daoSolAgendado = new SolicitacaoDao();
			SolicitacaoDao daoSolAguardando = new SolicitacaoDao();
			if (funcionarios.get(i).getId()!= null){
				
				relatorioTemp relaTemp = new relatorioTemp();
				
				relaTemp.id = funcionarios.get(i).getId();
				relaTemp.nome = funcionarios.get(i).getNome();
				relaTemp.qtdAberto = daoSolAberto.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionarios.get(i).getId());
				relaTemp.qtdAndamento = daoSolAndamento.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionarios.get(i).getId());
				relaTemp.qtdAgendado = daoSolAgendado.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionarios.get(i).getId());
				relaTemp.qtdAguardando = daoSolAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionarios.get(i).getId());
				relatorios.add(relaTemp);
				
			}
		}
		System.out.println(relatorios.size());
		
		for (int i = 0; i < relatorios.size(); i++) {
			System.out.println(relatorios.get(i));
		}
		
		
	}
	
	
	
}

class relatorioTemp{
	
	long id;
	String nome;
	Long qtdAberto, qtdAndamento, qtdAgendado, qtdAguardando;
	
	@Override
	public String toString() {
		return "relatorioTemp [id=" + id + ", nome=" + nome + ", qtdAberto="
				+ qtdAberto + ", qtdAndamento=" + qtdAndamento
				+ ", qtdAgendado=" + qtdAgendado + ", qtdAguardando="
				+ qtdAguardando + "]";
	}
	
}
