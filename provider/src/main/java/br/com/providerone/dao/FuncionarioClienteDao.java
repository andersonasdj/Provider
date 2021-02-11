package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Cliente;
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
	
	public void excluiFuncionarioCliente(FuncionarioCliente funcionarioCliente) {
		manager.getTransaction().begin();
		manager.remove(funcionarioCliente);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<FuncionarioCliente> listaFuncionariosCliente(Long id) {
		List<FuncionarioCliente> funcionarioCliente = new ArrayList<FuncionarioCliente>();
		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.cliente.id= :pId order by f.nome");
			query.setParameter("pId", id);
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
	
	public FuncionarioCliente listaFuncionarioCliente(String funcionarioCliente) {
		FuncionarioCliente colaborador = new FuncionarioCliente();
		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.nome= :pNome");
			query.setParameter("pNome", funcionarioCliente);
			colaborador = (FuncionarioCliente) query.getSingleResult();
			
			if (colaborador != null) {
				return  colaborador;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public FuncionarioCliente listaFuncionarioClienteId(Long id) {
		FuncionarioCliente colaborador = new FuncionarioCliente();
		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.idFuncionario= :pId");
			query.setParameter("pId", id);
			colaborador = (FuncionarioCliente) query.getSingleResult();
			
			if (colaborador != null) {
				return  colaborador;
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
	@SuppressWarnings("unchecked")
	public String listaFuncionarioClientePorNome(String solicitante, String nomeCliente) {
		List<FuncionarioCliente> funcionarioCliente = new ArrayList<FuncionarioCliente>();

		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.cliente.nome= :pNome and f.nome= :pSolicitante order by f.nome");
			query.setParameter("pNome", nomeCliente);
			query.setParameter("pSolicitante", solicitante);
			funcionarioCliente = (List<FuncionarioCliente>) query.getResultList();
			if (funcionarioCliente != null) {
				return funcionarioCliente.get(0).getCargo();
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
	public String listaFuncionarioClientePorCel(String solicitante, String nomeCliente) {
		List<FuncionarioCliente> funcionarioCliente = new ArrayList<FuncionarioCliente>();

		try {
			Query query = manager.createQuery("select f from FuncionarioCliente f where f.cliente.nome= :pNome and f.nome= :pSolicitante order by f.nome");
			query.setParameter("pNome", nomeCliente);
			query.setParameter("pSolicitante", solicitante);
			funcionarioCliente = (List<FuncionarioCliente>) query.getResultList();
			if (funcionarioCliente != null) {
				return funcionarioCliente.get(0).getCelular();
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	
	public FuncionarioCliente listaFuncionarioClientePorCeleEmail(String celular, String email) {
		FuncionarioCliente funcionarioEncontrado = new FuncionarioCliente();
		try {
			Query query = manager
					.createQuery("select f from FuncionarioCliente f where f.email=:pEmail and f.celular=:pCelular");
			query.setParameter("pEmail", email);
			query.setParameter("pCelular", celular);
			funcionarioEncontrado = (FuncionarioCliente) query.getSingleResult();
			if (funcionarioEncontrado != null) {
				return funcionarioEncontrado;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}
	public boolean excluirFuncionarioCliente(Long id) {
		try {
			FuncionarioCliente funcionarioClientetExcluir = new FuncionarioCliente();
			manager.getTransaction().begin();
			funcionarioClientetExcluir = manager.find(FuncionarioCliente.class, id);
			manager.remove(funcionarioClientetExcluir);
			manager.getTransaction().commit();
			return true;
		} catch (Exception e) {
			ClienteDao clienteDao = new ClienteDao();
			Cliente cliente = clienteDao.buscaIdFuncionario(id);
			cliente.setFuncionarioCliente(null);
			ClienteDao clienteDaoAtualiza = new ClienteDao();
			clienteDaoAtualiza.atualizar(cliente);
			System.out.println("Não foi possíl excluir esse Funcionario: " + e.getMessage());
			return false;
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