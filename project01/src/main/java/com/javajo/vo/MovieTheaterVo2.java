package com.javajo.vo;

public class MovieTheaterVo2 {

	private int mt_number;
	private String mt_name;
	private String mt_loc;
	private double mt_x;
	private double mt_y;
	public MovieTheaterVo2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieTheaterVo2(int mt_number, String mt_name, String mt_loc, double mt_x, double mt_y) {
		super();
		this.mt_number = mt_number;
		this.mt_name = mt_name;
		this.mt_loc = mt_loc;
		this.mt_x = mt_x;
		this.mt_y = mt_y;
	}
	public int getMt_number() {
		return mt_number;
	}
	public void setMt_number(int mt_number) {
		this.mt_number = mt_number;
	}
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
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
	
}