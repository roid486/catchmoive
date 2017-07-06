package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;

@Controller
public class MainContoller {

	@Autowired
	private JavajoDao dao;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.com")
	public ModelAndView movietheaterlist()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		//System.out.println(dao.mtlist().get(1).getMovietheater_name());
		return mav;
	}

	@RequestMapping("/login.com")
	public ModelAndView login(CustomerVo cv)
	{
		ModelAndView mav = new ModelAndView("redirect:/main.com");
		mav.addObject("loginid", dao.loginok(cv));
		//System.out.println(dao.mtlist().get(1).getMovietheater_name());
		return mav;
	}
	
}
