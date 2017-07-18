package com.silver.vo;

public class SeatVo {

	private int seat_number;       
	private String seat_row;                    
	private String seat_column;                  
	private String seat_ft;                     
	private int ticket_number;                       
	private int theater_number;                      
	private int movietheater_number;
	public int getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_column() {
		return seat_column;
	}
	public void setSeat_column(String seat_column) {
		this.seat_column = seat_column;
	}
	public String getSeat_ft() {
		return seat_ft;
	}
	public void setSeat_ft(String seat_ft) {
		this.seat_ft = seat_ft;
	}
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
	}
	public int getTheater_number() {
		return theater_number;
	}
	public void setTheater_number(int theater_number) {
		this.theater_number = theater_number;
	}
	public int getMovietheater_number() {
		return movietheater_number;
	}
	public void setMovietheater_number(int movietheater_number) {
		this.movietheater_number = movietheater_number;
	}
	public SeatVo(int seat_number, String seat_row, String seat_column, String seat_ft, int ticket_number,
			int theater_number, int movietheater_number) {
		super();
		this.seat_number = seat_number;
		this.seat_row = seat_row;
		this.seat_column = seat_column;
		this.seat_ft = seat_ft;
		this.ticket_number = ticket_number;
		this.theater_number = theater_number;
		this.movietheater_number = movietheater_number;
	}
	public SeatVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
