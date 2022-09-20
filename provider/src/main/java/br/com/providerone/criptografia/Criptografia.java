package br.com.providerone.criptografia;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;

public class Criptografia {

	public static String converteSenhaParaMD5(String senha){
        
		try {
			/*MessageDigest md = MessageDigest.getInstance("MD5");
	        BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
	        return String.format("%32x", hash);*/
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(senha.getBytes(StandardCharsets.UTF_8));
			return Base64.getEncoder().encodeToString(hash);
			
		} catch (Exception e) {
			return null;
		}
    }
}