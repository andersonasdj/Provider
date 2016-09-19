package br.com.providerone.entitymanager;

public class CriaTabelaBanco {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
			EntityFactory factory = new EntityFactory();
			factory.getEntityManager();
	}
}