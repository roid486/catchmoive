package com.jihye.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	
	
}
