package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Computador;

public class ComputadorDao {
	EntityManager manager;

	public ComputadorDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvaComputador(Computador computador, Cliente cliente) {
		computador.setDataAtualizacao(Calendar.getInstance());
		computador.setCliente(cliente);
		manager.getTransaction().begin();
		manager.persist(computador);
		manager.getTransaction().commit();
		manager.close();
	}

	public Computador buscarPorId(Long id) {
		Computador computador;
		manager.getTransaction().begin();
		computador = manager.find(Computador.class, id);
		manager.getTransaction().commit();
		manager.close();
		return computador;
	}
	
	public void atualizar(Computador computador, Cliente cliente) {
		computador.setCliente(cliente);
		computador.setDataAtualizacao(Calendar.getInstance());
		manager.getTransaction().begin();
		manager.merge(computador);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Computador> listaComputador() {
		List<Computador> computadores = new ArrayList<Computador>();

		try {
			Query query = manager.createQuery("select c from Computador c");

			computadores = (List<Computador>) query.getResultList();

			if (computadores != null) {
				return computadores;
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
	public List<Computador> listaComputadorPorId(Long id) {
		List<Computador> computadores = new ArrayList<Computador>();

		try {
			Query query = manager.createQuery("select c from Computador c where c.cliente.id=:pId");
			query.setParameter("pId", id);
			computadores = (List<Computador>) query.getResultList();

			if (computadores != null) {
				return computadores;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public Long listaQtdComputadoresPorIdDoCliente(Long id) {
		
		try {
			Query query = manager
					.createQuery("select count(c) from Computador c where c.cliente.id=:pClienteId");
			query.setParameter("pClienteId", id);
			Long qtd = (Long) query.getSingleResult();
			if (qtd != 0) {
				manager.close();
				return qtd;
			} else {
				manager.close();
				return 0L;
			}
		} catch (Exception e) {
			manager.close();
			return 0L;
		}
	}
}