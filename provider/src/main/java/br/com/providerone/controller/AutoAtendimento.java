package br.com.providerone.controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.AutoAtendimentoDao;
import br.com.providerone.dao.ClienteDao;
import br.com.providerone.modelo.Cliente;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.FuncionarioCliente;
import br.com.providerone.modelo.Solicitacao;

@Controller
public class AutoAtendimento {

	@RequestMapping("/auto")
	public String login() {
		return "auto/nova";
	}
	
	@RequestMapping("/avancarAuto")
	public String avancarAuto(HttpSession session, String setor, Model model) {
		
		FuncionarioCliente funcionario = session.getAttribute("funcionarioLogado") != null?(FuncionarioCliente) session.getAttribute("funcionarioLogado"):null;
		if (funcionario != null) {
				if (setor == null ){
					model.addAttribute("funcionario", funcionario);
					return "auto/filtro";
				}else if(setor != null && setor.equals("Suporte")){
					model.addAttribute("funcionario", funcionario);
					model.addAttribute("setor", setor);
					return "auto/suporte01";
				}else if(setor != null && setor.equals("Financeiro")){
					model.addAttribute("funcionario", funcionario);
					model.addAttribute("setor", setor);
					return "auto/financeiro01";
				}else 
					return "redirect:auto";
				}
		else {
			return "redirect:auto";
		}
	}
	
	@RequestMapping("/avancarSuporte")
	public String avancarAuto2(HttpSession session, Model model, String setor, String classificacao) {
		FuncionarioCliente funcionario = session.getAttribute("funcionarioLogado") != null?(FuncionarioCliente) session.getAttribute("funcionarioLogado"):null;
		if (funcionario != null) {
			if(funcionario.getEmail() == null || funcionario.getCelular() == null) {
				return "redirect:auto";
			}else if(classificacao != null && classificacao.equals("Email")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_email";
			}else if(classificacao != null && classificacao.equals("Computador / Notebook")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_comp_note";
			}else if(classificacao != null && classificacao.equals("Acesso externo")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_acesso";
			}else if(classificacao != null && classificacao.equals("Cotação")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_cotacao";
			}else if(classificacao != null && classificacao.equals("SharePoint")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_sharepoint";
			}else if(classificacao != null && classificacao.equals("Certificado Digital")){
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("classificacao", classificacao);
				model.addAttribute("setor", setor);
				return "auto/suporte_certificado";
			}else
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("setor", setor);
				return "auto/suporte01";
		}else {
			return "redirect:auto";
		}
	}
	
	@RequestMapping("/salvarSuporte")
	public String salvarSuporte(Model model, String setor, String classificacao, String classproblema, String obs, HttpSession session) {
		
		FuncionarioCliente funcionario = session.getAttribute("funcionarioLogado") != null?(FuncionarioCliente) session.getAttribute("funcionarioLogado"):null;
		if (funcionario != null) {
			if(setor != null && classificacao != null && classproblema != null) {
				String observacao =  "- Email: " + funcionario.getEmail() + "\n- Celular: " + funcionario.getCelular() + "\n- Observação: " + obs;
				
				ClienteDao daoCliente = new ClienteDao();
				Cliente cliente = new Cliente();
				cliente = daoCliente.buscarPorId(funcionario.getCliente().getId());
				Funcionario funcionarioLog = new Funcionario();
				
				//##### MONTA SOLICITAÇÃO #####
				Solicitacao solicitacao = new Solicitacao();
				solicitacao.setDataAbertura(Calendar.getInstance());
				solicitacao.setCliente(cliente);
				solicitacao.setAbriuChamado(funcionario.getNome());
				solicitacao.setDescricaoProblema(classificacao + " - " + classproblema);
				solicitacao.setObs(observacao);
				solicitacao.setSenha(solicitacao.geraSenha());
				solicitacao.setUsuario(funcionario.getNome());
				solicitacao.setClassificacao("Outros");
				solicitacao.setStatus("Não Classificado");
				solicitacao.setSolicitante(funcionario.getNome());
				solicitacao.setPrioridade("Alta");
				solicitacao.setFormaAbertura("Cliente");
				String log = solicitacao.geraLogSolicitacao(funcionarioLog, cliente);
				solicitacao.setAndamentoDoChamado(log);
				//##### MONTA SOLICITAÇÃO #####
				AutoAtendimentoDao atendimentoDao = new AutoAtendimentoDao();
				atendimentoDao.salvaSuporte(solicitacao);
				session.invalidate();
				return "auto/sucesso";
			}else {
				model.addAttribute("funcionario", funcionario);
				model.addAttribute("setor", setor);
				model.addAttribute("classificacao", classificacao);
				return "redirect:avancarSuporte";
			}
		}else {
			return "redirect:auto";
		}
	}
}
