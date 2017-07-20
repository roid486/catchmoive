package com.javajo.vo;

public class CustomerVo {

	private String c_id;
	private String c_pw;
	private String c_name;
	private String c_age;
	private String c_addr;
	private String c_tel;
	private String c_email;
	private String c_gender;
	private String c_check;
	private String c_echeck;
	public CustomerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomerVo(String c_id, String c_pw, String c_name, String c_age, String c_addr, String c_tel,
			String c_email, String c_gender, String c_check, String c_echeck) {
		super();
		this.c_id = c_id;
		this.c_pw = c_pw;
		this.c_name = c_name;
		this.c_age = c_age;
		this.c_addr = c_addr;
		this.c_tel = c_tel;
		this.c_email = c_email;
		this.c_gender = c_gender;
		this.c_check = c_check;
		this.c_echeck = c_echeck;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pw() {
		return c_pw;
	}
	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_age() {
		return c_age;
	}
	public void setC_age(String c_age) {
		this.c_age = c_age;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public String getC_check() {
		return c_check;
	}
	public void setC_check(String c_check) {
		this.c_check = c_check;
	}
	public String getC_echeck() {
		return c_echeck;
	}
	public void setC_echeck(String c_echeck) {
		this.c_echeck = c_echeck;
	}
	
}
