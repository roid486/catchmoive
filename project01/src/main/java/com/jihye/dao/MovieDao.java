package com.jihye.dao;

import org.springframework.stereotype.Repository;

import com.jihye.data.MovieManager;
import com.jihye.vo.MovieVo_j;


@Repository
public class MovieDao {

	public int insertMovie(MovieVo_j m){
		return MovieManager.insertMovie(m);
	}
}
