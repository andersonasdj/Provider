package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.CheckListDao;
import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.modelo.Checklist;
import br.com.providerone.modelo.Funcionario;

@Controller
public class CheckListController {
	
	@RequestMapping("/checklistForm")
	public String checklistForm(HttpSession session, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			montaFormCheckList(model);
			return funcionario.getFuncao()+"/checklist-form";
		}else {
			return "redirect:login";
		}
	}

	private void montaFormCheckList(Model model) {
		ClienteDao clienteDao = new ClienteDao();
		FuncionarioDao funcionarioDao = new FuncionarioDao();
		model.addAttribute("clientes",clienteDao.listaCliente());
		model.addAttribute("funcionarios",funcionarioDao.listaFuncionarioAtivo());
	}
	
	@RequestMapping("/salvarChecklist")
	public String salvarChecklist(Checklist checklist, HttpSession session){
		if (session.getAttribute("funcionarioLogado") != null || session.getAttribute("tecnicoLogado") != null) {
			CheckListDao checklistDao = new CheckListDao();
			checklistDao.salvar(checklist);
			return "redirect:listarCheckLists";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarCheckLists")
	public String listarCheckList(HttpSession session, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			CheckListDao checklistDao = new CheckListDao();
			model.addAttribute("checklists", checklistDao.listaChecklists());
			return funcionario.getFuncao()+"/checklist-list";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/checklistEdit")
	public String checklistEdit(Long id, HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			ClienteDao clienteDao = new ClienteDao();
			model.addAttribute("clientes",clienteDao.listaCliente());
			CheckListDao dao = new CheckListDao();
			Checklist checklistEditado = new Checklist();
			checklistEditado = dao.buscaPorId(id);
			model.addAttribute("checklist", checklistEditado);
			return funcionario.getFuncao()+"/checklist-edit";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarChecklist")
	public String atualizar(Checklist checkllist, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null || session.getAttribute("tecnicoLogado") != null) {
			CheckListDao dao = new CheckListDao();
			dao.atualizar(checkllist);
			return "redirect:listarCheckLists";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/excluirChecklist")
	public String excluirChecklist(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null || session.getAttribute("tecnicoLogado") != null) {
			CheckListDao dao = new CheckListDao();
			dao.excluirChecklist(id);
			return "redirect:listarCheckLists";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/checkList")
	public String checkList(HttpSession session, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			ClienteDao daoCli = new ClienteDao();
			model.addAttribute("clientes", daoCli.listaCliente());
			return funcionario.getFuncao()+"/checklist";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarCheckListsCliente")
	public String listarCheckListCliente(HttpSession session, String nomeDoCliente, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			CheckListDao checklistDao = new CheckListDao();
			model.addAttribute("checklists", checklistDao.listaChecklistsCliente(nomeDoCliente));
			return funcionario.getFuncao()+"/checklist-list";
		}else {
			return "redirect:login";
		}
	}
}