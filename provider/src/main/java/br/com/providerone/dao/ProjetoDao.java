package br.com.providerone.dao;

import java.util.Calendar;

import javax.persistence.EntityManager;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Projeto;

public class ProjetoDao {
	EntityManager manager;

	public ProjetoDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvaProjeto(Projeto projeto, Funcionario funcionario) {
		projeto.setDataCriacao(Calendar.getInstance());
		projeto.setNomeResponsavel(funcionario.getNome());
		manager.getTransaction().begin();
		manager.persist(projeto);
		manager.getTransaction().commit();
		manager.close();
	}
	
}