package br.com.providerone.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Tarefa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idTarefa;
	private String descricaoTarefa;
	private String obs;
	private String statusTarefa;
	private String responsavelTarefa;

	@OneToOne
	private Projeto projeto;
	
	public void setIdTarefa(Long idTarefa) {
		this.idTarefa = idTarefa;
	}
	
	public Long getIdTarefa() {
		return idTarefa;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public String getDescricaoTarefa() {
		return descricaoTarefa;
	}

	public String getObs() {
		return obs;
	}

	public String getStatusTarefa() {
		return statusTarefa;
	}

	public String getResponsavelTarefa() {
		return responsavelTarefa;
	}

	public void setDescricaoTarefa(String descricaoTarefa) {
		this.descricaoTarefa = descricaoTarefa;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	public void setStatusTarefa(String statusTarefa) {
		this.statusTarefa = statusTarefa;
	}

	public void setResponsavelTarefa(String responsavelTarefa) {
		this.responsavelTarefa = responsavelTarefa;
	}

}
