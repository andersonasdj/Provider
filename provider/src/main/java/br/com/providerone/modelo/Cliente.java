package br.com.providerone.modelo;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Cliente extends Usuario {

	private String endereco;
	private String telefone1;
	private String cnpj;
	private String razaoSocial;
	private String responsavelTecnico;
	private boolean redFlag;
	private boolean vip;
	
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

	@OneToOne
	private FuncionarioCliente funcionarioCliente;
	
	
	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getResponsavelTecnico() {
		return responsavelTecnico;
	}

	public void setResponsavelTecnico(String responsavelTecnico) {
		this.responsavelTecnico = responsavelTecnico;
	}

	public FuncionarioCliente getFuncionarioCliente() {
		return funcionarioCliente;
	}

	public void setFuncionarioCliente(FuncionarioCliente funcionarioCliente) {
		this.funcionarioCliente = funcionarioCliente;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(cnpj, endereco, funcionarioCliente, razaoSocial, redFlag,
				responsavelTecnico, telefone1, vip);
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
		Cliente other = (Cliente) obj;
		return Objects.equals(cnpj, other.cnpj) && Objects.equals(endereco, other.endereco)
				&& Objects.equals(funcionarioCliente, other.funcionarioCliente)
				&& Objects.equals(razaoSocial, other.razaoSocial) && redFlag == other.redFlag
				&& Objects.equals(responsavelTecnico, other.responsavelTecnico)
				&& Objects.equals(telefone1, other.telefone1) && vip == other.vip;
	}
	
}