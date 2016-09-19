package br.com.providerone.solicitacao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Solicitacao;

public class TesteDeSolicitacao {

	private Solicitacao solicitacao1;
	private Funcionario funcionario1, funcionario2;
	private Cliente cliente1;

	@Before
	public void criaSolicitacaoEFuncionario() {
		this.solicitacao1 = new Solicitacao();
		this.funcionario1 = new Funcionario();
		this.funcionario2 = new Funcionario();
		this.cliente1 = new Cliente();
	}

	@Test
	public void testeDeCriacaoDeSolicitacao() {

		funcionario1.setDataAtualizacao(Calendar.getInstance());
		funcionario1.setEmail("funcionario1@teste.com");
		funcionario1.setFuncao("Administrador");
		funcionario1.setId(1l);
		funcionario1.setNome("Funcionario1");
		funcionario1.setSenha("123");
		funcionario1.setStatus("Ativo");
		funcionario1.setUsuario("funcionario1");

		cliente1.setEmail("cliente1@teste.com");
		cliente1.setId(1l);
		cliente1.setNome("Cliente1");
		cliente1.setSenha("123");
		cliente1.setStatus("Ativo");

		solicitacao1.setAbriuChamado(funcionario1.getNome());
		solicitacao1.setClassificacao("Hardware");
		solicitacao1.setCliente(cliente1);
		solicitacao1.setDataAbertura(Calendar.getInstance());
		solicitacao1.setDescricaoProblema("Chamado Teste");
		solicitacao1.setId(1l);
		solicitacao1.setOnsiteOffsite("Onsite");
		solicitacao1.setPrioridade("Alta");
		solicitacao1.setStatus("Aberto");
		solicitacao1.setUsuario("teste");

		assertEquals("Funcionario1", solicitacao1.getAbriuChamado());
		assertEquals("Hardware", solicitacao1.getClassificacao());
		assertEquals(cliente1, cliente1);
		assertEquals("Chamado Teste", solicitacao1.getDescricaoProblema());
		assertEquals("Onsite", solicitacao1.getOnsiteOffsite());
		assertEquals("Alta", solicitacao1.getPrioridade());
		assertEquals("Aberto", solicitacao1.getStatus());
		assertEquals("teste", solicitacao1.getUsuario());

	}

	@Test
	public void testeDeAlteracaoDeSolicitacao() {

		funcionario1.setDataAtualizacao(Calendar.getInstance());
		funcionario1.setEmail("funcionario@teste.com");
		funcionario1.setFuncao("Administrador");
		funcionario1.setId(1l);
		funcionario1.setNome("Funcionario");
		funcionario1.setSenha("123");
		funcionario1.setStatus("Ativo");
		funcionario1.setUsuario("funcionario");

		cliente1.setEmail("cliente@teste.com");
		cliente1.setId(1l);
		cliente1.setNome("Cliente");
		cliente1.setSenha("123");
		cliente1.setStatus("Ativo");

		solicitacao1.setAbriuChamado(funcionario1.getNome());
		solicitacao1.setClassificacao("Hardware");
		solicitacao1.setCliente(cliente1);
		solicitacao1.setDataAbertura(Calendar.getInstance());
		solicitacao1.setDescricaoProblema("Chamado Teste");
		solicitacao1.setId(1l);
		solicitacao1.setOnsiteOffsite("Onsite");
		solicitacao1.setPrioridade("Alta");
		solicitacao1.setStatus("Aberto");
		solicitacao1.setUsuario("teste");

		assertEquals("Funcionario", solicitacao1.getAbriuChamado());
		assertEquals("Hardware", solicitacao1.getClassificacao());
		assertEquals(cliente1, cliente1);
		assertEquals("Chamado Teste", solicitacao1.getDescricaoProblema());
		assertEquals("Onsite", solicitacao1.getOnsiteOffsite());
		assertEquals("Alta", solicitacao1.getPrioridade());
		assertEquals("Aberto", solicitacao1.getStatus());
		assertEquals("teste", solicitacao1.getUsuario());

		solicitacao1.setStatus("Em Andamento");
		assertEquals("Em Andamento", solicitacao1.getStatus());

	}

