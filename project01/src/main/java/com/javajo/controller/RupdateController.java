package com.javajo.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.MovieTheaterVo2;
import com.javajo.vo.RunningVo;

@Controller
@RequestMapping("/rupdate.com")
public class RupdateController {

	@Autowired
	private JavajoDao dao;

	private int re;
	private String msg;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mtupdate(int r_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("rdetail", dao.rdetail(r_number));
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mtupdateok(RunningVo rv,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		int re = dao.rupdate(rv);
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
