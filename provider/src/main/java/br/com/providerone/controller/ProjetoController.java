package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.ProjetoDao;
import br.com.providerone.modelo.Projeto;

@Controller
public class ProjetoController {
	
	@RequestMapping("/projetoForm")
	public String projetoForm(HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			ClienteDao clienteDao = new ClienteDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			
			model.addAttribute("clientes",clienteDao.listaCliente());
			model.addAttribute("funcionarios",funcionarioDao.listaFuncionario());
			
			return "admin/projeto-form";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/salvarProjeto")
	public String salvarProjeto(Projeto projeto, HttpSession session){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			ProjetoDao projetoDao = new ProjetoDao();
			projetoDao.salvar(projeto);
			
			return "redirect:listarProjetos";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarProjetos")
	public String listarProjetos(HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			ProjetoDao projetoDao = new ProjetoDao();
			model.addAttribute("projetos", projetoDao.listaProjetos());
			
			return "admin/projeto-list";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/projetoEdit")
	public String clienteEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			ProjetoDao dao = new ProjetoDao();
			Projeto projetoEditado = new Projeto();
			projetoEditado = dao.buscaPorId(id);
			model.addAttribute("projeto", projetoEditado);
			return "admin/projeto-edit";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarProjeto")
	public String atualizar(Projeto projeto, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			ProjetoDao dao = new ProjetoDao();
			dao.atualizar(projeto);
			return "redirect:listarProjetos";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/excluirProjeto")
	public String removeSolicitacao(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			ProjetoDao dao = new ProjetoDao();
			dao.excluirProjeto(id);
			return "redirect:listarProjetos";
		} else {
			return "redirect:login";
		}
	}
	
}
