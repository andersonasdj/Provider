package br.com.providerone.configuracao;

import java.util.List;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

import br.com.providerone.dao.EmailDao;
import br.com.providerone.modelo.Email;

public class TesteDeConfiguracaoDeEmail {

	@Test
	public void testeSeExistePeloMenosUmEmailConfigurado(){
		
		EmailDao dao = new EmailDao();
		
		List<Email> emails = dao.listaEmailConfig();
		
		assertEquals(1,emails.size());
		
	}
}
