package com.silver.vo;

public class RunningstartVo {

	private String r_start;
	private int t_number;
	private int r_number;
	private int m_number;
	private int mt_number;
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public int getMt_number() {
		return mt_number;
	}
	public void setMt_number(int mt_number) {
		this.mt_number = mt_number;
	}
	public RunningstartVo(String r_start, int t_number, int r_number, int m_number, int mt_number) {
		super();
		this.r_start = r_start;
		this.t_number = t_number;
		this.r_number = r_number;
		this.m_number = m_number;
		this.mt_number = mt_number;
	}
	public RunningstartVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
