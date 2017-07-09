package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;

@Controller
@RequestMapping("/signup.com")
public class SignupController {

	@Autowired
	private JavajoDao dao;

	public static String msg;
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView signup()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/terms.com");
		return mav;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView signup(CustomerVo cv, String backmail)
	{
		ModelAndView mav = new ModelAndView();
		cv.setCustomer_email(cv.getCustomer_email()+backmail);
		int re = 0;
		if(cv.getCustomer_pw().length() >= 8)
		{
			re = dao.signup(cv);			
		}
		if(re==1)
		{
			mav.setViewName("redirect:/main.com");
		}
		else
		{	msg = "다시 확인 하십시오";
			mav.setViewName("redirect:/serchcustok.com");
		}
		return mav;
	}
}
