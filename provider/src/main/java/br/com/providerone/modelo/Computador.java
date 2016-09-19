package br.com.providerone.modelo;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Computador {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String funcao;
	private String nomeComputador;
	private String nomeDoUsuario;
	private String marca;
	private String modeloProcessador;
	private String familia;
	private String tipoProcessador;
	private String frequenciaProcessador;
	private String qtdMemoria;	
	private String qtdHd;
	private String sistemaOperacionalInstalado;
	private String officeInstalado;
	private String sistemaOperacionalLicenciado;
	private String officeLicenciado;
	private String antiVirus;
	private String serviceTag;
	private String obs;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar dataAtualizacao;
	@OneToOne
	private Cliente cliente;
	private String serialWindows;
	private String serialOffice;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Calendar expiracaoAV;
	private String status;

	public Long getId() {
		return id;
	}

	public String getNomeComputador() {
		return nomeComputador;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public String getNomeDoUsuario() {
		return nomeDoUsuario;
	}

	public String getMarca() {
		return marca;
	}

	public String getModeloProcessador() {
		return modeloProcessador;
	}

	public String getTipoProcessador() {
		return tipoProcessador;
	}

	public String getFrequenciaProcessador() {
		return frequenciaProcessador;
	}

	public String getQtdMemoria() {
		return qtdMemoria;
	}

	public String getQtdHd() {
		return qtdHd;
	}

	public String getSistemaOperacionalInstalado() {
		return sistemaOperacionalInstalado;
	}

	public String getOfficeInstalado() {
		return officeInstalado;
	}

	public String getSistemaOperacionalLicenciado() {
		return sistemaOperacionalLicenciado;
	}

	public String getOfficeLicenciado() {
		return officeLicenciado;
	}

	public String getAntiVirus() {
		return antiVirus;
	}

	public String getServiceTag() {
		return serviceTag;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNomeComputador(String nomeComputador) {
		this.nomeComputador = nomeComputador;
	}

	public void setNomeDoUsuario(String nomeDoUsuario) {
		this.nomeDoUsuario = nomeDoUsuario;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public void setModeloProcessador(String modeloProcessador) {
		this.modeloProcessador = modeloProcessador;
	}

	public String getFamilia() {
		return familia;
	}

	public void setFamilia(String familia) {
		this.familia = familia;
	}

	public void setTipoProcessador(String tipoProcessador) {
		this.tipoProcessador = tipoProcessador;
	}

	public void setFrequenciaProcessador(String frequenciaProcessador) {
		this.frequenciaProcessador = frequenciaProcessador;
	}

	public void setQtdMemoria(String qtdMemoria) {
		this.qtdMemoria = qtdMemoria;
	}

	public void setQtdHd(String qtdHd) {
		this.qtdHd = qtdHd;
	}

	public String getSerialWindows() {
		return serialWindows;
	}

	public String getSerialOffice() {
		return serialOffice;
	}

	public void setSerialWindows(String serialWindows) {
		this.serialWindows = serialWindows;
	}

	public void setSerialOffice(String serialOffice) {
		this.serialOffice = serialOffice;
	}

	public void setSistemaOperacionalInstalado(String sistemaOperacionalInstalado) {
		this.sistemaOperacionalInstalado = sistemaOperacionalInstalado;
	}

	public void setOfficeInstalado(String officeInstalado) {
		this.officeInstalado = officeInstalado;
	}

	public void setSistemaOperacionalLicenciado(String sistemaOperacionalLicenciado) {
		this.sistemaOperacionalLicenciado = sistemaOperacionalLicenciado;
	}

	public void setOfficeLicenciado(String officeLicenciado) {
		this.officeLicenciado = officeLicenciado;
	}

	public void setAntiVirus(String antiVirus) {
		this.antiVirus = antiVirus;
	}

	public void setServiceTag(String serviceTag) {
		this.serviceTag = serviceTag;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Calendar getDataAtualizacao() {
		return dataAtualizacao;
	}

	public void setDataAtualizacao(Calendar dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	public Calendar getExpiracaoAV() {
		return expiracaoAV;
	}

	public void setExpiracaoAV(Calendar expiracaoAV) {
		this.expiracaoAV = expiracaoAV;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}