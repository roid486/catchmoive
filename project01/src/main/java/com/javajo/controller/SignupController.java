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
		mav.addObject("mtlist", dao.mtlist());
		mav.setViewName("redirect:/terms.com");
		return mav;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView signup(CustomerVo cv, String c_pw2)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		int re = 0;
		if(cv.getC_pw().length() >= 8 && cv.getC_pw().equals(c_pw2))
		{
			cv.setC_echeck("no");
			re = dao.signup(cv);			
		}
		if(re==1)
		{
			MainContoller.id2=null;
			mav.setViewName("redirect:/mail.com?email="+cv.getC_email());
		}
		else
		{	msg = "다시 확인 하십시오";
			mav.setViewName("redirect:/serchcustok.com");
		}
		return mav;
	}
}
