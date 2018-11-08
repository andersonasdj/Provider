package br.com.providerone.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Entity
public class Tarefa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idTarefa;
	private Long numero;
	private String descricaoTarefa;
	private String obs;
	private String responsavelTarefa;
	
	@Lob
	private String obsComplementares;

	@OneToOne
	private Checklist checklist;
	
	public void setIdTarefa(Long idTarefa) {
		this.idTarefa = idTarefa;
	}
	
	public Long getIdTarefa() {
		return idTarefa;
	}

	public Checklist getChecklist() {
		return checklist;
	}

	public void setChecklist(Checklist checklist) {
		this.checklist = checklist;
	}

	public String getDescricaoTarefa() {
		return descricaoTarefa;
	}

	public String getObs() {
		return obs;
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

	public void setResponsavelTarefa(String responsavelTarefa) {
		this.responsavelTarefa = responsavelTarefa;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public String getObsComplementares() {
		return obsComplementares;
	}

	public void setObsComplementares(String obsComplementares) {
		this.obsComplementares = obsComplementares;
	}

}
