package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.ClienteDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.Solicitacao;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "tela-login";
	}
	
	@RequestMapping("protocolo")
	public String exibirProtocolo(Long id, String senha, HttpSession session,
			Model model) {
		
		if(id == null && senha == null){
			return "protocolo-cliente";
			
		} else{
			SolicitacaoDao dao = new SolicitacaoDao();
			Solicitacao solicitacao = dao.buscaSolicitacaoId(id);
			
			if (solicitacao.getId() == id && solicitacao.getSenha().equals(senha)) {
				session.setAttribute("protocoloValido", solicitacao);
				return "protocolo/home-page-protocolo";
			}else{
				return "protocolo-cliente";
			}
		}
	}
	
	//para criação do primeiro usuario do sistema
	@RequestMapping("/create")
	public String create() {
		FuncionarioDao dao = new FuncionarioDao();
		if(dao.listaFuncionario().size() == 0){
			return "create-form";
		}
		else{
			return "tela-login";
		}
	}
	
	@RequestMapping("logar")
	public String logarTodos(String usuario, String senha, HttpSession session,
			Model model) {

		FuncionarioDao daoFun = new FuncionarioDao();
		ClienteDao daoCli = new ClienteDao();
		Funcionario funcionarioEncontrado = daoFun
				.buscaFuncionarioUsuarioESenha(usuario, senha);
		Cliente clienteEncontrado = daoCli.buscaClienteUsuarioESenha(usuario,
				senha);
		
		if (funcionarioEncontrado != null) {
			if (funcionarioEncontrado.getFuncao().equals("Supervisor")
					|| funcionarioEncontrado.getFuncao()
							.equals("Administrador")) {
						
				session.setAttribute("funcionarioLogado", funcionarioEncontrado);
				return salvaDataLoginEAdicionaModel(model, funcionarioEncontrado);
			} else {
				session.setAttribute("tecnicoLogado", funcionarioEncontrado);
				return salvaDataLoginEAdicionaModel(model, funcionarioEncontrado);
			}
		}
		if (clienteEncontrado != null) {
			session.setAttribute("clienteLogado", clienteEncontrado);
			model.addAttribute("cliente", clienteEncontrado);
			//System.out.println(clienteEncontrado.getNome());
			return "redirect:home";
		}
		return "redirect:login";
	}

	private String salvaDataLoginEAdicionaModel(Model model, Funcionario funcionarioEncontrado) {
		model.addAttribute("funcionario", funcionarioEncontrado);
		// Salva da data do ultimo Login
			FuncionarioDao daoFunLogin = new FuncionarioDao();
			daoFunLogin.buscarPorIdeSalvaDataLogin(funcionarioEncontrado.getId());
		// Salva da data do ultimo Login
		return "redirect:homePage";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect: login";
	}
}