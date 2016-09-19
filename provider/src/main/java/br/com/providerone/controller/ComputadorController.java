package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.ComputadorDao;
import br.com.providerone.dao.PerifericosDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Computador;

@Controller
public class ComputadorController {
	
	@RequestMapping("/computadorForm")
	public String computadorForm(HttpSession session, Model model){
		if (session.getAttribute("funcionarioLogado") != null) {
			computadorFormAdiconaModel(model);	
			return "admin/computador-form";
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			computadorFormAdiconaModel(model);	
			return "funcionario/computador-form";
		}else {
			return "redirect:login";
		}
	}

	private void computadorFormAdiconaModel(Model model) {
		ClienteDao daoCli = new ClienteDao();
		PerifericosDao daoPerif = new PerifericosDao();
		model.addAttribute("clientes", daoCli.listaCliente());
		model.addAttribute("perifericos", daoPerif.listaPerifericos());
	}
	
	@RequestMapping("salvarComputador")
	public String salvarComputador(Computador computador, String nomeDoCliente, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return salvaComputadorEAdicionaModel(computador, nomeDoCliente);
		}
		if (session.getAttribute("tecnicoLogado") != null) {
			return salvaComputadorEAdicionaModel(computador, nomeDoCliente);
		}else {
			return "redirect:login";
		}
	}

	private String salvaComputadorEAdicionaModel(Computador computador,
			String nomeDoCliente) {
		ClienteDao daoCli = new ClienteDao();
		Cliente clienteASalvar = daoCli.buscaNomeCliente(nomeDoCliente);	
		ComputadorDao dao = new ComputadorDao();
		dao.salvaComputador(computador, clienteASalvar);
		return "redirect:computadorForm";
	}
	
	@RequestMapping("/computadorList")
	public String funcionariosList(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			computadorListEAdicionaModel(model);
			return "admin/computador-list";
		} 
		if (session.getAttribute("tecnicoLogado") != null) {
			computadorListEAdicionaModel(model);
			return "funcionario/computador-list";
		} else {
			return "redirect:login";
		}
	}

	private void computadorListEAdicionaModel(Model model) {
		List<Computador> computadores = new ArrayList<Computador>();
		ComputadorDao dao = new ComputadorDao();
		computadores = dao.listaComputador();
		model.addAttribute("computadores", computadores);
	}
	
	@RequestMapping("/computadorListCliente")
	public String funcionariosListCliente(HttpSession session, String nomeDoCliente, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			computadorListPorClienteEAdiconaModel(nomeDoCliente, model);
			return "admin/computador-list";
		} 
		if (session.getAttribute("tecnicoLogado") != null) {
			computadorListPorClienteEAdiconaModel(nomeDoCliente, model);
			return "funcionario/computador-list";
		} else {
			return "redirect:login";
		}
	}

	private void computadorListPorClienteEAdiconaModel(String nomeDoCliente, Model model) {
		List<Computador> computadores = new ArrayList<Computador>();
		ComputadorDao dao = new ComputadorDao();
		ClienteDao daoCli = new ClienteDao();
		Cliente clienteEncontrado = daoCli.buscaNomeCliente(nomeDoCliente);
		computadores = dao.listaComputadorPorId(clienteEncontrado.getId());
		model.addAttribute("computadores", computadores);
	}
	
	@RequestMapping("/computadorEdit")
	public String computadorEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			computadorEditEAdicionaModel(id, model);	
			return "admin/computador-edit";
		} 
		if (session.getAttribute("tecnicoLogado") != null) {
			computadorEditEAdicionaModel(id, model);	
			return "funcionario/computador-edit";
		} else {
			return "redirect:login";
		}
	}

	private void computadorEditEAdicionaModel(Long id, Model model) {
		ComputadorDao dao = new ComputadorDao();
		PerifericosDao daoPerif = new PerifericosDao();
		Computador computadorEditado = new Computador();
		computadorEditado = dao.buscarPorId(id);
		model.addAttribute("computador", computadorEditado);
		model.addAttribute("perifericos", daoPerif.listaPerifericos());
	}
	
	@RequestMapping("/atualizarComputador")
	public String atualizar(Computador computador, String nomeCliente, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			atualizarComputadorMvc(computador, nomeCliente);
			return "redirect:computadorList";
		} 
		if (session.getAttribute("tecnicoLogado") != null) {
			atualizarComputadorMvc(computador, nomeCliente);
			return "redirect:computadorList";
		} else {
			return "redirect:computadorList";
		}
	}

	private void atualizarComputadorMvc(Computador computador,
			String nomeCliente) {
		ComputadorDao dao = new ComputadorDao();
		ClienteDao daoCli = new ClienteDao();
		Cliente clienteSalvar = daoCli.buscaNomeCliente(nomeCliente);
		dao.atualizar(computador, clienteSalvar);
	}
}