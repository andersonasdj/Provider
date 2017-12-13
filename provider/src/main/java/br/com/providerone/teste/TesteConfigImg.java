package br.com.providerone.teste;

import java.util.ArrayList;
import java.util.List;

import br.com.providerone.dao.SistemaDao;
import br.com.providerone.modelo.Sistema;

public class TesteConfigImg {
	public static void main(String[] args) {
		List<Sistema> sistemas = new ArrayList<Sistema>();
		
		SistemaDao dao = new SistemaDao();
		
		sistemas = dao.listaSistemaConfig();
		
		System.out.println(sistemas.size());
	}
}
