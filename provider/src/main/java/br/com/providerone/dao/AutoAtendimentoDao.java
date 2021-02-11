package br.com.providerone.dao;

import javax.persistence.EntityManager;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Solicitacao;

public class AutoAtendimentoDao {
	EntityManager manager;

	public AutoAtendimentoDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	
	
	public void salvaSuporte(Solicitacao solicitacao) {
		manager.getTransaction().begin();
		manager.persist(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
}