	@Test
	public void testeDaAlteracaoDoFuncionarioQueAbreSolicitacao() {

		funcionario1.setDataAtualizacao(Calendar.getInstance());
		funcionario1.setEmail("funcionario1@teste.com");
		funcionario1.setFuncao("Administrador");
		funcionario1.setId(1l);
		funcionario1.setNome("Funcionario1");
		funcionario1.setSenha("123");
		funcionario1.setStatus("Ativo");
		funcionario1.setUsuario("funcionario1");

		funcionario2.setDataAtualizacao(Calendar.getInstance());
		funcionario2.setEmail("funcionario2@teste.com");
		funcionario2.setFuncao("Administrador");
		funcionario2.setId(1l);
		funcionario2.setNome("Funcionario2");
		funcionario2.setSenha("123");
		funcionario2.setStatus("Ativo");
		funcionario2.setUsuario("funcionario2");

		cliente1.setEmail("client@teste.com");
		cliente1.setId(1l);
		cliente1.setNome("Cliente");
		cliente1.setSenha("123");
		cliente1.setStatus("Ativo");

		solicitacao1.setAbriuChamado(funcionario1.getNome());
		solicitacao1.setClassificacao("Hardware");
		solicitacao1.setCliente(cliente1);
		solicitacao1.setDataAbertura(Calendar.getInstance());
		solicitacao1.setDescricaoProblema("Chamado Teste");
		solicitacao1.setId(1l);
		solicitacao1.setOnsiteOffsite("Onsite");
		solicitacao1.setPrioridade("Alta");
		solicitacao1.setStatus("Aberto");
		solicitacao1.setUsuario("teste");
		solicitacao1.setFuncionario(funcionario1);

		assertEquals("Funcionario1", solicitacao1.getAbriuChamado());
		assertEquals("Hardware", solicitacao1.getClassificacao());
		assertEquals(cliente1, cliente1);
		assertEquals("Chamado Teste", solicitacao1.getDescricaoProblema());
		assertEquals("Onsite", solicitacao1.getOnsiteOffsite());
		assertEquals("Alta", solicitacao1.getPrioridade());
		assertEquals("Aberto", solicitacao1.getStatus());
		assertEquals("teste", solicitacao1.getUsuario());
		assertEquals("Funcionario1", solicitacao1.getFuncionario().getNome());

		solicitacao1.setStatus("Em Andamento");
		assertEquals("Em Andamento", solicitacao1.getStatus());

		solicitacao1.setAbriuChamado(funcionario2.getNome());
		assertEquals("Funcionario2", solicitacao1.getAbriuChamado());

	}

	@Test
	public void testaInclusaoDeSolicitacoesNaLista() {

		Solicitacao solicitacao1 = new Solicitacao();
		Solicitacao solicitacao2 = new Solicitacao();
		Solicitacao solicitacao3 = new Solicitacao();
		Solicitacao solicitacao4 = new Solicitacao();

		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		solicitacaos.add(solicitacao1);
		solicitacaos.add(solicitacao2);
		solicitacaos.add(solicitacao3);
		solicitacaos.add(solicitacao4);

		assertEquals(4, solicitacaos.size());

		for (int i = 0; i < solicitacaos.size(); i++) {

			solicitacaos.get(i).setClassificacao("Software");
			solicitacaos.get(i).setDescricaoProblema("Chamado " + i);
		}

		assertEquals("Software", solicitacaos.get(0).getClassificacao());
		assertEquals("Software", solicitacaos.get(1).getClassificacao());
		assertEquals("Software", solicitacaos.get(2).getClassificacao());
		assertEquals("Software", solicitacaos.get(3).getClassificacao());

		assertEquals("Chamado 0", solicitacaos.get(0).getDescricaoProblema());
		assertEquals("Chamado 1", solicitacaos.get(1).getDescricaoProblema());
		assertEquals("Chamado 2", solicitacaos.get(2).getDescricaoProblema());
		assertEquals("Chamado 3", solicitacaos.get(3).getDescricaoProblema());

	}

	@Test
	public void criaSolicitacaoComAndamentoDoChamado() {

		funcionario1.setNome("Anderson");
		funcionario1.setId(1l);

		solicitacao1.setAbriuChamado(funcionario1.getNome());
		solicitacao1.setAndamentoDoChamado("Aberto");
		solicitacao1.setAndamentoDoChamado("Aberto por: "
				+ funcionario1.getNome() + " na data de "
				+ System.currentTimeMillis() + "\n");
		
		System.out.println(solicitacao1.getAndamentoDoChamado());
		
		assertEquals("Anderson", solicitacao1.getAbriuChamado());
	}
}