package com.jihye.vo;

public class MovieScoreVo {
	private int ms_no;
	private String ms_custid;
	private int ms_mid;
	private int ms_score;
	private String ms_comment;
	public MovieScoreVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieScoreVo(int ms_no, String ms_custid, int ms_mid, int ms_score, String ms_comment) {
		super();
		this.ms_no = ms_no;
		this.ms_custid = ms_custid;
		this.ms_mid = ms_mid;
		this.ms_score = ms_score;
		this.ms_comment = ms_comment;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public String getMs_custid() {
		return ms_custid;
	}
	public void setMs_custid(String ms_custid) {
		this.ms_custid = ms_custid;
	}
	public int getMs_mid() {
		return ms_mid;
	}
	public void setMs_mid(int ms_mid) {
		this.ms_mid = ms_mid;
	}
	public int getMs_score() {
		return ms_score;
	}
	public void setMs_score(int ms_score) {
		this.ms_score = ms_score;
	}
	public String getMs_comment() {
		return ms_comment;
	}
	public void setMs_comment(String ms_comment) {
		this.ms_comment = ms_comment;
	}
	
	
}
