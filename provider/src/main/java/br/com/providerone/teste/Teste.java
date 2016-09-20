package br.com.providerone.teste;

import java.util.Calendar;

import br.com.providerone.dao.ProjetoDao;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Projeto;

public class Teste {

		public static void main(String[] args) {
			Projeto projeto = new Projeto();
			projeto.setDataCriacao(Calendar.getInstance());
			projeto.setId(1l);
			projeto.setNomeCliente("Biar");
			projeto.setNomeResponsavel("Anderson Araujo");
			projeto.setStatus("Aberto");
			projeto.setTituloProjeto("Levantamento Inicial de TI");
			
			Funcionario funcionario = new Funcionario();
			funcionario.setNome("Anderson");
			
			ProjetoDao dao = new ProjetoDao();
			dao.salvaProjeto(projeto, funcionario);
			
			
			
			
			
		}
}
