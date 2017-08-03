package com.jun.vo;



import org.springframework.web.multipart.MultipartFile;

public class NoticeVo {

	private int nb_number;
	private String nb_title;
	private String nb_content;
	private String nb_regdate;
	private int nb_hit;
	private String nb_fname;
	private int nb_fsize;
	
	public MultipartFile uploadFile;

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

	public String getNb_regdate() {
		return nb_regdate;
	}

	public void setNb_regdate(String nb_regdate) {
		this.nb_regdate = nb_regdate;
	}

	public int getNb_hit() {
		return nb_hit;
	}

	public void setNb_hit(int nb_hit) {
		this.nb_hit = nb_hit;
	}

	public String getNb_fname() {
		return nb_fname;
	}

	public void setNb_fname(String nb_fname) {
		this.nb_fname = nb_fname;
	}

	public int getNb_fsize() {
		return nb_fsize;
	}

	public void setNb_fsize(int nb_fsize) {
		this.nb_fsize = nb_fsize;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public NoticeVo(int nb_number, String nb_title, String nb_content, String nb_regdate, int nb_hit, String nb_fname,
			int nb_fsize, MultipartFile uploadFile) {
		super();
		this.nb_number = nb_number;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_regdate = nb_regdate;
		this.nb_hit = nb_hit;
		this.nb_fname = nb_fname;
		this.nb_fsize = nb_fsize;
		this.uploadFile = uploadFile;
	}

	public NoticeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "NoticeVo [nb_number=" + nb_number + ", nb_title=" + nb_title + ", nb_content=" + nb_content
				+ ", nb_regdate=" + nb_regdate + ", nb_hit=" + nb_hit + ", nb_fname=" + nb_fname + ", nb_fsize="
				+ nb_fsize + ", uploadFile=" + uploadFile + "]";
	}
	
	
}
