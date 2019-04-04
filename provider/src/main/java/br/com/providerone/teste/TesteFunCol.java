package br.com.providerone.teste;

import br.com.providerone.dao.FuncionarioClienteDao;

public class TesteFunCol {
	
	public static void main(String[] args) {
		FuncionarioClienteDao dao = new FuncionarioClienteDao();
		
		String cargo = dao.listaFuncionarioClientePorNome("Anderson de Araujo", "Hugo Silva");
		
		System.out.println(cargo);
	}

}
