package br.com.providerone.data;

import java.util.Calendar;

public class Data {
	
	public void GeraTempoAtendimento(Calendar dataFin, Calendar dataIni){
		int diaAndamento, diferencaDias, diaFechamento, horaAndamento;
		diaAndamento = dataIni.get(Calendar.DAY_OF_MONTH);
		diaFechamento = dataFin.get(Calendar.DAY_OF_MONTH);
		diferencaDias = diaFechamento - diaAndamento;
		horaAndamento = dataIni.get(Calendar.HOUR_OF_DAY);
		//horaFechamento = dataFin.get(Calendar.HOUR_OF_DAY);
		//minutoAndamento = dataIni.get(Calendar.MINUTE);
		//minutoFechamento = dataFin.get(Calendar.MINUTE);
		
		Long diferenca = dataFin.getTimeInMillis() - dataIni.getTimeInMillis();
		Long minutos  = diferenca / (60 * 1000);
		//System.out.println("Munitos dif: " + minutos);
		Long horas = minutos / 60;
		Long minuto = minutos % 60;
		//System.out.println(horas + ":" + minuto);
		
		if(diferencaDias == 1 && horaAndamento >= 18){
			//System.out.println("um dia de diferenca e depois do expediente..");
		}else if(diferencaDias == 1 && horaAndamento < 18){
			minutos = minutos - 900;
			//System.out.println("um dia de diferenca e andamento durante o expediente..");
		}else if(diferencaDias > 1){
			//System.out.println("Mais de um dia de diferenca..");
			minutos = minutos - (900*diferencaDias);
		}
		horas = minutos / 60;
		minuto = minutos % 60;
		System.out.println(horas + ":" + minuto);
	}
	
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
		Long segundos, minutos, minuto, hora;
		String tempo ;
		
		if(dataIni.get(Calendar.DATE) != dataFin.get(Calendar.DATE)){
				int diferenca = (dataFin.get(Calendar.DATE))- (dataIni.get(Calendar.DATE));
				//segundo = segundos % 60;
				segundos = difSeg(dataFin, dataIni);
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
				}else if (diferenca > 6){
					hora = (minutos / 60) - 75;
				}else {
					hora = (minutos / 60);
				}
				//tempo = String.format("%02dh:%02dm", hora, minuto);
				tempo = String.format("%02d:%02d", hora, minuto);
		} else {
			//segundo = segundos % 60;
			segundos = difSeg(dataFin, dataIni);
			minutos = segundos / 60;
			minuto = minutos % 60;
			hora = minutos / 60;
			//tempo = String.format("%02dh:%02dm", hora, minuto);
			tempo = String.format("%02d:%02d", hora, minuto);
		}
		return tempo;
	}
	
	public Long geraTempoParcial(Calendar dataFin, Calendar dataIni){
		Long minutos;
		if(dataIni.get(Calendar.DATE) != dataFin.get(Calendar.DATE)){
				int diferenca = (dataFin.get(Calendar.DATE))- (dataIni.get(Calendar.DATE));
				minutos =  difMin(dataFin, dataIni);
				if (diferenca == 1){
					minutos = minutos - 900;
				}else if (diferenca == 2){
					minutos = minutos - 1800;
				}else if (diferenca == 3){
					minutos = minutos - 2700;
				}else if (diferenca == 4){
					minutos = minutos - 3600;
				}else if (diferenca == 5){
					minutos = minutos - 4500;
				}else{
					minutos = minutos - 4500;
				}
				System.out.println("minuto em data: " + minutos);
		} else {
			minutos =  difMin(dataFin, dataIni);
			System.out.println("minuto em data: " + minutos);
		}
		return minutos;
	}
	
	public String geraTempo(Long tempoTotal){
		Long segundos, minutos, minuto, hora;
		String tempo ;
		segundos = tempoTotal * 60;
		minutos = segundos / 60;
		minuto = minutos % 60;
		hora = minutos / 60;
		//tempo = String.format("%02dh:%02dm", hora, minuto);
		tempo = String.format("%02d:%02d", hora, minuto);
		return tempo;
	}
}