package com.silver.vo;

public class TicketInfo {
	
	private String mt_loc;
	private double mt_x;       
	private double mt_y;
	public String getMt_loc() {
		return mt_loc;
	}
	public void setMt_loc(String mt_loc) {
		this.mt_loc = mt_loc;
	}
	public double getMt_x() {
		return mt_x;
	}
	public void setMt_x(double mt_x) {
		this.mt_x = mt_x;
	}
	public double getMt_y() {
		return mt_y;
	}
	public void setMt_y(double mt_y) {
		this.mt_y = mt_y;
	}
	public TicketInfo(String mt_loc, double mt_x, double mt_y) {
		super();
		this.mt_loc = mt_loc;
		this.mt_x = mt_x;
		this.mt_y = mt_y;
	}
	public TicketInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
