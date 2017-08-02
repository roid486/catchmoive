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
import com.javajo.vo.TheaterVo;

@Controller
@RequestMapping("/insertt.com")
public class InserttController {

	@Autowired
	private JavajoDao dao;

	private int re;
	private String msg;
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView insertt()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("mtl", dao.mtlist2());
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertmtok(TheaterVo tv)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		int re = dao.insertt(tv);
		int t_num = dao.t_num();
		int row = 65;
		int col = 1;
		for(int i=0;i<tv.getT_seat();i++)
		{
			if(i!=0)
			{
				if(i%5==0)
				{
					row++;
					col = 1;
				}
			}
			int re2 = dao.sinsert((char)row,col+"",t_num,tv.getMt_number());
			col++;
		}
		if(re==1)
		{
			mav.setViewName("redirect:/tlist.com");
		}
		else
		{
			this.re=1;
			this.msg="입력 정보를 확인하십시오.";
			mav.setViewName("redirect:/insertt.com");
		}
		return mav;
	}
}
