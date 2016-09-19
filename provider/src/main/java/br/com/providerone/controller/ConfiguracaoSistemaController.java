package br.com.providerone.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.EmailDao;
import br.com.providerone.modelo.Email;

@Controller
public class ConfiguracaoSistemaController {

	@RequestMapping("/configEmail")
	public String configEmail(Model model, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			EmailDao daoEmail = new EmailDao();
			List<Email> emails = new ArrayList<Email>();
			emails = daoEmail.listaEmailConfig();
			
			if (emails.size() == 0){
				return "admin/configuracao-email-form";
			} else{
				EmailDao daoListaConfigEmail = new EmailDao();
				model.addAttribute("configuracoes", daoListaConfigEmail.listaEmailConfig());
				return "admin/configuracao-email-list";
			}
			
		} else {
			return "redirect:login";
		}
	}
	
	
	@RequestMapping("/editConfigEmail")
	public String editConfigEmail(Long id, Model model, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
		
			EmailDao emailDao = new EmailDao();
			Email emailConfig = emailDao.buscarPorId(id);
			
			model.addAttribute("emailConfig", emailConfig);
			return "admin/configuracao-email-edit";
			
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/salvarConfigEmail")
	public String salvarConfigEmail(Email email, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			EmailDao daoEmail = new EmailDao();
			daoEmail.salvar(email);
			
			return "redirect:homePage";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/atualizarConfigEmail")
	public String atualizarConfigEmail(Email email, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			
			EmailDao daoEmail = new EmailDao();
			daoEmail.atualizar(email);
			
			return "redirect:configEmail";
		} else {
			return "redirect:login";
		}
	}
	
}
