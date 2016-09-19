package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.providerone.criptografia.Criptografia;
import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Cliente;

public class ClienteDao {
	EntityManager manager;

	public ClienteDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvar(Cliente cliente) {
		cliente.setDataAtualizacao(Calendar.getInstance());
		//CRIPTOGRAFA SENHA
			String senhaCriptografada = Criptografia.converteSenhaParaMD5(cliente.getSenha());
			cliente.setSenha(senhaCriptografada);
		//CRIPTOGRAFA SENHA
		manager.getTransaction().begin();
		manager.persist(cliente);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Cliente cliente) {
		manager.getTransaction().begin();
		Cliente clienteRemover = new Cliente();
		clienteRemover = manager.find(Cliente.class, cliente.getId());
		manager.remove(clienteRemover);
		manager.getTransaction().commit();
		manager.close();
	}

	public Cliente buscarPorId(Long id) {
		Cliente cliente;
		manager.getTransaction().begin();
		cliente = manager.find(Cliente.class, id);
		manager.getTransaction().commit();
		manager.close();
		return cliente;
	}

	public Cliente buscaClienteUsuarioESenha(String usuario, String senha) {
		Cliente clienteEncontrado = new Cliente();
		//CRIPTOGRAFA SENHA 
			String senhaCriptogragada = Criptografia.converteSenhaParaMD5(senha);
		//CRIPTOGRAFA SENHA

		try {
			Query query = manager
					.createQuery("select c from Cliente c where c.usuario=:pUsuario and c.senha=:pSenha");
			query.setParameter("pUsuario", usuario);
			query.setParameter("pSenha", senhaCriptogragada);
			clienteEncontrado = (Cliente) query.getSingleResult();

			if (clienteEncontrado != null) {
				manager.close();
				return clienteEncontrado;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	
	public Cliente buscaNomeCliente(String nomeCliente) {
		Cliente clienteEncontrado = new Cliente();

		try {
			Query query = manager
					.createQuery("select c from Cliente c where c.nome=:pNome");
			query.setParameter("pNome", nomeCliente);
			clienteEncontrado = (Cliente) query.getSingleResult();
			manager.close(); // ultima modificação
			
			if (clienteEncontrado != null) {
				return clienteEncontrado;
			} else {
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		} 
	}

	public Cliente existeCliente(Cliente cliente) {
		Cliente clienteEncontrado = new Cliente();

		try {
			Query query = manager
					.createQuery("select c from Cliente c where c.usuario=:pUsuario and c.senha=:pSenha");
			query.setParameter("pUsuario", cliente.getUsuario());
			query.setParameter("pSenha", cliente.getSenha());
			clienteEncontrado = (Cliente) query.getSingleResult();

			if (clienteEncontrado != null) {
				manager.close();
				return clienteEncontrado;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listaCliente() {
		List<Cliente> clientes = new ArrayList<Cliente>();

		try {
			Query query = manager.createQuery("select c from Cliente c order by c.nome");

			clientes = (List<Cliente>) query.getResultList();

			if (clientes != null) {
				return clientes;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		} finally {
			manager.close();
		}
	}

	public void atualizar(Cliente cliente) {
		cliente.setDataAtualizacao(Calendar.getInstance());
		//CRIPTOGRAFA SENHA
			String senhaCriptografada = Criptografia.converteSenhaParaMD5(cliente.getSenha());
			cliente.setSenha(senhaCriptografada);
		//CRIPTOGRAFA SENHA
		manager.getTransaction().begin();
		manager.merge(cliente);
		manager.getTransaction().commit();
		manager.close();
	}
}