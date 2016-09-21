package br.com.providerone.dao;

import javax.persistence.EntityManager;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Tarefa;

public class TarefaDao {
	EntityManager manager;

	public TarefaDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvar(Tarefa tarefa) {	
		manager.getTransaction().begin();
		manager.persist(tarefa);
		manager.getTransaction().commit();
		manager.close();
	}
	
}