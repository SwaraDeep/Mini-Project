package com.doc;

import java.util.Date;

public class Appointment {

	private String dname;
	private String pname;
	private Date date;
	private String mobile;

	public Appointment(String dname, String pname, Date date, String mobile) {
		super();
		this.dname = dname;
		this.pname = pname;
		this.date = date;
		this.mobile = mobile;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
