package com.jihye.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieVo_j;

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
		
		
		List<MovieVo_j> list = dao.listMovie(select);
		
		mav.addObject("l",list);
	
		return mav;
	}
	
	@RequestMapping("/pre-movie.com")
	@ResponseBody
	public ModelAndView preMovie(){
		
		ModelAndView mav = new ModelAndView();
		
		
		List<MovieVo_j> list = dao.preMovie();

		mav.setViewName("listPremovie");
		mav.addObject("l",list);
	
		return mav;
	}
	
	
	
	
	
	
}
