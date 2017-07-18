package com.javajo.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;

@Controller
public class MainContoller {

	@Autowired
	private JavajoDao dao;
	private String id;
	private String id2;
	private String msg;
	private int re;
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.com")
	public ModelAndView movietheaterlist()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("loginid", id);
		mav.addObject("signupnum", re);
		return mav;
	}

	@RequestMapping("/login.com")
	public ModelAndView login(CustomerVo cv)
	{
		ModelAndView mav = new ModelAndView();
		id = dao.loginok(cv);
		if(id == null)
		{
			re = 2;
		}
		mav.setViewName("redirect:/main.com");
		return mav;
	}
	
	@RequestMapping("/terms.com")
	public ModelAndView terms()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		return mav;
	}

	@RequestMapping("/serchcustok.com")
	public ModelAndView serchcustok()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("serchid", id2);
		mav.addObject("msg", msg);
		mav.addObject("name", SerchcustController.name);
		mav.addObject("tel", SerchcustController.tel);
		if(SignupController.msg!=null && !SignupController.msg.equals(""))
		{			
			mav.addObject("msg", SignupController.msg);
		}
		SignupController.msg=null;
		return mav;
	}

	@RequestMapping("/serchid.com")
	public ModelAndView serchid(String id)
	{
		ModelAndView mav = new ModelAndView("redirect:/serchcustok.com");
		int re = dao.serchid(id);
		if(re == 0)
		{
			this.id2 = id;
			msg = "사용 가능한 아이디 입니다.";
		}
		else
		{
			msg = "이미 존재하는 아이디 입니다.";
		}
		return mav;
	}
	
}
