package br.com.providerone.dao;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import br.com.providerone.data.Data;
import br.com.providerone.entitymanager.EntityFactory;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Solicitacao;



public class SolicitacaoDao {
	EntityManager manager;

	public SolicitacaoDao() {
		new EntityFactory();
		manager = EntityFactory.getEntityManager();
	}

	public void salvaSolicitcao(Solicitacao solicitacao) {
		solicitacao.setDataAbertura(Calendar.getInstance());
		manager.getTransaction().begin();
		manager.persist(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public Solicitacao salvaSolicitacaoEmail(Long id) {
		manager.getTransaction().begin();
		Solicitacao solicitacao = new Solicitacao(); 
		solicitacao = manager.find(Solicitacao.class, id);
		solicitacao.setStatusEmail("Email enviado");
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
		return solicitacao;
	}
	
	public void salvaSolicitacaoAdmin(Solicitacao solicitacao, Funcionario funcionario, Cliente cliente) {
//		solicitacao.setDataAbertura(Calendar.getInstance());
//		solicitacao.setStatus("Aberto");
		solicitacao.setFuncionario(funcionario);
		solicitacao.setCliente(cliente);
		manager.getTransaction().begin();
		manager.persist(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	public void salvaSolicitacaoAdminAgendado(Solicitacao solicitacao, Funcionario funcionario, Cliente cliente) {
//		solicitacao.setDataAbertura(Calendar.getInstance());
//		solicitacao.setStatus("Agendado");
		solicitacao.setFuncionario(funcionario);
		solicitacao.setCliente(cliente);
		manager.getTransaction().begin();
		manager.persist(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSolicitacao(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado, String nomeDoCliente){
		manager.getTransaction().begin();
		Solicitacao solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		
		if(nomeDoCliente != null) {
			Cliente cliente = new Cliente();
			ClienteDao clienteDao = new ClienteDao();
			cliente = clienteDao.buscaNomeCliente(nomeDoCliente);
			
			solicitacao.setCliente(cliente);
		}
		
		//System.out.println("Pause!!");
		Data data = new Data();
		Long minutos;
		if(solicitacaoEncontrada.getStatus().equals("Aberto") || solicitacaoEncontrada.getStatus().equals("Aguardando") || solicitacaoEncontrada.getStatus().equals("N�o Classificado")){
			minutos = 0l;
		}else if(solicitacaoEncontrada.getStatus().equals("Agendado")){ //EM OBS
			minutos = 0l;
			solicitacao.setAgendado(null);
			solicitacao.setAgendadoHora(null);
			
		}else{
			minutos = data.difMin(Calendar.getInstance(), solicitacaoEncontrada.getDataAndamento());
		}
		
		if(solicitacaoEncontrada.getMinutos() == null){
			solicitacao.setMinutos(minutos);
			//System.out.println("minutos = null");
		}else{
			//System.out.println("minutos != de null");
			Long minutosAtuais = solicitacaoEncontrada.getMinutos();
			//System.out.println(minutosAtuais);
			solicitacao.setMinutos(minutosAtuais + minutos);
		}
		
		solicitacao.setFuncionario(funcionario);
		solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		solicitacao.setSenha(solicitacaoEncontrada.getSenha());
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		solicitacao.setCaminhoAnexo(solicitacaoEncontrada.getCaminhoAnexo());
		//TESTE
		if(solicitacaoEncontrada.getIdChamadoLigacao() != null) {
			solicitacao.setIdChamadoLigacao(solicitacaoEncontrada.getIdChamadoLigacao());
		}
		//TESTE
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.getAndamentoDoChamado());
		solicitacao.setAndamentoDoChamado(solicitacao.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSolicitacaoFinalizada(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado){
		manager.getTransaction().begin();
		Solicitacao solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		solicitacao.setFuncionario(funcionario);
		solicitacao.setDataFechamento(solicitacaoEncontrada.getDataFechamento());
		solicitacao.setDataAndamento(solicitacaoEncontrada.getDataAndamento());
		//solicitacao.setDiasDur(solicitacaoEncontrada.getDiasDur());
		//solicitacao.setHorasDur(solicitacaoEncontrada.getHorasDur());
		//solicitacao.setMinutosDur(solicitacaoEncontrada.getMinutosDur());
		solicitacao.setTempoDeAndamento(solicitacaoEncontrada.getTempoDeAndamento());
		solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		solicitacao.setSenha(solicitacaoEncontrada.getSenha());
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		solicitacao.setCaminhoAnexo(solicitacaoEncontrada.getCaminhoAnexo());
		solicitacao.setIdChamadoLigacao(solicitacaoEncontrada.getIdChamadoLigacao());
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSolicitacaoCliente(Solicitacao solicitacao){
		manager.getTransaction().begin();
		Solicitacao solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSolicitacao(Solicitacao solicitacao){
		manager.getTransaction().begin();
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void excluiSolicitacao(Solicitacao solicitacao) {
		manager.getTransaction().begin();
		manager.remove(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void excluiSolicitacaoPorId(Long id) {
		Solicitacao solicitacao = new Solicitacao();
		manager.getTransaction().begin();
		solicitacao = manager.find(Solicitacao.class, id);
		solicitacao.setExcluido(true);
		solicitacao.setDataAndamento(Calendar.getInstance());
		solicitacao.setDataFechamento(Calendar.getInstance());
		solicitacao.setStatus("Excluida");
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void solicitacaoEmAndamento(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado, String nomeDoCliente){
		Solicitacao solicitacaoEncontrada = new Solicitacao();
		manager.getTransaction().begin();
		solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		if(nomeDoCliente != null) {
			Cliente cliente = new Cliente();
			ClienteDao clienteDao = new ClienteDao();
			cliente = clienteDao.buscaNomeCliente(nomeDoCliente);
			
			solicitacao.setCliente(cliente);
		}
		
		//N�o muda data de Andamento
		if(solicitacao.getStatus().equals(solicitacaoEncontrada.getStatus())){
			solicitacao.setDataAndamento(solicitacaoEncontrada.getDataAndamento());
			if(solicitacao.isPlay() == solicitacaoEncontrada.isPlay()){
				
			}else{
				if(solicitacao.isPlay()){ 
					//Solicita��o tirada de pause
					solicitacao.setDataAndamento(Calendar.getInstance());
					solicitacao.setMinutos(solicitacaoEncontrada.getMinutos());
				}else {
					//Solicita��o pausada
					Data data = new Data();
					Long minutos = data.difMin(Calendar.getInstance(), solicitacaoEncontrada.getDataAndamento());
					if(solicitacaoEncontrada.getMinutos() == null){
						solicitacao.setMinutos(minutos);
					}else{
						//Minutos j� contabilizados s�o somados aos novos minutos utilizados.
						Long minutosAtuais = solicitacaoEncontrada.getMinutos();
						solicitacao.setMinutos(minutosAtuais + minutos);
					}
				}
			}
		}else{
			if(solicitacaoEncontrada.getStatus().equals("Aguardando")){
				//ALterado de Aguardando para Andamento.
				solicitacao.setDataAndamento(Calendar.getInstance());
				solicitacao.setMinutos(solicitacaoEncontrada.getMinutos());
			} else{
				solicitacao.setDataAndamento(Calendar.getInstance());
			}
		}
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		solicitacao.setStatus("Em andamento");
		solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		solicitacao.setFuncionario(funcionario);
		solicitacao.setSenha(solicitacaoEncontrada.getSenha());
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		solicitacao.setCaminhoAnexo(solicitacaoEncontrada.getCaminhoAnexo());
		//TESTE
		if(solicitacaoEncontrada.getIdChamadoLigacao() != null) {
			solicitacao.setIdChamadoLigacao(solicitacaoEncontrada.getIdChamadoLigacao());
		}
		//TESTE
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.getAndamentoDoChamado());
		solicitacao.setAndamentoDoChamado(solicitacao.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void solicitacaoAgendado(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado){
		Solicitacao solicitacaoEncontrada = new Solicitacao();
		manager.getTransaction().begin();
		solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacao.setDataAndamento(Calendar.getInstance());
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		solicitacao.setStatus("Agendado");
		solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		solicitacao.setFuncionario(funcionario);
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		solicitacao.setCaminhoAnexo(solicitacaoEncontrada.getCaminhoAnexo());
		//Atualiza LOG	
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.getAndamentoDoChamado());
		solicitacao.setAndamentoDoChamado(solicitacao.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void agendarSolicitacao(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado, String nomeDoCliente){
		Solicitacao solicitacaoEncontrada = new Solicitacao();
		manager.getTransaction().begin();
		solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		solicitacao.setStatus("Agendado");
		solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		solicitacao.setFuncionario(funcionario);
		solicitacao.setSenha(solicitacaoEncontrada.getSenha());
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		solicitacao.setCaminhoAnexo(solicitacaoEncontrada.getCaminhoAnexo());
		
		if(nomeDoCliente != null) {
			Cliente cliente = new Cliente();
			ClienteDao clienteDao = new ClienteDao();
			cliente = clienteDao.buscaNomeCliente(nomeDoCliente);
			
			solicitacao.setCliente(cliente);
		}
		
		//TESTE
		if(solicitacaoEncontrada.getIdChamadoLigacao() != null) {
			solicitacao.setIdChamadoLigacao(solicitacaoEncontrada.getIdChamadoLigacao());
		}
		//TESTE
		
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.getAndamentoDoChamado());
		solicitacao.setAndamentoDoChamado(solicitacao.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public Solicitacao buscaSolicitacaoId(Long id){
		Solicitacao solicitacaoEncontrada = new Solicitacao();
		manager.getTransaction().begin();
		solicitacaoEncontrada = manager.find(Solicitacao.class, id);
		manager.getTransaction().commit();
		manager.close();
		return solicitacaoEncontrada;
	}

	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesAbertasPorId(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAgendadasPorId(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAguardandoPorId(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Aguardando usu�rio");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAndamentoPorId(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAbertasPorIdDoTecnico(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAgendadasPorIdDoTecnico(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAndamentoPorIdDoTecnico(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAguardandoPorIdDoTecnico(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pStatus", "Aguardando");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	
	public Long listaQtdSolicitacoesAbertasPorIdDoTecnico(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.classificacao!=:pClassificacao and s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesNaoClass() {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.classificacao!=:pClassificacao and s.excluido!=:pExcluido");
			query.setParameter("pStatus", "N�o Classificado");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAbertas() {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.classificacao!=:pClassificacao and s.excluido!=:pExcluido");
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAguardando() {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus  and s.classificacao!=:pClassificacao and s.excluido!=:pExcluido");
			query.setParameter("pStatus", "Aguardando");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAgendadasPorIdDoTecnico(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.classificacao!=:pClassificacao and s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAgendadas() {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus  and s.classificacao!=:pClassificacao and s.excluido!=:pExcluido");
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.classificacao!=:pClassificacao and s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAguardandoPorIdDoTecnico(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.classificacao!=:pClassificacao and s.status=:pStatus and s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Aguardando");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesEmAndamento() {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus  and s.classificacao!=:pClassificacao and s.excluido!=:pExcluido");
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
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
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesPorId(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.cliente.id=:pClienteId and s.excluido!=:pExcluido order by s.id desc");
			query.setParameter("pClienteId", id);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> relatorioGeralPorIdCliente(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.cliente.id=:pClienteId and s.status!=:pStatus and s.excluido!=:pExcluido order by s.id desc");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorIdTec(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.funcionario.id=:pFuncionarioId and s.excluido!=:pExcluido order by s.id desc");
			query.setParameter("pFuncionarioId", id);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		} 
	}
	
	// FILTRANDO CHAMADOS DE BACKUP *****************
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaTodasSolicitacoes() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.classificacao!=:pClassificacao and s.status!=:pStatus and s.excluido!=:pExcluido order by s.id desc", Solicitacao.class);
			
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pExcluido", true);
			
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	
	//##############################  BUSCA TODAS AS SOLICITACOES COM QUERY OTIMIZADA E RETORNANDO SOMENTE O NECESSARIO ############################## 
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaTodasSolicitacoesFiltro() {
		try {
			final String jpql = "SELECT NEW br.com.providerone.modelo.Solicitacao("
					+ "s.id, "
					+ "s.dataAbertura,"
					+ "s.prioridade,"
					+ "s.abriuChamado,"
					+ "s.onsiteOffsite,"
					+ "s.caminhoAnexo,"
					+ "s.cliente,"			//Tabela Cliente
					+ "s.solicitante,"
					+ "s.usuario,"
					+ "s.descricaoProblema,"
					+ "s.resolucao,"
					+ "s.obs,"
					+ "s.classificacao,"
					+ "s.status,"
					+ "s.dataFechamento,"
					+ "s.dataAndamento,"
					+ "s.agendado,"
					+ "s.agendadoHora,"
					+ "s.play,"
					//+ "s.funcionario,"		//Tabela Funcionario - Se esse atributo estiver NULL ele ignora a linha (esse pode em algum momento ser Null);
					+ "case when s.funcionario is null then s.funcionario else s.funcionario.id end as nullOrderer) "
					+ "FROM Solicitacao s where s.classificacao!=:pClassificacao and s.status!=:pStatus and s.excluido!=:pExcluido order by s.id";
			
			Query query = manager.createQuery(jpql, Solicitacao.class);
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pExcluido", true);
			
			System.out.println(jpql);
			
			List<Solicitacao> solicitacaos = query.getResultList();
				
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	//##############################  BUSCA TODAS AS SOLICITACOES COM QUERY OTIMIZADA E RETORNANDO SOMENTE O NECESSARIO ############################## 
	
	
	//*******************************************************
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesPorDataMedia(Date inicio, Date fim) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
			try {
				System.out.println("dao data");
				Query query = manager.createQuery("select s from Solicitacao s where s.dataAbertura between :inicio and :fim and s.excluido!=:pExcluido");  
				query.setParameter("inicio", inicio);     
				query.setParameter("fim", fim);
				query.setParameter("pExcluido", true);
				solicitacaos = (List<Solicitacao>) query.getResultList();
				System.out.println(solicitacaos);
				return solicitacaos;
				
			} catch (Exception e) {
				manager.close();
				return null;
			}
	}
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaTodasSolicitacoesFinalizadas() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id desc");
			
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pExcluido", true);
			
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAbertas() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id");
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAgendadas() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id");
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAndamento() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id");
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesNaoClassificado() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id");
			query.setParameter("pStatus", "N�o Classificado");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesAguardando() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.status=:pStatus and s.excluido!=:pExcluido order by s.id");
			query.setParameter("pStatus", "Aguardando");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		} 
	}
	
	public Long listaQtdSolicitacoesAbertasPorIdDoCliente(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Aberto");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAgendadasPorIdDoCliente(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Agendado");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAndamentoPorIdDoCliente(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Em andamento");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesAguardandoPorIdDoCliente(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.status=:pStatus and s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pStatus", "Aguardando usu�rio");
			query.setParameter("pExcluido", true);
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
	
	public Long listaQtdSolicitacoesPorIdDoCliente(Long id) {
		try {
			Query query = manager
					.createQuery("select count(s) from Solicitacao s where s.cliente.id=:pClienteId and s.excluido!=:pExcluido");
			query.setParameter("pClienteId", id);
			query.setParameter("pExcluido", true);
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
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesPorData(Calendar dataAbertura) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataAbertura > :pData and s.excluido!=:pExcluido");
			
			query.setParameter("pData", dataAbertura, TemporalType.DATE);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorDataFinalizacao(Calendar dataAbertura) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataFechamento > :pData and s.excluido!=:pExcluido");
			
			query.setParameter("pData", dataAbertura, TemporalType.DATE);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	//#######################################################################
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesAtualizadasHoje(Calendar dataAbertura) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataAtualizacao > :pData");
			
			query.setParameter("pData", dataAbertura, TemporalType.DATE);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesExcluidas() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.excluido=:pExcluido");
			
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	//#######################################################################
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesPorDataFinalizacaoFuncionario(Calendar dataAbertura, String funcionario) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.funcionario.nome = :pFuncionario and s.status=:pStatus and s.dataFechamento > :pData and s.excluido!=:pExcluido");
			
			query.setParameter("pFuncionario", funcionario);
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pData", dataAbertura, TemporalType.DATE);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	//##########################################################################################
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listaSolicitacoesPorAssunto(String assunto) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.descricaoProblema LIKE :pAssunto or s.resolucao LIKE :pAssunto and s.excluido!=:pExcluido");
			
			query.setParameter("pAssunto", "%"+assunto+"%");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorPeriodoFechamento(Calendar dataInicio, Calendar dataFim) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataFechamento > :pDataInicio and s.dataFechamento < :pDataFim and s.excluido!=:pExcluido");
			
			query.setParameter("pDataInicio", dataInicio, TemporalType.DATE);
			query.setParameter("pDataFim", dataFim, TemporalType.DATE);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorPeriodoAbertura(Calendar dataInicio, Calendar dataFim) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataAbertura > :pDataInicio and s.dataAbertura < :pDataFim and s.excluido!=:pExcluido");
			
			query.setParameter("pDataInicio", dataInicio, TemporalType.DATE);
			query.setParameter("pDataFim", dataFim, TemporalType.DATE);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorAgendamento(Calendar dataInicio) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		String agendado = "Agendado";
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.agendado = :pDataInicio and s.status = :pStatus and s.excluido!=:pExcluido");
			
			query.setParameter("pDataInicio", dataInicio, TemporalType.DATE);
			query.setParameter("pStatus", agendado);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorIdSolicitacao(Long id) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.id=:pId and s.excluido!=:pExcluido order by s.id desc");
			query.setParameter("pId", id);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorPeriodoAberturaCliente(Calendar dataInicio, Calendar dataFim, String nomeDoCliente) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataAbertura > :pDataInicio and s.dataAbertura < :pDataFim and s.cliente.nome = :pNomeDoCliente and s.excluido!=:pExcluido");
			
			query.setParameter("pDataInicio", dataInicio, TemporalType.DATE);
			query.setParameter("pDataFim", dataFim, TemporalType.DATE);
			query.setParameter("pNomeDoCliente", nomeDoCliente);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorPeriodoFechamentoCliente(Calendar dataInicio, Calendar dataFim, String nomeDoCliente) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.dataFechamento > :pDataInicio and s.dataFechamento < :pDataFim and s.cliente.nome = :pNomeDoCliente and s.excluido!=:pExcluido");
			
			query.setParameter("pDataInicio", dataInicio, TemporalType.DATE);
			query.setParameter("pDataFim", dataFim, TemporalType.DATE);
			query.setParameter("pNomeDoCliente", nomeDoCliente);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
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
	public List<Solicitacao> listaSolicitacoesPorAgendamentoAtrasado(Calendar data) {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		String agendado = "Agendado";
		
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.agendado < :pData and s.status = :pStatus and s.excluido!=:pExcluido");
			
			query.setParameter("pData", data, TemporalType.DATE);
			query.setParameter("pStatus", agendado);
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
	
	public Solicitacao atualizaDataSolicitacao(Long id, Calendar dataAbertura, Calendar dataAndamento) {
		manager.getTransaction().begin();
		Solicitacao solicitacao = new Solicitacao(); 
		solicitacao = manager.find(Solicitacao.class, id);
		solicitacao.setDataAbertura(dataAbertura);
		solicitacao.setDataAndamento(dataAndamento);
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
		return solicitacao;
	}
	
	public Solicitacao atualizaDataSolicitacao(Long id, Calendar dataAbertura) {
		manager.getTransaction().begin();
		Solicitacao solicitacao = new Solicitacao(); 
		solicitacao = manager.find(Solicitacao.class, id);
		solicitacao.setDataAbertura(dataAbertura);
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
		return solicitacao;
	}
	
	public void finalizaSolicitacao(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado) {	
		manager.getTransaction().begin();
		Solicitacao solicitacaoFinalizada = manager.find(Solicitacao.class, solicitacao.getId());
		solicitacaoFinalizada.setDataFechamento(Calendar.getInstance());
		solicitacaoFinalizada.setStatus("Finalizado");
		solicitacaoFinalizada.setResolucao(solicitacao.getResolucao());
		solicitacaoFinalizada.setObs(solicitacao.getObs());
		solicitacaoFinalizada.setFuncionario(funcionario);
		solicitacaoFinalizada.setSolicitante(solicitacao.getSolicitante()); //###
		solicitacaoFinalizada.setUsuario(solicitacao.getUsuario()); //###
		solicitacaoFinalizada.setDataAtualizacao(Calendar.getInstance()); //###
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoFinalizada.getAndamentoDoChamado());
		solicitacaoFinalizada.setAndamentoDoChamado(solicitacao.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		//Tempo Total
		Data daoData = new Data();
		Long tempoTotal = daoData.difMin(Calendar.getInstance(), solicitacaoFinalizada.getDataAndamento());
		if(solicitacaoFinalizada.getMinutos() != null){
			tempoTotal = tempoTotal + solicitacaoFinalizada.getMinutos();
			solicitacaoFinalizada.setTempoDeAndamento(daoData.geraTempo(tempoTotal));
		} else{
			if(solicitacaoFinalizada.getDataAndamento()!=null){
				solicitacaoFinalizada.setTempoDeAndamento(daoData.geraTempoTotal(solicitacaoFinalizada.getDataFechamento(), solicitacaoFinalizada.getDataAndamento()));
			}
		}
		solicitacaoFinalizada.setMinutos(tempoTotal);
		//Tempo Total
		//solicitacaoFinalizada.setDiasDur(daoData.difDias(Calendar.getInstance(), solicitacaoFinalizada.getDataAbertura()));
		//solicitacaoFinalizada.setHorasDur(daoData.difHoras(Calendar.getInstance(), solicitacaoFinalizada.getDataAbertura()));
		//solicitacaoFinalizada.setMinutosDur(daoData.difMin(Calendar.getInstance(), solicitacaoFinalizada.getDataAbertura()));
		//Refatorar para remover esse if abaixo
		manager.persist(solicitacaoFinalizada);
		manager.getTransaction().commit();
		manager.close();
	}
	
	public void atualizarSolicitacaoCompleta(Solicitacao solicitacao, Funcionario funcionario, String funcionarioLogado){
		manager.getTransaction().begin();
		Solicitacao solicitacaoEncontrada = manager.find(Solicitacao.class, solicitacao.getId());
		//solicitacao.setDataAbertura(solicitacaoEncontrada.getDataAbertura());
		solicitacao.setFuncionario(funcionario);
		//System.out.println("Abriu chamado em DAO: " + solicitacao.getAbriuChamado());
		//solicitacao.setDataFechamento(solicitacaoEncontrada.getDataFechamento());
		//solicitacao.setDataAndamento(solicitacaoEncontrada.getDataAndamento());
		//solicitacao.setDiasDur(solicitacaoEncontrada.getDiasDur());
		//solicitacao.setHorasDur(solicitacaoEncontrada.getHorasDur());
		//solicitacao.setMinutosDur(solicitacaoEncontrada.getMinutosDur());
		solicitacao.setTempoDeAndamento(solicitacaoEncontrada.getTempoDeAndamento());
		solicitacao.setDataAtualizacao(Calendar.getInstance()); //###
		Data daoData = new Data();
		if(solicitacao.getDataAndamento()!=null){
			solicitacao.setTempoDeAndamento(daoData.geraTempoTotal(solicitacao.getDataFechamento(), solicitacao.getDataAndamento()));
		}
		//solicitacao.setStatusEmail(solicitacaoEncontrada.getStatusEmail());
		//Atualiza LOG
		solicitacao.setAndamentoDoChamado(solicitacaoEncontrada.atualizaLogSolicitacao(funcionario, funcionarioLogado));
		//Atualiza LOG
		manager.merge(solicitacao);
		manager.getTransaction().commit();
		manager.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<Solicitacao> listarSolicitacoesBackupNaoConcluidas() {
		List<Solicitacao> solicitacaos = new ArrayList<Solicitacao>();
		try {
			Query query = manager
					.createQuery("select s from Solicitacao s where s.classificacao=:pClassificacao and s.status!=:pStatus and s.excluido!=:pExcluido order by s.id desc");
			
			query.setParameter("pStatus", "Finalizado");
			query.setParameter("pClassificacao", "Backup");
			query.setParameter("pExcluido", true);
			solicitacaos = (List<Solicitacao>) query.getResultList();
			if (solicitacaos != null) {
				manager.close();
				return solicitacaos;
			} else {
				manager.close();
				return null;
			}
		} catch (Exception e) {
			manager.close();
			return null;
		}
	}
}