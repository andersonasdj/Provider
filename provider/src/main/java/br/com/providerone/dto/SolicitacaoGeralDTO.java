package br.com.providerone.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import br.com.providerone.modelo.Solicitacao;

public class SolicitacaoGeralDTO {
	
	private Long id;
	private String dataAbertura;
	private String dataAndamento;
	private String agendado;
	private String agendadoHora;
	private Calendar dataAtualizacao;
	private String cliente;
	private String funcionario;
	private String solicitante;
	private String usuario;
	private String prioridade;
	private String descricaoProblema;
	private String resolucao;
	private String status;
	private String obs;
	private String nivelDeIncidencia;
	private String onsiteOffsite;
	private String classificacao;
	private String statusEmail;
	private String abriuChamado;
	private String andamentoDoChamado;
	private String caminhoAnexo;
	private boolean vip;
	private boolean redFlag;
	private boolean play;
	private boolean excluido;
	

	public SolicitacaoGeralDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public SolicitacaoGeralDTO(Solicitacao solicitacao) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		SimpleDateFormat dtAgendado = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat hAgendado = new SimpleDateFormat("HH:mm");
		
		this.id = solicitacao.getId();
		this.dataAbertura = format1.format(solicitacao.getDataAbertura().getTime());
		if(solicitacao.getDataAndamento()!= null) {
			this.dataAndamento = format1.format(solicitacao.getDataAndamento().getTime());
		}
		if(solicitacao.getAgendado() != null) {
			this.agendado = dtAgendado.format(solicitacao.getAgendado().getTime());
		}
		if(solicitacao.getAgendadoHora() != null) {
			this.agendadoHora = hAgendado.format(solicitacao.getAgendadoHora().getTime());
		}
		
		this.cliente = solicitacao.getCliente().getNome();
		
		if(solicitacao.getFuncionario()!= null) {
			this.funcionario = solicitacao.getFuncionario().getNome();
		}
		this.solicitante = solicitacao.getSolicitante();
		this.usuario = solicitacao.getUsuario();
		this.prioridade = solicitacao.getPrioridade();
		this.descricaoProblema = solicitacao.getDescricaoProblema();
		this.resolucao = solicitacao.getResolucao();
		this.status = solicitacao.getStatus();
		this.obs = solicitacao.getObs();
		this.nivelDeIncidencia = solicitacao.getNivelDeIncidencia();
		this.onsiteOffsite = solicitacao.getOnsiteOffsite();
		this.classificacao = solicitacao.getClassificacao();
		this.statusEmail = solicitacao.getStatusEmail();
		this.abriuChamado = solicitacao.getAbriuChamado();
		this.andamentoDoChamado = solicitacao.getAndamentoDoChamado();
		this.caminhoAnexo = solicitacao.getCaminhoAnexo();
		this.vip = solicitacao.getCliente().isVip();
		this.redFlag = solicitacao.getCliente().isRedFlag();
		this.play = solicitacao.isPlay();
		this.excluido = solicitacao.isExcluido();
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDataAbertura() {
		return dataAbertura;
	}
	public void setDataAbertura(String dataAbertura) {
		this.dataAbertura = dataAbertura;
	}
	public String getDataAndamento() {
		return dataAndamento;
	}
	public void setDataAndamento(String dataAndamento) {
		this.dataAndamento = dataAndamento;
	}
	public String getAgendado() {
		return agendado;
	}
	public void setAgendado(String agendado) {
		this.agendado = agendado;
	}
	public String getAgendadoHora() {
		return agendadoHora;
	}
	public void setAgendadoHora(String agendadoHora) {
		this.agendadoHora = agendadoHora;
	}
	public Calendar getDataAtualizacao() {
		return dataAtualizacao;
	}
	public void setDataAtualizacao(Calendar dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(String funcionario) {
		this.funcionario = funcionario;
	}
	public String getSolicitante() {
		return solicitante;
	}
	public void setSolicitante(String solicitante) {
		this.solicitante = solicitante;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}
	public String getDescricaoProblema() {
		return descricaoProblema;
	}
	public void setDescricaoProblema(String descricaoProblema) {
		this.descricaoProblema = descricaoProblema;
	}
	public String getResolucao() {
		return resolucao;
	}
	public void setResolucao(String resolucao) {
		this.resolucao = resolucao;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public String getNivelDeIncidencia() {
		return nivelDeIncidencia;
	}
	public void setNivelDeIncidencia(String nivelDeIncidencia) {
		this.nivelDeIncidencia = nivelDeIncidencia;
	}
	public String getOnsiteOffsite() {
		return onsiteOffsite;
	}
	public void setOnsiteOffsite(String onsiteOffsite) {
		this.onsiteOffsite = onsiteOffsite;
	}
	public String getClassificacao() {
		return classificacao;
	}
	public void setClassificacao(String classificacao) {
		this.classificacao = classificacao;
	}
	public String getStatusEmail() {
		return statusEmail;
	}
	public void setStatusEmail(String statusEmail) {
		this.statusEmail = statusEmail;
	}
	public String getAbriuChamado() {
		return abriuChamado;
	}
	public void setAbriuChamado(String abriuChamado) {
		this.abriuChamado = abriuChamado;
	}
	public String getAndamentoDoChamado() {
		return andamentoDoChamado;
	}
	public void setAndamentoDoChamado(String andamentoDoChamado) {
		this.andamentoDoChamado = andamentoDoChamado;
	}
	public String getCaminhoAnexo() {
		return caminhoAnexo;
	}
	public void setCaminhoAnexo(String caminhoAnexo) {
		this.caminhoAnexo = caminhoAnexo;
	}

	public boolean isVip() {
		return vip;
	}

	public void setVip(boolean vip) {
		this.vip = vip;
	}

	public boolean isRedFlag() {
		return redFlag;
	}

	public void setRedFlag(boolean redFlag) {
		this.redFlag = redFlag;
	}

	public boolean isPlay() {
		return play;
	}

	public void setPlay(boolean play) {
		this.play = play;
	}
	
	public boolean isExcluido() {
		return excluido;
	}

	public void setExcluido(boolean excluido) {
		this.excluido = excluido;
	}
	
}
