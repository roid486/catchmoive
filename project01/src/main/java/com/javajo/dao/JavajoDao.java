package com.javajo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javajo.data.JavajoManager;
import com.javajo.vo.MovieTheaterVo;

@Repository
public class JavajoDao {

	public List<MovieTheaterVo> mtlist() {
		// TODO Auto-generated method stub
		return JavajoManager.mhlist();
	}

	
}
