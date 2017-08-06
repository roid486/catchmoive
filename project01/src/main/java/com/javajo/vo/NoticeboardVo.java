package com.javajo.vo;

import java.util.Date;

public class NoticeboardVo {

	private int nb_number;
	private String nb_title;
	private String nb_content;
	private Date nb_regdate;
	private String nb_fname;
	public NoticeboardVo(int nb_number, String nb_title, String nb_content, Date nb_regdate, String nb_fname) {
		super();
		this.nb_number = nb_number;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_regdate = nb_regdate;
		this.nb_fname = nb_fname;
	}
	public NoticeboardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNb_number() {
		return nb_number;
	}
	public void setNb_number(int nb_number) {
		this.nb_number = nb_number;
	}
	public String getNb_title() {
		return nb_title;
	}
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}
	public String getNb_content() {
		return nb_content;
	}
	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}
	public Date getNb_regdate() {
		return nb_regdate;
	}
	public void setNb_regdate(Date nb_regdate) {
		this.nb_regdate = nb_regdate;
	}
	public String getNb_fname() {
		return nb_fname;
	}
	public void setNb_fname(String nb_fname) {
		this.nb_fname = nb_fname;
	}
	
}
