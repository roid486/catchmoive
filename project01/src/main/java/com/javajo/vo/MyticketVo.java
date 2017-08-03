package com.javajo.vo;

import java.util.Date;

public class MyticketVo {

	private int ticket_number;
	private String m_name;
	private String mt_name;
	private String t_name;
	private Date ticket_date;
	private String r_start;
	private int ticket_peoplenum;
	private int ticket_price;
	public MyticketVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyticketVo(int ticket_number, String m_name, String mt_name, String t_name, Date ticket_date, String r_start,
			int ticket_peoplenum, int ticket_price) {
		super();
		this.ticket_number = ticket_number;
		this.m_name = m_name;
		this.mt_name = mt_name;
		this.t_name = t_name;
		this.ticket_date = ticket_date;
		this.r_start = r_start;
		this.ticket_peoplenum = ticket_peoplenum;
		this.ticket_price = ticket_price;
	}
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
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
	public Date getTicket_date() {
		return ticket_date;
	}
	public void setTicket_date(Date ticket_date) {
		this.ticket_date = ticket_date;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public int getTicket_peoplenum() {
		return ticket_peoplenum;
	}
	public void setTicket_peoplenum(int ticket_peoplenum) {
		this.ticket_peoplenum = ticket_peoplenum;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	
	
}
