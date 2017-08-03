package com.javajo.vo;

public class TheaterVo {

	private int t_number;
	private String t_name;
	private int t_seat;
	private int mt_number;
	private int m_number;
	public TheaterVo(int t_number, String t_name, int t_seat, int mt_number, int m_number) {
		super();
		this.t_number = t_number;
		this.t_name = t_name;
		this.t_seat = t_seat;
		this.mt_number = mt_number;
		this.m_number = m_number;
	}
	public TheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public int getT_seat() {
		return t_seat;
	}
	public void setT_seat(int t_seat) {
		this.t_seat = t_seat;
	}
	public int getMt_number() {
		return mt_number;
	}
	public void setMt_number(int mt_number) {
		this.mt_number = mt_number;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	
	
}
