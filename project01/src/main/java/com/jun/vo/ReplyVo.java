package com.jun.vo;

public class ReplyVo {

	private int re_number;
	private String re_content;
	private String re_writer;
	private String re_regdate;
	private String re_updatedate;
	private int b_number;
	private String c_id;
	private String c_name;
	private String b_name;
	private String re_secretreply;
	public int getRe_number() {
		return re_number;
	}
	public void setRe_number(int re_number) {
		this.re_number = re_number;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	public String getRe_updatedate() {
		return re_updatedate;
	}
	public void setRe_updatedate(String re_updatedate) {
		this.re_updatedate = re_updatedate;
	}
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getRe_secretreply() {
		return re_secretreply;
	}
	public void setRe_secretreply(String re_secretreply) {
		this.re_secretreply = re_secretreply;
	}
	public ReplyVo(int re_number, String re_content, String re_writer, String re_regdate, String re_updatedate, int b_number, String c_id, String c_name, String b_name, String re_secretreply) {
		super();
		this.re_number = re_number;
		this.re_content = re_content;
		this.re_writer = re_writer;
		this.re_regdate = re_regdate;
		this.re_updatedate = re_updatedate;
		this.b_number = b_number;
		this.c_id = c_id;
		this.c_name = c_name;
		this.b_name = b_name;
		this.re_secretreply = re_secretreply;
	}
	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReplyVo [re_number=" + re_number + ", re_content=" + re_content + ", re_writer=" + re_writer + ", re_regdate=" + re_regdate + ", re_updatedate=" + re_updatedate + ", b_number=" + b_number + ", c_id=" + c_id + ", c_name="
				+ c_name + ", b_name=" + b_name + ", re_secretreply=" + re_secretreply + "]";
	}
				
	
}
