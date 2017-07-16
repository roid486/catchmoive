package com.silver.vo;

public class MovieVo {

	private int movie_number;         
	private String movie_name;            
	private String movie_director;              
	private String movie_actor;                 
	private String movie_nation;                
	private int movie_runningtime;                 
	private String movie_grade;                  
	private String movie_genre;              
	private String movie_opendate;                     
	private String movie_synop;                 
	private String movie_image;                 
	private String movie_trailer;                
	private int movie_score;
	public int getMovie_number() {
		return movie_number;
	}
	public void setMovie_number(int movie_number) {
		this.movie_number = movie_number;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_nation() {
		return movie_nation;
	}
	public void setMovie_nation(String movie_nation) {
		this.movie_nation = movie_nation;
	}
	public int getMovie_runningtime() {
		return movie_runningtime;
	}
	public void setMovie_runningtime(int movie_runningtime) {
		this.movie_runningtime = movie_runningtime;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_opendate() {
		return movie_opendate;
	}
	public void setMovie_opendate(String movie_opendate) {
		this.movie_opendate = movie_opendate;
	}
	public String getMovie_synop() {
		return movie_synop;
	}
	public void setMovie_synop(String movie_synop) {
		this.movie_synop = movie_synop;
	}
	public String getMovie_image() {
		return movie_image;
	}
	public void setMovie_image(String movie_image) {
		this.movie_image = movie_image;
	}
	public String getMovie_trailer() {
		return movie_trailer;
	}
	public void setMovie_trailer(String movie_trailer) {
		this.movie_trailer = movie_trailer;
	}
	public int getMovie_score() {
		return movie_score;
	}
	public void setMovie_score(int movie_score) {
		this.movie_score = movie_score;
	}
	public MovieVo(int movie_number, String movie_name, String movie_director, String movie_actor, String movie_nation,
			int movie_runningtime, String movie_grade, String movie_genre, String movie_opendate, String movie_synop,
			String movie_image, String movie_trailer, int movie_score) {
		super();
		this.movie_number = movie_number;
		this.movie_name = movie_name;
		this.movie_director = movie_director;
		this.movie_actor = movie_actor;
		this.movie_nation = movie_nation;
		this.movie_runningtime = movie_runningtime;
		this.movie_grade = movie_grade;
		this.movie_genre = movie_genre;
		this.movie_opendate = movie_opendate;
		this.movie_synop = movie_synop;
		this.movie_image = movie_image;
		this.movie_trailer = movie_trailer;
		this.movie_score = movie_score;
	}
	public MovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
