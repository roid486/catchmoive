package com.jun.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {

	private int b_number;
	private String b_title;
	private String b_pwd;
	private String b_content;
	private int b_hit;
	private String b_regdate;
	private String b_ip;
	private int b_b_ref;
	private int b_b_level;
	private int b_b_step;
	private String b_fname;
	private int b_fsize;
	private String b_type;
	private String c_id;
	private int b_recnt;
	private String c_name;
	
	public MultipartFile uploadFile;

	public int getB_number() {
		return b_number;
	}

	public void setB_number(int b_number) {
		this.b_number = b_number;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getB_hit() {
		return b_hit;
	}

	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getB_ip() {
		return b_ip;
	}

	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}

	public int getB_b_ref() {
		return b_b_ref;
	}

	public void setB_b_ref(int b_b_ref) {
		this.b_b_ref = b_b_ref;
	}

	public int getB_b_level() {
		return b_b_level;
	}

	public void setB_b_level(int b_b_level) {
		this.b_b_level = b_b_level;
	}

	public int getB_b_step() {
		return b_b_step;
	}

	public void setB_b_step(int b_b_step) {
		this.b_b_step = b_b_step;
	}

	public String getB_fname() {
		return b_fname;
	}

	public void setB_fname(String b_fname) {
		this.b_fname = b_fname;
	}

	public int getB_fsize() {
		return b_fsize;
	}

	public void setB_fsize(int b_fsize) {
		this.b_fsize = b_fsize;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public int getB_recnt() {
		return b_recnt;
	}

	public void setB_recnt(int b_recnt) {
		this.b_recnt = b_recnt;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public BoardVo(int b_number, String b_title, String b_pwd, String b_content, int b_hit, String b_regdate,
			String b_ip, int b_b_ref, int b_b_level, int b_b_step, String b_fname, int b_fsize, String b_type,
			String c_id, int b_recnt, String c_name, MultipartFile uploadFile) {
		super();
		this.b_number = b_number;
		this.b_title = b_title;
		this.b_pwd = b_pwd;
		this.b_content = b_content;
		this.b_hit = b_hit;
		this.b_regdate = b_regdate;
		this.b_ip = b_ip;
		this.b_b_ref = b_b_ref;
		this.b_b_level = b_b_level;
		this.b_b_step = b_b_step;
		this.b_fname = b_fname;
		this.b_fsize = b_fsize;
		this.b_type = b_type;
		this.c_id = c_id;
		this.b_recnt = b_recnt;
		this.c_name = c_name;
		this.uploadFile = uploadFile;
	}

	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BoardVo [b_number=" + b_number + ", b_title=" + b_title + ", b_pwd=" + b_pwd + ", b_content="
				+ b_content + ", b_hit=" + b_hit + ", b_regdate=" + b_regdate + ", b_ip=" + b_ip + ", b_b_ref="
				+ b_b_ref + ", b_b_level=" + b_b_level + ", b_b_step=" + b_b_step + ", b_fname=" + b_fname
				+ ", b_fsize=" + b_fsize + ", b_type=" + b_type + ", c_id=" + c_id + ", b_recnt=" + b_recnt
				+ ", c_name=" + c_name + ", uploadFile=" + uploadFile + "]";
	}

	
	
	
	
}
