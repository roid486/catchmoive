package com.jihye.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MovieVo_j {
	private int m_number;
	private String m_name;
	private String m_director;
	private String m_actor;
	private String m_nation;
	private int m_runningtime;
	private String m_grade;
	private String m_genre;
	private Date m_opendate;
	private String m_synop;
	private String m_image;
	private String m_trailer;
	private int m_score;
	private String m_image1;
	private String m_image2;
	private String m_image3;
	private int m_isshowing;
	private int m_boxoffice;
	private MultipartFile uploadFile;
	private MultipartFile uploadFile1;
	private MultipartFile uploadFile2;
	private MultipartFile uploadFile3;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public MovieVo_j() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieVo_j(int m_number, String m_name, String m_director, String m_actor, String m_nation, int m_runningtime,
			String m_grade, String m_genre, Date m_opendate, String m_synop, String m_image, String m_trailer,
			int m_score, String m_image1, String m_image2, String m_image3, int m_isshowing, int m_boxoffice) {
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
		this.m_image1 = m_image1;
		this.m_image2 = m_image2;
		this.m_image3 = m_image3;
		this.m_isshowing = m_isshowing;
		this.m_boxoffice = m_boxoffice;
	}
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
	public Date getM_opendate() {
		return m_opendate;
	}
	public void setM_opendate(Date m_opendate) {
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
	public String getM_image1() {
		return m_image1;
	}
	public void setM_image1(String m_image1) {
		this.m_image1 = m_image1;
	}
	public String getM_image2() {
		return m_image2;
	}
	public void setM_image2(String m_image2) {
		this.m_image2 = m_image2;
	}
	public String getM_image3() {
		return m_image3;
	}
	public void setM_image3(String m_image3) {
		this.m_image3 = m_image3;
	}
	public int getM_isshowing() {
		return m_isshowing;
	}
	public void setM_isshowing(int m_isshowing) {
		this.m_isshowing = m_isshowing;
	}
	public int getM_boxoffice() {
		return m_boxoffice;
	}
	public void setM_boxoffice(int m_boxoffice) {
		this.m_boxoffice = m_boxoffice;
	}
	
	
	
}
