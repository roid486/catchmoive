package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;

@Controller
public class JavajoController {

	@Autowired
	private JavajoDao dao;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.com")
	public ModelAndView test01()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		//System.out.println(dao.mtlist().get(1).getMovietheater_name());
		return mav;
	}
}
