package com.javajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;

@Controller
@RequestMapping("/cupdate.com")
public class CupdateController {

	@Autowired
	private JavajoDao dao;
	private String c_id;
	private int re;
	private String msg;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView cupdate(String c_id)
	{
		ModelAndView mav = new ModelAndView();
		if(c_id!=null && !c_id.equals(""))
		{			
			this.c_id=c_id;
			mav.addObject("cdetail", dao.cdetail(c_id));			
		}
		else
		{
			mav.addObject("cdetail", dao.cdetail(this.c_id));			
		}
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView cupdateok(CustomerVo cv, String c_email1, String c_email2,String c_pw2)
	{
		if(!c_email1.equals(c_email2))
		{
			cv.setC_echeck("no");
			cv.setC_email(c_email2);
		}
		else
		{
			cv.setC_email(c_email1);
		}
		ModelAndView mav = new ModelAndView("redirect:/masterpage.com");
		int re = 0;
		if(cv.getC_pw().equals(c_pw2) && cv.getC_pw().length()>=8)
		{			
			re = dao.cupdate(cv);
		}
		if(re != 1)
		{
			this.re=1;
			this.msg="정보를 확인하십시오.";
			mav.setViewName("redirect:/cupdate.com");
			
		}
		return mav;
	}
}
