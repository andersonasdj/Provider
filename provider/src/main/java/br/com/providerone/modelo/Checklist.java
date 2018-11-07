package br.com.providerone.modelo;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Checklist {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Long numeroChecklist;
	private String tituloChecklist;
	private String nomeCliente;
	private String nomeResponsavel;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Calendar dataCriacao;

	public Long getId() {
		return id;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public Calendar getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Calendar dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public Long getNumeroChecklist() {
		return numeroChecklist;
	}

	public void setNumeroChecklist(Long numeroChecklist) {
		this.numeroChecklist = numeroChecklist;
	}

	public String getTituloChecklist() {
		return tituloChecklist;
	}

	public void setTituloChecklist(String tituloChecklist) {
		this.tituloChecklist = tituloChecklist;
	}
}