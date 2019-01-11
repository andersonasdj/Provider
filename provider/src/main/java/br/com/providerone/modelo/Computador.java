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
	private Double frequenciaProcessador;
	private int qtdMemoria;	
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
	private boolean ssd;
	private Double pontos;

	public Double getPontos() {
		return pontos;
	}

	public void setPontos(Double pontos) {
		this.pontos = pontos;
	}

	public boolean isSsd() {
		return ssd;
	}

	public void setSsd(boolean ssd) {
		this.ssd = ssd;
	}

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

	public Double getFrequenciaProcessador() {
		return frequenciaProcessador;
	}

	public int getQtdMemoria() {
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

	public void setFrequenciaProcessador(Double frequenciaProcessador) {
		this.frequenciaProcessador = frequenciaProcessador;
	}

	public void setQtdMemoria(int qtdMemoria) {
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
	
	public void calculaDesempenho(){
		double val=0.0;
		
		if(this.marca.toLowerCase().contains("dell") || this.marca.toLowerCase().contains("lenovo")){
			val += 0.5;
		}else if(this.marca.toLowerCase().contains("sony") || this.marca.toLowerCase().contains("ibm")){
			val += 0.5;
		}
	
		if(this.modeloProcessador.toLowerCase().contains("intel")){
			val += 0.5;
		}
		
		if(this.familia.toLowerCase().contains("core")){
			val += 2.0;
		} else if(this.familia.toLowerCase().contains("xeon")){
			val += 3.0;
		} else if(this.familia.toLowerCase().contains("phenom ii")){
			val += 1.0;
		} else {
			val += 1.0;
		}
		
		if(this.tipoProcessador.toLowerCase().contains("e3-1220")){
			val += 4.0;
		}else if(this.tipoProcessador.toLowerCase().contains("i7")){
			val += 3.0;
		}else if(this.tipoProcessador.toLowerCase().contains("i5")){
			val += 2.5;
		}else if(this.tipoProcessador.toLowerCase().contains("i3")){
			val += 2.0;
		}else if(this.tipoProcessador.toLowerCase().contains("2 quad")){
			val += 1.5;
		}else if(this.tipoProcessador.toLowerCase().contains("2 duo")){
			val += 1.0;
		} else{
			val += 0.5;
		}
		
		if(this.frequenciaProcessador < 1.5){
			val += 0.5;
		}else if(this.frequenciaProcessador >= 1.5 && this.frequenciaProcessador <= 2.0){
			val += 1.0;
		}else if(this.frequenciaProcessador > 2.0){
			val += 1.5;
		}
		
		if(this.qtdMemoria < 4096){
			val += 0.5;
		}else if(this.qtdMemoria == 4096){
			val += 1.0;
		}else if(this.qtdMemoria > 4096 && this.qtdMemoria < 6144){
			val += 1.5;
		}else if(this.qtdMemoria > 6144 && this.qtdMemoria >= 8192){
			val += 2.0;
		}else if(this.qtdMemoria > 8192){
			val += 3.0;
		}
		
		if(this.ssd){
			val += 2.0;
		}
		
		this.pontos = val;
	}
}