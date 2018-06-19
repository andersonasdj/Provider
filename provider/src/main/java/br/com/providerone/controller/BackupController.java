package br.com.providerone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.providerone.dao.SolicitacaoDao;

@Controller
public class BackupController {

	@RequestMapping("/backupDiario")
	public String backupDiario(HttpSession session, Model model) {
		if (session.getAttribute("funcionarioLogado") != null) {
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",daoSolicitacao.listarSolicitacoesBackupNaoConcluidas());
			return "admin/solicitacao-relatorio-backup";
		} else if (session.getAttribute("tecnicoLogado") != null) {
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			model.addAttribute("solicitacoes",daoSolicitacao.listarSolicitacoesBackupNaoConcluidas());
			return "funcionario/solicitacao-relatorio-backup";
		} else {
			return "redirect:login";
		}
	}

}
