package com.javajo.vo;

import org.springframework.web.multipart.MultipartFile;

public class MovieTheaterVo {

	private int mt_number;
	private String mt_name;
	private String mt_loc;
	private double mt_x;
	private double mt_y;
	private String mt_img;
	private MultipartFile file;
	public MovieTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieTheaterVo(int mt_number, String mt_name, String mt_loc, double mt_x, double mt_y, String mt_img,
			MultipartFile file) {
		super();
		this.mt_number = mt_number;
		this.mt_name = mt_name;
		this.mt_loc = mt_loc;
		this.mt_x = mt_x;
		this.mt_y = mt_y;
		this.mt_img = mt_img;
		this.file = file;
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
	public String getMt_img() {
		return mt_img;
	}
	public void setMt_img(String mt_img) {
		this.mt_img = mt_img;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}