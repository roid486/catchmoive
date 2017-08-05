package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;

@Controller
@RequestMapping("/mycdelete.com")
public class Mycdeletecontroller {

	@Autowired
	private JavajoDao dao;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mycdelete(String c_id)
	{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mycdeleteok(String c_id,String c_pw)
	{
		ModelAndView mav = new ModelAndView();
		int e = dao.moviescoredelete(c_id);
		int d = dao.replydelete(c_id);
		int c = dao.historytdelete(c_id);
		int b = dao.boarddelete(c_id);
		int f = dao.seatupdate(c_id);
		int a = dao.ticketdelete(c_id);
		int re = dao.mycelete(c_id,c_pw);
		if(re==1)
		{
			MainContoller.id=null;
			mav.setViewName("redirect:/main.com");
		}
		else{
			mav.setViewName("redirect:/mycdelete.com?c_id="+c_id);
		}
		return mav;
	}
}
