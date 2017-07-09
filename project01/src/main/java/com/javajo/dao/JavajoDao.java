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

	public int serchcust(String name, String tel) {
		// TODO Auto-generated method stub
		return JavajoManager.serchcust(name,tel);
	}

	public int serchid(String id) {
		// TODO Auto-generated method stub
		return JavajoManager.serchid(id);
	}

	
}
