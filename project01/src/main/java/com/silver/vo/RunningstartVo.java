package com.silver.vo;

public class RunningstartVo {

	private String running_start;
	private int theater_number;
	public String getRunning_start() {
		return running_start;
	}
	public void setRunning_start(String running_start) {
		this.running_start = running_start;
	}
	public int getTheater_number() {
		return theater_number;
	}
	public void setTheater_number(int theater_number) {
		this.theater_number = theater_number;
	}
	public RunningstartVo(String running_start, int theater_number) {
		super();
		this.running_start = running_start;
		this.theater_number = theater_number;
	}
	public RunningstartVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
