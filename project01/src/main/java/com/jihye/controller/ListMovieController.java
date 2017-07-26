package com.jihye.controller;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView getMovie(int m_number,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		/*String str = (String)request.getAttribute("m_number");
		int m_num=0;
		if(m_number!=null){
			m_num = Integer.parseInt(str);
		}*/
		
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}
	
	
}
