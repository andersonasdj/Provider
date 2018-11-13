package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Checklist;

public class CheckListDao {
	EntityManager manager;

	public CheckListDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvar(Checklist checklist) {
		checklist.setDataCriacao(Calendar.getInstance());
		manager.getTransaction().begin();
		manager.persist(checklist);
		manager.getTransaction().commit();
		manager.close();
	}

	public Checklist buscaPorId(Long id) {
		manager.getTransaction().begin();
		Checklist checklist = manager.find(Checklist.class, id);
		manager.getTransaction().commit();
		manager.close();
		return checklist;
	}
	
	public void atualizar(Checklist checklist) {
		manager.getTransaction().begin();
		manager.merge(checklist);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Checklist> listaChecklists() {
		List<Checklist> checklists = new ArrayList<Checklist>();

		try {
			Query query = manager.createQuery("select c from Checklist c order by c.numeroChecklist");

			checklists = (List<Checklist>) query.getResultList();

			if (checklists != null) {
				return checklists;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public void excluirChecklist(Long id) {
		try {
			Checklist checklistExcluir = new Checklist();
			manager.getTransaction().begin();
			checklistExcluir = manager.find(Checklist.class, id);
			manager.remove(checklistExcluir);
			manager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Não foi possíl excluir esse checklist: " + e.getMessage());
		} finally {
			manager.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Checklist> listaChecklistsCliente(String nomeDoCliente) {
		List<Checklist> checklists = new ArrayList<Checklist>();

		try {
			Query query = manager.createQuery("select c from Checklist c where c.nomeCliente = :pNomeCliente");
			query.setParameter("pNomeCliente", nomeDoCliente);
			checklists = (List<Checklist>) query.getResultList();
			if (checklists != null) {
				return checklists;
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