package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.CheckListDao;
import br.com.providerone.dao.TarefaDao;
import br.com.providerone.modelo.Checklist;
import br.com.providerone.modelo.Tarefa;

@Controller
public class TarefaController {
	
	@RequestMapping("/addTarefa")
	public String atualizar(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			Checklist checklist = new Checklist();
			CheckListDao checklistDao = new CheckListDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			checklist = checklistDao.buscaPorId(id);
			model.addAttribute("checklist", checklist);
			model.addAttribute("funcionarios", funcionarioDao.listaFuncionarioAtivo());
			return "admin/tarefa-form";
			
		} else if (session.getAttribute("tecnicoLogado") != null) {  
			
			Checklist checklist = new Checklist();
			CheckListDao checklistDao = new CheckListDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			checklist = checklistDao.buscaPorId(id);
			model.addAttribute("checklist", checklist);
			model.addAttribute("funcionarios", funcionarioDao.listaFuncionarioAtivo());
			return "funcionario/tarefa-form";
		}
		else {
			return "redirect:login";
		}
	}

	@RequestMapping("/salvarTarefa")
	public String salvarTarefa(Tarefa tarefa, Checklist checklist,
			HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			TarefaDao tarefaDao = new TarefaDao();
			tarefaDao.salvar(tarefa, checklist);
			return "redirect:listarCheckLists";
		} else if (session.getAttribute("tecnicoLogado") != null) { 
			TarefaDao tarefaDao = new TarefaDao();
			tarefaDao.salvar(tarefa, checklist);
			return "redirect:listarCheckLists";
		}	
		else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarTarefas")
	public String listarTarefas(Long id, HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			TarefaDao tarefaDao = new TarefaDao();
			model.addAttribute("tarefas", tarefaDao.listarTarefasPorId(id));
			model.addAttribute("idChecklist", id);
			
			return "admin/tarefas-list";
		} else if (session.getAttribute("tecnicoLogado") != null) { 
			TarefaDao tarefaDao = new TarefaDao();
			model.addAttribute("tarefas", tarefaDao.listarTarefasPorId(id));
			model.addAttribute("idChecklist", id);
			return "funcionario/tarefas-list";
		}	
		else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/tarefaEdit")
	public String tarefaEdit(Long id, HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			TarefaDao tarefaDao = new TarefaDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			model.addAttribute("tarefa", tarefaDao.buscaPorId(id));
			model.addAttribute("funcionarios", funcionarioDao.listaFuncionarioAtivo());
			return "admin/tarefa-edit";
		} else if (session.getAttribute("tecnicoLogado") != null) {  
			TarefaDao tarefaDao = new TarefaDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			model.addAttribute("tarefa", tarefaDao.buscaPorId(id));
			model.addAttribute("funcionarios", funcionarioDao.listaFuncionarioAtivo());
			return "funcionario/tarefa-edit";
		}
		else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/atualizarTarefa")
	public String atualizarTarefa(Tarefa tarefa, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			Checklist checklist = new Checklist();
			CheckListDao checklistDao = new CheckListDao();
			checklist = checklistDao.buscaPorId(tarefa.getChecklist().getId());
			
			TarefaDao tarefaDaoAtualizar = new TarefaDao();
			tarefaDaoAtualizar.atualizar(tarefa, checklist);

			return "redirect:listarCheckLists";
		} else if (session.getAttribute("tecnicoLogado") != null) {  
			Checklist checklist = new Checklist();
			CheckListDao checklistDao = new CheckListDao();
			checklist = checklistDao.buscaPorId(tarefa.getChecklist().getId());
			
			TarefaDao tarefaDaoAtualizar = new TarefaDao();
			tarefaDaoAtualizar.atualizar(tarefa, checklist);

			return "redirect:listarCheckLists";
		}
		else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/excluirTarefa")
	public String removeSolicitacao(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			TarefaDao dao = new TarefaDao();
			dao.excluirTarefa(id);
			return "redirect:listarCheckLists";
		} else if (session.getAttribute("tecnicoLogado") != null) { 
			TarefaDao dao = new TarefaDao();
			dao.excluirTarefa(id);
			return "redirect:listarCheckLists";
		}
		else {
			return "redirect:login";
		}
	}
}
