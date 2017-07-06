package com.javajo.vo;

public class CustomerVo {

	private String customer_id;
	private String customer_pw;
	private String customer_name;
	private String customer_addr;
	private String customer_tel;
	private String customer_email;
	private String customer_gender;
	public CustomerVo(String customer_id, String customer_pw, String customer_name, String customer_addr,
			String customer_tel, String customer_email, String customer_gender) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_name = customer_name;
		this.customer_addr = customer_addr;
		this.customer_tel = customer_tel;
		this.customer_email = customer_email;
		this.customer_gender = customer_gender;
	}
	public CustomerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_addr() {
		return customer_addr;
	}
	public void setCustomer_addr(String customer_addr) {
		this.customer_addr = customer_addr;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_gender() {
		return customer_gender;
	}
	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}
	
}
