package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.CheckListDao;
import br.com.providerone.modelo.Checklist;

@Controller
public class CheckListController {
	
	@RequestMapping("/checklistForm")
	public String checklistForm(HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			ClienteDao clienteDao = new ClienteDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			model.addAttribute("clientes",clienteDao.listaCliente());
			model.addAttribute("funcionarios",funcionarioDao.listaFuncionarioAtivo());
			return "admin/checklist-form";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/salvarChecklist")
	public String salvarChecklist(Checklist checklist, HttpSession session){
		if (session.getAttribute("funcionarioLogado") != null) {
			CheckListDao checklistDao = new CheckListDao();
			checklistDao.salvar(checklist);
			return "redirect:listarCheckLists";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarCheckLists")
	public String listarCheckList(HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			CheckListDao checklistDao = new CheckListDao();
			model.addAttribute("checklists", checklistDao.listaChecklists());
			return "admin/checklist-list";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/checklistEdit")
	public String checklistEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			CheckListDao dao = new CheckListDao();
			Checklist checklistEditado = new Checklist();
			checklistEditado = dao.buscaPorId(id);
			model.addAttribute("checklist", checklistEditado);
			return "admin/checklist-edit";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarChecklist")
	public String atualizar(Checklist checkllist, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			CheckListDao dao = new CheckListDao();
			dao.atualizar(checkllist);
			return "redirect:listarCheckLists";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/excluirChecklist")
	public String excluirChecklist(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			CheckListDao dao = new CheckListDao();
			dao.excluirChecklist(id);
			return "redirect:listarCheckLists";
		} else {
			return "redirect:login";
		}
	}
}