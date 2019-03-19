package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioClienteDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.FuncionarioCliente;

@Controller
public class FuncionarioClienteController {

	@RequestMapping("/listarColaboradores")
	public String listarColaboradores(HttpSession session, Long id, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			
			FuncionarioClienteDao daoFuncCliente = new FuncionarioClienteDao();
			model.addAttribute("funcionariosCliente",daoFuncCliente.listaFuncionariosCLiente());
			model.addAttribute("clienteId",id);
			return funcionario.getFuncao()+"/colaborador-list";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/colaboradorForm")
	public String colaboradorForm(HttpSession session, Long id, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			model.addAttribute("clienteId",id);
			return funcionario.getFuncao()+"/colaborador-form";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/gravaColaborador")
	public String gravaColaborador(HttpSession session, Long clienteId, String nome, String email, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioCliente funcionarioCliente = new FuncionarioCliente();
			funcionarioCliente.setNome(nome);
			funcionarioCliente.setEmail(email);
			System.out.println(clienteId);
			ClienteDao clienteDao = new ClienteDao();
			Cliente cliente = clienteDao.buscarPorId(clienteId);
			funcionarioCliente.setCliente(cliente);
			FuncionarioClienteDao funcionarioClienteDao = new FuncionarioClienteDao();
			funcionarioClienteDao.salvar(funcionarioCliente);
			cliente.setFuncionarioCliente(funcionarioCliente);
			
			ClienteDao salvaClienteDao = new ClienteDao();
			salvaClienteDao.atualizar(cliente);
			
			return "redirect:clientesList";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping(value = "/listarColaboradoresForm")
	@ResponseBody
	public String listarColaboradoresForm(HttpSession session, String nomeCliente, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			System.out.println(nomeCliente);
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			//System.out.println(dao.listaFuncionariosCLiente().get(0).getNome());
			return dao.listaFuncionariosClientePorNome(nomeCliente).get(0).getNome();
		} else {
			return null;
		}
	}

	
}
