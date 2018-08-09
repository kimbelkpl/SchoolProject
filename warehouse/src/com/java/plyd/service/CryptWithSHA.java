package com.java.plyd.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CryptWithSHA {
	public static MessageDigest md=null;
	public static String cryptWithSHA(String pass,String type,Date date) throws NoSuchAlgorithmException{
			Date d=new Date();
			SimpleDateFormat ft=new SimpleDateFormat("E yyyy.MM.dd 'at' hh.mm.ss a zzz");
			String salt;
			if(type.equals("add")){
				salt=ft.format(d);
			}else{
				salt=ft.format(date);
			}
			System.out.println("salt "+salt);
			md=MessageDigest.getInstance("SHA");
			md.update((pass+salt).getBytes());
			String password1=(new BigInteger(md.digest())).toString(16);
			System.out.println("pass "+password1);
			return password1;
	}
}
