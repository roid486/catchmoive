package com.silver.vo;

public class TheaterVo {

	private int  t_number;     
	private int  t_starttime;             
	private int  t_endtime;               
	private int  t_seat;                  
	private int  mt_number;           
	private int  m_number;
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public int getT_starttime() {
		return t_starttime;
	}
	public void setT_starttime(int t_starttime) {
		this.t_starttime = t_starttime;
	}
	public int getT_endtime() {
		return t_endtime;
	}
	public void setT_endtime(int t_endtime) {
		this.t_endtime = t_endtime;
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
	public TheaterVo(int t_number, int t_starttime, int t_endtime, int t_seat, int mt_number, int m_number) {
		super();
		this.t_number = t_number;
		this.t_starttime = t_starttime;
		this.t_endtime = t_endtime;
		this.t_seat = t_seat;
		this.mt_number = mt_number;
		this.m_number = m_number;
	}
	public TheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
