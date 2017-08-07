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
	public static String email;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView serchcust()
	{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView serchcustok(String name, String front_email, String back_email)
	{
		ModelAndView mav = new ModelAndView();
		String email = front_email+back_email;
		int re = dao.serchcust(name,email);
		if(re==0)
		{
			this.name=name;
			this.email=email;
			mav.setViewName("redirect:/serchcustok.com");
		}
		else
		{
			mav.addObject("msg", "가입 되어있는 회원 입니다.");
		}
		return mav;
	}
}
