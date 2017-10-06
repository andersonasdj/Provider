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
import br.com.providerone.modelo.Funcionario;
import br.com.providerone.modelo.ItemForm;

@Controller
public class ImageController {

	@Autowired private ServletContext context;
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String upload(Model model){
		model.addAttribute(new ItemForm());
		return "admin/upload";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(HttpSession session, ItemForm itemForm){
		
		Funcionario funcionario = (Funcionario) session.getAttribute("funcionarioLogado");
		System.out.println(funcionario.getNome());
		
		//context.getRealPath("alta.png");
		/*String caminhoCompleto = context.getRealPath("/");
		caminhoCompleto = caminhoCompleto.substring(0, caminhoCompleto.length() - 72);
		System.out.println(caminhoCompleto);
		String caminhoReal = caminhoCompleto+"/provider/src/main/webapp/assets/img/perfil/";
		*/
		String caminhoReal = "/home/techgol/appservers/apache-tomcat-8.0.23/webapps/provider/assets/img/perfil/";
		
		for(CommonsMultipartFile file:itemForm.getFiles()){
			if(file.getSize() > 0){
				
				try {
					
					BufferedImage bimg = ImageIO.read(file.getInputStream());
					
					Graphics g = bimg.getGraphics();
					
					Font fnt = new Font("Verdana", Font.PLAIN, 64);
					
					g.setFont(fnt);
					g.setColor(Color.RED);
					g.drawString("ProviderOne", 20, 70);
					
					File out = new File(caminhoReal+file.getOriginalFilename());
					
					ImageIO.write(bimg, "jpeg", out);
					
					String nomeFoto ="assets/img/perfil/"+file.getOriginalFilename();
					//String nomeFoto =caminhoReal+file.getOriginalFilename();
					//System.out.println(out.getAbsolutePath());
					
					funcionario.setCaminhoFoto(nomeFoto);
					FuncionarioDao dao = new FuncionarioDao();
					dao.atualizar(funcionario);
					
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
		return "admin/success";
	}
}
