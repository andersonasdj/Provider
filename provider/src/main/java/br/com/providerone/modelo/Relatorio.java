package br.com.providerone.modelo;

public class Relatorio {
	long id;
	String nome;
	Long qtdAberto, qtdAndamento, qtdAgendado, qtdAguardando, qtdTotal;
	
	public long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}


	public Long getQtdAberto() {
		return qtdAberto;
	}


	public Long getQtdAndamento() {
		return qtdAndamento;
	}


	public Long getQtdAgendado() {
		return qtdAgendado;
	}


	public Long getQtdAguardando() {
		return qtdAguardando;
	}


	public void setId(long id) {
		this.id = id;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public void setQtdAberto(Long qtdAberto) {
		this.qtdAberto = qtdAberto;
	}


	public void setQtdAndamento(Long qtdAndamento) {
		this.qtdAndamento = qtdAndamento;
	}


	public void setQtdAgendado(Long qtdAgendado) {
		this.qtdAgendado = qtdAgendado;
	}


	public void setQtdAguardando(Long qtdAguardando) {
		this.qtdAguardando = qtdAguardando;
	}

	public Long getQtdTotal() {
		return qtdTotal;
	}

	public void setQtdTotal(Long qtdTotal) {
		this.qtdTotal = qtdTotal;
	}

}
