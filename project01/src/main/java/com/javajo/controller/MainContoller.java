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
	private String id;
	private int re;
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.com")
	public ModelAndView movietheaterlist()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("loginid", id);
		mav.addObject("signupnum", re);
		return mav;
	}

	@RequestMapping("/login.com")
	public ModelAndView login(CustomerVo cv)
	{
		ModelAndView mav = new ModelAndView();
		id = dao.loginok(cv);
		mav.setViewName("redirect:/main.com");
		return mav;
	}
	
	@RequestMapping("/signup.com")
	public ModelAndView signup(CustomerVo cv)
	{
		ModelAndView mav = new ModelAndView();
		if(cv.getCustomer_pw().length() >= 8)
		{
			re = dao.signup(cv);
		}
		else
		{
			re = 2;
		}
		mav.setViewName("redirect:/main.com");
		return mav;
	}
	
}
