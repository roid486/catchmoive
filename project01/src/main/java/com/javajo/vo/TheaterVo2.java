package com.javajo.vo;

public class TheaterVo2 {

	private int t_number;
	private String t_name;
	private int t_seat;
	private String mt_name;
	public TheaterVo2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TheaterVo2(int t_number, String t_name, int t_seat, String mt_name) {
		super();
		this.t_number = t_number;
		this.t_name = t_name;
		this.t_seat = t_seat;
		this.mt_name = mt_name;
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
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	
	
	
}
