package com.silver.vo;

public class SeatVo {

	private int s_number;       
	private String s_row;                    
	private String s_column;                  
	private String s_ft;                     
	private int ticket_number;                       
	private int t_number;                      
	private int mt_number;
	private int r_number;
	public int getS_number() {
		return s_number;
	}
	public void setS_number(int s_number) {
		this.s_number = s_number;
	}
	public String getS_row() {
		return s_row;
	}
	public void setS_row(String s_row) {
		this.s_row = s_row;
	}
	public String getS_column() {
		return s_column;
	}
	public void setS_column(String s_column) {
		this.s_column = s_column;
	}
	public String getS_ft() {
		return s_ft;
	}
	public void setS_ft(String s_ft) {
		this.s_ft = s_ft;
	}
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
	}
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
	}
	public int getMt_number() {
		return mt_number;
	}
	public void setMt_number(int mt_number) {
		this.mt_number = mt_number;
	}
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
	}
	public SeatVo(int s_number, String s_row, String s_column, String s_ft, int ticket_number, int t_number,
			int mt_number, int r_number) {
		super();
		this.s_number = s_number;
		this.s_row = s_row;
		this.s_column = s_column;
		this.s_ft = s_ft;
		this.ticket_number = ticket_number;
		this.t_number = t_number;
		this.mt_number = mt_number;
		this.r_number = r_number;
	}
	public SeatVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
