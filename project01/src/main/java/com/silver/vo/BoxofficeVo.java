package com.silver.vo;

public class BoxofficeVo {
	private int cnt;
	private int m_number;
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public BoxofficeVo(int m_number, int cnt) {
		super();
		this.m_number = m_number;
		this.cnt = cnt;
	}
	public BoxofficeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
