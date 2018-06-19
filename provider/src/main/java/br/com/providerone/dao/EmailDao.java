package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Email;


public class EmailDao {
	EntityManager manager;

	public EmailDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}
	
	public void salvar(Email email) {
		manager.getTransaction().begin();
		manager.persist(email);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Email email) {
		manager.getTransaction().begin();
		Email emailRemover = new Email();
		emailRemover = manager.find(Email.class, email.getId());
		manager.remove(emailRemover);
		manager.getTransaction().commit();
		manager.close();
	}

	public Email buscarPorId(Long id) {
		Email email;
		manager.getTransaction().begin();
		email = manager.find(Email.class, id);
		manager.getTransaction().commit();
		manager.close();
		return email;
	}

	public void atualizar(Email email) {
		manager.getTransaction().begin();
		manager.merge(email);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Email> listaEmailConfig() {
		List<Email> emailsConfig = new ArrayList<Email>();

		try {
			Query query = manager.createQuery("select e from Email e");

			emailsConfig = (List<Email>) query.getResultList();

			if (emailsConfig != null) {
				return emailsConfig;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public Email listaEmailConfigAbertura() {
		Email emailConfigAbertura = new Email();
		try {
			Query query = manager.createQuery("select e from Email e where e.funcaoDoEmail=:pFuncao");
			query.setParameter("pFuncao", "Abertura");
			
			emailConfigAbertura = (Email) query.getSingleResult();

			if (emailConfigAbertura != null) {
				return emailConfigAbertura;
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