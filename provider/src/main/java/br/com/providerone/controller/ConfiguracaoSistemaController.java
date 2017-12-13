package br.com.providerone.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.EmailDao;
import br.com.providerone.dao.SistemaDao;
import br.com.providerone.modelo.Email;
import br.com.providerone.modelo.Sistema;

@Controller
public class ConfiguracaoSistemaController {
	
	@RequestMapping("/config")
	public String config(Model model, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
				return "admin/config";
		} else {
			return "redirect:login";
		}
	}

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
	
	@RequestMapping("/configImg")
	public String configImg(Model model, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SistemaDao dao = new SistemaDao();
			List<Sistema> sistema = new ArrayList<Sistema>();
			sistema	= dao.listaSistemaConfig();
			if(sistema.size() == 0){
				return "admin/configuracao-img";
			} else {
				SistemaDao daoSistemaImg = new SistemaDao();
				model.addAttribute("sistemas", daoSistemaImg.listaSistemaConfig());
				return "admin/configuracao-img-list";
			}
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/salvarConfigImg")
	public String salvarConfigImg(Sistema sistema, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			if(sistema.getId() != null){
				SistemaDao dao = new SistemaDao();
				dao.atualizar(sistema);
			} if (sistema.getId() == null) {
				SistemaDao dao = new SistemaDao();
				dao.salvar(sistema);
			}
			return "redirect:homePage";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/editConfigImg")
	public String editConfigImg(Long id, Model model, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SistemaDao sistemalDao = new SistemaDao();
			Sistema imgConfig = sistemalDao.buscarPorId(id);
			model.addAttribute("imgConfig", imgConfig);
			return "admin/configuracao-img-edit";
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