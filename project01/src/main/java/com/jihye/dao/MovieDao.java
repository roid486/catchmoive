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
	
	public List<MovieScoreVo> listMovieScore(){
		return MovieManager.listMovieScore();
	}
	
	public List<MovieScoreVo> getMoveiScore(int ms_mid){
		return MovieManager.getMovieScore(ms_mid);
	}
	
	public List<MovieVo_j> getMovieFinder(String searchField,String searchWord,String[] m_genre,String[] m_nation,String[] m_grade,String startyear,String endyear){
		return MovieManager.getMovieFinder(searchField,searchWord,m_genre,m_nation,m_grade,startyear,endyear);
	}
}
