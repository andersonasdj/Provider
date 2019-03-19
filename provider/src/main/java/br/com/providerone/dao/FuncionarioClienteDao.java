package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.FuncionarioCliente;

public class FuncionarioClienteDao {
	EntityManager manager;

	public FuncionarioClienteDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvar(FuncionarioCliente funcionarioCliente) {
		manager.getTransaction().begin();
		manager.persist(funcionarioCliente);
		manager.getTransaction().commit();
		manager.close();
	}

	public FuncionarioCliente buscaPorId(Long id) {
		manager.getTransaction().begin();
		FuncionarioCliente funcionarioCliente = manager.find(FuncionarioCliente.class, id);
		manager.getTransaction().commit();
		manager.close();
		return funcionarioCliente;
	}
	
	public void atualizar(FuncionarioCliente funcionarioCliente) {
		manager.getTransaction().begin();
		manager.merge(funcionarioCliente);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<FuncionarioCliente> listaFuncionariosCLiente() {
		List<FuncionarioCliente> funcionarioCliente = new ArrayList<FuncionarioCliente>();

		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f order by f.nome");

			funcionarioCliente = (List<FuncionarioCliente>) query.getResultList();

			if (funcionarioCliente != null) {
				return funcionarioCliente;
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
	public List<FuncionarioCliente> listaFuncionariosClientePorNome(String nomeCliente) {
		List<FuncionarioCliente> funcionarioCliente = new ArrayList<FuncionarioCliente>();

		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.cliente.nome= :pNome order by f.nome");
			query.setParameter("pNome", nomeCliente);
			
			funcionarioCliente = (List<FuncionarioCliente>) query.getResultList();

			if (funcionarioCliente != null) {
				return funcionarioCliente;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public void excluirFuncionarioCliente(Long id) {
		try {
			FuncionarioCliente funcionarioClientetExcluir = new FuncionarioCliente();
			manager.getTransaction().begin();
			funcionarioClientetExcluir = manager.find(FuncionarioCliente.class, id);
			manager.remove(funcionarioClientetExcluir);
			manager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Não foi possíl excluir esse Funcionario: " + e.getMessage());
		} finally {
			manager.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<FuncionarioCliente> listaChecklistsCliente(String nomeDoFuncionario) {
		List<FuncionarioCliente> checklists = new ArrayList<FuncionarioCliente>();

		try {
			Query query = manager.createQuery("select c from Checklist c where c.nomeCliente = :pNomeCliente");
			query.setParameter("pNomeCliente", nomeDoFuncionario);
			checklists = (List<FuncionarioCliente>) query.getResultList();
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