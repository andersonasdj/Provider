package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Sistema;


public class SistemaDao {
	EntityManager manager;

	public SistemaDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvar(Sistema sistema) {
		manager.getTransaction().begin();
		manager.persist(sistema);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Long id) {
		manager.getTransaction().begin();
		Sistema imgRemover = new Sistema();
		imgRemover = manager.find(Sistema.class, id);
		manager.remove(imgRemover);
		manager.getTransaction().commit();
		manager.close();
	}

	public Sistema buscarPorId(Long id) {
		Sistema sistema;
		manager.getTransaction().begin();
		sistema = manager.find(Sistema.class, id);
		manager.getTransaction().commit();
		manager.close();
		return sistema;
	}

	public void atualizar(Sistema sistema) {
		manager.getTransaction().begin();
		manager.merge(sistema);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Sistema> listaSistemaConfig() {
		List<Sistema> sistemaConfig = new ArrayList<Sistema>();

		try {
			Query query = manager.createQuery("select s from Sistema s");

			sistemaConfig = (List<Sistema>) query.getResultList();

			if (sistemaConfig != null) {
				return sistemaConfig;
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