package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Perifericos;

public class PerifericosDao {
	EntityManager manager;

	public PerifericosDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvar(Perifericos periferico) {
		manager.getTransaction().begin();
		manager.persist(periferico);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Perifericos peroferico) {
		manager.getTransaction().begin();
		Perifericos perifericoRemover = new Perifericos();
		perifericoRemover = manager.find(Perifericos.class, peroferico.getId());
		manager.remove(perifericoRemover);
		manager.getTransaction().commit();
		manager.close();
	}

	public Perifericos buscarPorId(Long id) {
		Perifericos periferico;
		manager.getTransaction().begin();
		periferico = manager.find(Perifericos.class, id);
		manager.getTransaction().commit();
		manager.close();
		return periferico;
	}

	public void atualizar(Perifericos periferico) {
		manager.getTransaction().begin();
		manager.merge(periferico);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Perifericos> listaPerifericos() {
		List<Perifericos> perifericos = new ArrayList<Perifericos>();

		try {
			Query query = manager.createQuery("select p from Perifericos p");

			perifericos = (List<Perifericos>) query.getResultList();

			if (perifericos != null) {
				return perifericos;
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