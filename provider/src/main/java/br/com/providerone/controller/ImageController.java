package br.com.providerone.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.providerone.dao.FuncionarioDao;
import br.com.providerone.dao.SistemaDao;
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.ItemForm;
import br.com.providerone.modelo.Sistema;

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
		
		if (session.getAttribute("funcionarioLogado") != null) {
			Funcionario funcionario = (Funcionario) session.getAttribute("funcionarioLogado");
			
			SistemaDao sistemaDao = new SistemaDao();
			Sistema caminhoSistema = sistemaDao.listaSistemaConfig().get(0);			
			
			//String caminhoReal = "/home/techgol/appservers/apache-tomcat-8.0.23/webapps/provider/assets/img/perfil/";
			String caminhoReal = caminhoSistema.getCaminho();
			
			for(CommonsMultipartFile file:itemForm.getFiles()){
				if(file.getSize() > 0){
					
					try {
						BufferedImage bimg = ImageIO.read(file.getInputStream());
						
						Graphics g = bimg.getGraphics();
						Font fnt = new Font("Verdana", Font.PLAIN, 64);
						
						g.setFont(fnt);
						g.setColor(Color.RED);
						g.drawString("ProviderOne", 20, 70); //remover posteriormente essa linha
						
						File out = new File(caminhoReal+file.getOriginalFilename());
						ImageIO.write(bimg, "jpeg", out);
						String nomeFoto ="assets/img/perfil/"+file.getOriginalFilename();
						funcionario.setCaminhoFoto(nomeFoto);
						FuncionarioDao dao = new FuncionarioDao();
						dao.atualizar(funcionario);
					} catch (Exception e) {
						
					}
				}
			}
			return "Administrador/success";
			
		}if (session.getAttribute("tecnicoLogado") != null) {
			
			Funcionario funcionario = (Funcionario) session.getAttribute("tecnicoLogado");
			SistemaDao sistemaDao = new SistemaDao();
			Sistema caminhoSistema = sistemaDao.listaSistemaConfig().get(0);			
			
			//String caminhoReal = "/home/techgol/appservers/apache-tomcat-8.0.23/webapps/provider/assets/img/perfil/";
			String caminhoReal = caminhoSistema.getCaminho();
			
			for(CommonsMultipartFile file:itemForm.getFiles()){
				if(file.getSize() > 0){
					
					try {
						
						BufferedImage bimg = ImageIO.read(file.getInputStream());
						Graphics g = bimg.getGraphics();
						Font fnt = new Font("Verdana", Font.PLAIN, 64);
						
						g.setFont(fnt);
						g.setColor(Color.RED);
						g.drawString("ProviderOne", 20, 70); //remover posteriormente essa linha
						
						File out = new File(caminhoReal+file.getOriginalFilename());
						ImageIO.write(bimg, "jpeg", out);
						String nomeFoto ="assets/img/perfil/"+file.getOriginalFilename();
						funcionario.setCaminhoFoto(nomeFoto);
						FuncionarioDao dao = new FuncionarioDao();
						dao.atualizar(funcionario);
					} catch (Exception e) {

					}
				}
			}
			return "Administrador/success";
		}
		return "redirect:loginFuncionario";
	}
}