package com.doc;

public class Doctor {

	private String dname;
	private String dpassword;
	private String name;

	public Doctor() {
	}

	// constructor to create a Doctor object
	public Doctor(String dname, String dpassword, String name) {
		this.dname = dname;
		this.dpassword = dpassword;
		this.name = name;
	}

	// to set and get the variables data
	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPassword() {
		return dpassword;
	}

	public void setPassword(String password) {
		this.dpassword = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
