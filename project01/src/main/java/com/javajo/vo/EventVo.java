package com.javajo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class EventVo {

	private int e_number;
	private String e_title;
	private Date e_regdate;
	private int e_hit;
	private String e_img;
	private String e_content;
	private MultipartFile file;
	public EventVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventVo(int e_number, String e_title, Date e_regdate, int e_hit, String e_img, String e_content,
			MultipartFile file) {
		super();
		this.e_number = e_number;
		this.e_title = e_title;
		this.e_regdate = e_regdate;
		this.e_hit = e_hit;
		this.e_img = e_img;
		this.e_content = e_content;
		this.file = file;
	}
	public int getE_number() {
		return e_number;
	}
	public void setE_number(int e_number) {
		this.e_number = e_number;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public int getE_hit() {
		return e_hit;
	}
	public void setE_hit(int e_hit) {
		this.e_hit = e_hit;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
