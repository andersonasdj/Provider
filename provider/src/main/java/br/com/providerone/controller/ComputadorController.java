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
import br.com.providerone.modelo.Funcionario;

@Controller
public class ComputadorController {
	
	@RequestMapping("/computadorForm")
	public String computadorForm(HttpSession session, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			computadorFormAdiconaModel(model);	
			return funcionario.getFuncao()+"/computador-form";
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
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			return salvaComputadorEAdicionaModel(computador, nomeDoCliente);
		} else {
			return "redirect:login";
		}
	}

	private String salvaComputadorEAdicionaModel(Computador computador,
			String nomeDoCliente) {
		ClienteDao daoCli = new ClienteDao();
		Cliente clienteASalvar = daoCli.buscaNomeCliente(nomeDoCliente);	
		ComputadorDao dao = new ComputadorDao();
		computador.calculaDesempenho();
		dao.salvaComputador(computador, clienteASalvar);
		return "redirect:computadorForm";
	}
	
	@RequestMapping("/computadorList")
	public String funcionariosList(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			computadorListEAdicionaModel(model);
			return funcionario.getFuncao()+"/computador-list";
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
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			computadorListPorClienteEAdiconaModel(nomeDoCliente, model);
			return funcionario.getFuncao()+"/computador-list";
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
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			computadorEditEAdicionaModel(id, model);	
			return funcionario.getFuncao()+"/computador-edit";
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
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			atualizarComputadorMvc(computador, nomeCliente);
			return "redirect:computadorList";
		} else {
			return "redirect:computadorList";
		}
	}

	private void atualizarComputadorMvc(Computador computador, String nomeCliente) {
		ComputadorDao dao = new ComputadorDao();
		ClienteDao daoCli = new ClienteDao();
		Cliente clienteSalvar = daoCli.buscaNomeCliente(nomeCliente);
		computador.calculaDesempenho();
		dao.atualizar(computador, clienteSalvar);
	}
}