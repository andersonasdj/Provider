package br.com.providerone.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import br.com.providerone.modelo.Relatorio;
import br.com.providerone.modelo.Solicitacao;

@Controller
public class SolicitacaoController {

	@RequestMapping("/solicitacaoForm")
	public String solicitacaoForm(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");
		if (session.getAttribute("clienteLogado") != null) {
			return "Cliente/solicitacao-form";
		}
		if (funcionario != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionarioAtivo());
			model.addAttribute("clientes", daoCli.listaClienteAtivo());
			return funcionario.getFuncao() + "/solicitacao-form";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoModeloForm")
	public String solicitacaoModeloForm(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");
		if (session.getAttribute("clienteLogado") != null) {
			return "Cliente/solicitacao-form";
		}
		if (funcionario != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionarioAtivo());
			model.addAttribute("clientes", daoCli.listaClienteAtivo());
			return funcionario.getFuncao() + "/solicitacao-modelo-form";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("salvarSolicitacao")
	public String salvarSolicitacaoAdmin(Solicitacao solicitacao, String nomeDoCliente, String nomeDoFuncionario,
			boolean boxEmail, String destinatario, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			if (boxEmail != false && destinatario != "") {
				solicitacao.setStatusEmail("E-mail enviado");
				GravaSolicTecAdmin(solicitacao, nomeDoCliente, nomeDoFuncionario);
				EmailDao daoEmail = new EmailDao();
				Email email = daoEmail.listaEmailConfigEnvia("Abertura");
				JavaMailApp javaMailApp = new JavaMailApp(email);
				javaMailApp.enviaEmailAbertura(nomeDoCliente, solicitacao, destinatario);
				return "redirect:solicitacoesAbertas";
			}
			GravaSolicTecAdmin(solicitacao, nomeDoCliente, nomeDoFuncionario);
			return "redirect:solicitacoesAbertas";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			solicitacao.setExcluido(false);
			GravaSolicTecAdmin(solicitacao, nomeDoCliente, nomeDoFuncionario);
			return "redirect:solicitacoesAbertas";
		}
		if (session.getAttribute("clienteLogado") != null) { // EM OBS
			SolicitacaoDao dao = new SolicitacaoDao();
			solicitacao.setStatus("Aberto");
			solicitacao.setExcluido(false);
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			solicitacao.setDataAbertura(Calendar.getInstance());
			solicitacao.setAbriuChamado(cliente.getNome());
			solicitacao.setFormaAbertura("Aberto pelo cliente");
			String log = solicitacao.geraLogSolicitacao(null, cliente);
			solicitacao.setSenha(solicitacao.geraSenha());
			solicitacao.setAndamentoDoChamado(log);
			solicitacao.setClassificacao("Solicita��o");
			dao.salvaSolicitcao(solicitacao);
			return "redirect:home";
		} else {
			return "redirect:login";
		}
	}

	// #####################################################################

	@RequestMapping("salvarSolicitacaoModelo")
	public String salvarSolicitacaoModelo(Solicitacao solicitacao, String nomeDoCliente, String nomeDoFuncionario,
			boolean boxEmail, String destinatario, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {

			if (solicitacao.getClassificacao().equals("Entrada de Colaborador")) {
				Solicitacao solicitacao1 = new Solicitacao();
				Solicitacao solicitacao2 = new Solicitacao();
				solicitacao1.setDescricaoProblema("Entrada de Colaborador: 1. Criação de acessos"
						+ "(e-mail, Active Directory, Sistemas diversos). Associação em grupos de distribuição");
				solicitacao1.setOnsiteOffsite("Offsite");
				solicitacao1.setSolicitante(solicitacao.getSolicitante());
				solicitacao1.setUsuario(solicitacao.getUsuario());
				solicitacao1.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao1.setPrioridade(solicitacao.getPrioridade());
				solicitacao1.setStatus("Aberto");
				solicitacao1.setNivelDeIncidencia("Solicitação");
				solicitacao1.setClassificacao("Software");
				solicitacao1.setPlay(false);
				GravaSolicModelo(solicitacao1, nomeDoCliente, nomeDoFuncionario);
				
				solicitacao2.setDescricaoProblema("Entrada de Colaborador: 2. Configuração de computador para novo usuário");
				solicitacao2.setOnsiteOffsite("Offsite");
				solicitacao2.setSolicitante(solicitacao.getSolicitante());
				solicitacao2.setUsuario(solicitacao.getUsuario());
				solicitacao2.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao2.setPrioridade(solicitacao.getPrioridade());
				solicitacao2.setStatus("Aberto");
				solicitacao2.setNivelDeIncidencia("Solicitação");
				solicitacao2.setClassificacao("Software");
				solicitacao2.setPlay(false);
				GravaSolicModelo(solicitacao2, nomeDoCliente, nomeDoFuncionario);
			}
			if (solicitacao.getClassificacao().equals("Saída de Colaborador")) {

				Solicitacao solicitacao1 = new Solicitacao();
				solicitacao1.setDescricaoProblema("Saída de Colaborador: 1. Bloqueio de acessos (e-mail, Active Directory, Sistemas diversos,"
						+ "troca de senha (aleatória gerada pelo 365 para todos os acessos). Remoção em grupos de distrubuição e redirecionamentos");
				solicitacao1.setOnsiteOffsite("Offsite");
				solicitacao1.setSolicitante(solicitacao.getSolicitante());
				solicitacao1.setUsuario(solicitacao.getUsuario());
				solicitacao1.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao1.setPrioridade(solicitacao.getPrioridade());
				solicitacao1.setStatus("Aberto");
				solicitacao1.setNivelDeIncidencia("Solicitação");
				solicitacao1.setClassificacao("Software");
				solicitacao1.setPlay(false);
				GravaSolicModelo(solicitacao1, nomeDoCliente, nomeDoFuncionario);
				
				
				Solicitacao solicitacao2 = new Solicitacao();
				solicitacao2.setDescricaoProblema("Saída de Colaborador: 2. Backup de PST com padrão: ");
				solicitacao2.setObs(" a. Verificarse existe archive habilitado. Em caso afirmativo, prosseguir com item a e c, backup através do portal. \n"
						+ " b. backup - nome@dominio.pst na pasta TI; \n"
						+ " c. Testar PST; \n"
						+ " d. Verificar se existe conteúdo no OneDrive.");
						
				solicitacao2.setOnsiteOffsite("Offsite");
				solicitacao2.setSolicitante(solicitacao.getSolicitante());
				solicitacao2.setUsuario(solicitacao.getUsuario());
				solicitacao2.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao2.setPrioridade(solicitacao.getPrioridade());
				solicitacao2.setStatus("Aberto");
				solicitacao2.setNivelDeIncidencia("Backup");
				solicitacao2.setClassificacao("Backup");
				solicitacao2.setPlay(false);
				GravaSolicModelo(solicitacao2, nomeDoCliente, nomeDoFuncionario);
				
				Solicitacao solicitacao3 = new Solicitacao();
				solicitacao3.setDescricaoProblema("Saída de Colaborador: 3. Disponibilizar backup PST (Legado) de XXX@XXX ");
				solicitacao3.setOnsiteOffsite("Offsite");
				solicitacao3.setSolicitante(solicitacao.getSolicitante());
				solicitacao3.setUsuario(solicitacao.getUsuario());
				solicitacao3.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao3.setPrioridade(solicitacao.getPrioridade());
				solicitacao3.setStatus("Aberto");
				solicitacao3.setNivelDeIncidencia("Solicitação");
				solicitacao3.setClassificacao("Backup");
				solicitacao3.setPlay(false);
				GravaSolicModelo(solicitacao3, nomeDoCliente, nomeDoFuncionario);
				
				Solicitacao solicitacao4 = new Solicitacao();
				solicitacao4.setDescricaoProblema("Saída de Colaborador: 4. Agendamento no sistema para exclusão da conta de e-mail"
						+ "e regras do Exchange e ajustes de licenças no painel e desabilitar usuário no AD movendo para OU desabilitados.");
				solicitacao4.setOnsiteOffsite("Offsite");
				solicitacao4.setSolicitante(solicitacao.getSolicitante());
				solicitacao4.setUsuario(solicitacao.getUsuario());
				solicitacao4.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao4.setPrioridade(solicitacao.getPrioridade());
				solicitacao4.setStatus("Aberto");
				solicitacao4.setNivelDeIncidencia("Solicitação");
				solicitacao4.setClassificacao("Software");
				solicitacao4.setPlay(false);
				GravaSolicModelo(solicitacao4, nomeDoCliente, nomeDoFuncionario);
				
				Solicitacao solicitacao5 = new Solicitacao();
				solicitacao5.setDescricaoProblema("Saída de Colaborador: 5. Remoção de redirecionamento de XXX@XXX para YYY@YYY");
				solicitacao5.setOnsiteOffsite("Offsite");
				solicitacao5.setSolicitante(solicitacao.getSolicitante());
				solicitacao5.setUsuario(solicitacao.getUsuario());
				solicitacao5.setFormaAbertura(solicitacao.getFormaAbertura());
				solicitacao5.setPrioridade(solicitacao.getPrioridade());
				solicitacao5.setStatus("Aberto");
				solicitacao5.setNivelDeIncidencia("Solicitação");
				solicitacao5.setClassificacao("Software");
				solicitacao5.setPlay(false);
				GravaSolicModelo(solicitacao5, nomeDoCliente, nomeDoFuncionario);
			}

			return "redirect:solicitacoesAbertas";
		}

		if (session.getAttribute("tecnicoLogado") != null) {
			solicitacao.setExcluido(false);
			GravaSolicTecAdmin(solicitacao, nomeDoCliente, nomeDoFuncionario);
			return "redirect:solicitacoesAbertas";
		}

		else {
			return "redirect:login";
		}
	}

	private void GravaSolicModelo(Solicitacao solicitacao, String nomeDoCliente, String nomeDoFuncionario) {

		ClienteDao daoCli = new ClienteDao();
		FuncionarioDao daoFun = new FuncionarioDao();
		Cliente clienteASalvar = daoCli.buscaNomeCliente(nomeDoCliente);
		Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
		SolicitacaoDao dao = new SolicitacaoDao();
		solicitacao.setDataAbertura(Calendar.getInstance());
		String log = "Aberto por " + nomeDoFuncionario;
		solicitacao.setAndamentoDoChamado(log);
		solicitacao.setDataAtualizacao(Calendar.getInstance());
		solicitacao.setSenha(solicitacao.geraSenha());
		dao.salvaSolicitacaoAdmin(solicitacao, funcionarioASalvar, clienteASalvar);

	}

	// #####################################################################

	private void GravaSolicTecAdmin(Solicitacao solicitacao, String nomeDoCliente, String nomeDoFuncionario) {

		ClienteDao daoCli = new ClienteDao();
		FuncionarioDao daoFun = new FuncionarioDao();
		Cliente clienteASalvar = daoCli.buscaNomeCliente(nomeDoCliente);
		Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);
		SolicitacaoDao dao = new SolicitacaoDao();
		solicitacao.setDataAbertura(Calendar.getInstance());
		String log = solicitacao.geraLogSolicitacao(funcionarioASalvar, clienteASalvar);
		solicitacao.setAndamentoDoChamado(log);
		solicitacao.setDataAtualizacao(Calendar.getInstance());
		solicitacao.setSenha(solicitacao.geraSenha());
		if (solicitacao.getStatus().equals("Abrir")) {
			solicitacao.setStatus("Aberto");
			dao.salvaSolicitacaoAdmin(solicitacao, funcionarioASalvar, clienteASalvar);
		}
		if (solicitacao.getStatus().equals("Agendar")) {
			solicitacao.setStatus("Agendado"); // Em revis�o
			dao.salvaSolicitacaoAdminAgendado(solicitacao, funcionarioASalvar, clienteASalvar);
		}
		if (solicitacao.getStatus().equals("Em andamento")) {
			solicitacao.setStatus("Em andamento"); // Em revis�o
			solicitacao.setPlay(true);
			solicitacao.setDataAndamento(Calendar.getInstance());
			dao.salvaSolicitacaoAdmin(solicitacao, funcionarioASalvar, clienteASalvar);
		}
	}

