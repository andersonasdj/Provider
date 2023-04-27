package br.com.providerone.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Perifericos {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String marcaProcessador;
	private String modeloProcessador;
	private String familia;
	private String tipoProcessador;
	private String marcaComputador;
	private String qtdMemoria;
	private String qtdHd;
	private String sistemaOperacionalInstalado;
	private String officeInstalado;
	private String antiVirus;

	public Long getId() {
		return id;
	}

	public String getMarcaProcessador() {
		return marcaProcessador;
	}

	public String getModeloProcessador() {
		return modeloProcessador;
	}

	public String getFamilia() {
		return familia;
	}

	public void setFamilia(String familia) {
		this.familia = familia;
	}

	public String getTipoProcessador() {
		return tipoProcessador;
	}

	public String getMarcaComputador() {
		return marcaComputador;
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

	public String getAntiVirus() {
		return antiVirus;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setMarcaProcessador(String marcaProcessador) {
		this.marcaProcessador = marcaProcessador;
	}

	public void setModeloProcessador(String modeloProcessador) {
		this.modeloProcessador = modeloProcessador;
	}

	public void setTipoProcessador(String tipoProcessador) {
		this.tipoProcessador = tipoProcessador;
	}

	public void setMarcaComputador(String marcaComputador) {
		this.marcaComputador = marcaComputador;
	}

	public void setQtdMemoria(String qtdMemoria) {
		this.qtdMemoria = qtdMemoria;
	}

	public void setQtdHd(String qtdHd) {
		this.qtdHd = qtdHd;
	}

	public void setSistemaOperacionalInstalado(
			String sistemaOperacionalInstalado) {
		this.sistemaOperacionalInstalado = sistemaOperacionalInstalado;
	}

	public void setOfficeInstalado(String officeInstalado) {
		this.officeInstalado = officeInstalado;
	}

	public void setAntiVirus(String antiVirus) {
		this.antiVirus = antiVirus;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((antiVirus == null) ? 0 : antiVirus.hashCode());
		result = prime * result + ((familia == null) ? 0 : familia.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((marcaComputador == null) ? 0 : marcaComputador.hashCode());
		result = prime
				* result
				+ ((marcaProcessador == null) ? 0 : marcaProcessador.hashCode());
		result = prime
				* result
				+ ((modeloProcessador == null) ? 0 : modeloProcessador
						.hashCode());
		result = prime * result
				+ ((officeInstalado == null) ? 0 : officeInstalado.hashCode());
		result = prime * result + ((qtdHd == null) ? 0 : qtdHd.hashCode());
		result = prime * result
				+ ((qtdMemoria == null) ? 0 : qtdMemoria.hashCode());
		result = prime
				* result
				+ ((sistemaOperacionalInstalado == null) ? 0
						: sistemaOperacionalInstalado.hashCode());
		result = prime * result
				+ ((tipoProcessador == null) ? 0 : tipoProcessador.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Perifericos other = (Perifericos) obj;
		if (antiVirus == null) {
			if (other.antiVirus != null)
				return false;
		} else if (!antiVirus.equals(other.antiVirus))
			return false;
		if (familia == null) {
			if (other.familia != null)
				return false;
		} else if (!familia.equals(other.familia))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (marcaComputador == null) {
			if (other.marcaComputador != null)
				return false;
		} else if (!marcaComputador.equals(other.marcaComputador))
			return false;
		if (marcaProcessador == null) {
			if (other.marcaProcessador != null)
				return false;
		} else if (!marcaProcessador.equals(other.marcaProcessador))
			return false;
		if (modeloProcessador == null) {
			if (other.modeloProcessador != null)
				return false;
		} else if (!modeloProcessador.equals(other.modeloProcessador))
			return false;
		if (officeInstalado == null) {
			if (other.officeInstalado != null)
				return false;
		} else if (!officeInstalado.equals(other.officeInstalado))
			return false;
		if (qtdHd == null) {
			if (other.qtdHd != null)
				return false;
		} else if (!qtdHd.equals(other.qtdHd))
			return false;
		if (qtdMemoria == null) {
			if (other.qtdMemoria != null)
				return false;
		} else if (!qtdMemoria.equals(other.qtdMemoria))
			return false;
		if (sistemaOperacionalInstalado == null) {
			if (other.sistemaOperacionalInstalado != null)
				return false;
		} else if (!sistemaOperacionalInstalado
				.equals(other.sistemaOperacionalInstalado))
			return false;
		if (tipoProcessador == null) {
			if (other.tipoProcessador != null)
				return false;
		} else if (!tipoProcessador.equals(other.tipoProcessador))
			return false;
		return true;
	}
}