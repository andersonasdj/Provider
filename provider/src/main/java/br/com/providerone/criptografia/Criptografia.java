package br.com.providerone.criptografia;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Criptografia {

	public static String converteSenhaParaMD5(String senha){
        
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
	        BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
	        return String.format("%32x", hash);
		} catch (Exception e) {
			return null;
		}
    }
}