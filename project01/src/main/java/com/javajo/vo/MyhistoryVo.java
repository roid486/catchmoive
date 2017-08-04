package com.javajo.vo;

import java.util.Date;

public class MyhistoryVo {

	private String m_name;
	private String mt_name;
	private String t_name;
	private Date h_ticket_date;
	private int h_ticket_peoplenum;
	private int h_ticket_price;
	public MyhistoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyhistoryVo(String m_name, String mt_name, String t_name, Date h_ticket_date, int h_ticket_peoplenum,
			int h_ticket_price) {
		super();
		this.m_name = m_name;
		this.mt_name = mt_name;
		this.t_name = t_name;
		this.h_ticket_date = h_ticket_date;
		this.h_ticket_peoplenum = h_ticket_peoplenum;
		this.h_ticket_price = h_ticket_price;
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
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public Date getH_ticket_date() {
		return h_ticket_date;
	}
	public void setH_ticket_date(Date h_ticket_date) {
		this.h_ticket_date = h_ticket_date;
	}
	public int getH_ticket_peoplenum() {
		return h_ticket_peoplenum;
	}
	public void setH_ticket_peoplenum(int h_ticket_peoplenum) {
		this.h_ticket_peoplenum = h_ticket_peoplenum;
	}
	public int getH_ticket_price() {
		return h_ticket_price;
	}
	public void setH_ticket_price(int h_ticket_price) {
		this.h_ticket_price = h_ticket_price;
	}
	
}
