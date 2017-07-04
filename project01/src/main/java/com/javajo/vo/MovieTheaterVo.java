package com.javajo.vo;

public class MovieTheaterVo {

	private int movietheater_number;
	private String movietheater_name;
	private String movietheater_loc;
	public int getMovietheater_number() {
		return movietheater_number;
	}
	public void setMovietheater_number(int movietheater_number) {
		this.movietheater_number = movietheater_number;
	}
	public String getMovietheater_name() {
		return movietheater_name;
	}
	public void setMovietheater_name(String movietheater_name) {
		this.movietheater_name = movietheater_name;
	}
	public String getMovietheater_loc() {
		return movietheater_loc;
	}
	public void setMovietheater_loc(String movietheater_loc) {
		this.movietheater_loc = movietheater_loc;
	}
	public MovieTheaterVo(int movietheater_number, String movietheater_name, String movietheater_loc) {
		super();
		this.movietheater_number = movietheater_number;
		this.movietheater_name = movietheater_name;
		this.movietheater_loc = movietheater_loc;
	}
	public MovieTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}