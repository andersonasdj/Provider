package br.com.providerone.controller;

import java.io.UnsupportedEncodingException;
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
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.FuncionarioCliente;
import br.com.providerone.modelo.Solicitacao;

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
	
	@RequestMapping("/editarColaboradorId")
	public String editarColaboradoresId(HttpSession session, Long id, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao daoFuncCliente = new FuncionarioClienteDao();
			model.addAttribute("funcionario",daoFuncCliente.listaFuncionarioClienteId(id));
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
	public String gravaColaborador(HttpSession session, Long clienteId, String nome, String email, String cargo, String celular, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioCliente funcionarioCliente = new FuncionarioCliente();
			funcionarioCliente.setNome(nome);
			funcionarioCliente.setEmail(email);
			funcionarioCliente.setCargo(cargo);
			funcionarioCliente.setCelular(celular);
			ClienteDao clienteDao = new ClienteDao();
			Cliente cliente = clienteDao.buscarPorId(clienteId);
			funcionarioCliente.setCliente(cliente);
			FuncionarioClienteDao funcionarioClienteDao = new FuncionarioClienteDao();
			funcionarioClienteDao.salvar(funcionarioCliente);
			cliente.setFuncionarioCliente(funcionarioCliente);
			ClienteDao salvaClienteDao = new ClienteDao();
			salvaClienteDao.atualizar(cliente);
			
			return "redirect:listarColaboradores?id="+clienteId;
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
			return "redirect:listarColaboradores?id="+clienteId;
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/removeFuncionarioCliente")
	public String removeFuncionarioCliente(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			FuncionarioCliente exclui = dao.buscaPorId(id);
			Long idCliente = exclui.getCliente().getId();
			FuncionarioClienteDao daoExclui = new FuncionarioClienteDao();
			boolean result = daoExclui.excluirFuncionarioCliente(exclui.getIdFuncionario());
			if(result){
			} else {
				FuncionarioClienteDao dao2 = new FuncionarioClienteDao();
				FuncionarioCliente exclui2 = dao2.buscaPorId(id);
				FuncionarioClienteDao daoExclui2 = new FuncionarioClienteDao();
				daoExclui2.excluirFuncionarioCliente(exclui2.getIdFuncionario());
			}
			return "redirect:listarColaboradores?id="+idCliente;
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping(value = "/listarColaboradoresForm", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarColaboradoresForm(HttpSession session, String nomeCliente) throws UnsupportedEncodingException {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			List<String> funcionarios = new ArrayList<String>();
			List<FuncionarioCliente> funcionariosList = new ArrayList<FuncionarioCliente>();
			funcionariosList = dao.listaFuncionariosClientePorNome(nomeCliente);
			for (int i=0 ;funcionariosList.size()>i; i++){
				funcionarios.add(funcionariosList.get(i).getNome());
			}
			Gson gson = new Gson();
			String gsonString = gson.toJson(funcionarios);
			try {
				byte[] gsonBytes = gsonString.getBytes("UTF8");
				return new String(gsonBytes, "windows-1252");
			} catch (UnsupportedEncodingException e) {
				System.out.println(e);
				return null;
			}
			
			/*
			GsonBuilder builder = new GsonBuilder();
			builder.excludeFieldsWithModifiers(Modifier.TRANSIENT);
			builder.setPrettyPrinting();
			builder.disableHtmlEscaping();
			builder.serializeNulls();
			builder.serializeSpecialFloatingPointValues();
			Gson gson = builder.create();
			
			String gsonString = gson.toJson(funcionarios);
			byte[] gsonBytes = gsonString.getBytes("UTF8");
					
			System.out.println(new String(gsonBytes, "UTF8") );
			return new String(gsonBytes, "UTF8"); 
			*/
			
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
			return gson.toJson(funcionarios);
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
			String gsonString = gson.toJson(cargo);
			try {
				byte[] gsonBytes = gsonString.getBytes("UTF8");
				return new String(gsonBytes, "windows-1252");
			} catch (UnsupportedEncodingException e) {
				return null;
			}
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/getCel", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getCel(HttpSession session, String solicitante, String nomeCliente) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			FuncionarioClienteDao dao = new FuncionarioClienteDao();
			String cel = dao.listaFuncionarioClientePorCel(solicitante, nomeCliente);
			Gson gson = new Gson();
			return gson.toJson(cel);
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
			return gson.toJson(cliente.isRedFlag());
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
			return gson.toJson(cliente.isVip());
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/getIdLigacao", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getIdLigacao(HttpSession session, Long idLigacao) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			
			if(idLigacao != null){
				SolicitacaoDao dao = new SolicitacaoDao();
				Solicitacao solicitacao = dao.buscaSolicitacaoId(idLigacao);
				
				if(solicitacao != null){
					Gson gson = new Gson();
					return gson.toJson(solicitacao.getStatus());
				}else{
					Gson gson = new Gson();
					return gson.toJson("ID nao encontrado");
				}
				
			}else{
				Gson gson = new Gson();
				return gson.toJson("");
			}
			
		} else {
			return null;
		}
	}
	
}