package com.javajo.vo;

import java.util.Date;

public class RunningVo3 {

	private int r_number;
	private String t_name;
	private String m_name;
	private String mt_name;
	private String r_date;
	private String r_start;
	public RunningVo3() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RunningVo3(int r_number, String t_name, String m_name, String mt_name, String r_date, String r_start) {
		super();
		this.r_number = r_number;
		this.t_name = t_name;
		this.m_name = m_name;
		this.mt_name = mt_name;
		this.r_date = r_date;
		this.r_start = r_start;
	}
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	
}