	@RequestMapping("finalizarSolicitacao")
	public String finalizarSolicitacao(Solicitacao solicitacao, HttpSession session) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			solicitacao.setStatus("Finalizado");
			solicitacao.setDataAtualizacao(Calendar.getInstance());
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
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAbertasPorId(cliente.getId()));
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}

	private String qtdSolicitacoesCliente(Model model, Cliente cliente) {
		Long ab, and, age, agua;
		SolicitacaoDao daoAberto = new SolicitacaoDao();
		ab = daoAberto.listaQtdSolicitacoesAbertasPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAberto", ab);

		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		age = daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAgendado", age);

		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		and = daoAndamento.listaQtdSolicitacoesAndamentoPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAndamento", and);

		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		agua = daoAguardando.listaQtdSolicitacoesAguardandoPorIdDoCliente(cliente.getId());
		model.addAttribute("qtdAguardando", agua);

		model.addAttribute("qtdTotal", ab + age + and + agua);
		return "Cliente/solicitacao-list";
	}

	@RequestMapping("/solicitacoesAbertas")
	public String solicitacoesAbertas(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAbertas());
			return qtdSolicitacoesFuncionario(model);
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
			return qtdSolicitacoesTecnico(model, funcionario);
		} else {
			return "redirect:login";
		}
	}

	private String qtdSolicitacoesTecnico(Model model, Funcionario funcionario) {
		SolicitacaoDao daoAberto = new SolicitacaoDao();
		model.addAttribute("qtdAberto", daoAberto.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		model.addAttribute("qtdAgendado",
				daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		model.addAttribute("qtdAndamento",
				daoAndamento.listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		model.addAttribute("qtdAguardando",
				daoAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));
		return "Tecnico/solicitacao-list";
	}

	private String qtdSolicitacoesFuncionario(Model model) {
		Long nclas, ab, and, age, agua;

		SolicitacaoDao daoNaoClass = new SolicitacaoDao();
		nclas = daoNaoClass.listaQtdSolicitacoesNaoClass();
		model.addAttribute("qtdNaoClas", nclas);

		SolicitacaoDao daoAbertas = new SolicitacaoDao();
		ab = daoAbertas.listaQtdSolicitacoesAbertas();
		model.addAttribute("qtdAberto", ab);

		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		age = daoAgendadas.listaQtdSolicitacoesAgendadas();
		model.addAttribute("qtdAgendado", age);

		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		and = daoAndamento.listaQtdSolicitacoesEmAndamento();
		model.addAttribute("qtdAndamento", and);

		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		agua = daoAguardando.listaQtdSolicitacoesAguardando();
		model.addAttribute("qtdAguardando", agua);
		model.addAttribute("qtdTotal", nclas + ab + age + and + agua);
		return "Administrador/solicitacao-list";
	}

	@RequestMapping("/agendados")
	public String agendados(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAgendadasPorId(cliente.getId()));
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/aguardando")
	public String aguardando(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAguardandoPorId(cliente.getId()));
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
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAndamentoPorId(cliente.getId()));
			return qtdSolicitacoesCliente(model, cliente);
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacoesAgendadosTecnico")
	public String agendadosTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
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
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAndamentoPorIdDoTecnico(funcionario.getId()));
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
			model.addAttribute("solicitacoes", dao.listaSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));
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
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorId(cliente.getId()));
			return "Cliente/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioGeralCliente")
	public String relatorioGeralCliente(HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			model.addAttribute("solicitacoes", dao.relatorioGeralPorIdCliente(cliente.getId()));
			return "Cliente/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioGeral")
	public String relatorioGeral(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes()); // ALTERADO!!!

			Long nclas, ab, and, age, agua;

			SolicitacaoDao daoNaoClass = new SolicitacaoDao();
			nclas = daoNaoClass.listaQtdSolicitacoesNaoClass();
			model.addAttribute("qtdNaoClas", nclas);

			SolicitacaoDao daoAbertas = new SolicitacaoDao();
			ab = daoAbertas.listaQtdSolicitacoesAbertas();
			model.addAttribute("qtdAberto", ab);

			SolicitacaoDao daoAgendadas = new SolicitacaoDao();
			age = daoAgendadas.listaQtdSolicitacoesAgendadas();
			model.addAttribute("qtdAgendado", age);

			SolicitacaoDao daoAndamento = new SolicitacaoDao();
			and = daoAndamento.listaQtdSolicitacoesEmAndamento();
			model.addAttribute("qtdAndamento", and);

			SolicitacaoDao daoAguardando = new SolicitacaoDao();
			agua = daoAguardando.listaQtdSolicitacoesAguardando();
			model.addAttribute("qtdAguardando", agua);
			model.addAttribute("qtdTotal", nclas + ab + age + and + agua);
			return "Administrador/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioFinalizadas")
	public String relatorioFinalizadas(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoesFinalizadas());
			return "Administrador/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioTecnico")
	public String relatorioTecnico(HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes()); // ALTERADO!!!!
			return "Tecnico/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
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

	@RequestMapping("solicitacoesNaoClassificado")
	public String solicitacoesNaoClassificado(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesNaoClassificado());
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
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			EmailDao daoEmail = new EmailDao(); // ###
			model.addAttribute("email", daoEmail.listaEmailConfig().get(0).getLinkDominio()); // ###
			model.addAttribute("solicitacao", solicitacaoEditada);
			model.addAttribute("funcionario", daoFun.listaFuncionarioAtivo());

			ClienteDao daoCli = new ClienteDao();

			// Administrador pode editar qualquer solicita��o
			if (funcionario.getFuncao().equals("Administrador")) {
				model.addAttribute("clientes", daoCli.listaClienteAtivo());
				return funcionario.getFuncao() + "/solicitacao-edit";
			}
			// Funcionario edita somente a direcionada para ele.
			if (funcionario.getFuncao().equals("Tecnico")
					&& solicitacaoEditada.getFuncionario().getNome().equals(funcionario.getNome())) {
				return funcionario.getFuncao() + "/solicitacao-edit";
			}
			// Somente visualiza as demais solicita��es
			else {
				return funcionario.getFuncao() + "/solicitacao-ver";
			}
		}
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			if (solicitacaoEditada.getCliente().getNome().equals(cliente.getNome())) {
				model.addAttribute("solicitacao", solicitacaoEditada);
				return "Cliente/solicitacao-edit";
			}
			return "redirect:abertos";
		} else {
			return "redirect:login";
		}
	}

	/*
	 * @RequestMapping("/solicitacaoEditFuncionario") public String
	 * solicitacaoEditFuncionario(Long id, HttpSession session, Model model) { if
	 * (session.getAttribute("tecnicoLogado") != null) { SolicitacaoDao dao = new
	 * SolicitacaoDao(); Solicitacao solicitacaoEditada = new Solicitacao();
	 * solicitacaoEditada = dao.buscaSolicitacaoId(id);
	 * model.addAttribute("solicitacao", solicitacaoEditada); return
	 * "Tecnico/solicitacao-edit"; } else { return "redirect:login"; } }
	 */
	@RequestMapping("/solicitacaoEditCliente")
	public String funcionarioEditCliente(Long id, HttpSession session, Model model) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			if (solicitacaoEditada.getCliente().getNome().equals(cliente.getNome())) {
				model.addAttribute("solicitacao", solicitacaoEditada);
				return "Cliente/solicitacao-edit";
			}
			return "redirect:abertos";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoCopy")
	public String funcionarioCopy(Long id, HttpSession session, Model model) {

		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			solicitacaoEditada.setId(null);
			solicitacaoEditada.setStatus("Abrir");
			solicitacaoEditada.setIdChamadoLigacao(id);

			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("clientes", daoCli.listaCliente());

			model.addAttribute("solicitacao", solicitacaoEditada);
			model.addAttribute("funcionario", daoFun.listaFuncionarioAtivo());
			return funcionario.getFuncao() + "/solicitacao-copy";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoEditFuncionarioFull")
	public String solicitacaoEditFuncionarioFull(Long id, HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			EmailDao daoEmail = new EmailDao(); // ###
			model.addAttribute("email", daoEmail.listaEmailConfig().get(0).getLinkDominio()); // ###
			model.addAttribute("solicitacao", solicitacaoEditada);
			return "Tecnico/solicitacao-edit-full";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/visualizaSolicitacao")
	public String visualuzaSolicitacaso(Long id, HttpSession session, Model model) {
		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacaoEditada = new Solicitacao();
			solicitacaoEditada = dao.buscaSolicitacaoId(id);
			model.addAttribute("solicitacao", solicitacaoEditada);
			return "Tecnico/solicitacao-ver";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacaoCliente")
	public String atualizarSolicitacaoCLiente(Solicitacao solicitacao, HttpSession session) {
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			solicitacao.setDataAtualizacao(Calendar.getInstance()); // ###
			dao.atualizarSolicitacaoCliente(solicitacao);
			return "redirect:abertos";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacao")
	public String atualizarSolicitacao(Solicitacao solicitacao, String nomeDoFuncionario, String funcionarioLogado,
			String nomeDoCliente, HttpSession session) {

		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);

			if (solicitacao.getStatus().equals("Finalizar")) {
				dao.finalizaSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Finalizado")) {
				dao.atualizarSolicitacaoFinalizada(solicitacao, funcionarioASalvar, funcionarioLogado);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Aberto")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("N�o Classificado")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Agendado")) {
				dao.agendarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Em andamento")) {
				// System.out.println(solicitacao.isPlay());
				// System.out.println("em andamento");
				dao.solicitacaoEmAndamento(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Aguardando")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			} else {
				return "redirect:solicitacoesAbertas";
			}
		} else {
			return "redirect:login";
		}
	}

	// ############################################### nomeDoCliente
	// ################################################
	@RequestMapping("/atualizarSolicitacaoFuncionario")
	public String atualizarSolicitacaoFuncionario(Solicitacao solicitacao, String nomeDoFuncionario,
			String funcionarioLogado, String nomeDoCliente, HttpSession session) {

		if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();
			Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);

			if (solicitacao.getStatus().equals("Finalizar")) {
				dao.finalizaSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Finalizado")) { // TESTE
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Aberto")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAbertas";
			}
			if (solicitacao.getStatus().equals("Em andamento")) {
				dao.solicitacaoEmAndamento(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAndamentoTecnico";
			}
			if (solicitacao.getStatus().equals("Agendado")) {
				dao.solicitacaoAgendado(solicitacao, funcionarioASalvar, funcionarioLogado);
				return "redirect:solicitacoesAgendadosTecnico";
			}
			if (solicitacao.getStatus().equals("Aguardando")) {
				dao.atualizarSolicitacao(solicitacao, funcionarioASalvar, funcionarioLogado, nomeDoCliente);
				return "redirect:solicitacoesAguardandoTecnico";
			} else {
				return "redirect:solicitacoesAbertas";
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
	public String enviaEmail(Long id, String destinatario, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacao = dao.salvaSolicitacaoEmail(id);
			EmailDao emailDao = new EmailDao();
			Email emailConfig = emailDao.listaEmailConfigEnvia("Abertura");
			JavaMailApp mail = new JavaMailApp(emailConfig);
			mail.enviaEmail(solicitacao.getCliente(), solicitacao, destinatario);
			return "redirect:solicitacoesAbertas";
		} else {
			return "redirect:solicitacoesAbertas";
		}
	}

	@RequestMapping("/solicitacoesResumo")
	public String solicitacoesResumo(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaTodasSolicitacoes()); // ALTERADO!!!!!!!!!!
			return "Administrador/solicitacao-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioSelect")
	public String relatorioSelect(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("clientes", daoCli.listaCliente());
			return "Administrador/cliente-gera-relatorio";
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
			model.addAttribute("qtdSolicitacoes",
					daoSolicitacao.listaQtdSolicitacoesPorIdDoCliente(clienteEncontrado.getId()));

			ComputadorDao daoComputador = new ComputadorDao();
			model.addAttribute("qtdComputador",
					daoComputador.listaQtdComputadoresPorIdDoCliente(clienteEncontrado.getId()));
			return "Administrador/cliente-opcoes-relatorio";
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
			return "Administrador/cliente-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioSelectTec")
	public String relatorioSelectTec(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionario());
			return "Administrador/funcionario-gera-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioSelectData")
	public String relatorioSelectData(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao daoFun = new FuncionarioDao();
			model.addAttribute("funcionarios", daoFun.listaFuncionario());
			return "Administrador/data-gera-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPorData")
	public String relatorioPorData(HttpSession session, String dataInicio, Model model) throws ParseException {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = (Date) formatter.parse(dataInicio);
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorDataMedia(date, date));
			return "Administrador/funcionario-relatorio";
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
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/logDeSolicitacao")
	public String solicitacaoLog(HttpSession session, Long id, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");

		if (funcionario != null) {
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			model.addAttribute("solicitacao", daoSolicitacao.buscaSolicitacaoId(id));
			return funcionario.getFuncao() + "/solicitacao-log";
		}
		if (session.getAttribute("clienteLogado") != null) {
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			Solicitacao solicitacaoExibida = daoSolicitacao.buscaSolicitacaoId(id);
			if (solicitacaoExibida.getCliente().getNome().equals(cliente.getNome())) {
				model.addAttribute("solicitacao", solicitacaoExibida);
				return "Cliente/solicitacao-log";
			} else {
				return "redirect:abertos";
			}
		} else {
			return "redirect:login";
		}
	}

	private Calendar dataDeHoje() {
		Calendar dataHoje = Calendar.getInstance();
		dataHoje.set(Calendar.HOUR_OF_DAY, 0);
		dataHoje.set(Calendar.MINUTE, 0);
		dataHoje.set(Calendar.SECOND, 0);
		return dataHoje;
	}

	// ######################################################################
	@RequestMapping("/relatorioOp")
	public String relatorioOp(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			FuncionarioDao daoFun = new FuncionarioDao();

			List<Funcionario> funcionarios = daoFun.listaFuncionarioAtivo();
			List<Relatorio> relatorios = new ArrayList<Relatorio>();

			for (int i = 0; i < funcionarios.size(); i++) {
				SolicitacaoDao daoSolAberto = new SolicitacaoDao();
				SolicitacaoDao daoSolAndamento = new SolicitacaoDao();
				SolicitacaoDao daoSolAgendado = new SolicitacaoDao();
				SolicitacaoDao daoSolAguardando = new SolicitacaoDao();

				if (funcionarios.get(i).getId() != null) {
					Relatorio relaTemp = new Relatorio();
					relaTemp.setId(funcionarios.get(i).getId());
					relaTemp.setNome(funcionarios.get(i).getNome());
					relaTemp.setQtdAberto(
							daoSolAberto.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionarios.get(i).getId()));
					relaTemp.setQtdAndamento(
							daoSolAndamento.listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(funcionarios.get(i).getId()));
					relaTemp.setQtdAgendado(
							daoSolAgendado.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionarios.get(i).getId()));
					relaTemp.setQtdAguardando(
							daoSolAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionarios.get(i).getId()));
					relaTemp.setQtdTotal(relaTemp.getQtdAberto() + relaTemp.getQtdAgendado()
							+ relaTemp.getQtdAguardando() + relaTemp.getQtdAndamento());
					relatorios.add(relaTemp);
				}
			}
			// ####################################################################################
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesPorData(dataHoje).size());
			SolicitacaoDao daoFinalizados = new SolicitacaoDao();
			model.addAttribute("finalizados", daoFinalizados.listaSolicitacoesPorDataFinalizacao(dataHoje).size());
			model.addAttribute("relatorios", relatorios);
			return "Administrador/relatorio-op";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioHoje")
	public String relatorioHoje(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesPorData(dataHoje));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/finalizadoHoje")
	public String finalizadoHoje(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesPorDataFinalizacao(dataHoje));
			return "Administrador/funcionario-relatorio";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			Calendar hoje = dataDeHoje();
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					dao.listaSolicitacoesPorDataFinalizacaoFuncionario(hoje, funcionario.getNome()));
			return "Tecnico/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	// #############################################################################

	@RequestMapping("/atualizadoHoje")
	public String atualizadoHoje(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesAtualizadasHoje(dataHoje));
			return "Administrador/funcionario-relatorio";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					daoHoje.listaSolicitacoesPorDataFinalizacaoFuncionario(dataHoje, funcionario.getNome()));
			return "Tecnico/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacoesExcluidas")
	public String solicitacoesExcluidas(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null
				? (Funcionario) session.getAttribute("funcionarioLogado")
				: (Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesExcluidas());
			return funcionario.getFuncao() + "/solicitacao-list";
		} else {
			return "redirect:login";
		}
	}

	// #############################################################################
	@RequestMapping("gerarRelatorioPalavra")
	public String gerarRelatorioPalavra(String assunto, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorAssunto(assunto));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPalavra")
	public String relatorioPalavra(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Administrador/relatorio-palavra";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPeriodoFechamento")
	public String relatorioPeriodoFechamento(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Administrador/relatorio-periodo-f";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPeriodoAbertura")
	public String relatorioPeriodoAbertura(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Administrador/relatorio-periodo-a";
		} else {
			return "redirect:login";
		}
	}

	private void converteDatIniDatFim(String dataInicio, String dataFim, Calendar dataInicioConv, Calendar dataFimConv)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		dataInicioConv.setTime(sdf.parse(dataInicio));
		dataFimConv.setTime(sdf.parse(dataFim));

		dataInicioConv.set(Calendar.HOUR_OF_DAY, 0);
		dataInicioConv.set(Calendar.MINUTE, 0);
		dataInicioConv.set(Calendar.SECOND, 0);

		dataFimConv.set(Calendar.HOUR_OF_DAY, 0);
		dataFimConv.set(Calendar.MINUTE, 0);
		dataFimConv.set(Calendar.SECOND, 0);
	}

	@RequestMapping("gerarRelatorioPeriodoFechamento")
	public String gerarRelatorioPeriodoFechamento(String dataInicio, String dataFim, String assunto,
			HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();
			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorPeriodoFechamento(dataInicioConv, dataFimConv));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioAgendamento")
	public String relatorioAgendamento(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Administrador/relatorio-agendamento";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioAgendamento")
	public String gerarRelatorioAgendamento(String data, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv;
			dataInicioConv = Calendar.getInstance();
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				dataInicioConv.setTime(sdf.parse(data));
				dataInicioConv.set(Calendar.HOUR_OF_DAY, 0);
				dataInicioConv.set(Calendar.MINUTE, 0);
				dataInicioConv.set(Calendar.SECOND, 0);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorAgendamento(dataInicioConv));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioId")
	public String relatorioId(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Administrador/relatorio-id";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioId")
	public String gerarRelatorioId(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorIdSolicitacao(id));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPeriodoAberturaCliente")
	public String relatorioPeriodoAberturaCliente(String nomeDoCliente, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			model.addAttribute("nomeDoCliente", nomeDoCliente);
			return "Administrador/relatorio-periodo-a-cli";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/relatorioPeriodoFechamentoCliente")
	public String relatorioPeriodoFechamentoCliente(String nomeDoCliente, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			model.addAttribute("nomeDoCliente", nomeDoCliente);
			return "Administrador/relatorio-periodo-f-cli";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioPeriodoAbertura")
	public String gerarRelatorioPeriodoAbertura(String dataInicio, String dataFim, String assunto, HttpSession session,
			Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();
			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes", dao.listaSolicitacoesPorPeriodoAbertura(dataInicioConv, dataFimConv));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioPeriodoAberturaCliente")
	public String gerarRelatorioPeriodoAberturaCliente(String dataInicio, String dataFim, String nomeDoCliente,
			HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();
			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					dao.listaSolicitacoesPorPeriodoAberturaCliente(dataInicioConv, dataFimConv, nomeDoCliente));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioPeriodoAberturaClienteImp")
	public String gerarRelatorioPeriodoAberturaClienteImp(String dataInicio, String dataFim, String nomeDoCliente,
			HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();
			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					dao.listaSolicitacoesPorPeriodoAberturaCliente(dataInicioConv, dataFimConv, nomeDoCliente));
			return "Administrador/relatorio-impressao";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioPeriodoFechamentoClienteImp")
	public String gerarRelatorioPeriodoFechamentoClienteImp(String dataInicio, String dataFim, String nomeDoCliente,
			HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();

			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					dao.listaSolicitacoesPorPeriodoFechamentoCliente(dataInicioConv, dataFimConv, nomeDoCliente));
			return "Administrador/relatorio-impressao";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("gerarRelatorioPeriodoFechamentoCliente")
	public String gerarRelatorioPeriodoFechamentoCliente(String dataInicio, String dataFim, String nomeDoCliente,
			HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataInicioConv, dataFimConv;
			dataInicioConv = Calendar.getInstance();
			dataFimConv = Calendar.getInstance();

			try {
				converteDatIniDatFim(dataInicio, dataFim, dataInicioConv, dataFimConv);
			} catch (Exception e) {

			}
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",
					dao.listaSolicitacoesPorPeriodoFechamentoCliente(dataInicioConv, dataFimConv, nomeDoCliente));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/agendamentosAtrasados")
	public String agendamentosAtrasados(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesPorAgendamentoAtrasado(dataHoje));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/agendamentosHoje")
	public String agendamentosHoje(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Calendar dataHoje = dataDeHoje();
			SolicitacaoDao daoHoje = new SolicitacaoDao();
			model.addAttribute("solicitacoes", daoHoje.listaSolicitacoesPorAgendamento(dataHoje));
			return "Administrador/funcionario-relatorio";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/dataEditSolicitacao")
	public String dataEditSolicitacao(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			model.addAttribute("solicitacao", dao.buscaSolicitacaoId(id));
			return "Administrador/solicitacao-edit-data";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacaoData")
	public String atualizarSolicitacaoData(Long id, String dataAbertura, String dataAndamento, HttpSession session)
			throws ParseException {

		if (session.getAttribute("funcionarioLogado") != null) {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Calendar dtAb = Calendar.getInstance();
			Date dt1 = df.parse(dataAbertura);
			dtAb.setTime(dt1);
			if (dataAndamento != "") {
				Calendar dtAn = Calendar.getInstance();
				Date dt2 = df.parse(dataAndamento);
				dtAn.setTime(dt2);
				SolicitacaoDao dao = new SolicitacaoDao();
				dao.atualizaDataSolicitacao(id, dtAb, dtAn);
			} else {
				SolicitacaoDao dao = new SolicitacaoDao();
				dao.atualizaDataSolicitacao(id, dtAb);
			}
			return "redirect:solicitacoesAbertas";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/solicitacaoEditFull")
	public String solicitacaoEditFull(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacao = dao.buscaSolicitacaoId(id);
			System.out.println(solicitacao.getId());
			if (solicitacao.getStatus().equals("Finalizado")) {
				model.addAttribute("solicitacao", solicitacao);
				return "Administrador/solicitacao-edit-full";
			} else {
				return "Administrador/solicitacao-list";
			}
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizarSolicitacaoCompleta")
	public String atualizarSolicitacaoCompleta(Solicitacao solicitacao, String nomeDoFuncionario,
			String funcionarioLogado, String dataAbertura, String dataAndamento, String dataFechamento,
			String nomeDoCliente, HttpSession session) throws ParseException {
		if (session.getAttribute("funcionarioLogado") != null) {
			atualizacaoCompleta(solicitacao, nomeDoFuncionario, funcionarioLogado, dataAbertura, dataAndamento,
					dataFechamento);
			return "redirect:relatorioPorCliente" + "?nomeDoCliente=" + nomeDoCliente;
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			atualizacaoCompleta(solicitacao, nomeDoFuncionario, funcionarioLogado, dataAbertura, dataAndamento,
					dataFechamento);
			return "redirect:finalizadoHoje";
		} else {
			return "redirect:login";
		}
	}

	private void atualizacaoCompleta(Solicitacao solicitacao, String nomeDoFuncionario, String funcionarioLogado,
			String dataAbertura, String dataAndamento, String dataFechamento) throws ParseException {
		SolicitacaoDao dao = new SolicitacaoDao();
		FuncionarioDao daoFun = new FuncionarioDao();
		Funcionario funcionarioASalvar = daoFun.buscaNomeFuncionario(nomeDoFuncionario);

		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

		Calendar dtAb = Calendar.getInstance();
		Date dt1 = df.parse(dataAbertura);
		dtAb.setTime(dt1);
		solicitacao.setDataAbertura(dtAb);

		Calendar dtAn = Calendar.getInstance();
		Date dt2 = df.parse(dataAndamento);
		dtAn.setTime(dt2);
		solicitacao.setDataAndamento(dtAn);

		Calendar dtFe = Calendar.getInstance();
		Date dt3 = df.parse(dataFechamento);
		dtFe.setTime(dt3);
		solicitacao.setDataFechamento(dtFe);
		dao.atualizarSolicitacaoCompleta(solicitacao, funcionarioASalvar, funcionarioLogado);
	}

	@RequestMapping("/enviaClassificacao")
	public String enviaClassificacao(Solicitacao solicitacao, HttpSession session, Model model) {
		Solicitacao solicitacaoClassificao;
		SolicitacaoDao dao = new SolicitacaoDao();
		solicitacaoClassificao = dao.buscaSolicitacaoId(solicitacao.getId());
		if (solicitacaoClassificao != null && solicitacao.getId().equals(solicitacaoClassificao.getId())
				&& solicitacao.getSenha().equals(solicitacaoClassificao.getSenha())) {

			SolicitacaoDao daoSalva = new SolicitacaoDao();
			solicitacaoClassificao.setComentario(solicitacao.getComentario());
			solicitacaoClassificao.setEstrela(solicitacao.getEstrela());
			daoSalva.atualizarSolicitacao(solicitacaoClassificao);

			EmailDao emailDao = new EmailDao();
			Email email = emailDao.buscarPorId(1l);
			String link = email.getLinkDominio() + "/provider/protocolo?id=" + solicitacaoClassificao.getId()
					+ "&senha=" + solicitacaoClassificao.getSenha();
			model.addAttribute("link", link);
			return "protocolo/success-classificacao";
		} else {
			return "redirect:protocolo";
		}
	}
}