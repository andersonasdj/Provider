package br.com.providerone.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import br.com.providerone.criptografia.Criptografia;
import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Funcionario;

@Component
public class FuncionarioDao {
	
	EntityManager manager;

	public FuncionarioDao() {	
			new EntityFactory();
			manager = EntityFactory.getEntityManager();
	}

	public void salvar(Funcionario funcionario) {
		funcionario.setDataAtualizacao(Calendar.getInstance());
		//CRIPTOGRAFA SENHA
			String senhaCriptografada = Criptografia.converteSenhaParaMD5(funcionario.getSenha());
			funcionario.setSenha(senhaCriptografada);
		//CRIPTOGRAFA SENHA
		funcionario.setStatus("Ativo");
		manager.getTransaction().begin();
		manager.persist(funcionario);
		manager.getTransaction().commit();
		manager.close();
	}

	public void excluir(Funcionario funcionario) {
		manager.getTransaction().begin();
		manager.remove(funcionario);
		manager.getTransaction().commit();
		manager.close();
	}

	public Funcionario buscarPorId(Long id) {
		Funcionario funcionario;
		manager.getTransaction().begin();
		funcionario = manager.find(Funcionario.class, id);
		manager.getTransaction().commit();
		manager.close();
		return funcionario;
	}
	
	/*public Funcionario buscarPorIdeSalvaDataLogin(Long id) {
		Funcionario funcionario;
		manager.getTransaction().begin();
		funcionario = manager.find(Funcionario.class, id);
		funcionario.setUltimoLogin(Calendar.getInstance());
		funcionario.setMfa(0);
		manager.persist(funcionario);
		manager.getTransaction().commit();
		manager.close();
		return funcionario;
	}*/
	
	public Funcionario buscarPorIdeSalvaDataLogin(Long id, String ip) {
		Funcionario funcionario;
		manager.getTransaction().begin();
		funcionario = manager.find(Funcionario.class, id);
		funcionario.setUltimoLogin(Calendar.getInstance());
		funcionario.setMfa(0);
		funcionario.setIp(ip);
		manager.persist(funcionario);
		manager.getTransaction().commit();
		manager.close();
		return funcionario;
	}

	public void atualizar(Funcionario funcionario) {
		funcionario.setDataAtualizacao(Calendar.getInstance());
		
		manager.getTransaction().begin();
		manager.merge(funcionario);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSenha(Funcionario funcionario) {
		
		funcionario.setDataAtualizacao(Calendar.getInstance());
		//CRIPTOGRAFA SENHA
			String senhaCriptografada = Criptografia.converteSenhaParaMD5(funcionario.getSenha());
			funcionario.setSenha(senhaCriptografada);
		//CRIPTOGRAFA SENHA
		manager.getTransaction().begin();
		manager.merge(funcionario);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarMfa(Funcionario funcionario, int num) {
		
		funcionario.setMfa(num);
		manager.getTransaction().begin();
		manager.merge(funcionario);
		manager.getTransaction().commit();
		manager.close();
	}
	
	
	public Funcionario existeFuncionario(Funcionario funcionario) {
		Funcionario funcionarioEncontrado = new Funcionario();

		try {
			Query query = manager
					.createQuery("select f from Funcionario f where f.usuario=:pUsuario and f.senha=:pSenha");
			query.setParameter("pUsuario", funcionario.getUsuario());
			query.setParameter("pSenha", funcionario.getSenha());
			funcionarioEncontrado = (Funcionario) query.getSingleResult();

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
	
	public Funcionario buscaFuncionarioUsuarioESenha(String usuario, String senha) {
		Funcionario funcionarioEncontrado = new Funcionario();	
		//CRIPTOGRAFA SENHA 
			String senhaCriptogragada = Criptografia.converteSenhaParaMD5(senha);
		//CRIPTOGRAFA SENHA
		
		try {
			Query query = manager
					.createQuery("select f from Funcionario f where f.usuario=:pUsuario and f.senha=:pSenha");
			query.setParameter("pUsuario", usuario);
			query.setParameter("pSenha", senhaCriptogragada);
			funcionarioEncontrado = (Funcionario) query.getSingleResult();

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

	public Funcionario buscaNomeFuncionario(String funcionarioNome) {
		Funcionario funcionarioEncontrado = new Funcionario();

		try {
			Query query = manager
					.createQuery("select f from Funcionario f where f.nome=:pNome");
			query.setParameter("pNome", funcionarioNome);
			funcionarioEncontrado = (Funcionario) query.getSingleResult();

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
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> listaFuncionario() {
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();

		try {
			Query query = manager.createQuery("select f from Funcionario f order by f.nome");

			funcionarios = (List<Funcionario>) query.getResultList();

			if (funcionarios != null) {
				return funcionarios;
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
	public List<Funcionario> listaFuncionarioAtivo() {
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();

		try {
			Query query = manager.createQuery("select f from Funcionario f where f.status=:pStatus order by f.nome");
			query.setParameter("pStatus", "Ativo");
			funcionarios = (List<Funcionario>) query.getResultList();

			if (funcionarios != null) {
				return funcionarios;
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