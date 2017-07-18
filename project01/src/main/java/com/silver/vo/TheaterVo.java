package com.silver.vo;

public class TheaterVo {

	private int theater_number;     
	private int  theater_starttime;             
	private int  theater_endtime;               
	private int  theater_seat;                  
	private int  movietheater_number;           
	private int  movie_number;
	public int getTheater_number() {
		return theater_number;
	}
	public void setTheater_number(int theater_number) {
		this.theater_number = theater_number;
	}
	public int getTheater_starttime() {
		return theater_starttime;
	}
	public void setTheater_starttime(int theater_starttime) {
		this.theater_starttime = theater_starttime;
	}
	public int getTheater_endtime() {
		return theater_endtime;
	}
	public void setTheater_endtime(int theater_endtime) {
		this.theater_endtime = theater_endtime;
	}
	public int getTheater_seat() {
		return theater_seat;
	}
	public void setTheater_seat(int theater_seat) {
		this.theater_seat = theater_seat;
	}
	public int getMovietheater_number() {
		return movietheater_number;
	}
	public void setMovietheater_number(int movietheater_number) {
		this.movietheater_number = movietheater_number;
	}
	public int getMovie_number() {
		return movie_number;
	}
	public void setMovie_number(int movie_number) {
		this.movie_number = movie_number;
	}
	public TheaterVo(int theater_number, int theater_starttime, int theater_endtime, int theater_seat,
			int movietheater_number, int movie_number) {
		super();
		this.theater_number = theater_number;
		this.theater_starttime = theater_starttime;
		this.theater_endtime = theater_endtime;
		this.theater_seat = theater_seat;
		this.movietheater_number = movietheater_number;
		this.movie_number = movie_number;
	}
	public TheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
