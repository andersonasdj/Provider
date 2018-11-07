package br.com.providerone.modelo;

import javax.persistence.Entity;

@Entity
public class Funcionario extends Usuario {

	private String funcao;
	private String caminhoFoto;
	private String celular;

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public String getCaminhoFoto() {
		return caminhoFoto;
	}

	public void setCaminhoFoto(String caminhoFoto) {
		this.caminhoFoto = caminhoFoto;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((caminhoFoto == null) ? 0 : caminhoFoto.hashCode());
		result = prime * result + ((funcao == null) ? 0 : funcao.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Funcionario other = (Funcionario) obj;
		if (caminhoFoto == null) {
			if (other.caminhoFoto != null)
				return false;
		} else if (!caminhoFoto.equals(other.caminhoFoto))
			return false;
		if (funcao == null) {
			if (other.funcao != null)
				return false;
		} else if (!funcao.equals(other.funcao))
			return false;
		return true;
	}
}