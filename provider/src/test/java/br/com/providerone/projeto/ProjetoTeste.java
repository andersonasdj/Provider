package br.com.providerone.projeto;

import java.util.Calendar;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

import br.com.providerone.modelo.Projeto;

public class ProjetoTeste {

	@Test
	public void testaCriacaoDeProjetoSemTarefa() {
		Projeto projeto = new Projeto();
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
