package com.silver.vo;

public class TicketVo {
	
	private String ticket_date;                       
	private int ticket_peoplenum;                  
	private int m_number;                          
	private int mt_number;                         
	private int t_number;                          
	private String c_id;                     
	private int ticket_price;
	
	public String getTicket_date() {
		return ticket_date;
	}
	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}
	public int getTicket_peoplenum() {
		return ticket_peoplenum;
	}
	public void setTicket_peoplenum(int ticket_peoplenum) {
		this.ticket_peoplenum = ticket_peoplenum;
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
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public TicketVo(String ticket_date, int ticket_peoplenum, int m_number, int mt_number, int t_number, String c_id,
			int ticket_price) {
		super();
		this.ticket_date = ticket_date;
		this.ticket_peoplenum = ticket_peoplenum;
		this.m_number = m_number;
		this.mt_number = mt_number;
		this.t_number = t_number;
		this.c_id = c_id;
		this.ticket_price = ticket_price;
	}
	public TicketVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
