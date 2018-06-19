package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Projeto;
import br.com.providerone.modelo.Tarefa;

public class TarefaDao {
	EntityManager manager;

	public TarefaDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvar(Tarefa tarefa, Projeto projeto) {
		tarefa.setProjeto(projeto);
		manager.getTransaction().begin();
		manager.persist(tarefa);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizar(Tarefa tarefa, Projeto projeto) {
		tarefa.setProjeto(projeto);
		manager.getTransaction().begin();
		manager.merge(tarefa);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public Tarefa buscaPorId(Long id) {
		manager.getTransaction().begin();
		Tarefa tarefa = manager.find(Tarefa.class, id);
		manager.getTransaction().commit();
		manager.close();
		return tarefa;
	}

	public void excluirTarefa(Long id) {
		Tarefa tarefaExcluir = new Tarefa();
		manager.getTransaction().begin();
		tarefaExcluir = manager.find(Tarefa.class, id);
		manager.remove(tarefaExcluir);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Tarefa> listaTarefas() {
		List<Tarefa> tarefas = new ArrayList<Tarefa>();

		try {
			Query query = manager
					.createQuery("select t from Tarefa t order by t.id");

			tarefas = (List<Tarefa>) query.getResultList();

			if (tarefas != null) {
				return tarefas;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Tarefa> listarTarefasPorId(Long id) {
		List<Tarefa> tarefas = new ArrayList<Tarefa>();

		try {
			Query query = manager.createQuery("select t from Tarefa t where t.projeto.id=:pId");
			query.setParameter("pId", id);
			tarefas = (List<Tarefa>) query.getResultList();

			if (tarefas != null) {
				return tarefas;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
}