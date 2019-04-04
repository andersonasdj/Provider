package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioClienteDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.FuncionarioCliente;

import com.google.gson.Gson;

@Controller
public class FuncionarioClienteController {

	@RequestMapping("/listarColaboradores")
	public String listarColaboradores(HttpSession session, Long id, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao daoFuncCliente = new FuncionarioClienteDao();
			model.addAttribute("funcionariosCliente",daoFuncCliente.listaFuncionariosCliente(id));
			model.addAttribute("clienteId",id);
			return funcionario.getFuncao()+"/colaborador-list";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/editarColaborador")
	public String editarColaboradores(HttpSession session, String funcionarioCliente, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao daoFuncCliente = new FuncionarioClienteDao();
			model.addAttribute("funcionario",daoFuncCliente.listaFuncionarioCliente(funcionarioCliente));
			return funcionario.getFuncao()+"/colaborador-edit";
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
	
	@RequestMapping("/atualizaColaborador")
	public String atualizaColaborador(HttpSession session, Long clienteId, FuncionarioCliente funcionarioCliente, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			dao.atualizar(funcionarioCliente);
			return "redirect:clientesList";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/removeFuncionarioCliente")
	public String removeFuncionarioCliente(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			FuncionarioCliente exclui = dao.buscaPorId(id);
			FuncionarioClienteDao daoExclui = new FuncionarioClienteDao();
			
			boolean result = daoExclui.excluirFuncionarioCliente(exclui.getIdFuncionario());
				if(result){
//					System.out.println("OK");
				} else {
//					System.out.println("falhou");
					FuncionarioClienteDao dao2 = new FuncionarioClienteDao();
					FuncionarioCliente exclui2 = dao2.buscaPorId(id);
					FuncionarioClienteDao daoExclui2 = new FuncionarioClienteDao();
					daoExclui2.excluirFuncionarioCliente(exclui2.getIdFuncionario());
				}
			
			return "redirect:clientesList";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping(value = "/listarColaboradoresForm", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarColaboradoresForm(HttpSession session, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
//			System.out.println(nomeCliente);
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
//			System.out.println(dao.listaFuncionariosCLiente().get(0).getNome());
			List<String> funcionarios = new ArrayList<String>();
			List<FuncionarioCliente> funcionariosList = new ArrayList<FuncionarioCliente>();
			funcionariosList = dao.listaFuncionariosClientePorNome(nomeCliente);
//			System.out.println("qtd fun list dao:" + funcionariosList.size());
			for (int i=0 ;funcionariosList.size()>i; i++){
//				System.out.println(funcionariosList.get(i).getNome());
				funcionarios.add(funcionariosList.get(i).getNome());
			}
			Gson gson = new Gson();
			String json = gson.toJson(funcionarios);
//			System.out.println("qtd fun list:" + funcionarios.size());
			return json;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/listarEmails", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarEmails(HttpSession session, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			List<String> funcionarios = new ArrayList<String>();
			List<FuncionarioCliente> funcionariosList = new ArrayList<FuncionarioCliente>();
			funcionariosList = dao.listaFuncionariosClientePorNome(nomeCliente);
			for (int i=0 ;funcionariosList.size()>i; i++){
				funcionarios.add(funcionariosList.get(i).getEmail());
			}
			Gson gson = new Gson();
			String json = gson.toJson(funcionarios);
			return json;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/getCargo", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getCargo(HttpSession session, String solicitante, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			String cargo = dao.listaFuncionarioClientePorNome(solicitante, nomeCliente);
			Gson gson = new Gson();
			String json = gson.toJson(cargo);
			return json;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/getFlag", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getFlag(HttpSession session, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			ClienteDao dao = new ClienteDao();
			Cliente cliente =  dao.buscaNomeCliente(nomeCliente);
			Gson gson = new Gson();
			String json = gson.toJson(cliente.isRedFlag());
			return json;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/getVip", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getVip(HttpSession session, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			ClienteDao dao = new ClienteDao();
			Cliente cliente =  dao.buscaNomeCliente(nomeCliente);
			Gson gson = new Gson();
			String json = gson.toJson(cliente.isVip());
			return json;
		} else {
			return null;
		}
	}
	
	/*
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
	 */
}
