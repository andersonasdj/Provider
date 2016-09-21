package br.com.providerone.projeto;

import static org.junit.Assert.assertEquals;

import java.util.Calendar;

import org.junit.Before;
import org.junit.Test;

import br.com.providerone.modelo.Projeto;

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

	
	}

}
