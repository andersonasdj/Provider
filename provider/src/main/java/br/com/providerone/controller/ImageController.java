package br.com.providerone.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.providerone.dao.CheckListDao;
import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SistemaDao;
import br.com.providerone.dao.SolicitacaoDao;
import br.com.providerone.dao.TarefaDao;
import br.com.providerone.modelo.Checklist;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.ItemForm;
import br.com.providerone.modelo.Sistema;
import br.com.providerone.modelo.Solicitacao;
import br.com.providerone.modelo.Tarefa;

@Controller
public class ImageController {

	@Autowired private ServletContext context;
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String upload(HttpSession session, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			model.addAttribute(new ItemForm());
			return funcionario.getFuncao()+"/upload";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(HttpSession session, ItemForm itemForm){
		Funcionario funcionarioLogado = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionarioLogado != null) {
			SistemaDao sistemaDao = new SistemaDao();
			Sistema caminhoSistema = sistemaDao.listaSistemaConfig().get(0);			
			String caminhoReal = caminhoSistema.getCaminho();
			
			for(CommonsMultipartFile file:itemForm.getFiles()){
				if(file.getSize() > 0){
					try {
						BufferedImage bimg = ImageIO.read(file.getInputStream());
						File out = new File(caminhoReal+file.getOriginalFilename());
						ImageIO.write(bimg, "jpeg", out);
						String nomeFoto ="assets/img/perfil/"+file.getOriginalFilename();
						funcionarioLogado.setCaminhoFoto(nomeFoto);
						FuncionarioDao dao = new FuncionarioDao();
						dao.atualizar(funcionarioLogado);
					} catch (Exception e) {
						
					}
				}
			}
			return funcionarioLogado.getFuncao()+"/success";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping(value="/uploadAnexo", method=RequestMethod.GET)
	public String uploadAnexo(HttpSession session, Long idTarefa, Long idChecklist, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			model.addAttribute("idTarefa", idTarefa);
			model.addAttribute("idChecklist", idChecklist);
			model.addAttribute(new ItemForm());
			return funcionario.getFuncao()+"/upload-anexo";
		}else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping(value="/uploadAnexo", method=RequestMethod.POST)
	public String uploadAnexo(HttpSession session, Long idTarefa, Long idChecklist, ItemForm itemForm, Model model){
		Funcionario funcionarioLogado = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionarioLogado != null) {
			SistemaDao daoSistema = new SistemaDao();
			Sistema sistema = new Sistema();
			sistema = daoSistema.listaSistemaConfig().get(0);
			String caminhoReal = sistema.getPathGed();
			String diretorioDoAnexo;
			if(sistema.isServidorLinux()){
				diretorioDoAnexo = "Checklist"+"/"+idChecklist+"/"+idTarefa+"/" ;
			} else{
				diretorioDoAnexo = "Checklist"+"\\"+idChecklist+"\\"+idTarefa+"\\" ;
			}
			
			TarefaDao daoTarefa = new TarefaDao();
			Tarefa tarefa = daoTarefa.buscaPorId(idTarefa);
			CheckListDao daoChecklist =  new CheckListDao();
			Checklist checklist = daoChecklist.buscaPorId(idChecklist);
			
			try {
				File diretorio = new File(caminhoReal+diretorioDoAnexo);
				diretorio.mkdirs();
			} catch (Exception e) {
				
			}
			
			for(CommonsMultipartFile file:itemForm.getFiles()){
				if(file.getSize() > 0){
					try {
						byte[] bytes = file.getBytes();
						Path path = Paths.get(caminhoReal+diretorioDoAnexo+file.getOriginalFilename());
						tarefa.setCaminhoAnexo(file.getOriginalFilename());
						Files.write(path, bytes);
					} catch (Exception e) {
						
					}
				}
			}
			TarefaDao daoTarefaAtualizar = new TarefaDao();
			daoTarefaAtualizar.atualizar(tarefa, checklist);
			model.addAttribute("id",idChecklist);
			return funcionarioLogado.getFuncao()+"/success-anexo";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
    public HttpEntity<byte[]> download(Long idTarefa, Long idChecklist) throws IOException {
    	SistemaDao daoSistema = new SistemaDao();
		Sistema sistema = new Sistema();
		sistema = daoSistema.listaSistemaConfig().get(0);
		String caminhoReal = sistema.getPathGed();
		String diretorioDoAnexo;
		if(sistema.isServidorLinux()){
			diretorioDoAnexo = "Checklist"+"/"+idChecklist+"/"+idTarefa+"/" ;
		} else{
			diretorioDoAnexo = "Checklist"+"\\"+idChecklist+"\\"+idTarefa+"\\" ;
		}
    	TarefaDao dao = new TarefaDao();
    	Tarefa tarefa = dao.buscaPorId(idTarefa);
    	byte[] arquivo = Files.readAllBytes( Paths.get(caminhoReal+diretorioDoAnexo+tarefa.getCaminhoAnexo()) );
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Disposition", "attachment;filename=\""+tarefa.getCaminhoAnexo());
        HttpEntity<byte[]> entity = new HttpEntity<byte[]>( arquivo, httpHeaders);
        return entity;
    }
    
    @RequestMapping(value="/uploadAnexoSolicitacao", method=RequestMethod.GET)
	public String uploadAnexoSolicitacao(HttpSession session, Long id, Model model){
		Funcionario funcionario = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionario != null) {
			model.addAttribute("id", id);
			model.addAttribute(new ItemForm());
			return funcionario.getFuncao()+"/upload-anexo-solicitacao";
		}else {
			return "redirect:loginFuncionario";
		}
	}
    
    @RequestMapping(value="/uploadAnexoSolicitacao", method=RequestMethod.POST)
	public String uploadAnexoSolicitacao(HttpSession session, Long id, ItemForm itemForm, Model model){
		Funcionario funcionarioLogado = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
		if (funcionarioLogado != null) {
			SistemaDao daoSistema = new SistemaDao();
			Sistema sistema = new Sistema();
			sistema = daoSistema.listaSistemaConfig().get(0);
			String caminhoReal = sistema.getPathGed();
			String diretorioDoAnexo;
			if(sistema.isServidorLinux()){
				diretorioDoAnexo = "Solicitacao"+"/"+id+"/" ;
			} else{
				diretorioDoAnexo = "Solicitacao"+"\\"+id+"\\" ;
			}
			
			SolicitacaoDao daoSolicitacao = new SolicitacaoDao();
			Solicitacao solicitacao = daoSolicitacao.buscaSolicitacaoId(id);
			
			try {
				File diretorio = new File(caminhoReal+diretorioDoAnexo);
				diretorio.mkdirs();
			} catch (Exception e) {
				
			}
			
			for(CommonsMultipartFile file:itemForm.getFiles()){
				if(file.getSize() > 0){
					try {
						byte[] bytes = file.getBytes();
						Path path = Paths.get(caminhoReal+diretorioDoAnexo+file.getOriginalFilename());
						solicitacao.setCaminhoAnexo(file.getOriginalFilename());
						Files.write(path, bytes);
					} catch (Exception e) {
						
					}
				}
			}
			SolicitacaoDao daoSolicitacaoAtualizar = new SolicitacaoDao();
			daoSolicitacaoAtualizar.atualizarSolicitacao(solicitacao);
			model.addAttribute("id",id);
			return funcionarioLogado.getFuncao()+"/success-anexo-solicitacao";
		} else {
			return "redirect:loginFuncionario";
		}
	}
	
    @RequestMapping(value = "/downloadAnexoSolicitacao", method = RequestMethod.GET)
    public HttpEntity<byte[]> downloadAnexoSolicitacao(Long id) throws IOException {
    	SistemaDao daoSistema = new SistemaDao();
		Sistema sistema = new Sistema();
		sistema = daoSistema.listaSistemaConfig().get(0);
		String caminhoReal = sistema.getPathGed();
		String diretorioDoAnexo;
		if(sistema.isServidorLinux()){
			diretorioDoAnexo = "Solicitacao"+"/"+id+"/" ;
		} else{
			diretorioDoAnexo = "Solicitacao"+"\\"+id+"\\" ;
		}
    	SolicitacaoDao dao = new SolicitacaoDao();
    	Solicitacao solicitacao = dao.buscaSolicitacaoId(id);
    	byte[] arquivo = Files.readAllBytes( Paths.get(caminhoReal+diretorioDoAnexo+solicitacao.getCaminhoAnexo()) );
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Disposition", "attachment;filename=\""+solicitacao.getCaminhoAnexo());
        HttpEntity<byte[]> entity = new HttpEntity<byte[]>( arquivo, httpHeaders);
        return entity;
    }
    
