package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.MovieTheaterVo2;

@Controller
@RequestMapping("/insertmt.com")
public class InsertmtController {

	@Autowired
	private JavajoDao dao;
	private int re;
	private String msg;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView insertmt()
	{
		ModelAndView mav = new ModelAndView();
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertmtok(MovieTheaterVo2 mtv2)
	{
		ModelAndView mav = new ModelAndView();
		int re = dao.insertmt(mtv2);
		if(re==1)
		{
			mav.setViewName("redirect:/mtlist.com");
		}
		else
		{
			this.re=1;
			this.msg="입력 정보를 확인하십시오.";
			mav.setViewName("redirect:/insertmt.com");
		}
		return mav;
	}
}
