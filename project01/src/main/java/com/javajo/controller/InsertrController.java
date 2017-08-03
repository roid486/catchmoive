package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.RunningVo;

@Controller
@RequestMapping("/insertr.com")
public class InsertrController {

	@Autowired
	private JavajoDao dao;

	private int re;
	private String msg;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView insertr()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertrok(RunningVo rv)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		int re = dao.insertr(rv);
		if(re==1)
		{
			mav.setViewName("redirect:/rlist.com");
		}
		else
		{
			this.re=1;
			this.msg="입력 정보를 확인하십시오.";
			mav.setViewName("redirect:/insertr.com");
		}
		return mav;
	}
}
