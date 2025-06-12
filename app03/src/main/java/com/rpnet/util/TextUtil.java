package com.rpnet.util;

public class TextUtil {

	public static String cast(Object text) {
		if (text == null) {
			return "";
		}
		
		return text.toString();
	}
	
	public static String cast(String text) {
		if (text == null) {
			return "";
		}
		
		return text;
	}
	
}
