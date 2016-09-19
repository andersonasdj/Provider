package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.ComputadorDao;
import br.com.providerone.dao.EmailDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.mail.JavaMailApp;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Email;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Solicitacao;

@Controller
public class SolicitacaoController {

	@RequestMapping("/solicitacaoForm")
	public String solicitacaoForm(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			return "cliente/solicitacao-form";
		} if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionarioAtivo());
			model.addAttribute("clientes", daoCli.listaCliente());
			return "admin/solicitacao-form";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("salvarSolicitacao")
	public String salvarSolicitacao(Solicitacao solicitacao, HttpSession session) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			solicitacao.setStatus("Aberto");
			dao.salvaSolicitcao(solicitacao);
			return "redirect:home";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("salvarSolicitacaoAdmin")
	public String salvarSolicitacaoAdmin(Solicitacao solicitacao, String nomeDoCliente, String nomeDoFuncionario, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			ClienteDao daoCli = new ClienteDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Cliente clienteASalvar = daoCli.buscaNomeCliente(nomeDoCliente);
			Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
			SolicitacaoDao dao = new SolicitacaoDao();
			if(solicitacao.getStatus().equals("Abrir")){
				//JavaMailApp mail = new JavaMailApp();
				dao.salvaSolicitacaoAdmin(solicitacao, funcionarioASalvar, clienteASalvar);
				//mail.enviaEmail(clienteASalvar, solicitacao);
			}
			if(solicitacao.getStatus().equals("Agendar")){
				dao.salvaSolicitacaoAdminAgendado(solicitacao, funcionarioASalvar, clienteASalvar);
			}
			
			return "redirect:solicitacoesAbertas";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("finalizarSolicitacao")
	public String finalizarSolicitacao(Solicitacao solicitacao,
			HttpSession session) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			solicitacao.setStatus("Finalizado");
			dao.salvaSolicitcao(solicitacao);
			return "redirect:home";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/abertos")
	public String abertos(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAbertasPorId(cliente.getId()));
			
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}

	private String qtdSolicitacoesCliente(Model model, Cliente cliente) {
		Long ab, and, age;
		SolicitacaoDao daoAberto = new SolicitacaoDao();
		ab = daoAberto.listaQtdSolicitacoesAbertasPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAberto", ab);
		
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		age = daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAgendado", age);
		
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		and = daoAndamento.listaQtdSolicitacoesAndamentoPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAndamento", and);
		
		model.addAttribute("qtdTotal", ab + age + and);	
		return "cliente/solicitacao-aberto";
	}
	
	@RequestMapping("/agendados")
	public String agendados(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAgendadasPorId(cliente.getId()));
			
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/andamento")
	public String andamento(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAndamentoPorId(cliente.getId()));
			
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacoesTecnico")
	public String abertosTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
			
			return qtdSolicitacoesTecnico(model, funcionario);
		} else {
			return "redirect:login";
		}
	}

	private String qtdSolicitacoesTecnico(Model model, Funcionario funcionario) {
		SolicitacaoDao daoAberto = new SolicitacaoDao();
		model.addAttribute("qtdAberto", daoAberto.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		model.addAttribute("qtdAgendado", daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		model.addAttribute("qtdAndamento", daoAndamento.listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		model.addAttribute("qtdAguardando", daoAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));	
		return "funcionario/solicitacao-aberto";
	}
		
	@RequestMapping("/solicitacoesAgendadosTecnico")
	public String agendadosTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
			
			return qtdSolicitacoesTecnico(model, funcionario);
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/solicitacoesAndamentoTecnico")
	public String andamentoTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAndamentoPorIdDoTecnico(funcionario.getId()));
			
			return qtdSolicitacoesTecnico(model, funcionario);
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/solicitacoesAguardandoTecnico")
	public String aguardandoTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));
			
			return qtdSolicitacoesTecnico(model, funcionario);
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorio")
	public String relatorio(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes",dao.listaSolicitacoesPorId(cliente.getId()));
			return "cliente/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioGeral")
	public String relatorioGeral(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes());
			return "admin/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioFinalizadas")
	public String relatorioFinalizadas(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoesFinalizadas());
			return "admin/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioTecnico")
	public String relatorioTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes());
			return "funcionario/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacoesAbertas")
	public String solicitacoesAbertas(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAbertas());
			
			return qtdSolicitacoesFuncionario(model);
		} else {
			return "redirect:login";
		}
	}

	private String qtdSolicitacoesFuncionario(Model model) {
		Long ab, and, age, agua;
		
		SolicitacaoDao daoAbertas = new SolicitacaoDao();
		ab = daoAbertas.listaQtdSolicitacoesAbertas();
		model.addAttribute("qtdAberto",ab );
		
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		age = daoAgendadas.listaQtdSolicitacoesAgendadas();
		model.addAttribute("qtdAgendado",age );
		
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		and = daoAndamento.listaQtdSolicitacoesEmAndamento();
		model.addAttribute("qtdAndamento", and);
		
		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		agua = daoAguardando.listaQtdSolicitacoesAguardando();
		model.addAttribute("qtdAguardando", agua);
		model.addAttribute("qtdTotal", ab + age + and + agua);	
		return "admin/solicitacao-aberto";
	}
	
	@RequestMapping("/solicitacoesAgendadas")
	public String solicitacoesAgendadas(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAgendadas());
			
			return qtdSolicitacoesFuncionario(model);
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("solicitacoesAndamento")
	public String solicitacoesAndamento(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {		
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAndamento());
			
			return qtdSolicitacoesFuncionario(model);
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("solicitacoesAguardando")
	public String solicitacoesAguardando(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {	
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAguardando());
			
			return qtdSolicitacoesFuncionario(model);
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoEdit")
	public String funcionarioEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			model.addAttribute("solicitacao", solicitacaoEditada);
			model.addAttribute("funcionario", daoFun.listaFuncionarioAtivo());
			return "admin/solicitacao-edit";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoEditCliente")
	public String funcionarioEditCliente(Long id, HttpSession session,
			Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			model.addAttribute("solicitacao", solicitacaoEditada);
			return "cliente/solicitacao-edit";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoEditFuncionario")
	public String solicitacaoEditFuncionario(Long id, HttpSession session,
			Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			model.addAttribute("solicitacao", solicitacaoEditada);
			return "funcionario/solicitacao-edit";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/visualizaSolicitacao")
	public String visualuzaSolicitacaso(Long id, HttpSession session,
			Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			model.addAttribute("solicitacao", solicitacaoEditada);
			return "funcionario/solicitacao-ver";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacao")
	public String atualizarSolicitacao(Solicitacao solicitacao, String nomeDoFuncionario, HttpSession session) {
		
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
			
			if (solicitacao.getStatus().equals("Finalizar")) {
				dao.finalizaSolicitacao(solicitacao, funcionarioASalvar);	
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Finalizado")) {
				dao.atualizarSolicitacaoFinalizada(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Aberto")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Agendado")) {
				dao.agendarSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesAbertas";
			} 
			if (solicitacao.getStatus().equals("Em andamento")) {
				dao.solicitacaoEmAndamento(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Aguardando usuario")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesAbertas";
			}else {
				return "redirect:solicitacoesAbertas";
			}
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacaoCliente")
	public String atualizarSolicitacaoCLiente(Solicitacao solicitacao,
			HttpSession session) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			dao.atualizarSolicitacaoCliente(solicitacao);
			return "redirect:abertos";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/atualizarSolicitacaoFuncionario")
	public String atualizarSolicitacaoFuncionario(Solicitacao solicitacao, String nomeDoFuncionario,  HttpSession session) {
		
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
			
			if (solicitacao.getStatus().equals("Finalizar")) {
				dao.finalizaSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesTecnico";
			}
			if (solicitacao.getStatus().equals("Aberto")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesTecnico";
			}
			if (solicitacao.getStatus().equals("Em andamento")) {
				dao.solicitacaoEmAndamento(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesTecnico";
			}
			if (solicitacao.getStatus().equals("Agendado")) {
				dao.solicitacaoAgendado(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesTecnico";
			}
			if (solicitacao.getStatus().equals("Aguardando usuario")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar);
				return "redirect:solicitacoesTecnico";
			} else {
				return "redirect:solicitacoesTecnico";
			}
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/removeSolicitacao")
	public String removeSolicitacao(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			dao.excluiSolicitacaoPorId(id);
			return "redirect:solicitacoesAbertas";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("enviaEmail")
	public String enviaEmail(Long id,
			HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacao = dao.salvaSolicitacaoEmail(id);
			EmailDao emailDao = new EmailDao();
			Email emailConfig = emailDao.listaEmailConfigAbertura();
			JavaMailApp mail = new JavaMailApp(emailConfig);
			mail.enviaEmail(solicitacao.getCliente(), solicitacao);
			return "redirect:solicitacoesAbertas";
		} else {
			return "redirect:solicitacoesAbertas";
		}
	}
	
	@RequestMapping("/solicitacoesResumo")
	public String solicitacoesResumo(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes());
			return "admin/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioSelect")
	public String relatorioSelect(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("clientes", daoCli.listaCliente());
			return "admin/cliente-gera-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioOpcoes")
	public String relatorioOpcoes(HttpSession session, String nomeDoCliente, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			model.addAttribute("nomeDoCliente", nomeDoCliente);	
			ClienteDao daoCli = new ClienteDao();
			Cliente clienteEncontrado = daoCli.buscaNomeCliente(nomeDoCliente);

			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			model.addAttribute("qtdSolicitacoes", daoSolicitacao.listaQtdSolicitacoesPorIdDoCliente(clienteEncontrado.getId()));	
		
			ComputadorDao daoComputador = new ComputadorDao();
			model.addAttribute("qtdComputador", daoComputador.listaQtdComputadoresPorIdDoCliente(clienteEncontrado.getId()));
			return "admin/cliente-opcoes-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioPorCliente")
	public String relatorioPorCliente(HttpSession session, String nomeDoCliente, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			ClienteDao daoCli = new ClienteDao();
			Cliente clienteSelecionado = daoCli.buscaNomeCliente(nomeDoCliente);
			
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorId(clienteSelecionado.getId()));
			return "admin/cliente-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioSelectTec")
	public String relatorioSelectTec(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionario());
			return "admin/funcionario-gera-relatorio";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/relatorioPorFuncionario")
	public String relatorioPorFuncionario(HttpSession session, String nomeDoFuncionario, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Funcionario funiconarioSelecionado = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
			
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorIdTec(funiconarioSelecionado.getId()));
			return "admin/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}
}