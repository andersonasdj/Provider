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

	public void salvar(Projeto projeto, Funcionario funcionario) {
		projeto.setDataCriacao(Calendar.getInstance());
		projeto.setNomeResponsavel(funcionario.getNome());
		manager.getTransaction().begin();
		manager.persist(projeto);
		manager.getTransaction().commit();
		manager.close();
	}

	public Projeto buscaPorId(Long id) {
		manager.getTransaction().begin();
		Projeto projeto = manager.find(Projeto.class, id);
		manager.getTransaction().commit();
		manager.close();
		return projeto;
	}

}