package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.modelo.Funcionario;

@Controller
@RequestMapping("/Backup")
public class BackupController {

	@RequestMapping("/backupDiario")
	public String backupDiario(HttpSession session, Model model) {
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",daoSolicitacao.listarSolicitacoesBackupNaoConcluidas());
			return funcionario.getFuncao()+"/Backup/relatorio-backup";
		} else {
			return "redirect:login";
		}
	}
}
