package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.ProjetoDao;
import br.com.providerone.dao.TarefaDao;
import br.com.providerone.modelo.Projeto;
import br.com.providerone.modelo.Tarefa;

@Controller
public class TarefaController {
	
	@RequestMapping("/addTarefa")
	public String atualizar(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			Projeto projeto = new Projeto();
			ProjetoDao projetoDao = new ProjetoDao();
			FuncionarioDao funcionarioDao = new FuncionarioDao();
			
			projeto = projetoDao.buscaPorId(id);
			
			model.addAttribute("projeto", projeto);
			model.addAttribute("funcionarios", funcionarioDao.listaFuncionario());
			
			return "admin/tarefa-form";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/salvarTarefa")
	public String salvarProjeto(Tarefa tarefa, Projeto projeto,
			HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {

			TarefaDao tarefaDao = new TarefaDao();
			tarefaDao.salvar(tarefa, projeto);

			return "redirect:listarProjetos";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/listarTarefas")
	public String listarProjetos(Long id, HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			
			TarefaDao tarefaDao = new TarefaDao();
			model.addAttribute("tarefas", tarefaDao.listarTarefasPorId(id));
			model.addAttribute("idProjeto", id);
			
			return "admin/tarefas-list";
		} else {
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
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/atualizarTarefa")
	public String salvarProjeto(Tarefa tarefa, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			Projeto projeto = new Projeto();
			ProjetoDao projetoDao = new ProjetoDao();
			projeto = projetoDao.buscaPorId(tarefa.getProjeto().getId());
			
			TarefaDao tarefaDaoAtualizar = new TarefaDao();
			tarefaDaoAtualizar.atualizar(tarefa, projeto);

			return "redirect:listarProjetos";
		} else {
			return "redirect:login";
		}
	}
}
