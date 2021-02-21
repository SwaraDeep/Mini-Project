package com.doc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookie {

	/*
	 * To create a cookie with age 1hr
	 * Also prints the created cookie to the console 
	 */
	public static void create(HttpServletResponse response, String name, String value, String classname) {
		javax.servlet.http.Cookie c = new javax.servlet.http.Cookie(name, value);
		c.setMaxAge(60 * 60);
		response.addCookie(c);
		System.out.println("Cookie created (" + classname + ") - " + name + " : " + value);
	}
	
	/*
	 * To delete a cookie
	 * Also prints the deleted cookie to the console 
	 */
	public static void delete(HttpServletResponse response, HttpServletRequest request, String classname) {
		javax.servlet.http.Cookie[] c= request.getCookies();
		
		if(c != null){
			System.out.println("Cookies deleted (" + classname + "):");
			for(int i = 0; i < c.length; i++) {
					c[i].setMaxAge(0);
					System.out.println("\t" + c[i]);
					response.addCookie(c[i]);
			}
		}else {
			System.out.println("Cookies deleted (" + classname + "): None");
		}
	}
	
	/*
	 * To get a cookie with the name as @param name
	 */
	public static String get(HttpServletRequest request, String name) {
		javax.servlet.http.Cookie[] c = request.getCookies();
		
		if(c != null){
			for(int i = 0; i < c.length; i++) {
				if(c[i].getName().equals(name)) {
					return c[i].getValue();
				}
			}
		}
		System.out.println("No cookie found with name: " + name);
		return null;
	}
	
	/*
	 * To list all the cookies
	 * Returns the cookies count
	 * Prints the list of cookies to the console 
	 */
	public static int list(HttpServletRequest request, String classname) {
		javax.servlet.http.Cookie[] c = request.getCookies();
		
		if(c != null){
			System.out.println("Cookies (" + classname + "):");
			for(int i = 0; i < c.length; i++) {
					System.out.println("\t" + c[i].getName());
			}
		}else {
			return 0;
		}
		return c.length;
	}
	
}
