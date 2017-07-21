package com.javajo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javajo.data.JavajoManager;
import com.javajo.vo.CustomerVo;
import com.javajo.vo.MovieTheaterVo;

@Repository
public class JavajoDao {

	public List<MovieTheaterVo> mtlist() {
		// TODO Auto-generated method stub
		return JavajoManager.mhlist();
	}

	public String loginok(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.loginok(cv);
	}

	public int signup(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.signup(cv);
	}

	public int serchcust(String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.serchcust(name,email);
	}

	public int serchid(String id) {
		// TODO Auto-generated method stub
		return JavajoManager.serchid(id);
	}

	public int echeckupdate(String email, String yes) {
		// TODO Auto-generated method stub
		return JavajoManager.echeckupdate(email,yes);
	}

	public List<CustomerVo> clist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.clist(num1,num2,key);
	}

	public int totalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.totalrecode(key);
	}

	public int cdelete(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.cdelete(c_id);
	}

	public String scid(String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.scid(name,email);
	}

	public String scpw(String id, String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.scpw(id,name,email);
	}

	public CustomerVo cdetail(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.cdetail(c_id);
	}

	public int cupdate(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.cupdate(cv);
	}

	
}
