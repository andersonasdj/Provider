package br.com.providerone.teste;

import java.io.File;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.modelo.Cliente;

public class TesteDir {

	public static void main(String[] args) {
		
		Cliente cliente = new Cliente();
		ClienteDao dao = new ClienteDao();
		cliente = dao.buscarPorId(2l);
		System.out.println(cliente.getNome());
		
		
		try {
			
			File diretorio = new File("C:\\GED\\"+cliente.getId());
			diretorio.mkdirs();
			
		} catch (Exception e) {
	            System.out.println(e);
		}
	}

}
