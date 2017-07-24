package com.silver.vo;

public class MovieVo {

	private int m_number;         
	private String m_name;            
	private String m_director;              
	private String m_actor;                 
	private String m_nation;                
	private int m_runningtime;                 
	private String m_grade;                  
	private String m_genre;              
	private String m_opendate;                     
	private String m_synop;                 
	private String m_image;                 
	private String m_trailer;                
	private int m_score;
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public String getM_actor() {
		return m_actor;
	}
	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}
	public String getM_nation() {
		return m_nation;
	}
	public void setM_nation(String m_nation) {
		this.m_nation = m_nation;
	}
	public int getM_runningtime() {
		return m_runningtime;
	}
	public void setM_runningtime(int m_runningtime) {
		this.m_runningtime = m_runningtime;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_opendate() {
		return m_opendate;
	}
	public void setM_opendate(String m_opendate) {
		this.m_opendate = m_opendate;
	}
	public String getM_synop() {
		return m_synop;
	}
	public void setM_synop(String m_synop) {
		this.m_synop = m_synop;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getM_trailer() {
		return m_trailer;
	}
	public void setM_trailer(String m_trailer) {
		this.m_trailer = m_trailer;
	}
	public int getM_score() {
		return m_score;
	}
	public void setM_score(int m_score) {
		this.m_score = m_score;
	}
	public MovieVo(int m_number, String m_name, String m_director, String m_actor, String m_nation, int m_runningtime,
			String m_grade, String m_genre, String m_opendate, String m_synop, String m_image, String m_trailer,
			int m_score) {
		super();
		this.m_number = m_number;
		this.m_name = m_name;
		this.m_director = m_director;
		this.m_actor = m_actor;
		this.m_nation = m_nation;
		this.m_runningtime = m_runningtime;
		this.m_grade = m_grade;
		this.m_genre = m_genre;
		this.m_opendate = m_opendate;
		this.m_synop = m_synop;
		this.m_image = m_image;
		this.m_trailer = m_trailer;
		this.m_score = m_score;
	}
	public MovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
