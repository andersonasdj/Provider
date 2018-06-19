package br.com.providerone.data;

import java.util.Calendar;

public class Data {
	
	public Long difDias(Calendar dataFin, Calendar dataIni){
		// Calcula a diferenenca entre data final e data inicial
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		// Quantidade de milissegundos em um dia
		int tempoDia = 1000 * 60 * 60 * 24;
		Long diasDiferenca = diferenca / tempoDia;
		return diasDiferenca;
	}
	
	public Long difHoras(Calendar dataFin, Calendar dataIni){
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long hora = diferenca / (60 * 60 * 1000);
		return hora;
	}
	
	public Long difMin(Calendar dataFin, Calendar dataIni){
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long minuto  = diferenca / (60 * 1000);
		return minuto;
	}
	
	public Long difSeg(Calendar dataFin, Calendar dataIni){
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long segundo = diferenca / 1000;
		return segundo;
	}
	
	public String geraTempoTotal(Calendar dataFin, Calendar dataIni){
		Long segundos, segundo, minutos, minuto, hora;
		String tempo ;
		
		/*
		 * 	PARA DEBUG DAS DATAS...
			System.out.println("Dia da Abertura: " + dataIni.get(Calendar.DATE));
			System.out.println("Dia do Fechamento: " + dataFin.get(Calendar.DATE));
			System.out.println("Dia da semana: " + dataFin.get(Calendar.DAY_OF_WEEK));
			int dSemana = dataFin.get(Calendar.DAY_OF_WEEK);
			DateFormatSymbols symbols = new DateFormatSymbols();
			String[] nomeDia = symbols.getWeekdays();
			System.out.println(nomeDia[dSemana]);
		*/
		if(dataIni.get(Calendar.DATE) != dataFin.get(Calendar.DATE)){
				int diferenca = (dataFin.get(Calendar.DATE))- (dataIni.get(Calendar.DATE));
				
				segundos = difSeg(dataFin, dataIni);
				segundo = segundos % 60;
				minutos = segundos / 60;
				minuto = minutos % 60;
				
				if (diferenca == 1){
					hora = (minutos / 60) - 15;
				}else if (diferenca == 2){
					hora = (minutos / 60) - 30;
				}else if (diferenca == 3){
					hora = (minutos / 60) - 45;
				}else if (diferenca == 4){
					hora = (minutos / 60) - 60;
				}else if (diferenca == 5){
					hora = (minutos / 60) - 75;
				}else{
					hora = (minutos / 60) - 75;
				}
				tempo = String.format("%02d:%02d:%02d", hora, minuto, segundo);
				
		} else {
			segundos = difSeg(dataFin, dataIni);
			segundo = segundos % 60;
			minutos = segundos / 60;
			minuto = minutos % 60;
			hora = minutos / 60;
			tempo = String.format("%02d:%02d:%02d", hora, minuto, segundo);
		}
		return tempo;
	}
}