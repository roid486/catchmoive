package com.silver.vo;

public class TicketCheckVo {
	private String m_name;
	private String m_image;
	private String mt_name;
	private String t_name; 
	private String r_date; 
	private String r_start; 
	private String ticket_price; 
	private String ticket_peoplenum;
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
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
	public String getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(String ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getTicket_peoplenum() {
		return ticket_peoplenum;
	}
	public void setTicket_peoplenum(String ticket_peoplenum) {
		this.ticket_peoplenum = ticket_peoplenum;
	}
	public TicketCheckVo(String m_name, String m_image, String mt_name, String t_name, String r_date, String r_start,
			String ticket_price, String ticket_peoplenum) {
		super();
		this.m_name = m_name;
		this.m_image = m_image;
		this.mt_name = mt_name;
		this.t_name = t_name;
		this.r_date = r_date;
		this.r_start = r_start;
		this.ticket_price = ticket_price;
		this.ticket_peoplenum = ticket_peoplenum;
	}
	public TicketCheckVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TicketCheckVo [m_name=" + m_name + ", m_image=" + m_image + ", mt_name=" + mt_name + ", t_name="
				+ t_name + ", r_date=" + r_date + ", r_start=" + r_start + ", ticket_price=" + ticket_price
				+ ", ticket_peoplenum=" + ticket_peoplenum + "]";
	} 

	
}
