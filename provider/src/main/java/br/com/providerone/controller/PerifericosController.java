package br.com.providerone.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.com.providerone.dao.PerifericosDao;
import br.com.providerone.modelo.Perifericos;

@Controller
public class PerifericosController {

	@RequestMapping("/perifericosForm")
	public String perifericosForm(HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			return "admin/perifericos-form";
		} else {
			return "redirect:loginFuncionario";
		}
	}

	@RequestMapping("/gravaPeriferico")
	public String gravaUsuario(Perifericos periferico) {		
		PerifericosDao dao = new PerifericosDao();
		dao.salvar(periferico);
		return "redirect:perifericosForm";
	}

	@RequestMapping("/atualizarPeriferico")
	public String atualizar(Perifericos periferico, HttpSession session) {
		if (session.getAttribute("funcionarioLogado") != null) {
			PerifericosDao dao = new PerifericosDao();
			dao.atualizar(periferico);
			return "redirect:perifericosList";
		} else {
			return "redirect:perifericosList";
		}
	}

	@RequestMapping("/perifericosList")
	public String funcionariosList(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			List<Perifericos> perifericos = new ArrayList<Perifericos>();
			PerifericosDao dao = new PerifericosDao();
			perifericos = dao.listaPerifericos();
			model.addAttribute("perifericos", perifericos);
			return "admin/perifericos-list";
		} else {
			return "redirect:homePage";
		}
	}

	@RequestMapping("/perifericoEdit")
	public String funcionarioEdit(Long id, HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			PerifericosDao dao = new PerifericosDao();
			Perifericos perifericoEditado = new Perifericos();
			perifericoEditado = dao.buscarPorId(id);
			model.addAttribute("periferico", perifericoEditado);
			return "admin/periferico-edit";
		} else {
			return "redirect:loginFuncionario";
		}
	}
}