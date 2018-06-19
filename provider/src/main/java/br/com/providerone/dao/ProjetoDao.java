package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Projeto;

public class ProjetoDao {
	EntityManager manager;

	public ProjetoDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvar(Projeto projeto) {
		projeto.setDataCriacao(Calendar.getInstance());
		projeto.setStatus("Não iniciado");
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
	
	public void atualizar(Projeto projeto) {
		manager.getTransaction().begin();
		manager.merge(projeto);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Projeto> listaProjetos() {
		List<Projeto> projetos = new ArrayList<Projeto>();

		try {
			Query query = manager.createQuery("select p from Projeto p order by p.id");

			projetos = (List<Projeto>) query.getResultList();

			if (projetos != null) {
				return projetos;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public void excluirProjeto(Long id) {
		
		try {
			Projeto projetoExcluir = new Projeto();
			manager.getTransaction().begin();
			projetoExcluir = manager.find(Projeto.class, id);
			manager.remove(projetoExcluir);
			manager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Não foi possíl excluir esse projeto: " + e.getMessage());
		} finally {
			manager.close();
		}
		
	}

}