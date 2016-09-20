package br.com.providerone.projeto;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.providerone.dao.ProjetoDao;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Projeto;
import br.com.providerone.modelo.Tarefa;

public class ProjetoTeste {

	private Projeto projeto;

	@Before
	public void inicializa() {
		projeto = new Projeto();
	}

	@Test
	public void testaCriacaoDeProjetoSemTarefa() {

		projeto.setDataCriacao(Calendar.getInstance());
		projeto.setId(1l);
		projeto.setNomeCliente("Biar");
		projeto.setNomeResponsavel("Anderson Araujo");
		projeto.setStatus("Aberto");
		projeto.setTituloProjeto("Levantamento Inicial de TI");

		assertEquals(1, projeto.getId(), 0.00001);
		assertEquals("Biar", projeto.getNomeCliente());
		assertEquals("Anderson Araujo", projeto.getNomeResponsavel());
		assertEquals("Aberto", projeto.getStatus());
		assertEquals("Levantamento Inicial de TI", projeto.getTituloProjeto());

	}

	@Test
	public void testaCriacaoDeProjetoComTarefa() {

		projeto.setDataCriacao(Calendar.getInstance());
		projeto.setId(1l);
		projeto.setNomeCliente("Biar");
		projeto.setNomeResponsavel("Anderson Araujo");
		projeto.setStatus("Aberto");
		projeto.setTituloProjeto("Levantamento Inicial de TI");

		Tarefa tarefa1 = new Tarefa();
		tarefa1.setId(1l);
		tarefa1.setDescricaoTarefa("Passar belarc em todas as estações");
		tarefa1.setObs("Caso usuário não deixe realizar o procedimento não finalizar a tarefa");
		tarefa1.setResponsavelTarefa("");
		tarefa1.setStatusTarefa("Em andamento");

		Tarefa tarefa2 = new Tarefa();
		tarefa2.setId(1l);
		tarefa2.setDescricaoTarefa("Levantar dados dos servidores");
		tarefa2.setObs("Usar Belarc");
		tarefa2.setResponsavelTarefa("");
		tarefa2.setStatusTarefa("Não iniciado");

		Tarefa tarefa3 = new Tarefa();
		tarefa3.setId(1l);
		tarefa3.setDescricaoTarefa("Coletar dados das impressoras");
		tarefa3.setObs("Caso seja alugada, pegar as informações da empresa responsavel");
		tarefa3.setResponsavelTarefa("");
		tarefa3.setStatusTarefa("Não iniciado");

		List<Tarefa> tarefas = new ArrayList<Tarefa>();
		tarefas.add(tarefa1);
		tarefas.add(tarefa2);
		tarefas.add(tarefa3);
		projeto.setTarefas(tarefas);

		assertEquals(1, projeto.getId(), 0.00001);
		assertEquals("Biar", projeto.getNomeCliente());
		assertEquals("Anderson Araujo", projeto.getNomeResponsavel());
		assertEquals("Aberto", projeto.getStatus());
		assertEquals("Levantamento Inicial de TI", projeto.getTituloProjeto());
		assertEquals(3, projeto.getTarefas().size());

		Tarefa tarefa4 = new Tarefa();
		tarefa4.setId(1l);
		tarefa4.setDescricaoTarefa("Verificar Links de internet");
		tarefa4.setObs("Velocidade de up e down");
		tarefa4.setResponsavelTarefa("");
		tarefa4.setStatusTarefa("Não iniciado");

		tarefas.add(tarefa4);
		projeto.setTarefas(tarefas);
		assertEquals(4, projeto.getTarefas().size());
		
		
		//##############################################################
		Funcionario funcionario = new Funcionario();
		funcionario.setNome("Anderson");
		
		ProjetoDao dao = new ProjetoDao();
		dao.salvaProjeto(projeto, funcionario);
	}

}
