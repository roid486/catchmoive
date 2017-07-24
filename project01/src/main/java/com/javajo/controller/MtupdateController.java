
package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.MovieTheaterVo2;

@Controller
@RequestMapping("/mtupdate.com")
public class MtupdateController {

	@Autowired
	private JavajoDao dao;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mtupdate(int mt_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtdetail", dao.mtdetail(mt_number));
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mtupdateok(MovieTheaterVo2 mtv2)
	{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
