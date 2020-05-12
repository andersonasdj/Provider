package br.com.providerone.teste;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ControladorQuartz {
	public void metodoQuartz() {

		System.out.println("Executando Quartz em: "
		  + new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").
                 format(new Date(
		 (System.currentTimeMillis()))));

	}
}