    @RequestMapping(value = "/deleteAnexoSolicitacao", method = RequestMethod.GET)
    public String deleteAnexoSolicitacao(HttpSession session, Long id) throws IOException {
    	Funcionario funcionarioLogado = session.getAttribute("funcionarioLogado") != null?(Funcionario) session.getAttribute("funcionarioLogado"):(Funcionario) session.getAttribute("tecnicoLogado");
    	if (funcionarioLogado != null) {
	    	SistemaDao daoSistema = new SistemaDao();
			Sistema sistema = new Sistema();
			sistema = daoSistema.listaSistemaConfig().get(0);
			String caminhoReal = sistema.getPathGed();
			String diretorioDoAnexo;
			if(sistema.isServidorLinux()){
				diretorioDoAnexo = "Solicitacao"+"/"+id+"/" ;
			} else{
				diretorioDoAnexo = "Solicitacao"+"\\"+id+"\\" ;
			}	
	    	SolicitacaoDao dao = new SolicitacaoDao();
	    	Solicitacao solicitacao = dao.buscaSolicitacaoId(id);
	    	File pasta = new File(caminhoReal+diretorioDoAnexo);
	    	File[] arquivos = pasta.listFiles();
	    	for(File arquivo : arquivos){
	    		if(solicitacao.getCaminhoAnexo()!= null){
	    			arquivo.delete();
	    			solicitacao.setCaminhoAnexo(null);
	    			SolicitacaoDao daoSolicitacaoAtualizar = new SolicitacaoDao();
	    			daoSolicitacaoAtualizar.atualizarSolicitacao(solicitacao);
	    		}
	    	}
	        return funcionarioLogado.getFuncao()+"/success-delete";
    	} else {
			return "redirect:loginFuncionario";
		}
    }
}