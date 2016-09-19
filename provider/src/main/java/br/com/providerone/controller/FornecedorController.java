package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.com.providerone.dao.FornecedorDao;
import br.com.providerone.modelo.Fornecedor;

@Controller
public class FornecedorController {
	
	@RequestMapping("/fornecedorForm")
	public String fornecedorForm(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/fornecedor-form";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/gravarFornecedor")
	public String gravaUsuario(Fornecedor fornecedor) {
		FornecedorDao dao = new FornecedorDao();
		dao.salvar(fornecedor);
		return "redirect:fornecedorForm";
	}
	
	@RequestMapping("/fornecedorList")
	public String fornecedorList(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			List<Fornecedor> fornecedores = new ArrayList<Fornecedor>();
			FornecedorDao dao = new FornecedorDao();
			fornecedores = dao.listaFornecedor();
			model.addAttribute("fornecedores", fornecedores);
			return "admin/fornecedor-list";
		} else {
			return "redirect:homePage";
		}
	}
	
	@RequestMapping("/fornecedorEdit")
	public String fornecedorEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FornecedorDao dao = new FornecedorDao();
			Fornecedor fornecedorEditado = new Fornecedor();
			fornecedorEditado = dao.buscarPorId(id);
			model.addAttribute("fornecedor", fornecedorEditado);
			return "admin/fornecedor-edit";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping("/atualizarFornecedor")
	public String atualizarFornecedor(Fornecedor fornecedor, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FornecedorDao dao = new FornecedorDao();
			dao.atualizar(fornecedor);
			return "redirect:fornecedorList";
		} else {
			return "redirect:atualizarDados";
		}
	}
}