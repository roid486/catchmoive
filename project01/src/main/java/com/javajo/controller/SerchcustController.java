package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;

@Controller
@RequestMapping("/serchcust.com")
public class SerchcustController {

	@Autowired
	private JavajoDao dao;
	
	public static String name;
	public static String tel;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView serchcust()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView serchcustok(String name, String tel)
	{
		ModelAndView mav = new ModelAndView();
		int re = dao.serchcust(name,tel);
		mav.addObject("mtlist", dao.mtlist());
		if(re==0)
		{
			this.name=name;
			this.tel=tel;
			mav.setViewName("redirect:/serchcustok.com");
		}
		else
		{
			mav.addObject("msg", "가입 되어있는 회원 입니다.");
		}
		return mav;
	}
}
