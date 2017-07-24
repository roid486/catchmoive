package com.jihye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jihye.dao.MovieDao;

@Controller
public class ListMovieController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/listMovie.com")
	public ModelAndView listMovie(String select){
		ModelAndView mav = new ModelAndView();
		//System.out.println("in controller "+select);
		mav.addObject("l",dao.listMovie(select));
		return mav;
	}
	
	@RequestMapping("/detailMovie.com")
	public ModelAndView getMovie(int m_number){
		ModelAndView mav = new ModelAndView();
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}
	
	
}
