package com.javajo.vo;

public class MpriceVo {

	private String m_name;
	private int m_price;
	public MpriceVo(String m_name, int m_price) {
		super();
		this.m_name = m_name;
		this.m_price = m_price;
	}
	public MpriceVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	
}
