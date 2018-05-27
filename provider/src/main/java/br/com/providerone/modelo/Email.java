package br.com.providerone.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Email {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String email;
	private String senha;
	private String smtp;
	private int portaSmtp;
	private String assunto;
	@Lob
	private String mensagem;
	private boolean sslStatus;
	private boolean autenticacao;
	private String funcaoDoEmail;
	private String cc;
	
	private String nomeAssinatura;
	private String numeroAssinatura;
	private String emailAssinatura;
	
	public Long getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getSenha() {
		return senha;
	}

	public String getSmtp() {
		return smtp;
	}

	public int getPortaSmtp() {
		return portaSmtp;
	}

	public String getAssunto() {
		return assunto;
	}

	public String getMenssagem() {
		return mensagem;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

	public void setPortaSmtp(int portaSmtp) {
		this.portaSmtp = portaSmtp;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public void setMenssagem(String menssagem) {
		this.mensagem = menssagem;
	}

	public boolean isSslStatus() {
		return sslStatus;
	}

	public boolean isAutenticacao() {
		return autenticacao;
	}

	public void setSslStatus(boolean sslStatus) {
		this.sslStatus = sslStatus;
	}

	public void setAutenticacao(boolean autenticacao) {
		this.autenticacao = autenticacao;
	}

	public String getMensagem() {
		return mensagem;
	}

	public String getFuncaoDoEmail() {
		return funcaoDoEmail;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public void setFuncaoDoEmail(String funcaoDoEmail) {
		this.funcaoDoEmail = funcaoDoEmail;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getNomeAssinatura() {
		return nomeAssinatura;
	}

	public void setNomeAssinatura(String nomeAssinatura) {
		this.nomeAssinatura = nomeAssinatura;
	}

	public String getNumeroAssinatura() {
		return numeroAssinatura;
	}

	public void setNumeroAssinatura(String numeroAssinatura) {
		this.numeroAssinatura = numeroAssinatura;
	}

	public String getEmailAssinatura() {
		return emailAssinatura;
	}

	public void setEmailAssinatura(String emailAssinatura) {
		this.emailAssinatura = emailAssinatura;
	}
}