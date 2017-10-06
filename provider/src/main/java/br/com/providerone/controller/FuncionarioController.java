package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Funcionario;

@Controller
public class FuncionarioController {
	
	/*
	@RequestMapping("/upload")
	public String upload(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/upload";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	*/
	@RequestMapping("/homePage")
	public String homePage(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			Funcionario funcionario = (Funcionario) session.getAttribute("funcionarioLogado");
			homePageAdiconaModel(model, funcionario);
			return "admin/home-page";
		} if (session.getAttribute("tecnicoLogado") != null) {
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			homePageAdiconaModel(model, funcionario);
			return "funcionario/home-page";
		}	
		else {
			return "redirect:loginFuncionario";
		}
	}

	private void homePageAdiconaModel(Model model, Funcionario funcionario) {
		SolicitacaoDao dao = new SolicitacaoDao();
		model.addAttribute("qtdAberto", dao.listaQtdSolicitacoesAbertasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAgendadas = new SolicitacaoDao();
		model.addAttribute("qtdAgendado", daoAgendadas.listaQtdSolicitacoesAgendadasPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAndamento = new SolicitacaoDao();
		model.addAttribute("qtdEmAndamento", daoAndamento.listaQtdSolicitacoesEmAndamentoPorIdDoTecnico(funcionario.getId()));
		SolicitacaoDao daoAguardando = new SolicitacaoDao();
		model.addAttribute("qtdAguardando", daoAguardando.listaQtdSolicitacoesAguardandoPorIdDoTecnico(funcionario.getId()));
	}
	
	@RequestMapping("/funcionarioForm")
	public String funcionarioForm(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/funcionario-form";
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
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/atualiza-dados";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			return "funcionario/atualiza-dados";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarSenha")
	public String atualizarSenha(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/atualiza-senha";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			return "funcionario/atualiza-senha";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarSenhaFuncionario")
	public String atualizarSenhaFuncionario(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioDao dao = new FuncionarioDao();
			Funcionario funcionarioEncontrado = dao.buscarPorId(id);
			model.addAttribute("funcionario", funcionarioEncontrado);
			
			return "admin/atualiza-senha-funcionario";
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

	@RequestMapping("/funcionariosList")
	public String funcionariosList(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			List<Funcionario> funcionarios = new ArrayList<Funcionario>();
			FuncionarioDao dao = new FuncionarioDao();
			funcionarios = dao.listaFuncionario();
			model.addAttribute("funcionarios", funcionarios);
			return "admin/funcionario-list";
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
			return "admin/funcionario-edit";
		} else {
			return "redirect:login";
		}
	}
}