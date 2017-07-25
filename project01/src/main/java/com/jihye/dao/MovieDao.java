package com.jihye.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jihye.data.MovieManager;
import com.jihye.vo.MovieScoreVo;
import com.jihye.vo.MovieVo_j;


@Repository
public class MovieDao {
 
	public int insertMovie(MovieVo_j m){
		return MovieManager.insertMovie(m);
		//commit¿Ã æ»µ≈?
	}
	
	public int updateMovie(MovieVo_j m){
		return MovieManager.updateMovie(m);
	}
	
	public MovieVo_j getMovie(int m_number){
		return MovieManager.getMovie(m_number);
	}
	
	public List<MovieVo_j> listMovie(String select){
		return MovieManager.listMovie(select);
	}
	
	public int insertMovieScore(MovieScoreVo ms){
		return MovieManager.insertMovieScore(ms);
	}
}
