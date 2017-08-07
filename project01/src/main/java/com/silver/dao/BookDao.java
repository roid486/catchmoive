package com.silver.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.silver.data.BookManager;
import com.silver.vo.MovieVo;
import com.silver.vo.MovietheatersubVo;
import com.silver.vo.RunningVo;
import com.silver.vo.RunningstartVo;

@Repository
public class BookDao {

	public List<MovieVo> firstList() {
		// TODO Auto-generated method stub
		return BookManager.firstList(); 
	}

	public List<MovietheatersubVo> secondList(String movie_number) {
		// TODO Auto-generated method stub
		return BookManager.secondList(movie_number);
	}

	public List<RunningVo> thirdList(String movie_number, String movietheater_number) {
		// TODO Auto-generated method stub
		return BookManager.thirdList(movie_number, movietheater_number);
	}

	public List<RunningstartVo> fourthList(String movie_number, String movietheater_number, String running_date) {
		// TODO Auto-generated method stub
		return BookManager.fourthList(movie_number,movietheater_number,running_date);
	}

	public String fifthList(String running_start, String running_date, String mt_number) {
		// TODO Auto-generated method stub
		return BookManager.fifthList(running_start,running_date, mt_number);
	}

	
}
