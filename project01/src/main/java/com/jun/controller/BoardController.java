package com.jun.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.BoardDao;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}



	@RequestMapping("/listBoard.com")
	public ModelAndView list()
	{
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("title", "°Ô½ÃÆÇ");
		mav.addObject("list", dao.list());
		
		return mav;
	}
	
	public ModelAndView getBoard(int b_number)
	{
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("b", dao.getBoard(b_number));
		
		return mav;
	}
}
