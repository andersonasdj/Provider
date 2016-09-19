package br.com.providerone.data;

import java.util.Calendar;

public class Data {
	
	public Long difDias(Calendar dataFin, Calendar dataIni){
		// Calcula a diferença entre data final e data inicial
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		// Quantidade de milissegundos em um dia
		int tempoDia = 1000 * 60 * 60 * 24;
		Long diasDiferenca = diferenca / tempoDia;
		return diasDiferenca;
	}
	
	public Long difHoras(Calendar dataFin, Calendar dataIni){
		// Calcula a diferença entre data final e data inicial
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long hora = diferenca / (60 * 60 * 1000);
		return hora;
	}
	
	public Long difMin(Calendar dataFin, Calendar dataIni){
		// Calcula a diferença entre data final e data inicial
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long minuto  = diferenca / (60 * 1000);
		return minuto;
	}
	
	public Long difSeg(Calendar dataFin, Calendar dataIni){
		// Calcula a diferença entre data final e data inicial
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long segundo = diferenca / 1000;
		return segundo;
	}
}