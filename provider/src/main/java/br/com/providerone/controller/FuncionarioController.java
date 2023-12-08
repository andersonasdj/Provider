package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Funcionario;

@Controller
public class FuncionarioController {
	
	//para criaçãoo do primeiro usuario do sistema
	@RequestMapping("/gravaAdmin")
	public String gravaAdmin(Funcionario funcionario) {
		FuncionarioDao daoTesta = new FuncionarioDao();
		if(daoTesta.listaFuncionario().size() == 0){
			FuncionarioDao dao = new FuncionarioDao();
			dao.salvar(funcionario);
			return "redirect:login";
		}
		return "redirect:login";
	}
	//###NOVA VIEW###
	@RequestMapping("/homePage")
	public String homePage(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			homePageAdiconaModel(model, funcionario);
			return "Front/"+funcionario.getFuncao()+"/home-page";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	//###NOVA VIEW###
	
	private void homePageAdiconaModel(Model model, Funcionario funcionario) {
		Calendar hoje = Calendar.getInstance();
		hoje.set(Calendar.HOUR_OF_DAY, 0);
		hoje.set(Calendar.MINUTE, 0);
		hoje.set(Calendar.SECOND, 0);
		SolicitacaoDao dao = new SolicitacaoDao();
		model.addAttribute("qtdAberto", dao.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		model.addAttribute("qtdAgendado", daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		model.addAttribute("qtdEmAndamento", daoAndamento.listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		model.addAttribute("qtdAguardando", daoAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAgendaAtrasados = new SolicitacaoDao();
		model.addAttribute("qtdAgendadoAtrasado", daoAgendaAtrasados.listaSolicitacoesPorAgendamentoAtrasado(hoje).size());
		SolicitacaoDao daoAgendamentosHoje = new SolicitacaoDao();
		model.addAttribute("qtdAgendadoHoje", daoAgendamentosHoje.listaSolicitacoesPorAgendamento(hoje).size());
	}
	
	@RequestMapping("/funcionarioForm")
	public String funcionarioForm(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "Front/Administrador/funcionario-form";
		} else {
			return "redirect:loginFuncionario";
		}
	}

	@RequestMapping("/gravaFuncionario")
	public String gravaUsuario(Funcionario funcionario) {
		FuncionarioDao dao = new FuncionarioDao();
		dao.salvar(funcionario);
		return "redirect:funcionarioForm";
	}
	
	@RequestMapping("/atualizarDados")
	public String atualizarDados(HttpSession session) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			return funcionario.getFuncao()+"/atualiza-dados";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarSenha")
	public String atualizarSenha(HttpSession session) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			return funcionario.getFuncao()+"/atualiza-senha";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarSenhaFuncionario")
	public String atualizarSenhaFuncionario(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao dao = new FuncionarioDao();
			Funcionario funcionarioEncontrado = dao.buscarPorId(id);
			model.addAttribute("funcionario", funcionarioEncontrado);
			return "Administrador/atualiza-senha-funcionario";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/atualizar")
	public String atualizar(Funcionario funcionario, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null || session.getAttribute("tecnicoLogado") != null) {
			FuncionarioDao dao = new FuncionarioDao();
			dao.atualizar(funcionario);
			return "redirect:homePage";
		} else {
			return "redirect:atualizarDados";
		}
	}
	
	@RequestMapping("/atualizarMinhaSenha")
	public String atualizarMinhaSenha(Funcionario funcionario, String novaSenha, String confirmaSenha, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null || session.getAttribute("tecnicoLogado") != null) {
			FuncionarioDao dao = new FuncionarioDao();
			if(novaSenha.equals(confirmaSenha)){
				funcionario.setSenha(novaSenha);
				dao.atualizarSenha(funcionario);
				return "redirect:homePage";
			}
			else {
				return "redirect:atualizarSenha";
			}
		} else {
			return "redirect:login";
		}
	}

	@GetMapping("/funcionarios")
	public String funcionariosList(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			List<Funcionario> funcionarios = new ArrayList<Funcionario>();
			FuncionarioDao dao = new FuncionarioDao();
			funcionarios = dao.listaFuncionario();
			model.addAttribute("funcionarios", funcionarios);
			return "Front/Administrador/funcionario-list";
		} else {
			return "redirect:homePage";
		}
	}
	
	@RequestMapping("/funcionarioEdit")
	public String funcionarioEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao dao = new FuncionarioDao();
			Funcionario funcionarioEditado = new Funcionario();
			funcionarioEditado = dao.buscarPorId(id);
			model.addAttribute("funcionario", funcionarioEditado);
			return "Administrador/funcionario-edit";
		} else {
			return "redirect:login";
		}
	}
}