package com.jihye.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;

@Controller
@RequestMapping("/detailMovie.com")
public class DetailMovieController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getMovie(int m_number,HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.addObject("m",dao.getMovie(m_number));
		mav.addObject("ms",dao.listMovieScore());
		//session.setAttribute("m", dao.getMovie(m_number));
		
		return mav;
	}
	
	
	
	
}
