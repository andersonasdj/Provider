package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Fornecedor;

public class FornecedorDao {
	EntityManager manager;

	public FornecedorDao() {	
			new EntityFactory();
			manager = EntityFactory.getEntityManager();
	}
	
	public void salvar(Fornecedor fornecedor) {
		manager.getTransaction().begin();
		manager.persist(fornecedor);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Fornecedor fornecedor) {
		manager.getTransaction().begin();
		manager.remove(fornecedor);
		manager.getTransaction().commit();
		manager.close();
	}

	public Fornecedor buscarPorId(Long id) {
		Fornecedor fornecedor;
		manager.getTransaction().begin();
		fornecedor = manager.find(Fornecedor.class, id);
		manager.getTransaction().commit();
		manager.close();
		return fornecedor;
	}
	
	public Fornecedor buscaNomeFornecedor(String fornecedorNome) {
		Fornecedor fornecedorEncontrado = new Fornecedor();
		System.out.println("No dao " + fornecedorNome);
		try {
			Query query = manager
					.createQuery("select f from Funcionario f where f.nome=:pNome");
			query.setParameter("pNome", fornecedorNome);
			fornecedorEncontrado = (Fornecedor) query.getSingleResult();

			if (fornecedorEncontrado != null) {
				return fornecedorEncontrado;
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
	public List<Fornecedor> listaFornecedor() {
		List<Fornecedor> fornecedores = new ArrayList<Fornecedor>();

		try {
			Query query = manager.createQuery("select f from Fornecedor f order by f.nome");

			fornecedores = (List<Fornecedor>) query.getResultList();
			
			if (fornecedores != null) {
				return fornecedores;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}

	public void atualizar(Fornecedor fornecedor) {
		manager.getTransaction().begin();
		manager.merge(fornecedor);
		manager.getTransaction().commit();
		manager.close();
	}
}